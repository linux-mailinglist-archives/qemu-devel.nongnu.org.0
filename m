Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BA65A052A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 02:29:17 +0200 (CEST)
Received: from localhost ([::1]:41080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR0kG-0006wD-G6
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 20:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oR0j0-0005AH-Fi
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 20:27:58 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oR0iy-0007VQ-7n
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 20:27:57 -0400
Received: by mail-pl1-x634.google.com with SMTP id p18so17103834plr.8
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 17:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=BX2wdy/k4O2tQBIQutRjV9STFfZ8Z4da9G/msZoJX7c=;
 b=cW0vHcp4YuLZk99u40KvOY/yqSaU1n78YuGcEfOAhGB/8XABjpmCg82pEdirOup8RH
 SRkGHD1FgET7HieMyLKvvfSVEguZthGhlgSRqA9QcFHiO+mMCPMptElDeClMRDjN3F0W
 GX8ZUvKPNrqD37yOTNeMIg8+czaNQOVzxD7j50e4cCsdqXkcGsf5u7Cq0mIc/5nRiQOD
 3d99Ob1X9jjoA37CJR7YCqSvreU7iCJH0SbokjW7kqKYjDj/BmJaALzRyOpiEL+crAnj
 FkrssRh143UjYHMJ650orHpAptoFT12mHhQR5Bh0tJ/VpLAbjEkf522/NVRs4VoAATiz
 qE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=BX2wdy/k4O2tQBIQutRjV9STFfZ8Z4da9G/msZoJX7c=;
 b=vgy+vG47YbPnDvH9D7uIowBFAFUt3+JYZKvzO7KvhfJxjAN/rkCXsAF33Xjdqc3i9r
 smzmSea+MlkzXdjmefpL4oJOyAy1dZcXoQRuxT80ggiBGdk8+k8ncXEyhNksfAF1l7sB
 uEwdXMssaT6klrAZ/ATNj+seo27G1DetfAKOIz+s31r3xChjY36bvRdAsCk2yxyITOEm
 9gVf5VcuTHG0EtGxwgIgjO/bmO2145AEpNPMMiCMTHV+pHX25Bpl6KLVQ1JHujrzuned
 s8aTrz1bD6l036Cls2yy9f3f6m5M0ZcBSaiz1Mrhrh/sbjzj9b7oleswOEna+BiYrntj
 cs2Q==
X-Gm-Message-State: ACgBeo2g2st7IcPGQf6uty48IDrw3pRlV9hXVPukmEOJDGkMeuWESP+D
 XnibhbiRP6PMLAkqQel8jIfDTA==
X-Google-Smtp-Source: AA6agR4buVwpUayi9NlgJe5MLnokBv8NTElPNg1cFnG4oZrXvD1Hat2lOyUmdYkIHoqjSqDDHYLEtw==
X-Received: by 2002:a17:90a:fc87:b0:1fa:ddf8:ddd1 with SMTP id
 ci7-20020a17090afc8700b001faddf8ddd1mr10996045pjb.8.1661387273445; 
 Wed, 24 Aug 2022 17:27:53 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:944b:63b7:13bc:4d26?
 ([2602:47:d49d:ec01:944b:63b7:13bc:4d26])
 by smtp.gmail.com with ESMTPSA id
 w196-20020a627bcd000000b00535bf24008asm13560111pfc.207.2022.08.24.17.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 17:27:52 -0700 (PDT)
Message-ID: <f1114bbe-4f66-f4ae-068b-8813deb9a254@linaro.org>
Date: Wed, 24 Aug 2022 17:27:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/17] target/i386: add 00-07, 10-17 opcodes
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220824173123.232018-1-pbonzini@redhat.com>
 <20220824173123.232018-6-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220824173123.232018-6-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/24/22 10:31, Paolo Bonzini wrote:
