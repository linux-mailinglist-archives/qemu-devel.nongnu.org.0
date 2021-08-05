Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C442A3E1A02
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 19:07:22 +0200 (CEST)
Received: from localhost ([::1]:60740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBgq1-0001FM-EK
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 13:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1mBgpB-0000ZH-Pb; Thu, 05 Aug 2021 13:06:29 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:45681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1mBgpA-0006Fn-21; Thu, 05 Aug 2021 13:06:29 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso11047175pjf.4; 
 Thu, 05 Aug 2021 10:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7ZmMW3tRLKZ7x4Mq+WBCbHhzuGjpqCEuIHUICC9/YUc=;
 b=F16OADYGOpaOpw3QXrfG4rWjlCCbMt5H2rX97CM7BhDZSh+Og+QGUclYp7fF1C80dp
 F8El776YoShhsdM2y+UZT4vexaKUkGvRoMRlT3pDL0fdtmKH22fnTliixxxGwKZh7/hZ
 AbPdKKxgYjoi3UOCFME7LA7bPRbKYytC8ynnWRL3V4WXGFwKMV8z2rAlPFFx9ccr6KZH
 jPnmeGHO92Pb6dnKi5Pmdm+966tzm1jw/uWQJ1eSBsqtq/5tPnbvc1vl3FNBP8B//43c
 kDEXYVSYd3g9kyae5ubf2S2A6oJu66a1YvUfjNhw8eynqX7TMCs+E0PB4G3E4pEP7Zp+
 m1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7ZmMW3tRLKZ7x4Mq+WBCbHhzuGjpqCEuIHUICC9/YUc=;
 b=qisv6cjcSgIGXA3yNiWby4DYC6pfqr7gm4taggaBTL0n/xRuVFfeWu1N8LlEvj1dBS
 7OGbW3QEWammTPQ95d6bnIW2YNa0fjkRzx9PwPFutzgNZxqzwVSJxAKfeHHL+Z5SaDIt
 sw5CkN/QYZ9/+zmFBHFjp2D3T1jG2hFP5K74AWXsXYwK02oROK18GqE9ADg6oVaW4edB
 yrPDAcn+iDB8xLQP2b/jhbnPFQWtPZJUAHJTeqiOgUlnLy0jXNRF9PHnIwIytnBt2nuu
 mMdED7zpob2a0Yk0IbCbfZchEL1JXvxpMTzPO4oJPJesFfQsSmXI9nOIlFxrEWmaUMj+
 BnwA==
X-Gm-Message-State: AOAM532hMeY9oVhKNWS0ZM0baXOi62mbzx4f6qlNr/oYW8z94d04j4+E
 KKPbGYl26k+2ob9wNQIXyGrXrZF/fJls6xw46HY=
X-Google-Smtp-Source: ABdhPJytyqBYrLU6Q5sYd1qiQfpP8XPs9hAPaTIN/WmJjKAgLbe501rfI2eY/1ncvkxDGo3SIOmYCd2RPBg0Hl7OYq4=
X-Received: by 2002:a17:90b:344d:: with SMTP id
 lj13mr15631990pjb.24.1628183185133; 
 Thu, 05 Aug 2021 10:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-6-f4bug@amsat.org>
 <1507c8d3-e7ae-6dc4-2bb0-3b212f32edbf@amsat.org>
In-Reply-To: <1507c8d3-e7ae-6dc4-2bb0-3b212f32edbf@amsat.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Thu, 5 Aug 2021 19:06:14 +0200
Message-ID: <CAPan3WovgpksBYSq8cyRdL1VEKvdDtWVmvbmh=ySiZaVOYYNuA@mail.gmail.com>
Subject: Re: [PATCH 5/9] tests/acceptance: Use image_expand() in
 test_arm_orangepi_uboot_netbsd9
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000006113cd05c8d2f0aa"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-pj1-x1035.google.com
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Tom Yan <tom.ty89@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006113cd05c8d2f0aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

Op wo 4 aug. 2021 22:55 schreef Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>:

> Hi Niek,
>
> On 6/23/21 8:00 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > The NetBSD OrangePi image must be at least 2GiB, not less.
> > Expand the SD card image to this size before using it.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >  tests/acceptance/boot_linux_console.py | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/acceptance/boot_linux_console.py
> b/tests/acceptance/boot_linux_console.py
> > index 61069f0064f..b10f7257503 100644
> > --- a/tests/acceptance/boot_linux_console.py
> > +++ b/tests/acceptance/boot_linux_console.py
> > @@ -868,7 +868,12 @@ def test_arm_orangepi_uboot_netbsd9(self):
> >          :avocado: tags=3Ddevice:sd
> >          :avocado: tags=3Dos:netbsd
> >          """
> > -        # This test download a 304MB compressed image and expand it to
> 2GB
> > +        # This test download a 304MB compressed image and expand it to
> 2GB,
> > +        # which is the minimum card size required by the NetBSD
> installer:
> > +        # https://wiki.netbsd.org/ports/evbarm/raspberry_pi/#index7h2
> > +        # "A 2 GB card is the smallest workable size that the
> installation
> > +        # image will fit on."
>
> Do you agree with this comment and the one in the next patch?
>

Yes, this change looks fine for me.

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>


> > +        NETBSD_SDCARD_MINSIZE =3D 2 * 1024 * 1024 * 1024
> >          deb_url =3D ('http://snapshot.debian.org/archive/debian/'
> >                     '20200108T145233Z/pool/main/u/u-boot/'
> >                     'u-boot-sunxi_2020.01%2Bdfsg-1_armhf.deb')
> > @@ -886,7 +891,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
> >          image_path_gz =3D self.fetch_asset(image_url,
> asset_hash=3Dimage_hash)
> >          image_path =3D os.path.join(self.workdir, 'armv7.img')
> >          archive.gzip_uncompress(image_path_gz, image_path)
> > -        image_pow2ceil_expand(image_path)
> > +        image_expand(image_path, NETBSD_SDCARD_MINSIZE)
> >          image_drive_args =3D 'if=3Dsd,format=3Draw,snapshot=3Don,file=
=3D' +
> image_path
> >
> >          # dd if=3Du-boot-sunxi-with-spl.bin of=3Darmv7.img bs=3D1K see=
k=3D8
> conv=3Dnotrunc
> >
>
>

--0000000000006113cd05c8d2f0aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Philippe,<br><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">Op wo 4 aug. 2021 22:55 schreef Philippe M=
athieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a=
>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">Hi Niek,<br>
<br>
On 6/23/21 8:00 PM, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; The NetBSD OrangePi image must be at least 2GiB, not less.<br>
&gt; Expand the SD card image to this size before using it.<br>
&gt; <br>
&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug=
@amsat.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 tests/acceptance/boot_linux_console.py | 9 +++++++--<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance=
/boot_linux_console.py<br>
&gt; index 61069f0064f..b10f7257503 100644<br>
&gt; --- a/tests/acceptance/boot_linux_console.py<br>
&gt; +++ b/tests/acceptance/boot_linux_console.py<br>
&gt; @@ -868,7 +868,12 @@ def test_arm_orangepi_uboot_netbsd9(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Ddevice:sd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dos:netbsd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This test download a 304MB compressed i=
mage and expand it to 2GB<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This test download a 304MB compressed i=
mage and expand it to 2GB,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # which is the minimum card size required=
 by the NetBSD installer:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # <a href=3D"https://wiki.netbsd.org/port=
s/evbarm/raspberry_pi/#index7h2" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://wiki.netbsd.org/ports/evbarm/raspberry_pi/#index7h2</a><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # &quot;A 2 GB card is the smallest worka=
ble size that the installation<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # image will fit on.&quot;<br>
<br>
Do you agree with this comment and the one in the next patch?<br></blockquo=
te></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, this chan=
ge looks fine for me.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Re=
viewed-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">=
nieklinnenbank@gmail.com</a>&gt;</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 NETBSD_SDCARD_MINSIZE =3D 2 * 1024 * 1024=
 * 1024<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_url =3D (&#39;<a href=3D"http://=
snapshot.debian.org/archive/debian/" rel=3D"noreferrer noreferrer" target=
=3D"_blank">http://snapshot.debian.org/archive/debian/</a>&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;20200108T145233Z/pool/main/u/u-boot/&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;u-boot-sunxi_2020.01%2Bdfsg-1_armhf.deb&#39;)<br>
&gt; @@ -886,7 +891,7 @@ def test_arm_orangepi_uboot_netbsd9(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image_path_gz =3D self.fetch_asset(i=
mage_url, asset_hash=3Dimage_hash)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image_path =3D os.path.join(self.wor=
kdir, &#39;armv7.img&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive.gzip_uncompress(image_path_g=
z, image_path)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_pow2ceil_expand(image_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_expand(image_path, NETBSD_SDCARD_MI=
NSIZE)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image_drive_args =3D &#39;if=3Dsd,fo=
rmat=3Draw,snapshot=3Don,file=3D&#39; + image_path<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # dd if=3Du-boot-sunxi-with-spl.bin =
of=3Darmv7.img bs=3D1K seek=3D8 conv=3Dnotrunc<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--0000000000006113cd05c8d2f0aa--

