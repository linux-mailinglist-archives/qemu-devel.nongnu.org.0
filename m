Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46363BAD04
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 14:36:39 +0200 (CEST)
Received: from localhost ([::1]:37470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m01MU-0003BO-DG
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 08:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1m01Lh-0002Jn-4C; Sun, 04 Jul 2021 08:35:49 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:55911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1m01Lf-0004Z0-1m; Sun, 04 Jul 2021 08:35:48 -0400
Received: by mail-pj1-x1034.google.com with SMTP id l11so9707525pji.5;
 Sun, 04 Jul 2021 05:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+OvJAy3QF6Pk9DDGyaVWG/1k8/hU+uw5bRDZvO8z2dA=;
 b=OGWXBhDEK9bZiV7mTmzqpZv0pjEq0axOJOIwGA4MRFDP+qaRjm2ZU05zypbQRHMz/w
 Uwq+qsEYLcASpp3JWXGVkTsMxNKblONcG2p9LBg+6yxs21KxJvfqa+LNT7BcSCqDHXEB
 Wo9jJNSwteHSxWkjnD9yG02biRSl8kykJGwdIq4cy8INPC5jRGOd9ol70g496SNNdsUh
 qJwZl/8ESbTisYxop0NIyFfBy0LWK7jrgamuWPPA1xHgYb4SLoalhao8QTnhCF5CNtWU
 od4xsQpYZjqVXapGV9B+BLSvnxl5t/QNNluAClPxJxwN8UmQx4L3dDMCaACyOKBlvqs4
 frgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+OvJAy3QF6Pk9DDGyaVWG/1k8/hU+uw5bRDZvO8z2dA=;
 b=YLzIYHvsVnoFMWEuMKdYrfgxrQkPgV9P8o5JZLIYeoXw45Smptl3rnyFSh51CJB5ef
 51bDouqG6L6zP26kMoY9tRMSE1gZl8W5x7ErGGcotv04CS4+55J1u7H0wAQTVALXOOS8
 JSfVeXyquHl6OQ4FDYmACZhI5SX9kORtPMw1KUIAfi/YwC62VEKUa1gb7kdklMPMmcMG
 eYc45IYc7Pw1HZIrH4KF2Od7VycbZyUQUQ1i1dp59t5HyFsrsdPQhzpGIt/G6fWqN1CI
 noFcqdKyPd7H4DRFXMxoIOYyMSuXLUCWoDwg5wQj5L5d/nJLd8ptegQ2yQJd5JCsjbXe
 Fohg==
X-Gm-Message-State: AOAM53207+Sdkgjl0WfiAhWdykAprjSMYJEz9qln75PK4ZNXgZzCpGU9
 ZO5c8hpebxCiCsov3X0H0qiiS/mCBeOvCH+CMrQ=
X-Google-Smtp-Source: ABdhPJzUBWk/LtMqL9IyrLA0miKtk8SPptn5rSgfsn2WrPrfS8fitjjz+KzoRPvQVsVoKb4ksef/AGvzDKaOx/QBo8s=
X-Received: by 2002:a17:902:b604:b029:128:bfa5:3c4c with SMTP id
 b4-20020a170902b604b0290128bfa53c4cmr7935854pls.29.1625402144481; Sun, 04 Jul
 2021 05:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-4-f4bug@amsat.org>
 <6dc3fe10-924f-9f3d-baea-90e2539f58ee@amsat.org>
 <CAAdtpL6+M2e=SvGFMgJBxanQJgTz0kg1th-9BxHy1TaWEfafog@mail.gmail.com>
In-Reply-To: <CAAdtpL6+M2e=SvGFMgJBxanQJgTz0kg1th-9BxHy1TaWEfafog@mail.gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 4 Jul 2021 14:35:32 +0200
Message-ID: <CAPan3WqaXEGchtJNN0UfcXxu+wJQttCjyFW5CrtS=+5eqa7wow@mail.gmail.com>
Subject: Re: [PATCH 3/9] tests/acceptance: Tag NetBSD tests as 'os:netbsd'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000007062a705c64b6d2e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Tom Yan <tom.ty89@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007062a705c64b6d2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

for test_arm_orangepi_uboot_netbsd9:

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Op za 3 jul. 2021 10:44 schreef Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>:

> On Sat, Jul 3, 2021 at 10:41 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org>
> wrote:
> >
> > CC'ing NetBSD maintainers.
> >
> > On 6/23/21 8:00 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > > Avocado allows us to select set of tests using tags.
> > > When wanting to run all tests using a NetBSD guest OS,
> > > it is convenient to have them tagged, add the 'os:netbsd'
> > > tag.
>
> I'll amend an command line example to run the NetBSD tests:
>
>    $ avocado --show=3Dapp,console run -t os:netbsd tests/acceptance/
>
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > > ---
> > >  tests/acceptance/boot_linux_console.py | 1 +
> > >  tests/acceptance/ppc_prep_40p.py       | 2 ++
> > >  2 files changed, 3 insertions(+)
> > >
> > > diff --git a/tests/acceptance/boot_linux_console.py
> b/tests/acceptance/boot_linux_console.py
> > > index cded547d1d4..20d57c1a8c6 100644
> > > --- a/tests/acceptance/boot_linux_console.py
> > > +++ b/tests/acceptance/boot_linux_console.py
> > > @@ -862,6 +862,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
> > >          :avocado: tags=3Darch:arm
> > >          :avocado: tags=3Dmachine:orangepi-pc
> > >          :avocado: tags=3Ddevice:sd
> > > +        :avocado: tags=3Dos:netbsd
> > >          """
> > >          # This test download a 304MB compressed image and expand it
> to 2GB
> > >          deb_url =3D ('http://snapshot.debian.org/archive/debian/'
> > > diff --git a/tests/acceptance/ppc_prep_40p.py
> b/tests/acceptance/ppc_prep_40p.py
> > > index 96ba13b8943..2993ee3b078 100644
> > > --- a/tests/acceptance/ppc_prep_40p.py
> > > +++ b/tests/acceptance/ppc_prep_40p.py
> > > @@ -27,6 +27,7 @@ def test_factory_firmware_and_netbsd(self):
> > >          """
> > >          :avocado: tags=3Darch:ppc
> > >          :avocado: tags=3Dmachine:40p
> > > +        :avocado: tags=3Dos:netbsd
> > >          :avocado: tags=3Dslowness:high
> > >          """
> > >          bios_url =3D ('http://ftpmirror.your.org/pub/misc/'
> > > @@ -64,6 +65,7 @@ def test_openbios_and_netbsd(self):
> > >          """
> > >          :avocado: tags=3Darch:ppc
> > >          :avocado: tags=3Dmachine:40p
> > > +        :avocado: tags=3Dos:netbsd
> > >          """
> > >          drive_url =3D ('https://cdn.netbsd.org/pub/NetBSD/iso/7.1.2/=
'
> > >                       'NetBSD-7.1.2-prep.iso')
> > >
> >
>

--0000000000007062a705c64b6d2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>for=C2=A0<span style=3D"font-family:sans-serif">test=
_arm_orangepi_uboot_netbsd</span><span style=3D"font-family:sans-serif">9:<=
/span></div><div dir=3D"auto"><font face=3D"sans-serif"><br></font></div><d=
iv dir=3D"auto"><font face=3D"sans-serif">Reviewed-by: Niek Linnenbank &lt;=
<a href=3D"mailto:nieklinnenbank@gmail.com">nieklinnenbank@gmail.com</a>&gt=
;<br></font><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">Op za 3 jul. 2021 10:44 schreef Philippe Mathieu-Daud=C3=
=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On Sat, Jul 3, 2021 at 10:41 AM Philippe M=
athieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank" =
rel=3D"noreferrer">f4bug@amsat.org</a>&gt; wrote:<br>
&gt;<br>
&gt; CC&#39;ing NetBSD maintainers.<br>
&gt;<br>
&gt; On 6/23/21 8:00 PM, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; &gt; Avocado allows us to select set of tests using tags.<br>
&gt; &gt; When wanting to run all tests using a NetBSD guest OS,<br>
&gt; &gt; it is convenient to have them tagged, add the &#39;os:netbsd&#39;=
<br>
&gt; &gt; tag.<br>
<br>
I&#39;ll amend an command line example to run the NetBSD tests:<br>
<br>
=C2=A0 =C2=A0$ avocado --show=3Dapp,console run -t os:netbsd tests/acceptan=
ce/<br>
<br>
&gt; &gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:=
f4bug@amsat.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</a>&g=
t;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 tests/acceptance/boot_linux_console.py | 1 +<br>
&gt; &gt;=C2=A0 tests/acceptance/ppc_prep_40p.py=C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 2 ++<br>
&gt; &gt;=C2=A0 2 files changed, 3 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/tests/acceptance/boot_linux_console.py b/tests/accep=
tance/boot_linux_console.py<br>
&gt; &gt; index cded547d1d4..20d57c1a8c6 100644<br>
&gt; &gt; --- a/tests/acceptance/boot_linux_console.py<br>
&gt; &gt; +++ b/tests/acceptance/boot_linux_console.py<br>
&gt; &gt; @@ -862,6 +862,7 @@ def test_arm_orangepi_uboot_netbsd9(self):<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:arm<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dmachine:orange=
pi-pc<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Ddevice:sd<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dos:netbsd<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # This test download a 304MB co=
mpressed image and expand it to 2GB<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_url =3D (&#39;<a href=3D"ht=
tp://snapshot.debian.org/archive/debian/" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">http://snapshot.debian.org/archive/debian/</a>&#39;<br>
&gt; &gt; diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/=
ppc_prep_40p.py<br>
&gt; &gt; index 96ba13b8943..2993ee3b078 100644<br>
&gt; &gt; --- a/tests/acceptance/ppc_prep_40p.py<br>
&gt; &gt; +++ b/tests/acceptance/ppc_prep_40p.py<br>
&gt; &gt; @@ -27,6 +27,7 @@ def test_factory_firmware_and_netbsd(self):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:ppc<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dmachine:40p<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dos:netbsd<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dslowness:high<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bios_url =3D (&#39;<a href=3D"h=
ttp://ftpmirror.your.org/pub/misc/" rel=3D"noreferrer noreferrer" target=3D=
"_blank">http://ftpmirror.your.org/pub/misc/</a>&#39;<br>
&gt; &gt; @@ -64,6 +65,7 @@ def test_openbios_and_netbsd(self):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:ppc<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dmachine:40p<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dos:netbsd<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drive_url =3D (&#39;<a href=3D"=
https://cdn.netbsd.org/pub/NetBSD/iso/7.1.2/" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://cdn.netbsd.org/pub/NetBSD/iso/7.1.2/</a>&#39;<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;NetBSD-7.1.2-prep.iso&#39;)<br>
&gt; &gt;<br>
&gt;<br>
</blockquote></div></div></div>

--0000000000007062a705c64b6d2e--

