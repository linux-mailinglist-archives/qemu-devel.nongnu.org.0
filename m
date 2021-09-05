Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7BE401249
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 02:58:07 +0200 (CEST)
Received: from localhost ([::1]:41794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN2xa-0008N3-2j
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 20:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thierry.briot@gmail.com>)
 id 1mN0mK-0007i1-PJ
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 18:38:20 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thierry.briot@gmail.com>)
 id 1mN0mI-0008Dw-Hq
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 18:38:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id q26so6030373wrc.7
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 15:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:thread-index:content-language;
 bh=IkzcMBko11xkWwrDNCp8t5KySAbV1jfWPBod9l23VCA=;
 b=pfxNjM16Oi1dTgHz2JIsGgDgNlA/HvTVJmtI31L7Zu1Pm3i+OPkQA14nWGwDtfsjra
 FM8hAGpI6hJuw+kMzwWs65YWPIcKOu+Q7kSqPnTMFjHACdZzBwH3FyucNf/Hv73Z0CRv
 nRYtudsHrmwfUzlrnkN1SaHwYrp4YXcv4DcI92vG3QoQsAlqPfL9Z84aDYrbYPLRFSI9
 dGdKFDECq7K/Ssdjo5+WcDpO5mZh6Ox+ft1hf38cAUAweixnwSXQ2g26T/SgCgn7l9hZ
 HR2aKfjePg9VqV+HFvAvQqMz/cPmg3fLXAKbrK+1qgHXhAwwtLllonWML9gYDoTMiypP
 zOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:thread-index:content-language;
 bh=IkzcMBko11xkWwrDNCp8t5KySAbV1jfWPBod9l23VCA=;
 b=OuunM/6AWsXLgKPL0b+171zNMnx/upazbIY3CwnK3sdfc6BrhOm6kui5wKREXT8BCg
 ktRchYE2dN9J/x/dOkBY0Cbq5IT2GJnR8wS0X+hbt+uiWYKU4twD3i8NgLIt2jYJKWTt
 58VBu0FnyFIOT8yxeZtSM+nYrABREzIBgSU88uqkUzfaQMqgv3cZo3KIUChbEZ0Ed0Vg
 pIUtUvCgcoTNeB9opiC8QGtrHwHqBpRNjzlYtdNyU2MRtrQB/jDGGxjAGvW9hAtLqcPk
 WQ4kHKh28Bag+dFBGZ2JcRbR9TDF0gw73RgQNZ8R1/1LyZf4SIac3VXVDpMSwrIKBitB
 GnzQ==
X-Gm-Message-State: AOAM5302++Lv+Ddy7OGSduO7AMvqkF1LcjAVGWDgecMMpx5n7fiChPHB
 WChnrnCW5vWkQvos8H7zSqY=
X-Google-Smtp-Source: ABdhPJxsPXW6tM4/eTenal1vd2pGEiOoEEguOZKyr9TCFuR0OtuPE8lIXU5Z6bmcG26UmYBMLAr86w==
X-Received: by 2002:a5d:460a:: with SMTP id t10mr10142871wrq.147.1630881496591; 
 Sun, 05 Sep 2021 15:38:16 -0700 (PDT)
Received: from HYPERPC ([2a01:e0a:d:2430:6c92:a83c:a231:ff0b])
 by smtp.gmail.com with ESMTPSA id q13sm5540291wmj.46.2021.09.05.15.38.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 Sep 2021 15:38:16 -0700 (PDT)
From: <thierry.briot@gmail.com>
To: "'Helge Deller'" <deller@gmx.de>,
 "'Richard Henderson'" <richard.henderson@linaro.org>
References: <00d401d7a230$56842630$038c7290$@gmail.com>
 <CAFXwXrmt-u9iO_xY3y=ite1rPsvdm77w_s3Fw1G5C=fag0KP1w@mail.gmail.com>
 <2db9d592-8115-1206-68e4-71a9fd25b45d@gmx.de>
In-Reply-To: <2db9d592-8115-1206-68e4-71a9fd25b45d@gmx.de>
Subject: RE: Virtualizing HP PA-RISC unix station other than B160L
Date: Mon, 6 Sep 2021 00:38:16 +0200
Message-ID: <019301d7a2a6$b853a7c0$28faf740$@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0194_01D7A2B7.7BDDD750"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGUb40gNDzFkIqDggBqBagfozeKvgHOuwqzAlG9rwKr+2IZ8A==
Content-Language: fr
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=thierry.briot@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 05 Sep 2021 20:56:31 -0400
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
Cc: qemu-devel@nongnu.org, 'linux-parisc' <linux-parisc@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multipart message in MIME format.

------=_NextPart_000_0194_01D7A2B7.7BDDD750
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

=20

Thank you for your answers.

First of all, I made a mistake : the HP-UX 10.20 kernel (vmunix) is in =
the /stand (not /boot) filesystem.

