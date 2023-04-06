Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D5A6D8EDF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 07:39:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkIKI-0007zf-5S; Thu, 06 Apr 2023 01:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.apostoliu@cestrin.ro>)
 id 1pkIKF-0007zT-4U
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 01:38:23 -0400
Received: from mail.cestrin.ro ([89.42.116.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.apostoliu@cestrin.ro>)
 id 1pkIKC-0004Hg-HC
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 01:38:22 -0400
Received: from localhost (unknown [127.0.0.1])
 by mail.cestrin.ro (Postfix) with ESMTP id 2924E300340
 for <qemu-devel@nongnu.org>; Thu,  6 Apr 2023 05:50:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cestrin.ro
Received: from mail.cestrin.ro ([127.0.0.1])
 by localhost (mail.cestrin.ro [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Yz2htQiU07m for <qemu-devel@nongnu.org>;
 Thu,  6 Apr 2023 08:50:27 +0300 (EEST)
Received: from C04E02P124API (unknown [192.168.104.15])
 by mail.cestrin.ro (Postfix) with ESMTPSA id 17E793000EA
 for <qemu-devel@nongnu.org>; Thu,  6 Apr 2023 05:50:27 +0000 (UTC)
From: "Antonio Apostoliu" <antonio.apostoliu@cestrin.ro>
To: <qemu-devel@nongnu.org>
Subject: Please help me with with one information
Date: Thu, 6 Apr 2023 08:38:14 +0300
Message-ID: <000001d96849$fb7d3b50$f277b1f0$@cestrin.ro>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0001_01D96863.20CAC170"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdloSK9oWz2igEAIQ3y28n7tsAXeEg==
Content-Language: en-us
X-Antivirus: Avast (VPS 230405-14, 5/4/2023), Outbound message
X-Antivirus-Status: Clean
Received-SPF: none client-ip=89.42.116.26;
 envelope-from=antonio.apostoliu@cestrin.ro; helo=mail.cestrin.ro
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_40=-0.001, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_REMOTE_IMAGE=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

------=_NextPart_000_0001_01D96863.20CAC170
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello 

 

You are so kind to tell me how can I use qmp to send colon character . I
speak about this character   :

 

I tried:

{"execute":"send-key","arguments":{"keys":[{"type":"qcode","data":"shift-sem
icolon"}]}}

{"execute":"send-key","arguments":{"keys":[{"type":"qcode","data":"shift","d
ata":"semicolon"}]}}

 

Both don't sent the character in my case

All others character worked

 

Best regards

 

 



-- 
This email has been checked for viruses by Avast antivirus software.
www.avast.com
------=_NextPart_000_0001_01D96863.20CAC170
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
" vlink=3D"#954F72"><div class=3DWordSection1><p class=3DMsoNormal><span la=
ng=3DEN-US>Hello <o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN=
-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal style=3D'text-indent:.=
5in'><span lang=3DEN-US>You are so kind to tell me how can I use qmp to sen=
d colon character . I speak about this character&nbsp;&nbsp; :<o:p></o:p></=
span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-US>I tried:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>{&quot;execute&quot;:&quot;send-key&qu=
ot;,&quot;arguments&quot;:{&quot;keys&quot;:[{&quot;type&quot;:&quot;qcode&=
quot;,&quot;data&quot;:&quot;shift-semicolon&quot;}]}}<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-US>{&quot;execute&quot;:&quot;send-ke=
y&quot;,&quot;arguments&quot;:{&quot;keys&quot;:[{&quot;type&quot;:&quot;qc=
ode&quot;,&quot;data&quot;:&quot;shift&quot;,&quot;data&quot;:&quot;semicol=
on&quot;}]}}<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal style=3D'text-indent:.5in'>=
<span lang=3DEN-US>Both don&#8217;t sent the character in my case<o:p></o:p=
></span></p><p class=3DMsoNormal style=3D'text-indent:.5in'><span lang=3DEN=
-US>All others character worked<o:p></o:p></span></p><p class=3DMsoNormal><=
span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span la=
ng=3DEN-US>Best regards<o:p></o:p></span></p><p class=3DMsoNormal><span lan=
g=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-=
US><o:p>&nbsp;</o:p></span></p></div><div id=3D"DAB4FAD8-2DD7-40BB-A1B8-4E2=
AA1F9FDF2"><br /><table style=3D"border-top: 1px solid #D3D4DE;"><tr><td st=
yle=3D"width: 55px; padding-top: 13px;"><a href=3D"https://www.avast.com/si=
g-email?utm_medium=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-email&utm_c=
ontent=3Demailclient" target=3D"_blank"><img src=3D"https://s-install.avcdn=
=2Enet/ipm/preview/icons/icon-envelope-tick-round-orange-animated-no-repeat=
-v1.gif" alt=3D"" width=3D"46" height=3D"29" style=3D"width: 46px; height: =
29px;"/></a></td><td style=3D"width: 470px; padding-top: 12px; color: #4142=
4e; font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height=
: 18px;">Virus-free.<a href=3D"https://www.avast.com/sig-email?utm_medium=
=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-email&utm_content=3Demailclie=
nt" target=3D"_blank" style=3D"color: #4453ea;">www.avast.com</a></td></tr>=
</table><a href=3D"#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2" width=3D"1" heigh=
t=3D"1"> </a></div></body></html>
------=_NextPart_000_0001_01D96863.20CAC170--


