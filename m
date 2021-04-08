Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0529E357904
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 02:23:17 +0200 (CEST)
Received: from localhost ([::1]:49572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUIS3-0006ht-F7
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 20:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUIPl-0005Bs-Cx
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 20:20:54 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUIPZ-0002cV-Qc
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 20:20:52 -0400
Received: by mail-pl1-x635.google.com with SMTP id ay2so119187plb.3
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 17:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yu83XVdIKD7pvteC9vKYdzET4e0VlNA1bk4jJzLoGnM=;
 b=KxKL54Ec4sIjK/PyWFzAXBl+llmLIJobzIc+KFN26ZLZ76v9qFJOPa0pfh0In15xQ4
 WTnohW0WmIDOwIMBxQNuY6vzNQXt9JNa1/Si4BZUEdCeofTXJFvDMFrKjwXb7ejNHmjF
 T/p8Os3YVUZvYdQNZAkCld5p5lxq9F3mcqJruLr6udooc8KRxxoSPb63otOfcOx2jZVJ
 BmXv6DuF9ZjolPo+heKCoAqnpBa6xyjJ7nvTfTELPYnmwglNCQfc5lKPb2tw6GOlgCGU
 6p1xDmowmMq7uvkdwZYH1XY7rSeVRDd7ZbpgFua4pQUpPqiGTrMC9IBTadGeUpwdn4nX
 M2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yu83XVdIKD7pvteC9vKYdzET4e0VlNA1bk4jJzLoGnM=;
 b=BuoxbO2KuBuac9zdi/lzbNHlCIlQx68wPj+tlmyWuWnz7GrZnmokApx8NxQAqgqz+T
 S+KBKCxWkqgbeBTuhvKIdtICKwuuCHW2JzJEUSQRsQLIks6jHTYx+SaPnrA/ceJi0OrH
 hvw6O3cmsRGzyh9XBQg7DyQ6z/Amc79xaaEhisBhF8j0PZqVW/yu9stVfpTDT7m5pQ6b
 x1rttrQgxyPml2P2lg9Wsq0fT0tjCtfqsQ76DFjLGJBB2dKMPV+VW7PWWEElZpyYstym
 XaTx3923czq7yknxwKxu9QHg0HF/dKXg1eNGliV/HLOljjnRypVX/gQz2AIpFhSNA5g/
 4Bpw==
X-Gm-Message-State: AOAM530eYNll5kgoXATpPUbl1V8+vXua9s6D+SmMfaXltN3GIUfDdaDH
 JaFhdlMvLuVFTIczMvQ0bsuKJA==
X-Google-Smtp-Source: ABdhPJzFJnSxaI3Bx6jbGlLg1tEW1kOeKGc9SgblMMhHbkz7C4ymWBb+9hgLYSrEjwp76J+vTquF8w==
X-Received: by 2002:a17:903:2306:b029:e7:1c8d:63fc with SMTP id
 d6-20020a1709032306b02900e71c8d63fcmr5291275plh.35.1617841239010; 
 Wed, 07 Apr 2021 17:20:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y189sm22072985pfy.8.2021.04.07.17.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 17:20:38 -0700 (PDT)
Subject: Re: [PATCH 07/27] arc: TCG instruction definitions
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-8-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c2288398-1192-5abf-b671-9f57d81200ae@linaro.org>
Date: Wed, 7 Apr 2021 17:20:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-8-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> +/*
> + * ADD
> + *    Variables: @b, @c, @a
> + *    Functions: getCCFlag, getFFlag, setZFlag, setNFlag, setCFlag, CarryADD,
> + *               setVFlag, OverflowADD
> + * --- code ---
> + * {
> + *   cc_flag = getCCFlag ();
> + *   lb = @b;
> + *   lc = @c;
> + *   if((cc_flag == true))
> + *     {
> + *       lb = @b;
> + *       lc = @c;
> + *       @a = (@b + @c);
> + *       if((getFFlag () == true))
> + *         {
> + *           setZFlag (@a);
> + *           setNFlag (@a);
> + *           setCFlag (CarryADD (@a, lb, lc));
> + *           setVFlag (OverflowADD (@a, lb, lc));
> + *         };
> + *     };
> + * }
> + */
> +
> +int
> +arc_gen_ADD(DisasCtxt *ctx, TCGv b, TCGv c, TCGv a)
> +{
> +    int ret = DISAS_NEXT;
> +    TCGv temp_3 = tcg_temp_local_new();
> +    TCGv cc_flag = tcg_temp_local_new();
> +    TCGv lb = tcg_temp_local_new();
> +    TCGv lc = tcg_temp_local_new();
> +    TCGv temp_1 = tcg_temp_local_new();
> +    TCGv temp_2 = tcg_temp_local_new();
> +    TCGv temp_5 = tcg_temp_local_new();
> +    TCGv temp_4 = tcg_temp_local_new();
> +    TCGv temp_7 = tcg_temp_local_new();
> +    TCGv temp_6 = tcg_temp_local_new();
> +    getCCFlag(temp_3);
> +    tcg_gen_mov_tl(cc_flag, temp_3);
> +    tcg_gen_mov_tl(lb, b);
> +    tcg_gen_mov_tl(lc, c);
> +    TCGLabel *done_1 = gen_new_label();
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp_1, cc_flag, arc_true);
> +    tcg_gen_xori_tl(temp_2, temp_1, 1);
> +    tcg_gen_andi_tl(temp_2, temp_2, 1);
> +    tcg_gen_brcond_tl(TCG_COND_EQ, temp_2, arc_true, done_1);
> +    tcg_gen_mov_tl(lb, b);
> +    tcg_gen_mov_tl(lc, c);
> +    tcg_gen_add_tl(a, b, c);
> +    if ((getFFlag () == true)) {
> +        setZFlag(a);
> +        setNFlag(a);
> +        CarryADD(temp_5, a, lb, lc);
> +        tcg_gen_mov_tl(temp_4, temp_5);
> +        setCFlag(temp_4);
> +        OverflowADD(temp_7, a, lb, lc);
> +        tcg_gen_mov_tl(temp_6, temp_7);
> +        setVFlag(temp_6);
> +    }
> +    gen_set_label(done_1);
> +    tcg_temp_free(temp_3);
> +    tcg_temp_free(cc_flag);
> +    tcg_temp_free(lb);
> +    tcg_temp_free(lc);
> +    tcg_temp_free(temp_1);
> +    tcg_temp_free(temp_2);
> +    tcg_temp_free(temp_5);
> +    tcg_temp_free(temp_4);
> +    tcg_temp_free(temp_7);
> +    tcg_temp_free(temp_6);
> +
> +    return ret;
> +}

