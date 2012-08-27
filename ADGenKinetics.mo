within ;
package ADGenKinetics
  "Implementation of generalized kinetics for modeling biochemical reaction networks"
  package UsersGuide "User Guide"
    extends Modelica.Icons.Information;
    model Overview
      extends Modelica.Icons.Information;
      annotation (Documentation(info="<html>
<p><img src=\"modelica://ADGenKinetics/icons/logo.jpg\"/></p>
<p><br/><h4><font color=\"#008000\">About</font></h4></p>
<p><br/><i>ADGenKinetics</i> contains an implementation of a specific set of reaction kinetics, namely, generalized simplified kinetic formats. It follows many of the guidelines recommended by the <a href=\"https://modelica.org/publications/papers/2005-05-LarsdotterNilsson-Fritzson-BioMedSim2005-MetabolicModeling.pdf\">Biochem library</a>. The underlying simplified kinetics formats are represented by generalized structured kinetics formulas suitable for arbitrary biochemical reactions with arbitrary number of substrates, products, inhibitors and activators. In this way, matabolic reaction networks can be easily assembled using a few number of reaction kinetics.</p>
<p><i>ADGenKinetics</i> is the first algorithmically differentiated Modelica library. Constructed models can also be used for computing parameter sensitivities with little modifications to the used interfaces and by initializing the input Jacobian, i.e. the parameters w.r.t. derivatives are sought. </p>
<p><br/><b><font style=\"color: #008000; \">Structure of the Library</font></b></p>
<p><br/>The following packages are available: </p>
<p><ul>
<li><i>Interfaces</i>: connectors and icons </li>
<li><i>NodeElements</i>: interfaces and components for nodes </li>
<li><i>Reactions</i>: interfaces and components for reactions </li>
<li><i>Derivatives</i>: for computing parameter sensitivities</li>
<li><i>Examples</i>: biochemical network models</li>
</ul></p>
<p>Further two subpackages within <i>NodeElements</i> and <i>Reactions</i> exist corresponding to two ways of declaration of connectors within components: </p>
<p><ul>
<li><i>dynamic</i>: dynamic parameterized number of connections </li>
<li><i>static</i>: static fixed number of connections </li>
</ul></p>
<p><br/>The main differences of both ways and their advantages and disadvantages are emphasized in this section along with the given examples. </p>
<p>Common interfaces and abstract classes are located above these packages. </p>
<p><h4><font color=\"#008000\">Connections</font></h4></p>
<p><br/>That is concentration of a substance is the potential variable while the flow rate of materials (i.e. the chemical transformation process) represents the flow variables when connecting nodes and reactions together, cf. <i><a href=\"GenKinetics.Interfaces.ChemicalPort\">ADGenKinetics.Interfaces.ChemicalPort</a></i>. Further subtypes of connectors exist: </p>
<p><ul>
<li><i><a href=\"
GenKinetics.Intefaces.ChemicalPort_S\">ADGenKinetics.Intefaces.ChemicalPort_S</a></i>: for reactions from the substrate side</li>
<li><i><a href=\"
GenKinetics.Interfaces.ChemicalPort_P\">ADGenKinetics.Interfaces.ChemicalPort_P</a></i>: for reactions from the product side</li>
<li><i><a href=\"
GenKinetics.Interfaces.ModifierChemicalPort\">ADGenKinetics.Interfaces.ModifierChemicalPort</a></i>: connecting reactions and effector nodes</li>
<li><i><a href=\"
GenKinetics.Interfaces.MModifierChemicalPort_I\">ADGenKinetics.Interfaces.ModifierChemicalPort_I</a></i>: for inhibiting reactions</li>
<li><i><a href=\"
GenKinetics.Interfaces.MModifierChemicalPort_A\">ADGenKinetics.Interfaces.MModifierChemicalPort_A</a></i>: for activating reactions<br/></li>
</ul></p>
<p><h4><font color=\"#008000\">Interfaces and abstract classes</font></h4></p>
<p><br/>Further interfaces and abstract classes are used within implemented reactions for simplifying their implementations and emphasizing their classification. The most important of which are: </p>
<p><i><a href=\"ADGenKinetics.Interfaces.Reversible.ReactionReversibility\">ADGenKinetics.Interfaces.Reversible.ReactionReversibility</a></i>: for determining the reversibility of reactions. The extended interfaces OneWay, TwoWay are used for irreversible, reversible reactions, respectively:</p>
<p><ul>
<li><i><a href=\"
GenKinetics.Interfaces.static.NodeConnections\">ADGenKinetics.Interfaces.static.NodeConnections</a></i>: fixed number of connections for nodes</li>
<li><i><a href=\"
GenKinetics.Interfaces.dynamic.NodeConnections\">ADGenKinetics.Interfaces.dynamic.NodeConnections</a></i>: parameterized number of connections for nodes.</li>
<li><i><a href=\"
GenKinetics.Interfaces.dynamic.Dimension.ReactionDimension\">ADGenKinetics.Interfaces.dynamic.Dimension.ReactionDimension</a></i>: parameterized number of connections for nodes. This interface can be used for specializing further classes of specific dimension, e.g. <i><a href=\"
GenKinetics.Interfaces.dynamic.Dimension.ReactionDimension\">ADGenKinetics.Interfaces.dynamic.Dimension.UniUni</a> .</i> </li>
<li><i><a href=\"
GenKinetics.Interfaces.static\">ADGenKinetics.Interfaces.static</a></i>.{<i><a href=\"GenKinetics.Interfaces.static.Reaction1S\">ReactionXS</a>, <a href=\"
GenKinetics.Interfaces.static.Reaction2P\">ReactionXP</a></i>, <i><a href=\"
GenKinetics.Interfaces.static.Reaction1I\">ReactionXI</a>,</i> <i><a href=\"Reaction1A\">ReactionXA</a></i>}: icons and connections for reactions with X number of connections.</li>
</ul></p>
<p><h4><font color=\"#008000\">Nodes</font></h4></p>
<p><br/>Typically, the component <i><a href=\"GenKinetics.NodeElements.dynamic.Node\">ADGenKinetics.NodeElements.dynamic.Node</a></i> or <i><a href=\"GenKinetics.NodeElements.static.Node\">ADGenKinetics.NodeElements.static.Node</a> </i>is the basic one needed for constructing biochemical reaction networks. Further types can be also imported from available implementation of the Biochem library. </p>
<p><h4><font color=\"#008000\">Reactions </font></h4></p>
<p><br/>Reaction kinetics are available in the packages<i><a href=\" ADGenKinetics.Reactions.convenience.\"> </a><a href=\" ADGenKinetics.Reactions.convenience\">ADGenKinetics.Reactions.convenience</a><a href=\" ADGenKinetics.Reactions.convenience.\">.</a>{<a href=\"ADGenKinetics.Reactions.convenience.dynamic\">dynamic</a></i>.<i><a href=\"ADGenKinetics.Reactions.convenience.static\">static</a></i>}. </p>
<p><br/>For instance,<i><a href=\" ADGenKinetics.Reactions.convenience.dynamic.IrrKinetic\"> ADGenKinetics.Reactions.convenience.dynamic.IrrKinetic</a></i> is used for irreversible reactions with arbitrary number of substrates and products, while <i><a href=\"ADGenKinetics.Reactions.convenience.dynamic.InhRevKinetic\">ADGenKinetics.Reactions.convenience.dynamic.InhRevKinetic</a></i> for reversible inhibited reactions with arbitrary number of substrates, products and inhibitors. </p>
<p><br/>Static packages provide reaction kinetics with fixed reaction structure. For instance <i><a href=\"ADGenKinetics.Reactions.convenience.static.IrrKinetic2S1P1I\">ADGenKinetics.Reactions.convenience.static.IrrKinetic2S1P1I</a></i>. </p>
<p><br/>Examples of constructing biochemical networks are given in <i><a href=\"GenKinetics.Examples.Spirallusdyn\">ADGenKinetics.Examples.Spirallusdyn</a> and <a href=\"GenKinetics.Examples.Spirallustatic\">ADGenKinetics.Examples.Spirallustatic</a>. </i></p>
<p><h4><font color=\"#008000\">Computation of parameter sensitivities</font></h4></p>
<p><br/>Given a biochemical reaction network model, the same model can be used for computing parameter sensitivities by additional slight modification in the declaration part: </p>
<p><ol>
<li>Importing <i><a href=\"
ADGenKinetics.Derivatives.NodeElements.*\">ADGenKinetics.Derivatives.NodeElements.*</a></i> and <i><a href=\"
ADGenKinetics.Derivatives.Reactions.convenience\">ADGenKinetics.Derivatives.Reactions.convenience.*</a></i> types for nodes and reaction kinetics.</li>
<li>Initializing the input Jacobian specifying active parameter with respect to which derivatives are sought. </li>
</ol></p>
<p>For instance compare the model given in <i><a href=\"GenKinetics.Examples.Spirallusdyn\">ADGenKinetics.Examples.Spirallusdyn</a> with <a href=\"GenKinetics.Derivatives.Examples.SpirallusdynAll \">ADGenKinetics.Derivatives.Examples.SpirallusdynAll </a></i></p>
</html>"));
    end Overview;

    model Contributors
      extends Modelica.Icons.Information;
      annotation (Documentation(info="<html>
<p>Author: Atiyah Elsheikh </p>
<p>Contact details: <i><a href=\"ADGenKinetics.UsersGuide.Contact\">ADGenKinetics.UsersGuide.Contact</a></i></p>
</html>"));
    end Contributors;

    model Contact
      extends Modelica.Icons.Contact;
      annotation (Documentation(info="<html>
<p>Atiyah Elsheikh </p>
<p>Austrian Institute of Technology GmbH</p>
<p>Giefinggasse 2</p>
<p>1210 Vienna</p>
<p>Austria</p>
<p>email: <a href=\"Atiyah.Elsheikh@ait.ac.at\">Atiyah.Elsheikh@ait.ac.at</a> / <a href=\"a.m.g.elsheikh@gmail.com\">a.m.g.elsheikh@gmail.com</a></p>
</html>"));
    end Contact;

  class ModelicaLicense2 "Modelica License 2"
    extends Modelica.Icons.Information;

    annotation (Documentation(info="<html>
<head>
	<title>The Modelica License 2</title>
<style type=\"text/css\">
*       { font-size: 10pt; font-family: Arial,sans-serif; }
code    { font-size:  9pt; font-family: Courier,monospace;}
h6      { font-size: 10pt; font-weight: bold; color: green; }
h5      { font-size: 11pt; font-weight: bold; color: green; }
h4      { font-size: 13pt; font-weight: bold; color: green; }
address {                  font-weight: normal}
td      { solid #000; vertical-align:top; }
th      { solid #000; vertical-align:top; font-weight: bold; }
table   { solid #000; border-collapse: collapse;}
</style>
</head>
<body lang=\"en-US\">

<p>All files in this directory (Modelica) and in all
subdirectories, especially all files that build package \"Modelica\" and all
files in \"Modelica/Resources/*\" and \"Modelica/help\" are licensed by the <b><u>Modelica Association</u></b> under the <b><u>Modelica License 2</u></b> (with exception of files
\"Modelica/Resources/C-Sources/win32_dirent.*\").</p>

<p style=\"margin-left: 40px;\"><b>Licensor:</b><br>
Modelica Association<br>
(Ideella F&ouml;reningar 822003-8858 in Link&ouml;ping) <br>
c/o PELAB, IDA, Link&ouml;pings Universitet <br>
S-58183 Link&ouml;ping <br>
Sweden<br>
email: Board@Modelica.org<br>
web: <a href=\"http://www.Modelica.org\">http://www.Modelica.org</a></p>

<p style=\"margin-left: 40px;\"><b>Copyright notices of the files:</b><br/>
Copyright &copy; 1998-2010,
ABB, Austrian Institue of Technology, T.&nbsp;B&ouml;drich, DLR, Dassault Syst&egrave;mes AB, Fraunhofer, A.&nbsp;Haumer, Modelon,
TU Hamburg-Harburg, Politecnico di Milano, XRG Simulation.
</p>

<p>
<a href=\"#The_Modelica_License_2-outline\">The Modelica License 2</a><br>
<a href=\"#Frequently_Asked_Questions-outline\">Frequently Asked Questions</a><br>
</p>

<hr>

<h4><a name=\"The_Modelica_License_2-outline\"></a>The Modelica License 2</h4>

<p>
<b>Preamble.</b> The goal of this license is that Modelica related
model libraries, software, images, documents, data files etc. can be
used freely in the original or a modified form, in open source and in
commercial environments (as long as the license conditions below are
fulfilled, in particular sections 2c) and 2d). The Original Work is
provided free of charge and the use is completely at your own risk.
Developers of free Modelica packages are encouraged to utilize this
license for their work.</p>

<p>
The Modelica License applies to any Original Work that contains the
following licensing notice adjacent to the copyright notice(s) for
this Original Work:</p>

<p><b>Licensed by the Modelica Association under the Modelica License 2</b></p>

<p><b>1. Definitions.</b></p>
<ol type=\"a\">
	<li>&ldquo;License&rdquo; is this Modelica License.</li>

	<li>&ldquo;Original Work&rdquo; is any work of authorship, including
	software, images, documents, data files, that contains the above
	licensing notice or that is packed together with a licensing notice
	referencing it.</li>

	<li>&ldquo;Licensor&rdquo; is the provider of the Original Work who has
	placed this licensing notice adjacent to the copyright notice(s) for
	the Original Work. The Original Work is either directly provided by
	the owner of the Original Work, or by a licensee of the owner.</li>

	<li>&ldquo;Derivative Work&rdquo; is any modification of the Original
	Work which represents, as a whole, an original work of authorship.
	For the matter of clarity and as examples:

	<ol  type=\"A\">
		<li>Derivative Work shall not include work that remains separable from
		the Original Work, as well as merely extracting a part of the
		Original Work without modifying it.</li>

		<li>Derivative Work shall not include (a) fixing of errors and/or (b)
		adding vendor specific Modelica annotations and/or (c) using a
		subset of the classes of a Modelica package, and/or (d) using a
		different representation, e.g., a binary representation.</li>

		<li>Derivative Work shall include classes that are copied from the
		Original Work where declarations, equations or the documentation
		are modified.</li>

		<li>Derivative Work shall include executables to simulate the models
		that are generated by a Modelica translator based on the Original
		Work (of a Modelica package).</li>
	</ol>

	<li>&ldquo;Modified Work&rdquo; is any modification of the Original Work
	with the following exceptions: (a) fixing of errors and/or (b)
	adding vendor specific Modelica annotations and/or (c) using a
	subset of the classes of a Modelica package, and/or (d) using a
	different representation, e.g., a binary representation.</li>

	<li>&quot;Source Code&quot; means the preferred form of the Original
	Work for making modifications to it and all available documentation
	describing how to modify the Original Work.</li>

	<li>&ldquo;You&rdquo; means an individual or a legal entity exercising
	rights under, and complying with all of the terms of, this License.</li>

	<li>&ldquo;Modelica package&rdquo; means any Modelica library that is
	defined with the &ldquo;<code><b>package</b>&nbsp;&lt;Name&gt;&nbsp;...&nbsp;<b>end</b>&nbsp;&lt;Name&gt;;</code>&rdquo; Modelica language element.</li>

</ol>

<p>
<b>2. Grant of Copyright License.</b> Licensor grants You a
worldwide, royalty-free, non-exclusive, sublicensable license, for
the duration of the copyright, to do the following:</p>

<ol type=\"a\">
	<li><p>
	To reproduce the Original Work in copies, either alone or as part of
	a collection.</p></li>
	<li><p>
	To create Derivative Works according to Section 1d) of this License.</p></li>
	<li><p>
	To distribute or communicate to the public copies of the <u>Original
	Work</u> or a <u>Derivative Work</u> under <u>this License</u>. No
	fee, neither as a copyright-license fee, nor as a selling fee for
	the copy as such may be charged under this License. Furthermore, a
	verbatim copy of this License must be included in any copy of the
	Original Work or a Derivative Work under this License.<br>
	For the matter of clarity, it is permitted A) to distribute or
	communicate such copies as part of a (possible commercial)
	collection where other parts are provided under different licenses
	and a license fee is charged for the other parts only and B) to
	charge for mere printing and shipping costs.</p></li>
	<li><p>
	To distribute or communicate to the public copies of a <u>Derivative
	Work</u>, alternatively to Section 2c), under <u>any other license</u>
	of your choice, especially also under a license for
	commercial/proprietary software, as long as You comply with Sections
	3, 4 and 8 below. <br>      For the matter of clarity, no
	restrictions regarding fees, either as to a copyright-license fee or
	as to a selling fee for the copy as such apply.</p></li>
	<li><p>
	To perform the Original Work publicly.</p></li>
	<li><p>
	To display the Original Work publicly.</p></li>
</ol>

<p>
<b>3. Acceptance.</b> Any use of the Original Work or a
Derivative Work, or any action according to either Section 2a) to 2f)
above constitutes Your acceptance of this License.</p>

<p>
<b>4. Designation of Derivative Works and of Modified Works.
</b>The identifying designation of Derivative Work and of Modified
Work must be different to the corresponding identifying designation
of the Original Work. This means especially that the (root-level)
name of a Modelica package under this license must be changed if the
package is modified (besides fixing of errors, adding vendor specific
Modelica annotations, using a subset of the classes of a Modelica
package, or using another representation, e.g. a binary
representation).</p>

<p>
<b>5. Grant of Patent License.</b>
Licensor grants You a worldwide, royalty-free, non-exclusive, sublicensable license,
under patent claims owned by the Licensor or licensed to the Licensor by
the owners of the Original Work that are embodied in the Original Work
as furnished by the Licensor, for the duration of the patents,
to make, use, sell, offer for sale, have made, and import the Original Work
and Derivative Works under the conditions as given in Section 2.
For the matter of clarity, the license regarding Derivative Works covers
patent claims to the extent as they are embodied in the Original Work only.</p>

<p>
<b>6. Provision of Source Code.</b> Licensor agrees to provide
You with a copy of the Source Code of the Original Work but reserves
the right to decide freely on the manner of how the Original Work is
provided.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For the matter of clarity, Licensor might provide only a binary
representation of the Original Work. In that case, You may (a) either
reproduce the Source Code from the binary representation if this is
possible (e.g., by performing a copy of an encrypted Modelica
package, if encryption allows the copy operation) or (b) request the
Source Code from the Licensor who will provide it to You.</p>

<p>
<b>7. Exclusions from License Grant.</b> Neither the names of
Licensor, nor the names of any contributors to the Original Work, nor
any of their trademarks or service marks, may be used to endorse or
promote products derived from this Original Work without express
prior permission of the Licensor. Except as otherwise expressly
stated in this License and in particular in Sections 2 and 5, nothing
in this License grants any license to Licensor&rsquo;s trademarks,
copyrights, patents, trade secrets or any other intellectual
property, and no patent license is granted to make, use, sell, offer
for sale, have made, or import embodiments of any patent claims.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No license is granted to the trademarks of
Licensor even if such trademarks are included in the Original Work,
except as expressly stated in this License. Nothing in this License
shall be interpreted to prohibit Licensor from licensing under terms
different from this License any Original Work that Licensor otherwise
would have a right to license.</p>

<p>
<b>8. Attribution Rights.</b> You must retain in the Source
Code of the Original Work and of any Derivative Works that You
create, all author, copyright, patent, or trademark notices, as well
as any descriptive text identified therein as an &quot;Attribution
Notice&quot;. The same applies to the licensing notice of this
License in the Original Work. For the matter of clarity, &ldquo;author
notice&rdquo; means the notice that identifies the original
author(s). <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You must cause the Source Code for any Derivative
Works that You create to carry a prominent Attribution Notice
reasonably calculated to inform recipients that You have modified the
Original Work. <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In case the Original Work or Derivative Work is not provided in
Source Code, the Attribution Notices shall be appropriately
displayed, e.g., in the documentation of the Derivative Work.</p>

<p><b>9. Disclaimer
of Warranty. <br></b><u><b>The Original Work is provided under this
License on an &quot;as is&quot; basis and without warranty, either
express or implied, including, without limitation, the warranties of
non-infringement, merchantability or fitness for a particular
purpose. The entire risk as to the quality of the Original Work is
with You.</b></u> This disclaimer of warranty constitutes an
essential part of this License. No license to the Original Work is
granted by this License except under this disclaimer.</p>

<p>
<b>10. Limitation of Liability.</b> Under no circumstances and
under no legal theory, whether in tort (including negligence),
contract, or otherwise, shall the Licensor, the owner or a licensee
of the Original Work be liable to anyone for any direct, indirect,
general, special, incidental, or consequential damages of any
character arising as a result of this License or the use of the
Original Work including, without limitation, damages for loss of
goodwill, work stoppage, computer failure or malfunction, or any and
all other commercial damages or losses. This limitation of liability
shall not apply to the extent applicable law prohibits such
limitation.</p>

<p>
<b>11. Termination.</b> This License conditions your rights to
undertake the activities listed in Section 2 and 5, including your
right to create Derivative Works based upon the Original Work, and
doing so without observing these terms and conditions is prohibited
by copyright law and international treaty. Nothing in this License is
intended to affect copyright exceptions and limitations. This License
shall terminate immediately and You may no longer exercise any of the
rights granted to You by this License upon your failure to observe
the conditions of this license.</p>

<p>
<b>12. Termination for Patent Action.</b> This License shall
terminate automatically and You may no longer exercise any of the
rights granted to You by this License as of the date You commence an
action, including a cross-claim or counterclaim, against Licensor,
any owners of the Original Work or any licensee alleging that the
Original Work infringes a patent. This termination provision shall
not apply for an action alleging patent infringement through
combinations of the Original Work under combination with other
software or hardware.</p>

<p>
<b>13. Jurisdiction.</b> Any action or suit relating to this
License may be brought only in the courts of a jurisdiction wherein
the Licensor resides and under the laws of that jurisdiction
excluding its conflict-of-law provisions. The application of the
United Nations Convention on Contracts for the International Sale of
Goods is expressly excluded. Any use of the Original Work outside the
scope of this License or after its termination shall be subject to
the requirements and penalties of copyright or patent law in the
appropriate jurisdiction. This section shall survive the termination
of this License.</p>

<p>
<b>14. Attorneys&rsquo; Fees.</b> In any action to enforce the
terms of this License or seeking damages relating thereto, the
prevailing party shall be entitled to recover its costs and expenses,
including, without limitation, reasonable attorneys' fees and costs
incurred in connection with such action, including any appeal of such
action. This section shall survive the termination of this License.</p>

<p>
<b>15. Miscellaneous.</b>
</p>
<ol type=\"a\">
	<li>If any
	provision of this License is held to be unenforceable, such
	provision shall be reformed only to the extent necessary to make it
	enforceable.</li>

	<li>No verbal
	ancillary agreements have been made. Changes and additions to this
	License must appear in writing to be valid. This also applies to
	changing the clause pertaining to written form.</li>

	<li>You may use the
	Original Work in all ways not otherwise restricted or conditioned by
	this License or by law, and Licensor promises not to interfere with
	or be responsible for such uses by You.</li>
</ol>

<hr>

<h5><a name=\"Frequently_Asked_Questions-outline\"></a>
Frequently Asked Questions</h5>
<p>This
section contains questions/answer to users and/or distributors of
Modelica packages and/or documents under Modelica License 2. Note,
the answers to the questions below are not a legal interpretation of
the Modelica License 2. In case of a conflict, the language of the
license shall prevail.</p>

<h6>Using or Distributing a Modelica <u>Package</u> under the Modelica License 2</h6>

<p><b>What are the main
differences to the previous version of the Modelica License?</b></p>
<ol>
	<li><p>
	Modelica License 1 is unclear whether the licensed Modelica package
	can be distributed under a different license. Version 2 explicitly
	allows that &ldquo;Derivative Work&rdquo; can be distributed under
	any license of Your choice, see examples in Section 1d) as to what
	qualifies as Derivative Work (so, version 2 is clearer).</p>
	<li><p>
	If You modify a Modelica package under Modelica License 2 (besides
	fixing of errors, adding vendor specific Modelica annotations, using
	a subset of the classes of a Modelica package, or using another
	representation, e.g., a binary representation), you must rename the
	root-level name of the package for your distribution. In version 1
	you could keep the name (so, version 2 is more restrictive). The
	reason of this restriction is to reduce the risk that Modelica
	packages are available that have identical names, but different
	functionality.</p>
	<li><p>
	Modelica License 1 states that &ldquo;It is not allowed to charge a
	fee for the original version or a modified version of the software,
	besides a reasonable fee for distribution and support&rdquo;.
	Version 2 has a similar intention for all Original Work under
	<u>Modelica License 2</u> (to remain free of charge and open source)
	but states this more clearly as &ldquo;No fee, neither as a
	copyright-license fee, nor as a selling fee for the copy as such may
	be charged&rdquo;. Contrary to version 1, Modelica License 2 has no
	restrictions on fees for Derivative Work that is provided under a
	different license (so, version 2 is clearer and has fewer
	restrictions).</p>
	<li><p>
	Modelica License 2 introduces several useful provisions for the
	licensee (articles 5, 6, 12), and for the licensor (articles 7, 12,
	13, 14) that have no counter part in version 1.</p>
	<li><p>
	Modelica License 2 can be applied to all type of work, including
	documents, images and data files, contrary to version 1 that was
	dedicated for software only (so, version 2 is more general).</p>
</ol>

<p><b>Can I distribute a
Modelica package (under Modelica License 2) as part of my commercial
Modelica modeling and simulation environment?</b></p>
<p>Yes,
according to Section 2c). However, you are not allowed to charge a
fee for this part of your environment. Of course, you can charge for
your part of the environment.
</p>

<p><b>Can I distribute a
Modelica package (under Modelica License 2) under a different
license?</b></p>
<p>No.
The license of an unmodified Modelica package cannot be changed
according to Sections 2c) and 2d). This means that you cannot <u>sell</u>
copies of it, any distribution has to be free of charge.</p>

