Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0F54EA146
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:17:15 +0200 (CEST)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYvnf-00045b-2o
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:17:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYvjN-0000SS-Ta
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:12:49 -0400
Received: from [2001:4860:4864:20::2b] (port=36188
 helo=mail-oa1-x2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYvjM-0002tR-8m
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:12:49 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-df014ca245so4189569fac.3
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 13:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=l2Xbe6KOCwsE3bI+EpOPhduYqOdwPJyoC0pkudKToUw=;
 b=oXqMx0wU8liZUY6ITofxGV1VO9Jyng1sKx+m8CmGu2xlQtWHrE32VyADmzXn9LBdL3
 Ljpj3Usz4ANG575gNe936lL553EDA+wRE2mnqs/hnH4e4HS2u1PKW1tdjMl5Up/YhQSL
 rXakZn17hsCXgZKTrirzVUDmAeQnjBjnEnWFn6IdrLjatgjvON+OfzR0DSqRGYA705M1
 1v0TryFZQr3oCMjWJNtMJ8DBzjtoZvmEOmDUJNGwd6ij8WIceXoTdM6Zr2wSPcR2oSmB
 toCOBXHxyaINzkxfiMEulOWf1kz20z8e1FdOEKZTYpAaI6ggOzOQulkE+XKCwI9l3iO+
 olRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l2Xbe6KOCwsE3bI+EpOPhduYqOdwPJyoC0pkudKToUw=;
 b=EU6Xy2fkC/alRn0dFx9DmCV6zg8elO+RseU8l/lrxgRuPxcKz+5KrYZjrjwSq5w4wa
 9+iU2Ptu7ytX1oaRSEsBrkRPN8mSV7nPPTGI1Mh2qWWSygbdL59m4gL9lWp6reSlE19e
 32zZnUyOVNeH/XgcpVRtXdw8hiJMh4I+pXUXYCrPkTbSHLE5AowAKSe8u5MSoUEz+i/f
 DaEv72ZWmWM9Q6MizTRcM9Wuxzmqn+uZR+EWwdsjGAHNV9sPQ9ZdaV3GnwrljBD6NjFL
 vrzpcZUV1eBZZo/5zKnEv+xFcupBweOHOxX80x/HqGtn1nGfrx+zhfqVhaLiwFwr2cYC
 RxnA==
X-Gm-Message-State: AOAM532ukGYFut8znr8A0jNDcoFvUt04Bn5QI0G3XyqHy1AfWXFE6bKk
 fOXWwy3nYim0S/RKUBh1eQ0zuQ==
X-Google-Smtp-Source: ABdhPJwX5KbZP+m1EzX910qql3DBj4Un9YTUhfHSffGCuzi5lKyGkOGQqtj6NgwJFDuBc3s6Ugh8+A==
X-Received: by 2002:a05:6870:558d:b0:cf:9c39:de3c with SMTP id
 n13-20020a056870558d00b000cf9c39de3cmr461844oao.68.1648498366695; 
 Mon, 28 Mar 2022 13:12:46 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 j25-20020a4ad199000000b003171dfeb5bfsm7203055oor.15.2022.03.28.13.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 13:12:44 -0700 (PDT)
Message-ID: <e9cc6dd0-25a1-2031-aa95-3fa621dd8d8c@linaro.org>
Date: Mon, 28 Mar 2022 14:12:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 09/29] target/loongarch: Add TLB instruction support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-10-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-10-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2b
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> +static void output_empty(DisasContext *ctx, arg_empty *a,
> +                         const char *mnemonic)
> +{
> +}

No, you must still do

     output(ctx, mnemonic, "");

> +static bool trans_tlbwr(DisasContext *ctx, arg_tlbwr *a)
> +{
> +    if (check_plv(ctx)) {
> +        return false;
> +    }
> +    gen_helper_tlbwr(cpu_env);
> +
> +    if (ctx->mem_idx != MMU_DA_IDX) {
> +        tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
> +        ctx->base.is_jmp = DISAS_EXIT;
> +    }

You may want to create a helper function for this condition.

> +static bool trans_tlbclr(DisasContext *ctx, arg_tlbclr *a)
> +{
> +    if (check_plv(ctx)) {
> +        return false;
> +    }
> +    gen_helper_tlbclr(cpu_env);
> +    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
> +    ctx->base.is_jmp = DISAS_EXIT;

Missing it here...

> +static bool trans_tlbflush(DisasContext *ctx, arg_tlbflush *a)
> +{
> +    if (check_plv(ctx)) {
> +        return false;
> +    }
> +    gen_helper_tlbflush(cpu_env);
> +    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
> +    ctx->base.is_jmp = DISAS_EXIT;
> +    return true;
> +}

... and here.


r~

