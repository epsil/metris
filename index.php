<?php
$charset = "iso-8859-1";
$mime = "text/html";
$declaration = "<?xml version=\"1.0\" encoding=\"" . strtoupper($charset) . "\"?>\n";

$request = apache_request_headers();

$lang = "";

if(isset($request['Accept-Language'])) {
  if(isset($_GET['generer'])) {
    $knownlangs = array(
      "nb" => "nb",
      "no-bok" => "nb",
      "nn" => "nn",
      "no-nyn" => "nn"
    );
  }
  else {
    $knownlangs = array(
      "nb" => "",
      "no-bok" => "",
      "nn" => "nn",
      "no-nyn" => "nn"
    );
  }

  $accept = explode(",", eregi_replace("[[:space:]]+", "", $request['Accept-Language']));

  foreach($accept as $tag) {
    if(preg_match("/^([a-zA-Z]+(?:-[a-zA-Z]+)*)(?:;q=(0(?:\.[0-9]+)?|1(?:\.0+)?))?/", $tag, $matches)) {
      if(!isset($matches[2])) {
        $matches[2] = 1;
      }
      elseif((double)$matches[2] == 0.0) {
        $matches[2] = 0;

        if($knownlangs[$matches[1]]) {
          unset($knownlangs[$matches[1]]);
        }
      }
    $values[$matches[2]][] = $matches[1];
    }
  }

  if($values[0]) {
    unset($values[0]);
  }

  foreach($values as $q => $tags) {
    foreach($knownlangs as $test => $val) {
      if(in_array($test, $tags)) {
        $lang = $val;
        break 2;
      }
    }
  }
}

if(isset($_GET['generer'])) {
  $etag = (string)time();

  if($_POST['lang'] == "nb") {
    $lang = "nb";
  }
  elseif($_POST['lang'] == "nn") {
    $lang = "nn";
  }

  if($_POST['dungeon'] == "ja" OR $_GET['dungeon'] == "ja") {
    $utvalg['dungeon'] = "dikt.diktsamling_id = 1";
  }
  if($_POST['servant'] == "ja" OR $_GET['servant'] == "ja") {
    $utvalg['servant'] = "dikt.diktsamling_id = 2";
  }
  if($_POST['dagbok'] == "ja" OR $_GET['dagbok'] == "ja") {
    $utvalg['dagbok'] = "dikt.diktsamling_id = 3";
  }
  if(!isset($utvalg)) {
    $utvalg = array(
      "dungeon" => "dikt.diktsamling_id = 1",
      "servant" => "dikt.diktsamling_id = 2",
      "dagbok" => "dikt.diktsamling_id = 3"
    );
  }

  $get[] = "generer";
  if(count($utvalg) != 3) {
    if($utvalg['dungeon']) {
      $get[] = "dungeon=ja";
    }
    if($utvalg['servant']) {
      $get[] = "servant=ja";
    }
    if($utvalg['dagbok']) {
      $get[] = "dagbok=ja";
    }
  }
}
else {
  $etag = (string)getlastmod();
}

if($_GET['lang'] == "nn") {
  $lang = "nn";
}
elseif($_GET['lang'] == "nb") {
  $lang = "nb";
}

if($lang == "nn") {
  $etag .= $lang;
}

if(!empty($lang)) {
  $get[] = "lang=$lang";
}
else {
  $lang = "nb";
}

$notmodified = FALSE;

if(isset($request['If-Modified-Since'])) {
  $arraySince = explode(";", $request["If-Modified-Since"]);
  $since = strtotime($arraySince[0]);

  if($since >= (int)$etag) {
    $notmodified = TRUE;
  }
}

if(isset($request['If-None-Match'])) {
  if(in_array($etag, explode(";", eregi_replace("\"", "", eregi_replace("[[:space:]]+", "", $request['If-None-Match'])))) OR $request['If-None-Match'] == "*") {
    if($since == (int)$etag OR !$request['If-Modified-Since']) {
      $notmodified = TRUE;
    }
    else {
      $notmodified = FALSE;
    }
  }
  else {
    $notmodified = FALSE;
  }
}

