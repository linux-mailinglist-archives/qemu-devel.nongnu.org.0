Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B54F42FAF3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:26:05 +0200 (CEST)
Received: from localhost ([::1]:34304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbRu4-0001U0-SZ
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRqK-00053K-T7
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:22:09 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:44588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRqF-00061J-AJ
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:22:08 -0400
Received: by mail-ua1-x929.google.com with SMTP id r22so8945651uat.11
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=17U0aViqdI7nO2q/vKo+98NAxrGE9DqCjbTyR/O8Xr0=;
 b=q8PRZVPu2Zh9SKlVJbWPLoN099gqE+390gqeKZ4wHeJBnpP9YRPJS43O8HJ+Mb71VL
 yzBGi4fqMXeRe22uP6Gt+0Nr2UHCZb5PI91roMZsi/d4Su7m2y00jHpZL6JOtQ/Wvho0
 m3q0bgtaqwvzl5SY6I5Z0HH1e3oM9/ax2aKAYlx6815BRA1IqsAWThOsPl0E54vDXFHJ
 YNqqPpRvo42pa0rDWY8hPGK6TbAtPmBoKbbdfr1C4CJ+hMq1fgiGtH1smQnd7cv5ODpa
 0sncidMxBm8Se2W7KvE8AKBXCuM16s2whODhfXWDCV1BqsIpzgZF6fVpe/SblSSon+jd
 2s3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=17U0aViqdI7nO2q/vKo+98NAxrGE9DqCjbTyR/O8Xr0=;
 b=opIA0ivIdihnbgISSX9Ga+EM2/nZOJLxFRk03FWaZ9qV+mK0cGHdVquzWppjv0jfLl
 cCr0TNDrxFglNDMVtj8dDgSZYriEWif9/hy6rvesYZ0I1Jls0LPGZhgiG1ZxOtaKTww1
 q2evOc4k844o3itAKGEw9dpMMFrr+KWdotROQ4jlz4/uW/DrBjj5MYmwo3gm36aHohAy
 mS6puRmnDhEtivHULcnNBOjAbPLlp6Zi8nlsXiXo3EbK6WUfmTSDfFWXFXSDL9bJ7u2T
 k1TOTxcZJ7lUau/5t3BG5ruV93kM2h9ZlNVihk835cbw8tqW1wACQtXF/7QFGQvXXx6a
 YPHQ==
X-Gm-Message-State: AOAM5307Axx8h6616CgWpVswJUid583UBA2C9qn+BkE5n26LOJ2JInAT
 i12RtV77qMtdupjx2ETmf9wtomo7WELfZIPlq3Wt7Q==
X-Google-Smtp-Source: ABdhPJynd/Uy5s2B3vnt0qJ4/rsDVL3Jz0YOYMjqKE7P0taQM5MThLi+ScU6jsMdzKst5S32yKrYQDhJVYy8lRPsdeE=
X-Received: by 2002:ab0:5b5d:: with SMTP id v29mr14250513uae.85.1634322122133; 
 Fri, 15 Oct 2021 11:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-6-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-6-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:21:51 -0600
Message-ID: <CANCZdfpOa+VhAYfYCvybeap7hcvyS2ncx3Ls0ehJaX33raDw+g@mail.gmail.com>
Subject: Re: [PATCH v5 05/67] configure: Merge riscv32 and riscv64 host
 architectures
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000089e4f305ce684580"
Received-SPF: none client-ip=2607:f8b0:4864:20::929;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000089e4f305ce684580
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 10:10 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> The existing code for safe-syscall.inc.S will compile
> without change for riscv32 and riscv64.  We may also
> drop the meson.build stanza that merges them for tcg/.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure                                             |  8 ++------
>  meson.build                                           |  4 +---
>  linux-user/host/{riscv64 =3D> riscv}/hostdep.h          |  4 ++--
>  linux-user/host/riscv32/hostdep.h                     | 11 -----------
>  linux-user/host/{riscv64 =3D> riscv}/safe-syscall.inc.S |  0
>  5 files changed, 5 insertions(+), 22 deletions(-)
>  rename linux-user/host/{riscv64 =3D> riscv}/hostdep.h (94%)
>  delete mode 100644 linux-user/host/riscv32/hostdep.h
>  rename linux-user/host/{riscv64 =3D> riscv}/safe-syscall.inc.S (100%)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/configure b/configure
> index 039467c04b..d57ad58342 100755
> --- a/configure
> +++ b/configure
> @@ -570,11 +570,7 @@ elif check_define __s390__ ; then
>      cpu=3D"s390"
>    fi
>  elif check_define __riscv ; then
> -  if check_define _LP64 ; then
> -    cpu=3D"riscv64"
> -  else
> -    cpu=3D"riscv32"
> -  fi
> +  cpu=3D"riscv"
>  elif check_define __arm__ ; then
>    cpu=3D"arm"
>  elif check_define __aarch64__ ; then
> @@ -587,7 +583,7 @@ ARCH=3D
>  # Normalise host CPU name and set ARCH.
>  # Note that this case should only have supported host CPUs, not guests.
>  case "$cpu" in
> -  ppc|ppc64|s390x|sparc64|x32|riscv32|riscv64)
> +  ppc|ppc64|s390x|sparc64|x32|riscv)
>    ;;
>    ppc64le)
>      ARCH=3D"ppc64"
> diff --git a/meson.build b/meson.build
> index 6b7487b725..1a8fc2c4e0 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -52,7 +52,7 @@ have_block =3D have_system or have_tools
>  python =3D import('python').find_installation()
>
>  supported_oses =3D ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin',
> 'sunos', 'linux']
> -supported_cpus =3D ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86'=
,
> 'x86_64',
> +supported_cpus =3D ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64',
>    'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
>
>  cpu =3D host_machine.cpu_family()
> @@ -342,8 +342,6 @@ if not get_option('tcg').disabled()
>      tcg_arch =3D 'i386'
>    elif config_host['ARCH'] =3D=3D 'ppc64'
>      tcg_arch =3D 'ppc'
> -  elif config_host['ARCH'] in ['riscv32', 'riscv64']
> -    tcg_arch =3D 'riscv'
>    endif
>    add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' /
> tcg_arch,
>                          language: ['c', 'cpp', 'objc'])
> diff --git a/linux-user/host/riscv64/hostdep.h
> b/linux-user/host/riscv/hostdep.h
> similarity index 94%
> rename from linux-user/host/riscv64/hostdep.h
> rename to linux-user/host/riscv/hostdep.h
> index 865f0fb9ff..2ba07456ae 100644
> --- a/linux-user/host/riscv64/hostdep.h
> +++ b/linux-user/host/riscv/hostdep.h
> @@ -5,8 +5,8 @@
>   * See the COPYING file in the top-level directory.
>   */
>
> -#ifndef RISCV64_HOSTDEP_H
> -#define RISCV64_HOSTDEP_H
> +#ifndef RISCV_HOSTDEP_H
> +#define RISCV_HOSTDEP_H
>
>  /* We have a safe-syscall.inc.S */
>  #define HAVE_SAFE_SYSCALL
> diff --git a/linux-user/host/riscv32/hostdep.h
> b/linux-user/host/riscv32/hostdep.h
> deleted file mode 100644
> index adf9edbf2d..0000000000
> --- a/linux-user/host/riscv32/hostdep.h
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -/*
> - * hostdep.h : things which are dependent on the host architecture
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef RISCV32_HOSTDEP_H
> -#define RISCV32_HOSTDEP_H
> -
> -#endif
> diff --git a/linux-user/host/riscv64/safe-syscall.inc.S
> b/linux-user/host/riscv/safe-syscall.inc.S
> similarity index 100%
> rename from linux-user/host/riscv64/safe-syscall.inc.S
> rename to linux-user/host/riscv/safe-syscall.inc.S
> --
> 2.25.1
>
>

--00000000000089e4f305ce684580
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:10 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">The existing code for safe-syscall.inc.S will compile<br=
>
without change for riscv32 and riscv64.=C2=A0 We may also<br>
drop the meson.build stanza that merges them for tcg/.<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +---<br>
=C2=A0linux-user/host/{riscv64 =3D&gt; riscv}/hostdep.h=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0linux-user/host/riscv32/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 -----------<br>
=C2=A0linux-user/host/{riscv64 =3D&gt; riscv}/safe-syscall.inc.S |=C2=A0 0<=
br>
=C2=A05 files changed, 5 insertions(+), 22 deletions(-)<br>
=C2=A0rename linux-user/host/{riscv64 =3D&gt; riscv}/hostdep.h (94%)<br>
=C2=A0delete mode 100644 linux-user/host/riscv32/hostdep.h<br>
=C2=A0rename linux-user/host/{riscv64 =3D&gt; riscv}/safe-syscall.inc.S (10=
0%)<br></blockquote><div><br></div><div><div>Reviewed-by: Warner Losh &lt;<=
a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt;</div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/configure b/configure<br>
index 039467c04b..d57ad58342 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -570,11 +570,7 @@ elif check_define __s390__ ; then<br>
=C2=A0 =C2=A0 =C2=A0cpu=3D&quot;s390&quot;<br>
=C2=A0 =C2=A0fi<br>
=C2=A0elif check_define __riscv ; then<br>
-=C2=A0 if check_define _LP64 ; then<br>
-=C2=A0 =C2=A0 cpu=3D&quot;riscv64&quot;<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 cpu=3D&quot;riscv32&quot;<br>
-=C2=A0 fi<br>
+=C2=A0 cpu=3D&quot;riscv&quot;<br>
=C2=A0elif check_define __arm__ ; then<br>
=C2=A0 =C2=A0cpu=3D&quot;arm&quot;<br>
=C2=A0elif check_define __aarch64__ ; then<br>
@@ -587,7 +583,7 @@ ARCH=3D<br>
=C2=A0# Normalise host CPU name and set ARCH.<br>
=C2=A0# Note that this case should only have supported host CPUs, not guest=
s.<br>
=C2=A0case &quot;$cpu&quot; in<br>
-=C2=A0 ppc|ppc64|s390x|sparc64|x32|riscv32|riscv64)<br>
+=C2=A0 ppc|ppc64|s390x|sparc64|x32|riscv)<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0ppc64le)<br>
=C2=A0 =C2=A0 =C2=A0ARCH=3D&quot;ppc64&quot;<br>
diff --git a/meson.build b/meson.build<br>
index 6b7487b725..1a8fc2c4e0 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -52,7 +52,7 @@ have_block =3D have_system or have_tools<br>
=C2=A0python =3D import(&#39;python&#39;).find_installation()<br>
<br>
=C2=A0supported_oses =3D [&#39;windows&#39;, &#39;freebsd&#39;, &#39;netbsd=
&#39;, &#39;openbsd&#39;, &#39;darwin&#39;, &#39;sunos&#39;, &#39;linux&#39=
;]<br>
-supported_cpus =3D [&#39;ppc&#39;, &#39;ppc64&#39;, &#39;s390x&#39;, &#39;=
riscv32&#39;, &#39;riscv64&#39;, &#39;x86&#39;, &#39;x86_64&#39;,<br>
+supported_cpus =3D [&#39;ppc&#39;, &#39;ppc64&#39;, &#39;s390x&#39;, &#39;=
riscv&#39;, &#39;x86&#39;, &#39;x86_64&#39;,<br>
=C2=A0 =C2=A0&#39;arm&#39;, &#39;aarch64&#39;, &#39;mips&#39;, &#39;mips64&=
#39;, &#39;sparc&#39;, &#39;sparc64&#39;]<br>
<br>
=C2=A0cpu =3D host_machine.cpu_family()<br>
@@ -342,8 +342,6 @@ if not get_option(&#39;tcg&#39;).disabled()<br>
=C2=A0 =C2=A0 =C2=A0tcg_arch =3D &#39;i386&#39;<br>
=C2=A0 =C2=A0elif config_host[&#39;ARCH&#39;] =3D=3D &#39;ppc64&#39;<br>
=C2=A0 =C2=A0 =C2=A0tcg_arch =3D &#39;ppc&#39;<br>
-=C2=A0 elif config_host[&#39;ARCH&#39;] in [&#39;riscv32&#39;, &#39;riscv6=
4&#39;]<br>
-=C2=A0 =C2=A0 tcg_arch =3D &#39;riscv&#39;<br>
=C2=A0 =C2=A0endif<br>
=C2=A0 =C2=A0add_project_arguments(&#39;-iquote&#39;, meson.current_source_=
dir() / &#39;tcg&#39; / tcg_arch,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0language: [&#39;c&#39;, &#39;cpp&#39;, &#39;objc&#39;])<br=
>
diff --git a/linux-user/host/riscv64/hostdep.h b/linux-user/host/riscv/host=
dep.h<br>
similarity index 94%<br>
rename from linux-user/host/riscv64/hostdep.h<br>
rename to linux-user/host/riscv/hostdep.h<br>
index 865f0fb9ff..2ba07456ae 100644<br>
--- a/linux-user/host/riscv64/hostdep.h<br>
+++ b/linux-user/host/riscv/hostdep.h<br>
@@ -5,8 +5,8 @@<br>
=C2=A0 * See the COPYING file in the top-level directory.<br>
=C2=A0 */<br>
<br>
-#ifndef RISCV64_HOSTDEP_H<br>
-#define RISCV64_HOSTDEP_H<br>
+#ifndef RISCV_HOSTDEP_H<br>
+#define RISCV_HOSTDEP_H<br>
<br>
=C2=A0/* We have a safe-syscall.inc.S */<br>
=C2=A0#define HAVE_SAFE_SYSCALL<br>
diff --git a/linux-user/host/riscv32/hostdep.h b/linux-user/host/riscv32/ho=
stdep.h<br>
deleted file mode 100644<br>
index adf9edbf2d..0000000000<br>
--- a/linux-user/host/riscv32/hostdep.h<br>
+++ /dev/null<br>
@@ -1,11 +0,0 @@<br>
-/*<br>
- * hostdep.h : things which are dependent on the host architecture<br>
- *<br>
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
- * See the COPYING file in the top-level directory.<br>
- */<br>
-<br>
-#ifndef RISCV32_HOSTDEP_H<br>
-#define RISCV32_HOSTDEP_H<br>
-<br>
-#endif<br>
diff --git a/linux-user/host/riscv64/safe-syscall.inc.S b/linux-user/host/r=
iscv/safe-syscall.inc.S<br>
similarity index 100%<br>
rename from linux-user/host/riscv64/safe-syscall.inc.S<br>
rename to linux-user/host/riscv/safe-syscall.inc.S<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000089e4f305ce684580--

