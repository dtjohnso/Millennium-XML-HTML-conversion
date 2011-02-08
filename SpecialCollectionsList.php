<?php
// Load the XML source
$xml = new DOMDocument;
$xml->load('SpecialCollectionsBibles.xml');

$xsl = new DOMDocument;
$xsl->load('Bibles.xsl');

// Configure the transformer
$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl); // attach the xsl rules

$newXML = $proc->transformToXML($xml);
echo $newXML;
?>