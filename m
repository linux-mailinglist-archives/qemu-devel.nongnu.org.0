Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C3B30A385
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 09:48:24 +0100 (CET)
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Usg-0000jJ-Mc
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 03:48:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Uqj-0008J4-Ni; Mon, 01 Feb 2021 03:46:22 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Uqi-0002Rq-2G; Mon, 01 Feb 2021 03:46:21 -0500
Received: by mail-wm1-x331.google.com with SMTP id e15so12407852wme.0;
 Mon, 01 Feb 2021 00:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lS/QVjp1CubD3K6zHyzv1aPIEsuPRezwHkSW7Op92Yg=;
 b=HxtcqR9frcPCvPqrQjmJol2V9cLXFESUIDp6F7HugW8f48w1+S8RJXKDjdPH0QZNYM
 R9Z5gZ1yCOpbmxkwaAxpvjXjc/4kp3cQYPM9BGrR2nKfxLGVVcw1MHTZvQqKrNUcGVgn
 Yu9cGY96r35Peh4at1bGNihPb+YwA1+X7DWnNYhM/Gkm3Q5i3Id6Xuk27WrAPegayDE5
 PtF+RS6efyjsO2ox1ENonWOXkDjdJf68XecjaCtF8GynuqPB8TmDrQ5ZP0etikrmm68I
 c2KbW5T3btiRKaR8VmuaYH3VGRfNWIgad3C/uVIzQ4p9yohOrAvGbxqvx8YJq0ldPTXH
 xpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lS/QVjp1CubD3K6zHyzv1aPIEsuPRezwHkSW7Op92Yg=;
 b=hz9tygL0g8bB0JdTrcrxxYCoC+XeLw7rcHjZc801uv3tquNsemgOCAmg6uJLRN2yaG
 NHZ8t93XhRgzEUo1FOv6kvSysWrB2aXeYJia2eXAefTZMd9bLOmKiokfGPk1cPd3YsOJ
 mGL72LXRIeCJXCi5wkIaRVg3n2lW7elt2HKO5B4Sqm23IVQLkQVPGoqCk2RiiincsKpY
 PyEupycAkBtu+Q00jhS3jJin/oAKEgwezEYgrRRZGllwLqYaYCu2hvgCO2uiQP4a4P+u
 F6GBezE9gCawNRSV14vdI0ekmUbEdBI6Gwd0MeXhVUO6nepjwaZG3yll1yv9bkv9K13A
 w8qA==
X-Gm-Message-State: AOAM532M/TPvbQfF5FQ7hkl0j1CcsjN9VhqA+eivM81kaC/mdefqlmsI
 +N2YoRK5eipGEDqTjDE78VGutOkktx4=
X-Google-Smtp-Source: ABdhPJx2v7xuw7d/OxDWgqc/X0KMjxG0mL023OcDqGy7UHsckCKBrrNAm6GAmXONboi/KUvr7XpxTQ==
X-Received: by 2002:a1c:4006:: with SMTP id n6mr7862734wma.177.1612169177345; 
 Mon, 01 Feb 2021 00:46:17 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id q24sm710552wmq.24.2021.02.01.00.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 00:46:16 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to
 TCG
To: Luc Michel <luc@lmichel.fr>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210131151410.318649-1-f4bug@amsat.org>
 <20210131151410.318649-3-f4bug@amsat.org>
 <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <337e9fe1-3d84-83a7-20b1-d64aa5125e7c@amsat.org>
Date: Mon, 1 Feb 2021 09:46:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Igor (qom) / Eduardo (qdev) / Paolo (accel)

On 2/1/21 9:18 AM, Luc Michel wrote:
> Hi Philippe,
> 
> On 16:14 Sun 31 Jan     , Philippe Mathieu-Daudé wrote:
>> KVM requires the target cpu to be at least ARMv8 architecture
>> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
>> "target/arm: Remove KVM support for 32-bit Arm hosts").
> Wow, is there absolutely no way to do that then? What about using an
> ARMv8 and starting in AArch32 mode? Is that possible with KVM? I guess
> it might not be strictly identical as spawning the "real" CPU...

This is what Peter said here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg777669.html

  "KVM requires the target CPU to be at least ARMv8, because
  we only support the "host" cpu type, and all KVM host CPUs
  are v8, which means you can't pass a v7 CPU as the target CPU.
  (This used to not be true when we still supported running
  KVM on a v7 CPU like the Cortex-A15, in which case you could
  pass it to the guest.)"

> 
>>
>> From the various SoC used by the Raspberry Pi machines, only
>> the BCM2837 is an ARMv8 (Cortex-A53).
>>
>> Restrict the BCM2835 (ARM1176) and BCM2836 (Cortex-A7) to TCG.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/arm/bcm2836.c | 6 ++++++
>>  hw/arm/raspi.c   | 4 ++++
>>  2 files changed, 10 insertions(+)
>>
>> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
>> index fd16ed87c40..3051764f2dc 100644
>> --- a/hw/arm/bcm2836.c
>> +++ b/hw/arm/bcm2836.c
>> @@ -89,6 +89,7 @@ static bool bcm283x_common_realize(DeviceState *dev, Error **errp)
>>      return true;
>>  }
>>  
>> +#ifdef CONFIG_TCG
> I'm not sure it's enough. TCG and KVM can be enabled in the same
> binary. You'll have to perform a runtime check here I think.

If TCG is enabled, all SoC are built in (regardless of KVM enabled).
If only KVM is enabled, the TCG part is not built in (only ARMv8
based SoC left).

The problem is when QOM types are registered, we can not know
yet if the accelerator is enabled, because accelerators are also
QOM types and are realized later. So at this point runtime check
is not possible. See this post:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg777761.html

> 
>>  static void bcm2835_realize(DeviceState *dev, Error **errp)
>>  {
>>      BCM283XState *s = BCM283X(dev);
>> @@ -107,6 +108,7 @@ static void bcm2835_realize(DeviceState *dev, Error **errp)
>>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
>>              qdev_get_gpio_in(DEVICE(&s->cpu[0].core), ARM_CPU_FIQ));
>>  }
>> +#endif /* CONFIG_TCG */
...