I must say I'm not really impressed by the results here.

Your input is clearly intended to be fed to an optimizing compiler, which TCG 
is not.


> +/*
> + * DIV
> + *    Variables: @src2, @src1, @dest
> + *    Functions: getCCFlag, divSigned, getFFlag, setZFlag, setNFlag, setVFlag
> + * --- code ---
> + * {
> + *   cc_flag = getCCFlag ();
> + *   if((cc_flag == true))
> + *     {
> + *       if(((@src2 != 0) && ((@src1 != 2147483648) || (@src2 != 4294967295))))
> + *         {
> + *           @dest = divSigned (@src1, @src2);
> + *           if((getFFlag () == true))
> + *             {
> + *               setZFlag (@dest);
> + *               setNFlag (@dest);
> + *               setVFlag (0);
> + *             };
> + *         }
> + *       else
> + *         {
> + *         };
> + *     };
> + * }
> + */
> +
> +int
> +arc_gen_DIV(DisasCtxt *ctx, TCGv src2, TCGv src1, TCGv dest)
> +{
> +    int ret = DISAS_NEXT;
> +    TCGv temp_9 = tcg_temp_local_new();
> +    TCGv cc_flag = tcg_temp_local_new();
> +    TCGv temp_1 = tcg_temp_local_new();
> +    TCGv temp_2 = tcg_temp_local_new();
> +    TCGv temp_3 = tcg_temp_local_new();
> +    TCGv temp_4 = tcg_temp_local_new();
> +    TCGv temp_5 = tcg_temp_local_new();
> +    TCGv temp_6 = tcg_temp_local_new();
> +    TCGv temp_7 = tcg_temp_local_new();
> +    TCGv temp_8 = tcg_temp_local_new();
> +    TCGv temp_10 = tcg_temp_local_new();
> +    TCGv temp_11 = tcg_temp_local_new();
> +    getCCFlag(temp_9);
> +    tcg_gen_mov_tl(cc_flag, temp_9);
> +    TCGLabel *done_1 = gen_new_label();
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp_1, cc_flag, arc_true);
> +    tcg_gen_xori_tl(temp_2, temp_1, 1);
> +    tcg_gen_andi_tl(temp_2, temp_2, 1);
> +    tcg_gen_brcond_tl(TCG_COND_EQ, temp_2, arc_true, done_1);
> +    TCGLabel *else_2 = gen_new_label();
> +    TCGLabel *done_2 = gen_new_label();
> +    tcg_gen_setcondi_tl(TCG_COND_NE, temp_3, src2, 0);
> +    tcg_gen_setcondi_tl(TCG_COND_NE, temp_4, src1, 2147483648);
> +    tcg_gen_setcondi_tl(TCG_COND_NE, temp_5, src2, 4294967295);
> +    tcg_gen_or_tl(temp_6, temp_4, temp_5);
> +    tcg_gen_and_tl(temp_7, temp_3, temp_6);
> +    tcg_gen_xori_tl(temp_8, temp_7, 1);
> +    tcg_gen_andi_tl(temp_8, temp_8, 1);
> +    tcg_gen_brcond_tl(TCG_COND_EQ, temp_8, arc_true, else_2);
> +    divSigned(temp_10, src1, src2);
> +    tcg_gen_mov_tl(dest, temp_10);
> +    if ((getFFlag () == true)) {
> +        setZFlag(dest);
> +        setNFlag(dest);
> +        tcg_gen_movi_tl(temp_11, 0);
> +        setVFlag(temp_11);
> +    }
> +    tcg_gen_br(done_2);
> +    gen_set_label(else_2);
> +    gen_set_label(done_2);
> +    gen_set_label(done_1);

Nor is your compiler, for that matter, creating branches for empty elses.  The 
two together produce cringe-worthy results.

I can't help but feeling that the same amount of effort would have produced a 
legible, maintainable conversion directly to TCG, and without the fantastic 
amount of duplication you have created with your independent v2 and v3 files.


r~

