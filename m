Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1931344DBF9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 20:13:01 +0100 (CET)
Received: from localhost ([::1]:38112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlFVL-0007to-Ny
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 14:12:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mlFU7-0007DY-Ij
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 14:11:43 -0500
Received: from [2607:f8b0:4864:20::736] (port=45667
 helo=mail-qk1-x736.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mlFU5-0004nb-Do
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 14:11:43 -0500
Received: by mail-qk1-x736.google.com with SMTP id d2so1862831qki.12
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 11:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:date:from:subject:thread-topic:in-reply-to:message-id
 :references:to:cc:content-transfer-encoding;
 bh=40psO49aEbAyKCgCs8y8rUw0kxOHQeZ1SyNXvGDIZxs=;
 b=wAV8oxrWse+0cDoFviOSAjLGvHspe4rba25v6Jgy3HIbT1b3kdz5ngR3BV2iu7nKZv
 iSpGz+WK/hx/2O7txMBAYp5rQavscBLV8i5zj7Lg9H/AtZotqgsKFslXErgsIvtDHNdT
 celSsxzlPDvbotvpTjxzyW0/5eC1RlRKG86z+QIoZ8F23uYY8+AYJl7jC9Yny0iEtfjz
 Z0EJpM0i+K3l12atMlzAauwDoBkixJFzHFPnHVbP+JH3Dq9PudFVrOgucHykBZ/G2osj
 P0Jt5rgxJAW2P4v3xfklvN74oCsPgj/xJiwpkXYuOMuT1E+iveTLGNyGQqF0B/iGkcg8
 t2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:from:subject:thread-topic
 :in-reply-to:message-id:references:to:cc:content-transfer-encoding;
 bh=40psO49aEbAyKCgCs8y8rUw0kxOHQeZ1SyNXvGDIZxs=;
 b=dMNrAt4Pl0/CjAKPoblBAhuI0MXUEDi0ojt9jLYbu4Yz88ogIwlATMtK3+IE/hxRXs
 lVtzh+ibFoGwEqwIbFKnwp8pI3VWCn2kcLtJ99++HYK/6fnll9a5ZZ4FPmatM8wJl6aH
 BtLUy+kSbcoqYo7s609adsVgQ5URF9NeP8rfkukWlX/Phblglt5bUVoLWcH1vAhrqHkb
 SGvtoRC4/cP/0bRLcJmep5icUv0EM8hhicdFyrh1GJn1ZKQn98WAlOnO46QDLZPIV5oF
 Ayrp2WuH0gWAdOu56qXsUeykqG60fHgTg4mwFfCa4//Ph+JF4k+YBd5gkCms+aqwtJ7d
 /yAw==
X-Gm-Message-State: AOAM533pbLpJSYSPu+iXbBUsSKE7VxNNqqlWpsaUBb5gJ4Yhb4PHp3u1
 PTNQMm03xcEPNEBDolRfh56QY3fvx9q2lA==
X-Google-Smtp-Source: ABdhPJzd0nMCSM5mvcN8ga+Y8Pk6LREDfyjPEZolZbAbOIg3bHssEMs90wroWJiZ9XrJMK0p3HI/wg==
X-Received: by 2002:a37:b307:: with SMTP id c7mr8171908qkf.134.1636657489759; 
 Thu, 11 Nov 2021 11:04:49 -0800 (PST)
Received: from LAPTOP-T2OT88E8
 (bras-base-stsvon1503w-grc-20-142-114-141-224.dsl.bell.ca. [142.114.141.224])
 by smtp.gmail.com with ESMTPSA id x10sm1626242qkn.41.2021.11.11.11.04.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Nov 2021 11:04:49 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 11 Nov 2021 14:04:48 -0500
From: Shashi Mallela <shashi.mallela@linaro.org>
Subject: RE: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Thread-Topic: RE: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
In-Reply-To: <YY1fPNywEOvSaJ/a@leviathan>
Message-ID: <2456772B-463A-401E-BDA9-07EEB61047BB@hxcore.ol>
References: <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
 <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
 <20211015122351.vc55mwzjbevl6wjy@leviathan>
 <CAFEAcA-Xe2u8n+og4TMyZSSvdBm8nrma3z4GkVjEJHPdJu8Fnw@mail.gmail.com>
 <20211109204249.usvfatm3frar3u7a@leviathan>
 <CAFEAcA98G_u74G7PQFVZ_FTirKtnO63WQhA5bV_zVJJXAzJang@mail.gmail.com>
 <20211109225251.gfr2mvm3jynvdsnk@leviathan>
 <CAFEAcA-0NFAM5j8CrUf+hPmCZBGOiAkk2f-n-pfqjsv+OwM38w@mail.gmail.com>,
 <YY1fPNywEOvSaJ/a@leviathan>
To: Leif Lindholm <leif@nuviainc.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::736
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MIME_HTML_ONLY=0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
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
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DEN-CA link=3Dblue vlink=3D"#954F72" style=3D=
'word-wrap:break-word'><div class=3DWordSection1><p class=3DMsoNormal><b>Fr=
om: </b><a href=3D"mailto:leif@nuviainc.com">Leif Lindholm</a><br><b>Sent: =
</b>November 11, 2021 1:21 PM<br><b>To: </b><a href=3D"mailto:peter.maydell=
@linaro.org">Peter Maydell</a><br><b>Cc: </b><a href=3D"mailto:shashi.malle=
la@linaro.org">Shashi Mallela</a>; <a href=3D"mailto:rad@semihalf.com">Rado=
slaw Biernacki</a>; <a href=3D"mailto:mst@redhat.com">Michael S. Tsirkin</a=
>; <a href=3D"mailto:imammedo@redhat.com">Igor Mammedov</a>; <a href=3D"mai=
lto:qemu-arm@nongnu.org">qemu-arm</a>; <a href=3D"mailto:qemu-devel@nongnu.=
org">QEMU Developers</a>; <a href=3D"mailto:eric.auger@redhat.com">Eric Aug=
er</a>; <a href=3D"mailto:narmstrong@baylibre.com">narmstrong@baylibre.com<=
/a>; <a href=3D"mailto:alex.bennee@linaro.org">Alex Benn=C3=A9e</a>; <a hre=
f=3D"mailto:marcin.juszkiewicz@linaro.org">Marcin Juszkiewicz</a><br><b>Sub=
ject: </b>Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC=
</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>On Thu, =
Nov 11, 2021 at 16:55:09 +0000, Peter Maydell wrote:</p><p class=3DMsoNorma=
l>&gt; On Tue, 9 Nov 2021 at 22:52, Leif Lindholm &lt;leif@nuviainc.com&gt;=
 wrote:</p><p class=3DMsoNormal>&gt; &gt;</p><p class=3DMsoNormal>&gt; &gt;=
 On Tue, Nov 09, 2021 at 21:21:46 +0000, Peter Maydell wrote:</p><p class=
=3DMsoNormal>&gt; &gt; &gt; The other thing we should nail down is how the =
user is going to</p><p class=3DMsoNormal>&gt; &gt; &gt; select which flavou=
r of machine they want to provide. Three</p><p class=3DMsoNormal>&gt; &gt; =
&gt; options:</p><p class=3DMsoNormal>&gt; &gt; &gt;=C2=A0 (1) no control, =
QEMU just emulates whatever the newest flavour is.</p><p class=3DMsoNormal>=
&gt; &gt; &gt; User needs to go find a firmware image new enough to cope.</=
p><p class=3DMsoNormal>&gt; &gt; &gt;=C2=A0 (2) different flavours exposed =
as different machine types</p><p class=3DMsoNormal>&gt; &gt; &gt; (analogou=
s to how we have musca-a and musca-b1, or raspi3ap and</p><p class=3DMsoNor=
mal>&gt; &gt; &gt; raspi3b, for instance). Old user command lines keep work=
ing</p><p class=3DMsoNormal>&gt; &gt; &gt; because -M sbsa-ref doesn't chan=
ge; the new stuff would be</p><p class=3DMsoNormal>&gt; &gt; &gt; available=
 via -M sbsa-ref-2 or whatever.</p><p class=3DMsoNormal>&gt; &gt; &gt;=C2=
=A0 (3) different flavours exposed via a property</p><p class=3DMsoNormal>&=
gt; &gt; &gt; (so you would have -M sbsa-ref,machine-revision=3D2 or someth=
ing).</p><p class=3DMsoNormal>&gt; &gt; &gt; If the revision defaults to 1 =
then old user setups still work</p><p class=3DMsoNormal>&gt; &gt; &gt; but =
everybody starts to have to cart around an extra command</p><p class=3DMsoN=
ormal>&gt; &gt; &gt; line argument. If it defaults to &quot;newest we know =
about&quot; you</p><p class=3DMsoNormal>&gt; &gt; &gt; get the opposite set=
 of tradeoffs.</p><p class=3DMsoNormal>&gt; &gt;</p><p class=3DMsoNormal>&g=
t; &gt; I'm leaning towards (1), at least while working towards a &quot;com=
plete&quot;</p><p class=3DMsoNormal>&gt; &gt; platform (when we may still a=
dd/change features, but not how those</p><p class=3DMsoNormal>&gt; &gt; fea=
tures are communicated to the firmware).</p><p class=3DMsoNormal>&gt; </p><=
p class=3DMsoNormal>&gt; That's certainly the easiest on the QEMU side; you=
 know the</p><p class=3DMsoNormal>&gt; userbase so would know whether that =
kind of compat break is</p><p class=3DMsoNormal>&gt; going to be OK with th=
em.</p><p class=3DMsoNormal>&gt; </p><p class=3DMsoNormal>&gt; Q1: who is g=
oing to write the code for this?</p><p class=3DMsoNormal><o:p>&nbsp;</o:p><=
/p><p class=3DMsoNormal>Me, my team, and perhaps a little bit of help from =
Shashi where it</p><p class=3DMsoNormal>intersects his code.</p><p class=3D=
MsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt; Q2: do we want to =
try to land &quot;ITS in sbsa-ref&quot; in 6.2? Given</p><p class=3DMsoNorm=
al>&gt; we're in freeze we're quite short of time even if we handwave</p><p=
 class=3DMsoNormal>&gt; the fact it's a new feature, not a bugfix, so I wou=
ld lean</p><p class=3DMsoNormal>&gt; towards 'no'...</p><p class=3DMsoNorma=
l><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Shashi - what is your feeling?<=
/p><p class=3DMsoNormal>If we could make ITS support depend on the platform=
 version being</p><p class=3DMsoNormal>communicated through TF-A, we could =
simplify the transition a lot.</p><p class=3DMsoNormal>But that would defin=
itely mean missing 6.2.</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p cla=
ss=3DMsoNormal>Sounds okay to me too.</p><p class=3DMsoNormal><o:p>&nbsp;</=
o:p></p><p class=3DMsoNormal>Peter - could we sneak in an &quot;add version=
 node to DT&quot; into 6.2?</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p=
 class=3DMsoNormal>/</p><p class=3DMsoNormal>=C2=A0=C2=A0=C2=A0 Leif</p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>=


