Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E49151F96
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 18:38:27 +0100 (CET)
Received: from localhost ([::1]:35338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iz29a-0004uB-Qn
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 12:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iz28Z-0004An-SL
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:37:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iz28Y-000364-Ha
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:37:23 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53495)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iz28Y-0002om-9d
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:37:22 -0500
Received: by mail-wm1-x341.google.com with SMTP id s10so4239710wmh.3
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2020 09:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=+Aj/bHdmaF5N4lil8DxvqlhQIHKQbTBCpBKxWFm58Po=;
 b=XlYMnpC6RmVr/LNcgYT4HqsffnkiphemiYkZfjBbkB7/Ok+NSdGsjPhWWsyATWdUp+
 APdAQz2H7ZKnOe3DkLrIebbhjzLbHuekfXuqqpCbyS04NakC/hNUcdr4kJS4MeY+ulE0
 uSQ6Fp6R9z3H5eI4fdUOWvX2oNX/8UtgVm8HKkCrFZo6V6qvWKUYsbD3HcT2CI5kGXuh
 byIv27Y4hD7x84owJwHEahWqUbrbgaHtdZXOW800dRXa3Z2nuqyjnyhsRVbhvNPHY7SI
 SU2ov/4HcvyxRs47aWwIWqOz/FOmKTF0Oip1sIYSXMdLJRWy6NxSDnDJQF/ZRx2Zi2kP
 Kl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=+Aj/bHdmaF5N4lil8DxvqlhQIHKQbTBCpBKxWFm58Po=;
 b=ZbDdPxi6sX19jQn+9V46pIMAt43vP8LAME/nHwrxCzrmxJbFvjxrEMJOxfVXR6JYnQ
 i1+E+2oE/IGYlQEh4ieTkEppKOGVEYOQ/5Pv3vFxQNXJAMJM5luMkpQiz9EwbHXZsysC
 v9QmQf8nYz5MQOz6BBMX33kueAx5neyG9c1Pi4zknA3oBoMI57T1SZTGFoyCsAFFT+xC
 2+08drgo0IQO2y7Z/Un1UTjF4mN8LKNmkCgLiPaQ42qlvmBjm9iQSHY19KOgRNwR9ZCn
 hK84r1AMddeMUZVuQX7fd8yWatwRn9kD0EbmcvSQluXMp1fianhY7MXX80Jc7RLosXG2
 zcLg==
X-Gm-Message-State: APjAAAVbfSgIBxXgnGzUIVkj9AmTVpS4dK0ZspPUQKcB2RRPwILu2u1+
 8uxBqOGACstvYWhP/6lzZ+H5BCEHnf8=
X-Google-Smtp-Source: APXvYqztQX0Q1qeA1YHQ5KiDFWzd4zsuBv2kEpYZsVBpPimzvzrFDUAek07UgyhK46roJr2UpC8U1A==
X-Received: by 2002:a1c:4c5:: with SMTP id 188mr141731wme.82.1580837839923;
 Tue, 04 Feb 2020 09:37:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b11sm15743059wrx.89.2020.02.04.09.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 09:37:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F3B401FF87;
 Tue,  4 Feb 2020 17:37:17 +0000 (GMT)
