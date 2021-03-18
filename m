Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9523402BA
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:08:27 +0100 (CET)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpZq-0002vW-AT
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMpYP-00029D-Oj
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:06:57 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:52791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMpYN-00083m-Hx
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:06:57 -0400
Received: from [192.168.100.1] ([82.142.20.38]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mg6JS-1luXGm0Vbi-00hd8Q; Thu, 18 Mar 2021 11:06:50 +0100
Subject: Re: [PULL 5/5] m68k: add Virtual M68k Machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210315204226.3481044-1-laurent@vivier.eu>
 <20210315204226.3481044-6-laurent@vivier.eu>
 <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
 <905c797a-25c3-bb43-5946-54b28d9530c0@vivier.eu>
 <d515dabd-b84d-5aa3-0bf5-d824bdc7da6e@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ffa12ba8-4988-b464-2267-5d14c59b43ab@vivier.eu>
Date: Thu, 18 Mar 2021 11:06:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <d515dabd-b84d-5aa3-0bf5-d824bdc7da6e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pxWxaTR44f1T9kqTLZwpjdwqg6bgsJHCK5TzDPK9qsl50vVOn1L
 kmSIREcr5BMDXyBTOV4fID9kYkdM16VD7L5eEa+Jl1EgnBdJjQYIQYFgMDZCl/zaih+2qfC
 b1ZGp3ghUXNfMeBvqCGw8GO4e4hWEtfsL08FVJyn1RSsSbWtFTeCN04GMTyhc/tKvIFo7fS
 2JLKzJ0OAtdpCY1vTRiNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kqe/taPST3k=:tSVYSfr44FAMPx/rb2u5H7
 1dOGTJ71YP5xyv3LFt2H30E6oN8NnmBE/naUHwq8pkpO3iCBB0Rihb/4TqadYdvXAKPv7sk0C
 SXsNff4A73GscP2mSUZqG8/V25FjfmOgnBygUcXTjQIRWHal6ybQ69SKz6A+8YwmLU/Ek5yCl
 mryHePMnI9F8RSL3nttREa5EG+ZJAVi2X5TNNVRZSJ5MbDJBuzR2olcKi9l76Wv8EkjleUxAx
 QB83K/szsLs5Yn0ozadnoqVOIL2PeDtiEJ6gevlCFuxPPGQV+9Wrqtwa87Y4mgrbPAUN9x3AD
 QGGCoE4lhHtnslV6PpTu9AmHV12lHSx5z0SoxfyTaIYxhAfLJmbapSKa+Heb1UfP2AgT0BBMw
 l9iQasIaCmUSxh2+ZscTHNLdnExmKXztE5i6V1CEjHjGkioCTiSWZ8DG0YYVc
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

Le 18/03/2021 à 11:02, Philippe Mathieu-Daudé a écrit :
> On 3/18/21 10:52 AM, Laurent Vivier wrote:
>> Le 18/03/2021 à 10:19, Philippe Mathieu-Daudé a écrit :
>>> Hi Laurent,
>>>
>>> +Paolo / Thomas
>>>
>>> On 3/15/21 9:42 PM, Laurent Vivier wrote:
>>>> The machine is based on Goldfish interfaces defined by Google
>>>> for Android simulator. It uses Goldfish-rtc (timer and RTC),
>>>> Goldfish-pic (PIC) and Goldfish-tty (for serial port and early tty).
>>>>
>>>> The machine is created with 128 virtio-mmio bus, and they can
>>>> be used to use serial console, GPU, disk, NIC, HID, ...
>>>>
>>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> Message-Id: <20210312214145.2936082-6-laurent@vivier.eu>
>>>> ---
>>>>  default-configs/devices/m68k-softmmu.mak      |   1 +
>>>>  .../standard-headers/asm-m68k/bootinfo-virt.h |  18 +
>>>>  hw/m68k/virt.c                                | 313 ++++++++++++++++++
>>>>  MAINTAINERS                                   |  13 +
>>>>  hw/m68k/Kconfig                               |   9 +
>>>>  hw/m68k/meson.build                           |   1 +
>>>>  6 files changed, 355 insertions(+)
>>>>  create mode 100644 include/standard-headers/asm-m68k/bootinfo-virt.h
>>>>  create mode 100644 hw/m68k/virt.c
>>>
>>>> diff --git a/hw/m68k/Kconfig b/hw/m68k/Kconfig
>>>> index 60d7bcfb8f2b..f839f8a03064 100644
>>>> --- a/hw/m68k/Kconfig
>>>> +++ b/hw/m68k/Kconfig
>>>> @@ -23,3 +23,12 @@ config Q800
>>>>      select ESP
>>>>      select DP8393X
>>>>      select OR_IRQ
>>>> +
>>>> +config M68K_VIRT
>>>> +    bool
>>>> +    select M68K_IRQC
>>>> +    select VIRT_CTRL
>>>> +    select GOLDFISH_PIC
>>>> +    select GOLDFISH_TTY
>>>> +    select GOLDFISH_RTC
>>>> +    select VIRTIO_MMIO
>>>
>>> I had this error on gitlab:
>>>
>>> (qemu) QEMU_PROG: -drive driver=IMGFMT,file=TEST_DIR/t.IMGFMT,if=virtio:
>>> 'virtio-blk-pci' is not a valid device model name
>>> job: check-system-fedora
>>> https://gitlab.com/philmd/qemu/-/jobs/1106469724
>>>
>>> I bisected locally to this commit.
>>>
>>> check-system-fedora uses build-system-fedora:
>>>
>>> build-system-fedora:
>>>     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
>>>              --enable-fdt=system --enable-slirp=system
>>>              --enable-capstone=system
>>>
>>> I'm confused because the machine provides a VIRTIO bus
>>> via MMIO:
>>>
>>> config VIRTIO_MMIO
>>>     bool
>>>     select VIRTIO
>>>
>>> I remember I tested your machine with virtio-blk-device.
>>>
>>> config VIRTIO_BLK
>>>     bool
>>>     default y
>>>     depends on VIRTIO
>>>
>>> Ah, this is virtio-blk-pci, which has:
>>>
>>> virtio_pci_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true:
>>> files('virtio-blk-pci.c'))
>>> virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
>>>
>>> And VIRTIO_PCI isn't selected...
>>
>> This machine doesn't have virtio-pci, but only virtio-mmio buses.
> 
> Yes. I meant "VIRTIO_PCI isn't selected, which is the correct config
> for this machine". So the problem isn't the m68k-virt machine addition,
> but it shows another problem elsewhere.
> 
>>> Are the tests incorrect then?
>>>
>>> libqos isn't restricted to PCI:
>>>
>>> tests/qtest/libqos/virtio-blk.c:24:#include "virtio-blk.h"
>>> tests/qtest/libqos/virtio-blk.c:29:/* virtio-blk-device */
>>> tests/qtest/libqos/virtio-blk.c:33:    if (!g_strcmp0(interface,
>>> "virtio-blk")) {
>>> tests/qtest/libqos/virtio-blk.c:40:    fprintf(stderr, "%s not present
>>> in virtio-blk-device\n", interface);
>>> tests/qtest/libqos/virtio-blk.c:109:    /* virtio-blk-device */
>>> tests/qtest/libqos/virtio-blk.c:111:
>>> qos_node_create_driver("virtio-blk-device", virtio_blk_device_create);
>>> tests/qtest/libqos/virtio-blk.c:112:
>>> qos_node_consumes("virtio-blk-device", "virtio-bus", &opts);
>>> tests/qtest/libqos/virtio-blk.c:113:
>>> qos_node_produces("virtio-blk-device", "virtio-blk");
>>>
>>> But qemu-iotests / qtests do use virtio-blk-pci. Maybe they should
>>> use a generic virtio-blk-device instead, hoping it get plugged correctly
>>> to the virtio bus...
>>
>> Yes, it's how the machine work: it has 128 virtio-mmio buses and virtio-devices are plugged directly
>> in the first free ones.
>>
>> I think the fix would be to disable the virtio-blk-pci test for the machines without PCI bus.
>>
>> Why is it executed for now?
> 
> This is probably the problem root cause.
> 
> Possible fix:
> 
> -->8 --
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 66ee9fbf450..d7f3fad51c1 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -217,13 +217,17 @@
>    'emc141x-test.c',
>    'usb-hcd-ohci-test.c',
>    'virtio-test.c',
> -  'virtio-blk-test.c',
> -  'virtio-net-test.c',
> -  'virtio-rng-test.c',
> -  'virtio-scsi-test.c',
>    'virtio-serial-test.c',
>    'vmxnet3-test.c',
>  )
> +if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
> +  qos_test_ss.add(
> +    'virtio-blk-test.c',
> +    'virtio-net-test.c',
> +    'virtio-rng-test.c',
> +    'virtio-scsi-test.c',
> +  )
> +endif
>  if have_virtfs
>    qos_test_ss.add(files('virtio-9p-test.c'))
>  endif
> ---
> 
> I'll test that locally but not on Gitlab.
> 

This also removes the virtio-devices test, I think we should keep the files, but in the files to
disable the PCI part when it is not available.

Thanks,
Laurent


