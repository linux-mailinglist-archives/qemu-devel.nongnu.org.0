Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0508147B874
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 03:47:53 +0100 (CET)
Received: from localhost ([::1]:44140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzVBv-0002Zj-R1
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 21:47:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVAU-0001tR-WC
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:46:23 -0500
Received: from [2607:f8b0:4864:20::52c] (port=34550
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVAT-0008Bp-1S
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:46:22 -0500
Received: by mail-pg1-x52c.google.com with SMTP id d11so11045660pgl.1
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 18:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=U8IAeGpS9oiFnEJt8a9E9pvAKowrvmVaHbEXPi2/A9M=;
 b=e3vlAo81KVmUGXXlFRs85BqYUcTEyzkZ2RhgTZtLG4X9OUDl0d77OY2Lfj29LtmEqv
 ViE9Q0qBs8WipfMMGIwXarqa/vajZyZK+2O/kPkmts1jC0kruJKBzXdBv4LxlqwjB+we
 LWw0r00duRh+yW3UJYnDTovd7AUVzHgToe2WKgn/nyN9TQDkBIeew3dE0GMFDlF1jRPu
 +kOyBoGmK3XkQCylr+Yn4lyGwbVm5Y/aFPeNyO0X/yJ8Zgd9ca+qLNmbMMH8simZ+1Ww
 T2iQr2OjAjk+WFz7QxKAYhZ1q+5DnaaQc/AXgRAd9uAgB3XlxSB0U6CMp1qxigha+vpT
 Whqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U8IAeGpS9oiFnEJt8a9E9pvAKowrvmVaHbEXPi2/A9M=;
 b=uHECmDffEBfejl6IXhVN5PGWb1Gz7lLSoqJUznE2FpEJh5INoQKK3f99PYKJTH2BiO
 GmtLTUZUvWPKbWweVMQrYZ5XdYOcAGJJ5cMUAzRfdn1+kIH46FJOR2HuUp0+wbcVEkRd
 jY3/m6k8uKa68bDCg1nr0AGwD2/ShNXLeVIvuABfuuc3Gmlniwh6HyCMgY1gn5L2TNll
 hPcqxYQIX+3kqILyN4F1LKUJPtvOocT9oHtkfMCjoKcGUCLxDIM9KOf48vtIYVQtTUhj
 I54X8PQ3cG4GfwEYjMx3A1eNvoLZCcyso+1zciKnWhVgaeXepn/5GumvcpYmq/C0qAc4
 JSpQ==
X-Gm-Message-State: AOAM531gm6P9vdezTbNe9HhlZYVjtI8wPckxUgH55DmPFB7bGaBRhAUU
 QgUIBK/SCwcP+i+w+fWFgc8Ug+cvZ6UWXg==
X-Google-Smtp-Source: ABdhPJwdWjeiJ18CyfbILDCTRGjXV1cD+LBAxVodRI6Zv3Y4LNve4G34T5f6LBz5tJFyXXkmepZhFQ==
X-Received: by 2002:a63:8042:: with SMTP id j63mr1008567pgd.454.1640054779247; 
 Mon, 20 Dec 2021 18:46:19 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id n6sm17826136pgk.43.2021.12.20.18.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 18:46:18 -0800 (PST)
Subject: Re: [PULL 07/16] configure, meson: move ARCH to meson.build
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211219141711.248066-1-pbonzini@redhat.com>
 <20211219141711.248066-8-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <29e8d139-58e8-6aa3-c9a8-0d13c9c88eaf@linaro.org>
Date: Mon, 20 Dec 2021 18:46:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211219141711.248066-8-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/21 6:17 AM, Paolo Bonzini wrote:
> $ARCH and the HOST_* symbols are only used by the QEMU build; configure
> uses $cpu instead.  Remove it from config-host.mak.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure   | 21 ++++-----------------
>   meson.build | 26 +++++++++++++++++---------
>   2 files changed, 21 insertions(+), 26 deletions(-)

This broke the cross-compiler infrastructure for tests, because tests/tcg/configure.sh 
uses $ARCH, which is no longer defined.


r~


> 
> diff --git a/configure b/configure
> index 108b7621e2..6e06ac6161 100755
> --- a/configure
> +++ b/configure
> @@ -635,11 +635,9 @@ else
>     cpu=$(uname -m)
>   fi
>   
> -ARCH=
> -# Normalise host CPU name, set ARCH and multilib cflags
> +# Normalise host CPU name, set multilib cflags
>   # Note that this case should only have supported host CPUs, not guests.
>   case "$cpu" in
> -  aarch64|riscv) ;;
>     armv*b|armv*l|arm)
>       cpu="arm" ;;
>   
> @@ -668,8 +666,7 @@ case "$cpu" in
>       CPU_CFLAGS="-m64 -mlittle" ;;
>   
>     s390)
> -    CPU_CFLAGS="-m31"
> -    ARCH=unknown ;;
> +    CPU_CFLAGS="-m31" ;;
>     s390x)
>       CPU_CFLAGS="-m64" ;;
>   
> @@ -678,15 +675,7 @@ case "$cpu" in
>       CPU_CFLAGS="-m32 -mv8plus -mcpu=ultrasparc" ;;
>     sparc64)
>       CPU_CFLAGS="-m64 -mcpu=ultrasparc" ;;
> -
> -  *)
> -    # This will result in either an error or falling back to TCI later
> -    ARCH=unknown
> -  ;;
>   esac
> -if test -z "$ARCH"; then
> -  ARCH="$cpu"
> -fi
>   
>   : ${make=${MAKE-make}}
>   
> @@ -3406,8 +3395,6 @@ echo "GIT=$git" >> $config_host_mak
>   echo "GIT_SUBMODULES=$git_submodules" >> $config_host_mak
>   echo "GIT_SUBMODULES_ACTION=$git_submodules_action" >> $config_host_mak
>   
> -echo "ARCH=$ARCH" >> $config_host_mak
> -
>   if test "$debug_tcg" = "yes" ; then
>     echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
>   fi
> @@ -3898,12 +3885,12 @@ if test "$skip_meson" = no; then
>       cross_arg="--cross-file config-meson.cross"
>       echo "[host_machine]" >> $cross
>       echo "system = '$targetos'" >> $cross
> -    case "$ARCH" in
> +    case "$cpu" in
>           i386)
>               echo "cpu_family = 'x86'" >> $cross
>               ;;
>           *)
> -            echo "cpu_family = '$ARCH'" >> $cross
> +            echo "cpu_family = '$cpu'" >> $cross
>               ;;
>       esac
>       echo "cpu = '$cpu'" >> $cross
> diff --git a/meson.build b/meson.build
> index 4fdaa65b05..2495360fd0 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -67,6 +67,14 @@ endif
>   
>   targetos = host_machine.system()
>   
> +if cpu not in supported_cpus
> +  host_arch = 'unknown'
> +elif cpu == 'x86'
> +  host_arch = 'i386'
> +else
> +  host_arch = cpu
> +endif
> +
>   if cpu in ['x86', 'x86_64']
>     kvm_targets = ['i386-softmmu', 'x86_64-softmmu']
>   elif cpu == 'aarch64'
> @@ -335,9 +343,9 @@ if targetos == 'netbsd'
>     endif
>   endif
>   
> -tcg_arch = config_host['ARCH']
> +tcg_arch = host_arch
>   if not get_option('tcg').disabled()
> -  if cpu not in supported_cpus
> +  if host_arch == 'unknown'
>       if get_option('tcg_interpreter')
>         warning('Unsupported CPU @0@, will use TCG with TCI (slow)'.format(cpu))
>       else
> @@ -353,11 +361,11 @@ if not get_option('tcg').disabled()
>     endif
>     if get_option('tcg_interpreter')
>       tcg_arch = 'tci'
> -  elif config_host['ARCH'] == 'sparc64'
> +  elif host_arch == 'sparc64'
>       tcg_arch = 'sparc'
> -  elif config_host['ARCH'] == 'x86_64'
> +  elif host_arch == 'x86_64'
>       tcg_arch = 'i386'
> -  elif config_host['ARCH'] == 'ppc64'
> +  elif host_arch == 'ppc64'
>       tcg_arch = 'ppc'
>     endif
>     add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' / tcg_arch,
> @@ -1426,6 +1434,8 @@ config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') /
>   config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') / qemu_moddir)
>   config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_option('sysconfdir'))
>   
> +config_host_data.set('HOST_' + host_arch.to_upper(), 1)
> +
>   config_host_data.set('CONFIG_ATTR', libattr.found())
>   config_host_data.set('CONFIG_BRLAPI', brlapi.found())
>   config_host_data.set('CONFIG_COCOA', cocoa.found())
> @@ -1775,8 +1785,6 @@ foreach k, v: config_host
>         v = '"' + '", "'.join(v.split()) + '", '
>       endif
>       config_host_data.set(k, v)
> -  elif k == 'ARCH'
> -    config_host_data.set('HOST_' + v.to_upper(), 1)
>     elif strings.contains(k)
>       config_host_data.set_quoted(k, v)
>     elif k.startswith('CONFIG_')
> @@ -1919,7 +1927,7 @@ foreach target : target_dirs
>     endif
>   
>     foreach k, v: disassemblers
> -    if config_host['ARCH'].startswith(k) or config_target['TARGET_BASE_ARCH'].startswith(k)
> +    if host_arch.startswith(k) or config_target['TARGET_BASE_ARCH'].startswith(k)
>         foreach sym: v
>           config_target += { sym: 'y' }
>           config_all_disas += { sym: 'y' }
> @@ -2888,7 +2896,7 @@ foreach target : target_dirs
>       endif
>       if 'CONFIG_LINUX_USER' in config_target
>         base_dir = 'linux-user'
> -      target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
> +      target_inc += include_directories('linux-user/host/' / host_arch)
>       endif
>       if 'CONFIG_BSD_USER' in config_target
>         base_dir = 'bsd-user'
> 