I tried replacing /stand of the physical machine iso image with the =
/stand filesytem of the emulated B160L because I supposed that drivers =
are linked with the vmunix kernel. Maybe it's false.=20

Furthermore, the /dev tree is important for dealing with the drivers.

=20

I will continue to search for which files are hardware related. Maybe =
someone has done this research before ?

=20

Best regards,

Thierry

=20

-----Message d'origine-----
De : Helge Deller <deller@gmx.de>=20
Envoy=C3=A9 : dimanche 5 septembre 2021 22:32
=C3=80 : Richard Henderson <richard.henderson@linaro.org>; =
thierry.briot@gmail.com
Cc : qemu-devel@nongnu.org Developers <qemu-devel@nongnu.org>; =
linux-parisc <linux-parisc@vger.kernel.org>
Objet : Re: Virtualizing HP PA-RISC unix station other than B160L

=20

Hi Thierry,

=20

On 9/5/21 3:24 PM, Richard Henderson wrote:

> On Sun, 5 Sep 2021, 10:30 , < =
<mailto:thierry.briot@gmail.com%20%3cmailto:thierry.briot@gmail.com> =
thierry.briot@gmail.com <mailto:thierry.briot@gmail.com>> wrote:

> For my company (Nexter Systems, France), I am using qemu-system-hppa=20

> for virtualizing HP PA-RISC workstations. That works well. You have=20

> made a very good job !

=20

Thanks.

=20

> But my machines are other than B160L (for example B180L), and I have=20

> to completely reinstall HP-UX on each emulated machine.

> If I do an iso system disk image of my B180L, this iso isn't bootable=20

> on qemu-system-hppa.

>=20

> Thus, my questions are :

>=20

> * Is it planned to emulate other HP unix workstations than B160L (for=20

> example B180L) ?

=20

Maybe at some point a 64-bit capable system, e.g. C3000, and maybe an =
older 32-bit system, e.g. 715/64.

For the 64bit system additions to the emulated firmware and additional =
64-bit qemu support is necessary, and for the 715/64 we need an =
additional NCR710 SCSI driver.

Both are lots of work.

=20

The B180L is exactly the same as the B160L, with just a faster CPU:

 <https://www.openpa.net/systems/hp-visualize_b132l_b160l_b180l.html> =
https://www.openpa.net/systems/hp-visualize_b132l_b160l_b180l.html

=20

> * Or, what changes should I make to my iso image to do it usable ? If=20

> I replace the /boot /stand filesystem of the B180L image with the =
B160L one,=20

> I get a kernel panic at boot time.

=20

I don't know HP-UX so well. I could imagine that your physical machines =
have different SCSI controller cards which are used by HP-UX, and which =
aren't emulated in qemu yet. That's maybe why qemu can't boot your =
already installed images.

If you post the output I maybe can give more info.

=20

> Helge is the one that did all the hw support, I just did the CPU.

> There are no real plans to do another machine. I'm not familiar with=20

> the specs between the HP machines to know how much work that would be.

=20

There is a very good overview of the various HP machines at openPA:

 <https://www.openpa.net/systems/> https://www.openpa.net/systems/

=20

Helge


