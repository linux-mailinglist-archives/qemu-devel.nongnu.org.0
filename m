Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C893D34096C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:59:23 +0100 (CET)
Received: from localhost ([::1]:59556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMv3S-0004kI-Rx
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMuwR-0005ec-4P
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:52:07 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:33647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMuwJ-0003ma-Df
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:52:06 -0400
Received: from [192.168.100.1] ([82.142.20.38]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1McpW8-1lvhWd1IkU-00ZxpE; Thu, 18 Mar 2021 16:51:53 +0100
Subject: Re: [PULL 5/5] m68k: add Virtual M68k Machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210315204226.3481044-1-laurent@vivier.eu>
 <20210315204226.3481044-6-laurent@vivier.eu>
 <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
 <905c797a-25c3-bb43-5946-54b28d9530c0@vivier.eu>
 <d515dabd-b84d-5aa3-0bf5-d824bdc7da6e@redhat.com>
 <ffa12ba8-4988-b464-2267-5d14c59b43ab@vivier.eu>
 <b06c176d-c4ab-6c27-c96f-0bf27f7fd036@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <27c791b2-dcc0-6c98-d765-ac1b60b7af3d@vivier.eu>
Date: Thu, 18 Mar 2021 16:51:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b06c176d-c4ab-6c27-c96f-0bf27f7fd036@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hco588qjnBTH1eX2QFUd4W2xKu4f9ZCHvehZkWYP2kXaekVbRxF
 LrDkEqsSIYTZoxkrQ+UWi8/t/81iwVwz2VrDooLy+a2yK/hETcai4eRSCnL/qosoTk7pyWU
 u6GzxmAlIZjbOKTYJ/bYsB26wuwl2FxHpbEq5RV666vezuXxxdBRoH95f9Y27OQ4jEFZXdJ
 6rEsp9+0BW5W0ZMyFbv2w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vo1wYhcJBYQ=:tnzQzPT0ntOrjkrGT7gJht
 IJ/2o11cjewAuDWRjiNWK1oz+VFyP3qShRNVQ+4Qeaj2eGSxSaYbVeYveF2nVXtlXZHKsmn4D
 8376YFatyuGprrEhJq3cHI0J7CFe3K+Sv78bcfAu8mQt7LZZEop/fQLM8a190SnoQtiACoE16
 Q/CQPrAgFr9cXqG81pXvManfZDDeiR3ahhX1AZdFBihqzl2xbZSjxkI8lvsR2WQ/11pGiDOUg
 8WoBe6TT4ZfoY/DEsHxD9t7BOSFVyyCLhbl0SGHOBmfHqA+xioj4dmUw5RYo+AyMGAk8yQmyb
 T7FgPho1IO5uDEzbCnYNP4PYsRpzPZDFuzk8/ydq6yo/1KnVAEej/5LfMnC9IrSBxvRlTRhC3
 2zDojjFxvHpXUoRha94Go9gkSz4oHQ58EXy1Z60SElYFDqB6wPkM0rDCjqnPFSBGuG0n0SN9I
 loJu8jzKag==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 18/03/2021 à 16:36, Philippe Mathieu-Daudé a écrit :
> On 3/18/21 11:06 AM, Laurent Vivier wrote:
>> Le 18/03/2021 à 11:02, Philippe Mathieu-Daudé a écrit :
>>> On 3/18/21 10:52 AM, Laurent Vivier wrote:
>>>> Le 18/03/2021 à 10:19, Philippe Mathieu-Daudé a écrit :
>>>>> Hi Laurent,
>>>>>
>>>>> +Paolo / Thomas
>>>>>
>>>>> On 3/15/21 9:42 PM, Laurent Vivier wrote:
>>>>>> The machine is based on Goldfish interfaces defined by Google
>>>>>> for Android simulator. It uses Goldfish-rtc (timer and RTC),
>>>>>> Goldfish-pic (PIC) and Goldfish-tty (for serial port and early tty).
>>>>>>
>>>>>> The machine is created with 128 virtio-mmio bus, and they can
>>>>>> be used to use serial console, GPU, disk, NIC, HID, ...
>>>>>>
>>>>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>>>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>> Message-Id: <20210312214145.2936082-6-laurent@vivier.eu>
>>>>>> ---
>>>>>>  default-configs/devices/m68k-softmmu.mak      |   1 +
>>>>>>  .../standard-headers/asm-m68k/bootinfo-virt.h |  18 +
>>>>>>  hw/m68k/virt.c                                | 313 ++++++++++++++++++
>>>>>>  MAINTAINERS                                   |  13 +
>>>>>>  hw/m68k/Kconfig                               |   9 +
>>>>>>  hw/m68k/meson.build                           |   1 +
>>>>>>  6 files changed, 355 insertions(+)
>>>>>>  create mode 100644 include/standard-headers/asm-m68k/bootinfo-virt.h
>>>>>>  create mode 100644 hw/m68k/virt.c
>>>>>
>>>>>> diff --git a/hw/m68k/Kconfig b/hw/m68k/Kconfig
>>>>>> index 60d7bcfb8f2b..f839f8a03064 100644
>>>>>> --- a/hw/m68k/Kconfig
>>>>>> +++ b/hw/m68k/Kconfig
>>>>>> @@ -23,3 +23,12 @@ config Q800
>>>>>>      select ESP
>>>>>>      select DP8393X
>>>>>>      select OR_IRQ
>>>>>> +
>>>>>> +config M68K_VIRT
>>>>>> +    bool
>>>>>> +    select M68K_IRQC
>>>>>> +    select VIRT_CTRL
>>>>>> +    select GOLDFISH_PIC
>>>>>> +    select GOLDFISH_TTY
>>>>>> +    select GOLDFISH_RTC
>>>>>> +    select VIRTIO_MMIO
>>>>>
>>>>> I had this error on gitlab:
>>>>>
>>>>> (qemu) QEMU_PROG: -drive driver=IMGFMT,file=TEST_DIR/t.IMGFMT,if=virtio:
>>>>> 'virtio-blk-pci' is not a valid device model name
>>>>> job: check-system-fedora
>>>>> https://gitlab.com/philmd/qemu/-/jobs/1106469724
>>>>>
>>>>> I bisected locally to this commit.
>>>>>
>>>>> check-system-fedora uses build-system-fedora:
>>>>>
>>>>> build-system-fedora:
>>>>>     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
>>>>>              --enable-fdt=system --enable-slirp=system
>>>>>              --enable-capstone=system
>>>>>
>>>>> I'm confused because the machine provides a VIRTIO bus
>>>>> via MMIO:
>>>>>
>>>>> config VIRTIO_MMIO
>>>>>     bool
>>>>>     select VIRTIO
>>>>>
>>>>> I remember I tested your machine with virtio-blk-device.
>>>>>
>>>>> config VIRTIO_BLK
>>>>>     bool
>>>>>     default y
>>>>>     depends on VIRTIO
>>>>>
>>>>> Ah, this is virtio-blk-pci, which has:
>>>>>
>>>>> virtio_pci_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true:
>>>>> files('virtio-blk-pci.c'))
>>>>> virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
>>>>>
>>>>> And VIRTIO_PCI isn't selected...
>>>>
>>>> This machine doesn't have virtio-pci, but only virtio-mmio buses.
>>>
>>> Yes. I meant "VIRTIO_PCI isn't selected, which is the correct config
>>> for this machine". So the problem isn't the m68k-virt machine addition,
>>> but it shows another problem elsewhere.
>>>
>>>>> Are the tests incorrect then?
>>>>>
>>>>> libqos isn't restricted to PCI:
>>>>>
>>>>> tests/qtest/libqos/virtio-blk.c:24:#include "virtio-blk.h"
>>>>> tests/qtest/libqos/virtio-blk.c:29:/* virtio-blk-device */
>>>>> tests/qtest/libqos/virtio-blk.c:33:    if (!g_strcmp0(interface,
>>>>> "virtio-blk")) {
>>>>> tests/qtest/libqos/virtio-blk.c:40:    fprintf(stderr, "%s not present
>>>>> in virtio-blk-device\n", interface);
>>>>> tests/qtest/libqos/virtio-blk.c:109:    /* virtio-blk-device */
>>>>> tests/qtest/libqos/virtio-blk.c:111:
>>>>> qos_node_create_driver("virtio-blk-device", virtio_blk_device_create);
>>>>> tests/qtest/libqos/virtio-blk.c:112:
>>>>> qos_node_consumes("virtio-blk-device", "virtio-bus", &opts);
>>>>> tests/qtest/libqos/virtio-blk.c:113:
>>>>> qos_node_produces("virtio-blk-device", "virtio-blk");
>>>>>
>>>>> But qemu-iotests / qtests do use virtio-blk-pci. Maybe they should
>>>>> use a generic virtio-blk-device instead, hoping it get plugged correctly
>>>>> to the virtio bus...
>>>>
>>>> Yes, it's how the machine work: it has 128 virtio-mmio buses and virtio-devices are plugged directly
>>>> in the first free ones.
>>>>
>>>> I think the fix would be to disable the virtio-blk-pci test for the machines without PCI bus.
>>>>
>>>> Why is it executed for now?
>>>
>>> This is probably the problem root cause.
>>>
>>> Possible fix:
>>>
>>> -->8 --
>>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>>> index 66ee9fbf450..d7f3fad51c1 100644
>>> --- a/tests/qtest/meson.build
>>> +++ b/tests/qtest/meson.build
>>> @@ -217,13 +217,17 @@
>>>    'emc141x-test.c',
>>>    'usb-hcd-ohci-test.c',
>>>    'virtio-test.c',
>>> -  'virtio-blk-test.c',
>>> -  'virtio-net-test.c',
>>> -  'virtio-rng-test.c',
>>> -  'virtio-scsi-test.c',
>>>    'virtio-serial-test.c',
>>>    'vmxnet3-test.c',
>>>  )
>>> +if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
>>> +  qos_test_ss.add(
>>> +    'virtio-blk-test.c',
>>> +    'virtio-net-test.c',
>>> +    'virtio-rng-test.c',
>>> +    'virtio-scsi-test.c',
>>> +  )
>>> +endif
>>>  if have_virtfs
>>>    qos_test_ss.add(files('virtio-9p-test.c'))
>>>  endif
>>> ---
>>>
>>> I'll test that locally but not on Gitlab.
> 
> This approach doesn't work for the iotests.
> 
>> This also removes the virtio-devices test, I think we should keep the files, but in the files to
>> disable the PCI part when it is not available.
> I don't understand how the virtio devices are created, it seems there
> is an alias to generic virtio hw that map to the arch virtio bus.
> 
> I was not obvious to understand why start the virt machine with
> "-device virtio-blk" returns "'virtio-blk-pci' is not a valid device
> model name" at first, then I figured out the qdev_alias_table array.
> 
> Maybe you need to complete it for your arch? I've been using that:
> 
> -- >8 --
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 8dc656becca..b326bd76c2a 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -65,8 +65,10 @@ static const QDevAlias qdev_alias_table[] = {
>      { "virtio-balloon-ccw", "virtio-balloon", QEMU_ARCH_S390X },
>      { "virtio-balloon-pci", "virtio-balloon",
>              QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> +    { "virtio-blk-device", "virtio-blk", QEMU_ARCH_M68K },
>      { "virtio-blk-ccw", "virtio-blk", QEMU_ARCH_S390X },
> -    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> +    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_ALL
> +                                      & ~(QEMU_ARCH_S390X |
> QEMU_ARCH_M68K) },
>      { "virtio-gpu-ccw", "virtio-gpu", QEMU_ARCH_S390X },
>      { "virtio-gpu-pci", "virtio-gpu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
>      { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_S390X },
> @@ -84,8 +86,10 @@ static const QDevAlias qdev_alias_table[] = {
>      { "virtio-rng-pci", "virtio-rng", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
>      { "virtio-scsi-ccw", "virtio-scsi", QEMU_ARCH_S390X },
>      { "virtio-scsi-pci", "virtio-scsi", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> +    { "virtio-serial-device", "virtio-serial", QEMU_ARCH_M68K },
>      { "virtio-serial-ccw", "virtio-serial", QEMU_ARCH_S390X },
> -    { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_ALL &
> ~QEMU_ARCH_S390X },
> +    { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_ALL
> +                                            & ~(QEMU_ARCH_S390X |
> QEMU_ARCH_M68K)},
>      { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_S390X },
>      { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_ALL &
> ~QEMU_ARCH_S390X },
>      { }
> ---
> 
> But this looks ugly, I don't think it should work that way (because
> a machine could provide virtio buses over multiple transport, mmio
> and pci...).

IMHO, this looks like the solution.

The alias is to define the prefered way, on PCI it's the -pci one otherwise it is the -device one.

Thanks,
Laurent

