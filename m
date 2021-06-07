Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC8E39E143
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 17:54:47 +0200 (CEST)
Received: from localhost ([::1]:53360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHaQ-0006s1-Ij
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 11:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqHYe-0005ne-3Q
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:52:56 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqHYa-0004Wb-1a
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:52:55 -0400
Received: by mail-pf1-x42a.google.com with SMTP id h12so10563779pfe.2
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 08:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HX7EkHWd4jhzS1gryvnd8gRjVs0HdFGXgvhk2FJ0/Fc=;
 b=S4flfldOVPVnBcw2ZJmNNH+BbL9isZiOHOl5kVnSGLbEZAAatx0lkz3Iw7Juy5rbfY
 9Yta2rCtxZa83Rm4VbN9e7CdqqiGid56HeIhiZzOBw5vK2GiNt9m9oZrCxEeSgWD7tUv
 NAXeuCQUcs5EMuLXpVCgy5yibY3Xnc79KViG+JufFcHHS8nVi35ZJGEnWALs2Mnp2hs+
 zZT+4b0hcAMxTMIGrQu/T0uroX8i5Pm3MmNpsTKLPu3WCGcYJpu7w5RZAqcqpcevzQUW
 pvcuBI49ymZpi34Af6NERdt2ws4MxsE9Jpq5G/KSKLLtHYPVgg+TYxlo9r7djFCxUmZ9
 5gWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HX7EkHWd4jhzS1gryvnd8gRjVs0HdFGXgvhk2FJ0/Fc=;
 b=f+YiD5iIbi2qvlh8rdWqpF5cAU14y3/cUQeSM1bysqqFUy4km9D40Do+H7AHW1hZCj
 Z1Pb4R76Cq2a0+LDm9sg4WPRodTIUzgEyDyV3B9TLk1xjuOWbe3XTiLYHL2627f67Z0z
 o7C53GHx7Y8hxRh6rj3MxC+vpN8BkUtWNd9QtmRrITRQGTQZOZOT2ta+RP112zpyQhDz
 riCcfariqlluD3A2gczEmlqjq3m1FE1ufpYnxdYO6MM4BRlJZrHqfRLMGXCZbv80AfDI
 bS8Zx8KJ22xNvby3JalC2bpvIpeOF4NyueWVNyJ7kCVnoHK1n9Hf6M87Ejy48Ygo0c5i
 jPYQ==
X-Gm-Message-State: AOAM533dA4BDkaiTHyDBN83KYoZfUUcC2FeRlh70vsa7Fol3QHbyfpbT
 P7Q1XZBKU3V0GHdOvsIXN1Gs3g==
X-Google-Smtp-Source: ABdhPJwe/4MHAEUjOItlZeMlgL9hL4fudgZ+kC6fenvsxaEwgkJ1IHRUpvb1HjVh5mCucCWpm4FqHg==
X-Received: by 2002:a63:4002:: with SMTP id n2mr15972514pga.124.1623081168341; 
 Mon, 07 Jun 2021 08:52:48 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 o186sm8156531pfb.59.2021.06.07.08.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 08:52:48 -0700 (PDT)
Subject: Re: TCG op for 32 bit only cpu on qemu-riscv64
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, QEMU Developers
 <qemu-devel@nongnu.org>, "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <97935519-42c8-71c8-3d87-30aa4cafc909@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <618e9348-c420-b560-1f67-3608023985a7@linaro.org>
Date: Mon, 7 Jun 2021 08:52:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <97935519-42c8-71c8-3d87-30aa4cafc909@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/6/21 8:07 PM, LIU Zhiwei wrote:
> Hi Alistair,
> 
> As I see,  we are moving  on to remove TARGET_RISCV64 macro.
> 
> I have some questions:
> 
> 1) Which tcg op should use when translate an instruction for 32bit cpu. The 
> tcg_*_i64, tcg_*_i32 or tcg_*_tl?

You use *_tl, because that's the size of the field in CPURISCVState.

> 2) Do we should have a sign-extend 64 bit register(bit 31 as the sign bit)  for 
> 32 bit cpu?

If the value must be sign-extended for RV64, then leave it sign-extended for 
RV32.  There's no point in adding extra code to distinguish between them.

If the instruction does not exist for RV64, then you can probably leave the 
high bits unspecified (sign, zero, or pure garbage).


r~


