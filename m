Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3201F585A23
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 12:38:03 +0200 (CEST)
Received: from localhost ([::1]:53266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHjr7-0007qa-Os
	for lists+qemu-devel@lfdr.de; Sat, 30 Jul 2022 06:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oHjoi-000691-E1; Sat, 30 Jul 2022 06:35:33 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:39493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oHjog-0001td-Du; Sat, 30 Jul 2022 06:35:32 -0400
Received: by mail-ua1-x934.google.com with SMTP id c19so2753586uat.6;
 Sat, 30 Jul 2022 03:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=pxWtTYcVoFwoagijCT+YVamxKapZ88NKCLVFzID3FCE=;
 b=aOTpPfiVR5StUNptuSfr4zhNaiP0bk9uq1PW4RSB32oFSwFDsxAvKLAbbwwYjMY3Dh
 PinFasHoiRtNRWBYeDboxJAgCsUpPV7LL+TA1GJon4JWk2MsT9jL8bgDhhRd44gQ1s3t
 9w3FDdqtVRScnO6ULGdE+JnwhgUgO3wpY8i9QwqnkweP9dGkk6SDSxRho8joEEXBtghR
 mNCNVgb9SlCvtRKvGGJROTz7a1STKd7RSEJ9g/zaWHtIuSVDalGNhDwu262GZ0v+3h1u
 n0yiyXxyzVp6pDt70BmORFnH0PXhWdaJHekFBnvuWxxaKmyMW/JbxKkbrm5lya8aYc46
 /Q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=pxWtTYcVoFwoagijCT+YVamxKapZ88NKCLVFzID3FCE=;
 b=RPtUyDTeKKXAGpa8OGl5p5QziWOwgVfoS1ngFyk5+Pcg4nnHSAHdKeqfQEReBY5w5u
 kHvP0NaEhjuNJDfqnViffdxSJHsENyNufQou3I27v95+8TqUg4pQ4BzR2PCakhBOqPrR
 tQ9aZa95QmvdpHa2OTcB3JosiIaVqWN2d+ghBPD5PZDEvirIbMX3nrprjJ9glGe9mnJW
 16PB8aSB0AN5wZRCHOf4w5UbFwrCQz7aEpQ/Yry0DHLvsvJ8HD0dgKO3NlOiHVR4KZNk
 Y/Js4EBRa+sujtx/vnIs1hQhmoQhUQ1pdMG9OltbqKtVh+dZy1J+jWUqAS/CfJwabC1E
 Jfrg==
X-Gm-Message-State: ACgBeo0xprdxrC5L5LlNi0uFy9AnYEguag3qXd4QdX3qHtV8qD4CuAhl
 7+GDDYcLFF2StfUxsAQore1SlDqudIs=
X-Google-Smtp-Source: AA6agR46FVDRtG0yanXe/2a84ISYbc7qcE0FdPs5oJELe7ekO7G1nGgoVDSGHc5vaMtr5A6aFD0HFw==
X-Received: by 2002:ab0:300b:0:b0:381:f97a:eb24 with SMTP id
 f11-20020ab0300b000000b00381f97aeb24mr3212531ual.13.1659177328948; 
 Sat, 30 Jul 2022 03:35:28 -0700 (PDT)
Received: from [192.168.10.102] ([179.225.208.46])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a67b30b000000b0035860d6caf8sm2160037vsm.2.2022.07.30.03.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Jul 2022 03:35:28 -0700 (PDT)
Message-ID: <9c95bf54-d246-42dc-1e8f-6d15327bd702@gmail.com>
Date: Sat, 30 Jul 2022 07:35:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] common-user/host/ppc: Implement safe-syscall.inc.S
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, laurent@vivier.eu
References: <20220729172141.1789105-1-richard.henderson@linaro.org>
 <20220729172141.1789105-2-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220729172141.1789105-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/29/22 14:21, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   common-user/host/ppc/safe-syscall.inc.S | 107 ++++++++++++++++++++++++
>   1 file changed, 107 insertions(+)
>   create mode 100644 common-user/host/ppc/safe-syscall.inc.S
> 
> diff --git a/common-user/host/ppc/safe-syscall.inc.S b/common-user/host/ppc/safe-syscall.inc.S
> new file mode 100644
> index 0000000000..0851f6c0b8
> --- /dev/null
> +++ b/common-user/host/ppc/safe-syscall.inc.S
> @@ -0,0 +1,107 @@
> +/*
> + * safe-syscall.inc.S : host-specific assembly fragment
> + * to handle signals occurring at the same time as system calls.
> + * This is intended to be included by common-user/safe-syscall.S
> + *
> + * Copyright (C) 2022 Linaro, Ltd.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +/*
> + * Standardize on the _CALL_FOO symbols used by GCC:
> + * Apple XCode does not define _CALL_DARWIN.
> + * Clang defines _CALL_ELF (64-bit) but not _CALL_SYSV (32-bit).
> + */
> +#if !defined(_CALL_SYSV) && \
> +    !defined(_CALL_DARWIN) && \
> +    !defined(_CALL_AIX) && \
> +    !defined(_CALL_ELF)
> +# if defined(__APPLE__)
> +#  define _CALL_DARWIN
> +# elif defined(__ELF__) && TCG_TARGET_REG_BITS == 32
> +#  define _CALL_SYSV
> +# else
> +#  error "Unknown ABI"
> +# endif
> +#endif
> +
> +#ifndef _CALL_SYSV
> +# error "Unsupported ABI"
> +#endif
> +
> +
> +        .global safe_syscall_base
> +        .global safe_syscall_start
> +        .global safe_syscall_end
> +        .type   safe_syscall_base, @function
> +
> +        .text
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
> +        stwu    1, -8(1)
> +        .cfi_def_cfa_offset 8
> +        stw     30, 4(1)
> +        .cfi_offset 30, -4
> +
> +        /*
> +         * We enter with r3 == &signal_pending
> +         *               r4 == syscall number
> +         *               r5 ... r10 == syscall arguments
> +         *               and return the result in r3
> +         * and the syscall instruction needs
> +         *               r0 == syscall number
> +         *               r3 ... r8 == syscall arguments
> +         *               and returns the result in r3
> +         * Shuffle everything around appropriately.
> +         */
> +        mr      30, 3           /* signal_pending */
> +        mr      0, 4            /* syscall number */
> +        mr      3, 5            /* syscall arguments */
> +        mr      4, 6
> +        mr      5, 7
> +        mr      6, 8
> +        mr      7, 9
> +        mr      8, 10
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
> +        /* if signal_pending is non-zero, don't do the call */
> +        lwz     12, 0(30)
> +        cmpwi   0, 12, 0
> +        bne-    2f
> +        sc
> +safe_syscall_end:
> +        /* code path when we did execute the syscall */
> +        lwz     30, 4(1)        /* restore r30 */
> +        addi    1, 1, 8         /* restore stack */
> +        .cfi_restore 30
> +        .cfi_def_cfa_offset 0
> +        bnslr+                  /* return on success */
> +        b       safe_syscall_set_errno_tail
> +
> +        /* code path when we didn't execute the syscall */
> +2:      lwz     30, 4(1)
> +        addi    1, 1, 8
> +        addi    3, 0, QEMU_ERESTARTSYS
> +        b       safe_syscall_set_errno_tail
> +
> +        .cfi_endproc
> +
> +        .size   safe_syscall_base, .-safe_syscall_base