if($notmodified) {
  header("HTTP/1.1 304 Not Modified");
  header("ETag: \"$etag\"");

  if(isset($_GET['generer'])) {
    header("Content-Location: http://subordinated.org/metris/?" . implode("&", $get));
    header("Expires: " . gmdate("D, d M Y H:i:s", time()) . " GMT");
    header("Cache-Control: private");
  }
  else {
    header("Content-Location: http://subordinated.org/metris/");
    header("Expires: " . gmdate("D, d M Y H:i:s", time() + 86400) . " GMT");
    header("Cache-Control: max-age=86400, must-revalidate");
  }

  exit();
}

function fix_code($buffer) {
  return (str_replace(" />", "/>", $buffer));
}

if(eregi('MSIE[ \/]([0-9\.]+)', $request['User-Agent'])) {
  if(!stristr($request['User-Agent'], 'Opera')) {
    $declaration = "";
  }
}

if(stristr($request['Accept'], "application/xhtml+xml")) {
  if(preg_match("/application\/xhtml\+xml;q=0(\.[1-9]+)/i", $request['Accept'], $matches)) {
    $xhtml_q = $matches[1];

    if(preg_match("/text\/html;q=0(\.[1-9]+)/i", $request['Accept'], $matches)) {
      $html_q = $matches[1];

      if($xhtml_q >= $html_q) {
        $mime = "application/xhtml+xml";
      }
    }
  }
  else {
    $mime = "application/xhtml+xml";
  }
}

ob_start();

print $declaration;
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xml:lang="no" xmlns="http://www.w3.org/1999/xhtml">
<head profile="http://dublincore.org/documents/dcq-html/">
<title>MetriSGENERATOR</title>
<?php
if (!isset($declaration)) {
  echo "<meta http-equiv=\"Content-Type\" content=\"$mime; charset=$charset\" />\n";
}
?>
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta name="description" content="Generer dine egne MetriS-dikt." />
<meta name="keywords" content="metris, dikt, generator, armagan ufuk unal" />
<link rel="schema.DC" href="http://purl.org/dc/elements/1.1/" />
<link rel="schema.DCTERMS" href="http://purl.org/dc/terms/" />
<meta name="DC.title" content="MetriSGENERATOR" />
<meta name="DC.subject" content="metris" />
<meta name="DC.subject" content="dikt" />
<meta name="DC.subject" content="generator" />
<meta name="DC.subject" content="armagan ufuk unal" />
<meta name="DC.description" content="Generer dine egne MetriS-dikt" />
<meta name="DC.publisher" content="Subordinated.org" />
<meta name="DC.contributor" content="Unal, Armagan Ufuk" />
<meta name="DCTERMS.issued" scheme="DCTERMS.W3CDTF" content="2004-04-15" />
<meta name="DCTERMS.modified" scheme="DCTERMS.W3CDTF" content="<?php echo date("Y-m-d", getlastmod()); ?>" />
<meta name="DC.type" scheme="DCTERMS.DCMIType" content="Service" />
<meta name="DC.format" scheme="DCTERMS.IMT" content="<?php echo $mime; ?>" />
<meta name="DC.identifier" scheme="DCTERMS.URI" content="http://subordinated.org/metris/<?php if(isset($_GET['generer'])) { echo "?" . implode("&amp;", $get); } ?>" />
<meta name="DC.source" content="Unal, Armagan Ufuk: The Dungeon of Metris" />
<meta name="DC.source" content="Unal, Armagan Ufuk: Servant of Darkness" />
<link rel="DC.source" href="http://blink.dagbladet.no/user/diary.html?user_id=68713" />
<meta name="DC.language" scheme="DCTERMS.RFC3066" content="no" />
<link rel="DC.relation" href="http://subordinated.org/" />
<link href="skjerm.css" media="screen" rel="stylesheet" type="text/css" />
<link href="utskrift.css" media="print" rel="stylesheet" type="text/css" />
<link href="handholdt.css" media="handheld" rel="stylesheet" type="text/css" />
</head>

