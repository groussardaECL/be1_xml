<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


	<xsl:template match="/option">
	 <html>
	 	<link type="text/css" rel="stylesheet" href="option.css"></link>
		 <head>
			 <title>
				 Fiches de cours
			 </title>
		 </head>
	 	<body>
	 		<div class="en-tete"><h1>Fiches de cours</h1></div>
	 		<xsl:apply-templates></xsl:apply-templates>
	 	</body>
	 </html>
	</xsl:template>

<!-- Aspect général des fiches -->
	<xsl:template match="cours">
		<div class="fiches-cours">
		<h3><xsl:value-of select="@intitulé"></xsl:value-of></h3>
		<p class="cours-soustitre">Professeur :</p>
		<xsl:variable name="currentidprof"><xsl:value-of select="@prof"></xsl:value-of></xsl:variable>
		<xsl:apply-templates mode="coordprof" select="//personne[@id=$currentidprof]"></xsl:apply-templates>
		
		<p class="cours-soustitre">Elèves inscrits / notes :</p>
		<table>
			<tr>
				<th class="titre-table-cours">Nom</th>
				<th class="titre-table-cours">Prénom</th>
				<th class="titre-table-cours">Note</th>
				<th class="titre-table-cours">Absences</th>
				<th class="titre-table-cours">Appréciation</th>
			</tr>
	<xsl:apply-templates select="étudiant"></xsl:apply-templates>
		</table>
		<p><br></br></p>
	</div>
	</xsl:template>


<!-- Pour les étudiants inscrits au cours, lignes du tableau -->
	<xsl:template match="étudiant">
		<tr>
			<xsl:variable name="currentidetudiant"><xsl:value-of select="@id"></xsl:value-of></xsl:variable>
			<xsl:apply-templates mode="nometudiant" select="//personne[@id=$currentidetudiant]"></xsl:apply-templates>

			<td class="note"><xsl:value-of select="note"></xsl:value-of></td>
			<td class="absence"><xsl:value-of select="absences"></xsl:value-of></td>
			<td class="appreciation"><xsl:value-of select="comment"></xsl:value-of></td>
		</tr>
	</xsl:template>

<!-- Pour récupérer nom et prénom des étudiants qui se trouvent dans la branche personne, mode nometudiant -->
	<xsl:template match="personne" mode="nometudiant">
			<td class="nom"><xsl:value-of select="nom"></xsl:value-of></td>
			<td class="prenom"><xsl:value-of select="prénom"></xsl:value-of></td>
	</xsl:template>

<!-- Pour récupérer nom et prénom et email du professeur, branche personne -->
	<xsl:template match="personne" mode="coordprof">
			<div class="coordprof">
				<p><b><xsl:value-of select="nom"></xsl:value-of>
				<xsl:text> </xsl:text>
				<xsl:value-of select="prénom"></xsl:value-of></b><br></br>
				<xsl:text>email : </xsl:text>
				<xsl:value-of select="email"></xsl:value-of></p>
			</div>
	</xsl:template>


	<xsl:template match="personne">
 	</xsl:template>



</xsl:stylesheet>
