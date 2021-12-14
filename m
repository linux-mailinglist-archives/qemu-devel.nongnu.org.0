Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E874743B7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:44:09 +0100 (CET)
Received: from localhost ([::1]:49880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx86C-00084A-7p
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:44:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7sQ-0007IR-W4
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:29:55 -0500
Received: from [2a00:1450:4864:20::431] (port=41959
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7sM-00036h-Pz
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:29:52 -0500
Received: by mail-wr1-x431.google.com with SMTP id a9so32375135wrr.8
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1yLtVcEBYPu9vDvAFNyINsaUVslE/mFPBg0i+leqNcg=;
 b=PZW8kApIzIMN22msxx5XL11M7wQN50pboLiyj3NmZrGNxckuXTTqp+PA4NkKFCURgR
 VHsC1sgU9JlIDxr5THc5Yxaw1wvqdb3ceLtEldYhODXpBKVz2Qa9M0OkTo2xVMQ3tjqz
 Ch/mTwn0ku7VOLqY0ekfPV57s7aRzFRBhkVhlX82405LnbQ6VDy5YJnfNlvIzs1MljKJ
 CVsyPS+7YM3GXa00cReUAbNPwVz14fW6wFwjuhocQoE0UWPER4jNWrT+X9EYzz4wsSHx
 uzt/Fd7fIdUU1shk3opx7UIbswlh0LAHVXnLeGFiHkRHiHc1L0V70wEk5cMbg1Ko7RKu
 mQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1yLtVcEBYPu9vDvAFNyINsaUVslE/mFPBg0i+leqNcg=;
 b=pg2iW8MXRHHW616ey3SHT1Vf2rkYSGq4170cf2dGC8HHhtJY4FvzVbpW0kz2qnZgd7
 eLnvR8kA7mhMo74EZQQLtiVkqmP+5dQAmcSVTYaK/uAUZD/po6wt6ljJq1qSIpVwzo92
 i4EzE5PBe+4YtWUk2gSyfq4W+abn3ulotFnZ+OulNPNu2FdZ+v17jSS1NNixvmqQGvoA
 h2LYo/IjpIB3hLMm8GGd4SfqmQD/fq8ZVqGR7Ub/3LwDqAUTX0hZT/qqI//sGG6+koc4
 R1zA5sBEst5TBvElejTJEHxelCv+VgTmqbR6ZA88sYJ4v7Bx6nC9JOfKYQVxc9majIvu
 3Pyw==
X-Gm-Message-State: AOAM531OCe163rLarcUgV0dnsogb1aRndJ+ZukrKLHxi/xsWq3g7gngL
 7iTq8ddkyz2yxtS4LJ6WfIs=
X-Google-Smtp-Source: ABdhPJyXnmAGrWue8m0naH0O5GmYcbzUE2g5SDwUb66G8K7Og0DPm6y0yWVmhjsH2Eyx3WS7XpTAxg==
X-Received: by 2002:adf:e482:: with SMTP id i2mr6142453wrm.284.1639488589418; 
 Tue, 14 Dec 2021 05:29:49 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id u10sm11531000wrs.99.2021.12.14.05.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:29:48 -0800 (PST)
Message-ID: <f6218922-c386-e1bf-e1d7-9766aa4d675a@amsat.org>
Date: Tue, 14 Dec 2021 14:29:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v9 28/31] common-user: Add safe syscall handling for
 loongarch64 hosts
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20211214080154.196350-1-git@xen0n.name>
 <20211214080154.196350-29-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211214080154.196350-29-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 09:01, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  .../host/loongarch64/safe-syscall.inc.S       | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 common-user/host/loongarch64/safe-syscall.inc.S
> 
> diff --git a/common-user/host/loongarch64/safe-syscall.inc.S b/common-user/host/loongarch64/safe-syscall.inc.S
> new file mode 100644
> index 0000000000..61dc6554eb
> --- /dev/null
> +++ b/common-user/host/loongarch64/safe-syscall.inc.S
> @@ -0,0 +1,81 @@
> +/*
> + * safe-syscall.inc.S : host-specific assembly fragment
> + * to handle signals occurring at the same time as system calls.
> + * This is intended to be included by common-user/safe-syscall.S
> + *
> + * Ported to LoongArch by WANG Xuerui <git@xen0n.name>
> + *
> + * Based on safe-syscall.inc.S code for every other architecture,
> + * originally written by Richard Henderson <rth@twiddle.net>
> + * Copyright (C) 2018 Linaro, Inc.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +        .global safe_syscall_base
> +        .global safe_syscall_start
> +        .global safe_syscall_end
> +        .type   safe_syscall_base, @function
> +        .type   safe_syscall_start, @function
> +        .type   safe_syscall_end, @function
> +
> +        /*
> +         * This is the entry point for making a system call. The calling
> +         * convention here is that of a C varargs function with the
> +         * first argument an 'int *' to the signal_pending flag, the
> +         * second one the system call number (as a 'long'), and all further
> +         * arguments being syscall arguments (also 'long').
> +         */
> +safe_syscall_base:
> +        .cfi_startproc
> +        /*
> +         * The syscall calling convention is nearly the same as C:
> +         * we enter with a0 == &signal_pending
> +         *               a1 == syscall number
> +         *               a2 ... a7 == syscall arguments
> +         *               and return the result in a0
> +         * and the syscall instruction needs
> +         *               a7 == syscall number
> +         *               a0 ... a5 == syscall arguments
> +         *               and returns the result in a0
> +         * Shuffle everything around appropriately.
> +         */
> +        move    $t0, $a0        /* signal_pending pointer */
> +        move    $t1, $a1        /* syscall number */
> +        move    $a0, $a2        /* syscall arguments */
> +        move    $a1, $a3
> +        move    $a2, $a4
> +        move    $a3, $a5
> +        move    $a4, $a6
> +        move    $a5, $a7
> +        move    $a7, $t1
> +
> +        /*
> +         * This next sequence of code works in conjunction with the
> +         * rewind_if_safe_syscall_function(). If a signal is taken
> +         * and the interrupted PC is anywhere between 'safe_syscall_start'
> +         * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
> +         * The code sequence must therefore be able to cope with this, and
> +         * the syscall instruction must be the final one in the sequence.
> +         */
> +safe_syscall_start:
> +        /* If signal_pending is non-zero, don't do the call */
> +        ld.w    $t1, $t0, 0
> +        bnez    $t1, 2f
> +        syscall 0
> +safe_syscall_end:
> +        /* code path for having successfully executed the syscall */
> +        li.w    $t2, -4096
> +        bgtu    $a0, $t2, 0f
> +        jr      $ra
> +
> +        /* code path setting errno */
> +0:      sub.d   $a0, $zero, $a0
> +        b       safe_syscall_set_errno_tail
> +
> +        /* code path when we didn't execute the syscall */
> +2:      li.w    $a0, QEMU_ERESTARTSYS
> +        b       safe_syscall_set_errno_tail
> +        .cfi_endproc
> +        .size   safe_syscall_base, .-safe_syscall_base
> 

Why not rename 0 -> set_errno and 2 -> syscall_not_executed
for readability? (and eventually drop the comments).

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

