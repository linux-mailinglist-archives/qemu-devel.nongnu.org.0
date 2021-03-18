Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7364F340905
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:38:33 +0100 (CET)
Received: from localhost ([::1]:46218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMujI-0003Xm-J5
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMuhn-0002nt-FV
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:37:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMuhc-0003Bx-Tq
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616081804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lPpkf/QllmImiMZbN3UUSkBDO/IUnWHkRu1WMIo6chY=;
 b=R/AArLecGiNba/iZMztwng+v0mley3a5Nmn1qOUcyUeTLGr5xb66DaL0rWZC91a2xjJ3ym
 oZgZHvBwVn/BwIVRDMBFpfevXvKvXs1ANHPQEKh3Xne1mBO8TiN0MEK9RcyDgOqwvpi53z
 cbI8yOaigWKFUv6PoAZiwu5/5zw5alY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-X8hi3lLiPXOMHoyVDmMmYQ-1; Thu, 18 Mar 2021 11:36:42 -0400
X-MC-Unique: X8hi3lLiPXOMHoyVDmMmYQ-1
Received: by mail-wr1-f70.google.com with SMTP id m23so15264178wrh.7
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 08:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lPpkf/QllmImiMZbN3UUSkBDO/IUnWHkRu1WMIo6chY=;
 b=ay1VEj0TjsUoW1kiPsy/7UThiTWaW493tPzYnCdGZIdq7zkpuOoM5tvE7VxzwCz42c
 x9WYetvOF+F4KQU7YSclKOszPjBtpgD55adWbW9ItlKYb/k+IbBGYhAq0nAW9HTWR4Eh
 83Drk/MoufutUxvCYsIRmI8AtJ+qF8mMIM3T/FA1fFD/bw2CgBAFirlqMQoOspN4TZAQ
 oEELjvgMqAG0R0Dtv8wn9enHBXJVhKpBM4z8pH/UAzJKNHx4zBqolAgcsdBBlzNLyD6R
 hsiCJB4IzgAQK8QGZ/3es539qSM1R5WGlYDHD6DBxkVxApR0eLYcTDMew57QniFdLGLL
 40MA==
X-Gm-Message-State: AOAM531tmCEuW/wlUcczOjGSiuaxEEcyDVDVygPS4K6nbNyHSg6YyGR9
 SkGzGYvTXkJp+Yw5nCtAOQt/ODAaxwU8KexQVbzVtQ53muZf7/zo5zdug9Kc4Ff27/BqGsnc9C1
 pjgIA5mj/nZrU034=
X-Received: by 2002:a7b:c119:: with SMTP id w25mr4123044wmi.127.1616081801015; 
 Thu, 18 Mar 2021 08:36:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkVx4DqMS8GVUQUmbKhhO8ZBu0FjIukieyIxWdLklqceYLhezR9OS1iZ84TZervIRVoghQqQ==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr4123019wmi.127.1616081800736; 
 Thu, 18 Mar 2021 08:36:40 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o7sm3372052wrs.16.2021.03.18.08.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 08:36:40 -0700 (PDT)
Subject: Re: [PULL 5/5] m68k: add Virtual M68k Machine
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210315204226.3481044-1-laurent@vivier.eu>
 <20210315204226.3481044-6-laurent@vivier.eu>
 <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
 <905c797a-25c3-bb43-5946-54b28d9530c0@vivier.eu>
 <d515dabd-b84d-5aa3-0bf5-d824bdc7da6e@redhat.com>
 <ffa12ba8-4988-b464-2267-5d14c59b43ab@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b06c176d-c4ab-6c27-c96f-0bf27f7fd036@redhat.com>
Date: Thu, 18 Mar 2021 16:36:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ffa12ba8-4988-b464-2267-5d14c59b43ab@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 11:06 AM, Laurent Vivier wrote:
> Le 18/03/2021 à 11:02, Philippe Mathieu-Daudé a écrit :
>> On 3/18/21 10:52 AM, Laurent Vivier wrote:
>>> Le 18/03/2021 à 10:19, Philippe Mathieu-Daudé a écrit :
>>>> Hi Laurent,
>>>>
>>>> +Paolo / Thomas
>>>>
>>>> On 3/15/21 9:42 PM, Laurent Vivier wrote:
>>>>> The machine is based on Goldfish interfaces defined by Google
>>>>> for Android simulator. It uses Goldfish-rtc (timer and RTC),
>>>>> Goldfish-pic (PIC) and Goldfish-tty (for serial port and early tty).
>>>>>
>>>>> The machine is created with 128 virtio-mmio bus, and they can
>>>>> be used to use serial console, GPU, disk, NIC, HID, ...
>>>>>
>>>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>> Message-Id: <20210312214145.2936082-6-laurent@vivier.eu>
>>>>> ---
>>>>>  default-configs/devices/m68k-softmmu.mak      |   1 +
>>>>>  .../standard-headers/asm-m68k/bootinfo-virt.h |  18 +
>>>>>  hw/m68k/virt.c                                | 313 ++++++++++++++++++
>>>>>  MAINTAINERS                                   |  13 +
>>>>>  hw/m68k/Kconfig                               |   9 +
>>>>>  hw/m68k/meson.build                           |   1 +
>>>>>  6 files changed, 355 insertions(+)
>>>>>  create mode 100644 include/standard-headers/asm-m68k/bootinfo-virt.h
>>>>>  create mode 100644 hw/m68k/virt.c
>>>>
>>>>> diff --git a/hw/m68k/Kconfig b/hw/m68k/Kconfig
>>>>> index 60d7bcfb8f2b..f839f8a03064 100644
>>>>> --- a/hw/m68k/Kconfig
>>>>> +++ b/hw/m68k/Kconfig
>>>>> @@ -23,3 +23,12 @@ config Q800
>>>>>      select ESP
>>>>>      select DP8393X
>>>>>      select OR_IRQ
>>>>> +
>>>>> +config M68K_VIRT
>>>>> +    bool
>>>>> +    select M68K_IRQC
>>>>> +    select VIRT_CTRL
>>>>> +    select GOLDFISH_PIC
>>>>> +    select GOLDFISH_TTY
>>>>> +    select GOLDFISH_RTC
>>>>> +    select VIRTIO_MMIO
>>>>
>>>> I had this error on gitlab:
>>>>
>>>> (qemu) QEMU_PROG: -drive driver=IMGFMT,file=TEST_DIR/t.IMGFMT,if=virtio:
>>>> 'virtio-blk-pci' is not a valid device model name
>>>> job: check-system-fedora
>>>> https://gitlab.com/philmd/qemu/-/jobs/1106469724
>>>>
>>>> I bisected locally to this commit.
>>>>
>>>> check-system-fedora uses build-system-fedora:
>>>>
>>>> build-system-fedora:
>>>>     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
>>>>              --enable-fdt=system --enable-slirp=system
>>>>              --enable-capstone=system
>>>>
>>>> I'm confused because the machine provides a VIRTIO bus
>>>> via MMIO:
>>>>
>>>> config VIRTIO_MMIO
>>>>     bool
>>>>     select VIRTIO
>>>>
>>>> I remember I tested your machine with virtio-blk-device.
>>>>
>>>> config VIRTIO_BLK
>>>>     bool
>>>>     default y
>>>>     depends on VIRTIO
>>>>
>>>> Ah, this is virtio-blk-pci, which has:
>>>>
>>>> virtio_pci_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true:
>>>> files('virtio-blk-pci.c'))
>>>> virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
>>>>
>>>> And VIRTIO_PCI isn't selected...
>>>
>>> This machine doesn't have virtio-pci, but only virtio-mmio buses.
>>
>> Yes. I meant "VIRTIO_PCI isn't selected, which is the correct config
>> for this machine". So the problem isn't the m68k-virt machine addition,
>> but it shows another problem elsewhere.
>>
>>>> Are the tests incorrect then?
>>>>
>>>> libqos isn't restricted to PCI:
>>>>
>>>> tests/qtest/libqos/virtio-blk.c:24:#include "virtio-blk.h"
>>>> tests/qtest/libqos/virtio-blk.c:29:/* virtio-blk-device */
>>>> tests/qtest/libqos/virtio-blk.c:33:    if (!g_strcmp0(interface,
>>>> "virtio-blk")) {
>>>> tests/qtest/libqos/virtio-blk.c:40:    fprintf(stderr, "%s not present
>>>> in virtio-blk-device\n", interface);
>>>> tests/qtest/libqos/virtio-blk.c:109:    /* virtio-blk-device */
>>>> tests/qtest/libqos/virtio-blk.c:111:
>>>> qos_node_create_driver("virtio-blk-device", virtio_blk_device_create);
>>>> tests/qtest/libqos/virtio-blk.c:112:
>>>> qos_node_consumes("virtio-blk-device", "virtio-bus", &opts);
>>>> tests/qtest/libqos/virtio-blk.c:113:
>>>> qos_node_produces("virtio-blk-device", "virtio-blk");
>>>>
>>>> But qemu-iotests / qtests do use virtio-blk-pci. Maybe they should
>>>> use a generic virtio-blk-device instead, hoping it get plugged correctly
>>>> to the virtio bus...
>>>
>>> Yes, it's how the machine work: it has 128 virtio-mmio buses and virtio-devices are plugged directly
>>> in the first free ones.
>>>
>>> I think the fix would be to disable the virtio-blk-pci test for the machines without PCI bus.
>>>
>>> Why is it executed for now?
>>
>> This is probably the problem root cause.
>>
>> Possible fix:
>>
>> -->8 --
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index 66ee9fbf450..d7f3fad51c1 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -217,13 +217,17 @@
>>    'emc141x-test.c',
>>    'usb-hcd-ohci-test.c',
>>    'virtio-test.c',
>> -  'virtio-blk-test.c',
>> -  'virtio-net-test.c',
>> -  'virtio-rng-test.c',
>> -  'virtio-scsi-test.c',
>>    'virtio-serial-test.c',
>>    'vmxnet3-test.c',
>>  )
>> +if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
>> +  qos_test_ss.add(
>> +    'virtio-blk-test.c',
>> +    'virtio-net-test.c',
>> +    'virtio-rng-test.c',
>> +    'virtio-scsi-test.c',
>> +  )
>> +endif
>>  if have_virtfs
>>    qos_test_ss.add(files('virtio-9p-test.c'))
>>  endif
>> ---
>>
>> I'll test that locally but not on Gitlab.

This approach doesn't work for the iotests.

> This also removes the virtio-devices test, I think we should keep the files, but in the files to
> disable the PCI part when it is not available.
I don't understand how the virtio devices are created, it seems there
is an alias to generic virtio hw that map to the arch virtio bus.

I was not obvious to understand why start the virt machine with
"-device virtio-blk" returns "'virtio-blk-pci' is not a valid device
model name" at first, then I figured out the qdev_alias_table array.

Maybe you need to complete it for your arch? I've been using that:

-- >8 --
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 8dc656becca..b326bd76c2a 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -65,8 +65,10 @@ static const QDevAlias qdev_alias_table[] = {
     { "virtio-balloon-ccw", "virtio-balloon", QEMU_ARCH_S390X },
     { "virtio-balloon-pci", "virtio-balloon",
             QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-blk-device", "virtio-blk", QEMU_ARCH_M68K },
     { "virtio-blk-ccw", "virtio-blk", QEMU_ARCH_S390X },
-    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_ALL
+                                      & ~(QEMU_ARCH_S390X |
QEMU_ARCH_M68K) },
     { "virtio-gpu-ccw", "virtio-gpu", QEMU_ARCH_S390X },
     { "virtio-gpu-pci", "virtio-gpu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
     { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_S390X },
@@ -84,8 +86,10 @@ static const QDevAlias qdev_alias_table[] = {
     { "virtio-rng-pci", "virtio-rng", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
     { "virtio-scsi-ccw", "virtio-scsi", QEMU_ARCH_S390X },
     { "virtio-scsi-pci", "virtio-scsi", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-serial-device", "virtio-serial", QEMU_ARCH_M68K },
     { "virtio-serial-ccw", "virtio-serial", QEMU_ARCH_S390X },
-    { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_ALL &
~QEMU_ARCH_S390X },
+    { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_ALL
+                                            & ~(QEMU_ARCH_S390X |
QEMU_ARCH_M68K)},
     { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_S390X },
     { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_ALL &
~QEMU_ARCH_S390X },
     { }
---

But this looks ugly, I don't think it should work that way (because
a machine could provide virtio buses over multiple transport, mmio
and pci...).

I'll ignore this problem and send my pull request with a red CI
as others seem to do.

Regards,

Phil.


