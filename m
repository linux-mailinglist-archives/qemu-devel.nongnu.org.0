Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213374EA198
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:36:08 +0200 (CEST)
Received: from localhost ([::1]:42920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYw5v-0006ca-6K
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:36:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYw3H-0004Yh-MT
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:33:23 -0400
Received: from [2607:f8b0:4864:20::22e] (port=39720
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYw3G-0005qG-32
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:33:23 -0400
Received: by mail-oi1-x22e.google.com with SMTP id j83so16921298oih.6
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JIvXPoNh1q5FaW1B11KC02yHNiqG/qQI3SWJpX3peMA=;
 b=BjVVv4QmNkHTzFhhbYeVgeaxhGRRZDvYIzOjzawqWVswUjSEZBMMibWUVNpp95mg1O
 kfw4wtfAHTz5e9XdTtBOj5haL+G1tn94N6AKXatX5ZyUpChTkUHuaMj4Sh/JRhcK7drl
 j2YxEhThQhVVZJRCctKXFVZsahM+4FT2uaJymWQ8E9IPe9KFfGaCBlt9qiylkGvmx8ao
 1CsMJM/LUEw4ZbmQPBq+MdX0g05ksIOYryh3wLoI5z3GxhtMDA/UQUlHrsXExqRXW7+e
 JC+I2WZFa95SZ0gj84hccnRx3j76lYjQmcPA3N16lPytGWfmIzhkCPNilWShA2pI4UWt
 nf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JIvXPoNh1q5FaW1B11KC02yHNiqG/qQI3SWJpX3peMA=;
 b=wX+FfjwQGQVX1hXqwW4FjA8Db1SC3L4MHYvNGLQTMTmzW3mF13JHGVRKgLB88K36qv
 0IMPmTC0OgGT/QaTL5hvuKV63bsxNcppedRxhbgWR5KF/jIi5RLDHAFpTm5IG3CcRknJ
 6ySQdGHT/SeBp8w6VYfs5fnAaeSdQUl+ZHIXqSwuw0f0EbcDPqwjgJWVrapxn3/aMK1O
 gDsnIpm3B3sdWRQ+PEOiaAfOaUmNVkVQBO7D+b5ujPTB8LfFKcjZRvD3rV0THRXq3ep4
 iJebdXdhfs+s+plhJAPh4qSt+qKJE6urdWiOV0B6QYHYTmJxB4dI/WfcPAfFdk0eN3mx
 /Dpg==
X-Gm-Message-State: AOAM530LStFCYJF8lUrNKFlunTTS0tc+0y4qR/gHs1wHNzirWyT2I4or
 7P9Vp0w61YM5GsFC1m+F7wM9bA==
X-Google-Smtp-Source: ABdhPJxMi7zxymE5NbmH8JhEptMw/v/wPJ6WlZc3YJYJkv+QGFcltd2eteu389HiHMJsTK2hlwiE6g==
X-Received: by 2002:aca:db03:0:b0:2da:363b:658b with SMTP id
 s3-20020acadb03000000b002da363b658bmr495449oig.173.1648499600806; 
 Mon, 28 Mar 2022 13:33:20 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 p66-20020aca4245000000b002ee110f182fsm7733458oia.37.2022.03.28.13.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 13:33:19 -0700 (PDT)
Message-ID: <1404dd20-43c3-c1bd-db72-0a6a10f4cd43@linaro.org>
Date: Mon, 28 Mar 2022 14:33:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 12/29] target/loongarch: Add timer related
 instructions support.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-13-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-13-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
> +#ifndef CONFIG_USER_ONLY
> +static bool gen_rdtime(DisasContext *ctx, arg_rr *a,
> +                       bool word, bool high)
> +{
> +    TCGv dst1 = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv dst2 = gpr_dst(ctx, a->rj, EXT_NONE);
> +
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_rdtime_d(dst1, cpu_env);
> +    if (word) {
> +        tcg_gen_sextract_tl(dst1, dst1, high ? 32 : 0, 32);
> +    }
> +    tcg_gen_ld_i64(dst2, cpu_env, offsetof(CPULoongArchState, CSR_TID));
> +
> +    return true;
> +}

Remove all of the ifdefs.

>   static bool trans_rdtimel_w(DisasContext *ctx, arg_rdtimel_w *a)
>   {
> +#ifdef CONFIG_USER_ONLY
>       tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
>       return true;

This (and all of the others) turns out to be a bug, as it fails to write to rj at all.

> +uint64_t helper_rdtime_d(CPULoongArchState *env)
> +{
> +     LoongArchCPU *cpu = LOONGARCH_CPU(env_cpu(env));
> +     return cpu_loongarch_get_constant_timer_counter(cpu);
> +}

Here, you could have

#ifdef CONFIG_USER_ONLY
     return cpu_get_host_ticks();
#else
     ...

which is the fallback we use for other targets in user-mode.

You seem to be missing the checks on CSR.MISC.DRDTL* which would raise IPE.


r~