<p><b>Can I distribute a
Modelica package (under Modelica License 2) under a different license
when I first encrypt the package?</b></p>
<p>No.
Merely encrypting a package does not qualify for Derivative Work and
therefore the encrypted package has to stay under Modelica License 2.</p>

<p><b>Can I distribute a
Modelica package (under Modelica License 2) under a different license
when I first add classes to the package?</b></p>
<p>No.
The package itself remains unmodified, i.e., it is Original Work, and
therefore the license for this part must remain under Modelica
License 2. The newly added classes can be, however, under a different
license.
</p>

<p><b>Can
I copy a class out of a Modelica package (under Modelica License 2)
and include it </b><u><b>unmodified</b></u><b> in a Modelica package
under a </b><u><b>commercial/proprietary license</b></u><b>?</b></p>
<p>No,
according to article 2c). However, you can include model, block,
function, package, record and connector classes in your Modelica
package under <u>Modelica License 2</u>. This means that your
Modelica package could be under a commercial/proprietary license, but
one or more classes of it are under Modelica License 2.<br>Note, a
&ldquo;type&rdquo; class (e.g., type Angle = Real(unit=&rdquo;rad&rdquo;))
can be copied and included unmodified under a commercial/proprietary
license (for details, see the next question).</p>

<p><b>Can
I copy a type class or </b><u><b>part</b></u><b> of a model, block,
function, record, connector class, out of a Modelica package (under
Modelica License 2) and include it modified or unmodified in a
Modelica package under a </b><u><b>commercial/proprietary</b></u><b>
license</b></p>
<p>Yes,
according to article 2d), since this will in the end usually qualify
as Derivative Work. The reasoning is the following: A type class or
part of another class (e.g., an equation, a declaration, part of a
class description) cannot be utilized &ldquo;by its own&rdquo;. In
order to make this &ldquo;usable&rdquo;, you have to add additional
code in order that the class can be utilized. This is therefore
usually Derivative Work and Derivative Work can be provided under a
different license. Note, this only holds, if the additional code
introduced is sufficient to qualify for Derivative Work. Merely, just
copying a class and changing, say, one character in the documentation
of this class would be no Derivative Work and therefore the copied
code would have to stay under Modelica License 2.</p>

<p><b>Can
I copy a class out of a Modelica package (under Modelica License 2)
and include it in </b><u><b>modified </b></u><b>form in a
</b><u><b>commercial/proprietary</b></u><b> Modelica package?</b></p>
<p>Yes.
If the modification can be seen as a &ldquo;Derivative Work&rdquo;,
you can place it under your commercial/proprietary license. If the
modification does not qualify as &ldquo;Derivative Work&rdquo; (e.g.,
bug fixes, vendor specific annotations), it must remain under
Modelica License 2. This means that your Modelica package could be
under a commercial/proprietary license, but one or more parts of it
are under Modelica License 2.</p>

<p><b>Can I distribute a
&ldquo;save total model&rdquo; under my commercial/proprietary
license, even if classes under Modelica License 2 are included?</b></p>
<p>Your
classes of the &ldquo;save total model&rdquo; can be distributed
under your commercial/proprietary license, but the classes under
Modelica License 2 must remain under Modelica License 2. This means
you can distribute a &ldquo;save total model&rdquo;, but some parts
might be under Modelica License 2.</p>

<p><b>Can I distribute a
Modelica package (under Modelica License 2) in encrypted form?</b></p>
<p>Yes.
Note, if the encryption does not allow &ldquo;copying&rdquo; of
classes (in to unencrypted Modelica source code), you have to send
the Modelica source code of this package to your customer, if he/she
wishes it, according to article&nbsp;6.</p>

<p><b>Can I distribute an
executable under my commercial/proprietary license, if the model from
which the executable is generated uses models from a Modelica package
under Modelica License 2?</b></p>
<p>Yes,
according to article 2d), since this is seen as Derivative Work. The
reasoning is the following: An executable allows the simulation of a
concrete model, whereas models from a Modelica package (without
pre-processing, translation, tool run-time library) are not able to
be simulated without tool support. By the processing of the tool and
by its run-time libraries, significant new functionality is added (a
model can be simulated whereas previously it could not be simulated)
and functionality available in the package is removed (e.g., to build
up a new model by dragging components of the package is no longer
possible with the executable).</p>

<p><b>Is my modification to
a Modelica package (under Modelica License 2) a Derivative Work?</b></p>
<p>It
is not possible to give a general answer to it. To be regarded as &quot;an
original work of authorship&quot;, a derivative work must be
different enough from the original or must contain a substantial
amount of new material. Making minor changes or additions of little
substance to a preexisting work will not qualify the work as a new
version for such purposes.
</p>

<h6>Using or Distributing a Modelica <u>Document</u> under the Modelica License 2</h6>

<p>This
section is devoted especially for the following applications:</p>
<ol type=\"a\">
	<li><p>
	A Modelica tool extracts information out of a Modelica package and
	presents the result in form of a &ldquo;manual&rdquo; for this
	package in, e.g., html, doc, or pdf format.</p>
	<li><p>
	The Modelica language specification is a document defining the
	Modelica language. It will be licensed under Modelica License 2.</p>
	<li><p>
	Someone writes a book about the Modelica language and/or Modelica
	packages and uses information which is available in the Modelica
	language specification and/or the corresponding Modelica package.</p>
</ol>

<p><b>Can I sell a manual
that was basically derived by extracting information automatically
from a Modelica package under Modelica License 2 (e.g., a &ldquo;reference
guide&rdquo; of the Modelica Standard Library):</b></p>
<p>Yes.
Extracting information from a Modelica package, and providing it in a
human readable, suitable format, like html, doc or pdf format, where
the content is significantly modified (e.g. tables with interface
information are constructed from the declarations of the public
variables) qualifies as Derivative Work and there are no restrictions
to charge a fee for Derivative Work under alternative 2d).</p>

<p><b>Can
I copy a text passage out of a Modelica document (under Modelica
License 2) and use it </b><u><b>unmodified</b></u><b> in my document
(e.g. the Modelica syntax description in the Modelica Specification)?</b></p>
<p>Yes.
In case you distribute your document, the copied parts are still
under Modelica License 2 and you are not allowed to charge a license
fee for this part. You can, of course, charge a fee for the rest of
your document.</p>

<p><b>Can
I copy a text passage out of a Modelica document (under Modelica
License 2) and use it in </b><u><b>modified</b></u><b> form in my
document?</b></p>
<p>Yes,
the creation of Derivative Works is allowed. In case the content is
significantly modified this qualifies as Derivative Work and there
are no restrictions to charge a fee for Derivative Work under
alternative 2d).</p>

