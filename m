Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873D82B9C52
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 21:56:55 +0100 (CET)
Received: from localhost ([::1]:46162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfqz8-0000mI-Gs
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 15:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfqeb-0004If-SR
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:35:43 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:36415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfqeV-0000vZ-Km
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:35:41 -0500
Received: by mail-pg1-x52c.google.com with SMTP id t21so5297326pgl.3
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 12:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1UYH8mu1LR2mU8y2n/YaLWn7NQvfGgUQvZDpozl1ZA0=;
 b=LOydDr5lkbGO5lp8TJuzQ4MF7kbs93uAy87XjRAwdpHbvJFQBum5VG1d7t8SLAJDK4
 3KsneXd8yuVHNoVNPRNL0KkD7AuTUOWWcmr9/4I4t5uw4KiGIoSQc3Acfkcob9jUtj8c
 Pi8aywNpSOy1x0OYQM4eBVGBkAAZGuGaejngh2SEm41HdzZPGlpyvZNF9OER5ZTE03SJ
 yq5sM1jSv7oxl4ohMJTk/Wj3tRQ61mpgP6fbCfO9RPFqn66sugzAy10QT8HbPZ004T5g
 xn3cjquqikbwFEQF+cNHohwKeSvnSrwpLhy3BUn3DTTuBAZCVvCTS9M+l5IAlHpGGvOe
 Y3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1UYH8mu1LR2mU8y2n/YaLWn7NQvfGgUQvZDpozl1ZA0=;
 b=WUU1maShFUINMfK9b8DdED4Ui9J40Rfok3aQjIY5fJZVwWKisnbauGnrlTuZxJ6oXZ
 TNKLwNPvxO+N/IkggKqLs4o3UaEbID3K1DUx/vvJuYUiOhXrsiOz0K7Gzx1/AumepL2x
 2Dq2cnmRsE4Tx309hNKNfGmW3Rt3cohtZTxQuCCnnpE+jOyT5wWY3prvlj30jR5V1/4r
 EDRijbmzg3FxIB7VtZNqEns3I4xgk3FZdpGfoUPWCZg8fmaZJm1YWIFWDnA6+Fnsbx/E
 e4z9KoUjOaOzFyjQSUVpLlTykLr+ug6o0346CXxB7fdUTlACe/jlWnO/9D40DOHRke7p
 kg1w==
X-Gm-Message-State: AOAM530B1HwMUis9pyudfvdXp5W1eXQnoo5jd7mr4ZqmHZzCkvp8XORw
 Wpvh3GUM2DI828isWn1ZVea0Lg==
X-Google-Smtp-Source: ABdhPJwhY4WtRGy+LmMrr9/B36ItEAR5WKezdMy3muAJgG0MsZI5bqLLo/iYLQ6mESbO3TfFFWAUxQ==
X-Received: by 2002:a17:90a:ce8c:: with SMTP id
 g12mr6349481pju.181.1605818134018; 
 Thu, 19 Nov 2020 12:35:34 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id h5sm770590pfk.126.2020.11.19.12.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 12:35:33 -0800 (PST)
Subject: Re: [RFC 08/15] target/riscv: rvb: single-bit instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-9-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <299ed3c1-fcb1-aa34-a595-5f86b8466d18@linaro.org>
Date: Thu, 19 Nov 2020 12:35:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-9-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
> +static bool trans_sbset(DisasContext *ctx, arg_sbset *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, &gen_sbset);
> +}
> +
> +static bool trans_sbseti(DisasContext *ctx, arg_sbseti *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith_shamt_tl(ctx, a, &gen_sbset);
> +}
> +
> +static bool trans_sbclr(DisasContext *ctx, arg_sbclr *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, &gen_sbclr);
> +}

Coming back to my re-use of code thing, these should use gen_shift.  That
handles the truncate of source2 to the shift amount.

> +static bool trans_sbclri(DisasContext *ctx, arg_sbclri *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith_shamt_tl(ctx, a, &gen_sbclr);
> +}
> +
> +static bool trans_sbinv(DisasContext *ctx, arg_sbinv *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, &gen_sbinv);
> +}
> +
> +static bool trans_sbinvi(DisasContext *ctx, arg_sbinvi *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith_shamt_tl(ctx, a, &gen_sbinv);
> +}

I think there ought to be a gen_shifti for these.

Similarly gen_shiftiw and gen_shiftw, which would truncate and sign-extend the
result.  Existing code in trans_rvi.c.inc should be converted to use the new
functions.


r~