<body>
<h1>MetriSGENERATOR</h1>

<p class="metrissitat"><span class="l"><span class="sitatstart">«</span><span class="linje">Jeg er ikke en dikter.</span></span> <span class="l">Jeg er bare &#8230; en liten tyrker.<span class="sitatslutt">»</span></span><span class="gjem"> &#8211; </span><cite>Armagan <abbr title="Ufuk">U.</abbr> Unal</cite></p>

<div class="innhold">
<p>MetriSGENERATOR er en gratistjeneste som lettvint lar deg generere tilfeldige dikt, med utgangspunkt i dyster poesi skrevet av «the Child of Metris» (Armagan Unal).</p>

<?php
srand((double)microtime() * 1000000);

if(isset($_GET['generer'])) {
  mysql_connect('localhost', 'subordin_metris', 'dikt')
    or die('Kunne ikke koble til diktdatabasen! Feilmelding: ' . mysql_error());
  mysql_select_db('subordin_metris')
    or die("Kunne ikke åpne diktdatabasen!");

  $genlang = "no";

  $mform = "linje";

  if($lang == "nn") {
    $mform = "nynorsk";
  }

  $dikt = mysql_query("SELECT vers.vers_id, vers.$mform, vers.type, vers.slutt, dikt.lang FROM vers, dikt WHERE vers.dikt_id = dikt.dikt_id AND dikt.lang = '". $genlang . "' AND (" . implode(" OR ", $utvalg) . ")")
    or die("Kunne ikke hente data fra diktdatabasen!");

  mysql_query("UPDATE counter SET count=count+1 WHERE name = 'generer'");

  while($vers = mysql_fetch_assoc($dikt)) {
    ${$vers['type']}[$vers['vers_id']] = $vers;
    $indeks[$vers['vers_id']] = $vers['type'];
  }

  function myarray_rand($array) {
    $num = mt_rand(0, count($array) - 1);
    return $num;
  }

  function rekursiv($array) {
    global $indeks, $H, $R, $M, $Q;
    $slutt = explode(",", ${$indeks[end($array)]}[end($array)]['slutt']);

    if(empty($slutt[0])) {
	  $slutt[0] = "H";
    }

    while($testn = $slutt[($rand = myarray_rand($slutt))]) {
      unset($slutt[$rand]);
      $slutt = array_values($slutt);

      if($testn == "H") {
        return $array;
      }

      elseif(ereg("[A-Z]", $testn)) {
        $utvalg = array_diff(array_keys(${$testn}), $array);

        while($id = $utvalg[($rand = myarray_rand($slutt))]) {
          unset($utvalg[$rand]);
          $utvalg = array_values($utvalg);

          array_push($array, $id);

          $resultat = rekursiv($array);

          if($resultat) {
            return $resultat;
          }

          array_pop($array);
        }
      }
      else {
        $utvalg = array_diff(array_keys($indeks), $array);

        array_push($array, $testn);

        if(in_array($testn, $utvalg)) {
          $resultat = rekursiv($array);

          if($resultat) {
            return $resultat;
          }
        }

        array_pop($array);
      }
    }

    return FALSE;
  }

  $dikt = array();

  for($i = 0; $i < 10; $i++) {
    if(empty($H)) {
      break;
    }

    $test = array_rand($H, 1);

    $resultat = rekursiv((array)$test);

    if($resultat) {
      foreach($resultat as $noekkel) {
        $dikt[] = ${$indeks[$noekkel]}[$noekkel][$mform];
        unset(${$indeks[$noekkel]}[$noekkel], $indeks[$noekkel]);
      }
    }
    else {
      unset($indeks[$test], $H[$test]);
      $i--;
    }

    if(count($dikt) >= 10) {
      break;
    }
  }

  echo "<blockquote";
  if($lang == "nn") {
    echo " xml:lang=\"nn\"";
  }
  echo ">";
  echo "\n<p>" . implode("<br />\n", $dikt) . "</p>\n";
  echo "</blockquote>\n\n";
}
?>
<div class="generer">
<h2>Generer ditt eget MetriS-dikt!</h2>

