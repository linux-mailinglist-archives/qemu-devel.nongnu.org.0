Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81F03A7599
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 06:08:54 +0200 (CEST)
Received: from localhost ([::1]:45926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt0Nh-0003RZ-Ku
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 00:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lt0Mw-0002lu-Lh
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:08:06 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lt0Mv-000664-1x
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:08:06 -0400
Received: by mail-pl1-x62b.google.com with SMTP id h1so7771361plt.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 21:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=R9N+7EzUuarv3sT4H47eFfTqDqiONWkGOqgZ9igHwj8=;
 b=hpcP+D59EhoEY3B3IX0IYBTE2ue4+ynfwQKk2xUuzTtvvPEtaKlS5fFJGwIzRyQ+IC
 PHEose5rYdKgKIrULppjngAP49R0iYDTj5b97tEbWcPi9f9Y4FpClAjIfskJJeV66/ns
 o+TxOg1VELlwM6R/Kj1+LOtE9dz2mmfp6rSHby7yoA3aeZqb8oy6H+XLi8EqZwwomNS3
 fhzsJB21TrejIry1iRLyyCh7rLn7ipzFi+VVSl4mBr5orvWW5HF8DjAkYyfTy9zlQRsX
 OnLpSYxoz9gP6ubAzBbLGUjrhuC8iset6avMnDOxHf7UwfdJWVexIWjbm8gw6PNzGood
 xjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R9N+7EzUuarv3sT4H47eFfTqDqiONWkGOqgZ9igHwj8=;
 b=BaWv53L0lp3AjIHoEbMSr2LIORoMBHeDU03gkS44H9U17+SHRCtnl1XggAA15zvM5F
 Q57uX+SHGFXVOf5WAALYnqvRqS7JTCSnnghLZ1M06fRYVZC3LqESD8oWEpC2YYxO8b1V
 AIZ5xsSQ8HnyZVwxhfK7zjUrKFExdEx6vIdg04ggslYjf9jSAT6ZCIDyVs8tqyuk2lmc
 RWMMwTP1NWQZTSO8nD+MN680ZhUfPE0LWBfO9/8qezXZxzB7ON78J4sFB+9t5CJ94nGY
 txMJzn7m/jKmSp//zIcClwdjqiXI5JhXp6gnkbyD42VjfAzEGEndA7EDhJAVE8sFb4u2
 6TuA==
X-Gm-Message-State: AOAM532XdwB9orLhmtoT4dj90gYYGYrGDX/MpHsS3xACl+ZSmFHdQj+S
 9i4KP/qVJ3oGjkBcl/XvxUD4aiQqdOUXHA==
X-Google-Smtp-Source: ABdhPJzIoPXf6Pe/smI2YvWmNdUqjTTzkOhgh8oy1SkicWbwUXz4KB/EqtP1hyfIap4Ak+pa8O9hJA==
X-Received: by 2002:a17:90a:24a:: with SMTP id
 t10mr23108007pje.178.1623730083434; 
 Mon, 14 Jun 2021 21:08:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y34sm13616565pfa.181.2021.06.14.21.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 21:08:03 -0700 (PDT)
Subject: Re: [PATCH 4/4] alpha: Provide console information to the PALcode at
 start-up.
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210613211549.18094-1-thorpej@me.com>
 <20210613211549.18094-5-thorpej@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e27a687-f605-3f5a-ef0a-c96b693f3c93@linaro.org>
Date: Mon, 14 Jun 2021 21:08:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210613211549.18094-5-thorpej@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/13/21 2:15 PM, Jason Thorpe wrote:
> Redefine the a2 register passed by Qemu at start-up to also include
> some configuration flags, in addition to the CPU count, and define
> a flag to mirror the "-nographics" option.
> 
> Signed-off-by: Jason Thorpe <thorpej@me.com>
> ---
>   hw/alpha/dp264.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
> index ac97104464..d86dcb1d81 100644
> --- a/hw/alpha/dp264.c
> +++ b/hw/alpha/dp264.c
> @@ -72,9 +72,20 @@ static void clipper_init(MachineState *machine)
>           cpus[i] = ALPHA_CPU(cpu_create(machine->cpu_type));
>       }
>   
> +    /* arg0 -> memory size
> +       arg1 -> kernel entry point
> +       arg2 -> config word
> +
> +       Config word: bits 0-5 -> ncpus
> +                    bit  6   -> nographics option (for HWRPB CTB)
> +
> +       See init_hwrpb() in the PALcode.  */
> +
>       cpus[0]->env.trap_arg0 = ram_size;
>       cpus[0]->env.trap_arg1 = 0;
>       cpus[0]->env.trap_arg2 = smp_cpus;
> +    if (!machine->enable_graphics)
> +      cpus[0]->env.trap_arg2 |= (1 << 6);

Thanks, I have fixed up the style problems and queued.


r~

