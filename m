Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1579169CF14
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 15:11:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU6sO-0002p7-PX; Mon, 20 Feb 2023 09:10:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.apostoliu@cestrin.ro>)
 id 1pU6mZ-0000tE-IQ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 09:04:45 -0500
Received: from mail.cestrin.ro ([213.177.15.195])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.apostoliu@cestrin.ro>)
 id 1pU6mW-0000k7-2R
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 09:04:43 -0500
Received: from localhost (unknown [127.0.0.1])
 by mail.cestrin.ro (Postfix) with ESMTP id E55A9300291
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 14:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cestrin.ro
Received: from mail.cestrin.ro ([127.0.0.1])
 by localhost (mail.cestrin.ro [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HkVbBunk4MtS for <qemu-devel@nongnu.org>;
 Mon, 20 Feb 2023 16:14:12 +0200 (EET)
Received: from C04E02P124API (unknown [192.168.104.15])
 by mail.cestrin.ro (Postfix) with ESMTPSA id 6800D3000D6
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 14:14:12 +0000 (UTC)
From: "Antonio Apostoliu" <antonio.apostoliu@cestrin.ro>
To: <qemu-devel@nongnu.org>
Subject: Power shell with some problems.
Date: Mon, 20 Feb 2023 16:04:31 +0200
Message-ID: <000001d94534$41461c30$c3d25490$@cestrin.ro>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0001_01D94545.04D04BC0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdlFM+tmIWCRBL33S8iEx0ezYvxYdw==
Content-Language: en-us
X-Antivirus: Avast (VPS 230220-0, 20/2/2023), Outbound message
X-Antivirus-Status: Clean
Received-SPF: none client-ip=213.177.15.195;
 envelope-from=antonio.apostoliu@cestrin.ro; helo=mail.cestrin.ro
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_REMOTE_IMAGE=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Feb 2023 09:10:28 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multipart message in MIME format.

------=_NextPart_000_0001_01D94545.04D04BC0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello

  You are so kind to look at next listing.

Where I wrong?

 

Best regards.

 

PS F:\step> $PSVersionTable

Name                           Value

----                           -----

PSVersion                      7.3.2

PSEdition                      Core

GitCommitId                    7.3.2

OS                             Microsoft Windows 10.0.19045

Platform                       Win32NT

PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0.}

PSRemotingProtocolVersion      2.3

SerializationVersion           1.1.0.1

WSManStackVersion              3.0

PS F:\step>dir

    Directory: F:\step

Mode                 LastWriteTime         Length Name

----                 -------------         ------ ----

d----           2/10/2023 12:00 PM                qemu

-a---           2/20/2023  3:05 PM      369754112 d.qcow2

-a---           2/20/2023  2:48 PM           1263 reset_vm.ps1

-a---           2/20/2023  3:23 PM            552 start.bat

PS F:\step> type .\start.bat

@echo off

set portqmp=4444

set em64w=qemu-system-x86_64w.exe

set "arg_c1=-accel whpx -k us -m 952 -M q35 -smp 1 -no-reboot -no-shutdown
-nographic"

set "arg_c2=-parallel none -serial none -rtc base=localtime,clock=host"

set "arg_c=%arg_c1% %arg_c2%"

set "arg_m=%arg_c% -nic user"

set "arg_u=-qmp tcp:localhost:%portqmp%,server,wait=off"

set "arg=%arg_m% %arg_u%"

for %%i in ("%~dp0.") do SET "mypath=%%~fi"

set "subdirector_qemu=qemu"

set "locatie_qemu=%mypath%\%subdirector_qemu%"

set "qm=%locatie_qemu%\%em64w%"

start "" %qm%  -hda d.qcow2 %arg%

PS F:\step> type .\reset_vm.ps1

$LoginParameters1 = @{

    Uri             = 'http://localhost:4444'

    SessionVariable = 'Session'

    Method          = 'POST'

    ContentType     = "application/json"

    Body            = @{

          "execute"= "qmp_capabilities"

        }

}

$LoginParameters2 = @{

    Method          = 'POST'

    ContentType     = "application/json"

    Body            = @{

         "execute"= "send-key"

         "arguments"= @{

                      "keys"= @(

                                 @{

                                   "type" = "qcode"

                                    "data" = "ctrl"

                                  }

                                @{

                                   "type" = "qcode"

                                   "data" = "alt"

                                 },

                               @{

                                   "type" = "qcode"

                                   "data" = "delete"

                                }

                             )

                    }

        }

}

$LoginResponse = Invoke-WebRequest @LoginParameters1

$ProfileResponse = Invoke-WebRequest 'http://localhost:4444' -WebSession
$Session @LoginParameters2

PS F:\step> .\start.bat

PS F:\step> Start-Sleep -Seconds 60

PS F:\step> .\reset_vm.ps1

Invoke-WebRequest: F:\step\reset_vm.ps1:40

Line |

  40 |  $LoginResponse = Invoke-WebRequest @LoginParameters1

     |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

     | Received an invalid status line: '{"QMP": {"version": {"qemu":
{"micro": 0, "minor": 2, "major": 7},

     | "package": "v7.2.0-11948-ge6523b71fc-dirty"}, "capabilities":
