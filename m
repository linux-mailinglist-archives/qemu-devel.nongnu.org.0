Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E9D3257E4
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 21:47:33 +0100 (CET)
Received: from localhost ([::1]:47490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFNXo-0006Ps-Ev
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 15:47:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFNVX-0005aM-Mo
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:45:11 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:35571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFNVS-0004jF-S6
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:45:11 -0500
Received: by mail-pj1-x1031.google.com with SMTP id e9so4298796pjj.0
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 12:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I/+Jn5lUAbf7Y/q602uqkkTcKL6nrrAjIdLM/8si67c=;
 b=P8wnuF8skWN2kLUKqH3pWwRkOieetwLsqhF2wx3ulcdmrUb8nsFen9G+Wtb7a0+Qg0
 ecd3uwDkH0H8Sh5J7mmhaGTY7VoGtH9jvNW+U+zPG+oh0ZFlQP5xSIfDJ5vgTuKbpqjm
 wcjhyMtBXuubCsstE/26yGWM+3SoGdyJlWT8h3gkfDTa9Vo4fE2/ULkB4wGN6lACkp8h
 LoRkZUlqJ3QUnDdB3XFQ/PJDJf9JL3Q6KB65p/DocWXKp5C/tyOOrEVv6sFv57tqCrKS
 TSGhwfjeicYCEeGtXltqN4/Sts4VY4JiCG56UR/C1lVfA3fvQkNqx2+wplWzckNY5jye
 utrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I/+Jn5lUAbf7Y/q602uqkkTcKL6nrrAjIdLM/8si67c=;
 b=nnnjmP7j9dkSSRWEVtmJbXQhLI702LhdwxnnUhgZHRsHmebotaLLpZi3BazQ0IuW4/
 cTJUirPv8HLxEne3G61DdIyfv8dLwSHNZDa6vnZUV6uUkzUXZLjmnTOp4lq0bNGGmsd5
 85lrvQghVSpzKb0wmYBJB3dC7lDfpPKgbCTLzd1ImkqyKb/0SqXcwB6tF0fm6g1z8ly7
 iULzpIavPk8+ZxkxwDGb3EjvuE7ziNzB4Lq2Okok5NztoI8bnEkB0QyGQCgK2DcNdcfM
 0qhdhswFbqkamncU/xVF5xP5PflKIzs2LQi9wd56oG8gydP6gimQlRvujLSeVV73Tr4I
 abVA==
X-Gm-Message-State: AOAM533ibq7QR1GXEkS1G8DuHOwUEwi57qc+i7nqohk6qXD5vDPxURXc
 PaJxAZmiMdzNpZ51860fjDGsSQ==
X-Google-Smtp-Source: ABdhPJwTQTE6JSQo4bXcgYrfXw/CFEIkUVDETKqaZmX/D+HLGb7GJ7BWRU6k7w7/+PmVTQllQDDeDw==
X-Received: by 2002:a17:90a:e7cd:: with SMTP id
 kb13mr230835pjb.10.1614285905153; 
 Thu, 25 Feb 2021 12:45:05 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d10sm7074567pgl.72.2021.02.25.12.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 12:45:04 -0800 (PST)
Subject: Re: [PATCH v2 04/10] target/hexagon: introduce new helper functions
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-5-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9b040b9f-cba6-5a2e-a1af-ea4d9445b453@linaro.org>
Date: Thu, 25 Feb 2021 12:45:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225151856.3284701-5-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.435,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 7:18 AM, Alessandro Di Federico wrote:
> From: Niccolò Izzo <nizzo@rev.ng>
> 
> These helpers will be employed by the idef-parser generated code.
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Niccolò Izzo <nizzo@rev.ng>
> ---
>  target/hexagon/genptr.c | 227 +++++++++++++++++++++++++++++++++++++++-
>  target/hexagon/genptr.h |  19 ++++
>  target/hexagon/macros.h |   2 +-
>  3 files changed, 245 insertions(+), 3 deletions(-)
> 
> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
> index 97de669f38..78cda032db 100644
> --- a/target/hexagon/genptr.c
> +++ b/target/hexagon/genptr.c
> @@ -40,7 +40,8 @@ TCGv gen_read_preg(TCGv pred, uint8_t num)
>      return pred;
>  }
>  
> -static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
> +static inline void gen_log_predicated_reg_write(int rnum, TCGv val,
> +                                                unsigned slot)

This change is unrelated to adding new helper functions.
It requires a separate patch and justification.