<form action="http://<?php echo $_SERVER['HTTP_HOST']; ?>/metris/?generer" method="post">
<fieldset>
<h3>Kilder</h3>

<span class="l"><label for="dungeon"><input accesskey="M"<?php if($utvalg['dungeon'] OR !isset($_GET['generer'])) { echo " checked=\"checked\""; } ?> id="dungeon" name="dungeon" type="checkbox" value="ja" /> <cite>The Dungeon of <span class="accesskey">M</span>etris</cite></label></span><br class="gjem" />
<span class="l"><label for="servant"><input accesskey="S"<?php if($utvalg['servant'] OR !isset($_GET['generer'])) { echo " checked=\"checked\""; } ?> id="servant" name="servant" type="checkbox" value="ja" /> <cite><span class="accesskey">S</span>ervant of Darkness</cite></label></span><br class="gjem" />
<span class="l"><label for="dagbok"><input accesskey="D"<?php if($utvalg['dagbok'] OR !isset($_GET['generer'])) { echo " checked=\"checked\""; } ?> id="dagbok" name="dagbok" type="checkbox" value="ja" /> «Blink-<span class="accesskey">d</span>agboka»</label></span>
</fieldset>

<fieldset>
<h3>Målform</h3>

<span class="l"><label for="nb"><input accesskey="B"<?php if($lang != "nn") { echo " checked=\"checked\""; } ?> id="nb" name="lang" type="radio" value="nb" /> <span class="accesskey">B</span>okmål</label></span><br class="gjem" />
<span class="l"><label for="nn"><input accesskey="N"<?php if($lang == "nn") { echo " checked=\"checked\""; } ?> id="nn" name="lang" type="radio" value="nn" /> <span class="accesskey">N</span>ynorsk!</label></span>
</fieldset>

<p><input accesskey="G" name="generer" title="Generer ditt eget MetriS-dikt!" type="submit" value="Generer!" /></p>
</form>
<?php
if(!isset($_GET['generer'])) {
  echo "</div>\n";
}
?>

<h2>Hva kan du bruke et MetriS-dikt til?</h2>

<p>MetriSGENERATOR lar deg generere tekst som kan komme godt med i mange sammenhenger. Her er et knippe forslag til hva du kan bruke et MetriS-dikt til:</p>

<ul>
<li><strong>Oppfriskning i hverdagen.</strong> Send et MetriS-dikt til en venn og drøft livets dype spørsmål over kaffebordet. Ingenting setter tankene i sving like effektivt som et MetriS-dikt.</li>
<li><strong>Omfattende diktanalyse.</strong> Et automatisk generert MetriS-dikt har ingen bestemt betydning, og kan dermed tolkes i det uendelige. Bruk fantasien!</li>
<li><strong>Utfyllingstekst.</strong> Har du behov for store mengder vilkårlig tekst, vil et repetert MetriS-dikt kunne gjøre nytten. Tapetser veggene dine med det siste innen programmatisk meningsløshet!</li>
</ul>

<p>Har du et annet forslag som du mener fortjener en plass på denne nettsiden, ikke nøl med å <a href="&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#109;&#101;&#116;&#114;&#105;&#115;&#64;&#115;&#117;&#98;&#111;&#114;&#100;&#105;&#110;&#97;&#116;&#101;&#100;&#46;&#111;&#114;&#103;" title="Tilbakemeldinger og tips blir alltid satt pris på">ta kontakt</a>.</p>
<?php
if(isset($_GET['generer'])) {
  echo "</div>\n";
}
?>