["oob"]}}'.

Invoke-WebRequest: F:\step\reset_vm.ps1:41

Line |

  41 |  . eResponse = Invoke-WebRequest 'http://localhost:4444' -WebSession
$Se .

     |
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

     | Received an invalid status line: '{"QMP": {"version": {"qemu":
{"micro": 0, "minor": 2, "major": 7},

     | "package": "v7.2.0-11948-ge6523b71fc-dirty"}, "capabilities":
["oob"]}}'.

PS F:\step>



-- 
This email has been checked for viruses by Avast antivirus software.
www.avast.com
------=_NextPart_000_0001_01D94545.04D04BC0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><meta http-equiv=3DContent-Type content=
=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=3D"Micros=
oft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
=2EMsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-GB link=3D"#0563C1=
" vlink=3D"#954F72"><div class=3DWordSection1><p class=3DMsoNormal>Hello<o:=
p></o:p></p><p class=3DMsoNormal>&nbsp; You are so kind to look at next lis=
ting.<o:p></o:p></p><p class=3DMsoNormal> Where I wrong?<o:p></o:p></p><p c=
lass=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Best regards.<o:=
p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>=
PS F:\step&gt; $PSVersionTable<o:p></o:p></p><p class=3DMsoNormal>Name&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; Value<o:p></o:p></p><p class=3DMsoNormal>----&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -----<o:p></o:p></p><=
p class=3DMsoNormal>PSVersion&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; 7.3.2<o:p></o:p></p><p class=3DMsoNormal>PSEdition&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Core<o:p></o:p></p><p class=3DMsoNormal>Gi=
tCommitId&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7.3.2<o:p></o:p></p><p cla=
ss=3DMsoNormal>OS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Microsoft Windows 10.0.19045<o:p></o:p>=
</p><p class=3DMsoNormal>Platform&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; Win32NT<o:p></o:p></p><p class=3DMsoNormal>PSCompatibleVers=
ions&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {1.0, 2.0,=
 3.0, 4.0&#8230;}<o:p></o:p></p><p class=3DMsoNormal>PSRemotingProtocolVers=
ion&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.3<o:p></o:p></p><p class=3DMsoNormal>Se=
rializationVersion&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 1.1.0.1<o:p></o:p></p><p class=3DMsoNormal>WSManStackVersion&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.0<o:p=
></o:p></p><p class=3DMsoNormal>PS F:\step&gt;dir<o:p></o:p></p><p class=3D=
MsoNormal>&nbsp;&nbsp;&nbsp; Directory: F:\step<o:p></o:p></p><p class=3DMs=
oNormal>Mode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LastWriteTime&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; Length Name<o:p></o:p></p><p class=3DMsoNormal>----&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; -------------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ------ ----<o:p></o:p></p><p class=3DMsoNormal>d----&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2/10/2023 12:00 PM&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; qemu<o:p></o:p></p><p class=3DMsoNormal>-a---&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2/20/2023&nbsp; 3:05 PM&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 369754112 d.qcow2<o:p></o:p></p><p class=3DMsoNormal>-a---&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2/20/2023&nbsp; 2:=
48 PM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1263 rese=
t_vm.ps1<o:p></o:p></p><p class=3DMsoNormal>-a---&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2/20/2023&nbsp; 3:23 PM&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 552 start.bat<o:p></o:p><=
/p><p class=3DMsoNormal>PS F:\step&gt; type .\start.bat<o:p></o:p></p><p cl=
ass=3DMsoNormal>@echo off<o:p></o:p></p><p class=3DMsoNormal>set portqmp=3D=
4444<o:p></o:p></p><p class=3DMsoNormal>set em64w=3Dqemu-system-x86_64w.exe=
<o:p></o:p></p><p class=3DMsoNormal>set &quot;arg_c1=3D-accel whpx -k us -m=
 952 -M q35 -smp 1 -no-reboot -no-shutdown -nographic&quot;<o:p></o:p></p><=
p class=3DMsoNormal>set &quot;arg_c2=3D-parallel none -serial none -rtc bas=
e=3Dlocaltime,clock=3Dhost&quot;<o:p></o:p></p><p class=3DMsoNormal>set &qu=
ot;arg_c=3D%arg_c1% %arg_c2%&quot;<o:p></o:p></p><p class=3DMsoNormal>set &=
quot;arg_m=3D%arg_c% -nic user&quot;<o:p></o:p></p><p class=3DMsoNormal>set=
 &quot;arg_u=3D-qmp tcp:localhost:%portqmp%,server,wait=3Doff&quot;<o:p></o=
:p></p><p class=3DMsoNormal>set &quot;arg=3D%arg_m% %arg_u%&quot;<o:p></o:p=
></p><p class=3DMsoNormal>for %%i in (&quot;%~dp0.&quot;) do SET &quot;mypa=
th=3D%%~fi&quot;<o:p></o:p></p><p class=3DMsoNormal>set &quot;subdirector_q=
emu=3Dqemu&quot;<o:p></o:p></p><p class=3DMsoNormal>set &quot;locatie_qemu=
=3D%mypath%\%subdirector_qemu%&quot;<o:p></o:p></p><p class=3DMsoNormal>set=
 &quot;qm=3D%locatie_qemu%\%em64w%&quot;<o:p></o:p></p><p class=3DMsoNormal=
>start &quot;&quot; %qm%&nbsp; -hda d.qcow2 %arg%<o:p></o:p></p><p class=3D=
MsoNormal>PS F:\step&gt; type .\reset_vm.ps1<o:p></o:p></p><p class=3DMsoNo=
rmal>$LoginParameters1 =3D @{<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbs=
p;&nbsp; Uri&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =3D 'http://localhost:4444'<o:p></o:p></p><p class=3DMsoNormal>&n=
bsp;&nbsp;&nbsp; SessionVariable =3D 'Session'<o:p></o:p></p><p class=3DMso=
Normal>&nbsp;&nbsp;&nbsp; Method&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; =3D 'POST'<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp=
; ContentType&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;application/json&quot;<o:p>=
</o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp; Body&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D @{<o:p></o:p></p><p class=
=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;e=
xecute&quot;=3D &quot;qmp_capabilities&quot;<o:p></o:p></p><p class=3DMsoNo=
rmal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p><p class=3D=
MsoNormal>}<o:p></o:p></p><p class=3DMsoNormal>$LoginParameters2 =3D @{<o:p=
></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp; Method&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D 'POST'<o:p></o:p></p><p class=3DMs=
oNormal>&nbsp;&nbsp;&nbsp; ContentType&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;ap=
plication/json&quot;<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp; =
Body&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
@{<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;execute&quot;=3D &quot;send-key&quot;<o:p></o:p></p><p cl=
ass=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;argu=
ments&quot;=3D @{<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;keys&quot;=3D @(<o:p></o:p></p><p class=
=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@{<o:p></o:p></p><p=
 class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
quot;type&quot; =3D &quot;qcode&quot;<o:p></o:p></p><p class=3DMsoNormal>&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;data&quot;=
 =3D &quot;ctrl&quot;<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @{<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;type&quot; =3D &quot;=
qcode&quot;<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;data&quot; =3D &quot;alt&quot;<o:p></o:p><=
/p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p><=
/o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @{<o:p></o:p><=
/p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;type&quot; =3D &quot;qcode&quot;<o:p></o:p></p><p class=3DMsoNorm=
al>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;data&quot; =
=3D &quot;delete&quot;<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 )<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; }<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<o:p></o:p></p><p class=3DMsoNormal>}<o:p></o:p></p><p class=3DMso=
Normal>$LoginResponse =3D Invoke-WebRequest @LoginParameters1<o:p></o:p></p=
><p class=3DMsoNormal>$ProfileResponse =3D Invoke-WebRequest 'http://localh=
ost:4444' -WebSession $Session @LoginParameters2<o:p></o:p></p><p class=3DM=
soNormal>PS F:\step&gt; .\start.bat<o:p></o:p></p><p class=3DMsoNormal>PS F=
:\step&gt; Start-Sleep -Seconds 60<o:p></o:p></p><p class=3DMsoNormal>PS F:=
\step&gt; .\reset_vm.ps1<o:p></o:p></p><p class=3DMsoNormal>Invoke-WebReque=
st: F:\step\reset_vm.ps1:40<o:p></o:p></p><p class=3DMsoNormal>Line |<o:p><=
/o:p></p><p class=3DMsoNormal>&nbsp; 40 |&nbsp; $LoginResponse =3D Invoke-W=
ebRequest @LoginParameters1<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;=
&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp; | Rece=
ived an invalid status line: '{&quot;QMP&quot;: {&quot;version&quot;: {&quo=
t;qemu&quot;: {&quot;micro&quot;: 0, &quot;minor&quot;: 2, &quot;major&quot=
;: 7},<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp; | &quot;=
package&quot;: &quot;v7.2.0-11948-ge6523b71fc-dirty&quot;}, &quot;capabilit=
ies&quot;: [&quot;oob&quot;]}}'.<o:p></o:p></p><p class=3DMsoNormal>Invoke-=
WebRequest: F:\step\reset_vm.ps1:41<o:p></o:p></p><p class=3DMsoNormal>Line=
 |<o:p></o:p></p><p class=3DMsoNormal>&nbsp; 41 |&nbsp; &#8230; eResponse =
=3D Invoke-WebRequest 'http://localhost:4444' -WebSession $Se &#8230;<o:p><=
/o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<o:p></o:p></p><p cla=
ss=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp; | Received an invalid status line: =
'{&quot;QMP&quot;: {&quot;version&quot;: {&quot;qemu&quot;: {&quot;micro&qu=
ot;: 0, &quot;minor&quot;: 2, &quot;major&quot;: 7},<o:p></o:p></p><p class=
=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp; | &quot;package&quot;: &quot;v7.2.0-1=
1948-ge6523b71fc-dirty&quot;}, &quot;capabilities&quot;: [&quot;oob&quot;]}=
}'.<o:p></o:p></p><p class=3DMsoNormal>PS F:\step&gt;<o:p></o:p></p></div><=
div id=3D"DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2"><br /><table style=3D"borde=
r-top: 1px solid #D3D4DE;"><tr><td style=3D"width: 55px; padding-top: 13px;=
"><a href=3D"https://www.avast.com/sig-email?utm_medium=3Demail&utm_source=
=3Dlink&utm_campaign=3Dsig-email&utm_content=3Demailclient" target=3D"_blan=
k"><img src=3D"https://s-install.avcdn.net/ipm/preview/icons/icon-envelope-=
tick-round-orange-animated-no-repeat-v1.gif" alt=3D"" width=3D"46" height=
=3D"29" style=3D"width: 46px; height: 29px;"/></a></td><td style=3D"width: =
470px; padding-top: 12px; color: #41424e; font-size: 13px; font-family: Ari=
al, Helvetica, sans-serif; line-height: 18px;">Virus-free.<a href=3D"https:=
//www.avast.com/sig-email?utm_medium=3Demail&utm_source=3Dlink&utm_campaign=
=3Dsig-email&utm_content=3Demailclient" target=3D"_blank" style=3D"color: #=
4453ea;">www.avast.com</a></td></tr></table><a href=3D"#DAB4FAD8-2DD7-40BB-=
A1B8-4E2AA1F9FDF2" width=3D"1" height=3D"1"> </a></div></body></html>
------=_NextPart_000_0001_01D94545.04D04BC0--


