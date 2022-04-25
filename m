Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7453650EB4F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 23:34:53 +0200 (CEST)
Received: from localhost ([::1]:40302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj6M8-00083w-5d
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 17:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj6KV-0006R3-TQ
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 17:33:11 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:45825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj6KU-0006hO-2b
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 17:33:11 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so602387pji.4
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 14:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G+Y/XU4vhKky/dchKqRux7ImR+eg0V1gI9XhQE6NrQk=;
 b=PbSt8ECmzLgHglykej0TxukGZhJ+RweJnfn06fSCebWe7dktv7RxyQvLhN9AwV8vRL
 JfzJvT+cyk/1VNUGxYYjU6OUHhD3nBUzekIQVNbLwurXzNUAIhxLwFZU11iBb9UiyoyR
 560zUNaDVqUc3SyIdzQnvMRaMdWh4u2uHMGRUVFkACWo3BQ9qq7ElcKnxLyhKe0qHkyU
 Pm1jyaYszLoLx4DXXtOTY+Q+s0MHNbrEf9oAhdLnMoo0DElD0EnRg0vJ1sOXDM4YW+m0
 Q+YREqGEpdgx6iregm9lcBUF2BNDAZ16mE0mhYl1tItqe4jNcUwBialktgUPnrKgJ4OJ
 JZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G+Y/XU4vhKky/dchKqRux7ImR+eg0V1gI9XhQE6NrQk=;
 b=KL0OXXY/MlriXbAQLOs7O6cpaQvWeYUT9thPQDhe19pLtQLM9OKqy17H8ZZsZ8XOwG
 lOrgVt8pJgQ9yPCRTO/OkoB9VenNAK22TSoSiAf6vj6CsGkBMzm2ke95peDW9p8qzmwh
 82e/i0PFXmj3mJwnXTKSjPr4kgSJNLPX9Ue0aK5byZa9B+kAbGEpYTYhm/hUlT+HgNkR
 aMaQOouHC/jRmound0OTfYtWPYtj02ydxjpXPBu2SA2I4qNOSRLTwsV5qRsCjvayxSIJ
 upi8J72d94MWhyb7PQpPrpJ1/GNgHoL7USLirN97xQuffUNgW/gKbumU0dPVAYczuBRg
 y7oA==
X-Gm-Message-State: AOAM530IdK9PNO5UD1SnolmyiV0ffDcIZ9uzJf13zBc7LdDSEX4tvzWL
 ZaqsDCR9St93PNiow2YVkZmvIA==
X-Google-Smtp-Source: ABdhPJwErEK7ZmnfnMhZx5o0Ks5aiJhry1Ded9OgwY/Lpq7CUf6pO9QSqiP4dv4sAZ+wqbd+AxY6Ew==
X-Received: by 2002:a17:902:8d84:b0:159:5e8:ed01 with SMTP id
 v4-20020a1709028d8400b0015905e8ed01mr20329376plo.30.1650922388028; 
 Mon, 25 Apr 2022 14:33:08 -0700 (PDT)
Received: from [192.168.1.6] ([174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a17090aeb9300b001cd4989ff3fsm271340pjy.6.2022.04.25.14.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 14:33:07 -0700 (PDT)
Message-ID: <27db1a9b-f64b-a07b-b6d2-3c85b4beb707@linaro.org>
Date: Mon, 25 Apr 2022 14:33:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 10/42] i386: Rewrite vector shift helper
Content-Language: en-US
To: Paul Brook <paul@nowt.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220424220204.2493824-11-paul@nowt.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220424220204.2493824-11-paul@nowt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/22 15:01, Paul Brook wrote:
> Rewrite the vector shift helpers in preperation for AVX support (3 operand
> form and 256 bit vectors).
> 
> For now keep the existing two operand interface.
> 
> No functional changes to existing helpers.
> 
> Signed-off-by: Paul Brook <paul@nowt.org>
> ---
>   target/i386/ops_sse.h | 250 ++++++++++++++++++++++--------------------
>   1 file changed, 133 insertions(+), 117 deletions(-)
> 
> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
> index 23daab6b50..9297c96d04 100644
> --- a/target/i386/ops_sse.h
> +++ b/target/i386/ops_sse.h
> @@ -63,199 +63,215 @@
>   #define MOVE(d, r) memcpy(&(d).B(0), &(r).B(0), SIZE)
>   #endif
>   
> -void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
> +#if SHIFT == 0
> +#define SHIFT_HELPER_BODY(n, elem, F) do {      \
> +    d->elem(0) = F(s->elem(0), shift);          \
> +    if ((n) > 1) {                              \
> +        d->elem(1) = F(s->elem(1), shift);      \
> +    }                                           \
> +    if ((n) > 2) {                              \
> +        d->elem(2) = F(s->elem(2), shift);      \
> +        d->elem(3) = F(s->elem(3), shift);      \
> +    }                                           \
> +    if ((n) > 4) {                              \
> +        d->elem(4) = F(s->elem(4), shift);      \
> +        d->elem(5) = F(s->elem(5), shift);      \
> +        d->elem(6) = F(s->elem(6), shift);      \
> +        d->elem(7) = F(s->elem(7), shift);      \
> +    }                                           \
> +    if ((n) > 8) {                              \
> +        d->elem(8) = F(s->elem(8), shift);      \
> +        d->elem(9) = F(s->elem(9), shift);      \
> +        d->elem(10) = F(s->elem(10), shift);    \
> +        d->elem(11) = F(s->elem(11), shift);    \
> +        d->elem(12) = F(s->elem(12), shift);    \
> +        d->elem(13) = F(s->elem(13), shift);    \
> +        d->elem(14) = F(s->elem(14), shift);    \
> +        d->elem(15) = F(s->elem(15), shift);    \
> +    }                                           \
> +    } while (0)
> +
> +#define FPSRL(x, c) ((x) >> shift)
> +#define FPSRAW(x, c) ((int16_t)(x) >> shift)
> +#define FPSRAL(x, c) ((int32_t)(x) >> shift)
> +#define FPSLL(x, c) ((x) << shift)
> +#endif
> +
> +void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
>   {
> +    Reg *s = d;
>       int shift;
> -
> -    if (s->Q(0) > 15) {
> +    if (c->Q(0) > 15) {
>           d->Q(0) = 0;
> -#if SHIFT == 1
> -        d->Q(1) = 0;
> -#endif
> +        XMM_ONLY(d->Q(1) = 0;)
> +        YMM_ONLY(
> +                d->Q(2) = 0;
> +                d->Q(3) = 0;
> +                )
>       } else {
> -        shift = s->B(0);
> -        d->W(0) >>= shift;
> -        d->W(1) >>= shift;
> -        d->W(2) >>= shift;
> -        d->W(3) >>= shift;
> -#if SHIFT == 1
> -        d->W(4) >>= shift;
> -        d->W(5) >>= shift;
> -        d->W(6) >>= shift;
> -        d->W(7) >>= shift;
> -#endif
> +        shift = c->B(0);
> +        SHIFT_HELPER_BODY(4 << SHIFT, W, FPSRL);
>       }

I do not think it worthwhile to unroll these loops by hand.
If we're that keen on it, it should be written

#pragma GCC unroll 4 << SHIFT
     for (i = 0; i < 4 << SHIFT; ++i) {
         something
     }

However, I would much rather you rework the users to use tcg_gen_gvec_3.  Note that you 
can't use tcg_gen_gvec_shls directly because of the shift-overflow-to-zero behaviour. 
There are examples in target/arm/translate.c, though of course the arm shift semantics are 
different, so it's not cut-and-paste.



r~

