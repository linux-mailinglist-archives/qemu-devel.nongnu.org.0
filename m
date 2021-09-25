Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131654180E6
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 11:56:22 +0200 (CEST)
Received: from localhost ([::1]:57100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU4Ps-0003rW-Tq
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 05:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4O0-00031L-KI
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 05:54:24 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4Ny-00024Z-Q7
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 05:54:24 -0400
Received: by mail-wr1-x434.google.com with SMTP id w17so34818851wrv.10
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 02:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CPgRaApSHVynD8ehH1hmKPTliBhYFGMyCVJzrvQJcZ8=;
 b=j0HTq6eQyNJsBbKErJb6lMArJfS1qSbb7pBRVHqF41xBvWI0s8UchgH/Qs22acjXvl
 uFyWacR+fi+1SVeqYQWt99U9ErIe9KRLzvCxDi//BkN1CBT/ZTBh4ROHotumWoWtPcyA
 8rNzqF4rH4vec1ypfbsj+C2AWWfxFmC0Ff9K57aah9S6nLfc/85IBntv0zDjSEK+khqe
 U4F0LLwrRABh/Io6n3TH8YCRVUfoB5Pq4tObyGGsi37fV97CcQj7MMKfdA+1p9Zb/5DY
 9/ojnu5mtnh1uRZEh/jStPSTu10j+0xF7D36TQ4cD4eJTtIq5Zkf5tFQgXQIHY9z0xmy
 OGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CPgRaApSHVynD8ehH1hmKPTliBhYFGMyCVJzrvQJcZ8=;
 b=pfzuzoiecLFTpfkBtJcN0IiBNa+2Wf/w6fnD4u1l5ts8QRYSNLHhtYyt3RdHJy1AoE
 58ZV+RuUaRdXYrTlkGQ4WswU3ICnljk0cVm3AQ5mcyFZltZLPVraW8X4hLQqBlQt4qxG
 6Ba4t138e3FPNo3cz79ooBUeFw+gQKKeZNkNHqnBs02Df8aN18zHW2rJVL0Y0nSjmNdG
 lV9cBWOjLgVje9Z7R3t/5rVEGH3XD/G5sSkPJLhM/yCVnwYsyOwyZFVudRZb8EfU9AmJ
 +WUG9SqauH3NdSA5QcTI5mey1V78C9PX+hPmYHYFHCkzM016Yq5o9HznpBm/HoR5mteW
 tkCw==
X-Gm-Message-State: AOAM530KmvFSsJPis0JR7PLYAcmkuE0kInT1fK5n/HuHkXgHDcgfTh/I
 fyPtCLO9gPqd9shUsEESIlE=
X-Google-Smtp-Source: ABdhPJxYtr5C+V51Li/uq0Cr+j7fbbdQ3VfUTa0HaIhvCSoeh/xT5QdO2X5YDymd95Wfm6iKXtX/IA==
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr6306002wmh.48.1632563661168; 
 Sat, 25 Sep 2021 02:54:21 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z133sm18756983wmc.45.2021.09.25.02.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 02:54:20 -0700 (PDT)
Message-ID: <b1b97929-ef62-72ec-609f-bd84c49481d1@amsat.org>
Date: Sat, 25 Sep 2021 11:54:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-10-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924172527.904294-10-git@xen0n.name>
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
>   tcg/loongarch64/tcg-target.c.inc | 109 +++++++++++++++++++++++++++++++
>   1 file changed, 109 insertions(+)

> +/* Loads a 32-bit immediate into rd, sign-extended.  */
> +static void tcg_out_movi_i32(TCGContext *s, TCGReg rd, int32_t val)
> +{
> +    /* Single-instruction cases.  */
> +    tcg_target_long lo = sextreg(val, 0, 12);
> +    if (lo == val) {
> +        /* val fits in simm12: addi.w rd, zero, val */
> +        tcg_out_opc_addi_w(s, rd, TCG_REG_ZERO, val);
> +        return;
> +    }
> +    if (0x800 <= val && val <= 0xfff) {
> +        /* val fits in uimm12: ori rd, zero, val */
> +        tcg_out_opc_ori(s, rd, TCG_REG_ZERO, val);
> +        return;
> +    }
> +
> +    /* High bits must be set; load with lu12i.w + optional ori.  */
> +    tcg_target_long hi12 = sextreg(val, 12, 20);

Please declare variables in function prologue.

Maybe name lo12 and hi20?

> +    tcg_out_opc_lu12i_w(s, rd, hi12);
> +    if (lo != 0) {
> +        tcg_out_opc_ori(s, rd, rd, lo & 0xfff);

Isn't lo already 12-bit? Why the mask?

> +    }
> +}
> +
> +static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
> +                         tcg_target_long val)
> +{
> +    if (type == TCG_TYPE_I32 || val == (int32_t)val) {
> +        tcg_out_movi_i32(s, rd, val);
> +        return;
> +    }
> +
> +    /* PC-relative cases.  */
> +    intptr_t pc_offset = tcg_pcrel_diff(s, (void *)val);

Declare in prologue.

> +    if (pc_offset == sextreg(pc_offset, 0, 22) && (pc_offset & 3) == 0) {
> +        /* Single pcaddu2i.  */
> +        tcg_out_opc_pcaddu2i(s, rd, pc_offset >> 2);
> +        return;
> +    }
> +
> +    if (pc_offset == (int32_t)pc_offset) {
> +        /* Offset within 32 bits; load with pcalau12i + ori.  */
> +        tcg_target_long lo = sextreg(val, 0, 12);

Name this 'val_lo' similarly to val_hi?

> +        tcg_target_long pc_hi = (val - pc_offset) >> 12;
> +        tcg_target_long val_hi = val >> 12;
> +        tcg_target_long offset_hi = val_hi - pc_hi;
> +        tcg_debug_assert(offset_hi == sextreg(offset_hi, 0, 20));
> +        tcg_out_opc_pcalau12i(s, rd, offset_hi);
> +        if (lo != 0) {
> +            tcg_out_opc_ori(s, rd, rd, lo & 0xfff);

Again, lo is already 12-bit.

> +        }
> +        return;
> +    }
> +
> +    /* Single cu52i.d case.  */
> +    if (ctz64(val) >= 52) {
> +        tcg_out_opc_cu52i_d(s, rd, TCG_REG_ZERO, val >> 52);
> +        return;
> +    }
> +
> +    /* Slow path.  Initialize the low 32 bits, then concat high bits.  */
> +    tcg_out_movi_i32(s, rd, val);
> +
> +    bool rd_high_bits_are_ones = (int32_t)val < 0;

Declare in prologue, however this is hard to read. KISS:

        rd_high_bits_are_ones = (int32_t)val < 0 ? true : false;

> +    tcg_target_long hi32 = sextreg(val, 32, 20);

By 'hi32' I expect the 32 high bits. Maybe explicit as hi32_20?

> +    tcg_target_long hi52 = sextreg(val, 52, 12);

And hi52_12?

> +
> +    if (imm_part_needs_loading(rd_high_bits_are_ones, hi32)) {
> +        tcg_out_opc_cu32i_d(s, rd, hi32);
> +        rd_high_bits_are_ones = hi32 < 0;

Again KISS:

            if (hi32 < 0) {
                rd_high_bits_are_ones = true;
            }

> +    }
> +
> +    if (imm_part_needs_loading(rd_high_bits_are_ones, hi52)) {
> +        tcg_out_opc_cu52i_d(s, rd, rd, hi52);
> +    }
> +}

With comment addressed:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

