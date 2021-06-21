Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448C53AF90B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:15:00 +0200 (CEST)
Received: from localhost ([::1]:53114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvT86-0007Pi-Ml
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1lvT6S-0006iK-Of
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:13:16 -0400
Received: from mx1.tachyum.com ([66.160.133.170]:40939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1lvT6Q-0002Ay-Uh
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:13:16 -0400
Received: by mx1.tachyum.com (Postfix, from userid 1000)
 id B24821005693; Mon, 21 Jun 2021 16:13:11 -0700 (PDT)
Received: from THQ-EX1.tachyum.com (unknown [10.7.1.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.tachyum.com (Postfix) with ESMTPS id 32514100D44E
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:13:11 -0700 (PDT)
Received: from THQ-EX3.tachyum.com (10.7.1.26) by THQ-EX1.tachyum.com
 (10.7.1.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 21 Jun
 2021 16:13:11 -0700
Received: from THQ-EX1.tachyum.com (10.7.1.6) by THQ-EX3.tachyum.com
 (10.7.1.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 21 Jun
 2021 16:13:11 -0700
Received: from THQ-EX1.tachyum.com ([10.7.1.6]) by THQ-EX1.tachyum.com
 ([10.7.1.6]) with mapi id 15.01.2176.014; Mon, 21 Jun 2021 16:13:11 -0700
From: Michael Morrell <mmorrell@tachyum.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: Denormal input handling
Thread-Topic: Denormal input handling
Thread-Index: AddSVLVuQ70cTMk8SjeoZZpZvpdwcwUnLwIA
Date: Mon, 21 Jun 2021 23:13:11 +0000
Message-ID: <c021f386dcfb49aca2ab0c01f66bccc2@tachyum.com>
References: <30eafc8be31446f9aecbc40f487467e1@tachyum.com>
In-Reply-To: <30eafc8be31446f9aecbc40f487467e1@tachyum.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.100.197]
Content-Type: multipart/alternative;
 boundary="_000_c021f386dcfb49aca2ab0c01f66bccc2tachyumcom_"
MIME-Version: 1.0
Received-SPF: pass client-ip=66.160.133.170; envelope-from=mmorrell@tachyum.com;
 helo=mx1.tachyum.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

--_000_c021f386dcfb49aca2ab0c01f66bccc2tachyumcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have another couple of thoughts around input denormal handling.

The first is straightforward.  I noticed that the Aarch64 port doesn't repo=
rt input denormals (I could not find any code which sets the IDC bit in the=
 FPSR).  I found code in the arm (not aarch64) port that sets other bits li=
ke IXC, but nothing for IDC.   Is that simply because no one has bothered t=
o add this support?

The second concerns support for cases where multiple exception conditions o=
ccur.   I had originally thought that denormal input handling would be orth=
ogonal to everything else and so a case like "sNaN  + denorm" would set bot=
h the invalid and input denormal flags or "denorm / 0" would set both idivd=
e by zero and input denormal, but I don't think that is true for at least s=
ome architectures.  Perhaps some specialization is needed here?

  Michael

--_000_c021f386dcfb49aca2ab0c01f66bccc2tachyumcom_
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
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I have another couple of thoughts around input denor=
mal handling.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The first is straightforward.&nbsp; I noticed that t=
he Aarch64 port doesn't report input denormals (I could not find any code w=
hich sets the IDC bit in the FPSR).&nbsp; I found code in the arm (not aarc=
h64) port that sets other bits like IXC, but
 nothing for IDC.&nbsp;&nbsp; Is that simply because no one has bothered to=
 add this support?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The second concerns support for cases where multiple=
 exception conditions occur.&nbsp;&nbsp; I had originally thought that deno=
rmal input handling would be orthogonal to everything else and so a case li=
ke &quot;sNaN &nbsp;&#43; denorm&quot; would set both the invalid
 and input denormal flags or &quot;denorm / 0&quot; would set both idivde b=
y zero and input denormal, but I don't think that is true for at least some=
 architectures.&nbsp; Perhaps some specialization is needed here?<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; Michael<o:p></o:p></p>
</div>
</body>
</html>

--_000_c021f386dcfb49aca2ab0c01f66bccc2tachyumcom_--

