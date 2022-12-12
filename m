Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF90F6499DB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 09:03:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4dlw-000850-Bs; Mon, 12 Dec 2022 03:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4dlk-00084V-Bv
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:02:38 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4dlg-0001QN-1p
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:02:34 -0500
Received: by mail-wr1-x433.google.com with SMTP id h11so11160916wrw.13
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 00:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o0eDUCzna8L30mSsKxUa2tp1s0beiJEiNte3X6c721U=;
 b=z4TfPCgDFpQ8jVSjM39no22Sit1J/3Pwsfz5niku7AgFXUuRf5uSy3Pi9yGqI3i6Zf
 JqTNtlz1kbS1VSuVX2jQPxy+ElExGLb9ZrjqSoOavDa/FtIVb3u8hSgUiQ7kGyV5F0MY
 03Ku0pbbTAkwWwHodBtHPHkDmNFmJ5RN38GTuv2ybzHFKpmGnOzIqcR8oZzoFldh410R
 Rd1JbX1v+b38AtMtC8bT1UdVkGpjbBZ7cL5mJ1zzsE6pmqeQ0AraFNPRT57x3ThmlWCA
 6Wfjl+TA4ZcRUwQc4kc1kSLGOKKg+Ca6oLBh9eERkUPS7Q8LsE9+8nwFRbh8XrZGrrEH
 6uIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o0eDUCzna8L30mSsKxUa2tp1s0beiJEiNte3X6c721U=;
 b=aKCozuPo7m3wNZyFWhZcuUv8goDgJKkLtEIuPwy1msl0+putSvyGC9NEI2cASGFS4O
 Dm/IZKATia/tw/2zNrdtcoujiNGmK9hD/WLXQwzxYQIw0+oO2Xg28T7rBUuwmbC5PzW5
 qgH6UJ7pBMuIHdDH5dT0JHmY8PFyLrEjtbPM3ishz7s77bmrQRH/Urf+CH8WZsZbmB0m
 boCCjNqDrRHIHeutSu4yQAkBj9mLwYTZxFN0OArbozAnD24CCykDeF2g6GxEw75mP7Gc
 cP9s4WG+k35Y4Td6UwYI08xBd1bVnnUWdanDIy+53y507GG6fulb9fyBElWV0zDj7FIO
 UEjw==
X-Gm-Message-State: ANoB5pkYZXipgDiNuHPYO77mSx1fU+XghlaV3Moqh2BzWO5R65VG6pfn
 gtD4HfaGywErj4ut4xmCS2DRgQ==
X-Google-Smtp-Source: AA0mqf7gArTA32WquqrSVpt+NbJIKCsNtbLMXmCYfOdYjYVchPzDYeMO7xoMnDzPHgdTL7SbPhj4Fg==
X-Received: by 2002:a5d:60ce:0:b0:242:1926:782c with SMTP id
 x14-20020a5d60ce000000b002421926782cmr8635839wrt.43.1670832148116; 
 Mon, 12 Dec 2022 00:02:28 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o5-20020a5d58c5000000b00241da0e018dsm8074484wrf.29.2022.12.12.00.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 00:02:27 -0800 (PST)
Message-ID: <fac75412-b6b0-558d-891f-1a6262da617e@linaro.org>
Date: Mon, 12 Dec 2022 09:02:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 1/7] hw/mips/Kconfig: Introduce CONFIG_GT64120 to
 select gt64xxx_pci.c
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20221209151533.69516-1-philmd@linaro.org>
 <20221209151533.69516-2-philmd@linaro.org>
 <2C6A80F9-BAD4-43D6-8DFD-7D50E477CFFB@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2C6A80F9-BAD4-43D6-8DFD-7D50E477CFFB@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/12/22 01:13, Bernhard Beschow wrote:
> 
> 
> Am 9. Dezember 2022 15:15:27 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> hw/mips/Kconfig     | 6 ++++++
>> hw/mips/meson.build | 3 ++-
>> 2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
>> index 725525358d..d6bbbe7069 100644
>> --- a/hw/mips/Kconfig
>> +++ b/hw/mips/Kconfig
>> @@ -1,5 +1,6 @@
>> config MALTA
>>      bool
>> +    select GT64120
>>      select ISA_SUPERIO
>>
>> config MIPSSIM
>> @@ -59,3 +60,8 @@ config MIPS_BOSTON
>>
>> config FW_CFG_MIPS
>>      bool
>> +
>> +config GT64120
>> +    bool
>> +    select PCI
>> +    select I8259
> 
> s/select I8259/depends on I8259/ since the model needs but doesn't provide I8259? Then just take my mail regarding the last patch as a reminder.

I try to remember the 'depends on' directive as "depends on BUS".
If there is no BUS, then the option is pointless. Here "select PCI"
means 'provide/expose a PCI bus on the machine'.

I8259 must be available for GT64120 to be working. If you need a
GT64120, its 'select' directive will select the minimum options
required, so it will implicitly select a I8259.

See docs/devel/kconfig.rst:

**dependencies**: ``depends on <expr>``

   This defines a dependency for this configurable element. Dependencies
   evaluate an expression and force the value of the variable to false
   if the expression is false.

**reverse dependencies**: ``select <symbol> [if <expr>]``

   While ``depends on`` can force a symbol to false, reverse dependencies
   can be used to force another symbol to true.

**devices**

   Example::

     config MEGASAS_SCSI_PCI
       bool
       default y if PCI_DEVICES
       depends on PCI
       select SCSI

   Devices are the most complex of the five.  They can have a variety
   of directives that cooperate so that a default configuration includes
   all the devices that can be accessed from QEMU.

   Devices *depend on* the bus that they lie on, for example a PCI
   device would specify ``depends on PCI``.  An MMIO device will likely
   have no ``depends on`` directive.  Devices also *select* the buses
   that the device provides, for example a SCSI adapter would specify
   ``select SCSI``.  Finally, devices are usually ``default y`` if and
   only if they have at least one ``depends on``; the default could be
   conditional on a device group.

> Otherwise:
> Reviewed-by: Bernhard Beschow <shentey@gmail.com>

Thanks!

