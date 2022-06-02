Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD00453BBE7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 17:54:50 +0200 (CEST)
Received: from localhost ([::1]:37680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwn9t-0002kZ-B4
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 11:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwn4Q-0006GY-Ku
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:49:11 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwn4O-0005pq-Pv
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:49:10 -0400
Received: by mail-pf1-x42d.google.com with SMTP id e11so5077861pfj.5
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 08:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=60jZEeHoJJFarlFwej5Au2+WVBkuqZyZmYxYhvqIQfI=;
 b=uqqqNBuYb/rsp/1/DM87vTZCiq21UaRLRJ2Ixm4spnDDcWZ+QuVAnmEoZS+Smt0ASb
 HEupO/V5cbYbb1ula02oblzTC5vV8NjHnYJx0q8iP/QrXrAwr2/vmXx3Qm9eiMy8A6y0
 e28pI4SBmwxNgtRIJ4rq9g+Yq9OvV2R3pIt1h2BwR8RrgI1PaWPeySfLpu66kTGJ6XxC
 xix6PASWBFLosZ9Lic4XGyIHBveUeehzFn6ZcSrUPnawGCbqA4MHF/fq0nbvlsx1FOSG
 /oOA/uc7jdeOF+56XGieDuBomLe1WLZ5GnRtHrmT7uCveCniuGoToxagVjDX5Jt8+G7S
 uWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=60jZEeHoJJFarlFwej5Au2+WVBkuqZyZmYxYhvqIQfI=;
 b=I/KWQxkFwlRWaUvc1qNOiWXyHI00zX53B0+8L4fO7j2ga5ZAvdUCFNdhP5vqWSSe6M
 GX9BmZXCCCZv8HU2zxza9tmI6YXmfRrL+WqPCID00tVcHXpz0yjJelB2sirNBQIE6bNL
 c5Ftn/nhi3GvbNjUAYpGfCUUiyb0EFq9BkpFapP01w+y0srU+CebS7vkVfRVVvvCmdd+
 x673CIu2mkJ1GFEuKmyt1ZstEUKxm8hsiUVSJPdsutiVopsJDUb1s2YEZSIwW+rkZUsD
 J59sYHgcMEqCfMhKcCIm+Jt9q3bLZgKYpmg3OpEstxtaIXIvHRSmVNMrKnsJ8TyHnFR+
 pvgA==
X-Gm-Message-State: AOAM532yFM8PqVIWKCyi//DRywihgMPOcWKqrYYJaXJvg8h/DVqfgnfT
 ZwO5Pb/eIcq/C4pum287dBkaDQ==
X-Google-Smtp-Source: ABdhPJzk4VJfFEhkAdd8Li9ob81nWvjb3l2HRxX2Hem0F1PUio8YpXR7/nEOzYDROwsR4j9YEtgAtA==
X-Received: by 2002:a63:cc09:0:b0:3fb:aae7:4964 with SMTP id
 x9-20020a63cc09000000b003fbaae74964mr4752662pgf.118.1654184947210; 
 Thu, 02 Jun 2022 08:49:07 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569?
 ([2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3692094plb.111.2022.06.02.08.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 08:49:06 -0700 (PDT)
Message-ID: <8c34270f-9fdc-3e94-0984-29d9a5e5542f@linaro.org>
Date: Thu, 2 Jun 2022 08:49:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/3] hw/openrisc: Add the OpenRISC virtual machine
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Stafford Horne <shorne@gmail.com>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Openrisc <openrisc@lists.librecores.org>
References: <20220527172731.1742837-1-shorne@gmail.com>
 <20220527172731.1742837-4-shorne@gmail.com>
 <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 6/2/22 04:42, Joel Stanley wrote:
> Hi Stafford,
> 
> On Fri, 27 May 2022 at 17:27, Stafford Horne <shorne@gmail.com> wrote:
>>
>> This patch add the OpenRISC virtual machine 'virt' for OpenRISC.  This
>> platform allows for a convenient CI platform for toolchain, software
>> ports and the OpenRISC linux kernel port.
>>
>> Much of this has been sourced from the m68k and riscv virt platforms.
> 
> It's a good idea! I did some playing around with your patch today.
> 
> I'd suggest adding something to docs/system/target-openrsic.rst,
> including an example command lines.
> 
>>
>> The platform provides:
>>   - OpenRISC SMP with up to 8 cpus
> 
> You have this:
> 
> #define VIRT_CPUS_MAX 4
> 
> I tried booting with -smp 4 and it locked up when starting userspace
> (or I stopped getting serial output?):
> 
> [    0.060000] smp: Brought up 1 node, 4 CPUs
> ...
> [    0.960000] Run /init as init process
> 
> Running with -smp 2 and 3 worked. It does make booting much much slower.

target/openrisc/cpu.h is missing

#define TCG_GUEST_DEFAULT_MO      (0)


to tell the JIT about the weakly ordered guest memory model, and to enable MTTCG by default.

> I enabled the options:
> 
> CONFIG_RTC_CLASS=y
> # CONFIG_RTC_SYSTOHC is not set
> # CONFIG_RTC_NVMEM is not set
> CONFIG_RTC_DRV_GOLDFISH=y
> 
> But it didn't work. It seems the goldfish rtc model doesn't handle a
> big endian guest running on my little endian host.
> 
> Doing this fixes it:
> 
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_HOST_ENDIAN,
> 
> [    0.190000] goldfish_rtc 96005000.rtc: registered as rtc0
> [    0.190000] goldfish_rtc 96005000.rtc: setting system clock to
> 2022-06-02T11:16:04 UTC (1654168564)
> 
> But literally no other model in the tree does this, so I suspect it's
> not the right fix.

Correct.  The model might require

     .endianness = DEVICE_LITTLE_ENDIAN,

if that is the actual specification, or it may simply require fixes to handle a big-endian 
guest.

All that said, if we're going to make up a new virt platform, it should use PCI not 
virtio.  See the recent discussion about RISC-V virtual machines, where they made exactly 
this mistake several years ago.


r~

