Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58AC58B034
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 21:14:36 +0200 (CEST)
Received: from localhost ([::1]:53482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK2mJ-0005Lo-Hk
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 15:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK2lC-0003v7-My
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:13:26 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:54787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK2lA-0006x2-U9
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:13:26 -0400
Received: by mail-pj1-x1034.google.com with SMTP id b4so3581516pji.4
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 12:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IrrtpDCOLC0RupZ9n65zYyBUoZtBLR82G5639vcWnmk=;
 b=EFH+cla1pNOCCsx5DlbNBEy5QsgGEzrGjvCmZoQ6g0usxU44JDMfZ7T6vhlPsO0bPx
 fxb0bAd3vNDwZyvyzOaCYKkA/xHle75gdeUwcdBmVY1/v8oew2v2pFwSurqXbM/0frlI
 Qp3TRQlgCEfggJhrG8FZWHYbsdBUaVL2+77HaakkXwXpUAZMEsm4WmORncQ7zMr6FH6R
 oqkgc07ZcNZQIs7k127lgW69HF7bOtSDxA3lwTB2txfTfnqNDnuk0JaY9Fc/nBO3XTi3
 r++heICLlm2DVPAGk3+z6PiVFNPsh1ge/+tjqymkQNnZDjxP+iZY+Kq8gudl/qbDKkAq
 22kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IrrtpDCOLC0RupZ9n65zYyBUoZtBLR82G5639vcWnmk=;
 b=ptzQqO1CnVT1kCHARQa9s0aSekR29ODw1tO7zPxzcwgh9/NjEiicS/g7DWZBA8GMjQ
 c0jOFdEoxN1MThzQncaMKqaWu1uHjLQBJiq9WoAtAUL8sVqi20Dx80WMG/GDIa7mBUAs
 v3gHV9dnWPfmORZa/WpfDPu1x7E95KikSzmv9qTQPE5XQIi9EBg+VgZI4XDyShigzoca
 khaewLDpL1ra5dWdPujCXBOomLJlVjLM301V/nTJbdpeXVnMGto/yzj1yPNgQGD8j+SR
 yiH44P/Fj/5+Ttfom6dmays77TVW9nRhozlcx00Dr8RKpj/WAptvbZg5rBtUj7L9t6KN
 3oxw==
X-Gm-Message-State: ACgBeo1J2r5BkMvswEE+Whji+RUNFsyP6BAatuPoUzwWepkIrm17+IG7
 v7hy4KZMJIqAy0YwphySyeEKdA==
X-Google-Smtp-Source: AA6agR7CN70gTai0Kx1IjSjsWcUzqsDnC9nyRtks6wHczJOmsZ2NDQVTZU8qFHpksI9AlgQHIp6zhg==
X-Received: by 2002:a17:90b:b03:b0:1f3:6fb:bd20 with SMTP id
 bf3-20020a17090b0b0300b001f306fbbd20mr17803740pjb.38.1659726803165; 
 Fri, 05 Aug 2022 12:13:23 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:abf8:e436:f4c:9089?
 ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a17090a7c4700b001f2ef3c7956sm5848079pjl.25.2022.08.05.12.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 12:13:22 -0700 (PDT)
Message-ID: <f1736057-6fe1-9777-a140-ef8a511728e0@linaro.org>
Date: Fri, 5 Aug 2022 12:13:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/4] target/s390x: Make translator stop before the end
 of a page
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220805160914.1106091-1-iii@linux.ibm.com>
 <20220805160914.1106091-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220805160914.1106091-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 8/5/22 09:09, Ilya Leoshkevich wrote:
> Right now translator stops right *after* the end of a page, which
> breaks reporting of fault locations when the last instruction of a
> multi-insn translation block crosses a page boundary.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   include/exec/translator.h    | 10 ++++++++++
>   target/s390x/tcg/translate.c | 35 ++++++++++++++++++++---------------
>   2 files changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/include/exec/translator.h b/include/exec/translator.h
> index 7db6845535..d27f8c33b6 100644
> --- a/include/exec/translator.h
> +++ b/include/exec/translator.h
> @@ -187,4 +187,14 @@ FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
>   
>   #undef GEN_TRANSLATOR_LD
>   
> +/*
> + * Return whether addr is on the same page as where disassembly started.
> + * Translators can use this to enforce the rule that only single-insn
> + * translation blocks are allowed to cross page boundaries.
> + */
> +static inline bool is_same_page(DisasContextBase *db, target_ulong addr)
> +{
> +    return ((addr ^ db->pc_first) & TARGET_PAGE_MASK) == 0;
> +}
> +
>   #endif /* EXEC__TRANSLATOR_H */
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index e2ee005671..0cd0c932fb 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -6305,14 +6305,13 @@ static void extract_field(DisasFields *o, const DisasField *f, uint64_t insn)
>       o->c[f->indexC] = r;
>   }
>   
> -/* Lookup the insn at the current PC, extracting the operands into O and
> -   returning the info struct for the insn.  Returns NULL for invalid insn.  */
> +/* Lookup the insn at the current PC, filling the info struct.  */
>   
> -static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
> +static DisasJumpType extract_insn(CPUS390XState *env, DisasContext *s,
> +                                  const DisasInsn **info)
>   {
>       uint64_t insn, pc = s->base.pc_next;
>       int op, op2, ilen;
> -    const DisasInsn *info;
>   
>       if (unlikely(s->ex_value)) {
>           /* Drop the EX data now, so that it's clear on exception paths.  */
> @@ -6325,9 +6324,13 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
>           ilen = s->ex_value & 0xf;
>           op = insn >> 56;
>       } else {
> +        assert(s->base.num_insns == 1 || is_same_page(&s->base, pc));
>           insn = ld_code2(env, s, pc);
>           op = (insn >> 8) & 0xff;
>           ilen = get_ilen(op);
> +        if (s->base.num_insns > 1 && !is_same_page(&s->base, pc + ilen - 1)) {
> +            return DISAS_TOO_MANY;
> +        }

This doesn't work.

You need to end the TB at the end of the previous insn, not at the beginning of the 
current insn.  Here, we have already committed to executing one instruction.

You need to model this similar to arm's insn_crosses_page, where we check at the end of 
one instruction whether we'll be able to run another.


r~

