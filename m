Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431FD4180D7
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 11:42:04 +0200 (CEST)
Received: from localhost ([::1]:50428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU4C1-00062w-5f
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 05:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU49m-0004yo-MA
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 05:39:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU49l-0006G5-06
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 05:39:42 -0400
Received: by mail-wr1-x434.google.com with SMTP id i24so18887549wrc.9
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 02:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E7GwgBSH2kqdGWfTyMnqBLutJYsXDGfD4MZtHwaOVg0=;
 b=o+2S2Zr5NgP/1kY4ZhQ+EEFGCCA75xCwUki3RIqjLDSnP9eT7/LheqPK/vtSZurpF2
 BmipveuGcYSmCFAIwGTYZIGw/EYW004r1ejP9qSEx1oVtab34GheR+Njjyu0jDY+Tpn6
 LFiX7s+C7tCXqhEVyVTl5Pp5FcAGtG8jxV31TLiDb+eaC0/1tuRJ8pdZteyR5EQiqJt+
 6Pl1RC9gcDlL5qQ5NTts/82unh2vyxRSxuqKJJdzbJ9K4/81tTCwPWsh+1E74qDP21eX
 HWaCESgj1ArKk3etQ+CdK+R8jaXWJjmnd7Qc49xWeUJYiQoXHJGodtUypaCfxFUc7opY
 SFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E7GwgBSH2kqdGWfTyMnqBLutJYsXDGfD4MZtHwaOVg0=;
 b=1ODhnxsmlzHyBzBEbMxVQ5qJcGPmn5yTDrmM7GjAbAgdK90CMQckK6uNR8AVnpSODi
 IgNWTT0bhuhe4/yu8y6rFrNxAtBFe0caaPTNdKf5gn7MBjuHOJ9lldGv4TtF3rKCCBEq
 4jKTrVxDFzuaqixrhczZqRrWRUiQAmHNbtum2+PoYiXG3PiN9fcAhtMLL5qGsfE+uSJc
 ITioP8r52zkAs4y+QX2ZPA4L/7fMlIKDWSsSPGlwX3z5jhMhT6ZP1LIi4f7L7/y5KIyR
 R4VfF3nXIfuxhgAnK1c40ODusEwE2u4loPKgJByhBCOLHw0YEVULYmUP4MWZjbXG8VMw
 z0Gg==
X-Gm-Message-State: AOAM533kgsQkfmZLnKgwr8ta5dBX+TEIGNu0ZudcRi0h2LChmIPGF3eO
 p2mkIEcKHxGEg7FI6Hy3MwU=
X-Google-Smtp-Source: ABdhPJzQTdv0MRLQygzH2bu/sZMJFzD3lgeRh7kTq7EfjBP2lQi+MZ8fLlTZDsPxrdjVJjnKB6dZwg==
X-Received: by 2002:a5d:6ace:: with SMTP id u14mr16039815wrw.70.1632562779170; 
 Sat, 25 Sep 2021 02:39:39 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id s2sm10254206wrn.77.2021.09.25.02.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 02:39:38 -0700 (PDT)
Message-ID: <ea17a759-2f43-72ef-32db-642f0a3cfd4c@amsat.org>
Date: Sat, 25 Sep 2021 11:39:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 06/30] tcg/loongarch64: Define the operand constraints
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-7-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924172527.904294-7-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.034,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 19:25, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target-con-str.h | 28 +++++++++++++++
>   tcg/loongarch64/tcg-target.c.inc     | 52 ++++++++++++++++++++++++++++
>   2 files changed, 80 insertions(+)
>   create mode 100644 tcg/loongarch64/tcg-target-con-str.h
> 
> diff --git a/tcg/loongarch64/tcg-target-con-str.h b/tcg/loongarch64/tcg-target-con-str.h
> new file mode 100644
> index 0000000000..c3986a4fd4
> --- /dev/null
> +++ b/tcg/loongarch64/tcg-target-con-str.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Define LoongArch target-specific operand constraints.
> + *
> + * Copyright (c) 2021 WANG Xuerui <git@xen0n.name>
> + *
> + * Based on tcg/riscv/tcg-target-con-str.h
> + *
> + * Copyright (c) 2021 Linaro
> + */
> +
> +/*
> + * Define constraint letters for register sets:
> + * REGS(letter, register_mask)
> + */
> +REGS('r', ALL_GENERAL_REGS)
> +REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
> +
> +/*
> + * Define constraint letters for constants:
> + * CONST(letter, TCG_CT_CONST_* bit set)
> + */
> +CONST('I', TCG_CT_CONST_S12)
> +CONST('N', TCG_CT_CONST_N12)
> +CONST('U', TCG_CT_CONST_U12)
> +CONST('Z', TCG_CT_CONST_ZERO)
> +CONST('C', TCG_CT_CONST_C12)
> +CONST('W', TCG_CT_CONST_WSZ)
> diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
> index 42eebef78e..f0930f77ef 100644
> --- a/tcg/loongarch64/tcg-target.c.inc
> +++ b/tcg/loongarch64/tcg-target.c.inc
> @@ -116,3 +116,55 @@ static const int tcg_target_call_oarg_regs[] = {
>       TCG_REG_A0,
>       TCG_REG_A1,
>   };
> +
> +#define TCG_CT_CONST_ZERO  0x100
> +#define TCG_CT_CONST_S12   0x200
> +#define TCG_CT_CONST_N12   0x400
> +#define TCG_CT_CONST_U12   0x800
> +#define TCG_CT_CONST_C12   0x1000
> +#define TCG_CT_CONST_WSZ   0x2000
> +
> +#define ALL_GENERAL_REGS      MAKE_64BIT_MASK(0, 32)
> +/*
> + * For softmmu, we need to avoid conflicts with the first 5
> + * argument registers to call the helper.  Some of these are
> + * also used for the tlb lookup.
> + */
> +#ifdef CONFIG_SOFTMMU
> +#define SOFTMMU_RESERVE_REGS  MAKE_64BIT_MASK(TCG_REG_A0, 5)
> +#else
> +#define SOFTMMU_RESERVE_REGS  0
> +#endif
> +
> +
> +static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
> +{
> +    return sextract64(val, pos, len);
> +}
> +
> +/* test if a constant matches the constraint */
> +static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
> +{
> +    if (ct & TCG_CT_CONST) {
> +        return 1;
> +    }
> +    if ((ct & TCG_CT_CONST_ZERO) && val == 0) {
> +        return 1;
> +    }
> +    if ((ct & TCG_CT_CONST_S12) && val == sextreg(val, 0, 12)) {
> +        return 1;
> +    }
> +    if ((ct & TCG_CT_CONST_N12) && -val == sextreg(-val, 0, 12)) {
> +        return 1;
> +    }
> +    if ((ct & TCG_CT_CONST_U12) && val >= 0 && val <= 0xfff) {
> +        return 1;
> +    }
> +    if ((ct & TCG_CT_CONST_C12) && ~val >= 0 && ~val <= 0xfff) {
> +        return 1;
> +    }
> +    if ((ct & TCG_CT_CONST_WSZ) && val == (type == TCG_TYPE_I32 ? 32 : 64)) {
> +        return 1;
> +    }
> +    return 0;

Replacing 1 -> true and 0 -> false:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +}
> 