References: <20200204161104.21077-1-pbonzini@redhat.com>
User-agent: mu4e 1.3.7; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] build: move TARGET_GPROF to config-host.mak
In-reply-to: <20200204161104.21077-1-pbonzini@redhat.com>
Date: Tue, 04 Feb 2020 17:37:17 +0000
Message-ID: <87tv468d9u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> TARGET_GPROF is the same for all targets, write it to
> config-host.mak instead.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  bsd-user/syscall.c   | 6 +++---
>  configure            | 4 +++-
>  linux-user/exit.c    | 4 ++--
>  linux-user/signal.c  | 2 +-
>  tests/check-block.sh | 2 +-
>  5 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> index 0d45b654bb..d38ec7a162 100644
> --- a/bsd-user/syscall.c
> +++ b/bsd-user/syscall.c
> @@ -330,7 +330,7 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, a=
bi_long arg1,
>=20=20
>      switch(num) {
>      case TARGET_FREEBSD_NR_exit:
> -#ifdef TARGET_GPROF
> +#ifdef CONFIG_GPROF
>          _mcleanup();
>  #endif
>          gdb_exit(cpu_env, arg1);
> @@ -432,7 +432,7 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, ab=
i_long arg1,
>=20=20
>      switch(num) {
>      case TARGET_NETBSD_NR_exit:
> -#ifdef TARGET_GPROF
> +#ifdef CONFIG_GPROF
>          _mcleanup();
>  #endif
>          gdb_exit(cpu_env, arg1);
> @@ -511,7 +511,7 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, a=
bi_long arg1,
>=20=20
>      switch(num) {
>      case TARGET_OPENBSD_NR_exit:
> -#ifdef TARGET_GPROF
> +#ifdef CONFIG_GPROF
>          _mcleanup();
>  #endif
>          gdb_exit(cpu_env, arg1);
> diff --git a/configure b/configure
> index 5095f01728..08c28e73db 100755
> --- a/configure
> +++ b/configure
> @@ -6771,6 +6771,9 @@ fi
>  if test "$l2tpv3" =3D "yes" ; then
>    echo "CONFIG_L2TPV3=3Dy" >> $config_host_mak
>  fi
> +if test "$gprof" =3D "yes" ; then
> +  echo "CONFIG_GPROF=3Dy" >> $config_host_mak
> +fi
>  if test "$cap_ng" =3D "yes" ; then
>    echo "CONFIG_LIBCAP_NG=3Dy" >> $config_host_mak
>  fi
> @@ -7951,7 +7954,6 @@ alpha)
>  esac
>=20=20
>  if test "$gprof" =3D "yes" ; then
> -  echo "TARGET_GPROF=3Dy" >> $config_target_mak
>    if test "$target_linux_user" =3D "yes" ; then
>      cflags=3D"-p $cflags"
>      ldflags=3D"-p $ldflags"
> diff --git a/linux-user/exit.c b/linux-user/exit.c
> index a362ef67d2..1594015444 100644
> --- a/linux-user/exit.c
> +++ b/linux-user/exit.c
> @@ -18,7 +18,7 @@
>   */
>  #include "qemu/osdep.h"
>  #include "qemu.h"
> -#ifdef TARGET_GPROF
> +#ifdef CONFIG_GPROF
>  #include <sys/gmon.h>
>  #endif
>=20=20
> @@ -28,7 +28,7 @@ extern void __gcov_dump(void);
>=20=20
>  void preexit_cleanup(CPUArchState *env, int code)
>  {
> -#ifdef TARGET_GPROF
> +#ifdef CONFIG_GPROF
>          _mcleanup();
>  #endif
>  #ifdef CONFIG_GCOV
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 5ca6d62b15..02f860ecb9 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -509,7 +509,7 @@ void signal_init(void)
>      act.sa_flags =3D SA_SIGINFO;
>      act.sa_sigaction =3D host_signal_handler;
>      for(i =3D 1; i <=3D TARGET_NSIG; i++) {
> -#ifdef TARGET_GPROF
> +#ifdef CONFIG_GPROF
>          if (i =3D=3D SIGPROF) {
>              continue;
>          }
> diff --git a/tests/check-block.sh b/tests/check-block.sh
> index 679aedec50..ad320c21ba 100755
> --- a/tests/check-block.sh
> +++ b/tests/check-block.sh
> @@ -16,7 +16,7 @@ if [ "$#" -ne 0 ]; then
>      format_list=3D"$@"
>  fi
>=20=20
> -if grep -q "TARGET_GPROF=3Dy" *-softmmu/config-target.mak 2>/dev/null ; =
then
> +if grep -q "CONFIG_GPROF=3Dy" config-host.mak 2>/dev/null ; then
>      echo "GPROF is enabled =3D=3D> Not running the qemu-iotests."
>      exit 0
>  fi


--=20
Alex Benn=C3=A9e

