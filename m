Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC2350A0C7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 15:25:33 +0200 (CEST)
Received: from localhost ([::1]:46338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhWoO-0008Hd-Gt
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 09:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.reither@thalesgroup.com>)
 id 1nhSds-0003pV-QM
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 04:58:24 -0400
Received: from thsbbfxrt01p.thalesgroup.com ([192.54.144.131]:50204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.reither@thalesgroup.com>)
 id 1nhSdq-0004at-B8
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 04:58:24 -0400
Received: from thsbbfxrt01p.thalesgroup.com (localhost [127.0.0.1])
 by localhost (Postfix) with SMTP id 4KkWfD0lrDz45hv
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 10:58:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thalesgroup.com;
 s=xrt20181201; t=1650531492;
 bh=Pqy7tN8S1xAaVy4xLvWATkWivka2KUL4ad0B1GEo+Js=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:From;
 b=d38oskwGW/ZoSu15UXirbxV2QoVG+ZxN5Dfh02zh6CeXX9wbWjnCMIlZShShbL1DF
 YniYaM8/jT4U1Tr6iIeThvo4rUlcKo62ZSwcjXR7/K5hLKw4X4f1DCh5bf7zwXTh26
 c5i5RkllAcqhyzNA4/r/jO/LOsRekxHAHKduqKGNI3B6ACP070Keq2InAiyonzo9wm
 5xgvFyiB+wyBI3cFsXzdT2zUYhCARODuPCC+Odv59XCTLCjZ9hdAH/YsB4tHPHTi0o
 B18/W8bgPhX0F5WT2NlFPXyTaoioiU3k/jz7FP2l5BuxHjAVAAqR7+/P07y6aeU+Hs
 8IoXr1hn5BCqg==
From: REITHER Robert <robert.reither@thalesgroup.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Q: TX (THR) throttling for serial interface?
Thread-Topic: Q: TX (THR) throttling for serial interface?
Thread-Index: AdhVXXZQcia7DCw6QumudAtIe19Dgw==
Date: Thu, 21 Apr 2022 08:58:10 +0000
Message-ID: <786c5881f7044c689837cf61054a71dd@thalesgroup.com>
Accept-Language: de-AT, en-US, fr-FR
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-pmwin-version: 4.0.3, Antivirus-Engine: 3.84.0, Antivirus-Data: 5.91
Content-Type: multipart/alternative;
 boundary="_000_786c5881f7044c689837cf61054a71ddthalesgroupcom_"
MIME-Version: 1.0
Received-SPF: pass client-ip=192.54.144.131;
 envelope-from=robert.reither@thalesgroup.com;
 helo=thsbbfxrt01p.thalesgroup.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 21 Apr 2022 09:20:42 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_786c5881f7044c689837cf61054a71ddthalesgroupcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

ich have (realtime) problems in a QEMU client, spending too  much time with=
 the serial IRQ (INT 4) while sending massive data over the serial interfac=
e (sttyS0)
I've found out that IRQ loops as long as there is send data available (LSR_=
THRE always 1, IIR_THRI always 1), which can lead to up to 1s IRQ time in m=
y case.
QEMU always drains the TX FIFO at once and will only set the UART register =
bits afterwards.

My Linux console is using serial interface(because we use the same image on=
 real hardware as also for the qemu client).

In very old QEMU code I found the method to throttle the TX int (THROTTLE_T=
X_INTERVAL) to probably avoid this behavior.
https://code.grnet.gr/projects/qemu/repository/revisions/6936bfe514bbac7af4=
b24fad9ed9688b78b5be69/entry/hw/serial.c

Is there a way to do something similar in actual QEMU code (setting TX dela=
y timer)?
Or should I just try to switch to virtio_console?

Thank you
Robert

--_000_786c5881f7044c689837cf61054a71ddthalesgroupcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
span.E-MailFormatvorlage17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE-AT" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ich have (realtime) problems in=
 a QEMU client, spending too&nbsp; much time with the serial IRQ (INT 4) wh=
ile sending massive data over the serial interface (sttyS0)<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I&#8217;ve found out that IRQ l=
oops as long as there is send data available (LSR_THRE always 1, IIR_THRI a=
lways 1), which can lead to up to 1s IRQ time in my case.<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">QEMU always drains the TX FIFO =
at once and will only set the UART register bits afterwards.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">My Linux console is using seria=
l interface(because we use the same image on real hardware as also for the =
qemu client).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">In very old QEMU code I found t=
he method to throttle the TX int (THROTTLE_TX_INTERVAL) to probably avoid t=
his behavior.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://code.grnet.g=
r/projects/qemu/repository/revisions/6936bfe514bbac7af4b24fad9ed9688b78b5be=
69/entry/hw/serial.c">https://code.grnet.gr/projects/qemu/repository/revisi=
ons/6936bfe514bbac7af4b24fad9ed9688b78b5be69/entry/hw/serial.c</a><o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is there a way to do something =
similar in actual QEMU code (setting TX delay timer)?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Or should I just try to switch =
to virtio_console?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Robert<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_786c5881f7044c689837cf61054a71ddthalesgroupcom_--

