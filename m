Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249592B9C6D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 22:04:10 +0100 (CET)
Received: from localhost ([::1]:59100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfr69-0006Up-7K
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 16:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfqxP-0000Fl-7O
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:55:07 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:45174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfqxL-0007p5-TY
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:55:06 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 62so5319373pgg.12
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 12:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u/1bb+QgzdiyJkCo1DYCQIDD/ANiLo5pK7Nvi7xAKgA=;
 b=Vn4jdny2bT7DJhpKC+lPk6IaKPjPEO59SjXJZSOLEGU8lmBSg6D/tqCPdOMnMjIA6N
 WdUuhpxpY+Dx76ZZE5/b1LFtCKTlm2G2gMUliewmpxCsjzS7hOXlfnLq9bPyZtejnDMl
 KBqeUxvY77ARH9susC8pFXo20ultBuCm2GIHYjIypciDkzUQToW2QGWH7govN9WUsTaq
 vcFR5e0NqDoriP4wQOZcotE0h28i+IF6fTpvGRjaKJxWBfdWxpuEM593u4QXsSTTggNO
 KxPeh83Ks1bcQlO5Bmo0hPiUnB+ZGm2ozUUBMl2DHWdJBAtvFqJ8dTyXTfSlog64kMuM
 p9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u/1bb+QgzdiyJkCo1DYCQIDD/ANiLo5pK7Nvi7xAKgA=;
 b=LKUMxJ5I7r7rS8DPPHtkcJaJJ5AK3u3gJyGOPnoia53pwHtUMoV8phMPHG3aY41FLr
 atQnUFh8WaAdwzgMyfb3nXAEKEVNONNHHRmw3tWBLXZVflZrgx7edORkyz1dyEhhN1FK
 1xvT2hcT7dND2xR95N1tnSspwiDNxXTkxk5OlsNot5EorYvxWPG1h/G1TA0/NPmvYjOd
 MNmyDm8RNK+HnH1wJctS+GCAfP4ZmPzmp0n5afNoTAOqlquWnvB+49asGE9ZpIMwwPhA
 uFGWxpW5IJO0yi3TA6c+b8CZqCqaZpTJKtINQM/O7QeZ2tEa0rrXJyrXsCAEQol8dJiQ
 Im4A==
X-Gm-Message-State: AOAM533KHZc/PomnoyERbQB1iMxY4WW55oa43AO5jyTMaGevBCVSic97
 CvQOW35XnXbtSAlYTEe66OMq5g==
X-Google-Smtp-Source: ABdhPJyYdRQL2mRrHFrlEFogZnEDtFrhiSCUrhZaiuKmrkVsb8I42ZLDiT4fAATKTcFEOOoBIFCSAg==
X-Received: by 2002:a63:e25:: with SMTP id d37mr14214089pgl.191.1605819302247; 
 Thu, 19 Nov 2020 12:55:02 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id gg19sm636440pjb.21.2020.11.19.12.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 12:55:01 -0800 (PST)
Subject: Re: [RFC 09/15] target/riscv: rvb: shift ones
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-10-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b1df8d1-cfe9-41f9-4fd2-0fc6569aba16@linaro.org>
Date: Thu, 19 Nov 2020 12:54:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-10-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +static bool trans_slo(DisasContext *ctx, arg_slo *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, &gen_slo);
> +}
> +
> +static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +
> +    if (a->shamt >= TARGET_LONG_BITS) {
> +        return false;
> +    }
> +
> +    return gen_arith_shamt_tl(ctx, a, &gen_slo);
> +}
> +
> +static bool trans_sro(DisasContext *ctx, arg_sro *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, &gen_sro);
> +}
> +
> +static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +
> +    if (a->shamt >= TARGET_LONG_BITS) {
> +        return false;
> +    }
> +
> +    return gen_arith_shamt_tl(ctx, a, &gen_sro);
> +}

Use the same gen_shift family of functions discussed vs patch 8.


r~

