Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D46E84D3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 00:22:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppGAd-0003AD-Rb; Wed, 19 Apr 2023 18:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ppGAa-00039k-G2
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 18:20:56 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ppGAX-0008C4-Hz
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 18:20:56 -0400
Received: by mail-ej1-x632.google.com with SMTP id u3so1849519ejj.12
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 15:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20221208.gappssmtp.com; s=20221208; t=1681942850; x=1684534850;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4DcFPqrJTjWoD5HRPAYwcMZh9Cflv80L5JA+0RdnEfQ=;
 b=o1UbsQuQ5EIZoqirAinU3l1uZ9JiElIqtBMnWWYiOjiIGq/O9T5M+wJR3398oNXyhE
 F4rK1MRi9Asc0dTVlLvuu9R35ehxefZuhXGaVj/1TupuHUXFQATRoDSB2V6qUKadELNE
 h/AHp1xbClGaC5FXbguc8/5wi4X6DlLrB9DgDoTipVpF7V5rDfNABWMlrZKDN8rPP2+E
 fXYJQaCOx8qjJUtETIdYvYIUnJr3m0PS0JuR2A5uojQyinOCrSher3GT40nyYWN1AfZf
 pehtLDEoL4fYYMGCwdLuPnXa793Uq5BhVexGFKEmGT88bA8RsvyYIRjEJcJ7oRXIHGn/
 ZeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681942850; x=1684534850;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4DcFPqrJTjWoD5HRPAYwcMZh9Cflv80L5JA+0RdnEfQ=;
 b=lOnJlwAl9WHRxBZU1mTTV7UV0yvd22fAQDjWVGM7vpQiG/enkK+JkzQ447TtEPMurV
 PYIYAXhrsA7EC7AoGReZAWm8r5xVaYu8gp5ziy6+/VpjE+sA4MkbhuGO8LabPtwASTyD
 8l4X5SA7GcqelBBNI7G5to4D95HJk+zUEMEPfznIUTxKB7CPR+1JsOq/yYj/DOqsN4GW
 ExJalOwV2iq4xFM2chp0Bfnvk9p+0PnRvDTU9dKS40xa/uO4ynzrwhuIEHZfRPkESpRH
 dhPs++MgdOXHlX/miAPCa8H90/20F6M20+djt97x+hQHzy9H6gCIE0w0VrVCTrgk7gEa
 nmUg==
X-Gm-Message-State: AAQBX9ckbaJ954Rq8F7oX1YiSh0dl0yj0sfkuzXJ/WFgZ+ROSHqwZ8Kz
 ZOPxZcnxhuAYuEAN6czVN48x6ZdhmL5jujPev8obJA==
X-Google-Smtp-Source: AKy350avMYcJK+4OACQ12cuApzVqGvjRioDrd87ZSipbWjD3ldamoT+4NumLaJ7oKiGGq0DtIrNOTvIy1m+gw2dNyX8=
X-Received: by 2002:a17:906:e118:b0:94a:6c0a:63e7 with SMTP id
 gj24-20020a170906e11800b0094a6c0a63e7mr14961795ejb.54.1681942850554; Wed, 19
 Apr 2023 15:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230419144553.719749-1-thuth@redhat.com>
In-Reply-To: <20230419144553.719749-1-thuth@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 19 Apr 2023 16:20:39 -0600
Message-ID: <CANCZdfrPbYHWhVTLfNSZF1SDLuujqAhfsfeSCHF=q86Vgz4A9Q@mail.gmail.com>
Subject: Re: [PATCH v2] tests/vm/freebsd: Update to FreeBSD 13.2
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Kyle Evans <kevans@freebsd.org>, kraxel@redhat.com
Content-Type: multipart/alternative; boundary="00000000000023e53005f9b7d65a"
Received-SPF: none client-ip=2a00:1450:4864:20::632;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000023e53005f9b7d65a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 8:46=E2=80=AFAM Thomas Huth <thuth@redhat.com> wrot=
e:

