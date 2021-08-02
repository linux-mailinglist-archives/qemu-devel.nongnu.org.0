Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9003DE04F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:52:35 +0200 (CEST)
Received: from localhost ([::1]:53808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdzG-0006BR-H0
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAdyI-0004UI-S0
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:51:35 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAdyG-0000EM-Mz
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:51:34 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 b1-20020a17090a8001b029017700de3903so804897pjn.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 12:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QDSLKt+fC8Kdvm+lZE9Qvt0mTmAtGrxMpfPygi2+/2A=;
 b=QGeP9uD1zxxYURVG/WVgRD+swCSAUnH03//sKOZnoH22R5hvGTZKfBbMilI/0N4aNR
 qzyou3ag/5v0cgZ94hI3nKbsbjYN0gWowB/TyGVxudZ5Wd05XFAIAxR1cr2KJU7WHYTX
 HASyTGpj/7DF1cDSHTfI0Hb1qiYgQU2ZLiZ7F/lbwPxr+Ds0Ei8JDLFBDqesLkGzO+9b
 iz63Fz0YboWKnivQfTeSfAhsfGUGrW+zv69ZLmhixczqCZK/UqEOp68ZMScmIkVKj2mT
 feZKJ1l9so3XFn6A01jpWOufMkOuCZqOVqwpG/p9IOIY8CVXPPw3KstFlYVAhHyEMmI3
 xmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QDSLKt+fC8Kdvm+lZE9Qvt0mTmAtGrxMpfPygi2+/2A=;
 b=tL6U/tj7hhkCtEWLLuXclZXxJaL9x0UYf7slcIdHy9MWofMNcjsZ8C5gr8NOLON6NU
 1yQJbCNKoYfsAl98R0IhTs3ghXzS3H6Cgtjvh+TVGOZULkYizc+s1JXS+KiRHpLwKYYW
 wgitoLRiSQHjgQqojbk/BFJQ6q3Ik8bw5RujAD14q9za6Mw+dgy3NTjWJjnz0IEx1qER
 8gf5GpJumzgAL9nz2FhTwzhyll2cl4pDvMJi/l5/VOcerYdA4R5xYv7WGpvTs42x5Mbw
 Xq7ABj5cAAnuwpxrlH+ien1G1tIuW/bGkMD0h/qQIFTIgC8GgsGNk0RKnPcVrbv263rP
 9Viw==
X-Gm-Message-State: AOAM530wyoHC0nV+7/0o/3//ui28pGQyOk09b3hQSPxo7k3hMrq4DrJQ
 dd+tmubiyporUVU0vMnxN1KTeA==
X-Google-Smtp-Source: ABdhPJz/FfegC/MuHo+60ZVgq3sAM14R9oHV3HOgee2rnh87r9JdTuDv6xuV2FTz8KjwfGWHMx7CbQ==
X-Received: by 2002:a17:902:cec2:b029:12c:bef0:ec4b with SMTP id
 d2-20020a170902cec2b029012cbef0ec4bmr3406997plg.74.1627933891365; 
 Mon, 02 Aug 2021 12:51:31 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id x24sm204757pjk.43.2021.08.02.12.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 12:51:31 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 4/5] target/mips: Convert Vr54xx MUL* opcodes to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210801235926.3178085-1-f4bug@amsat.org>
 <20210801235926.3178085-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e5f00144-1a45-d904-20ff-4c11b134b32a@linaro.org>
Date: Mon, 2 Aug 2021 09:51:28 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801235926.3178085-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/1/21 1:59 PM, Philippe Mathieu-Daudé wrote:
> Convert the following Integer Multiply-Accumulate opcodes:
> 
>   * MULHI        Multiply and move HI
>   * MULHIU       Unsigned multiply and move HI
>   * MULS         Multiply, negate, and move LO
>   * MULSHI       Multiply, negate, and move HI
>   * MULSHIU      Unsigned multiply, negate, and move HI
>   * MULSU        Unsigned multiply, negate, and move LO
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/vr54xx.decode      |  6 ++++++
>   target/mips/tcg/translate.c        | 24 ------------------------
>   target/mips/tcg/vr54xx_translate.c | 12 ++++++++++++
>   3 files changed, 18 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