<p><b>Can I sell a printed
version of a Modelica document (under Modelica License 2), e.g., the
Modelica Language Specification?</b></p>
<p>No,
if you are not the copyright-holder, since article 2c) does not allow
a selling fee for a (in this case physical) copy. However, mere
printing and shipping costs may be recovered.</p>
</body>
</html>"));
  end ModelicaLicense2;

    model ReleaseNotes
      extends Modelica.Icons.Information;
      annotation (Documentation(info="<html>
<p><b><font style=\"color: #008000; \">R23 </font></b>27th August 2012 </p>
<p>first published release of the library with Basic phyiscial units, basic components for nodes and reactions both with parameterized and static number of connections. Examples and algorithmically differentiated components available. </p>
</html>"));
    end ReleaseNotes;
  end UsersGuide;

  package Units "Physical units"
   type Concentration = Real (unit = "mol/m3");
   type MolarFlowRate = Real (unit = "mol/s");
   type ReactionCoef = Real (unit = "1/s");
   type StoichiometricCoef = Real (unit = "1");
   type ReactionCoef1st = Units.ReactionCoef;
   type ReactionCoef2nd = Real (unit = "m3/(mol.s)");
   type VolumetricReactionRate = Real (unit = "mol/(m3.s)");
   type AffinityConst = Real (unit = "mol/m3");
    annotation (Documentation(info="<html>
<p>This subpackage contains basic physical units describing main entitites of a biochemical reaction network model. </p>
<p><br/>Licensed under the Modelica License 2</p><p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
  end Units;

  package Interfaces "Typical interfaces"
    connector ChemicalPort
      "reaction connector from a node to a reaction, declared within the node side"
      Units.Concentration c "concentration";
      flow Units.VolumetricReactionRate r "reaction rate";

      annotation (Icon(graphics={Bitmap(extent={{-75,75},{75,-75}}, fileName=
                  "modelica://GenKinetics/icons/reactionconnection.gif")}),
          Diagram(graphics));
    end ChemicalPort;

    connector ModifierChemicalPort
      "connector that connects a node to a reaction. The node is supposed to effects (activate or inhibit) the reaction"
      Units.Concentration c "concentration";
      annotation (Icon(graphics={Bitmap(extent={{-80,84},{100,-98}}, fileName=
                  "modelica://GenKinetics/icons/modifierconnection.gif")}));
    end ModifierChemicalPort;

    connector ChemicalPort_S
      "connector from a reactant substrate node to a reaction, declared within the reaction side"
      extends ADGenKinetics.Interfaces.ChemicalPort;

      annotation (Icon(graphics={Bitmap(extent={{-80,80},{82,-82}}, fileName=
                  "modelica://GenKinetics/icons/reactionconnection_S.gif")}),
          Diagram(graphics));
    end ChemicalPort_S;

    connector ChemicalPort_P
      "connector from a reactant substrate node to a reaction, declared within the reaction side"
      extends ADGenKinetics.Interfaces.ChemicalPort;

      annotation (Icon(graphics={Bitmap(extent={{-88,106},{94,-104}}, fileName=
                  "modelica://GenKinetics/icons/reactionconnection_P2.gif")}));
    end ChemicalPort_P;

    connector ModifierChemicalPort_I
      "connection from a reaction to an inhibition node"
      extends ADGenKinetics.Interfaces.ModifierChemicalPort;

      annotation (Icon(
          coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}),
          graphics={Bitmap(extent={{-80,80},{84,-80}}, fileName=
                  "modelica://GenKinetics/icons/modifierconnection_I2.gif")}));
    end ModifierChemicalPort_I;

    connector ModifierChemicalPort_A
      "connection from a reaction to an activation node"
      extends ADGenKinetics.Interfaces.ModifierChemicalPort;

      annotation (Icon(                     graphics={Bitmap(extent={{-96,100},
                  {124,-120}}, fileName=
                  "modelica://GenKinetics/icons/modifierconnection_A2.gif")}));
    end ModifierChemicalPort_A;

    package Reversible "Interfaces describing reversibility of a reaction"
      partial model ReactionReversibility
        "Base Type for describing Reversability of a reaction"
         parameter Units.ReactionCoef Vfwdmax=1 "maximal forward reaction rate";
      end ReactionReversibility;

      class OneWay "Irreversible Reaction"
        extends ReactionReversibility;

        annotation (Icon(graphics={Bitmap(extent={{-78,80},{86,-80}}, fileName=
                    "modelica://GenKinetics/icons/OneWay.gif")}));
      end OneWay;

      class TwoWay "Reversible Reaction"
        extends ReactionReversibility;
        parameter Units.ReactionCoef Vbwdmax=1 "backward maximal reaction rate";

        annotation (Icon(graphics={Bitmap(extent={{-110,100},{90,-100}},
                  fileName="modelica://GenKinetics/icons/TwoWay.gif")}));
      end TwoWay;
      annotation (Documentation(info="<html>
<p>This subpackage contains basic interfaces describing the reversibility of a reaction</p>
<p><br/>Licensed under the Modelica License 2</p><p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
    end Reversible;

    package static
      "Interfaces for components consisting of a fixed number of connections"
      partial model NodeConnections "Metabolite connections to reactions"

        ADGenKinetics.Interfaces.ChemicalPort rc1
                               annotation (extent=[-60,80; -40,100], Placement(
              transformation(extent={{-84,54},{-14,124}}),iconTransformation(extent={{-86,48},
                  {10,148}})));
        ADGenKinetics.Interfaces.ChemicalPort rc2
                               annotation (extent=[-60,80; -40,100], Placement(
              transformation(extent={{-84,54},{-14,124}}),iconTransformation(extent={{-8,48},
                  {88,148}})));
        ADGenKinetics.Interfaces.ChemicalPort rc3
                               annotation (extent=[-60,80; -40,100], Placement(
              transformation(extent={{-84,54},{-14,124}}),iconTransformation(extent={{52,-12},
                  {148,88}})));
        ADGenKinetics.Interfaces.ChemicalPort rc4
                               annotation (extent=[-60,80; -40,100], Placement(
              transformation(extent={{-84,54},{-14,124}}),iconTransformation(extent={{52,-90},
                  {148,10}})));
        ADGenKinetics.Interfaces.ChemicalPort rc5
                               annotation (extent=[-60,80; -40,100], Placement(
              transformation(extent={{-84,54},{-14,124}}),iconTransformation(extent={{-8,-150},
                  {88,-50}})));
        ADGenKinetics.Interfaces.ChemicalPort rc6
                               annotation (extent=[-60,80; -40,100], Placement(
              transformation(extent={{-84,54},{-14,124}}),iconTransformation(extent={{-86,
                  -150},{10,-50}})));
        ADGenKinetics.Interfaces.ChemicalPort rc7
                               annotation (extent=[-60,80; -40,100], Placement(
              transformation(extent={{-84,54},{-14,124}}),iconTransformation(extent={{-146,
                  -90},{-50,10}})));
        ADGenKinetics.Interfaces.ChemicalPort rc8
                               annotation (extent=[-60,80; -40,100], Placement(
              transformation(extent={{-84,54},{-14,124}}),iconTransformation(extent={{-146,
                  -12},{-50,88}})));
        ADGenKinetics.Interfaces.ModifierChemicalPort mc1
                               annotation (Placement(transformation(extent={{-30,
                  44},{30,104}}), iconTransformation(extent={{-128,68},{-68,128}})));
        ADGenKinetics.Interfaces.ModifierChemicalPort mc2
                               annotation (Placement(transformation(extent={{-30,
                  44},{30,104}}), iconTransformation(extent={{72,68},{132,128}})));
        ADGenKinetics.Interfaces.ModifierChemicalPort mc3
                               annotation (Placement(transformation(extent={{-30,
                  44},{30,104}}), iconTransformation(extent={{70,-130},{130,-70}})));
        ADGenKinetics.Interfaces.ModifierChemicalPort mc4
                               annotation (Placement(transformation(extent={{-30,
                  44},{30,104}}), iconTransformation(extent={{-130,-130},{-70,
                  -70}})));
        annotation (Line(
            points={{-43,73},{-43,90.5},{-43,90.5},{-43,73}},
            color={0,0,255},
            smooth=Smooth.None),
                    Diagram(graphics),
                             Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={0,0,255})}));
      end NodeConnections;

      model Reaction "icon for a reaction"

        annotation (Icon(graphics={                   Bitmap(extent={{-106,110},
                    {134,-130}},
                  fileName="modelica://GenKinetics/icons/reaction.gif")}));
      end Reaction;

      partial model Reaction1S
        "basic declaration of a reaction with one substrate"

        ADGenKinetics.Interfaces.ChemicalPort_S rc_S1
                                              annotation (Placement(transformation(
                extent={{-36,50},{-16,70}}), iconTransformation(extent={{-60,72},{-20,
                  112}})));

        annotation (Diagram(graphics), Icon(graphics={                   Rectangle(
                  extent={{-100,100},{98,-100}}, lineColor={0,0,255})}));
      end Reaction1S;

      partial model Reaction2S
        "basic declaration of a reaction with two substrates"
        extends Interfaces.static.Reaction1S;

        ADGenKinetics.Interfaces.ChemicalPort_S rc_S2
                                              annotation (Placement(transformation(
                extent={{-36,50},{-16,70}}), iconTransformation(extent={{20,72},{60,112}})));

        annotation (Diagram(graphics), Icon(graphics={                   Rectangle(
                  extent={{-100,100},{98,-100}}, lineColor={0,0,255})}));
      end Reaction2S;

      partial model Reaction1P
        "basic declaration of a reaction with one product"

        ADGenKinetics.Interfaces.ChemicalPort_P rc_P1
                                              annotation (Placement(transformation(
                extent={{-50,6},{-10,46}}), iconTransformation(extent={{-58,-112},{-18,
                  -72}})));
      equation

        annotation (Diagram(graphics), Icon(graphics={                   Rectangle(
                  extent={{-100,100},{98,-100}}, lineColor={0,0,255})}));
      end Reaction1P;

      partial model Reaction2P
        "basic declaration of a reaction with two products"
        extends Interfaces.static.Reaction1P;

        ADGenKinetics.Interfaces.ChemicalPort_P rc_P2
                                              annotation (Placement(transformation(
                extent={{-50,6},{-10,46}}), iconTransformation(extent={{22,-112},{62,-72}})));

        annotation (Diagram(graphics), Icon(graphics={                   Rectangle(
                  extent={{-100,100},{98,-100}}, lineColor={0,0,255})}));
      end Reaction2P;

      partial model Reaction1A "interface for activating a reaction"

      public
        ADGenKinetics.Interfaces.ModifierChemicalPort_A mc_A1
                                              annotation (Placement(transformation(
                extent={{-40,80},{0,120}}), iconTransformation(extent={{-120,-18},{-80,
                  22}})));

        annotation (Icon(graphics));
      end Reaction1A;

      partial model Reaction1I "interface for inhibiting a reaction"

        ADGenKinetics.Interfaces.ModifierChemicalPort_I mc_I1
                                              annotation (Placement(transformation(
                extent={{-108,-12},{-88,8}}), iconTransformation(extent={{76,-20},{116,
                  20}})));

        annotation (Icon(graphics));
      end Reaction1I;
      annotation (Documentation(info="<html>
<p>This subpackage contains basic icons for nodes and reactions. The nodes and the reactions are declared with a &QUOT;static&QUOT; fixed number of connectors.  </p>
<p><br/>Licensed under the Modelica License 2</p><p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
    end static;

    package dynamic
      "Interfaces with parameterized number of connections for textual implementation and automatic model generation"
      package Dimension "Reaction Dimension and Molecularity"
        class ReactionDimension "Dimension and structure of a reaction"

          parameter Integer NS = 1 "number of substrates";
          parameter Units.StoichiometricCoef n_S[NS]=ones(NS)
            "stoichiometry of all subtrates";

          parameter Integer NP = 1 "number of products";
          parameter Units.StoichiometricCoef n_P[NP]=ones(NP)
            "stoichiometry of all products";

        end ReactionDimension;

        class UniUni "S => P"
              extends ReactionDimension(
                    redeclare final parameter Integer NS = 1,
                    redeclare final parameter Integer NP = 1);
        end UniUni;

        annotation (Documentation(info="<html>
<p>This subpackage contains basic interface for specifying the dimension of the reaction, see <a href=\"GenKinetics.Interfaces.dynamic.Dimension.ReactionDimension\">GenKinetics.Interfaces.dynamic.Dimension.ReactionDimension</a> . Out of this interface, specialized reaction types can be created as a syntactic sugar, e.g. <a href=\"GenKinetics.Interfaces.dynamic.Dimension.UniUni\">GenKinetics.Interfaces.dynamic.Dimension.UniUni</a> . </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
<p><h4>Package Content</h4></p>
</html>"));
      end Dimension;

      package Structure "Reaction Structure reversibility and dimension"
        class ReactionStructure
          "The structure of a reaction reversibility, molecularity and order"
          replaceable class Reversibility =
            Reversible.ReactionReversibility constrainedby
            Reversible.ReactionReversibility;
              extends Reversibility;

          replaceable class Dimensionality =
              ADGenKinetics.Interfaces.dynamic.Dimension.ReactionDimension
            constrainedby
            ADGenKinetics.Interfaces.dynamic.Dimension.ReactionDimension;
                extends Dimensionality;
        end ReactionStructure;

        class StrUniUni "Structure Uni Uni "
          extends ReactionStructure(redeclare final class Dimensionality =
                Dimension.UniUni);
        end StrUniUni;

        class StrOneWay "Structure Uni Uni "
          extends ReactionStructure(redeclare final class Reversibility =
                Reversible.OneWay);
        end StrOneWay;
        annotation (Documentation(info="<html>
<p>This subpackage contains basic interface for specifying the structure of a reaction, i.e. its dimension and reversibility see <a href=\"GenKinetics.Interfaces.dynamic.Dimension.ReactionStructure\">GenKinetics.Interfaces.dynamic.Dimension.ReactionStructure</a> . Out of this interface, specialized reaction types can be created as a syntactic sugar, e.g. <a href=\"GenKinetics.Interfaces.dynamic.Dimension.StrOneWay\">GenKinetics.Interfaces.dynamic.Dimension.StrOneWay</a> . </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
      end Structure;

      partial model NodeConnections
        "Metabolite connections to reactions wuth one connector only"

        ADGenKinetics.Interfaces.ChemicalPort rc "connection to any reaction "
                                                            annotation (
            Placement(transformation(extent={{-50,-50},{50,50}}),
              iconTransformation(extent={{-114,-40},{122,154}})));
        ADGenKinetics.Interfaces.ModifierChemicalPort mc
          "connection to a modifier"                     annotation (Placement(
              transformation(extent={{-50,-50},{50,-50}}), iconTransformation(
                extent={{-64,-122},{72,2}})));
        annotation (Icon(graphics));
      end NodeConnections;
      annotation (Documentation(info="<html>
<p>This subpackage contains basic interfaces for nodes and reactions. The nodes and the reactions are declared with a &QUOT;dynamic&QUOT; parameterized number of connectors. </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
<p><b><font style=\"font-size: 19pt; \">Package Content</b></p>
</html>"));
    end dynamic;

    annotation (Documentation(info="<html>
<p>This subpackage contains all interfaces, abstract models, connectors etc. utilized by the components of the library. </p>
<p><br/>Licensed under the Modelica License 2</p><p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>", revisions="<html>
</html>"));
  end Interfaces;

  package NodeElements "Metabolites"

    package dynamic "Nodes with parameterized interfaces and connections"
      partial model BasicNode "Basic declarations of any Metabolite"
        extends ADGenKinetics.Interfaces.dynamic.NodeConnections;

        parameter Units.Concentration c_0=0 "initial concentration";
        Units.Concentration c(start=c_0) "substance concentration";
        Units.VolumetricReactionRate r_net "net reaction rate";

      equation
        r_net = rc.r;
        rc.c  = c;
        mc.c = c;

      end BasicNode;

      partial model BasicModifierNode
        "Deprecated: Basic declarations of any Metabolite, which effects at least one reaction"
        extends BasicNode;

      end BasicModifierNode;

      model Node "Metabolite with dynamic rate"
        extends ADGenKinetics.NodeElements.dynamic.BasicNode;

        //parameter Units.Concentration tolerance=1e-6;

      equation
        //der(c) = if(c < tolerance) then 0 else r_net;
        der(c) = r_net;
      end Node;

      model ModifierNode
        "Deprecated: Metabolite with dynamic rate, that effects at least one reaction"
        extends ADGenKinetics.NodeElements.dynamic.BasicModifierNode;

        //parameter Units.Concentration tolerance=1e-6;

      equation
        //der(c) = if (c < tolerance) then 0 else r_net;
        der(c) = r_net;

      end ModifierNode;

      model FixedConcentrationNode "Metabolite with fixed concentration"
        extends ADGenKinetics.NodeElements.dynamic.BasicNode;
        parameter Units.Concentration c_fixed=1.0;

      equation
        c = c_fixed;

      end FixedConcentrationNode;
      annotation (Documentation(info="<html>
<p>This subpackage contains implmentation for nodes, chemical substances, which can be connected to arbitrary number of reactions. Typically the component <a href=\"GenKinetics.NodeElements.dynamic.Node\">GenKinetics.NodeElements.dynamic.Node</a> is the one which will be used at most. The component <a href=\"GenKinetics.NodeElements.dynamic.ModifierNode\">GenKinetics.NodeElements.dynamic.ModifierNode</a> is exactly the same and does not really provide additional functionalities (it is here only for backword compatibility reasons with older versions of this implementation). This component will mostly get removed in later versions. </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
    end dynamic;

    package static "Node elements with a static number of interfaces and icons"
      partial model BasicNode "Basic declarations of any Metabolite"
        extends ADGenKinetics.Interfaces.static.NodeConnections;

        parameter ADGenKinetics.Units.Concentration c_0=0
          "initial reaction rate";
        ADGenKinetics.Units.Concentration c(start=c_0) "dynamic concentration";
        ADGenKinetics.Units.VolumetricReactionRate r_net "net reaction rate";

      equation
        r_net = rc1.r + rc2.r + rc3.r + rc4.r + rc5.r + rc6.r + rc7.r + rc8.r;
        rc1.c = c;
                   rc2.c = c;
                              rc3.c = c;
                                         rc4.c = c;
                                                    rc5.c = c;
                                                               rc6.c = c;
                                                                          rc7.c = c;
                                                                                     rc8.c = c;
        mc1.c = c;
                   mc2.c = c;
                              mc3.c = c;
                                         mc4.c = c;

                                          annotation (Line(
            points={{50,90},{50,90}},
            color={0,0,255},
            smooth=Smooth.None),
                    Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={0,0,255})}), Diagram(graphics));
      end BasicNode;

      partial model BasicModifierNode
        "Deprecated: Basic declarations of any Metabolite / exactly like BasicNode for declaration symmetry reasons"
        extends BasicNode;

      end BasicModifierNode;

      model Node "Metabolite with dynamic rate"
        extends static.BasicNode;
      equation
        der(c) = r_net;
      end Node;

      model ModifierNode "Metabolite with dynamic rate"
        extends static.Node;

      end ModifierNode;

      model FixedConcentrationNode "Metabolite with fixed concentration"
        extends static.BasicNode;
        parameter ADGenKinetics.Units.Concentration c_fixed=1.0;

      equation
        c = c_fixed;

      end FixedConcentrationNode;
      annotation (Documentation(info="<html>
<p>This subpackage contains implmentation for nodes, chemical substances, which provides a fixed number of connections to reactions. Typically the component <a href=\"GenKinetics.NodeElements.static.Node\">GenKinetics.NodeElements.static.Node</a> is the one which will be used at most. The component <a href=\"GenKinetics.NodeElements.static.ModifierNode\">GenKinetics.NodeElements.static.ModifierNode</a> is exactly the same and does not really provide additional functionalities (it is here only for backword compatibility reasons with older versions of this implementation). This component will mostly get removed in later versions. </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
    end static;
    annotation (Documentation(info="<html>
<p>This subpackage contains components for chemical substances. Additional substances are also provided in other implementations of the Biochem library.</p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
  end NodeElements;

  package Reactions "Reaction kinetics"

    package convenience "Implementation of convenience kinetics"
      package dynamic
        "Reactions with parameterized number of connections suitable for model generation and textual implementation"
        partial model BasicReaction "basic declaration of a reaction "
          extends Interfaces.dynamic.Dimension.ReactionDimension;

          // Reaction Rate
          Units.VolumetricReactionRate v;

          // Connections to Substrates and Products
          ADGenKinetics.Interfaces.ChemicalPort_S rc_S[NS]
            "connection to substrates";
          ADGenKinetics.Interfaces.ChemicalPort_P rc_P[NP]
            "connection to product";

        equation
          rc_S[:].r = n_S[:] * v;
          rc_P[:].r = -n_P[:] * v;

          //rc_S[:].r = rc_S[:].n_S * v;
          //rc_P[:].r = -rc_P[:].n_P * v;

        end BasicReaction;

        partial model ReactionActivation "Interface for activating a reaction"

          parameter Integer NA = 1
            "number of Metabolites activating the reaction";
          ADGenKinetics.Interfaces.ModifierChemicalPort_A mc_A[NA]
            "connectors to the activating node";
          parameter Units.AffinityConst KA[NA] = ones(NA)
            "activation constants";

          Real A "activation term";

        equation
          A = product({ KA[i] / (KA[i] + mc_A[i].c) for i in 1:NA});

          //A = product({ mc_A[i].KA / (mc_A[i].KA + mc_A[i].mc.c) for i in 1:NA});
          //A = product({ mc_A[i].KA / (mc_A[i].KA + mc_A[i].c) for i in 1:NA});

        end ReactionActivation;

        partial model ReactionInhibition "Interface for inhibiting a reaction"

          parameter Integer NI = 1
            "number of Metabolites inhibiting the reaction";
          ADGenKinetics.Interfaces.ModifierChemicalPort_I mc_I[NI]
            "connection to inhibitors";

          parameter Units.AffinityConst KI[NI] = ones(NI)
            "affinity constant of the Inhibitors";

          Real I "inhibition term in the corresponding kinetics";

        equation
          I = product({ KI[i] / (KI[i] + mc_I[i].c) for i in 1:NI});

          //I = product({ mc_I[i].KI / (mc_I[i].KI + mc_I[i].mc.c) for i in 1:NI});
          //I = product({ mc_I[i].KI / (mc_I[i].KI + mc_I[i].c) for i in 1:NI});
        end ReactionInhibition;

        partial model BasicIrrReaction
          "basic declaration of an irreversible reaction "
          extends Reactions.convenience.dynamic.BasicReaction;
          extends Interfaces.Reversible.OneWay;

          //parameter Real KmS[NS] = ones(NS);

          Real S1;
          Real S2;

          parameter Units.AffinityConst KmS[NS] = ones(NS)
            "affinity constants of the substrate nodes";

        equation
          S1 = Vfwdmax * product({rc_S[i].c/KmS[i] for i in 1:NS});
          S2 = product({rc_S[i].c/KmS[i] + 1 for i in 1:NS});

          //S1 = Vfwdmax * product({rc_S[i].rc.c/rc_S[i].KmS for i in 1:NS});
          //S2 = Vfwdmax * product({rc_S[i].rc.c/rc_S[i].KmS + 1 for i in 1:NS});

          // if NS = 0 is possible, use this formulation
          // S2 = if (NS > 0) then Vfwdmax * product({rc_S[i].rc.c/rc_S[i].KmS + 1 for i in 1:NS}) else 1;

          //S1 = Vfwdmax * product({rc_S[i].c/rc_S[i].KmS for i in 1:NS});
          //S2 = Vfwdmax * product({rc_S[i].c/rc_S[i].KmS + 1 for i in 1:NS});

        end BasicIrrReaction;

        partial model BasicRevReaction
          "basic declaration of a reversible reaction "
          extends Reactions.convenience.dynamic.BasicIrrReaction;
          extends Interfaces.Reversible.TwoWay;

          //parameter Real KmP[NP] = ones(NP);

          Real P1;
          Real P2;

          parameter Units.AffinityConst KmP[NP] = ones(NP)
            "affinity constants of the product node";

        equation
          P1 = Vbwdmax * product({rc_P[i].c/KmP[i] for i in 1:NP});
          P2 = product({rc_P[i].c/KmP[i] + 1 for i in 1:NP});

          //P1 = Vbwdmax * product({rc_P[i].rc.c/rc_P[i].KmP for i in 1:NP});
          //P2 = Vbwdmax * product({rc_P[i].rc.c/rc_P[i].KmP + 1 for i in 1:NP});

          //P1 = Vbwdmax * product({rc_P[i].c/rc_P[i].KmP for i in 1:NP});
          //P2 = Vbwdmax * product({rc_P[i].c/rc_P[i].KmP + 1 for i in 1:NP});

        end BasicRevReaction;

        class IrrKinetic "S1 + S2 + ... => P1 + P2 + ... "
          extends ADGenKinetics.Reactions.convenience.dynamic.BasicIrrReaction;

        equation
          v = S1 / S2;

        end IrrKinetic;

        class InhIrrKinetic "S1 + S2 + ... ==I1,I2,...==> P1 + P2 + ... "
          extends ADGenKinetics.Reactions.convenience.dynamic.BasicIrrReaction;
          extends
            ADGenKinetics.Reactions.convenience.dynamic.ReactionInhibition;

        equation
          v = I * S1 / S2;

        end InhIrrKinetic;

        class ActIrrKinetic "S1 + S2 + ... ==A1,A2,...==> P1 + P2 + ... "
          extends ADGenKinetics.Reactions.convenience.dynamic.BasicIrrReaction;
          extends
            ADGenKinetics.Reactions.convenience.dynamic.ReactionActivation;

        equation
          v = A * S1 / S2;

        end ActIrrKinetic;

        class ActInhIrrKinetic "S1 + S2 + ...  ==I1,I2,...==> P1 + P2 + ... "
          extends ADGenKinetics.Reactions.convenience.dynamic.BasicIrrReaction;
          extends
            ADGenKinetics.Reactions.convenience.dynamic.ReactionActivation;
          extends
            ADGenKinetics.Reactions.convenience.dynamic.ReactionInhibition;

        equation
          v = A * I * S1 / S2;

        end ActInhIrrKinetic;

        class RevKinetic "S1 + S2 + ... <===> P1 + P2 + ... "
          extends ADGenKinetics.Reactions.convenience.dynamic.BasicRevReaction;

        equation
          v = (S1 - P1) / (S2 + P2 - 1);

        end RevKinetic;

        class InhRevKinetic "S1 + S2 + ... <==I1,I2,...=> P1 + P2 + ... "
          extends ADGenKinetics.Reactions.convenience.dynamic.BasicRevReaction;
          extends
            ADGenKinetics.Reactions.convenience.dynamic.ReactionInhibition;

        equation
          v = I * (S1 - P1) / (S2 + P2 - 1);

        end InhRevKinetic;

        class ActRevKinetic "S1 + S2 + ...  <==A1,A2,...==> P1 + P2 + ... "
          extends ADGenKinetics.Reactions.convenience.dynamic.BasicRevReaction;
          extends
            ADGenKinetics.Reactions.convenience.dynamic.ReactionActivation;

        equation
          v = A * (S1 - P1) / (S2 + P2 - 1);

        end ActRevKinetic;

        class ActInhRevKinetic "S1 + S2 + ...  <==I1,I2,...==> P1 + P2 + ... "
          extends ADGenKinetics.Reactions.convenience.dynamic.BasicRevReaction;
          extends
            ADGenKinetics.Reactions.convenience.dynamic.ReactionActivation;
          extends
            ADGenKinetics.Reactions.convenience.dynamic.ReactionInhibition;

        equation
          v = A * I * (S1 - P1) / (S2 + P2 - 1);

        end ActInhRevKinetic;

        annotation (Documentation(info="<html>
<p>This subpackage contains components for reactions with arbitrary number of substrates, products and effectors. It is suitable for textual implementation and automatic model generation. </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
      end dynamic;

      package static "Reactions with static fixed number of connections"
        package basics
          "Interfaces for reactions with specific number of connectors"
          partial model BasicReaction1S1P "Basic declaration of a reaction"
            extends Interfaces.static.Reaction;
            extends Interfaces.static.Reaction1S;
            extends Interfaces.static.Reaction1P;
            extends Interfaces.Reversible.OneWay;

           // Reaction Rate
            Units.VolumetricReactionRate v "reaction rate";

            parameter Units.StoichiometricCoef n_S1 = 1
              "stoichiometry coefficent of substrate # 1";
            parameter Units.AffinityConst KmS1 = 0
              "affinity constants of the substrate node # 1";

            parameter Units.StoichiometricCoef n_P1 = 1
              "stoichiometry coefficent of product # 1";

          // Terms for intermidiate computations;
          protected
             Real S1;
             Real S2;
             Real t1;

          equation
            rc_S1.r = n_S1 * v;
            rc_P1.r = -n_P1 * v;

            t1 = rc_S1.c / KmS1;

            S1 = Vfwdmax * t1;
            S2 = (t1+1);

          end BasicReaction1S1P;

          partial model BasicReaction2S1P
            "Basic declaration of a reaction with 2 substrates"
            extends Interfaces.static.Reaction2S;
            extends BasicReaction1S1P;

            parameter Units.StoichiometricCoef n_S2 = 1
              "stoichiometry coefficent of substrate # 2";
            parameter Units.AffinityConst KmS2 = 0
              "affinity constants of the substrate node # 2";

            // Intermidiate computations

          protected
            Real t2;
            Real SS1;
            Real SS2;

          equation
            rc_S2.r = n_S2 * v;
            t2 = rc_S2.c / KmS2;

            SS1 = S1 * t2;
            SS2 = S2 * (t2+1);

          end BasicReaction2S1P;

          partial model BasicReaction1S2P
            "Basic declaration of a reaction with 2 substrates"
            extends Interfaces.static.Reaction2P;
            extends BasicReaction1S1P;

            parameter Units.StoichiometricCoef n_P2 = 1
              "stoichiometry coefficent of product # 2";

          equation
            rc_P2.r = -n_P2 * v;

          end BasicReaction1S2P;

          partial model BasicReaction2S2P
            "Basic declaration of a reaction with 2 substrates"
            extends BasicReaction2S1P;
            extends Interfaces.static.Reaction2P;

          parameter Units.StoichiometricCoef n_P2 = 1
              "stoichiometry coefficent of product # 2";

          equation
            rc_P2.r = -n_P2 * v;

          end BasicReaction2S2P;

          partial model BasicRevReaction1S1P
            "Reversible Reaction from one substrate to one product"
            extends BasicReaction1S1P;
            extends Interfaces.Reversible.TwoWay;

            parameter Units.AffinityConst KmP1 = 0
              "affinity constants of the product node # 1";

          protected
             Real P1;
             Real P2;
             Real u1;

          equation
            u1 = rc_P1.c / KmP1;
            P1 = Vbwdmax * u1;
            P2 = (t1+1);

          end BasicRevReaction1S1P;

          partial model BasicRevReaction2S1P "S1 + S2 <=> P"
            extends BasicRevReaction1S1P;
            extends Interfaces.static.Reaction2S;

            parameter Units.StoichiometricCoef n_S2 = 1
              "stoichiometry coefficent of substrate # 2";
            parameter Units.AffinityConst KmS2 = 0
              "affinity constants of the substrate node # 2";

            // Intermidiate computations

          protected
            Real t2;
            Real SS1;
            Real SS2;

          equation
            rc_S2.r = n_S2 * v;
            t2 = rc_S2.c / KmS2;

            SS1 = S1 * t2;
            SS2 = S2 * (t2+1);

          end BasicRevReaction2S1P;

          partial model BasicRevReaction1S2P "S => P1 + P2"
            extends BasicRevReaction1S1P;
            extends Interfaces.static.Reaction2P;

            parameter Units.StoichiometricCoef n_P2 = 1
              "stoichiometry coefficent of product # 2";
            parameter Units.AffinityConst KmP2 = 0
              "Affinity constants of the product node # 2";

          protected
            Real u2;
            Real PP1;
            Real PP2;

          equation
            rc_P2.r = -n_P2 * v;

            u2 = rc_P2.c / KmP2;

            PP1 = P1 * u2;
            PP2 = P2 * (u2+1);

          end BasicRevReaction1S2P;

          partial model BasicReaction1A
            "Basic Declaration of a reaction with one Activator"
            extends Interfaces.static.Reaction1A;

            parameter Units.AffinityConst KA1 = 0
              "affinity constant of the activator";

          protected
            Real A1 "activation term";

          equation
            A1 = KA1 / (KA1 + mc_A1.c);

          end BasicReaction1A;

          partial model BasicReaction1I
            "Basic Declaration of a reaction with one Activator"
            extends Interfaces.static.Reaction1I;

            parameter Units.AffinityConst KI1 = 0
              "affinity constant of the activator";

          protected
            Real I1 "inhibition term";

          equation
            I1 = KI1 / (KI1 + mc_I1.c);

          end BasicReaction1I;
          annotation (Documentation(info="<html>
<p>This subpackage contains components for reactions with fixed specified number of substrates, products and effectors.</p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
        end basics;

        class IrrKinetic1S1P "S1 + S2 => P"
          extends basics.BasicReaction1S1P;

        equation
          v = S1 / S2;

        end IrrKinetic1S1P;

        class IrrKinetic2S1P "S1 + S2 => P"
          extends basics.BasicReaction2S1P;

        equation
          v = SS1 / SS2;

        end IrrKinetic2S1P;

        class IrrKinetic1S2P "S => P1 + P2"
          extends basics.BasicReaction1S2P;

        equation
          v = S1 / S2;

        end IrrKinetic1S2P;

        model IrrKinetic2S2P "S1 + S2 => P1 + P2"
          extends basics.BasicReaction2S2P;

        equation
          v = SS1 / SS2;

        end IrrKinetic2S2P;

        class RevKinetic1S1P "S <=> P"
          extends basics.BasicRevReaction1S1P;

        equation
          v = (S1 - P1) / (S2 + P2 -1);

        end RevKinetic1S1P;

        class RevKinetic2S1P "S1 + S2 => P"
          extends basics.BasicRevReaction2S1P;

        equation
          v = (SS1 - P1) / (SS2 + P2 - 1);

        end RevKinetic2S1P;

        class RevKinetic1S2P "S <=> P1 + P2"
          extends basics.BasicRevReaction1S2P;

        equation
          v = (S1 - PP1) / (S2 + PP2 - 1);

        end RevKinetic1S2P;

        model IrrKinetic1S1P1I "S =-I=> P"
          extends basics.BasicReaction1S1P;
          extends basics.BasicReaction1I;

        equation
          v = I1 * S1 / S2;

        end IrrKinetic1S1P1I;

        model IrrKinetic2S1P1I "S1 + S2 =-I=> P"
          extends basics.BasicReaction2S1P;
          extends basics.BasicReaction1I;

        equation
          v = I1 * SS1 / SS2;

        end IrrKinetic2S1P1I;

        model IrrKinetic1S2P1I "\"S1 + S2 =-I=> P\""
          extends basics.BasicReaction1S2P;
          extends basics.BasicReaction1I;

        equation
          v = I1 * S1 / S2;

        end IrrKinetic1S2P1I;

        model RevKinetic1S1P1I "S <=-I=> P"
          extends basics.BasicRevReaction1S1P;
          extends basics.BasicReaction1I;

        equation
          v = I1 * (S1 - P1) / (S2 + P2 -1);

        end RevKinetic1S1P1I;
        annotation (Documentation(info="<html>
<p>This subpackage contains components for reactions with fixed specified number of substrates, products and effectors.</p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
      end static;

      annotation (Documentation(info="<html>
<p>This subpackage contains implementations for convenience kinetics. </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
    end convenience;

    package linlog "Implementation of linlog kinetics"
      annotation (Documentation(info="<html>
<p>This subpackage should contains implementation for linlog kinetics.  This is left to the user. </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
    end linlog;
    annotation (Documentation(info="<html>
<p>This subpackage contains implementations for reactions using generalized simplified kinetic formats. Currently only convenience kinetics are implemented. </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
  end Reactions;

  package Examples

    model Spirallusdyn
      "An abstraction of the TCA cycle with dynamic arbitrary number of connections"
      import ADGenKinetics.NodeElements.dynamic.*;
      import ADGenKinetics.Reactions.convenience.dynamic.*;

      Node Aex(c_0=1);
      ADGenKinetics.Reactions.convenience.dynamic.InhIrrKinetic vupt(
        NS=1,
        NP=1,
        NI=1,
        Vfwdmax=1.0,
        KmS={0.1},
        KI={3.0});
      ModifierNode A;

      ADGenKinetics.Reactions.convenience.dynamic.RevKinetic v1(
        NS=1,
        NP=1,
        Vfwdmax=3.0,
        Vbwdmax=1.0,
        KmS={0.1},
        KmP={3.0});
      Node B;

      ADGenKinetics.Reactions.convenience.dynamic.RevKinetic v5(
        NS=1,
        NP=1,
        Vfwdmax=2.0,
        Vbwdmax=.5,
        KmS={1.0},
        KmP={1.0});
      Node E;

      ADGenKinetics.Reactions.convenience.dynamic.IrrKinetic v2(
        NS=2,
        NP=1,
        Vfwdmax=2.5,
        KmS={0.25,2.0});                                    // B,E -v2-> C
      ModifierNode C;

      ADGenKinetics.Reactions.convenience.dynamic.InhIrrKinetic v3(
        NS=1,
        NP=2,
        NI=1,
        Vfwdmax=2.0,
        KmS={2.0},
        KI={0.05});
      ModifierNode D;
      Node F;

      ADGenKinetics.Reactions.convenience.dynamic.InhIrrKinetic v4(
        NS=1,
        NP=2,
        NI=1,
        Vfwdmax=3.0,
        KmS={0.1},
        KI={1.0});

      ADGenKinetics.Reactions.convenience.dynamic.IrrKinetic v6(
        NS=1,
        NP=1,
        Vfwdmax=2.0,
        KmS={3.0});
      Node Eex;

      ADGenKinetics.Reactions.convenience.dynamic.IrrKinetic v7(
        NS=1,
        NP=1,
        Vfwdmax=2.0,
        KmS={3.0});
      Node Fex;

    equation
      // vupt
      connect(Aex.rc,vupt.rc_S[1]);
      connect(vupt.rc_P[1],A.rc);
      connect(vupt.mc_I[1],A.mc);

      // v1
      connect(A.rc,v1.rc_S[1]);
      connect(v1.rc_P[1],B.rc);

      // v5
      connect(B.rc,v5.rc_S[1]);
      connect(v5.rc_P[1],E.rc);

      // v2
      connect(B.rc,v2.rc_S[1]);
      connect(E.rc,v2.rc_S[2]);
      connect(v2.rc_P[1],C.rc);

      // v3
      connect(C.rc,v3.rc_S[1]);
      connect(v3.rc_P[1],D.rc);
      connect(v3.rc_P[2],F.rc);
      connect(D.mc,v3.mc_I[1]);

      // v4
      connect(D.rc,v4.rc_S[1]);
      connect(v4.rc_P[1],F.rc);
      connect(v4.rc_P[2],E.rc);
      connect(v4.mc_I[1],C.mc);

      // v6
      connect(E.rc,v6.rc_S[1]);
      connect(v6.rc_P[1],Eex.rc);

       // v7
      connect(F.rc,v7.rc_S[1]);
      connect(v7.rc_P[1],Fex.rc);

    end Spirallusdyn;

    model Spirallustatic
      "An abstraction of the TCA cycle with static connections"
      NodeElements.static.Node Aex(c_0=1.0)
        annotation (Placement(transformation(extent={{-22,212},{-2,232}})));
      NodeElements.static.ModifierNode A
        annotation (Placement(transformation(extent={{-22,124},{-2,144}})));
      ADGenKinetics.Reactions.convenience.static.IrrKinetic1S1P1I vup(
        Vfwdmax=1.0,
        KmS1=0.1,
        KI1=3.0)
        annotation (Placement(transformation(extent={{-22,168},{-2,188}})));
      ADGenKinetics.Reactions.convenience.static.RevKinetic1S1P v1(
        Vfwdmax=3.0,
        KmS1=0.1,
        Vbwdmax=1.0,
        KmP1=3.0)
        annotation (Placement(transformation(extent={{-22,78},{-2,98}})));
      NodeElements.static.Node B
        annotation (Placement(transformation(extent={{-22,40},{-2,60}})));
      ADGenKinetics.Reactions.convenience.static.RevKinetic1S1P v5(
        Vfwdmax=2.0,
        KmS1=1.0,
        Vbwdmax=0.5,
        KmP1=1.0)
        annotation (Placement(transformation(extent={{-22,-2},{-2,18}})));
      NodeElements.static.Node E
        annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
      ADGenKinetics.Reactions.convenience.static.IrrKinetic2S1P v2(
        Vfwdmax=2.5,
        KmS1=2.0,
        KmS2=0.25)
        annotation (Placement(transformation(extent={{34,-58},{54,-38}})));
      NodeElements.static.Node C
        annotation (Placement(transformation(extent={{62,-96},{82,-76}})));
      ADGenKinetics.Reactions.convenience.static.IrrKinetic1S2P1I v3(
        Vfwdmax=2.0,
        KmS1=2.0,
        KI1=0.05)
        annotation (Placement(transformation(extent={{62,-140},{82,-120}})));
      NodeElements.static.Node D
        annotation (Placement(transformation(extent={{8,-140},{28,-120}})));
      NodeElements.static.Node F
        annotation (Placement(transformation(extent={{8,-196},{28,-176}})));
      ADGenKinetics.Reactions.convenience.static.IrrKinetic1S2P1I v4(
        Vfwdmax=3.0,
        KmS1=0.1,
        KI1=1.0)
        annotation (Placement(transformation(extent={{-44,-164},{-24,-144}})));
      ADGenKinetics.Reactions.convenience.static.IrrKinetic1S1P v6(Vfwdmax=2.0,
          KmS1=3.0)
        annotation (Placement(transformation(extent={{-64,-54},{-44,-34}})));
      NodeElements.static.Node Eex
        annotation (Placement(transformation(extent={{-108,-86},{-88,-66}})));
      NodeElements.static.Node Fex
        annotation (Placement(transformation(extent={{146,-202},{166,-182}})));
      ADGenKinetics.Reactions.convenience.static.IrrKinetic1S1P v7(Vfwdmax=2.0,
          KmS1=3.0)
        annotation (Placement(transformation(extent={{78,-222},{98,-202}})));
    equation
      connect(Aex.rc6, vup.rc_S1) annotation (Line(
          points={{-15.8,212},{-15.8,199},{-16,199},{-16,187.2}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(vup.rc_P1, A.rc1) annotation (Line(
          points={{-15.8,168.8},{-15.8,143.8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(A.rc6, v1.rc_S1) annotation (Line(
          points={{-15.8,124},{-15.8,111},{-16,111},{-16,97.2}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(v1.rc_P1, B.rc1) annotation (Line(
          points={{-15.8,78.8},{-15.8,59.8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B.rc6, v5.rc_S1) annotation (Line(
          points={{-15.8,40},{-16,40},{-16,17.2}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(v5.rc_P1, E.rc1) annotation (Line(
          points={{-15.8,-1.2},{-15.8,-10.6},{-13.8,-10.6},{-13.8,-20.2}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(E.rc3, v2.rc_S1) annotation (Line(
          points={{0,-26.2},{20,-26.2},{20,-34},{40,-34},{40,-38.8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B.rc3, v2.rc_S2) annotation (Line(
          points={{-2,53.8},{24,53.8},{24,46},{48,46},{48,-38.8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(v2.rc_P1, C.rc1) annotation (Line(
          points={{40.2,-57.2},{40.2,-66},{68.2,-66},{68.2,-76.2}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(C.rc6, v3.rc_S1) annotation (Line(
          points={{68.2,-96},{68,-96},{68,-120.8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(v3.rc_P1, D.rc4) annotation (Line(
          points={{68.2,-139.2},{68.2,-154},{50,-154},{50,-134},{28,-134}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(v3.rc_P2, F.rc4) annotation (Line(
          points={{76.2,-139.2},{76.2,-190},{28,-190}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(v3.mc_I1, D.mc2) annotation (Line(
          points={{81.6,-130},{96,-130},{96,-114},{28.2,-114},{28.2,-120.2}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(D.rc8, v4.rc_S1) annotation (Line(
          points={{8.2,-126.2},{-38,-126.2},{-38,-144.8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(v4.rc_P2, F.rc8) annotation (Line(
          points={{-29.8,-163.2},{-29.8,-182.2},{8.2,-182.2}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(v4.mc_I1, C.mc4) annotation (Line(
          points={{-24.4,-154},{-14,-154},{-14,-96},{62,-96}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(v4.rc_P1, E.rc6) annotation (Line(
          points={{-37.8,-163.2},{-37.8,-184},{-72,-184},{-72,-64},{-13.8,-64},
              {-13.8,-40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(E.rc8, v6.rc_S1) annotation (Line(
          points={{-19.8,-26.2},{-60,-34},{-58,-34.8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(v6.rc_P1, Eex.rc4) annotation (Line(
          points={{-57.8,-53.2},{-57.8,-80},{-88,-80}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(F.rc5, v7.rc_S1) annotation (Line(
          points={{22,-196},{22,-212},{56,-212},{56,-194},{84,-194},{84,-202.8}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(v7.rc_P1, Fex.rc6) annotation (Line(
          points={{84.2,-221.2},{84.2,-232},{152.2,-232},{152.2,-202}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(A.mc2, vup.mc_I1) annotation (Line(
          points={{-1.8,143.8},{22,143.8},{22,178},{-2.4,178}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-150,-250},{200,250}},
            grid={2,2},
            initialScale=0.05), graphics), Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-150,-250},{200,250}},
            grid={2,2},
            initialScale=0.05)));
    end Spirallustatic;
    annotation (Documentation(info="<html>
<p>This subpackage contains examples of typical metablic pathway models.</p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
  end Examples;

  package Derivatives
    package Interfaces "Typical interfaces"
      connector ChemicalPort
        "reaction connector from a node to a reaction , declared from the node side"
        extends ADGenKinetics.Interfaces.ChemicalPort;

        outer parameter Integer NG "dimension of the gradients";

        //Units.Concentration c "Concentration";
        Real g_c[NG] "gradients of c";
        //flow Units.VolumetricReactionRate r "reaction rate";
        flow Real g_r[NG] "gradients of r";

        annotation (Icon(graphics={Bitmap(extent={{-75,75},{75,-75}}, fileName=
                    "modelica://GenKinetics/icons/reactionconnection.gif")}),
            Diagram(graphics));
      end ChemicalPort;

      connector ModifierChemicalPort
        "A connector that connects a node to a reaction. The node is supposed to effects (activate or inhibit) the reaction"
        extends ADGenKinetics.Interfaces.ModifierChemicalPort;

        outer parameter Integer NG "dimension of the gradients";

        //Units.Concentration c "Concentration";
        Real g_c[NG] "graidents of c";
        annotation (Icon(graphics={Bitmap(extent={{-70,72},{90,-90}}, fileName=
                    "modelica://GenKinetics/icons/modifierconnection.gif")}));
      end ModifierChemicalPort;

      connector ChemicalPort_S
        "Connector from a reactant substrate node to a reaction, declared from the reaction side"
        extends ADGenKinetics.Derivatives.Interfaces.ChemicalPort;

        annotation (Icon(graphics={Bitmap(extent={{-80,80},{82,-82}}, fileName=
                    "modelica://GenKinetics/icons/reactionconnection_S.gif")}),
            Diagram(graphics));
      end ChemicalPort_S;

      connector ChemicalPort_P
        "Connector from a reactant substrate node to a reaction, declared from the reaction side"
        extends ADGenKinetics.Derivatives.Interfaces.ChemicalPort;

        annotation (Icon(graphics={Bitmap(extent={{-88,106},{94,-104}}, fileName=
                    "modelica://GenKinetics/icons/reactionconnection_P2.gif")}));
      end ChemicalPort_P;

      connector ModifierChemicalPort_I
        "A connection from a reaction to an inhibition node"
        extends ADGenKinetics.Derivatives.Interfaces.ModifierChemicalPort;

        annotation (Icon(
            coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                  100}}),
            graphics={Bitmap(extent={{-80,80},{84,-80}}, fileName=
                    "modelica://GenKinetics/icons/modifierconnection_I2.gif")}));
      end ModifierChemicalPort_I;

      connector ModifierChemicalPort_A
        "A connection from a reaction to an inhibition node"
        extends ADGenKinetics.Derivatives.Interfaces.ModifierChemicalPort;

        annotation (Icon(                     graphics={Bitmap(extent={{-96,100},
                    {124,-120}}, fileName=
                    "modelica://GenKinetics/icons/modifierconnection_A2.gif")}));
      end ModifierChemicalPort_A;

      package Reversible "Interfaces describing reversibility of a reaction"
        partial model ReactionReversibility
          "Base Type for describing Reversability of a reaction"
          extends ADGenKinetics.Interfaces.Reversible.ReactionReversibility;

           outer parameter Integer NG "# of gradients";

          // parameter Units.ReactionCoef Vfwdmax=1;   // forwared constant rate
          parameter Real g_Vfwdmax[NG]=zeros(NG) "gradients of Vfwdmax";

        end ReactionReversibility;

        class OneWay "Irreversible Reaction"
          extends ReactionReversibility;

          annotation (Icon(graphics={Bitmap(extent={{-80,80},{84,-80}}, fileName=
                      "modelica://GenKinetics/icons/OneWay.gif")}));
        end OneWay;

        class TwoWay "Reversible Reaction"
          extends ReactionReversibility;

          parameter Units.ReactionCoef Vbwdmax=1
            "maximal reversible reaction rate";
          parameter Real g_Vbwdmax[NG]=zeros(NG) "gradients of Vbdwmax";

          annotation (Icon(graphics={Bitmap(extent={{-80,80},{78,-82}}, fileName=
                      "modelica://GenKinetics/icons/TwoWay.gif")}));
        end TwoWay;
        annotation (Documentation(info="<html>
<p>This subpackage contains basic interfaces describing the reversibility of a reaction</p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
      end Reversible;

      package dynamic
        "Interfaces with parameterized number of connections for textual implementation and automatic model generation"
        package Dimension "Reaction Dimension and Molecularity"
          class ReactionDimension "Dimension and structure of a reaction"
            extends
              ADGenKinetics.Interfaces.dynamic.Dimension.ReactionDimension;

            //parameter Integer NS = 1 "Number of substrates";
            //parameter Units.StoichiometricCoef n_S[NS]=ones(NS)
             // "Stoichiometry of all subtrates";

            //parameter Integer NP = 1 "Number of products";
            //parameter Units.StoichiometricCoef n_P[NP]=ones(NP)
            //  "Stoichiometry of all products";

          end ReactionDimension;

          annotation (Documentation(info="<html>
<p>This subpackage contains basic interface for specifying the dimension of the reaction, see <a href=\"GenKinetics.Interfaces.dynamic.Dimension.ReactionDimension\">GenKinetics.Interfaces.dynamic.Dimension.ReactionDimension</a> . Out of this interface, specialized reaction types can be created as a syntactic sugar, e.g. <a href=\"GenKinetics.Interfaces.dynamic.Dimension.UniUni\">GenKinetics.Interfaces.dynamic.Dimension.UniUni</a> . </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
        end Dimension;

        partial model NodeConnections
          "Metabolite connections to reactions wuth one connector only"

          ADGenKinetics.Derivatives.Interfaces.ChemicalPort rc
            "connection to any reaction "                     annotation (
              Placement(transformation(extent={{-50,-50},{50,50}}),
                iconTransformation(extent={{-114,-40},{122,154}})));
          ADGenKinetics.Derivatives.Interfaces.ModifierChemicalPort mc
            "Connection to a modifier"                     annotation (Placement(
                transformation(extent={{-50,-50},{50,-50}}), iconTransformation(
                  extent={{-64,-122},{72,2}})));
          annotation (Icon(graphics));
        end NodeConnections;
        annotation (Documentation(info="<html>
<p>This subpackage contains basic interfaces for nodes and reactions. The nodes and the reactions are declared with a &QUOT;dynamic&QUOT; parameterized number of connectors. </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
      end dynamic;

      annotation (Documentation(info="<html>
<p>This subpackage contains all interfaces, abstract models, connectors etc. utilized by the components of the library. </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
    end Interfaces;

    package NodeElements "Metabolites"

      package dynamic "Nodes with parameterized interfaces and connections"
        partial model BasicNode "Basic declarations of any Metabolite"
          extends ADGenKinetics.Derivatives.Interfaces.dynamic.NodeConnections;
          extends ADGenKinetics.NodeElements.dynamic.BasicNode;

          outer parameter Integer NG "# of gradients";

          //parameter Units.Concentration c_0=0;
          parameter Real g_c_0[NG]=zeros(NG) "gradients of c_0";

          //Units.Concentration c(start=c_0);
          Real g_c[NG](start=g_c_0) "gradients of c";

          //Units.VolumetricReactionRate r_net;
          Real g_r_net[NG](start=zeros(NG)) "gradients of r_net";

        equation
         // r_net = rc.r;
         g_r_net[:] = rc.g_r[:];
         // rc.c  = c;
         rc.g_c[:] = g_c[:];
         // mc.c = c;
         mc.g_c[:] = g_c[:];

        end BasicNode;

        class Node "Metabolite with dynamic rate"
          extends ADGenKinetics.Derivatives.NodeElements.dynamic.BasicNode;
          //extends GenKinetics.NodeElements.dynamic.Node;

          //outer parameter Integer NG "# of gradients";

        equation
          der(c) = r_net;
          der(g_c[:]) = g_r_net[:];
        end Node;

        class FixedConcentrationNode "Metabolite with fixed concentration"
          extends ADGenKinetics.Derivatives.NodeElements.dynamic.BasicNode;

          parameter Units.Concentration c_fixed=1.0 "fixed concentration";
          parameter Real g_c_fixed[NG] = zeros(NG) "gradients of c_fixed";

        equation
          c = c_fixed;
          g_c[:] = g_c_fixed[:];
        end FixedConcentrationNode;
        annotation (Documentation(info="<html>
<p>This subpackage contains implmentation for nodes, chemical substances, which can be connected to arbitrary number of reactions. Typically the component <a href=\"GenKinetics.Derivatives.NodeElements.dynamic.Node\">GenKinetics.Derivatives.NodeElements.dynamic.Node</a> is the one which will be used at most. The component <a href=\"GenKinetics.Derivatives.NodeElements.dynamic.ModifierNode\">GenKinetics.Derivatives.NodeElements.dynamic.ModifierNode</a> is exactly the same and does not really provide additional functionalities (it is here only for backword compatibility reasons with older versions of this implementation). This component will mostly get removed in later versions. </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
      end dynamic;

      annotation (Documentation(info="<html>
<p>This subpackage contains components for chemical substances. Additional substances are also provided in other implementations of the Biochem library.</p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
    end NodeElements;

    package Reactions "Reaction kinetics"

      package convenience "Implementation of convenience kinetics"

        package dynamic
          "Reactions with parameterized number of connections suitable for model generation and textual implementation"

          package intermidiate
            "Reactions with parameterized number of connections suitable for model generation and textual implementation"
            partial model ReactionActivation
              "Interface for activating a reaction"

              parameter Integer NA = 1
                " number of Metabolites activating the reaction";
              ADGenKinetics.Interfaces.ModifierChemicalPort_A mc_A[NA]
                "connectors to the activating node";
              parameter Units.AffinityConst KA[NA] = ones(NA)
                "activation constants";

              Real A "activation term";

            equation
              A = product({ KA[i] / (KA[i] + mc_A[i].c) for i in 1:NA});

              //A = product({ mc_A[i].KA / (mc_A[i].KA + mc_A[i].mc.c) for i in 1:NA});
              //A = product({ mc_A[i].KA / (mc_A[i].KA + mc_A[i].c) for i in 1:NA});

            end ReactionActivation;

            partial model ReactionInhibition
              "Inhibition influencing a reaction"

              //outer parameter Integer NG "# of gradients";

              parameter Integer NI = 1
                " number of Metabolites inhibiting the reaction";
              ADGenKinetics.Interfaces.ModifierChemicalPort_I mc_I[NI];

              parameter Units.AffinityConst KI[NI] = ones(NI)
                "Affinity constant of the Inhibitors";
              //constant Real[NG] g_KI[NI];

              Real I "Inhibition term in the corresponding kinetics";
              //Real g_I[NG];

            protected
              Real  ad_T2_1[NI] "intermidiate";
              Real  ad_T2_11[NI] "intermidiate";
              Real  ad_D2_112[NI] "intermidiate";

            equation
              //I = product({ KI[i] / (KI[i] + mc_I[i].c) for i in 1:NI});

              for i in 1:NI loop
                1/ ad_D2_112[i] =  (KI[i] + mc_I[i].c);
                ad_T2_11[i] = KI[i] * ad_D2_112[i];
                ad_T2_1[i] = if
                               (i > 1) then ad_T2_1[i-1] * ad_T2_11[i] else ad_T2_11[i];
              end for;
              I = ad_T2_1[NI];

            end ReactionInhibition;

            partial model BasicReaction "basic declaration of a reaction "
              extends
                ADGenKinetics.Interfaces.dynamic.Dimension.ReactionDimension;

              // Reaction Rate
              Units.VolumetricReactionRate v;

              // Connections to Substrates and Products
              ADGenKinetics.Interfaces.ChemicalPort_S rc_S[NS]
                "connection to substrates";
              ADGenKinetics.Interfaces.ChemicalPort_P rc_P[NP]
                "connection to product";

            equation
              rc_S[:].r = n_S[:] * v;
              rc_P[:].r = -n_P[:] * v;

              //rc_S[:].r = rc_S[:].n_S * v;
              //rc_P[:].r = -rc_P[:].n_P * v;

            end BasicReaction;

            partial model BasicIrrReaction "basic declaration of a reaction "
              extends BasicReaction;
              extends ADGenKinetics.Interfaces.Reversible.OneWay;

              Real S1;
              Real S2;

              parameter Units.AffinityConst KmS[NS] = ones(NS)
                "Affinity constants of the substrate nodes";

              parameter Real OOKmS[NS] = {1.0/KmS[i] for i in 1:NS};

              //Real[NS] ad_T3_1;
            protected
              Real[NS] ad_T3_11 "intermidiate";
              Real[NS] ad_T3_111 "intermidiate";
              Real[NS] ad_T4_11 "intermidiate";
              //Real[NS] ad_T4_111;

            equation
              //S1 = Vfwdmax * product({rc_S[i].c/KmS[i] for i in 1:NS});

              for i in 1:NS loop
                ad_T3_111[i] = rc_S[i].c * OOKmS[i];
                ad_T3_11[i]  = if
                                 (i > 1) then ad_T3_111[i] * ad_T3_11[i-1] else ad_T3_111[i];
                ad_T4_11[i]  = if
                                 (i > 1) then (ad_T3_111[i]+1) * ad_T4_11[i-1] else ad_T3_111[i]+1;
              end for;
              S1 = Vfwdmax * ad_T3_11[NS];

              //S2 = product({rc_S[i].c/KmS[i] + 1 for i in 1:NS});
              S2 = ad_T4_11[NS];

            end BasicIrrReaction;

            partial model BasicRevReaction "basic declaration of a reaction "
              extends BasicIrrReaction;
              //extends BasicReaction;
              extends ADGenKinetics.Interfaces.Reversible.TwoWay;

              Real P1;
              Real P2;

              parameter Units.AffinityConst KmP[NP] = ones(NP)
                "Affinity constants of the product node";

            protected
              parameter Real OOKmP[NP] = {1.0/KmP[i] for i in 1:NP};

              Real[NP] ad_T5_11 "intermidiate";
              Real[NP] ad_T5_111 "intermidiate";

              Real[NP] ad_T6_11 "intermidiate";

            equation
              //P1 = Vbwdmax * product({rc_P[i].c/KmP[i] for i in 1:NP});

              for i in 1:NP loop
                ad_T5_111[i] = rc_P[i].c * OOKmP[i];
                ad_T5_11[i]  = if (i > 1) then ad_T5_111[i] * ad_T5_11[i-1] else ad_T5_111[i];
                ad_T6_11[i]  = if (i > 1) then (ad_T5_111[i]+1) * ad_T6_11[i-1] else ad_T5_111[i]+1;
              end for;
              P1 = Vbwdmax * ad_T5_11[NP];

              //P2 = product({rc_P[i].c/KmP[i] + 1 for i in 1:NP});
              P2 = ad_T6_11[NP];

            end BasicRevReaction;

            class IrrKinetic "S1 + S2 + .. => P1 + P2 + ... "
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.BasicIrrReaction;

            protected
              Real ad_T7_12 "intermidiate";

            equation
              1/ad_T7_12 = S2;
              v = S1 * ad_T7_12;

            end IrrKinetic;

            class InhIrrKinetic "S1 + S2 + .. ==I1,I2,..=> P1 + P2 + ... "
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.BasicIrrReaction;
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.ReactionInhibition;

            protected
              Real ad_T8_122 "intermidiate";
              Real ad_T8_12 "intermidiate";

            equation
              1/ad_T8_122 = S2;
              ad_T8_12 = S1 * ad_T8_122;
              v = I * ad_T8_12;

            end InhIrrKinetic;

            class ActIrrKinetic "S1 + S2 + .. + ==A1,A2,...=> P1 + P2 + ... "
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.BasicIrrReaction;
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.ReactionActivation;

            equation
              v = A * S1 / S2;

            end ActIrrKinetic;

            class ActInhIrrKinetic
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.BasicIrrReaction;
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.ReactionActivation;
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.ReactionInhibition;

            equation
              v = A * I * S1 / S2;

            end ActInhIrrKinetic;

            class RevKinetic "S1 + S2 + ... <===> P1 + P2 + ... "
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.BasicRevReaction;

            protected
              Real ad_D11_12 "intermidiate";

            equation
              1/ad_D11_12 = S2 + P2 - 1;
              v = (S1 - P1) * ad_D11_12;
              //v = (S1 - P1) / (S2 + P2 - 1);

            end RevKinetic;

            class InhRevKinetic
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.BasicRevReaction;
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.ReactionInhibition;

            protected
              Real ad_T12_1 "intermidiate";

              Real ad_T12_12 "intermidiate";

              Real ad_D12_122 "intermidiate";

            equation
              1/ad_D12_122 = S2 + P2 - 1;
              ad_T12_12  = (S1-P1) * ad_D12_122;
              v = I * ad_T12_12;

            end InhRevKinetic;

            class ActRevKinetic
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.BasicRevReaction;
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.ReactionActivation;

            equation
              v = A * (S1 - P1) / (S2 + P2 - 1);

            end ActRevKinetic;

            class ActInhRevKinetic
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.BasicRevReaction;
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.ReactionActivation;
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.ReactionInhibition;

            equation
              v = A * I * (S1 - P1) / (S2 + P2 - 1);

            end ActInhRevKinetic;

            annotation (Documentation(info="<html>
<p>This subpackage is exactly like the parent subpackage <a href=\"GenKinetics.Derivatives.Reaction.convenience.dynamic\">GenKinetics.Derivatives.Reaction.convenience.dynamic</a> . The components are simplified, processed in away to make algorithmic differentiation techniques easily applicables. It is useful for testing purposes, to ensure that the deriviated intermidiate formats are correct. </p>
<p><br/>Equations for parameter senstivities are computed by applying algorithmic differentiation techniques on the simplified version of the original part <a href=\"GenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate \">GenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate </a></p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
          end intermidiate;

          partial model ReactionInhibition "Inhibition influencing a reaction"
            //extends intermidiate.ReactionInhibition;

            outer parameter Integer NG "# of gradients";

            parameter Integer NI = 1
              " number of Metabolites inhibiting the reaction";
            ADGenKinetics.Derivatives.Interfaces.ModifierChemicalPort_I mc_I[NI];

            parameter Units.AffinityConst KI[NI] = ones(NI)
              "Affinity constant of the Inhibitors";
            parameter Real[NI,NG] g_KI = zeros(NI,NG) "gradients of KI[*]";

            Real I "Inhibition term in the corresponding kinetics";
            Real g_I[NG](start=zeros(NG)) "gradients of I";

          protected
            Real  ad_T2_1[NI] "intermidiate";
            Real[NI,NG]  ad_g_T2_1(start=zeros(NI,NG)) "gradients of ad_T2_1";

            Real  ad_T2_11[NI] "intermidiate";
            //Real[NI,NG]  ad_g_T2_11(start=zeros(NI,NG));

            Real  ad_D2_112[NI] "intermidiate";
            //Real[NI,NG]  ad_g_D2_112(start=zeros(NI,NG));

          equation
            //I = product({ KI[i] / (KI[i] + mc_I[i].c) for i in 1:NI});

            for i in 1:NI loop

              ad_D2_112[i] =  1/(KI[i] + mc_I[i].c);
            //  ad_g_D2_112[i,:]  =  -(g_KI[i,:] + mc_I[i].g_c[:]) * ad_D2_112[i] * ad_D2_112[i];

              ad_T2_11[i] = KI[i] * ad_D2_112[i];
             // ad_g_T2_11[i,:] = g_KI[i,:] * ad_D2_112[i] + KI[i] * (-(g_KI[i,:] + mc_I[i].g_c[:]) * ad_D2_112[i] * ad_D2_112[i]);

              ad_T2_1[i] = if (i > 1) then ad_T2_1[i-1] * ad_T2_11[i] else ad_T2_11[i];
              ad_g_T2_1[i,:] = if
                                 (i > 1) then ad_g_T2_1[i-1,:] * ad_T2_11[i] + ad_T2_1[i-1] * (g_KI[i,:] * ad_D2_112[i] + KI[i] * (-(g_KI[i,:] + mc_I[i].g_c[:]) * ad_D2_112[i] * ad_D2_112[i])) else (g_KI[i,:] * ad_D2_112[i] + KI[i] * (-(g_KI[i,:] + mc_I[i].g_c[:]) * ad_D2_112[i] * ad_D2_112[i]));
            end for;
            I = ad_T2_1[NI];
            g_I[:] = ad_g_T2_1[NI,:];

          end ReactionInhibition;

          partial model BasicReaction "basic declaration of a reaction "
            //extends intermidiate.BasicReaction;
            extends
              ADGenKinetics.Derivatives.Interfaces.dynamic.Dimension.ReactionDimension;

            outer parameter Integer NG "# of gradients";

            // Reaction Rate
            Units.VolumetricReactionRate v "reaction rate";
            Real[NG] g_v(start=zeros(NG)) "gradients of v";

            // Connections to substrates and products
            ADGenKinetics.Derivatives.Interfaces.ChemicalPort_S rc_S[NS]
              "connection to substrates";
            ADGenKinetics.Derivatives.Interfaces.ChemicalPort_P rc_P[NP]
              "connection to product";

          equation
            rc_S[:].r = n_S[:] * v;
            rc_P[:].r = -n_P[:] * v;

            for i in 1:NS loop
                rc_S[i].g_r[:] = n_S[i] * g_v[:];
            end for;

            for i in 1:NP loop
              for j in 1:NG loop
                rc_P[i].g_r[j] = -n_P[i] * g_v[j];
              end for;
            end for;

          end BasicReaction;

          partial model BasicIrrReaction "basic declaration of a reaction "
            extends BasicReaction;
            extends ADGenKinetics.Derivatives.Interfaces.Reversible.OneWay;

            //extends intermidiate.BasicIrrReaction;
            //outer parameter Integer NG "# of gradients";

            Real S1 "substrate term";
            Real[NG] g_S1(start=zeros(NG)) "gradients of S1";

            Real S2 "substrate term";
            Real[NG] g_S2(start=zeros(NG)) "gradients of S2";

            parameter Units.AffinityConst KmS[NS] = ones(NS)
              "affinity constants of the substrate nodes";
            parameter Real[NS,NG] g_KmS = zeros(NS,NG) "gradients";

          //protected
            parameter Real OOKmS[NS] = {1.0/KmS[i] for i in 1:NS}
              "affinity constants of the substrate node";
            parameter Real[NS,NG] g_OOKmS =  { -g_KmS[i,:] * OOKmS[i] * OOKmS[i] for i in 1:NS}
              "gradients";

            Real[NS] ad_T3_11 "intermidiates";
            Real[NS,NG] ad_g_T3_11(start=zeros(NS,NG)) "gradients";

            Real[NS] ad_T3_111 "intermidiates";
            //Real[NS,NG] ad_g_T3_111(start=zeros(NS,NG));

            Real[NS] ad_T4_11 "intermidiates";
            Real[NS,NG] ad_g_T4_11(start=zeros(NS,NG)) "gradients";

          equation
            //S1 = Vfwdmax * product({rc_S[i].c/KmS[i] for i in 1:NS});

            for i in 1:NS loop
              ad_T3_111[i] = rc_S[i].c * OOKmS[i];
             // ad_g_T3_111[i,:] = rc_S[i].g_c[:] * OOKmS[i] + rc_S[i].c * g_OOKmS[i,:];

              ad_T3_11[i]  = if (i > 1) then ad_T3_111[i] * ad_T3_11[i-1] else ad_T3_111[i];
              // ad_g_T3_11[i,:]  = if (i > 1) then ad_g_T3_111[i] * ad_T3_11[i-1] + ad_T3_111[i] * ad_g_T3_11[i-1,:] else ad_g_T3_111[i];
              ad_g_T3_11[i,:]  = if (i > 1) then (rc_S[i].g_c[:] * OOKmS[i] + rc_S[i].c * g_OOKmS[i,:]) * ad_T3_11[i-1] + ad_T3_111[i] * ad_g_T3_11[i-1,:] else (rc_S[i].g_c[:] * OOKmS[i] + rc_S[i].c * g_OOKmS[i,:]);

              ad_T4_11[i]  = if (i > 1) then (ad_T3_111[i]+1) * ad_T4_11[i-1] else ad_T3_111[i]+1;
              //ad_g_T4_11[i,:]  = if (i > 1) then ad_g_T3_111[i] * ad_T4_11[i-1] + (ad_T3_111[i]+1) * ad_g_T4_11[i-1,:] else ad_g_T3_111[i];
              ad_g_T4_11[i,:]  = if (i > 1) then (rc_S[i].g_c[:] * OOKmS[i] + rc_S[i].c * g_OOKmS[i,:]) * ad_T4_11[i-1] + (ad_T3_111[i]+1) * ad_g_T4_11[i-1,:] else (rc_S[i].g_c[:] * OOKmS[i] + rc_S[i].c * g_OOKmS[i,:]);
            end for;

            S1 = Vfwdmax * ad_T3_11[NS];
            g_S1[:] = g_Vfwdmax[:] * ad_T3_11[NS] + Vfwdmax * ad_g_T3_11[NS,:];

            //S2 = product({rc_S[i].c/KmS[i] + 1 for i in 1:NS});
            S2 = ad_T4_11[NS];
            g_S2[:] = ad_g_T4_11[NS,:];

          end BasicIrrReaction;

          partial model BasicRevReaction
            "basic declaration of a reversible reaction "
            extends BasicIrrReaction;
            extends ADGenKinetics.Derivatives.Interfaces.Reversible.TwoWay;

            //extends intermidiate.BasicRevReaction;

            Real P1 "product term";
            Real[NG] g_P1(start=zeros(NG)) "gradients of P1";

            Real P2 "product term";
            Real[NG] g_P2(start=zeros(NG)) "gradients of P2";

            parameter Units.AffinityConst KmP[NP] = ones(NP)
              "affinity constants of the substrate nodes";
            parameter Real[NP,NG] g_KmP = zeros(NP,NG) "gradients of KmP[*]";

          protected
            parameter Real OOKmP[NP] = {1.0/KmP[i] for i in 1:NP};
            parameter Real[NP,NG] g_OOKmP =  { -g_KmP[i,:] * OOKmP[i] * OOKmP[i] for i in 1:NP};

            Real[NP] ad_T5_11 "intermidiate";
            Real[NP,NG] ad_g_T5_11(start=zeros(NP,NG)) "gradients";

            Real[NP] ad_T5_111 "intermidiate";
           // Real[NP,NG] ad_g_T5_111(start=zeros(NP,NG));

            Real[NP] ad_T6_11 "intermidiate";
            Real[NP,NG] ad_g_T6_11(start=zeros(NP,NG)) "gradients";

          equation
            //S1 = Vfwdmax * product({rc_S[i].c/KmS[i] for i in 1:NS});

            for i in 1:NP loop

              ad_T5_111[i] = rc_P[i].c * OOKmP[i];
             // ad_g_T5_111[i,:] = rc_P[i].g_c[:] * OOKmP[i] + rc_P[i].c * g_OOKmP[i,:];

              ad_T5_11[i]  = if (i > 1) then ad_T5_111[i] * ad_T5_11[i-1] else ad_T5_111[i];
              ad_g_T5_11[i,:]  = if (i > 1) then (rc_P[i].g_c[:] * OOKmP[i] + rc_P[i].c * g_OOKmP[i,:]) * ad_T5_11[i-1] + ad_T5_111[i] * ad_g_T5_11[i-1,:] else (rc_P[i].g_c[:] * OOKmP[i] + rc_P[i].c * g_OOKmP[i,:]);

              ad_T6_11[i]  = if (i > 1) then (ad_T5_111[i]+1) * ad_T6_11[i-1] else ad_T5_111[i]+1;
              ad_g_T6_11[i,:]  = if (i > 1) then (rc_P[i].g_c[:] * OOKmP[i] + rc_P[i].c * g_OOKmP[i,:]) * ad_T6_11[i-1] + (ad_T5_111[i]+1) * ad_g_T6_11[i-1,:] else (rc_P[i].g_c[:] * OOKmP[i] + rc_P[i].c * g_OOKmP[i,:]);
            end for;

            P1 = Vbwdmax * ad_T5_11[NP];
            g_P1[:] = g_Vbwdmax[:] * ad_T5_11[NP] + Vbwdmax * ad_g_T5_11[NP,:];

            P2 = ad_T6_11[NP];
            g_P2[:] = ad_g_T6_11[NP,:];

          end BasicRevReaction;

          class IrrKinetic "S1 + S2 + .. => P1 + P2 + ... "
            extends
              ADGenKinetics.Derivatives.Reactions.convenience.dynamic.BasicIrrReaction;

            Real ad_T7_12 "intermidiate";
           // Real[NG] ad_g_T7_12(start=zeros(NG));

          equation
            ad_T7_12 = 1/S2;
            // ad_g_T7_12[:] = - g_S2[:] * ad_T7_12 * ad_T7_12;

            v = S1 * ad_T7_12;
            //g_v[:] = g_S1[:] * ad_T7_12 + S1 * ad_g_T7_12[:];
            g_v[:] = g_S1[:] * ad_T7_12 + S1 * (- g_S2[:] * ad_T7_12 * ad_T7_12);

          end IrrKinetic;

          class InhIrrKinetic "S1 + S2 + .. ==I1,I2,..=> P1 + P2 + ... "
            extends
              ADGenKinetics.Derivatives.Reactions.convenience.dynamic.BasicIrrReaction;
            extends
              ADGenKinetics.Derivatives.Reactions.convenience.dynamic.ReactionInhibition;

            Real ad_T8_122 "intermidiate";
           // Real[NG] ad_g_T8_122(start=zeros(NG));

            Real ad_T8_12 "intermidiate";
            //Real[NG] ad_g_T8_12(start=zeros(NG));

          equation
            ad_T8_122 = 1/S2;
           // ad_g_T8_122[:] = -g_S2[:]; // * ad_T8_122 * ad_T8_122;

            ad_T8_12 = S1 * ad_T8_122;
            // ad_g_T8_12[:] =  g_S1[:] * ad_T8_122 + S1 * ad_g_T8_122[:];
            // ad_g_T8_12[:] =  g_S1[:] * ad_T8_122 + S1 * (-g_S2[:]);

            v = I * ad_T8_12;
            //g_v[:] = g_I[:] * ad_T8_12 + I * ad_g_T8_12[:];
            g_v[:] = g_I[:] * ad_T8_12 + I * (g_S1[:] * ad_T8_122 + S1 * (-g_S2[:]));

          end InhIrrKinetic;

          class RevKinetic "S1 + S2 + ... <===> P1 + P2 + ... "
            extends
              ADGenKinetics.Derivatives.Reactions.convenience.dynamic.BasicRevReaction;

          protected
            Real ad_D11_12 "intermidiate";
           // Real[NG] ad_g_D11_12(start=zeros(NG));

          equation
            ad_D11_12 = 1 / (S2 + P2 - 1);
            // ad_g_D11_12[:] = - (g_S2[:] + g_P2[:]) * ad_D11_12 * ad_D11_12;

            //v = (S1 - P1) / (S2 + P2 - 1);
            v = (S1 - P1) * ad_D11_12;
            // g_v[:] = (g_S1[:] - g_P1[:]) * ad_D11_12 + (S1-P1) * ad_g_D11_12[:];
            g_v[:] = (g_S1[:] - g_P1[:]) * ad_D11_12 + (S1-P1) * (- (g_S2[:] + g_P2[:]) * ad_D11_12 * ad_D11_12);

          end RevKinetic;

          class InhRevKinetic
            extends
              ADGenKinetics.Derivatives.Reactions.convenience.dynamic.BasicRevReaction;
            extends
              ADGenKinetics.Derivatives.Reactions.convenience.dynamic.ReactionInhibition;

            //Real ad_T12_1;
            //Real[NG] ad_g_T12_1;

          protected
            Real ad_T12_12 "intermidiate";
           // Real[NG] ad_g_T12_12(start=zeros(NG));

            Real ad_D12_122 "intermidiate";
            //Real[NG] ad_g_D12_122(start=zeros(NG));

          equation
            ad_D12_122 = 1 / (S2 + P2 - 1);
            // ad_g_D12_122[:] = -(g_S2[:] + g_P2[:]) * ad_D12_122 * ad_D12_122;

            ad_T12_12  = (S1-P1) * ad_D12_122;
            // ad_g_T12_12[:] = (g_S1[:] - g_P1[:]) * ad_D12_122 + (S1-P1) * ad_g_D12_122[:];
            //ad_g_T12_12[:] = (g_S1[:] - g_P1[:]) * ad_D12_122 + (S1-P1) * (-(g_S2[:] + g_P2[:]) * ad_D12_122 * ad_D12_122);

            v = I * ad_T12_12;
            // g_v[:] = g_I[:] * ad_T12_12 + I * ad_g_T12_12[:];
            g_v[:] = g_I[:] * ad_T12_12 + I * ((g_S1[:] - g_P1[:]) * ad_D12_122 + (S1-P1) * (-(g_S2[:] + g_P2[:]) * ad_D12_122 * ad_D12_122));

          end InhRevKinetic;
          annotation (Documentation(info="<html>
<p>This subpackage contains components for reactions with arbitrary number of substrates, products and effectors. It is suitable for textual implementation and automatic model generation. Equations for parameter senstivities are computed by applying algorithmic differentiation techniques on the simplified version of the original part <a href=\"GenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate \">GenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate </a></p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p><p>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
        end dynamic;

        package dynamic_adtemp
          "Reactions with parameterized number of connections suitable for model generation and textual implementation"

          package intermidiate
            "Reactions with parameterized number of connections suitable for model generation and textual implementation"
            partial model ReactionActivation
              "Interface for activating a reaction"

              parameter Integer NA = 1
                " number of Metabolites activating the reaction";
              ADGenKinetics.Interfaces.ModifierChemicalPort_A mc_A[NA]
                "Connectors to the activating node";
              parameter Units.AffinityConst KA[NA] = ones(NA)
                "Activation constants";

              Real A "Activation term";

            equation
              A = product({ KA[i] / (KA[i] + mc_A[i].c) for i in 1:NA});

              //A = product({ mc_A[i].KA / (mc_A[i].KA + mc_A[i].mc.c) for i in 1:NA});
              //A = product({ mc_A[i].KA / (mc_A[i].KA + mc_A[i].c) for i in 1:NA});

            end ReactionActivation;

            partial model ReactionInhibition
              "Inhibition influencing a reaction"

              //outer parameter Integer NG "# of gradients";

              parameter Integer NI = 1
                " number of Metabolites inhibiting the reaction";
              ADGenKinetics.Interfaces.ModifierChemicalPort_I mc_I[NI];

              parameter Units.AffinityConst KI[NI] = ones(NI)
                "Affinity constant of the Inhibitors";
              //constant Real[NG] g_KI[NI];

              Real I "Inhibition term in the corresponding kinetics";
              //Real g_I[NG];

            protected
              Real  ad_T2_1[NI];
              Real  ad_T2_11[NI];
              Real  ad_D2_112[NI];

            equation
              //I = product({ KI[i] / (KI[i] + mc_I[i].c) for i in 1:NI});

              for i in 1:NI loop
                1/ ad_D2_112[i] =  (KI[i] + mc_I[i].c);
                ad_T2_11[i] = KI[i] * ad_D2_112[i];
                ad_T2_1[i] = if
                               (i > 1) then ad_T2_1[i-1] * ad_T2_11[i] else ad_T2_11[i];
              end for;
              I = ad_T2_1[NI];

            end ReactionInhibition;

            partial model BasicReaction "basic declaration of a reaction "
              extends
                ADGenKinetics.Interfaces.dynamic.Dimension.ReactionDimension;

              // Reaction Rate
              Units.VolumetricReactionRate v;

              // Connections to Substrates and Products
              ADGenKinetics.Interfaces.ChemicalPort_S rc_S[NS]
                "connection to substrates";
              ADGenKinetics.Interfaces.ChemicalPort_P rc_P[NP]
                "connection to product";

            equation
              rc_S[:].r = n_S[:] * v;
              rc_P[:].r = -n_P[:] * v;

              //rc_S[:].r = rc_S[:].n_S * v;
              //rc_P[:].r = -rc_P[:].n_P * v;

            end BasicReaction;

            partial model BasicIrrReaction "basic declaration of a reaction "
              extends BasicReaction;
              extends ADGenKinetics.Interfaces.Reversible.OneWay;

              Real S1;
              Real S2;

              parameter Units.AffinityConst KmS[NS] = ones(NS)
                "Affinity constants of the substrate nodes";

              parameter Real OOKmS[NS] = {1.0/KmS[i] for i in 1:NS};

              //Real[NS] ad_T3_1;
            protected
              Real[NS] ad_T3_11;
              Real[NS] ad_T3_111;
              Real[NS] ad_T4_11;
              //Real[NS] ad_T4_111;

            equation
              //S1 = Vfwdmax * product({rc_S[i].c/KmS[i] for i in 1:NS});

              for i in 1:NS loop
                ad_T3_111[i] = rc_S[i].c * OOKmS[i];
                ad_T3_11[i]  = if
                                 (i > 1) then ad_T3_111[i] * ad_T3_11[i-1] else ad_T3_111[i];
                ad_T4_11[i]  = if
                                 (i > 1) then (ad_T3_111[i]+1) * ad_T4_11[i-1] else ad_T3_111[i]+1;
              end for;
              S1 = Vfwdmax * ad_T3_11[NS];

              //S2 = product({rc_S[i].c/KmS[i] + 1 for i in 1:NS});
              S2 = ad_T4_11[NS];

            end BasicIrrReaction;

            partial model BasicRevReaction "basic declaration of a reaction "
              extends BasicIrrReaction;
              //extends BasicReaction;
              extends ADGenKinetics.Interfaces.Reversible.TwoWay;

              Real P1;
              Real P2;

              parameter Units.AffinityConst KmP[NP] = ones(NP)
                "Affinity constants of the product node";

            protected
              parameter Real OOKmP[NP] = {1.0/KmP[i] for i in 1:NP};

              Real[NP] ad_T5_11;
              Real[NP] ad_T5_111;

              Real[NP] ad_T6_11;

            equation
              //P1 = Vbwdmax * product({rc_P[i].c/KmP[i] for i in 1:NP});

              for i in 1:NP loop
                ad_T5_111[i] = rc_P[i].c * OOKmP[i];
                ad_T5_11[i]  = if (i > 1) then ad_T5_111[i] * ad_T5_11[i-1] else ad_T5_111[i];
                ad_T6_11[i]  = if (i > 1) then (ad_T5_111[i]+1) * ad_T6_11[i-1] else ad_T5_111[i]+1;
              end for;
              P1 = Vbwdmax * ad_T5_11[NP];

              //P2 = product({rc_P[i].c/KmP[i] + 1 for i in 1:NP});
              P2 = ad_T6_11[NP];

            end BasicRevReaction;

            class IrrKinetic "S1 + S2 + .. => P1 + P2 + ... "
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.intermidiate.BasicIrrReaction;

            protected
              Real ad_T7_12;

            equation
              1/ad_T7_12 = S2;
              v = S1 * ad_T7_12;

            end IrrKinetic;

            class InhIrrKinetic "S1 + S2 + .. ==I1,I2,..=> P1 + P2 + ... "
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.intermidiate.BasicIrrReaction;
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.intermidiate.ReactionInhibition;

            protected
              Real ad_T8_122;
              Real ad_T8_12;

            equation
              1/ad_T8_122 = S2;
              ad_T8_12 = S1 * ad_T8_122;
              v = I * ad_T8_12;

            end InhIrrKinetic;

            class ActIrrKinetic "S1 + S2 + .. + ==A1,A2,...=> P1 + P2 + ... "
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.intermidiate.BasicIrrReaction;
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.intermidiate.ReactionActivation;

            equation
              v = A * S1 / S2;

            end ActIrrKinetic;

            class ActInhIrrKinetic
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.intermidiate.BasicIrrReaction;
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.intermidiate.ReactionActivation;
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.intermidiate.ReactionInhibition;

            equation
              v = A * I * S1 / S2;

            end ActInhIrrKinetic;

            class RevKinetic "S1 + S2 + ... <===> P1 + P2 + ... "
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.intermidiate.BasicRevReaction;

            protected
              Real ad_D11_12;

            equation
              1/ad_D11_12 = S2 + P2 - 1;
              v = (S1 - P1) * ad_D11_12;
              //v = (S1 - P1) / (S2 + P2 - 1);

            end RevKinetic;

            class InhRevKinetic
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.intermidiate.BasicRevReaction;
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.intermidiate.ReactionInhibition;

            protected
              Real ad_T12_1;

              Real ad_T12_12;

              Real ad_D12_122;

            equation
              1/ad_D12_122 = S2 + P2 - 1;
              ad_T12_12  = (S1-P1) * ad_D12_122;
              v = I * ad_T12_12;

            end InhRevKinetic;

            class ActRevKinetic
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.intermidiate.BasicRevReaction;
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.intermidiate.ReactionActivation;

            equation
              v = A * (S1 - P1) / (S2 + P2 - 1);

            end ActRevKinetic;

            class ActInhRevKinetic
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.intermidiate.BasicRevReaction;
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.intermidiate.ReactionActivation;
              extends
                ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.intermidiate.ReactionInhibition;

            equation
              v = A * I * (S1 - P1) / (S2 + P2 - 1);

            end ActInhRevKinetic;

            annotation (Documentation(info="<html>
<p>This subpackage is exactly like the parent subpackage <a href=\"GenKinetics.Derivatives.Reaction.convenience.dynamic\">GenKinetics.Derivatives.Reaction.convenience.dynamic</a> . The components are simplified, processed in away to make algorithmic differentiation techniques easily applicables. It is useful for testing purposes, to ensure that the deriviated intermidiate formats are correct. </p>
<p><br/>Equations for parameter senstivities are computed by applying algorithmic differentiation techniques on the simplified version of the original part <a href=\"GenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate \">GenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate </a></p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
          end intermidiate;

          partial model ReactionInhibition "Inhibition influencing a reaction"
            //extends intermidiate.ReactionInhibition;

            outer parameter Integer NG "# of gradients";

            parameter Integer NI = 1
              " number of Metabolites inhibiting the reaction";
            ADGenKinetics.Derivatives.Interfaces.ModifierChemicalPort_I mc_I[NI];

            parameter Units.AffinityConst KI[NI] = ones(NI)
              "Affinity constant of the Inhibitors";
            parameter Real[NI,NG] g_KI = zeros(NI,NG);

            Real I "Inhibition term in the corresponding kinetics";
            Real g_I[NG](start=zeros(NG));

          protected
            Real  ad_T2_1[NI];
            Real[NI,NG]  ad_g_T2_1(start=zeros(NI,NG));

            Real  ad_T2_11[NI];
            Real[NI,NG]  ad_g_T2_11(start=zeros(NI,NG));

            Real  ad_D2_112[NI];
            Real[NI,NG]  ad_g_D2_112(start=zeros(NI,NG));

          equation
            //I = product({ KI[i] / (KI[i] + mc_I[i].c) for i in 1:NI});

            for i in 1:NI loop

              ad_D2_112[i] =  1/(KI[i] + mc_I[i].c);
              ad_g_D2_112[i,:]  =  -(g_KI[i,:] + mc_I[i].g_c[:]) * ad_D2_112[i] * ad_D2_112[i];

              ad_T2_11[i] = KI[i] * ad_D2_112[i];
              ad_g_T2_11[i,:] = g_KI[i,:] * ad_D2_112[i] + KI[i] * ad_g_D2_112[i,:];

              ad_T2_1[i] = if (i > 1) then ad_T2_1[i-1] * ad_T2_11[i] else ad_T2_11[i];
              ad_g_T2_1[i,:] = if
                                 (i > 1) then ad_g_T2_1[i-1,:] * ad_T2_11[i] + ad_T2_1[i-1] * ad_g_T2_11[i,:] else ad_g_T2_11[i,:];
            end for;
            I = ad_T2_1[NI];
            g_I[:] = ad_g_T2_1[NI,:];

          end ReactionInhibition;

          partial model BasicReaction "basic declaration of a reaction "
            //extends intermidiate.BasicReaction;
            extends
              ADGenKinetics.Derivatives.Interfaces.dynamic.Dimension.ReactionDimension;

            outer parameter Integer NG "# of gradients";

            // Reaction Rate
            Units.VolumetricReactionRate v;
            Real[NG] g_v(start=zeros(NG));

            // Connections to Substrates and Products
            ADGenKinetics.Derivatives.Interfaces.ChemicalPort_S rc_S[NS]
              "connection to substrates";
            ADGenKinetics.Derivatives.Interfaces.ChemicalPort_P rc_P[NP]
              "connection to product";

          equation
            rc_S[:].r = n_S[:] * v;
            rc_P[:].r = -n_P[:] * v;

            for i in 1:NS loop
              //for j in 1:NG loop
                rc_S[i].g_r[:] = n_S[i] * g_v[:];
              //end for;
            end for;

            for i in 1:NP loop
              for j in 1:NG loop
                rc_P[i].g_r[j] = -n_P[i] * g_v[j];
              end for;
            end for;

          end BasicReaction;

          partial model BasicIrrReaction "basic declaration of a reaction "
            extends BasicReaction;
            extends ADGenKinetics.Derivatives.Interfaces.Reversible.OneWay;

            //extends intermidiate.BasicIrrReaction;
            //outer parameter Integer NG "# of gradients";

            Real S1;
            Real[NG] g_S1(start=zeros(NG));

            Real S2;
            Real[NG] g_S2(start=zeros(NG));

            parameter Units.AffinityConst KmS[NS] = ones(NS)
              "Affinity constants of the substrate nodes";
            parameter Real[NS,NG] g_KmS = zeros(NS,NG);

          //protected
            parameter Real OOKmS[NS] = {1.0/KmS[i] for i in 1:NS};
            parameter Real[NS,NG] g_OOKmS =  { -g_KmS[i,:] * OOKmS[i] * OOKmS[i] for i in 1:NS};

            Real[NS] ad_T3_11;
            Real[NS,NG] ad_g_T3_11(start=zeros(NS,NG));

            Real[NS] ad_T3_111;
            Real[NS,NG] ad_g_T3_111(start=zeros(NS,NG));

            Real[NS] ad_T4_11;
            Real[NS,NG] ad_g_T4_11(start=zeros(NS,NG));

          equation
            //S1 = Vfwdmax * product({rc_S[i].c/KmS[i] for i in 1:NS});

            for i in 1:NS loop
              ad_T3_111[i] = rc_S[i].c * OOKmS[i];
              ad_g_T3_111[i,:] = rc_S[i].g_c[:] * OOKmS[i] + rc_S[i].c * g_OOKmS[i,:];

              ad_T3_11[i]  = if (i > 1) then ad_T3_111[i] * ad_T3_11[i-1] else ad_T3_111[i];
              ad_g_T3_11[i,:]  = if (i > 1) then ad_g_T3_111[i,:] * ad_T3_11[i-1] + ad_T3_111[i] * ad_g_T3_11[i-1,:] else ad_g_T3_111[i,:];

              ad_T4_11[i]  = if (i > 1) then (ad_T3_111[i]+1) * ad_T4_11[i-1] else ad_T3_111[i]+1;
              ad_g_T4_11[i,:]  = if (i > 1) then ad_g_T3_111[i,:] * ad_T4_11[i-1] + (ad_T3_111[i]+1) * ad_g_T4_11[i-1,:] else ad_g_T3_111[i,:];
            end for;

            S1 = Vfwdmax * ad_T3_11[NS];
            g_S1[:] = g_Vfwdmax[:] * ad_T3_11[NS] + Vfwdmax * ad_g_T3_11[NS,:];

            //S2 = product({rc_S[i].c/KmS[i] + 1 for i in 1:NS});
            S2 = ad_T4_11[NS];
            g_S2[:] = ad_g_T4_11[NS,:];

          end BasicIrrReaction;

          partial model BasicRevReaction
            "basic declaration of a reversible reaction "
            extends BasicIrrReaction;
            extends ADGenKinetics.Derivatives.Interfaces.Reversible.TwoWay;

            //extends intermidiate.BasicRevReaction;

            Real P1;
            Real[NG] g_P1(start=zeros(NG));

            Real P2;
            Real[NG] g_P2(start=zeros(NG));

            parameter Units.AffinityConst KmP[NP] = ones(NP)
              "Affinity constants of the substrate nodes";
            parameter Real[NP,NG] g_KmP = zeros(NP,NG);

          protected
            parameter Real OOKmP[NP] = {1.0/KmP[i] for i in 1:NP};
            parameter Real[NP,NG] g_OOKmP =  { -g_KmP[i,:] * OOKmP[i] * OOKmP[i] for i in 1:NP};

            Real[NP] ad_T5_11;
            Real[NP,NG] ad_g_T5_11(start=zeros(NP,NG));

            Real[NP] ad_T5_111;
            Real[NP,NG] ad_g_T5_111(start=zeros(NP,NG));

            Real[NP] ad_T6_11;
            Real[NP,NG] ad_g_T6_11(start=zeros(NP,NG));

          equation
            //S1 = Vfwdmax * product({rc_S[i].c/KmS[i] for i in 1:NS});

            for i in 1:NP loop

              ad_T5_111[i] = rc_P[i].c * OOKmP[i];
              ad_g_T5_111[i,:] = rc_P[i].g_c[:] * OOKmP[i] + rc_P[i].c * g_OOKmP[i,:];

              ad_T5_11[i]  = if (i > 1) then ad_T5_111[i] * ad_T5_11[i-1] else ad_T5_111[i];
              ad_g_T5_11[i,:]  = if (i > 1) then ad_g_T5_111[i,:] * ad_T5_11[i-1] + ad_T5_111[i] * ad_g_T5_11[i-1,:] else ad_g_T5_111[i,:];

              ad_T6_11[i]  = if (i > 1) then (ad_T5_111[i]+1) * ad_T6_11[i-1] else ad_T5_111[i]+1;
              ad_g_T6_11[i,:]  = if (i > 1) then ad_g_T5_111[i,:] * ad_T6_11[i-1] + (ad_T5_111[i]+1) * ad_g_T6_11[i-1,:] else ad_g_T5_111[i,:];
            end for;

            P1 = Vbwdmax * ad_T5_11[NP];
            g_P1[:] = g_Vbwdmax[:] * ad_T5_11[NP] + Vbwdmax * ad_g_T5_11[NP,:];

            P2 = ad_T6_11[NP];
            g_P2[:] = ad_g_T6_11[NP,:];

          end BasicRevReaction;

          class IrrKinetic "S1 + S2 + .. => P1 + P2 + ... "
            extends
              ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.BasicIrrReaction;

            Real ad_T7_12;
            Real[NG] ad_g_T7_12(start=zeros(NG));

          equation
            ad_T7_12 = 1/S2;
            ad_g_T7_12[:] = - g_S2[:] * ad_T7_12 * ad_T7_12;

            v = S1 * ad_T7_12;
            g_v[:] = g_S1[:] * ad_T7_12 + S1 * ad_g_T7_12[:];

          end IrrKinetic;

          class InhIrrKinetic "S1 + S2 + .. ==I1,I2,..=> P1 + P2 + ... "
            extends
              ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.BasicIrrReaction;
            extends
              ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.ReactionInhibition;

            Real ad_T8_122;
            Real[NG] ad_g_T8_122(start=zeros(NG));

            Real ad_T8_12;
            Real[NG] ad_g_T8_12(start=zeros(NG));

          equation
            ad_T8_122 = 1/S2;
            ad_g_T8_122[:] = -g_S2[:]; // * ad_T8_122 * ad_T8_122;

            ad_T8_12 = S1 * ad_T8_122;
            ad_g_T8_12[:] =  g_S1[:] * ad_T8_122 + S1 * ad_g_T8_122[:];

            v = I * ad_T8_12;
            g_v[:] = g_I[:] * ad_T8_12 + I * ad_g_T8_12[:];  // * ad_T8_12 + I * ad_g_T8_12[:];

          end InhIrrKinetic;

          class RevKinetic "S1 + S2 + ... <===> P1 + P2 + ... "
            extends
              ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.BasicRevReaction;

          protected
            Real ad_D11_12;
            Real[NG] ad_g_D11_12(start=zeros(NG));

          equation
            ad_D11_12 = 1 / (S2 + P2 - 1);
            ad_g_D11_12[:] = - (g_S2[:] + g_P2[:]) * ad_D11_12 * ad_D11_12;

            v = (S1 - P1) * ad_D11_12;
            g_v[:] = (g_S1[:] - g_P1[:]) * ad_D11_12 + (S1-P1) * ad_g_D11_12[:];

            //v = (S1 - P1) / (S2 + P2 - 1);

          end RevKinetic;

          class InhRevKinetic
            extends
              ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.BasicRevReaction;
            extends
              ADGenKinetics.Derivatives.Reactions.convenience.dynamic_adtemp.ReactionInhibition;

            //Real ad_T12_1;
            //Real[NG] ad_g_T12_1;

          protected
            Real ad_T12_12;
            Real[NG] ad_g_T12_12(start=zeros(NG));

            Real ad_D12_122;
            Real[NG] ad_g_D12_122(start=zeros(NG));

          equation
            ad_D12_122 = 1 / (S2 + P2 - 1);
            ad_g_D12_122[:] = -(g_S2[:] + g_P2[:]) * ad_D12_122 * ad_D12_122;

            ad_T12_12  = (S1-P1) * ad_D12_122;
            ad_g_T12_12[:] = (g_S1[:] - g_P1[:]) * ad_D12_122 + (S1-P1) * ad_g_D12_122[:];

            v = I * ad_T12_12;
            g_v[:] = g_I[:] * ad_T12_12 + I * ad_g_T12_12[:];

          end InhRevKinetic;
          annotation (Documentation(info="<html>
<p>This subpackage contains components for reactions with arbitrary number of substrates, products and effectors. It is suitable for textual implementation and automatic model generation. Equations for parameter senstivities are computed by applying algorithmic differentiation techniques on the simplified version of the original part <a href=\"GenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate \">GenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate </a>. The main difference between this subpackage and the subpackage GenKinetics.Derivatives.Reactions.convenience.dynamic is that the derivatives of intermidiate variables, carrying out intermidiate computations, are not subject to elemenation.</p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
        end dynamic_adtemp;
        annotation (Documentation(info="<html>
<p>This subpackage contains implementations for convenience kinetics. </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
      end convenience;

      annotation (Documentation(info="<html>
<p>This subpackage contains implementations for reactions using generalized simplified kinetic formats. Currently only convenience kinetics are implemented. </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
    end Reactions;

    package Examples

      model spirallusdyn
        //import GenKinetics.NodeElements.dynamic.*;
        import ADGenKinetics.Derivatives.NodeElements.dynamic.*;
        //import GenKinetics.Reactions.convenience.dynamic.*;
        //import GenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.*;
        import ADGenKinetics.Derivatives.Reactions.convenience.dynamic.*;

        inner parameter Integer NG = 3;
        Node Aex(c_0=1);
        //InhIrrKinetic   vupt(NS=1,NP=1,NI=1,Vfwdmax=1.0,KmS={0.1},KI={3.0});
        InhRevKinetic   vupt(NS=1,NP=1,Vfwdmax=1.0,KmS={0.1},g_Vfwdmax={1,0,0},g_KmS={{0,1,0}},KI={3.0},g_KI={{0,0,1}});
        Node A;

        RevKinetic      v1(NS=1,NP=1,Vfwdmax=3.0,Vbwdmax=1.0,KmS={0.1},KmP={3.0});
        Node B;

        RevKinetic      v5(NS=1,NP=1,Vfwdmax=2.0,Vbwdmax=.5,KmS={1.0},KmP={1.0});
        Node E;

        IrrKinetic     v2(NS=2,NP=1,Vfwdmax=2.5,KmS={0.25,2.0}); // B,E -v2-> C
        Node C;

        InhIrrKinetic   v3(NS=1,NP=2,NI=1,Vfwdmax=2.0,KmS={2.0},KI={0.05});
        Node D;
        Node F;

        InhIrrKinetic   v4(NS=1,NP=2,NI=1,Vfwdmax=3.0,KmS={0.1},KI={1.0});

        IrrKinetic      v6(NS=1,NP=1,Vfwdmax=2.0,KmS={3.0});
        Node Eex;

        IrrKinetic      v7(NS=1,NP=1,Vfwdmax=2.0,KmS={3.0});
        Node Fex;

      equation
        // vupt
        connect(Aex.rc,vupt.rc_S[1]);
        connect(vupt.rc_P[1],A.rc);
        connect(vupt.mc_I[1],A.mc);

        // v1
        connect(A.rc,v1.rc_S[1]);
        connect(v1.rc_P[1],B.rc);

        // v5
        connect(B.rc,v5.rc_S[1]);
        connect(v5.rc_P[1],E.rc);

        // v2
        connect(B.rc,v2.rc_S[1]);
        connect(E.rc,v2.rc_S[2]);
        connect(v2.rc_P[1],C.rc);

        // v3
        connect(C.rc,v3.rc_S[1]);
        connect(v3.rc_P[1],D.rc);
        connect(v3.rc_P[2],F.rc);
        connect(D.mc,v3.mc_I[1]);

        // v4
        connect(D.rc,v4.rc_S[1]);
        connect(v4.rc_P[1],F.rc);
        connect(v4.rc_P[2],E.rc);
        connect(v4.mc_I[1],C.mc);

        // v6
        connect(E.rc,v6.rc_S[1]);
        connect(v6.rc_P[1],Eex.rc);

         // v7
        connect(F.rc,v7.rc_S[1]);
        connect(v7.rc_P[1],Fex.rc);

      end spirallusdyn;

      model spirallusdyn5
        //import GenKinetics.NodeElements.dynamic.*;
        import ADGenKinetics.Derivatives.NodeElements.dynamic.*;
        //import GenKinetics.Reactions.convenience.dynamic.*;
        //import GenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.*;
        import ADGenKinetics.Derivatives.Reactions.convenience.dynamic.*;
        import ADGenKinetics.Derivatives.Functions.*;

        inner parameter Integer NG = 5;
        Node Aex(c_0=1);
        //InhIrrKinetic   vupt(NS=1,NP=1,NI=1,Vfwdmax=1.0,KmS={0.1},KI={3.0});
        InhRevKinetic   vupt(NS=1,NP=1,Vfwdmax=1.0,KmS={0.1},g_Vfwdmax=unitVector(1,5),g_KmS={unitVector(2,5)},KI={3.0},g_KI={unitVector(3,5)});
        Node A;

        RevKinetic      v1(NS=1,NP=1,Vfwdmax=3.0,Vbwdmax=1.0,KmS={0.1},KmP={3.0});
        Node B;

        RevKinetic      v5(NS=1,NP=1,Vfwdmax=2.0,Vbwdmax=.5,KmS={1.0},KmP={1.0});
        Node E;

        IrrKinetic     v2(NS=2,NP=1,Vfwdmax=2.5,KmS={0.25,2.0},g_KmS={{0,0,0,1,0},{0,0,0,0,1}}); // B,E -v2-> C
        Node C;

        InhIrrKinetic   v3(NS=1,NP=2,NI=1,Vfwdmax=2.0,KmS={2.0},KI={0.05});
        Node D;
        Node F;

        InhIrrKinetic   v4(NS=1,NP=2,NI=1,Vfwdmax=3.0,KmS={0.1},KI={1.0});

        IrrKinetic      v6(NS=1,NP=1,Vfwdmax=2.0,KmS={3.0});
        Node Eex;

        IrrKinetic      v7(NS=1,NP=1,Vfwdmax=2.0,KmS={3.0});
        Node Fex;

      equation
        // vupt
        connect(Aex.rc,vupt.rc_S[1]);
        connect(vupt.rc_P[1],A.rc);
        connect(vupt.mc_I[1],A.mc);

        // v1
        connect(A.rc,v1.rc_S[1]);
        connect(v1.rc_P[1],B.rc);

        // v5
        connect(B.rc,v5.rc_S[1]);
        connect(v5.rc_P[1],E.rc);

        // v2
        connect(B.rc,v2.rc_S[1]);
        connect(E.rc,v2.rc_S[2]);
        connect(v2.rc_P[1],C.rc);

        // v3
        connect(C.rc,v3.rc_S[1]);
        connect(v3.rc_P[1],D.rc);
        connect(v3.rc_P[2],F.rc);
        connect(D.mc,v3.mc_I[1]);

        // v4
        connect(D.rc,v4.rc_S[1]);
        connect(v4.rc_P[1],F.rc);
        connect(v4.rc_P[2],E.rc);
        connect(v4.mc_I[1],C.mc);

        // v6
        connect(E.rc,v6.rc_S[1]);
        connect(v6.rc_P[1],Eex.rc);

         // v7
        connect(F.rc,v7.rc_S[1]);
        connect(v7.rc_P[1],Fex.rc);

      end spirallusdyn5;

      model spirallusdynAll "Parameter sensitivities of all parameters"
        //import GenKinetics.NodeElements.dynamic.*;
        import ADGenKinetics.Derivatives.NodeElements.dynamic.*;
        //import GenKinetics.Reactions.convenience.dynamic.*;
        //import GenKinetics.Derivatives.Reactions.convenience.dynamic.intermidiate.*;
        import ADGenKinetics.Derivatives.Reactions.convenience.dynamic.*;
        import ADGenKinetics.Derivatives.Functions.*;

        inner parameter Integer NG = 24;
        Node Aex(c_0=1);
        //InhIrrKinetic   vupt(NS=1,NP=1,NI=1,Vfwdmax=1.0,KmS={0.1},KI={3.0});
        InhRevKinetic   vupt(NS=1,NP=1,
                             Vfwdmax=1.0,  g_Vfwdmax=unitVector(1,NG),
                             KmS={0.1},    g_KmS={unitVector(2,NG)},
                             KI={3.0},     g_KI={unitVector(3,NG)});
        Node A;

        RevKinetic      v1(NS=1,NP=1,
                           Vfwdmax=3.0,    g_Vfwdmax=unitVector(4,NG),
                           Vbwdmax=1.0,    g_Vbwdmax=unitVector(5,NG),
                           KmS={0.1},      g_KmS={unitVector(6,NG)},
                           KmP={3.0},      g_KmP={unitVector(7,NG)});
        Node B;

        RevKinetic      v5(NS=1,NP=1,
                           Vfwdmax=2.0,    g_Vfwdmax=unitVector(8,NG),
                           Vbwdmax=.5,     g_Vbwdmax=unitVector(9,NG),
                           KmS={1.0},      g_KmS={unitVector(10,NG)},
                           KmP={1.0},      g_KmP={unitVector(11,NG)});
        Node E;

        IrrKinetic      v2(NS=2,NP=1,
                          Vfwdmax=2.5,     g_Vfwdmax=unitVector(12,NG),
                          KmS={0.25,2.0},  g_KmS={unitVector(13,NG),unitVector(14,NG)}); // B,E -v2-> C
        Node C;

        InhIrrKinetic   v3(NS=1,NP=2,NI=1,
                           Vfwdmax=2.0,    g_Vfwdmax=unitVector(15,NG),
                           KmS={2.0},      g_KmS={unitVector(16,NG)},
                           KI={0.05},      g_KI={unitVector(17,NG)});
        Node D;
        Node F;

        InhIrrKinetic   v4(NS=1,NP=2,NI=1,
                           Vfwdmax=3.0,    g_Vfwdmax=unitVector(18,NG),
                           KmS={0.1},      g_KmS={unitVector(19,NG)},
                           KI={1.0},       g_KI={unitVector(20,NG)});

        IrrKinetic      v6(NS=1,NP=1,
                           Vfwdmax=2.0,    g_Vfwdmax=unitVector(21,NG),
                           KmS={3.0},      g_KmS={unitVector(22,NG)});
        Node Eex;

        IrrKinetic      v7(NS=1,NP=1,
                           Vfwdmax=2.0,    g_Vfwdmax=unitVector(23,NG),
                           KmS={3.0},      g_KmS={unitVector(24,NG)});
        Node Fex;

      equation
        // vupt
        connect(Aex.rc,vupt.rc_S[1]);
        connect(vupt.rc_P[1],A.rc);
        connect(vupt.mc_I[1],A.mc);

        // v1
        connect(A.rc,v1.rc_S[1]);
        connect(v1.rc_P[1],B.rc);

        // v5
        connect(B.rc,v5.rc_S[1]);
        connect(v5.rc_P[1],E.rc);

        // v2
        connect(B.rc,v2.rc_S[1]);
        connect(E.rc,v2.rc_S[2]);
        connect(v2.rc_P[1],C.rc);

        // v3
        connect(C.rc,v3.rc_S[1]);
        connect(v3.rc_P[1],D.rc);
        connect(v3.rc_P[2],F.rc);
        connect(D.mc,v3.mc_I[1]);

        // v4
        connect(D.rc,v4.rc_S[1]);
        connect(v4.rc_P[1],F.rc);
        connect(v4.rc_P[2],E.rc);
        connect(v4.mc_I[1],C.mc);

        // v6
        connect(E.rc,v6.rc_S[1]);
        connect(v6.rc_P[1],Eex.rc);

         // v7
        connect(F.rc,v7.rc_S[1]);
        connect(v7.rc_P[1],Fex.rc);

      end spirallusdynAll;
      annotation (Documentation(info="<html>
<p>This subpackage contains examples of typical metablic pathway models.</p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
    end Examples;

    package Functions "A collection of functions"
      function unitVector "return a unit vector"
        input Integer ith "ith component is one";
        input Integer n "size of the vector";
        output Real[n] ei;

      algorithm
       for i in 1:n loop
         ei[i] := 0;
       end for;

       ei[ith] := 1.0;

      end unitVector;
    end Functions;
    annotation (Documentation(info="<html>
<p>This subpackage contains of a copy of the whole library. Components describe the original behavior together with parameter sensitivities. </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
  end Derivatives;

  annotation (uses(Modelica(version="3.2")), Documentation(info="<html>
<p>This package contains an implementation of generalized simplified kinetic formats following the guidelines recommended by the <a href=\"https://modelica.org/publications/papers/2005-05-LarsdotterNilsson-Fritzson-BioMedSim2005-MetabolicModeling.pdf\">Biochem library</a>. Matabolic reaction networks can be easily assembled using a few number of reaction kinetics. Constructed models can also be used for computing parameter sensitivities with little modifications to the used interfaces and by initializing the input Jacobian, i.e. the parameters w.r.t. derivatives are sought. </p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2011&GT;-&LT;2012&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>", revisions="<html>
<p>r12: a package for parameter sensitivities inserted</p>
<p>r16: reduced memory required for computing parameter sensitivities </p>
</html>"));
end ADGenKinetics;
