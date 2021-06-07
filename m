Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743A239E16D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:04:08 +0200 (CEST)
Received: from localhost ([::1]:34986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHjS-0005Oa-JY
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqHeg-0000IM-4z
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:59:10 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:45601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqHee-0007dC-IB
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:59:09 -0400
Received: by mail-pf1-x434.google.com with SMTP id d16so13377815pfn.12
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 08:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WPvPX+PNLp4vUPw/DIfz/azPNEof6OiX6k/xwJ4fQs0=;
 b=hhgcqn2+ErYltMQToc34Mt6DKhLgMtbXhK/FudXw/gxgcTIpybd6yzFYUIC09UD90t
 tVutD8BQtnvW1WqQqaBKg6N7S+B+NfwWAb5JAvyhFK+84DxGJS2OwJiG7jNKJtm4NQEL
 eRXYOWqadc0suifYjOQmTpRMv0LZdTe6HEOmV1VYt06V8OjPGH159KqTPkLhoOamSWty
 HTSW32py2TFd2vhF5NIJ2Z8qOcEiWZdSR3jglWM+mT3ZhadM9tg33nm8izH+1sRzwiy0
 PFjv/TCa/Hna2OgMrQldyNTo7tVyj1MeCgXUOGx9SgjoM5pUEqFOnuyrUDBaPsO3Rtva
 ouZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WPvPX+PNLp4vUPw/DIfz/azPNEof6OiX6k/xwJ4fQs0=;
 b=iEGXPj14zXayeIJFKuZDejqJOcA4eH4TAeMBPWanPJ+nN6c6wMRkQG9AoAvuLHYDPv
 xMDO7DBOb0VrFPH0BOKLqOOd9r1dR+A/grr6b8YhGltOe+y3kCw4MKLXlsuz8CCvAzE/
 fARp3vfcaLWp1yxr0ftb7jVtEHE5q5/Cq10tlA3tsTNe9UGGhyt+BZ+0gJLHalhQIl4w
 fByT7hJsJs5iAK0+HnlRb3+2ZTwEyesryBsmeBZfCVNREPp7NTJw4GmEA57IrPamNElh
 VftGFeDWR1kM1OJMKtRRe57z3ArehrlVJwf9mXNn2ud50Us0W0qOd7R081RD36ncGeZ0
 N46w==
X-Gm-Message-State: AOAM533fcWvQtcrsZtAEYaR+Rs0LSiQ7LNcij6+KY7QaZmhTVvgvko9f
 Ycpzdrfv4YGcbPHXCU6bOfJXrw==
X-Google-Smtp-Source: ABdhPJwABFDVvp5gPCbvxpwi7gb6G1f5CyrJ+GaawR1t9YJu2ANw87SITJ2GWXtYLBfZ9sAiq9V8iQ==
X-Received: by 2002:a63:ad0f:: with SMTP id g15mr18201123pgf.415.1623081547240; 
 Mon, 07 Jun 2021 08:59:07 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 em15sm11521836pjb.43.2021.06.07.08.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 08:59:06 -0700 (PDT)
Subject: Re: TCG op for 32 bit only cpu on qemu-riscv64
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, Alistair Francis <alistair23@gmail.com>
References: <97935519-42c8-71c8-3d87-30aa4cafc909@c-sky.com>
 <CAKmqyKNHX0p5OxE1Y+1bwUeQ1uXu_DTwTnYgK3xxB9tu9Ax_nA@mail.gmail.com>
 <e82c9f94-4367-2ed6-7c7c-846e8a270876@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <86461776-b805-42a6-6c64-bca5f1be6dd1@linaro.org>
Date: Mon, 7 Jun 2021 08:59:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e82c9f94-4367-2ed6-7c7c-846e8a270876@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 2:22 AM, LIU Zhiwei wrote:
> 
> I am implementing RVP to get rid of TARGET_RISCV64. After we have recognized an 
> instruction only used by a 32-bit CPU,
> 
> 1) Should we only use the lowest 32bits of the 64bits register in RV64?
> 
> TCGv s;
> TCGv_i32 s32;
> s = tcg_new_temp();
> s32 = tcg_new_temp_i32();
> gen_get_gpr(src1, a->rs1);
> tcg_gen_trunc_tl_i32(s32, s);
> 
> Then we can use TCGv_i32 s32  to stand for rs1 register.

Changing from _tl to _i32 is wrong for most things, because you'll just have to 
convert back in order to store the result.

Most often you'll get the correct results by just using _tl as is.  One 
operation I can think of right away which probably requires extra attention is 
right-shift.  In which case just sign- or zero-extend the input first.


r~

