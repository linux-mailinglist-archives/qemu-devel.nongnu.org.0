Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDDC340280
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:53:42 +0100 (CET)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpLZ-0008LJ-5f
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMpKf-0007tm-Jk
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:52:45 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:38047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMpKb-0007Mc-Lq
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:52:45 -0400
Received: from [192.168.100.1] ([82.142.20.38]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MDyc8-1lWhDZ15XQ-009vLR; Thu, 18 Mar 2021 10:52:33 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210315204226.3481044-1-laurent@vivier.eu>
 <20210315204226.3481044-6-laurent@vivier.eu>
 <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 5/5] m68k: add Virtual M68k Machine
Message-ID: <905c797a-25c3-bb43-5946-54b28d9530c0@vivier.eu>
Date: Thu, 18 Mar 2021 10:52:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YD4nvLoDwLAkhXIoR6u9XDp6LF9BISJJh5mf8dIdBVm+w6i3Q3o
 brEyphcoO7qmAXiaxl3X7qe0xLGD2YsIkybYS/nwvkmmgkANeC+Up8NPt9AHwiP8gJEYgCz
 tMFUWCUtj6b5kx55kG2oQiirvbhG9xVlrXuT4ClZ6Er+f8EvrAYr7oa5Bjz21/iBMKrmgi3
 93FVBKyoGxD8wxDgqp2qA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pjilwXw/YtA=:CbWY5pS/peIRH/roLsQrK5
 fHwtn2l5KOmUu3Uala3q4YVC/Sg4QvMZYv+Y3DmuWVJ7+BHkrrR5ZDkJQxumRn0zrL/bHn1Ah
 KV/u8EQcbBoW0YmPLUgO4D8VeGXyZnlLToAst432uBgHw6TyLLQ721W4zo5EcNRxFXsAlvGec
 oMXy5PiLKZ83NTGFFxpqnvPnw+1p1y9CPM1u3PBcbOmLE7wabtyJclV77plcdDOHhjNHUphgp
 F6pvy6bCqlR4i066Qpv3kD5xrtQ6EBkTwXS2lxhlMhTkvhMwjaUdMqOyt3hKo0c5YpqLhatSf
 kVxRXZwFsahgIzdfY88/g3xSuT5505PUlJC5m5HydlgqxiFKtTHpGmo1F2vHjhMUbXPjGfprJ
 ddtB2WYkjbhalJlx38feK7XowcdPwk0Rqx0eT2vwNtalGPbqciKUIGKRGxqkBzXsvhloI29N2
 lM4iq5NhqQ==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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

Le 18/03/2021 à 10:19, Philippe Mathieu-Daudé a écrit :
> Hi Laurent,
> 
> +Paolo / Thomas
> 
> On 3/15/21 9:42 PM, Laurent Vivier wrote:
>> The machine is based on Goldfish interfaces defined by Google
>> for Android simulator. It uses Goldfish-rtc (timer and RTC),
>> Goldfish-pic (PIC) and Goldfish-tty (for serial port and early tty).
>>
>> The machine is created with 128 virtio-mmio bus, and they can
>> be used to use serial console, GPU, disk, NIC, HID, ...
>>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Message-Id: <20210312214145.2936082-6-laurent@vivier.eu>
>> ---
>>  default-configs/devices/m68k-softmmu.mak      |   1 +
>>  .../standard-headers/asm-m68k/bootinfo-virt.h |  18 +
>>  hw/m68k/virt.c                                | 313 ++++++++++++++++++
>>  MAINTAINERS                                   |  13 +
>>  hw/m68k/Kconfig                               |   9 +
>>  hw/m68k/meson.build                           |   1 +
>>  6 files changed, 355 insertions(+)
>>  create mode 100644 include/standard-headers/asm-m68k/bootinfo-virt.h
>>  create mode 100644 hw/m68k/virt.c
> 
>> diff --git a/hw/m68k/Kconfig b/hw/m68k/Kconfig
>> index 60d7bcfb8f2b..f839f8a03064 100644
>> --- a/hw/m68k/Kconfig
>> +++ b/hw/m68k/Kconfig
>> @@ -23,3 +23,12 @@ config Q800
>>      select ESP
>>      select DP8393X
>>      select OR_IRQ
>> +
>> +config M68K_VIRT
>> +    bool
>> +    select M68K_IRQC
>> +    select VIRT_CTRL
>> +    select GOLDFISH_PIC
>> +    select GOLDFISH_TTY
>> +    select GOLDFISH_RTC
>> +    select VIRTIO_MMIO
> 
> I had this error on gitlab:
> 
> (qemu) QEMU_PROG: -drive driver=IMGFMT,file=TEST_DIR/t.IMGFMT,if=virtio:
> 'virtio-blk-pci' is not a valid device model name
> job: check-system-fedora
> https://gitlab.com/philmd/qemu/-/jobs/1106469724
> 
> I bisected locally to this commit.
> 
> check-system-fedora uses build-system-fedora:
> 
> build-system-fedora:
>     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
>              --enable-fdt=system --enable-slirp=system
>              --enable-capstone=system
> 
> I'm confused because the machine provides a VIRTIO bus
> via MMIO:
> 
> config VIRTIO_MMIO
>     bool
>     select VIRTIO
> 
> I remember I tested your machine with virtio-blk-device.
> 
> config VIRTIO_BLK
>     bool
>     default y
>     depends on VIRTIO
> 
> Ah, this is virtio-blk-pci, which has:
> 
> virtio_pci_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true:
> files('virtio-blk-pci.c'))
> virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
> 
> And VIRTIO_PCI isn't selected...

This machine doesn't have virtio-pci, but only virtio-mmio buses.

> Are the tests incorrect then?
> 
> libqos isn't restricted to PCI:
> 
> tests/qtest/libqos/virtio-blk.c:24:#include "virtio-blk.h"
> tests/qtest/libqos/virtio-blk.c:29:/* virtio-blk-device */
> tests/qtest/libqos/virtio-blk.c:33:    if (!g_strcmp0(interface,
> "virtio-blk")) {
> tests/qtest/libqos/virtio-blk.c:40:    fprintf(stderr, "%s not present
> in virtio-blk-device\n", interface);
> tests/qtest/libqos/virtio-blk.c:109:    /* virtio-blk-device */
> tests/qtest/libqos/virtio-blk.c:111:
> qos_node_create_driver("virtio-blk-device", virtio_blk_device_create);
> tests/qtest/libqos/virtio-blk.c:112:
> qos_node_consumes("virtio-blk-device", "virtio-bus", &opts);
> tests/qtest/libqos/virtio-blk.c:113:
> qos_node_produces("virtio-blk-device", "virtio-blk");
> 
> But qemu-iotests / qtests do use virtio-blk-pci. Maybe they should
> use a generic virtio-blk-device instead, hoping it get plugged correctly
> to the virtio bus...

Yes, it's how the machine work: it has 128 virtio-mmio buses and virtio-devices are plugged directly
in the first free ones.

I think the fix would be to disable the virtio-blk-pci test for the machines without PCI bus.

Why is it executed for now?

Thanks,
Laurent