> +static void gen_alu_op(DisasContext *s1, int op, MemOp ot)
> +{
> +    switch(op) {
> +    case OP_ADCL:
> +        gen_compute_eflags_c(s1, s1->tmp4);
> +        if (s1->prefix & PREFIX_LOCK) {
> +            tcg_gen_add_tl(s1->T0, s1->tmp4, s1->T1);
> +            tcg_gen_atomic_add_fetch_tl(s1->T0, s1->A0, s1->T0,
> +                                        s1->mem_index, ot | MO_LE);
> +        } else {
> +            tcg_gen_add_tl(s1->T0, s1->T0, s1->T1);
> +            tcg_gen_add_tl(s1->T0, s1->T0, s1->tmp4);
> +        }
> +        gen_op_update3_cc(s1, s1->tmp4);
> +        set_cc_op(s1, CC_OP_ADCB + ot);
> +        break;
> +    case OP_SBBL:
> +        gen_compute_eflags_c(s1, s1->tmp4);
> +        if (s1->prefix & PREFIX_LOCK) {
> +            tcg_gen_add_tl(s1->T0, s1->T1, s1->tmp4);
> +            tcg_gen_neg_tl(s1->T0, s1->T0);
> +            tcg_gen_atomic_add_fetch_tl(s1->T0, s1->A0, s1->T0,
> +                                        s1->mem_index, ot | MO_LE);
> +        } else {
> +            tcg_gen_sub_tl(s1->T0, s1->T0, s1->T1);
> +            tcg_gen_sub_tl(s1->T0, s1->T0, s1->tmp4);
> +        }
> +        gen_op_update3_cc(s1, s1->tmp4);
> +        set_cc_op(s1, CC_OP_SBBB + ot);
> +        break;
> +    case OP_ADDL:
> +        if (s1->prefix & PREFIX_LOCK) {
> +            tcg_gen_atomic_add_fetch_tl(s1->T0, s1->A0, s1->T1,
> +                                        s1->mem_index, ot | MO_LE);
> +        } else {
> +            tcg_gen_add_tl(s1->T0, s1->T0, s1->T1);
> +        }
> +        gen_op_update2_cc(s1);
> +        set_cc_op(s1, CC_OP_ADDB + ot);
> +        break;
> +    case OP_SUBL:
> +        if (s1->prefix & PREFIX_LOCK) {
> +            tcg_gen_neg_tl(s1->T0, s1->T1);
> +            tcg_gen_atomic_fetch_add_tl(s1->cc_srcT, s1->A0, s1->T0,
> +                                        s1->mem_index, ot | MO_LE);
> +            tcg_gen_sub_tl(s1->T0, s1->cc_srcT, s1->T1);
> +        } else {
> +            tcg_gen_mov_tl(s1->cc_srcT, s1->T0);
> +            tcg_gen_sub_tl(s1->T0, s1->T0, s1->T1);
> +        }
> +        gen_op_update2_cc(s1);
> +        set_cc_op(s1, CC_OP_SUBB + ot);
> +        break;
> +    default:
> +    case OP_ANDL:
> +        if (s1->prefix & PREFIX_LOCK) {
> +            tcg_gen_atomic_and_fetch_tl(s1->T0, s1->A0, s1->T1,
> +                                        s1->mem_index, ot | MO_LE);
> +        } else {
> +            tcg_gen_and_tl(s1->T0, s1->T0, s1->T1);
> +        }
> +        gen_op_update1_cc(s1);
> +        set_cc_op(s1, CC_OP_LOGICB + ot);
> +        break;
> +    case OP_ORL:
> +        if (s1->prefix & PREFIX_LOCK) {
> +            tcg_gen_atomic_or_fetch_tl(s1->T0, s1->A0, s1->T1,
> +                                       s1->mem_index, ot | MO_LE);
> +        } else {
> +            tcg_gen_or_tl(s1->T0, s1->T0, s1->T1);
> +        }
> +        gen_op_update1_cc(s1);
> +        set_cc_op(s1, CC_OP_LOGICB + ot);
> +        break;
> +    case OP_XORL:
> +        if (s1->prefix & PREFIX_LOCK) {
> +            tcg_gen_atomic_xor_fetch_tl(s1->T0, s1->A0, s1->T1,
> +                                        s1->mem_index, ot | MO_LE);
> +        } else {
> +            tcg_gen_xor_tl(s1->T0, s1->T0, s1->T1);
> +        }
> +        gen_op_update1_cc(s1);
> +        set_cc_op(s1, CC_OP_LOGICB + ot);
> +        break;
> +    }
> +}

If you were sharing this with the old decoder, and thus needed to retain it, that would be 
one thing.  But there's no shared prefix or postfix in this function, so you might as well

> +
> +static void gen_ADC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    gen_alu_op(s, OP_ADCL, decode->op[0].ot);
> +}

... split each case into ...

> +
> +static void gen_ADD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    gen_alu_op(s, OP_ADDL, decode->op[0].ot);
> +}

... these functions.



r~

