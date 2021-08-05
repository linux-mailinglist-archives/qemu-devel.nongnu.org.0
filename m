Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C303E1A27
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 19:12:19 +0200 (CEST)
Received: from localhost ([::1]:35696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBguo-0003dA-7A
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 13:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1mBgu0-0002qT-BE; Thu, 05 Aug 2021 13:11:28 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:43824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1mBgty-0001IK-BD; Thu, 05 Aug 2021 13:11:28 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so11136683pjb.2; 
 Thu, 05 Aug 2021 10:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g1qPST4plmNr1fgxrMQTaarqVwwJGHfQCN8G1G9fjAs=;
 b=VYpRX+4hywcWF4hmkGJvAXVJ68hxVkBUCdhBiJa0pMlmUMWk5OYjUhAJSDUknrJLZv
 Hk0e/RfOeGY7Rg8cJBjvBMFzHJ9nPOweUz9WKoUHax03Wt3cUMPiYcA9kwCffMp8d+b8
 SqPgST/ENNWC1AMGKycWlKOktQiFecxVG4OOawWxM0cERcWiQMmmNtFnLHos/qGlRjP5
 s+yE4W4IC2HjKumYhA9FF1yWAjb4jm2U/2rqa9VqlJ7Bx7/EGPPWoMQQM/fDN8N2EOVd
 883MjgKZg/4axxD3T66venYaB7Kn8Mqk/wU3dNtP+PHiRePinzZayteC/zQbl6I0mgUR
 YWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g1qPST4plmNr1fgxrMQTaarqVwwJGHfQCN8G1G9fjAs=;
 b=b20+Q9dtueufNU/p4XxAeWuFM1FMdyW0lWgjVcOhvFD/DDfhpV6PmfxW2w7seN0MA2
 uLHUhIuJXIOiqh0r9IpStc1URovTGwOgJd+U7IKc8bwgt0UfKiUMwMYpIGfB+ZHqCVPs
 xeYLipwrNkt6Jwkj5TRA7sIBaE7rfD9a4U0jQTYLBnJKDuefce3/ELDY1lkpgl6cIRw5
 Aou0WWQaIfw4NyO4DHplHgetrdl/ZpqVPADBIccAuZSuc5ytHt0ug4DFZRZAwNVJi89x
 SNmcOakvLY0i4JeMS//goRWAvMx/Xqll7F0Zj30jQkNTV8E4KXHpH9i6pHal5ZsFf5JN
 YQLA==
X-Gm-Message-State: AOAM533oahOBPuY7WOEXFncC5/0RbG3DMQpZVNCEt/WTQq1+FaQs/D+t
 g48rINj5PuQltrD7deG//sUIwO0pLeyMBCPoo9E=
X-Google-Smtp-Source: ABdhPJwyBF6BSTrraoHpeTJGviaS0m0Yi3XYhn8mSPu66iS+l7vx3jAPEy2sblGoK5YiXYtHqI8mwd9hbjBqyAEAIR8=
X-Received: by 2002:a05:6a00:a0e:b029:3c3:538:b4b8 with SMTP id
 p14-20020a056a000a0eb02903c30538b4b8mr443021pfh.25.1628183480544; Thu, 05 Aug
 2021 10:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-7-f4bug@amsat.org>
In-Reply-To: <20210623180021.898286-7-f4bug@amsat.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Thu, 5 Aug 2021 19:11:09 +0200
Message-ID: <CAPan3WoB_nLY9NbDjA6t-3ivv9iTD2qcsj_3fi5pvdLoCz2gfA@mail.gmail.com>
Subject: Re: [RFC PATCH 6/9] tests/acceptance: Use image_expand() in
 test_arm_orangepi_bionic_20_08
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000fcb35b05c8d301ee"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-pj1-x102d.google.com
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fcb35b05c8d301ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

Op wo 23 jun. 2021 20:00 schreef Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>:

> U-Boot expects the SD card size to be at least 2GiB, so
> expand the SD card image to this size before using it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> TODO: U-Boot reference?
> ---
>  tests/acceptance/boot_linux_console.py | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/tests/acceptance/boot_linux_console.py
> b/tests/acceptance/boot_linux_console.py
> index b10f7257503..c4c0f0b393d 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -820,11 +820,13 @@ def test_arm_orangepi_bionic_20_08(self):
>          :avocado: tags=3Darch:arm
>          :avocado: tags=3Dmachine:orangepi-pc
>          :avocado: tags=3Ddevice:sd
> +        :avocado: tags=3Du-boot
>          """
>
> -        # This test download a 275 MiB compressed image and expand it
> -        # to 1036 MiB, but the underlying filesystem is 1552 MiB...
> -        # As we expand it to 2 GiB we are safe.
> +        # This test download a 275 MiB compressed image and inflate it
>

Only a few typos here:
  download -> downloads
  inflate -> inflates

Otherwise, looks fine:

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

+        # to 1036 MiB, but 1/ the underlying filesystem is 1552 MiB,
> +        # 2/ U-Boot loads TFTP filenames from the last sector below
> +        # 2 GiB, so we need to expand the image further more to 2 GiB.
>
>          image_url =3D ('https://archive.armbian.com/orangepipc/archive/'
>
> 'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
> @@ -833,7 +835,7 @@ def test_arm_orangepi_bionic_20_08(self):
>          image_path_xz =3D self.fetch_asset(image_url, asset_hash=3Dimage=
_hash,
>                                           algorithm=3D'sha256')
>          image_path =3D archive.extract(image_path_xz, self.workdir)
> -        image_pow2ceil_expand(image_path)
> +        image_expand(image_path, 2 * 1024 * 1024 * 1024)
>
>          self.vm.set_console()
>          self.vm.add_args('-drive', 'file=3D' + image_path +
> ',if=3Dsd,format=3Draw',
> --
> 2.31.1
>
>

--000000000000fcb35b05c8d301ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Philippe,<br><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">Op wo 23 jun. 2021 20:00 schreef Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</=
a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">U-Boot expects the SD card =
size to be at least 2GiB, so<br>
expand the SD card image to this size before using it.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</a>&gt;<br>
---<br>
TODO: U-Boot reference?<br>
---<br>
=C2=A0tests/acceptance/boot_linux_console.py | 10 ++++++----<br>
=C2=A01 file changed, 6 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py<br>
index b10f7257503..c4c0f0b393d 100644<br>
--- a/tests/acceptance/boot_linux_console.py<br>
+++ b/tests/acceptance/boot_linux_console.py<br>
@@ -820,11 +820,13 @@ def test_arm_orangepi_bionic_20_08(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:avocado: tags=3Darch:arm<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:avocado: tags=3Dmachine:orangepi-pc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:avocado: tags=3Ddevice:sd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Du-boot<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This test download a 275 MiB compressed imag=
e and expand it<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to 1036 MiB, but the underlying filesystem i=
s 1552 MiB...<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # As we expand it to 2 GiB we are safe.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This test download a 275 MiB compressed imag=
e and inflate it<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Only a few typos here:</div><div dir=3D"auto">=C2=A0 downlo=
ad -&gt; downloads</div><div dir=3D"auto">=C2=A0 inflate -&gt; inflates</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Otherwise, looks fine:</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-by: Niek Linnenbank=
 &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">nieklinnenbank@gmail.com</=
a>&gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to 1036 MiB, but 1/ the underlying filesyste=
m is 1552 MiB,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # 2/ U-Boot loads TFTP filenames from the last=
 sector below<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # 2 GiB, so we need to expand the image furthe=
r more to 2 GiB.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image_url =3D (&#39;<a href=3D"https://ar=
chive.armbian.com/orangepipc/archive/" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://archive.armbian.com/orangepipc/archive/</a>&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz&#39;)<br>
@@ -833,7 +835,7 @@ def test_arm_orangepi_bionic_20_08(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image_path_xz =3D self.fetch_asset(image_=
url, asset_hash=3Dimage_hash,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a=
lgorithm=3D&#39;sha256&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image_path =3D archive.extract(image_path=
_xz, self.workdir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_pow2ceil_expand(image_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_expand(image_path, 2 * 1024 * 1024 * 102=
4)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.set_console()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.add_args(&#39;-drive&#39;, &#39;f=
ile=3D&#39; + image_path + &#39;,if=3Dsd,format=3Draw&#39;,<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div></div>

--000000000000fcb35b05c8d301ee--

