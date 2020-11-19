Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96ED2B9BA5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 20:47:23 +0100 (CET)
Received: from localhost ([::1]:36748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfptq-0004Jl-NW
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 14:47:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpsl-0003rK-IU
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 14:46:16 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpsd-00076X-49
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 14:46:15 -0500
Received: by mail-pf1-x431.google.com with SMTP id v12so5467304pfm.13
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 11:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JGFqCjoNZIGGBp44bV86L+YFJFw/urwxjR1lOxlLSzk=;
 b=XMDxO8tZCKJ6Asx1+TQ/HQL31brHLMEJcvTDtAaauCfNK7V6srJTyp1ztHetX8soHh
 SVtM1MkDPWwN/rHuiV7LQ9cYXzgZSzY/ALsStskW+qdrJsfAmYACScXEDe46VWxB7L6T
 FIymteN8StDKR5d14u9/4P6KB64JvyKOw71XF9Y7CHIag4RogyhcT2ImGFlMShPJMV1Z
 TC6ACBJD4k+pJr0rh2l1gyVP9hPTM1K+g54B3guOouheL5gJnq9nt3OrGB41rVZCD3fy
 9T2JrjScChJdsL1R/s1IK/lDgyCbbEZLRfSd/H7hN4r/cTyGH5a7AdTZ2blcD+WkTIFS
 M59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JGFqCjoNZIGGBp44bV86L+YFJFw/urwxjR1lOxlLSzk=;
 b=FwgpSGmCA8fS1lRP0ycLSc9IVAWw290ikePnTJfkVFyiZrCdtP90BZmVsO7Qac21AW
 aAprJQE8uV2NHs7wxGFwLWywGfXlpfjFcZfYPD4XpeIE0zzrAe/dckdFtrsg0IHaZuAi
 JiWmVP0vb4rWTwl9FbHLc17cc8Ls/0WYdGyeXi8TNyBzD9CV2e4AxcOI/ew1ZsMq+QFL
 C4t9VSDQ9P/TM7NILQE1A11h0PVdMqf7q4MzYy2bC6801aUuJ47V6fzTgTOpfKHu7yhz
 F9mtPq1ovajK00Lyj4RTMpkJHgn14D1jerEaqAxLml4QrAssAqA6g8kvb8NwPik7eb//
 F9MA==
X-Gm-Message-State: AOAM530DKYd0tAPoJX6xfTasioBPQ8wem5S9apD4+l7iuJpigY/0kL6O
 DwzgtJeNHLyFP8gePgwTIzCJJw==
X-Google-Smtp-Source: ABdhPJweZKijUNrZJVQRctCTZmwI3Nfvzeruz+4qQH0cUgQ6Bmtf48Hwz+IEviDEkPC5PgCiCwTEQQ==
X-Received: by 2002:a17:90b:70e:: with SMTP id
 s14mr5982354pjz.111.1605815165130; 
 Thu, 19 Nov 2020 11:46:05 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e1sm669921pfi.158.2020.11.19.11.46.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 11:46:04 -0800 (PST)
Subject: Re: [RFC 06/15] target/riscv: rvb: min/max instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-7-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d2336a5-dd8c-6836-87f5-af945d15b759@linaro.org>
Date: Thu, 19 Nov 2020 11:46:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-7-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> ---
>  target/riscv/insn32.decode              |  4 ++++
>  target/riscv/insn_trans/trans_rvb.c.inc | 24 ++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

