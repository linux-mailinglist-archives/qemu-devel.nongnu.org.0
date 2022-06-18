Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32E9550223
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 04:48:27 +0200 (CEST)
Received: from localhost ([::1]:45366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2OVe-0007IG-Fn
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 22:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2OUU-0006cC-9M
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 22:47:14 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2OUS-0000K9-L6
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 22:47:13 -0400
Received: by mail-pf1-x42c.google.com with SMTP id x138so5591591pfc.12
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 19:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KEUN6K1FadFakVspXjQGNRJ7GKVbYq8/7XnuUgKXMHY=;
 b=VlxtUzba8L16dO3sxosA+R9sfHrJxtUYPXbw9fTU1QRh9+3xSKRpBSSeAjbQnU3RwI
 ueeZ/BHZ8ajejrfRmpG0UXhHofxTdbjoQsE4Vw+Dzl4yEzPpyj0iAN7lE7LvaCvoGpeI
 q65mt8NuLYVnCi3NOlnAqPdJRP/s0miCLuORoPdeRCGdTYhkdOgfW3RcVJWkZXV5R5Yq
 XPqu9dD+U/yH0uNToTwMbc0nTtzviQiNjx/rcj7oFURymgBHcJM692RRe5m7sCTYbAAI
 C69gtEqqvIMjNFe12mlzImUwwHMHoHPY6DBMcOyJq4pvIV1X/CairqQU/zvzDTrBs46M
 v9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KEUN6K1FadFakVspXjQGNRJ7GKVbYq8/7XnuUgKXMHY=;
 b=eSlnk3q6tHQmIhaLzBGIzeywRT95VZNM88Nl0Kahz/LI/7fmg79X+G3G4q6z2LExt3
 Wow4B/0Fq2HKWzHx2DufAI2NhCt2Zws3khf7mKIloCw/0kf94wY8spNmTjRp9rsO0uHn
 joHwVDQnmsBDWJ/Ke+kZ36kjwQJgH73IaIz236iO4CrRLOtdOF8HXy5isADTxBGe0yBI
 JUKDgqccEIDx4M12MX7XeEISX1oLssGAuPSqnro9Ml36GwTP9mDi8kxk842Q6QUGFV8P
 lLf7qt/l9edxwJAvvVRRSFJr+mdKrl72wxjsGBdx0w5O1MzxCPpxBp+XY4UxQgfDBBMD
 HDew==
X-Gm-Message-State: AJIora9wUN09OWbqYAuuq/wd2PMCEjNB1MHtnJI/sndlz2eaf7uDJDcE
 54W9pSX1W82zAMt+9kJIBKz+/g==
X-Google-Smtp-Source: AGRyM1s2WcDE7Vo75q7OG6NFtag9xbdkwvMMNYuhN1C5mv+p1Nvg6nImG8fd8etrkFCeV0uPEWaByw==
X-Received: by 2002:a63:7448:0:b0:40c:7d4b:e7c6 with SMTP id
 e8-20020a637448000000b0040c7d4be7c6mr318915pgn.140.1655520430624; 
 Fri, 17 Jun 2022 19:47:10 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:da58:e2:88d1:d15b?
 ([2602:47:d49e:3c01:da58:e2:88d1:d15b])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a637d58000000b00408fd8655ebsm4492707pgn.17.2022.06.17.19.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 19:47:10 -0700 (PDT)
Message-ID: <45338aa6-8f53-68bc-fb51-3b4896ed380e@linaro.org>
Date: Fri, 17 Jun 2022 19:47:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v17 02/13] linux-user: Add LoongArch signal support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220616121611.3316074-1-gaosong@loongson.cn>
 <20220616121611.3316074-3-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220616121611.3316074-3-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

On 6/16/22 05:16, Song Gao wrote:
> +static void copy_fpu_to_sigcontext(CPULoongArchState *env,
> +                                   struct extctx_layout *extctx)
> +{
> +    int i;
> +    struct target_sctx_info *info = (struct target_sctx_info *)extctx->fpu.addr;
> +    struct target_fpu_context *fpu_ctx = get_ctx(info);
> +
> +    for (i = 1; i < 32; ++i) {
> +        __put_user(env->fpr[i], &fpu_ctx->regs[i]);
> +    }
> +
> +    fpu_ctx->fcc = read_all_fcc(env);
> +    __put_user(env->fcsr0, &fpu_ctx->fcsr);
> +    __put_user(extctx->fpu.size, &info->size);
> +}

You've failed to set magic.

> +
> +static abi_ulong extframe_alloc(struct extctx_layout *extctx,
> +                                struct ctx_layout *layout,
> +                                size_t size, abi_ulong base)
> +{
> +    abi_ulong new_base = base - size;
> +
> +    new_base -= sizeof(struct target_sctx_info);

Missing ROUND_DOWN.

> +    layout->addr = new_base;
> +    layout->size = (unsigned int)(base - new_base);

Cast not required.

> +static int parse_extcontext(struct target_sigcontext *sc,
> +                             struct extctx_layout *extctx)
> +{
> +    unsigned int size;
> +    struct target_sctx_info *info = (struct target_sctx_info *)
> +                                    &sc->sc_extcontext;
> +
> +    __get_user(size, &info->size);
> +
> +    if (size < (sizeof(struct target_sctx_info) +
> +                sizeof(struct target_fpu_context))) {
> +        return -TARGET_EINVAL;
> +    }
> +
> +    extctx->fpu.addr = (abi_ulong)info;
> +    info = (struct target_sctx_info *)((char *)info + size);
> +
> +    return 0;
> +}

This does not even closely resemble the kernel's parse_extcontext.
You *really* have to be more careful about this.


r~

