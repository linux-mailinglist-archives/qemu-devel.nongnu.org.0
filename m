Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEB5453B68
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 22:05:08 +0100 (CET)
Received: from localhost ([::1]:43048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn5da-0006vJ-Vg
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 16:05:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mn5br-00068q-7C
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 16:03:19 -0500
Received: from [2607:f8b0:4864:20::934] (port=45907
 helo=mail-ua1-x934.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mn5bo-0007qe-Pe
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 16:03:18 -0500
Received: by mail-ua1-x934.google.com with SMTP id ay21so985409uab.12
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 13:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z7NiEVVmkRt3XT9DIUB5KKDVwoUhjmHWAL6IDCO5iNQ=;
 b=60X82N+yNn1HG7bWJdV94/9ALMLRS0M1DCEmZa2/+FTxCtDn+NE3e0mJxxfFi5+Lge
 pZAWbGKiJc+rfitJLHqzv2TQvu+wMlvdPKQK9rl+1F/x0nsoKXA2AMkGCCxkHe2uOyWP
 yEwgZVJ9YgdkxorpgfxLCQ5ubbftdeix0Xd+7tdfhhUSdeZLHNDyYgG9ZCm7SkuqSAAm
 jaKJ/knQwZ6Zmydc332nIyIP2mCNlFC0dVt4Moso7f8kDN1zJooZAdkrWpX+8Iztp51R
 KgtBrsKr6nYS+BfCBCfLgTv6o3n78nCJCvLpQUK0zx8HKujUFIKg0QChvZTkbFOSfR58
 nNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z7NiEVVmkRt3XT9DIUB5KKDVwoUhjmHWAL6IDCO5iNQ=;
 b=g0PKHaOjCCTT2V0821thEY4IpLf1MU0vKdGAYS7wZCtCK9uO53/32hEftNBz9RVZ4D
 QeaYsA8uMjbG5oJ4G2s/n2wvskS3EiM/qkP3SuMM1lZVQ038Df6uZpZLXV2kG83ckksL
 o0qXmVFWkFePJv392FQh2qL+H0UUjd0FFim/fN0nz7epiQLJGjQ+O2RhOSFilY97heQN
 bwfdLPVNmM/7+dHXyV0rCrjN1E9NRwtvAE3xKV9vufY6ylDFB36l/sA8Kg+fKuwDTZko
 LydZxtW7C5Deur2QTqxRxPl63yR9QoFAumdVAc6neWo2OOK43h2FX/0Zf0e3JqzgK4Bi
 AB6Q==
X-Gm-Message-State: AOAM532OYBERS95w/FZXbSnN+gTVhoy5f6oH6tIyj8bn9bxfDdlk6tWy
 hAeW+QUBa6ueIT8dusmNMJQbIjORvMTe5bj2M2qHkg==
X-Google-Smtp-Source: ABdhPJy5J6SpDK82OQn1HVEXJGzuVbXcNAAKUpm5t6vbV0tdqdmH3NbdgqXhaWLrARnNtL5Qh/Jy41Hq4TcgZarUz8k=
X-Received: by 2002:a05:6102:5f2:: with SMTP id
 w18mr62406176vsf.6.1637096595811; 
 Tue, 16 Nov 2021 13:03:15 -0800 (PST)
MIME-Version: 1.0
References: <20211116110256.365484-1-richard.henderson@linaro.org>
 <20211116110256.365484-4-richard.henderson@linaro.org>
In-Reply-To: <20211116110256.365484-4-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 16 Nov 2021 14:03:04 -0700
Message-ID: <CANCZdfoaw3X=ArOz2+tdZJ+gLRS7Wizzyc7MFHXrJyGH0nPVww@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] linux-user/safe-syscall.inc.S: Move to common-user
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000e831c05d0ee4182"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::934
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::934;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000e831c05d0ee4182
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 16, 2021 at 4:03 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> From: Warner Losh <imp@bsdimp.com>
>
> Move all the safe_syscall.inc.S files to common-user. They are almost
> identical between linux-user and bsd-user to re-use.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20211113045603.60391-4-imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build                                                 | 1 +
>  {linux-user => common-user}/host/aarch64/hostdep.h          | 0
>  {linux-user => common-user}/host/arm/hostdep.h              | 0
>  {linux-user => common-user}/host/i386/hostdep.h             | 0
>  {linux-user => common-user}/host/ppc64/hostdep.h            | 0
>  {linux-user => common-user}/host/riscv/hostdep.h            | 0
>  {linux-user => common-user}/host/s390x/hostdep.h            | 0
>  {linux-user => common-user}/host/x86_64/hostdep.h           | 0
>  {linux-user => common-user}/host/aarch64/safe-syscall.inc.S | 0
>  {linux-user => common-user}/host/arm/safe-syscall.inc.S     | 0
>  {linux-user => common-user}/host/i386/safe-syscall.inc.S    | 0
>  {linux-user => common-user}/host/ppc64/safe-syscall.inc.S   | 0
>  {linux-user => common-user}/host/riscv/safe-syscall.inc.S   | 0
>  {linux-user => common-user}/host/s390x/safe-syscall.inc.S   | 0
>  {linux-user => common-user}/host/x86_64/safe-syscall.inc.S  | 0
>  15 files changed, 1 insertion(+)
>  rename {linux-user => common-user}/host/aarch64/hostdep.h (100%)
>  rename {linux-user => common-user}/host/arm/hostdep.h (100%)
>  rename {linux-user => common-user}/host/i386/hostdep.h (100%)
>  rename {linux-user => common-user}/host/ppc64/hostdep.h (100%)
>  rename {linux-user => common-user}/host/riscv/hostdep.h (100%)
>  rename {linux-user => common-user}/host/s390x/hostdep.h (100%)
>  rename {linux-user => common-user}/host/x86_64/hostdep.h (100%)
>  rename {linux-user => common-user}/host/aarch64/safe-syscall.inc.S (100%)
>  rename {linux-user => common-user}/host/arm/safe-syscall.inc.S (100%)
>  rename {linux-user => common-user}/host/i386/safe-syscall.inc.S (100%)
>  rename {linux-user => common-user}/host/ppc64/safe-syscall.inc.S (100%)
>  rename {linux-user => common-user}/host/riscv/safe-syscall.inc.S (100%)
>  rename {linux-user => common-user}/host/s390x/safe-syscall.inc.S (100%)
>  rename {linux-user => common-user}/host/x86_64/safe-syscall.inc.S (100%)
>
> diff --git a/meson.build b/meson.build
> index ccc6cefc25..ec22cf05c1 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2878,6 +2878,7 @@ foreach target : target_dirs
>      if 'CONFIG_LINUX_USER' in config_target
>        base_dir = 'linux-user'
>        target_inc += include_directories('linux-user/host/' /
> config_host['ARCH'])
> +      target_inc += include_directories('common-user/host/' /
> config_host['ARCH'])
>      endif
>      if 'CONFIG_BSD_USER' in config_target
>        base_dir = 'bsd-user'
>

I had to add this:

diff --git a/meson.build b/meson.build
index 0a88bff8d2..349e7a988f 100644
--- a/meson.build
+++ b/meson.build
@@ -2880,6 +2880,8 @@ foreach target : target_dirs
     endif
     if 'CONFIG_BSD_USER' in config_target
       base_dir = 'bsd-user'
+      target_inc += include_directories('bsd-user/host/' /
config_host['ARCH'])
+      target_inc += include_directories('common-user/host/' /
config_host['ARCH'])
       target_inc += include_directories('bsd-user/' / targetos)
       dir = base_dir / abi
       arch_srcs += files(dir / 'target_arch_cpu.c')

to get bsd-user compiling.


> diff --git a/linux-user/host/aarch64/hostdep.h
> b/common-user/host/aarch64/hostdep.h
> similarity index 100%
> rename from linux-user/host/aarch64/hostdep.h
> rename to common-user/host/aarch64/hostdep.h
> diff --git a/linux-user/host/arm/hostdep.h b/common-user/host/arm/hostdep.h
> similarity index 100%
> rename from linux-user/host/arm/hostdep.h
> rename to common-user/host/arm/hostdep.h
> diff --git a/linux-user/host/i386/hostdep.h
> b/common-user/host/i386/hostdep.h
> similarity index 100%
> rename from linux-user/host/i386/hostdep.h
> rename to common-user/host/i386/hostdep.h
> diff --git a/linux-user/host/ppc64/hostdep.h
> b/common-user/host/ppc64/hostdep.h
> similarity index 100%
> rename from linux-user/host/ppc64/hostdep.h
> rename to common-user/host/ppc64/hostdep.h
> diff --git a/linux-user/host/riscv/hostdep.h
> b/common-user/host/riscv/hostdep.h
> similarity index 100%
> rename from linux-user/host/riscv/hostdep.h
> rename to common-user/host/riscv/hostdep.h
> diff --git a/linux-user/host/s390x/hostdep.h
> b/common-user/host/s390x/hostdep.h
> similarity index 100%
> rename from linux-user/host/s390x/hostdep.h
> rename to common-user/host/s390x/hostdep.h
> diff --git a/linux-user/host/x86_64/hostdep.h
> b/common-user/host/x86_64/hostdep.h
> similarity index 100%
> rename from linux-user/host/x86_64/hostdep.h
> rename to common-user/host/x86_64/hostdep.h
> diff --git a/linux-user/host/aarch64/safe-syscall.inc.S
> b/common-user/host/aarch64/safe-syscall.inc.S
> similarity index 100%
> rename from linux-user/host/aarch64/safe-syscall.inc.S
> rename to common-user/host/aarch64/safe-syscall.inc.S
> diff --git a/linux-user/host/arm/safe-syscall.inc.S
> b/common-user/host/arm/safe-syscall.inc.S
> similarity index 100%
> rename from linux-user/host/arm/safe-syscall.inc.S
> rename to common-user/host/arm/safe-syscall.inc.S
> diff --git a/linux-user/host/i386/safe-syscall.inc.S
> b/common-user/host/i386/safe-syscall.inc.S
> similarity index 100%
> rename from linux-user/host/i386/safe-syscall.inc.S
> rename to common-user/host/i386/safe-syscall.inc.S
> diff --git a/linux-user/host/ppc64/safe-syscall.inc.S
> b/common-user/host/ppc64/safe-syscall.inc.S
> similarity index 100%
> rename from linux-user/host/ppc64/safe-syscall.inc.S
> rename to common-user/host/ppc64/safe-syscall.inc.S
> diff --git a/linux-user/host/riscv/safe-syscall.inc.S
> b/common-user/host/riscv/safe-syscall.inc.S
> similarity index 100%
> rename from linux-user/host/riscv/safe-syscall.inc.S
> rename to common-user/host/riscv/safe-syscall.inc.S
> diff --git a/linux-user/host/s390x/safe-syscall.inc.S
> b/common-user/host/s390x/safe-syscall.inc.S
> similarity index 100%
> rename from linux-user/host/s390x/safe-syscall.inc.S
> rename to common-user/host/s390x/safe-syscall.inc.S
> diff --git a/linux-user/host/x86_64/safe-syscall.inc.S
> b/common-user/host/x86_64/safe-syscall.inc.S
> similarity index 100%
> rename from linux-user/host/x86_64/safe-syscall.inc.S
> rename to common-user/host/x86_64/safe-syscall.inc.S
> --
> 2.25.1
>
>

--0000000000000e831c05d0ee4182
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 16, 2021 at 4:03 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" t=
arget=3D"_blank">imp@bsdimp.com</a>&gt;<br>
<br>
Move all the safe_syscall.inc.S files to common-user. They are almost<br>
identical between linux-user and bsd-user to re-use.<br>
<br>
Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"=
_blank">imp@bsdimp.com</a>&gt;<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20211113045603.60391-4-imp@bsdimp.com" ta=
rget=3D"_blank">20211113045603.60391-4-imp@bsdimp.com</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0{linux-user =3D&gt; common-user}/host/aarch64/hostdep.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/arm/hostdep.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/i386/hostdep.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/ppc64/hostdep.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/riscv/hostdep.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/s390x/hostdep.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/x86_64/hostdep.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/aarch64/safe-syscall.inc.S | 0<=
br>
=C2=A0{linux-user =3D&gt; common-user}/host/arm/safe-syscall.inc.S=C2=A0 =
=C2=A0 =C2=A0| 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/i386/safe-syscall.inc.S=C2=A0 =
=C2=A0 | 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/ppc64/safe-syscall.inc.S=C2=A0 =
=C2=A0| 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/riscv/safe-syscall.inc.S=C2=A0 =
=C2=A0| 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/s390x/safe-syscall.inc.S=C2=A0 =
=C2=A0| 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/x86_64/safe-syscall.inc.S=C2=A0=
 | 0<br>
=C2=A015 files changed, 1 insertion(+)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/aarch64/hostdep.h (100%)=
<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/arm/hostdep.h (100%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/i386/hostdep.h (100%)<br=
>
=C2=A0rename {linux-user =3D&gt; common-user}/host/ppc64/hostdep.h (100%)<b=
r>
=C2=A0rename {linux-user =3D&gt; common-user}/host/riscv/hostdep.h (100%)<b=
r>
=C2=A0rename {linux-user =3D&gt; common-user}/host/s390x/hostdep.h (100%)<b=
r>
=C2=A0rename {linux-user =3D&gt; common-user}/host/x86_64/hostdep.h (100%)<=
br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/aarch64/safe-syscall.inc=
.S (100%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/arm/safe-syscall.inc.S (=
100%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/i386/safe-syscall.inc.S =
(100%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/ppc64/safe-syscall.inc.S=
 (100%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/riscv/safe-syscall.inc.S=
 (100%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/s390x/safe-syscall.inc.S=
 (100%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/x86_64/safe-syscall.inc.=
S (100%)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index ccc6cefc25..ec22cf05c1 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -2878,6 +2878,7 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0if &#39;CONFIG_LINUX_USER&#39; in config_target<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0base_dir =3D &#39;linux-user&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0target_inc +=3D include_directories(&#39;linux-u=
ser/host/&#39; / config_host[&#39;ARCH&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 target_inc +=3D include_directories(&#39;common-user/=
host/&#39; / config_host[&#39;ARCH&#39;])<br>
=C2=A0 =C2=A0 =C2=A0endif<br>
=C2=A0 =C2=A0 =C2=A0if &#39;CONFIG_BSD_USER&#39; in config_target<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0base_dir =3D &#39;bsd-user&#39;<br></blockquote>=
<div><br></div><div>I had to add this:</div><div><br></div><div>diff --git =
a/meson.build b/meson.build<br>index 0a88bff8d2..349e7a988f 100644<br>--- a=
/meson.build<br>+++ b/meson.build<br>@@ -2880,6 +2880,8 @@ foreach target :=
 target_dirs<br>=C2=A0 =C2=A0 =C2=A0endif<br>=C2=A0 =C2=A0 =C2=A0if &#39;CO=
NFIG_BSD_USER&#39; in config_target<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0base_dir =
=3D &#39;bsd-user&#39;<br>+ =C2=A0 =C2=A0 =C2=A0target_inc +=3D include_dir=
ectories(&#39;bsd-user/host/&#39; / config_host[&#39;ARCH&#39;])<br>+ =C2=
=A0 =C2=A0 =C2=A0target_inc +=3D include_directories(&#39;common-user/host/=
&#39; / config_host[&#39;ARCH&#39;])<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0target_i=
nc +=3D include_directories(&#39;bsd-user/&#39; / targetos)<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0dir =3D base_dir / abi<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0arch_=
srcs +=3D files(dir / &#39;target_arch_cpu.c&#39;)<br></div><div><br></div>=
<div>to get bsd-user compiling.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
diff --git a/linux-user/host/aarch64/hostdep.h b/common-user/host/aarch64/h=
ostdep.h<br>
similarity index 100%<br>
rename from linux-user/host/aarch64/hostdep.h<br>
rename to common-user/host/aarch64/hostdep.h<br>
diff --git a/linux-user/host/arm/hostdep.h b/common-user/host/arm/hostdep.h=
<br>
similarity index 100%<br>
rename from linux-user/host/arm/hostdep.h<br>
rename to common-user/host/arm/hostdep.h<br>
diff --git a/linux-user/host/i386/hostdep.h b/common-user/host/i386/hostdep=
.h<br>
similarity index 100%<br>
rename from linux-user/host/i386/hostdep.h<br>
rename to common-user/host/i386/hostdep.h<br>
diff --git a/linux-user/host/ppc64/hostdep.h b/common-user/host/ppc64/hostd=
ep.h<br>
similarity index 100%<br>
rename from linux-user/host/ppc64/hostdep.h<br>
rename to common-user/host/ppc64/hostdep.h<br>
diff --git a/linux-user/host/riscv/hostdep.h b/common-user/host/riscv/hostd=
ep.h<br>
similarity index 100%<br>
rename from linux-user/host/riscv/hostdep.h<br>
rename to common-user/host/riscv/hostdep.h<br>
diff --git a/linux-user/host/s390x/hostdep.h b/common-user/host/s390x/hostd=
ep.h<br>
similarity index 100%<br>
rename from linux-user/host/s390x/hostdep.h<br>
rename to common-user/host/s390x/hostdep.h<br>
diff --git a/linux-user/host/x86_64/hostdep.h b/common-user/host/x86_64/hos=
tdep.h<br>
similarity index 100%<br>
rename from linux-user/host/x86_64/hostdep.h<br>
rename to common-user/host/x86_64/hostdep.h<br>
diff --git a/linux-user/host/aarch64/safe-syscall.inc.S b/common-user/host/=
aarch64/safe-syscall.inc.S<br>
similarity index 100%<br>
rename from linux-user/host/aarch64/safe-syscall.inc.S<br>
rename to common-user/host/aarch64/safe-syscall.inc.S<br>
diff --git a/linux-user/host/arm/safe-syscall.inc.S b/common-user/host/arm/=
safe-syscall.inc.S<br>
similarity index 100%<br>
rename from linux-user/host/arm/safe-syscall.inc.S<br>
rename to common-user/host/arm/safe-syscall.inc.S<br>
diff --git a/linux-user/host/i386/safe-syscall.inc.S b/common-user/host/i38=
6/safe-syscall.inc.S<br>
similarity index 100%<br>
rename from linux-user/host/i386/safe-syscall.inc.S<br>
rename to common-user/host/i386/safe-syscall.inc.S<br>
diff --git a/linux-user/host/ppc64/safe-syscall.inc.S b/common-user/host/pp=
c64/safe-syscall.inc.S<br>
similarity index 100%<br>
rename from linux-user/host/ppc64/safe-syscall.inc.S<br>
rename to common-user/host/ppc64/safe-syscall.inc.S<br>
diff --git a/linux-user/host/riscv/safe-syscall.inc.S b/common-user/host/ri=
scv/safe-syscall.inc.S<br>
similarity index 100%<br>
rename from linux-user/host/riscv/safe-syscall.inc.S<br>
rename to common-user/host/riscv/safe-syscall.inc.S<br>
diff --git a/linux-user/host/s390x/safe-syscall.inc.S b/common-user/host/s3=
90x/safe-syscall.inc.S<br>
similarity index 100%<br>
rename from linux-user/host/s390x/safe-syscall.inc.S<br>
rename to common-user/host/s390x/safe-syscall.inc.S<br>
diff --git a/linux-user/host/x86_64/safe-syscall.inc.S b/common-user/host/x=
86_64/safe-syscall.inc.S<br>
similarity index 100%<br>
rename from linux-user/host/x86_64/safe-syscall.inc.S<br>
rename to common-user/host/x86_64/safe-syscall.inc.S<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000000e831c05d0ee4182--

