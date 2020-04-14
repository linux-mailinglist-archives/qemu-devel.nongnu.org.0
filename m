Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0737F1A7A88
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 14:18:37 +0200 (CEST)
Received: from localhost ([::1]:59368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOKWR-00038B-TK
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 08:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59518)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <janine.schneider@fau.de>) id 1jOKSQ-0001C7-5S
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 08:14:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <janine.schneider@fau.de>) id 1jOKSN-0006vt-Cj
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 08:14:25 -0400
Received: from mx-rz-1.rrze.uni-erlangen.de ([2001:638:a000:1025::14]:33165)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <janine.schneider@fau.de>)
 id 1jOKSM-0006qn-Oc
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 08:14:23 -0400
Received: from mx-rz-smart.rrze.uni-erlangen.de
 (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 491ktV6112z8wHD
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 14:14:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2013;
 t=1586866450; bh=zBH4o9IAALN9vkq22tVw5nGIbbWu5FLul/BqsKktwsw=;
 h=From:To:Subject:Date:From:To:CC:Subject;
 b=NggB2PrP8+uiUyTnB12JNvrEMI6v8aRrYPWT5MMK96EjUGYPTzHj+R1Dcji+vtuo/
 7FU17BZ3WXxCHxPAgqS6oXTt/Ots0u4ZVByq67YcJWa4GkrfDuuNH/6lvNoV67VugE
 u38EPT14RhwxCJiIZoV9fLVyBtGE0PvUb4/0T8Qr7UvRNf/HUWIb0QNe9khV+0N0G3
 PeWOPFJD2/7UAMrZQlDXg2jxDprCvjSSk8VrH5wuCllT2vgRn4VX/1G6lOln3K7nDD
 7sBzOm1fzwC/OAP9tUVRgSGzmAYwPtgiA4+vXCnRpiJd5n+OxXou2btBLEmWZwgZlU
 IxnzL7xo1Jpzw==
X-Virus-Scanned: amavisd-new at boeck5.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 88.66.227.183
Received: from LenovoJS (dslb-088-066-227-183.088.066.pools.vodafone-ip.de
 [88.66.227.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: U2FsdGVkX188g9ktEnD8S2ZrKX4zrWcDHoZu96c0whw=)
 by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 491ktS0cX0z8w4D
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 14:14:08 +0200 (CEST)
From: <janine.schneider@fau.de>
To: <qemu-devel@nongnu.org>
Subject: Integration of qemu-img
Date: Tue, 14 Apr 2020 14:14:12 +0200
Message-ID: <00fc01d61256$35f849c0$a1e8dd40$@fau.de>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_00FD_01D61266.F9822B30"
X-Mailer: Microsoft Outlook 16.0
Content-Language: de
Thread-Index: AdYSVTW7FzVHxuDXT/GYkIlVU1dP0A==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:638:a000:1025::14
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

This is a multipart message in MIME format.

------=_NextPart_000_00FD_01D61266.F9822B30
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear Sir or Madam,

=20

I am a PhD student at the Friedrich-Alexander-University =
Erlangen-N=FCrnberg
in Bavaria Germany and I am currently working on an open-source forensic
analysis tool. I would like to use qemu-img for converting virtual discs =
to
raw files and to get virtual disc information. By now I tried to create =
a
qemu-img DLL with the qemu source code you provide on your website, but =
I am
unable to compile it properly. Therefore, I would like to ask you if =
there
is a simple solution to integrate qemu-img to other C++ projects? Or is
there a precompiled qemu-img DLL which I could use? Thank you very much =
for
your support.

=20

Best,

Janine Schneider

=20


------=_NextPart_000_00FD_01D61266.F9822B30
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1"><meta name=3DGenerator content=3D"Microsoft Word =
15 (filtered medium)"><style><!--
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
span.E-MailFormatvorlage17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
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
</o:shapelayout></xml><![endif]--></head><body lang=3DDE =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>Dear Sir<span lang=3DEN-US> or</span><span =
lang=3DEN-US> </span>Madam,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><span =
lang=3DEN-US>I am a PhD student at the Friedrich-Alexander-University =
Erlangen-N=FCrnberg in Bavaria Germany and I am currently working on an =
open-source forensic analysis tool. I would like to use qemu-img for =
converting virtual discs to raw files and to get virtual disc =
information. By now I tried to create a qemu-img DLL with the qemu =
source code you provide on your website, but I am unable to compile it =
properly. Therefore, I would like to ask you if there is a simple =
solution to integrate qemu-img to other C++ projects? Or is there a =
precompiled qemu-img DLL which I could use? Thank you very much for your =
support.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'mso-fareast-language:DE'>Best,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'mso-fareast-language:DE'>Janine =
Schneider<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p></div></body></html>
------=_NextPart_000_00FD_01D61266.F9822B30--