<h2>Om Armagan Unal</h2>

<p><img alt="" class="kantlinje venstre" height="150" src="portrett.jpeg" width="110" /> Armagan Ufuk Unal (<abbr title="født">f.</abbr> 1985) ble født i Sivas i Tyrkia. I 1996 flyttet han til Norge, og lærte seg språket flytende i et lynraskt tempo. På skolen utmerket han seg tidlig med sine ekstraordinære skriveevner og dypsindige dikt. Unal fortsatte med å utvikle sitt kreative talent, og i 2002 vant han en stor skrivekonkurranse i Drammen utlyst av foreningen !les. Diktene hans har siden oppnådd stor popularitet på Internett, hvor hans melankolske og makabre tanker om livet er ettertraktet lesestoff.</p>

<p>Unals diktning spenner fra infernalske og marerittaktige skildringer til melankolsk og lengselsfull kjærlighetspoesi. Temaer han tar opp er svik, kjærlighet, lengsel og skyldfølelse. Diktene hans er preget av sterke virkemidler, og ofte er de gjennomsyret av et nesten misantropisk menneskesyn. Striden mellom egoisme og nihilisme på den ene siden og søken og kjærlighetstro på den andre, er ofte det dominerende gjennomgangstemaet.</p>
</div>
<hr class="gjem" />

<p class="footer"><small><abbr title="Copyright" xml:lang="en">©</abbr> 2004 <a href="http://subordinated.org/">Subordinated.org</a>. Kontakt: <a href="&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#109;&#101;&#116;&#114;&#105;&#115;&#64;&#115;&#117;&#98;&#111;&#114;&#100;&#105;&#110;&#97;&#116;&#101;&#100;&#46;&#111;&#114;&#103;" title="Tilbakemeldinger og tips blir alltid satt pris på">&#109;&#101;&#116;&#114;&#105;&#115;&#64;&#115;&#117;&#98;&#111;&#114;&#100;&#105;&#110;&#97;&#116;&#101;&#100;&#46;&#111;&#114;&#103;</a></small></p>
</body>
</html>
<?php
if(ob_get_length()) {
  if($mime == "application/xhtml+xml") {
    $innhold = fix_code(ob_get_contents());
  }
  else {
    $innhold = ob_get_contents();
  }

  ob_end_clean();

  header("Last-Modified: " . gmdate("D, d M Y H:i:s", (int)$etag) . " GMT");

  if(isset($_GET['generer'])) {
    header("ETag: \"$etag\"");
    header("Expires: " . gmdate("D, d M Y H:i:s", time()) . " GMT");
    header("Cache-Control: private");
  }
  else {
    header("ETag: \"$etag\"");
    header("Expires: " . gmdate("D, d M Y H:i:s", time() + 86400) . " GMT");
    header("Cache-Control: max-age=86400, must-revalidate");
  }

  if(isset($get)) {
    header("Content-Location: http://subordinated.org/metris/?" . implode("&", $get));
  }
  else {
    header("Content-Location: http://subordinated.org/metris/");
  }

  if(stristr($request['Accept-Encoding'], 'gzip') AND !preg_match("/gzip;q=0(?:\.[0]+)?(?:,|$)/i", eregi_replace("[[:space:]]+", "", $request['Accept-Encoding']))) {
    $gzip_size = strlen($innhold);

    header('Content-Encoding: gzip');

    $innhold = "\x1f\x8b\x08\x00\x00\x00\x00\x00" . substr(gzcompress($innhold, 3), 0, -4)
    . pack('V', crc32($innhold))
    . pack('V', $gzip_size);
  }

  header("Accept-Range: bytes");
  header("Content-Length: " . strlen($innhold));
  header("Vary: Accept, Accept-Encoding, Accept-Language");
  header("Content-Type: $mime; charset=$charset");
  header("Content-Language: no");
  header("Content-MD5: " . md5($innhold));

  print $innhold;
}

exit();
?>