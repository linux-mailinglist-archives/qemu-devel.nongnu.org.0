Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25103410DB5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 00:59:01 +0200 (CEST)
Received: from localhost ([::1]:50602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS5lz-0005js-Oo
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 18:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mS5ki-000547-2d
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 18:57:40 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:34782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mS5kg-0006UM-D5
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 18:57:39 -0400
Received: by mail-il1-x133.google.com with SMTP id w1so16640660ilv.1
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 15:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VfOVEPG/1Z8PIQ6ScsL2IZ6oPjAM6tmISFX7oGZSlqs=;
 b=dKYpYfQq/WHknGR9S6+aEHkEmeFkjwx9gCjJeObwPOqeQ2Tum0PNggG4xBHIVx5sqN
 Ot7iOC7vadZaio2RmIGfbUqqZnC6OfcuEzQXSrhbLOZuvMPrq2+RgrqgWgjj7Z4OdLJH
 4oY/LRmUIGwrZWvO590ZEvo6q5g5BTC92xjtv+uH7BK89pVuxORNfqcqsOIOFqRRsq+V
 cZib4bGEw6CP3lDIaLphhO0WE2InuIB6avBz3npXIOIS+LCXZxgnQB/h1RzNhDQdjlVx
 VKbx6MuxOqEpy3+E/E6CfXhUlcGBCbWcsjKr/uFL01gSujfrAelT/2jB6VG/Y/YBUVpY
 QUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VfOVEPG/1Z8PIQ6ScsL2IZ6oPjAM6tmISFX7oGZSlqs=;
 b=Rm091mM5uobfURws0fcTGl7I4mWPWSvcnyu3ftKF7h9od/8yBWUtQce9AylM4kzp0K
 4jgGW/spg4RAm1DozUGyyGwlOZeGAjYb9d9BNDAro6rbs5a+S9IfaAQFY5B4S5qwjk6Z
 CfuxXKdiP+OdH4UdI/K0bGceiFJNUstHX9+SP2KlCl66EkKRF/3E0RaCV+oz6nrZuwmm
 i+4Q6YjAlPrvq+K1pkJnp2fe89ELo04lTwEaWOAtzy4gJF5xH9IcQaMJjz0EnG9RZhp0
 qieVESkDR6TP7YJy+ca/PN5RB52rELbxBPnzDrCGXpLzzH6ZO3OR/evwDBGvMkt9Pjgb
 WG+Q==
X-Gm-Message-State: AOAM531kyOvbiqE/hi0F9QDJhAIKqMZJXkwpP5Qf8c8J+4aPzoDC8JGd
 rZYOuOLLIM4hU90J6uv04rfM2/2pgcoB1S/ClII=
X-Google-Smtp-Source: ABdhPJzWcuVTB08/c87gSdsycMJ2GYgxJS/bWLkDSMvTOkcUA+SfXYPTpu7mXTSsbQtKYckLHQgZpOI57c8hyQOp7U4=
X-Received: by 2002:a05:6e02:964:: with SMTP id
 q4mr15713575ilt.290.1632092256834; 
 Sun, 19 Sep 2021 15:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-6-richard.henderson@linaro.org>
In-Reply-To: <20210918184527.408540-6-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 20 Sep 2021 08:57:10 +1000
Message-ID: <CAKmqyKM++_T1cppcHH0thZ=8yJ-rSOtiOrGK+0zS_=3S1xDrYQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/41] configure: Merge riscv32 and riscv64 host
 architectures
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 19, 2021 at 4:53 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The existing code for safe-syscall.inc.S will compile
> without change for riscv32 and riscv64.  We may also
> drop the meson.build stanza that merges them for tcg/.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  configure                                             |  8 ++------
>  meson.build                                           |  4 +---
>  linux-user/host/{riscv64 => riscv}/hostdep.h          |  4 ++--
>  linux-user/host/riscv32/hostdep.h                     | 11 -----------
>  linux-user/host/{riscv64 => riscv}/safe-syscall.inc.S |  0
>  5 files changed, 5 insertions(+), 22 deletions(-)
>  rename linux-user/host/{riscv64 => riscv}/hostdep.h (94%)
>  delete mode 100644 linux-user/host/riscv32/hostdep.h
>  rename linux-user/host/{riscv64 => riscv}/safe-syscall.inc.S (100%)
>
> diff --git a/configure b/configure
> index da2501489f..6ff037bac1 100755
> --- a/configure
> +++ b/configure
> @@ -650,11 +650,7 @@ elif check_define __s390__ ; then
>      cpu="s390"
>    fi
>  elif check_define __riscv ; then
> -  if check_define _LP64 ; then
> -    cpu="riscv64"
> -  else
> -    cpu="riscv32"
> -  fi
> +  cpu="riscv"
>  elif check_define __arm__ ; then
>    cpu="arm"
>  elif check_define __aarch64__ ; then
> @@ -667,7 +663,7 @@ ARCH=
>  # Normalise host CPU name and set ARCH.
>  # Note that this case should only have supported host CPUs, not guests.
>  case "$cpu" in
> -  ppc|ppc64|s390x|sparc64|x32|riscv32|riscv64)
> +  ppc|ppc64|s390x|sparc64|x32|riscv)
>    ;;
>    ppc64le)
>      ARCH="ppc64"
> diff --git a/meson.build b/meson.build
> index 2711cbb789..c35a230bf0 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -56,7 +56,7 @@ have_block = have_system or have_tools
>  python = import('python').find_installation()
>
>  supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
> -supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64',
> +supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64',
>    'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
>
>  cpu = host_machine.cpu_family()
> @@ -271,8 +271,6 @@ if not get_option('tcg').disabled()
>      tcg_arch = 'i386'
>    elif config_host['ARCH'] == 'ppc64'
>      tcg_arch = 'ppc'
> -  elif config_host['ARCH'] in ['riscv32', 'riscv64']
> -    tcg_arch = 'riscv'
>    endif
>    add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' / tcg_arch,
>                          language: ['c', 'cpp', 'objc'])
> diff --git a/linux-user/host/riscv64/hostdep.h b/linux-user/host/riscv/hostdep.h
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
> diff --git a/linux-user/host/riscv32/hostdep.h b/linux-user/host/riscv32/hostdep.h
> deleted file mode 100644
> index adf9edbf2d..0000000000
> --- a/linux-user/host/riscv32/hostdep.h
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -/*
> - * hostdep.h : things which are dependent on the host architecture
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef RISCV32_HOSTDEP_H
> -#define RISCV32_HOSTDEP_H
> -
> -#endif
> diff --git a/linux-user/host/riscv64/safe-syscall.inc.S b/linux-user/host/riscv/safe-syscall.inc.S
> similarity index 100%
> rename from linux-user/host/riscv64/safe-syscall.inc.S
> rename to linux-user/host/riscv/safe-syscall.inc.S
> --
> 2.25.1
>
>