> +void gen_fbrev(TCGv result, TCGv src)
> +{
> +    TCGv lo = tcg_temp_new();
> +    TCGv tmp1 = tcg_temp_new();
> +    TCGv tmp2 = tcg_temp_new();
> +
> +    /* Bit reversal of low 16 bits */
> +    tcg_gen_extract_tl(lo, src, 0, 16);
> +    tcg_gen_andi_tl(tmp1, lo, 0xaaaa);
> +    tcg_gen_shri_tl(tmp1, tmp1, 1);
> +    tcg_gen_andi_tl(tmp2, lo, 0x5555);
> +    tcg_gen_shli_tl(tmp2, tmp2, 1);
> +    tcg_gen_or_tl(lo, tmp1, tmp2);
> +    tcg_gen_andi_tl(tmp1, lo, 0xcccc);
> +    tcg_gen_shri_tl(tmp1, tmp1, 2);
> +    tcg_gen_andi_tl(tmp2, lo, 0x3333);
> +    tcg_gen_shli_tl(tmp2, tmp2, 2);
> +    tcg_gen_or_tl(lo, tmp1, tmp2);
> +    tcg_gen_andi_tl(tmp1, lo, 0xf0f0);
> +    tcg_gen_shri_tl(tmp1, tmp1, 4);
> +    tcg_gen_andi_tl(tmp2, lo, 0x0f0f);
> +    tcg_gen_shli_tl(tmp2, tmp2, 4);
> +    tcg_gen_or_tl(lo, tmp1, tmp2);
> +    tcg_gen_bswap16_tl(lo, lo);

So far we've kept operations like this as external helper functions, where you
can then use revbit16().  General rule of thumb for a cutoff is about 10-15
ops, and this is right on the edge.

Any particular reason you wanted this inlined?

> +    /* Final tweaks */
> +    tcg_gen_extract_tl(result, src, 16, 16);
> +    tcg_gen_or_tl(result, result, lo);

This is wrong.  You've clobbered your carefully reversed results with the high
16-bits of src.

I'm certain you wanted

   tcg_gen_deposit_tl(result, src, lo, 0, 16);

to replace the low 16 bits of the input with your computation.

> +TCGv gen_set_bit(tcg_target_long i, TCGv result, TCGv src)
> +{
> +    TCGv mask = tcg_const_tl(~(1 << i));
> +    TCGv bit = tcg_temp_new();
> +    tcg_gen_shli_tl(bit, src, i);
> +    tcg_gen_and_tl(result, result, mask);
> +    tcg_gen_or_tl(result, result, bit);
> +    tcg_temp_free(mask);
> +    tcg_temp_free(bit);

  tcg_gen_deposit_tl(result, result, src, i, 1);

> +void gen_cancel(tcg_target_ulong slot)
> +{
> +    TCGv one = tcg_const_tl(1);
> +    tcg_gen_deposit_tl(hex_slot_cancelled, hex_slot_cancelled, one, slot, 1);
> +    tcg_temp_free(one);

  tcg_gen_ori_tl(hex_slot_cancelled, hex_slot_cancelled,
                 1 << slot);

> +void gen_sat_i32(TCGv dest, TCGv source, int width, bool set_overflow)
> +{
> +    TCGv max_val = tcg_const_i32((1 << (width - 1)) - 1);
> +    TCGv min_val = tcg_const_i32(-(1 << (width - 1)));
> +    tcg_gen_movcond_i32(TCG_COND_GT, dest, source, max_val, max_val, source);
> +    tcg_gen_movcond_i32(TCG_COND_LT, dest, source, min_val, min_val, dest);

  tcg_gen_smin_tl(dest, source, max_val);
  tcg_gen_smax_tl(dest, dest, min_val);

> +    /* Set Overflow Bit */
> +    if (set_overflow) {
> +        TCGv ovf = tcg_temp_new();
> +        TCGv one = tcg_const_i32(1);
> +        GET_USR_FIELD(USR_OVF, ovf);
> +        tcg_gen_movcond_i32(TCG_COND_GT, ovf, source, max_val, one, ovf);
> +        tcg_gen_movcond_i32(TCG_COND_LT, ovf, source, min_val, one, ovf);
> +        SET_USR_FIELD(USR_OVF, ovf);

This seems like a complicated way to set overflow.
How about

  tcg_gen_setcond_tl(TCG_COND_NE, ovf, source, dest);
  tcg_gen_shli_tl(ovf, ovf, USR_OVF_SHIFT);
  tcg_gen_or_tl(hex_reg[usr], hex_reg[usr], ovf);


> +        tcg_temp_free_i32(ovf);
> +        tcg_temp_free_i32(one);
> +    }
> +    tcg_temp_free_i32(max_val);
> +    tcg_temp_free_i32(min_val);
> +}
> +
> +void gen_satu_i32(TCGv dest, TCGv source, int width, bool set_overflow)
> +{
> +    TCGv max_val = tcg_const_i32((1 << width) - 1);
> +    tcg_gen_movcond_i32(TCG_COND_GTU, dest, source, max_val, max_val, source);
> +    TCGv_i32 zero = tcg_const_i32(0);
> +    tcg_gen_movcond_i32(TCG_COND_LT, dest, source, zero, zero, dest);

Is this a signed input being saturated to unsigned bounds or not?  Because one
of these two comparisons is wrong.

If it's an unsigned input being saturated to unsigned bounds, then you don't
need the second test at all, and should be using

  tcg_gen_umin_i32(dest, src, max_val);

> +void gen_sat_i64(TCGv_i64 dest, TCGv_i64 source, int width, bool set_overflow)
> +void gen_satu_i64(TCGv_i64 dest, TCGv_i64 source, int width, bool set_overflow)

Similarly.

> diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
> index 78c4efb5cb..7b6556b07b 100644
> --- a/target/hexagon/macros.h
> +++ b/target/hexagon/macros.h
> @@ -154,7 +154,7 @@
>  #define LOAD_CANCEL(EA) do { CANCEL; } while (0)
>  
>  #ifdef QEMU_GENERATE
> -static inline void gen_pred_cancel(TCGv pred, int slot_num)
> +static inline void gen_pred_cancel(TCGv pred, tcg_target_ulong slot_num)

Why in the world would a slot number need to be 64-bits?


r~


