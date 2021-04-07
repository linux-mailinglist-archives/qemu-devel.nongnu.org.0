Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E063578A3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 01:45:51 +0200 (CEST)
Received: from localhost ([::1]:38760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUHrq-00086T-Qr
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 19:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUHq5-0007ZK-Vb
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 19:44:02 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUHq4-00036Z-8i
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 19:44:01 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so2152083pjh.1
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 16:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9XQC+A6oqoZrIx8iiiFjBbPpyOIWQZGhH2JcX5VRnyU=;
 b=gb6NtwB8b2IJZQrgOT/FcLOjbm/KQ9BzvI2waNZBzervUsHazjqgCQBrr9WmKyVbW/
 K6YXO3+JrvTrHnz3yCGJ3zCNaoCLF/KN4Vwrqfrn6698h/W8e2DhW75A5RFhR4FDhdTZ
 SAKpLwagjNJjhrq/SXCN01FkMWZL6QUBa6A6EDAssSAfFN74EegHJWK8BtTugY9qdUr4
 +oo9vEwaRsAS+r8FzyK8Szz8YepHa5t6tWE0qUjVJTX9Gn+eXZ43uBpHUHadF5av3sNe
 H5Ik1ZvELbqYvosW+f+dfsJb4VsADu84C4S2XAoh3kkCKkwVwev+BQ72e20pNYoSw6Fx
 YfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9XQC+A6oqoZrIx8iiiFjBbPpyOIWQZGhH2JcX5VRnyU=;
 b=abomlP4d/6rQ2i1BB0hiEvupqZpOISMnhW5uEIEiZTacnsLkSC4o3dJUo74i0EFUHc
 PUS7cxelt+J6OvvxKC7UcRartkfDZvEMNoTV6haK8QRAmS4+KklpnKoV1X1PVOThvlb/
 GZnTiN6knFIPtepYsOln+VoxcQgE1HGOi0YkrEG7a8URv5bXkIb8NGGs6G0oiix7rd7P
 myC++xf5TYzeMj8Hx6VR/9bAsevN770+l0gRumWjuxoyC8UvpoVgMZ8WseHCmRvaKED5
 8ZGx+FqtkQI0XXm9b+xjm17EeTyJnt/umCQSiGCYKc2VrTz1O7FDzZShRZYii/R8Hr2/
 up1w==
X-Gm-Message-State: AOAM532JXtHLEXa7hAnhMcfgdBfWPZIDOdnUL3B9FZbmmuF8IpM1t6UM
 meNQ3+PgyrxchlVOddw/fqXVpg==
X-Google-Smtp-Source: ABdhPJwQUhZ4ABGLdoLtp+zgpW8UvZ7b1XU76++nu1Wq3Pdht8Rk15hT+ZZiKcsUsycBd/cS6lUn9w==
X-Received: by 2002:a17:90b:608:: with SMTP id
 gb8mr5526975pjb.121.1617839038742; 
 Wed, 07 Apr 2021 16:43:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r1sm6354859pjo.26.2021.04.07.16.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 16:43:58 -0700 (PDT)
Subject: Re: [PATCH 21/27] arcv3: TCG instruction generator changes
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-22-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <97eb498e-b696-8d3b-3473-9d7bd86701f6@linaro.org>
Date: Wed, 7 Apr 2021 16:43:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-22-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> +        if(ctx->insn.limm & 0x80000000)
> +          ctx->insn.limm += 0xffffffff00000000;

(1) bad braces, but
(2) use an unconditional cast to int32_t.

Qemu forces the compiler to use standard 2's compliment arithmetic. We don't 
have to go out of our way to work around the ISO-C lunacy of "undefined values" 
that for no good reason still allows sign-magnitude and 1's compliment arithmetic.

> +    if (ctx->insn.cc) {
> +        TCGv cc = tcg_temp_local_new();
> +        arc_gen_verifyCCFlag(ctx, cc);
> +        tcg_gen_brcondi_tl(TCG_COND_NE, cc, 1, done);
> +        tcg_temp_free(cc);
> +    }
> +

Lots of non-uses of gen_cc_prologue/epilogue.


r~

