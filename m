Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EC3256AD9
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Aug 2020 02:02:48 +0200 (CEST)
Received: from localhost ([::1]:49522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCAo3-0001Rv-Vc
	for lists+qemu-devel@lfdr.de; Sat, 29 Aug 2020 20:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCAnN-00011K-Je
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 20:02:05 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCAnL-00051C-Vy
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 20:02:05 -0400
Received: by mail-pf1-x42d.google.com with SMTP id b124so876238pfg.13
 for <qemu-devel@nongnu.org>; Sat, 29 Aug 2020 17:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Bib1B6ZmxNW7NV9q12CbyCBZUXDFIOQUhYcRPj2KycI=;
 b=YOt1fAQffwp1baOdqNk4hI9pxADAUPPV2d3q9V7emgncfzt7mJR/RlJjY9DjxFuull
 cr3yGgCHdOkTFMhqHOAgT68JzuOGEJiGnHxOZNVel/RPKFt86QMQsyy/FumTRdgw93Ok
 VqAJnMipep91sDtbyu94YuWJfeJ0xNl7wVUN8ZoKUdaAw9IcnHtf8IVsxOI0pHHAmOmT
 e2yQrYg86tYMcIHu4xfllXfnAWn45DPUjbB4y3TfWev6si9Ge4okJjfTyaIsT54bjecY
 KlxWBIAZhmzcz/Ss/y83iQWpXu9U3PcBH75grdrqXae9ijovlERSfo8/Jyh3vZwYQA5v
 jhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bib1B6ZmxNW7NV9q12CbyCBZUXDFIOQUhYcRPj2KycI=;
 b=pwY9MvyiZXFIesMWUeafehYzBw0dhSix/6BGgy32bjIhoWTlvyHGem1NwqlGWMcEZo
 nSpn2UR9apHjRnu9OBu0yrQiSDofKx6gvAx3nA8d/4+lp+KS1Sf5Djn+uvkbMAwenbig
 YDCWzZyD1x5yPiWCZ83PLb2rqKlh0JIBKjpUeffuQExd1Df2YZLNPrttSpXgm6BQwmwF
 KtPsu3TZQeM0bVhVhrSBERiVbnPoCurdxlCr0Cwf26U1q+gdz5vJnDiZhm2g64f+K3Lh
 xHFMwBKgmslA3LT0MmGbWV17Fy5kBkC6/cMasqZEE72G+e4bed8mngnbxE9k0DPEAFrT
 n1sA==
X-Gm-Message-State: AOAM531yXJBno7bE9NWiNZVqcafeznWJnXkRYuVf4gnpPDYSuoVbeTpR
 35UfmuZrNXqA2zYwntHR/pG6mw==
X-Google-Smtp-Source: ABdhPJyBqK6G1bvWC+H103o6DH9/Wvp6cuMDDpE5hMZelHK5Geh5zQwtEboNFEpm5FVUXYJoeg+ubw==
X-Received: by 2002:a63:d157:: with SMTP id c23mr3806342pgj.281.1598745722486; 
 Sat, 29 Aug 2020 17:02:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f18sm3301527pgv.84.2020.08.29.17.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 17:02:01 -0700 (PDT)
Subject: Re: [RFC v4 62/70] target/riscv: introduce floating-point rounding
 mode enum
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-63-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2a676248-4ab0-a350-3aff-005dab6a11d9@linaro.org>
Date: Sat, 29 Aug 2020 17:02:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-63-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/fpu_helper.c               | 12 ++++++------
>  target/riscv/insn_trans/trans_rvv.inc.c | 18 +++++++++---------
>  target/riscv/internals.h                |  9 +++++++++
>  3 files changed, 24 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


