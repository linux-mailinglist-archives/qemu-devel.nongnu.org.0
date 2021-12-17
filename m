Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3C84797AA
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 00:51:46 +0100 (CET)
Received: from localhost ([::1]:34380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myN0s-0003uL-0m
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 18:51:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myMzN-0002w5-3Y; Fri, 17 Dec 2021 18:50:13 -0500
Received: from [2a00:1450:4864:20::436] (port=35343
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myMzJ-0001dz-8P; Fri, 17 Dec 2021 18:50:12 -0500
Received: by mail-wr1-x436.google.com with SMTP id j18so6939752wrd.2;
 Fri, 17 Dec 2021 15:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Jl5m91Ie2/vr9J2gVOtOAyt4M08ds3qYYa0OkQfjGnA=;
 b=CYNERAIS6vAmAi/ejtzEj1y8zwbmE2C492851NSdLXWtuExKwP/ljoYyj9hXnf6OlF
 8gGmQ/XZQe8FEEWykMUvz7/Hh05smoeR8MUz3uMupDckWLfHZ2JI57jAeneaT8BXwbLP
 DqTJQ4FhAqWzJe/D2X6oMrp+m1I0KOwPLTJsVdmc0e3j/QJYFmivsdcEjMcLrcSdefnr
 JTfks1QMC+R4BnYpIRDUkBRL+NBbCcHxR1iP6FJE8XePQbdDRnFqAb3FfAeNQrhaQtny
 3w/X0/TR6LZnTgSIQ/fw/qpK+vRRYHa5TBme5QPuZbNG+CQy1/7iDaYvXdW/VekfrW7+
 ZRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Jl5m91Ie2/vr9J2gVOtOAyt4M08ds3qYYa0OkQfjGnA=;
 b=hs/PpSEUYWeK36ZYpc9h0VnxOpSaRTA5uK78b+HgLkxisTCadRGu8JT3A5bj1GW3YS
 kLWSc2I7V7pyeRW5JcHIso41duZMFPJCQZCDmpSj/NIcge6lHR7lqDZKEvjm/A09GRth
 4KOKzeXmqxYMBMitW5hHK0/XMYWfp9oNFzZAFNHEDx6ieZwQ6DOYJiopP0lo+85cO/zd
 hXteKMOPW/f5B1dwcVEmOz836QKOZ1SuT2jcCaxIdkIDg3UtIoNVE9/AAFzcKYbZLNym
 Jo3DBRmD44OXkQDaOqX12WdK4aSDt4qXhmKRci1OzJnuid1A/beJbnmkgAMWoL9mWulR
 TbxA==
X-Gm-Message-State: AOAM533wNusVMAR33szFPtNMN+XC67XgwaJKDEyPG9vd5c4hI1i4x8MJ
 EGjgvYD2ZKZs+q8qfOBmKe0=
X-Google-Smtp-Source: ABdhPJzJ/PJpIahy01devWISwdKLtKvg+LjFhVR6avzvVLOqPraC3XuplLi+qHEQEvRXcHyB59fGfA==
X-Received: by 2002:adf:c992:: with SMTP id f18mr4140144wrh.574.1639785007359; 
 Fri, 17 Dec 2021 15:50:07 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m21sm8507732wrb.2.2021.12.17.15.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 15:50:06 -0800 (PST)
Message-ID: <1a53c8f2-0f80-c6c2-9a73-0a9575ecc951@amsat.org>
Date: Sat, 18 Dec 2021 00:50:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/3] hw/input/pckbd: Rename i8042_setup_a20_line() and its
 a20 irq argument
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211105172127.224462-1-f4bug@amsat.org>
 <20211105172127.224462-4-f4bug@amsat.org>
 <CAFEAcA-xNhWGV46SY5K9uChAZWvU44YYgTgXu5wVjKtMq8XTug@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAFEAcA-xNhWGV46SY5K9uChAZWvU44YYgTgXu5wVjKtMq8XTug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 12:14, Peter Maydell wrote:
> On Fri, 5 Nov 2021 at 17:21, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> 'a20_out' is an input IRQ, rename it as 'a20_input'.
>> i8042_setup_a20_line() doesn't take a Device parameter
>> but an ISADevice one. Rename it as i8042_isa_*() to
>> make it explicit.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/hw/input/i8042.h | 2 +-
>>  hw/i386/pc.c             | 2 +-
>>  hw/input/pckbd.c         | 4 ++--
>>  3 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
>> index 1d90432daef..3534fcc4b43 100644
>> --- a/include/hw/input/i8042.h
>> +++ b/include/hw/input/i8042.h
>> @@ -21,6 +21,6 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
>>                     MemoryRegion *region, ram_addr_t size,
>>                     hwaddr mask);
>>  void i8042_isa_mouse_fake_event(ISAKBDState *isa);
>> -void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
>> +void i8042_isa_setup_a20_line(ISADevice *dev, qemu_irq a20_input);
>>
>>  #endif /* HW_INPUT_I8042_H */
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 2592a821486..06ef74ca22b 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -1043,7 +1043,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl, bool no_vmport)
>>      port92 = isa_create_simple(isa_bus, TYPE_PORT92);
>>
>>      a20_line = qemu_allocate_irqs(handle_a20_line_change, first_cpu, 2);
>> -    i8042_setup_a20_line(i8042, a20_line[0]);
>> +    i8042_isa_setup_a20_line(i8042, a20_line[0]);
> 
> I think these days we can directly call
>     qdev_connect_gpio_out_named(DEVICE(i8042), I8042_A20_LINE, 0, a20_line[0]);
> and drop the i8042_setup_a20_line() wrapper entirely,
> since the named GPIO lines are a "public" interface to the device.
> We only have this i8042_setup_a20_line() because the original
> implementation (added in commit 956a3e6bb738) predates gpio lines
> and did an assignment into the KBDState struct which needed to
> be private to pckbd.c.
> 
>>      qdev_connect_gpio_out_named(DEVICE(port92),
>>                                  PORT92_A20_LINE, 0, a20_line[1]);
> 
> That would then make it consistent with how we're wiring up the
> other A20 input source here.

Very good point, thank you.

> (Some day we should perhaps make the A20 input to the CPU an actual
> GPIO input on the CPU device object, so we could wire the I8042_A20_LINE
> and PORT92_A20_LINE to it via an OR gate, and drop the intermidate
> qemu_irq array and handle_a20_line_change function. But needing
> the OR gate makes that a little clunky so I'm not sure it's
> really worth the effort.)

I once worked on an "info irqtree" HMP command; if I finish it
then would be nice to display.

