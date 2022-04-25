Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ACB50EAF0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 23:02:26 +0200 (CEST)
Received: from localhost ([::1]:59604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj5qi-0008KJ-T9
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 17:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj5og-0007WJ-Sf
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 17:00:18 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:45586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj5oe-0001qF-U2
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 17:00:18 -0400
Received: by mail-pl1-x62f.google.com with SMTP id h12so24613893plf.12
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 14:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VpCr0oDJ6L6VN10f/YhzcQaJvtwIvVQbyp/HCtV4U78=;
 b=ChrtspPGIr3MGlMFRMFVJmb80SFETUPtbjtKG4Vle+HPpPtWvfXtN2fK+bBxx47XlP
 h3cLtHKD7DhorWeXbeJsdcUJ/tFievc6eug4gA24lJ4LSWF+x7wM7IF570hzI8wXWRgZ
 4zyjkKJ0sf8Sbl+N69ex601+ZmrN43ahtVGKbTrKg+akYbum0fKD4HMFdip+9NnagrSb
 qPIwJWihflj8FDNTMEJLhk92+FYDvULk3rO8LKOVF7Mx2tmtY542OZT58D3psO/pS8rb
 ARg/2WzP6/vWqn7WLFJsD5YwF5d2Cdmw7e3K8a0QcOwR+g0pmv65iuV54Fa+VhGw9h1l
 5XMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VpCr0oDJ6L6VN10f/YhzcQaJvtwIvVQbyp/HCtV4U78=;
 b=EUvBY4a5oLYHacadTg6OOMnLXUXROiqfBaQsv+9hQwH7fjQzBLoSPUXE5qoBTB5K8l
 QE3t4zQ4uivv/2402LMTI4Fui/TGjFEi0iccpqZIEj1t5agrKBH+rTIab9AF11ccexum
 if9M32psWCwMNim09rVPU1X87vHyavJ3IsHjZFfgabriCBbCqMbURdBVPr3fOTHV/g9u
 crY/LL9F8/z7p3s07pt+AsJHCRR+6Xylxbj7+mEkaiTiN+9qHjQZV1usOEJVcNkhTVpU
 yrGY9GvTa90DQHyIF7WEgrf04TlZpu3luZXAgW/lcC47mW41VybKx6Ov1ldS0Rr5ktXd
 D60g==
X-Gm-Message-State: AOAM531z+M6ohhIg+5Kdcmoni5y7ZcwoajUZb4VUZBJs1xTc/39h62Ur
 4nEq+RF8MaL0wxoLeeXY+8BHCA==
X-Google-Smtp-Source: ABdhPJxlCHXut/UTF6cvfBr11oDY2fP1c1F8TL2KZqd4UAG4WsAMr7TKffrX/ZL9pjxW4X0J2dLSnQ==
X-Received: by 2002:a17:902:8304:b0:155:d594:5c04 with SMTP id
 bd4-20020a170902830400b00155d5945c04mr19547553plb.105.1650920415023; 
 Mon, 25 Apr 2022 14:00:15 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a17090a784200b001cd4989ff42sm239246pjl.9.2022.04.25.14.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 14:00:14 -0700 (PDT)
Message-ID: <3b42db38-748b-379a-442e-11af78f9b044@linaro.org>
Date: Mon, 25 Apr 2022 14:00:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 07/42] Enforce VEX encoding restrictions
Content-Language: en-US
To: Paul Brook <paul@nowt.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220424220204.2493824-8-paul@nowt.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220424220204.2493824-8-paul@nowt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
> Add CHECK_AVX* macros, and use them to validate VEX encoded AVX instructions
> 
> All AVX instructions require both CPU and OS support, this is encapsulated
> by HF_AVX_EN.
> 
> Some also require specific values in the VEX.L and VEX.V fields.
> Some (mostly integer operations) also require AVX2
> 
> Signed-off-by: Paul Brook <paul@nowt.org>
> ---
>   target/i386/tcg/translate.c | 159 +++++++++++++++++++++++++++++++++---
>   1 file changed, 149 insertions(+), 10 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 66ba690b7d..2f5cc24e0c 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -3185,10 +3185,54 @@ static const struct SSEOpHelper_table7 sse_op_table7[256] = {
>           goto illegal_op; \
>       } while (0)
>   
> +/*
> + * VEX encodings require AVX
> + * Allow legacy SSE encodings even if AVX not enabled
> + */
> +#define CHECK_AVX(s) do { \
> +    if ((s->prefix & PREFIX_VEX) \
> +        && !(env->hflags & HF_AVX_EN_MASK)) \
> +        goto illegal_op; \
> +    } while (0)
> +
> +/* If a VEX prefix is used then it must have V=1111b */
> +#define CHECK_AVX_V0(s) do { \
> +    CHECK_AVX(s); \
> +    if ((s->prefix & PREFIX_VEX) && (s->vex_v != 0)) \
> +        goto illegal_op; \
> +    } while (0)
> +
> +/* If a VEX prefix is used then it must have L=0 */
> +#define CHECK_AVX_128(s) do { \
> +    CHECK_AVX(s); \
> +    if ((s->prefix & PREFIX_VEX) && (s->vex_l != 0)) \
> +        goto illegal_op; \
> +    } while (0)
> +
> +/* If a VEX prefix is used then it must have V=1111b and L=0 */
> +#define CHECK_AVX_V0_128(s) do { \
> +    CHECK_AVX(s); \
> +    if ((s->prefix & PREFIX_VEX) && (s->vex_v != 0 || s->vex_l != 0)) \
> +        goto illegal_op; \
> +    } while (0)

