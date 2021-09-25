Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021C4418129
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 13:04:42 +0200 (CEST)
Received: from localhost ([::1]:40040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU5U1-0006gr-Oe
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 07:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU5SN-0005fE-9R
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 07:02:59 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU5SL-0001Hp-NU
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 07:02:59 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t28so21861719wra.7
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 04:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MsMkl/ahela3MISSAiBUpoxuFARm1Q8uhlT86VC8dww=;
 b=g06PXKkEz0CMyYHP6Nns5TS56ehLNbpQa8rvmAl/ZH0rtg0UhGKZ5eWNiJzYgJiE81
 uZubk5f6F6+RSXROV+rKPfoWW5btdgI9Q2OeWgCoivFJ2iOUVFMUoSGuazoTF5C/YPg4
 D3SBrBywg64YznMLmRV9gFMRd9IYlIHH0d465OOLIaqDhDQT2fXQMboyfQXbjH1khgHk
 aumtlVtRnuw96wp2lNzQmjjClRuGH988EcYNgcNpPxihX+Cg4iTS/jGToLcWsZM0hQuK
 nusbPNKgiXRDOg5hqSbKnKxc4+U6aCM6dWGDTbhJbTq1vMBswAm0RAMUoJ74c2C7pdL0
 tqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MsMkl/ahela3MISSAiBUpoxuFARm1Q8uhlT86VC8dww=;
 b=zf78itpXLpuKak1l8WIbbKlcO8ej/ud1rKVxll4kmSxCfqVbqwd+JhZkELDEYBUNTM
 e2DWKMt5kKX4r+YoTsLeG78482D8Bi8mgUACGGwhrcRwRdhSVj5WL/x3QOgF2rgLV8z3
 IBT4sd+JMXxPyhX+R5RyjG4PY72D2v1vfghhmgtai7h1W6SvLezOz4KfBDUYbFlCPdt4
 F5Pl+JMC8Wf9sl4/BZkbrBviGYyaPNsywGDGo2KiQJM/jgHZp66/zTnIJDw5Pw8WzK0o
 6RQ+GvZtcY9leM6JT7RfGWjYaQIG0mEqTjT2XZY7Km8vGPHP/mfyxbIn7OdrnwBcHjQL
 YZRw==
X-Gm-Message-State: AOAM533nkQhIGNc9lzkjlf4yH1gFRTm3tFgFS4xf7i5QwGFJZMyBy/Iw
 yWOjvWPpeEoxU+pGfTa0CIDJ6JBE1tc=
X-Google-Smtp-Source: ABdhPJzr7cM/ynGhMX5qvN6Kp5W2AWHRvlvoEW/iC8z6Peai/t75qyJXugHMBppOp/APnNTbIteuFA==
X-Received: by 2002:adf:cc82:: with SMTP id p2mr16810194wrj.5.1632567776317;
 Sat, 25 Sep 2021 04:02:56 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d129sm15987454wmd.23.2021.09.25.04.02.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 04:02:55 -0700 (PDT)
Message-ID: <e4a8adf5-5b9f-0617-3b66-98d532187a1b@amsat.org>
Date: Sat, 25 Sep 2021 13:02:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/1] hw: aspeed_gpio: Fix GPIO array indexing
Content-Language: en-US
To: pdel@fb.com
References: <20210924061953.1996620-1-pdel@fb.com>
 <20210924061953.1996620-2-pdel@fb.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924061953.1996620-2-pdel@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, patrick@stwcx.xyz, rashmica.g@gmail.com,
 clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 9/24/21 08:19, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> The gpio array is declared as a dense array:
> 
> ...
> qemu_irq gpios[ASPEED_GPIO_NR_PINS];
> 
> (AST2500 has 228, AST2400 has 216, AST2600 has 208)
> 
> However, this array is used like a matrix of GPIO sets
> (e.g. gpio[NR_SETS][NR_PINS_PER_SET] = gpio[8][32])
> 
> size_t offset = set * GPIOS_PER_SET + gpio;
> qemu_set_irq(s->gpios[offset], !!(new & mask));
> 
> This can result in an out-of-bounds access to "s->gpios" because the
> gpio sets do _not_ have the same length. Some of the groups (e.g.
> GPIOAB) only have 4 pins. 228 != 8 * 32 == 256.
> 
> To fix this, I converted the gpio array from dense to sparse, to that
> match both the hardware layout and this existing indexing code.

This is one logical change: 1 patch

> Also, I noticed that some of the property specifications looked wrong:
> the lower 8 bits in the input and output u32's correspond to the first
> group label, and the upper 8 bits correspond to the last group label.

Another logical change: another patch :)

So please split this patch in 2. Maybe easier to fix GPIOSetProperties
first, then convert from dense to sparse array.

Regards,

Phil.

> I looked at the datasheet and several of these declarations seemed
> incorrect to me (I was basing it off of the I/O column). If somebody
> can double-check this, I'd really appreciate it!
> 
> Some were definitely wrong though, like "Y" and "Z" in the 2600.
> 
> @@ -796,7 +776,7 @@ static const GPIOSetProperties ast2500_set_props[] = {
>       [3] = {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
>       [4] = {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
>       [5] = {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
> -    [6] = {0xffffff0f,  0x0fffff0f,  {"Y", "Z", "AA", "AB"} },
> +    [6] = {0x0fffffff,  0x0fffffff,  {"Y", "Z", "AA", "AB"} },
>       [7] = {0x000000ff,  0x000000ff,  {"AC"} },
>   };
> 
> @@ -805,9 +785,9 @@ static GPIOSetProperties ast2600_3_3v_set_props[] = {
>       [1] = {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
>       [2] = {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
>       [3] = {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
> -    [4] = {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
> -    [5] = {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
> -    [6] = {0xffff0000,  0x0fff0000,  {"Y", "Z", "", ""} },
> +    [4] = {0xffffffff,  0x00ffffff,  {"Q", "R", "S", "T"} },
> +    [5] = {0xffffffff,  0xffffff00,  {"U", "V", "W", "X"} },
> +    [6] = {0x0000ffff,  0x0000ffff,  {"Y", "Z", "", ""} },
>   };
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>   hw/gpio/aspeed_gpio.c         | 80 +++++++++++++++--------------------
>   include/hw/gpio/aspeed_gpio.h |  5 +--
>   2 files changed, 35 insertions(+), 50 deletions(-)

