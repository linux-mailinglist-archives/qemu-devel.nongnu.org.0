Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446472DC493
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:49:04 +0100 (CET)
Received: from localhost ([::1]:54856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZz5-0007Yq-46
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZkx-0002wp-PP
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:34:29 -0500
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:46329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZkv-0000EE-8V
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:34:27 -0500
Received: by mail-qk1-x731.google.com with SMTP id d14so22398979qkc.13
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=axa3KNKj66hCMRwLAn/RXKZO96ePDgDPXKu+NIay28k=;
 b=GfhKFCaNhR73eMDrVibQWNG2VQdEM7lwlRqtzmZSBofn+py+R3GW1dQq9hsREPobH2
 kISeqSkDDhWlXFkI8t6B3H4AcuLXuD6+FkEfy7O+2BUBnHGQxKpcawqvaSiUyFztqyzx
 4rFI2lYjIWns0kDhE00KfElKXqy8/Xuwmb4oXOYM1cXRkdaRnCLU5zeftz59PLs/ZjHv
 ugR1RYqI7d3I05S9LthWtM5mnw+bmU8JQoq/ms1/k4E93UHqmS8N8YlKBns36nabV6cd
 PfSn79mQgLd003NfgTtXzWg8JB9+DdVOJI6kYrUpMPXtpSJNzKPjfWp3ebFzv57klUOc
 DVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=axa3KNKj66hCMRwLAn/RXKZO96ePDgDPXKu+NIay28k=;
 b=mcyiJBopkNbwjVF33qrt7uQVbvdomzp96gWp3mgwrb/qyp39zg83TFAEv/sG+2IvfV
 BOIOg1/gL37HziqGTmxnUXoKNmKVGowZzV4EzN4hGLmC/jgI8+WUtgZ3X3elRuTDGk14
 kzwzn3USQ1MN2JU/HLDdwb8m+ggRWBOJjEUPaViM+4OdGW/OCPhm8x8GUOQlV9F5TI4U
 ZS9SjRgw8pzFu0rMVL46CuP7+A0qxE/vheJ9jlVvYLCbmI4/VBA1lje0at3pLehgRA3Z
 mb2kPNGnDRJB33FTD1A+VEulE7gYMxE9i5rZCm2M6NBnzvD/zVvkVaDVeLlAnTCzA1xo
 9EtA==
X-Gm-Message-State: AOAM5318wUE+MtfTHREPbkAcKZ5uIrvj4q8rcnYeTAL3iOgyG4v053DP
 4t29aYw5OOyERkFcnjX+seLumw==
X-Google-Smtp-Source: ABdhPJxqueLlFk54TvP2x20CSpOK1VleXLC3qRxB81AeOkVa2OC4jPgSVuNnQl69imv6xkjLTl88DQ==
X-Received: by 2002:a37:9fc6:: with SMTP id i189mr22857674qke.41.1608136464021; 
 Wed, 16 Dec 2020 08:34:24 -0800 (PST)
Received: from [192.168.71.34] ([172.58.27.195])
 by smtp.gmail.com with ESMTPSA id d190sm1469942qkc.14.2020.12.16.08.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 08:34:23 -0800 (PST)
Subject: Re: [RFC v2 08/15] target/riscv: rvb: single-bit instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-9-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <600b1074-7dc0-f558-ca56-9d11e4b6a730@linaro.org>
Date: Wed, 16 Dec 2020 10:34:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-9-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> +static bool gen_shifti(DisasContext *ctx, arg_shift *a,
> +                        void(*func)(TCGv, TCGv, TCGv))
> +{
> +    TCGv source1 = tcg_temp_new();
> +    TCGv source2 = tcg_temp_new();
> +
> +    gen_get_gpr(source1, a->rs1);
> +    tcg_gen_movi_tl(source2, a->shamt);
> +
> +    tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);

Don't make the tcg optimizer do what it's easy to do in C, e.g.

  tcg_gen_movi_tl(source2, a->shamt & (TARGET_LONG_BITS - 1));

Except in this case, I believe that shamt *cannot* be out of range, because
that would be an illegal instruction.  E.g. in trans_srli, we check for that first.

In the previous review I had recommended that you convert the existing
immediate shift instructions to this new interface, which should have shown
this problem.

> +static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
> +                        void(*func)(TCGv, TCGv, TCGv))
> +{
> +    TCGv source1 = tcg_temp_new();
> +    TCGv source2 = tcg_temp_new();
> +
> +    gen_get_gpr(source1, a->rs1);
> +    tcg_gen_movi_tl(source2, a->shamt);
> +
> +    tcg_gen_andi_tl(source2, source2, 31);

This mask is unnecesary because the decode already uses @sh5.


r~

