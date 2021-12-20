Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B046A47B5EC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 23:37:35 +0100 (CET)
Received: from localhost ([::1]:39840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzRHi-0000Yb-HY
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 17:37:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mzRFt-0007Yj-ST
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 17:35:41 -0500
Received: from [2a00:1450:4864:20::52b] (port=44647
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mzRFs-0003UH-4K
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 17:35:41 -0500
Received: by mail-ed1-x52b.google.com with SMTP id w16so15907868edc.11
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 14:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gBIDRJFOwrm3uQ7X2jx0y7dBqJMOt1JuIOJ5h2J9Wak=;
 b=F1mJNnV9RpAn2iTtiazPw/fLd8IUGZG9+MsE2JOmnwXjOZ2uh6HSKm92RNiTmW3jFS
 6aTUNpeEapVfFAhaMUne8QK4msSX6hErcFeFcdXAIPkRRAx2ya2tRYZr36J6FUEbV32O
 p5ArKTsWx+bFGGxu4cDKN4tGVHuYhU2AkL2RSmEgeO8PWBT3ayEMpEPYPA5zX5jvJIjF
 e7xiRtaVTlqiTkuvOzAA5EGzvluS2WBh/WNMqB+Da6sw0TABJ2C7IZZqIqJc1Q6cIrQ/
 m3d4ZAlJIQnBQaatA7AzeneNeRuf62nsUlV0ZuRuZ0jnmTTMJRsFP2WUXFkOae+cJjgY
 lu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gBIDRJFOwrm3uQ7X2jx0y7dBqJMOt1JuIOJ5h2J9Wak=;
 b=lmMNn4RpqeDSBsMop46q45sTDh+yKU5Ik4Ih/ztEWrFvne6rM3b9y/RDjRCex7Zdof
 dDJGjvyqy/aZofgrZoJx2bxC3zaU/IOqwHSSc067mEGe+dM1drh2KydBDd3QYTHT2cdD
 ro1cfPG2AZmEo2BibG1na1qwv/OAweoVn3qCw0WvcGlaIzQ1DwsAleCW4p8LNY/s0gCu
 d30A+0N4NoalUZ918sg/iGhzyQsmV2zWvBAdNEwodLCfE6AfeqbRvLuzjp9cLQ2xOmjm
 x55AIxIbrBDf45TW1uEV5d1RKnBWcbjlQc/zV8m8cj266C8cRbo0Jn7PVaUXAlNt2AaU
 Bx8w==
X-Gm-Message-State: AOAM5312Lx6SXcdnlWEE9hQ1FbDmovVl2vDaSQ4MmtLXWk/DDPh7kq3m
 QhLvJQ1swfnNMKs+elRkY24znFr/6sU=
X-Google-Smtp-Source: ABdhPJwHHQeKiguv3oHgwOL3twS/WcKNYT6zVqm+m1Wi8eXu+LoWI3aWnhutBKr3IvhfxYm4+20Hwg==
X-Received: by 2002:a17:907:e8c:: with SMTP id
 ho12mr213051ejc.689.1640039738081; 
 Mon, 20 Dec 2021 14:35:38 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id c10sm4467352ejm.118.2021.12.20.14.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:35:37 -0800 (PST)
Message-ID: <46ba0b53-f857-6565-8f02-ea8bee16cb9e@amsat.org>
Date: Mon, 20 Dec 2021 23:35:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/6] linux-user: Split out do_prctl and subroutines
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211220214135.189157-1-richard.henderson@linaro.org>
 <20211220214135.189157-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211220214135.189157-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.608,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 22:41, Richard Henderson wrote:
> Since the prctl constants are supposed to be generic, supply
> any that are not provided by the host.
> 
> Split out subroutines for PR_GET_FP_MODE, PR_SET_FP_MODE,
> PR_GET_VL, PR_SET_VL, PR_RESET_KEYS, PR_SET_TAGGED_ADDR_CTRL,
> PR_GET_TAGGED_ADDR_CTRL.  Return EINVAL for guests that do
> not support these options rather than pass them on to the host.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_prctl.h    | 160 ++++++++++
>  linux-user/aarch64/target_syscall.h  |  23 --
>  linux-user/alpha/target_prctl.h      |   1 +
>  linux-user/arm/target_prctl.h        |   1 +
>  linux-user/cris/target_prctl.h       |   1 +
>  linux-user/hexagon/target_prctl.h    |   1 +
>  linux-user/hppa/target_prctl.h       |   1 +
>  linux-user/i386/target_prctl.h       |   1 +
>  linux-user/m68k/target_prctl.h       |   1 +
>  linux-user/microblaze/target_prctl.h |   1 +
>  linux-user/mips/target_prctl.h       |  88 ++++++
>  linux-user/mips/target_syscall.h     |   6 -
>  linux-user/mips64/target_prctl.h     |   1 +
>  linux-user/mips64/target_syscall.h   |   6 -
>  linux-user/nios2/target_prctl.h      |   1 +
>  linux-user/openrisc/target_prctl.h   |   1 +
>  linux-user/ppc/target_prctl.h        |   1 +
>  linux-user/riscv/target_prctl.h      |   1 +
>  linux-user/s390x/target_prctl.h      |   1 +
>  linux-user/sh4/target_prctl.h        |   1 +
>  linux-user/sparc/target_prctl.h      |   1 +
>  linux-user/x86_64/target_prctl.h     |   1 +
>  linux-user/xtensa/target_prctl.h     |   1 +
>  linux-user/syscall.c                 | 433 +++++++++------------------
>  24 files changed, 414 insertions(+), 320 deletions(-)
>  create mode 100644 linux-user/aarch64/target_prctl.h
>  create mode 100644 linux-user/alpha/target_prctl.h
>  create mode 100644 linux-user/arm/target_prctl.h
>  create mode 100644 linux-user/cris/target_prctl.h
>  create mode 100644 linux-user/hexagon/target_prctl.h
>  create mode 100644 linux-user/hppa/target_prctl.h
>  create mode 100644 linux-user/i386/target_prctl.h
>  create mode 100644 linux-user/m68k/target_prctl.h
>  create mode 100644 linux-user/microblaze/target_prctl.h
>  create mode 100644 linux-user/mips/target_prctl.h
>  create mode 100644 linux-user/mips64/target_prctl.h
>  create mode 100644 linux-user/nios2/target_prctl.h
>  create mode 100644 linux-user/openrisc/target_prctl.h
>  create mode 100644 linux-user/ppc/target_prctl.h
>  create mode 100644 linux-user/riscv/target_prctl.h
>  create mode 100644 linux-user/s390x/target_prctl.h
>  create mode 100644 linux-user/sh4/target_prctl.h
>  create mode 100644 linux-user/sparc/target_prctl.h
>  create mode 100644 linux-user/x86_64/target_prctl.h
>  create mode 100644 linux-user/xtensa/target_prctl.h

> +#include "target_prctl.h"
> +
> +static abi_long do_prctl_inval0(CPUArchState *env)
> +{
> +    return -TARGET_EINVAL;
> +}
> +
> +static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
> +{
> +    return -TARGET_EINVAL;
> +}
> +
> +#ifndef do_prctl_get_fp_mode
> +#define do_prctl_get_fp_mode do_prctl_inval0
> +#endif
> +#ifndef do_prctl_set_fp_mode
> +#define do_prctl_set_fp_mode do_prctl_inval1
> +#endif
> +#ifndef do_prctl_get_vl
> +#define do_prctl_get_vl do_prctl_inval0
> +#endif
> +#ifndef do_prctl_set_vl
> +#define do_prctl_set_vl do_prctl_inval1
> +#endif
> +#ifndef do_prctl_reset_keys
> +#define do_prctl_reset_keys do_prctl_inval1
> +#endif
> +#ifndef do_prctl_set_tagged_addr_ctrl
> +#define do_prctl_set_tagged_addr_ctrl do_prctl_inval1
> +#endif
> +#ifndef do_prctl_get_tagged_addr_ctrl
> +#define do_prctl_get_tagged_addr_ctrl do_prctl_inval0
> +#endif

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

