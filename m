Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCA93D4D99
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 15:09:01 +0200 (CEST)
Received: from localhost ([::1]:43276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7dsK-0002SQ-8L
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 09:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7drb-0001m6-FI
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 09:08:15 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7drZ-0001Cg-Mh
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 09:08:15 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 j8-20020a17090aeb08b0290173bac8b9c9so15828383pjz.3
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 06:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2vI5LfkC4KggicpDOs5L+uJuTiUDm/XEMJ3/8LtIUL0=;
 b=KrYwA5wIxrHX5Z+bobxXU80yhYBHpmynSZP9JqYCrNb+ByFD0BVdT48y9JA9h4I2kF
 Xz4wpqPvOjOo/jCr2dZEkZYjCZRjp2NRIXajXoV1nmRBJBL2VcRTtmrcGwTTI9OeEjXW
 8m3lEP+o0uLbi3MtuA4JBkRp+nhm+yQCzPXqrDmn7BWO+C7nr18XfwnC54yWqT7XkD95
 qpej/VOZf4apjO3Pi+0c92a/4GBH3W59V3JOAdrq99waThD86lx9Dmrswnlq7cDomQW/
 H0Q3YeQ9LzYCQiJhapwc7xB6FkolQwJiVG/HYYyn/B09SyoNwhPBSgYp5McIPpHFD0Ay
 J5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2vI5LfkC4KggicpDOs5L+uJuTiUDm/XEMJ3/8LtIUL0=;
 b=r3owUNDvasUdzM+OcyqLMsXgUcRDuLkECEVfrvp427bK43RpiAonrdbt1whS2QtG2j
 px/iYkHOrraGEaIUe6rRoxwjiWkIyeLslV6K0xmXqsxpjv9DDcEZW7WgBECHtBJMh8nH
 6wzMG6CeRVeTx7spuIIN765BPOUCQIHJCh1HtIm7Hy2zC3HvxrFP60u43P006tLvUsrC
 exSHHRfNVlc8cGgnFmpOkelPHG/ou+bABRqxUk1UnMp3zFRpSau904qVQklAJ5ligx/a
 JORsYpjCcH+24F1UQWLKJRpPENXZYWz4MLEoR0sPqh0YcH/7enSuAwSaVYT08r7jgwh5
 3Lug==
X-Gm-Message-State: AOAM532yU+VqI1o3hDz87ybXCjbfNPGS6Zx+fwOCEGRPfB07OZh2wGbz
 VSPSIvAA4e/kXZ1nhyfeqNOD+Q==
X-Google-Smtp-Source: ABdhPJwbxLbS7gtPWNGp10l+XitQ6ZkK7lUE+XBJSDtFtzDFN95ZvMIseE/meVsK+WfGNTxgajaNgg==
X-Received: by 2002:a17:90a:ce02:: with SMTP id
 f2mr21818267pju.232.1627218492007; 
 Sun, 25 Jul 2021 06:08:12 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id i18sm40817445pfa.149.2021.07.25.06.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 06:08:11 -0700 (PDT)
Subject: Re: [PATCH 02/20] Hexagon HVX (target/hexagon) add Hexagon Vector
 eXtensions (HVX) to core
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-3-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9d5e6225-4ffa-d394-17b9-518c58842186@linaro.org>
Date: Sun, 25 Jul 2021 03:08:07 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625528074-19440-3-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 1:34 PM, Taylor Simpson wrote:
> HVX is a set of wide vector instructions.  Machine state includes
>      vector registers (VRegs)
>      vector predicate registers (QRegs)
>      temporary registers for intermediate values
>      store buffer (masked stores and scatter/gather)
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/cpu.h            | 35 ++++++++++++++++-
>   target/hexagon/hex_arch_types.h |  5 +++
>   target/hexagon/insn.h           |  3 ++
>   target/hexagon/internal.h       |  3 ++
>   target/hexagon/mmvec/mmvec.h    | 83 +++++++++++++++++++++++++++++++++++++++++
>   target/hexagon/cpu.c            | 72 ++++++++++++++++++++++++++++++++++-
>   6 files changed, 198 insertions(+), 3 deletions(-)
>   create mode 100644 target/hexagon/mmvec/mmvec.h
> 
> diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
> index 2855dd3..0b377c3 100644
> --- a/target/hexagon/cpu.h
> +++ b/target/hexagon/cpu.h
> @@ -26,6 +26,7 @@ typedef struct CPUHexagonState CPUHexagonState;
>   #include "qemu-common.h"
>   #include "exec/cpu-defs.h"
>   #include "hex_regs.h"
> +#include "mmvec/mmvec.h"
>   
>   #define NUM_PREGS 4
>   #define TOTAL_PER_THREAD_REGS 64
> @@ -34,6 +35,7 @@ typedef struct CPUHexagonState CPUHexagonState;
>   #define STORES_MAX 2
>   #define REG_WRITES_MAX 32
>   #define PRED_WRITES_MAX 5                   /* 4 insns + endloop */
> +#define VSTORES_MAX 2
>   
>   #define TYPE_HEXAGON_CPU "hexagon-cpu"
>   
> @@ -52,6 +54,13 @@ typedef struct {
>       uint64_t data64;
>   } MemLog;
>   
> +typedef struct {
> +    target_ulong va;
> +    int size;
> +    MMVector mask QEMU_ALIGNED(16);
> +    MMVector data QEMU_ALIGNED(16);
> +} VStoreLog;

Do you really need a MMVector mask, or should this be a QRegMask?

> -    target_ulong gather_issued;
> +    bool gather_issued;

Surely unrelated to adding state.

> +    MMVector VRegs[NUM_VREGS] QEMU_ALIGNED(16);
> +    MMVector future_VRegs[NUM_VREGS] QEMU_ALIGNED(16);
> +    MMVector tmp_VRegs[NUM_VREGS] QEMU_ALIGNED(16);

Ok, this is where I'm not keen on how you handle this for integer code, and for vector 
code has got to be past the realm of acceptable.

You have exactly 4 slots in your vliw packet.  You cannot possibly use 32 future or tmp 
slots.  For integers this wastage was at least small, but for vectors these waste just shy 
of 8k.

All you need to do is to be smarter about mapping e.g. 5 to 8 temp slots during translation.

> +    MMQReg QRegs[NUM_QREGS] QEMU_ALIGNED(16);
> +    MMQReg future_QRegs[NUM_QREGS] QEMU_ALIGNED(16);

Likewise.

> +    /* Temporaries used within instructions */
> +    MMVector zero_vector QEMU_ALIGNED(16);

You must be doing something wrong to need zero in memory.

> +/*
> + * The HVX register dump takes up a ton of space in the log
> + * Don't print it unless it is needed
> + */
> +#define DUMP_HVX 0
> +#if DUMP_HVX
> +    qemu_fprintf(f, "Vector Registers = {\n");
> +    for (int i = 0; i < NUM_VREGS; i++) {
> +        print_vreg(f, env, i);
> +    }
> +    for (int i = 0; i < NUM_QREGS; i++) {
> +        print_qreg(f, env, i);
> +    }
> +    qemu_fprintf(f, "}\n");
> +#endif

Use CPU_DUMP_FPU, controlled by -d fpu.

> -    cc->gdb_num_core_regs = TOTAL_PER_THREAD_REGS;
> +    cc->gdb_num_core_regs = TOTAL_PER_THREAD_REGS + NUM_VREGS + NUM_QREGS;

They're not really core regs though are they?
Surely gdb_register_coprocessor is a better representation.


r~