These predicates have some overlap, but awkwardly.  It leaves you with cases like

> +                if (op6.flags & SSE_OPF_V0) {
> +                    CHECK_AVX_V0(s);
> +                } else {
> +                    CHECK_AVX(s);
> +                }

this, where clearly the CHECK_AVX is common across the IF, and would be better written as

     CHECK_AVX(s);
     if (flags & SSE_OPF_V0) {
         CHECK_V0(s);
     }

> +            CHECK_AVX(s);
> +            scalar_op = (s->prefix & PREFIX_VEX)
> +                && (op7.flags & SSE_OPF_SCALAR)
> +                && !(op7.flags & SSE_OPF_CMP);
> +            if (is_xmm && (op7.flags & SSE_OPF_MMX)) {
> +                CHECK_AVX2_256(s);
> +            }
> +            if (op7.flags & SSE_OPF_AVX2) {
> +                CHECK_AVX2(s);
> +            }
> +            if ((op7.flags & SSE_OPF_V0) && !scalar_op) {
> +                CHECK_AVX_V0(s);
> +            }

And these.  Also, it would appear as if there's overlap between the AVX2 checks.  Is this 
clearer as

     CHECK_AVX(s);
     if (v0 && !scalar) {
        CHECK_V0(s);
     }
     if ((flags & AVX2) || ((flags & MMX) && s->vex_l)) {
         CHECK_AVX2(s);
     }

and perhaps these could be broken out into helpers, so that

>           if (is_xmm) {
> +            scalar_op = (s->prefix & PREFIX_VEX)
> +                && (sse_op.flags & SSE_OPF_SCALAR)
> +                && !(sse_op.flags & SSE_OPF_CMP)
> +                && (b1 == 2 || b1 == 3);
> +            /* VEX encoded scalar ops always have 3 operands! */
> +            if ((sse_op.flags & SSE_OPF_V0) && !scalar_op) {
> +                CHECK_AVX_V0(s);
> +            } else {
> +                CHECK_AVX(s);
> +            }
> +            if (sse_op.flags & SSE_OPF_MMX) {
> +                CHECK_AVX2_256(s);
> +            }

... you don't have to keep repeating stuff.  This is where a better decoder could really help.


r~

