<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


	<xsl:template match="/option">
	 <html>
	 	<link type="text/css" rel="stylesheet" href="option.css"></link>
	 	<head>Fiches de notes</head>
	 	<body>
	 		<div class="en-tete">
	 		<h1>Fiches de notes élèves</h1>
	 		</div>
	 		<xsl:apply-templates></xsl:apply-templates>
	 	</body>
	 </html>
	</xsl:template>

	<xsl:template match="personne">
		<xsl:variable name="currentid" select= "//étudiant[@id=current()/@id]"></xsl:variable>
		<xsl:if test="$currentid">
			<div class="fiches-note">
				<h3>
					<xsl:value-of select="prénom"></xsl:value-of>
					<xsl:text> </xsl:text>
					<xsl:value-of select="nom"></xsl:value-of>
				</h3>
				<table class="table-note">
					<tr>
						<th class="titre-table-note">Cours</th>
						<th class="titre-table-note">Note</th>
						<th class="titre-table-note">Absences</th>
						<th class="titre-table-note">Appréciation</th>
					</tr>
					<xsl:for-each select="$currentid">
						<tr>
							<td class="intitule-cours"><xsl:value-of select="../@intitulé"></xsl:value-of></td>
							<td class="note"><xsl:value-of select="note"></xsl:value-of></td>
							<td class="absence"><xsl:value-of select="absences"></xsl:value-of></td>
							<td class="appreciation"><xsl:value-of select="comment"></xsl:value-of></td>
						</tr>
					</xsl:for-each>
				</table>
				<p><br></br></p>
			</div>
		</xsl:if>
	</xsl:template>

	 <xsl:template match="cours">
 	</xsl:template>



</xsl:stylesheet>
