Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78DE6504DE
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 22:50:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p71XW-0006pd-1e; Sun, 18 Dec 2022 16:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71XU-0006pO-A1
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:49:44 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71XS-00008s-LB
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:49:44 -0500
Received: by mail-ej1-x629.google.com with SMTP id gh17so17551190ejb.6
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 13:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ixToARz9Bdmkel0uqJ/oywTScDhPmGbhUZR1mP+VXs=;
 b=deCb7cdojG8h+XvnoD549+sKGVEp1tlnFf7HM1FR06yzSOoVp/xnoddIulCWfH8Nvm
 Ikvg8B0GiV1YLUm9XuGsGpz3+wOeF4C8UdVGcM+jXAgGRimbGQmrhcsIbMx3ct1eezQ4
 /vGtonWV8bQL5yaoQElhHVJOoURSH2kCyYnzSAgFechJmqIl9Ud2XQ21Mh91mI/rFQSd
 4XCTZDCF13wDr/3O+Je38AoS+qFuHcDyGM/2c6thEB6pMKIjYj6vc2eakkrEtLnfOCB9
 bFCWN5TIqYVGp6LLskqwlK7Dlk7xJjlA8xE75Lfxq+iLRwbTORAp76fCXNuEC3pxKKg1
 JINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ixToARz9Bdmkel0uqJ/oywTScDhPmGbhUZR1mP+VXs=;
 b=YRe8XNwDTOJf/GhnljL6/rnYHyIaOCoa8M/OAEpvhcDWPWRBmu+3qEguGPcYI2HNB/
 N28ayZ7vEwVHyPgiF59/M8Exq9UvsVrtJ3xzuw1SqGth05y9ubw/bbuScwux5gIBwBAq
 PmKl1y9TirED3ZUIgLf7E0VSvcysufyPu1hT8BJgkmjgp4vLPXeUfRCyw3yE3hlH7M6j
 ovHHi+tSvKa0wYabNT9kycaLXLJdtT2l1T+VwvZQwzqFsxHmL6u+WA8HKPuP9APtULkP
 XDlhiU4X+akOOWs10fboURSqPyvpyBNWOtSPtNxlpDq3XlM75R0CbHy91hLgwCcvtJYQ
 zfTQ==
X-Gm-Message-State: ANoB5pl9k1+G1qHWZuef7FTqGcgTVXqMRp38jsZWBoDNJwTnYFk0vx+G
 XF2GgjWMJ2mCPE0WD9J4fZ42Lt0dMbFC0Zg9Fw4=
X-Google-Smtp-Source: AA0mqf7FnkeQAC/fshlTFgVT9zjlizzfRm+V8UDq1e1nfCx1rVp4XCfs16ysYW02H2RRY5CCH/QfLA==
X-Received: by 2002:a17:906:7116:b0:7c1:8450:f963 with SMTP id
 x22-20020a170906711600b007c18450f963mr27064870ejj.34.1671400180620; 
 Sun, 18 Dec 2022 13:49:40 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a170906c40100b007c0cbdfba04sm3549745ejz.70.2022.12.18.13.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 13:49:40 -0800 (PST)
Message-ID: <aea9ed5d-93d7-6684-1e47-9aaf4860641b@linaro.org>
Date: Sun, 18 Dec 2022 22:49:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v4 20b/27] tcg: Vary the allocation size for TCGOp
Content-Language: en-US
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <20221213212541.1820840-21-richard.henderson@linaro.org>
 <20221218211832.73312-1-philmd@linaro.org>
 <20221218211832.73312-3-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218211832.73312-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/12/22 22:18, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> We have been allocating a worst case number of arguments
> to support calls.  Instead, allow the size to vary.
> By default leave space for 4 args, to maximize reuse,
> but allow calls to increase the number of args to 32.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> [PMD: Split patch in two]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/tcg/plugin-gen.c     | 10 ++++-----
>   include/exec/helper-head.h |  2 --
>   include/tcg/tcg.h          | 46 +++++++++++++-------------------------
>   tcg/tcg.c                  | 35 +++++++++++++++++++++--------
>   4 files changed, 47 insertions(+), 46 deletions(-)


> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 3f172cb1d6..ccbe947222 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -1513,7 +1513,12 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
>           }
>       }
>   
> -    max_args = ARRAY_SIZE(op->args);
> +    /*
> +     * A Call op needs up to 4 + 2N parameters on 32-bit archs,
> +     * and up to 4 + N parameters on 64-bit archs
> +     * (N = number of input arguments + output arguments).
> +     */
> +    max_args = (64 / TCG_TARGET_REG_BITS) * nargs + 4;
>       op = tcg_emit_op(INDEX_op_call, max_args);
>   
>       pi = 0;
> @@ -2298,19 +2303,31 @@ void tcg_remove_ops_after(TCGOp *op)
>   static TCGOp *tcg_op_alloc(TCGOpcode opc, unsigned nargs)
>   {
>       TCGContext *s = tcg_ctx;
> -    TCGOp *op;
> +    TCGOp *op = NULL;
>   
> -    assert(nargs < ARRAY_SIZE(op->args));
> -    if (likely(QTAILQ_EMPTY(&s->free_ops))) {
> -        op = tcg_malloc(sizeof(TCGOp));
> -    } else {
> -        op = QTAILQ_FIRST(&s->free_ops);
> -        QTAILQ_REMOVE(&s->free_ops, op, link);
> +    if (unlikely(!QTAILQ_EMPTY(&s->free_ops))) {
> +        QTAILQ_FOREACH(op, &s->free_ops, link) {
> +            if (nargs <= op->nargs) {
> +                QTAILQ_REMOVE(&s->free_ops, op, link);
> +                nargs = op->nargs;
> +                goto found;
> +            }
> +        }
>       }
> +
> +    /* Most opcodes have 3 or 4 operands: reduce fragmentation. */
> +    nargs = MAX(4, nargs);
> +    op = tcg_malloc(sizeof(TCGOp) + sizeof(TCGArg) * nargs);
> +
> + found:
>       memset(op, 0, offsetof(TCGOp, link));
>       op->opc = opc;
> -    s->nb_ops++;
> +    op->nargs = nargs;

We can move this assignation before the 'found' label.

>   
> +    /* Check for bitfield overflow. */
> +    tcg_debug_assert(op->nargs == nargs);
> +
> +    s->nb_ops++;
>       return op;
>   }
>   

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