------=_NextPart_000_0194_01D7A2B7.7BDDD750
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Texte brut Car";
	margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.TextebrutCar
	{mso-style-name:"Texte brut Car";
	mso-style-priority:99;
	mso-style-link:"Texte brut";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DFR =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoPlainText>Hi =
everyone,<o:p></o:p></p><p class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p =
class=3DMsoPlainText>Thank you for your answers.<o:p></o:p></p><p =
class=3DMsoPlainText>First of all, I made a mistake : the HP-UX 10.20 =
kernel (vmunix) is in the /stand (not /boot) =
filesystem.<o:p></o:p></p><p class=3DMsoPlainText>I tried replacing =
/stand of the physical machine iso image with the /stand filesytem of =
the emulated B160L because I supposed that drivers are linked with the =
vmunix kernel. Maybe it's false. <o:p></o:p></p><p =
class=3DMsoPlainText><span lang=3DIT>Furthermore, the /dev tree is =
important for dealing with the drivers.<o:p></o:p></span></p><p =
class=3DMsoPlainText><span lang=3DIT><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoPlainText>I will continue to search for which files are =
hardware related. Maybe someone has done this research before =
?<o:p></o:p></p><p class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p =
class=3DMsoPlainText>Best regards,<o:p></o:p></p><p =
class=3DMsoPlainText><span lang=3DIT>Thierry<o:p></o:p></span></p><p =
class=3DMsoPlainText><span lang=3DIT><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoPlainText><span =
style=3D'mso-fareast-language:FR'>-----Message =
d'origine-----<br>De&nbsp;: Helge Deller &lt;deller@gmx.de&gt; =
<br>Envoy=C3=A9&nbsp;: dimanche 5 septembre 2021 22:32<br>=C3=80&nbsp;: =
Richard Henderson &lt;richard.henderson@linaro.org&gt;; =
thierry.briot@gmail.com<br>Cc&nbsp;: qemu-devel@nongnu.org Developers =
&lt;qemu-devel@nongnu.org&gt;; linux-parisc =
&lt;linux-parisc@vger.kernel.org&gt;<br>Objet&nbsp;: Re: Virtualizing HP =
PA-RISC unix station other than B160L</span></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>Hi =
Thierry,<o:p></o:p></p><p class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p =
class=3DMsoPlainText>On 9/5/21 3:24 PM, Richard Henderson =
wrote:<o:p></o:p></p><p class=3DMsoPlainText>&gt; On Sun, 5 Sep 2021, =
10:30 , &lt;<a =
href=3D"mailto:thierry.briot@gmail.com%20%3cmailto:thierry.briot@gmail.co=
m"><span =
style=3D'color:windowtext;text-decoration:none'>thierry.briot@gmail.com =
&lt;mailto:thierry.briot@gmail.com</span></a>&gt;&gt; =
wrote:<o:p></o:p></p><p class=3DMsoPlainText>&gt; For my company (Nexter =
Systems, France), I am using qemu-system-hppa <o:p></o:p></p><p =
class=3DMsoPlainText>&gt; for virtualizing HP PA-RISC workstations. That =
works well. You have <o:p></o:p></p><p class=3DMsoPlainText>&gt; made a =
very good job !<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p =
class=3DMsoPlainText>Thanks.<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>&gt; =
But my machines are other than B160L (for example B180L), and I have =
<o:p></o:p></p><p class=3DMsoPlainText>&gt; to completely reinstall =
HP-UX on each emulated machine.<o:p></o:p></p><p =
class=3DMsoPlainText>&gt; If I do an iso system disk image of my B180L, =
this iso isn't bootable <o:p></o:p></p><p class=3DMsoPlainText>&gt; on =
qemu-system-hppa.<o:p></o:p></p><p =
class=3DMsoPlainText>&gt;<o:p>&nbsp;</o:p></p><p =
class=3DMsoPlainText>&gt; Thus, my questions are :<o:p></o:p></p><p =
class=3DMsoPlainText>&gt;<o:p>&nbsp;</o:p></p><p =
class=3DMsoPlainText>&gt; * Is it planned to emulate other HP unix =
workstations than B160L (for <o:p></o:p></p><p class=3DMsoPlainText>&gt; =
example B180L) ?<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>Maybe =
at some point a 64-bit capable system, e.g. C3000, and maybe an older =
32-bit system, e.g. 715/64.<o:p></o:p></p><p class=3DMsoPlainText>For =
the 64bit system additions to the emulated firmware and additional =
64-bit qemu support is necessary, and for the 715/64 we need an =
additional NCR710 SCSI driver.<o:p></o:p></p><p =
class=3DMsoPlainText>Both are lots of work.<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>The =
B180L is exactly the same as the B160L, with just a faster =
CPU:<o:p></o:p></p><p class=3DMsoPlainText><a =
href=3D"https://www.openpa.net/systems/hp-visualize_b132l_b160l_b180l.htm=
l"><span =
style=3D'color:windowtext;text-decoration:none'>https://www.openpa.net/sy=
stems/hp-visualize_b132l_b160l_b180l.html</span></a><o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>&gt; * =
Or, what changes should I make to my iso image to do it usable ? If =
<o:p></o:p></p><p class=3DMsoPlainText>&gt; I replace the <s>/boot</s> =
/stand filesystem of the B180L image with the B160L one, =
<o:p></o:p></p><p class=3DMsoPlainText>&gt; I get a kernel panic at boot =
time.<o:p></o:p></p><p class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p =
class=3DMsoPlainText>I don't know HP-UX so well. I could imagine that =
your physical machines have different SCSI controller cards which are =
used by HP-UX, and which aren't emulated in qemu yet. That's maybe why =
qemu can't boot your already installed images.<o:p></o:p></p><p =
class=3DMsoPlainText>If you post the output I maybe can give more =
info.<o:p></o:p></p><p class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p =
class=3DMsoPlainText>&gt; Helge is the one that did all the hw support, =
I just did the CPU.<o:p></o:p></p><p class=3DMsoPlainText>&gt; There are =
no real plans to do another machine. I'm not familiar with =
<o:p></o:p></p><p class=3DMsoPlainText>&gt; the specs between the HP =
machines to know how much work that would be.<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>There =
is a very good overview of the various HP machines at =
openPA:<o:p></o:p></p><p class=3DMsoPlainText><a =
href=3D"https://www.openpa.net/systems/"><span =
style=3D'color:windowtext;text-decoration:none'>https://www.openpa.net/sy=
stems/</span></a><o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p =
class=3DMsoPlainText>Helge<o:p></o:p></p></div></body></html>
------=_NextPart_000_0194_01D7A2B7.7BDDD750--