> According to QEMU's support policy, we stop supporting the previous
> major release two years after the the new major release has been
> published. So we can stop testing FreeBSD 12 now and should switch
> our FreeBSD VM to version 13 instead.
>
> Some changes are needed for this update: The downloadable .ISO images
> do not use the serial port as console by default anymore, so they
> are not usable in the same way as with FreeBSD 12. Fortunately, the
> FreeBSD project now also offers some pre-installed CI images that
> have the serial console enabled, so we can use those now, with the
> benefit that we can skip almost all parts of the previous installation
> process.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Removed the "ftp/" folder from the URL - it's not necessary anymore
>      (thanks to Li-Wen for the hint!)
>
>  tests/vm/freebsd | 101 ++++++++++++-----------------------------------
>  1 file changed, 25 insertions(+), 76 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

I also wonder if we should expand this to aarch64... but it looks like
there's no CI image
for that, so I'll see if I can make something like that happen before 14.0.

Warner


> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> index ba2ba23d24..11de6473f4 100755
> --- a/tests/vm/freebsd
> +++ b/tests/vm/freebsd
> @@ -28,15 +28,15 @@ class FreeBSDVM(basevm.BaseVM):
>      name =3D "freebsd"
>      arch =3D "x86_64"
>
> -    link =3D "
> https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.4/FreeBSD-12.4-RE=
LEASE-amd64-disc1.iso.xz
> "
> -    csum =3D
> "1dcf6446e31bf3f81b582e9aba3319a258c29a937a2af6138ee4b181ed719a87"
> +    link =3D "
> https://download.freebsd.org/releases/CI-IMAGES/13.2-RELEASE/amd64/Latest=
/FreeBSD-13.2-RELEASE-amd64-BASIC-CI.raw.xz
> "
> +    csum =3D
> "a4fb3b6c7b75dd4d58fb0d75e4caf72844bffe0ca00e66459c028b198ffb3c0e"
>      size =3D "20G"
>      pkgs =3D [
>          # build tools
>          "git",
>          "pkgconf",
>          "bzip2",
> -        "python37",
> +        "python39",
>          "ninja",
>
>          # gnu tools
> @@ -78,72 +78,42 @@ class FreeBSDVM(basevm.BaseVM):
>          mkdir src build; cd src;
>          tar -xf /dev/vtbd1;
>          cd ../build
> -        ../src/configure --python=3Dpython3.7 {configure_opts};
> +        ../src/configure --python=3Dpython3.9 {configure_opts};
>          gmake --output-sync -j{jobs} {target} {verbose};
>      """
>
> -    def console_boot_serial(self):
> -        self.console_wait_send("Autoboot", "3")
> -        self.console_wait_send("OK", "set console=3Dcomconsole\n")
> -        self.console_wait_send("OK", "boot\n")
> -
>      def build_image(self, img):
> -        self.print_step("Downloading install iso")
> +        self.print_step("Downloading disk image")
>          cimg =3D self._download_with_cache(self.link, sha256sum=3Dself.c=
sum)
> -        img_tmp =3D img + ".tmp"
> -        iso =3D img + ".install.iso"
> -        iso_xz =3D iso + ".xz"
> -
> -        self.print_step("Preparing iso and disk image")
> -        subprocess.check_call(["cp", "-f", cimg, iso_xz])
> -        subprocess.check_call(["xz", "-dvf", iso_xz])
> -        self.exec_qemu_img("create", "-f", "qcow2", img_tmp, self.size)
> -
> -        self.print_step("Booting installer")
> +        tmp_raw =3D img + ".tmp.raw"
> +        tmp_raw_xz =3D tmp_raw + ".xz"
> +        img_tmp =3D img + ".tmp.qcow2"
> +
> +        self.print_step("Preparing disk image")
> +        subprocess.check_call(["cp", "-f", cimg, tmp_raw_xz])
> +        subprocess.check_call(["xz", "-dvf", tmp_raw_xz])
> +        self.exec_qemu_img("convert", "-O", "qcow2", tmp_raw, img_tmp)
> +        self.exec_qemu_img("resize", img_tmp, self.size)
> +        os.remove(tmp_raw)
> +
> +        self.print_step("Preparing disk image")
>          self.boot(img_tmp, extra_args =3D [
>              "-machine", "graphics=3Doff",
> -            "-device", "VGA",
> -            "-cdrom", iso
> +            "-vga", "none"
>          ])
>          self.console_init()
> -        self.console_boot_serial()
> -        self.console_wait_send("Console type",          "xterm\n")
> -
> -        # pre-install configuration
> -        self.console_wait_send("Welcome",               "\n")
> -        self.console_wait_send("Keymap Selection",      "\n")
> -        self.console_wait_send("Set Hostname",          "freebsd\n")
> -        self.console_wait_send("Distribution Select",   "\n")
> -        self.console_wait_send("Partitioning",          "\n")
> -        self.console_wait_send("Partition",             "\n")
> -        self.console_wait_send("Scheme",                "\n")
> -        self.console_wait_send("Editor",                "f")
> -        self.console_wait_send("Confirmation",          "c")
> -
> -        self.print_step("Installation started now, this will take a
> while")
> -
> -        # post-install configuration
> +        self.console_wait_send("login:", "root\n")
> +        self.console_wait_send("~ #", "service growfs onestart\n")
> +
> +        # root user
> +        self.console_wait_send("~ #", "passwd\n")
>          self.console_wait("New Password:")
>          self.console_send("%s\n" % self._config["root_pass"])
>          self.console_wait("Retype New Password:")
>          self.console_send("%s\n" % self._config["root_pass"])
>
> -        self.console_wait_send("Network Configuration", "\n")
> -        self.console_wait_send("IPv4",                  "y")
> -        self.console_wait_send("DHCP",                  "y")
> -        self.console_wait_send("IPv6",                  "n")
> -        self.console_wait_send("Resolver",              "\n")
> -
> -        self.console_wait_send("Time Zone Selector",    "0\n")
> -        self.console_wait_send("Confirmation",          "y")
> -        self.console_wait_send("Time & Date",           "\n")
> -        self.console_wait_send("Time & Date",           "\n")
> -
> -        self.console_wait_send("System Configuration",  "\n")
> -        self.console_wait_send("System Hardening",      "\n")
> -
>          # qemu user
> -        self.console_wait_send("Add User Accounts", "y")
> +        self.console_wait_send("~ #", "adduser\n")
>          self.console_wait("Username")
>          self.console_send("%s\n" % self._config["guest_user"])
>          self.console_wait("Full name")
> @@ -165,13 +135,7 @@ class FreeBSDVM(basevm.BaseVM):
>          self.console_wait_send("Lock out",              "\n")
>          self.console_wait_send("OK",                    "yes\n")
>          self.console_wait_send("Add another user",      "no\n")
> -
> -        self.console_wait_send("Final Configuration",   "\n")
> -        self.console_wait_send("Manual Configuration",  "\n")
> -        self.console_wait_send("Complete",              "\n")
> -
> -        self.print_step("Installation finished, rebooting")
> -        self.console_boot_serial()
> +        self.console_wait_send("~ #", "exit\n")
>
>          # setup qemu user
>          prompt =3D "$"
> @@ -183,35 +147,20 @@ class FreeBSDVM(basevm.BaseVM):
>          self.console_ssh_init(prompt, "root", self._config["root_pass"])
>          self.console_sshd_config(prompt)
>
> -        # setup serial console
> -        self.console_wait(prompt)
> -        self.console_send("echo 'console=3Dcomconsole' >>
> /boot/loader.conf\n")
> -
> -        # setup boot delay
> -        self.console_wait(prompt)
> -        self.console_send("echo 'autoboot_delay=3D1' >>
> /boot/loader.conf\n")
> -
>          # setup virtio-blk #1 (tarfile)
>          self.console_wait(prompt)
>          self.console_send("echo 'chmod 666 /dev/vtbd1' >>
> /etc/rc.local\n")
>
> -        self.print_step("Configuration finished, rebooting")
> -        self.console_wait_send(prompt, "reboot\n")
> -        self.console_wait("login:")
> -        self.wait_ssh()
> -
>          self.print_step("Installing packages")
>          self.ssh_root_check("pkg install -y %s\n" % " ".join(self.pkgs))
>
>          # shutdown
>          self.ssh_root(self.poweroff)
> -        self.console_wait("Uptime:")
>          self.wait()
>
>          if os.path.exists(img):
>              os.remove(img)
>          os.rename(img_tmp, img)
> -        os.remove(iso)
>          self.print_step("All done")
>
>  if __name__ =3D=3D "__main__":
> --
> 2.31.1
>
>

--00000000000023e53005f9b7d65a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 19, 2023 at 8:46=E2=80=AF=
AM Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Acco=
rding to QEMU&#39;s support policy, we stop supporting the previous<br>
major release two years after the the new major release has been<br>
published. So we can stop testing FreeBSD 12 now and should switch<br>
our FreeBSD VM to version 13 instead.<br>
<br>
Some changes are needed for this update: The downloadable .ISO images<br>
do not use the serial port as console by default anymore, so they<br>
are not usable in the same way as with FreeBSD 12. Fortunately, the<br>
FreeBSD project now also offers some pre-installed CI images that<br>
have the serial console enabled, so we can use those now, with the<br>
benefit that we can skip almost all parts of the previous installation<br>
process.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0v2: Removed the &quot;ftp/&quot; folder from the URL - it&#39;s not n=
ecessary anymore<br>
=C2=A0 =C2=A0 =C2=A0(thanks to Li-Wen for the hint!)<br>
<br>
=C2=A0tests/vm/freebsd | 101 ++++++++++++----------------------------------=
-<br>
=C2=A01 file changed, 25 insertions(+), 76 deletions(-)<br></blockquote><di=
v><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.=
com">imp@bsdimp.com</a>&gt;</div><div><br></div><div>I also wonder if we sh=
ould expand this to aarch64... but it looks like there&#39;s no CI image</d=
iv><div>for that, so I&#39;ll see if I can make something like that happen =
before 14.0.</div><div><br></div><div>Warner</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
diff --git a/tests/vm/freebsd b/tests/vm/freebsd<br>
index ba2ba23d24..11de6473f4 100755<br>
--- a/tests/vm/freebsd<br>
+++ b/tests/vm/freebsd<br>
@@ -28,15 +28,15 @@ class FreeBSDVM(basevm.BaseVM):<br>
=C2=A0 =C2=A0 =C2=A0name =3D &quot;freebsd&quot;<br>
=C2=A0 =C2=A0 =C2=A0arch =3D &quot;x86_64&quot;<br>
<br>
-=C2=A0 =C2=A0 link =3D &quot;<a href=3D"https://download.freebsd.org/ftp/r=
eleases/ISO-IMAGES/12.4/FreeBSD-12.4-RELEASE-amd64-disc1.iso.xz" rel=3D"nor=
eferrer" target=3D"_blank">https://download.freebsd.org/ftp/releases/ISO-IM=
AGES/12.4/FreeBSD-12.4-RELEASE-amd64-disc1.iso.xz</a>&quot;<br>
-=C2=A0 =C2=A0 csum =3D &quot;1dcf6446e31bf3f81b582e9aba3319a258c29a937a2af=
6138ee4b181ed719a87&quot;<br>
+=C2=A0 =C2=A0 link =3D &quot;<a href=3D"https://download.freebsd.org/relea=
ses/CI-IMAGES/13.2-RELEASE/amd64/Latest/FreeBSD-13.2-RELEASE-amd64-BASIC-CI=
.raw.xz" rel=3D"noreferrer" target=3D"_blank">https://download.freebsd.org/=
releases/CI-IMAGES/13.2-RELEASE/amd64/Latest/FreeBSD-13.2-RELEASE-amd64-BAS=
IC-CI.raw.xz</a>&quot;<br>
+=C2=A0 =C2=A0 csum =3D &quot;a4fb3b6c7b75dd4d58fb0d75e4caf72844bffe0ca00e6=
6459c028b198ffb3c0e&quot;<br>
=C2=A0 =C2=A0 =C2=A0size =3D &quot;20G&quot;<br>
=C2=A0 =C2=A0 =C2=A0pkgs =3D [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# build tools<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;git&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pkgconf&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;bzip2&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;python37&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;python39&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ninja&quot;,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# gnu tools<br>
@@ -78,72 +78,42 @@ class FreeBSDVM(basevm.BaseVM):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir src build; cd src;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar -xf /dev/vtbd1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ../build<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../src/configure --python=3Dpython3.7 {configu=
re_opts};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../src/configure --python=3Dpython3.9 {configu=
re_opts};<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gmake --output-sync -j{jobs} {target} {ve=
rbose};<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
-=C2=A0 =C2=A0 def console_boot_serial(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Autoboot&quot;, &=
quot;3&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;OK&quot;, &quot;s=
et console=3Dcomconsole\n&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;OK&quot;, &quot;b=
oot\n&quot;)<br>
-<br>
=C2=A0 =C2=A0 =C2=A0def build_image(self, img):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.print_step(&quot;Downloading install iso&=
quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.print_step(&quot;Downloading disk image&q=
uot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cimg =3D self._download_with_cache(self.l=
ink, sha256sum=3Dself.csum)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 img_tmp =3D img + &quot;.tmp&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 iso =3D img + &quot;.install.iso&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 iso_xz =3D iso + &quot;.xz&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.print_step(&quot;Preparing iso and disk i=
mage&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call([&quot;cp&quot;, &quot;-=
f&quot;, cimg, iso_xz])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call([&quot;xz&quot;, &quot;-=
dvf&quot;, iso_xz])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.exec_qemu_img(&quot;create&quot;, &quot;-=
f&quot;, &quot;qcow2&quot;, img_tmp, self.size)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.print_step(&quot;Booting installer&quot;)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp_raw =3D img + &quot;.tmp.raw&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp_raw_xz =3D tmp_raw + &quot;.xz&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 img_tmp =3D img + &quot;.tmp.qcow2&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.print_step(&quot;Preparing disk image&quo=
t;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call([&quot;cp&quot;, &quot;-=
f&quot;, cimg, tmp_raw_xz])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call([&quot;xz&quot;, &quot;-=
dvf&quot;, tmp_raw_xz])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.exec_qemu_img(&quot;convert&quot;, &quot;=
-O&quot;, &quot;qcow2&quot;, tmp_raw, img_tmp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.exec_qemu_img(&quot;resize&quot;, img_tmp=
, self.size)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(tmp_raw)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.print_step(&quot;Preparing disk image&quo=
t;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.boot(img_tmp, extra_args =3D [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-machine&quot;, &quot=
;graphics=3Doff&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-device&quot;, &quot;VGA&q=
uot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-cdrom&quot;, iso<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-vga&quot;, &quot;none&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_init()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_boot_serial()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Console type&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;xterm\n&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # pre-install configuration<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Welcome&quot;,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\n&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Keymap Selection&=
quot;,=C2=A0 =C2=A0 =C2=A0 &quot;\n&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Set Hostname&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;freebsd\n&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Distribution Sele=
ct&quot;,=C2=A0 =C2=A0&quot;\n&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Partitioning&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\n&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Partition&quot;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\n&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Scheme&quot;,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\n&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Editor&quot;,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;f&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Confirmation&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;c&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.print_step(&quot;Installation started now=
, this will take a while&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # post-install configuration<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;login:&quot;, &qu=
ot;root\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;~ #&quot;, &quot;=
service growfs onestart\n&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # root user<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;~ #&quot;, &quot;=
passwd\n&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_wait(&quot;New Password:&quo=
t;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_send(&quot;%s\n&quot; % self=
._config[&quot;root_pass&quot;])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_wait(&quot;Retype New Passwo=
rd:&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_send(&quot;%s\n&quot; % self=
._config[&quot;root_pass&quot;])<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Network Configura=
tion&quot;, &quot;\n&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;IPv4&quot;,=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;y&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;DHCP&quot;,=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;y&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;IPv6&quot;,=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;n&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Resolver&quot;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\n&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Time Zone Selecto=
r&quot;,=C2=A0 =C2=A0 &quot;0\n&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Confirmation&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;y&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Time &amp; Date&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\n&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Time &amp; Date&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\n&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;System Configurat=
ion&quot;,=C2=A0 &quot;\n&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;System Hardening&=
quot;,=C2=A0 =C2=A0 =C2=A0 &quot;\n&quot;)<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# qemu user<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Add User Accounts=
&quot;, &quot;y&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;~ #&quot;, &quot;=
adduser\n&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_wait(&quot;Username&quot;)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_send(&quot;%s\n&quot; % self=
._config[&quot;guest_user&quot;])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_wait(&quot;Full name&quot;)<=
br>
@@ -165,13 +135,7 @@ class FreeBSDVM(basevm.BaseVM):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_wait_send(&quot;Lock out&quo=
t;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\n&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_wait_send(&quot;OK&quot;,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ye=
s\n&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_wait_send(&quot;Add another =
user&quot;,=C2=A0 =C2=A0 =C2=A0 &quot;no\n&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Final Configurati=
on&quot;,=C2=A0 =C2=A0&quot;\n&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Manual Configurat=
ion&quot;,=C2=A0 &quot;\n&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Complete&quot;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\n&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.print_step(&quot;Installation finished, r=
ebooting&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_boot_serial()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;~ #&quot;, &quot;=
exit\n&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# setup qemu user<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prompt =3D &quot;$&quot;<br>
@@ -183,35 +147,20 @@ class FreeBSDVM(basevm.BaseVM):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_ssh_init(prompt, &quot;root&=
quot;, self._config[&quot;root_pass&quot;])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_sshd_config(prompt)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # setup serial console<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait(prompt)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_send(&quot;echo &#39;console=3Dco=
mconsole&#39; &gt;&gt; /boot/loader.conf\n&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # setup boot delay<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait(prompt)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_send(&quot;echo &#39;autoboot_del=
ay=3D1&#39; &gt;&gt; /boot/loader.conf\n&quot;)<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# setup virtio-blk #1 (tarfile)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_wait(prompt)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_send(&quot;echo &#39;chmod 6=
66 /dev/vtbd1&#39; &gt;&gt; /etc/rc.local\n&quot;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.print_step(&quot;Configuration finished, =
rebooting&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(prompt, &quot;reboot\n&=
quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait(&quot;login:&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.wait_ssh()<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.print_step(&quot;Installing packages=
&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.ssh_root_check(&quot;pkg install -y =
%s\n&quot; % &quot; &quot;.join(self.pkgs))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# shutdown<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.ssh_root(self.poweroff)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait(&quot;Uptime:&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.wait()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(img):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.remove(img)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.rename(img_tmp, img)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(iso)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.print_step(&quot;All done&quot;)<br>
<br>
=C2=A0if __name__ =3D=3D &quot;__main__&quot;:<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--00000000000023e53005f9b7d65a--

