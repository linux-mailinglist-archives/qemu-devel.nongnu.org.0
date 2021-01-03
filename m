Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A092F2E8D6D
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 18:07:23 +0100 (CET)
Received: from localhost ([::1]:47572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw6qg-0003Wd-7S
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 12:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw6o5-0001qR-Kr
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 12:04:41 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw6o3-0001RE-Ik
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 12:04:41 -0500
Received: by mail-wr1-x431.google.com with SMTP id d26so28508724wrb.12
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 09:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ehM9uhyqgN578vPViNZqzt49faO1XBD5I90hlkBFavk=;
 b=s3+pNHSR9XpQbuih+IQ/SI43QxnH9K3Na2Zdooc03M4AqAWPNJvFF8ImjLbLXvXkiB
 snb4aD1VOQpN8+ofRMjjt9wqc08qxEI9lmhE0w73oTpEU1Co1oxR0k1vnKfqKwOOJNPZ
 eD/XmVTMxgb1EhnPpjWm6eKNEuhlPw0I5MEkGxMmgIXi43D+RKZJMDNoyfiU4FkeKx00
 441Cy26QUhktvwIcHfBpJSz4XiilrBCWsbFvkLjgmoImPNEkSAGEs4DFTMUy6uX9OKc0
 Xf/1eLX3GCVhcH8yq0PWvjV/2LOaj8FXo1b4SjaWoZXMp3sPHjairs6TonrNIF3FaaP2
 YNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ehM9uhyqgN578vPViNZqzt49faO1XBD5I90hlkBFavk=;
 b=XVYUGtO0yWQZIqUiUUneP7+eMmMqQKqK2XFJoFLfM3nc9ZZbY+AhmXJW//+ukDulHc
 jn/VLLWU1r1UQ52q6fF2FK8jNDI7bW0zbUtIwuWKGbk8T6rYSjXwM0b5KG6OwYwjETCE
 LXLIW9XyPuxsXe2NBg3XLZvNt2uyC51mZLTw1mCiqAUgOAlkAslZBWOToWDdf92fFcrj
 bQabU+zQscEWsRyXQUvcpqXwUOScLgqpjJN8X4duq4GlM4uwN0s/IWDiP2moqt7ERRfU
 k6wA/tLqOYOo84/2Kpv88PpI0Q/FOybZdj1vYfdxad3zbjNI6RNxAaB/SGMH2st7VFNe
 D0Ew==
X-Gm-Message-State: AOAM532j5SNMECZCVCXueEdrKucvLMbmvU5GxWfo8MxyUlsQahCMnBGZ
 HHUY555Gfr9Irhp/wStRKsw=
X-Google-Smtp-Source: ABdhPJwyFRabwhVa3Xm7EvQZ5bhb/MV1LNalj0XNginDULf18D1kGTU2ZfSqN9RTTOuS3ou5vJPOgQ==
X-Received: by 2002:adf:8185:: with SMTP id 5mr74386124wra.44.1609693477729;
 Sun, 03 Jan 2021 09:04:37 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id n3sm82347340wrw.61.2021.01.03.09.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 09:04:36 -0800 (PST)
Subject: Re: [PATCH V19 4/5] hw/mips: Add Loongson-3 machine support
To: Huacai Chen <chenhuacai@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20201221110538.3186646-1-chenhuacai@kernel.org>
 <20201221110538.3186646-5-chenhuacai@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c5e86203-1ba2-3539-6cb4-c80d067cf894@amsat.org>
Date: Sun, 3 Jan 2021 18:04:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201221110538.3186646-5-chenhuacai@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.262,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Paolo for question at the end.

On 12/21/20 12:05 PM, Huacai Chen wrote:
> Add Loongson-3 based machine support, it use liointc as the interrupt
> controler and use GPEX as the pci controller. Currently it can work with
> both TCG and KVM.
> 
> As the machine model is not based on any exiting physical hardware, the
> name of the machine is "loongson3-virt". It may be superseded in future
> by a real machine model. If this happens, then a regular deprecation
> procedure shall occur for "loongson3-virt" machine.
> 
> We now already have a full functional Linux kernel (based on Linux-5.4.x
> LTS) here:
> 
> https://github.com/chenhuacai/linux
> 
> Of course the upstream kernel is also usable (the kvm host side and
> guest side have both been upstream in Linux-5.9):
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> 
> How to use QEMU/Loongson-3?
> 1, Download kernel source from the above URL;
> 2, Build a kernel with arch/mips/configs/loongson3_defconfig;
> 3, Boot a Loongson-3A4000 host with this kernel (for KVM mode);
> 4, Build QEMU-master with this patchset;
> 5, modprobe kvm (only necessary for KVM mode);
> 6, Use QEMU with TCG:
>        qemu-system-mips64el -M loongson3-virt,accel=tcg -cpu Loongson-3A1000 -kernel <path_to_kernel> -append ...
>    Use QEMU with KVM:
>        qemu-system-mips64el -M loongson3-virt,accel=kvm -cpu Loongson-3A4000 -kernel <path_to_kernel> -append ...
> 
>    The "-cpu" parameter is optional here and QEMU will use the correct type for TCG/KVM automatically.
> 
> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  MAINTAINERS                                  |   1 +
>  default-configs/devices/mips64el-softmmu.mak |   1 +
>  hw/mips/Kconfig                              |  11 +
>  hw/mips/loongson3_virt.c                     | 621 +++++++++++++++++++
>  hw/mips/meson.build                          |   2 +-
>  5 files changed, 635 insertions(+), 1 deletion(-)
>  create mode 100644 hw/mips/loongson3_virt.c
...

> +static inline void loongson3_virt_devices_init(MachineState *machine, DeviceState *pic)
> +{
> +    int i;
> +    qemu_irq irq;
> +    PCIBus *pci_bus;
> +    DeviceState *dev;
> +    MemoryRegion *mmio_reg, *ecam_reg;
> +    LoongsonMachineState *s = LOONGSON_MACHINE(machine);
> +
> +    dev = qdev_new(TYPE_GPEX_HOST);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    pci_bus = PCI_HOST_BRIDGE(dev)->bus;
> +
> +    s->ecam_alias = g_new0(MemoryRegion, 1);
> +    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> +    memory_region_init_alias(s->ecam_alias, OBJECT(dev), "pcie-ecam",
> +                             ecam_reg, 0, virt_memmap[VIRT_PCIE_ECAM].size);
> +    memory_region_add_subregion(get_system_memory(),
> +                                virt_memmap[VIRT_PCIE_ECAM].base, s->ecam_alias);
> +
> +    s->mmio_alias = g_new0(MemoryRegion, 1);
> +    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
> +    memory_region_init_alias(s->mmio_alias, OBJECT(dev), "pcie-mmio",
> +                             mmio_reg, virt_memmap[VIRT_PCIE_MMIO].base,
> +                             virt_memmap[VIRT_PCIE_MMIO].size);
> +    memory_region_add_subregion(get_system_memory(),
> +                                virt_memmap[VIRT_PCIE_MMIO].base, s->mmio_alias);
> +
> +    s->pio_alias = g_new0(MemoryRegion, 1);
> +    memory_region_init_alias(s->pio_alias, OBJECT(dev), "pcie-pio",
> +                             get_system_io(), 0, virt_memmap[VIRT_PCIE_PIO].size);
> +    memory_region_add_subregion(get_system_memory(),
> +                                virt_memmap[VIRT_PCIE_PIO].base, s->pio_alias);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, virt_memmap[VIRT_PCIE_PIO].base);
> +
> +    for (i = 0; i < GPEX_NUM_IRQS; i++) {
> +        irq = qdev_get_gpio_in(pic, PCIE_IRQ_BASE + i);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
> +        gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ_BASE + i);
> +    }
> +    msi_nonbroken = true;
> +
> +    pci_vga_init(pci_bus);
> +
> +    if (defaults_enabled()) {
> +        pci_create_simple(pci_bus, -1, "pci-ohci");
> +        usb_create_simple(usb_bus_find(-1), "usb-kbd");
> +        usb_create_simple(usb_bus_find(-1), "usb-tablet");
> +    }

Configured using --without-default-devices I get:

$ qemu-system-mips64el -M loongson3-virt -accel qtest
**
ERROR:qom/object.c:711:object_new_with_type: assertion failed: (type !=
NULL)
Bail out! ERROR:qom/object.c:711:object_new_with_type: assertion failed:
(type != NULL)
Aborted (core dumped)

(gdb) bt
#0  0x00007f97d73de9e5 in raise () at /lib64/libc.so.6
#1  0x00007f97d73c7895 in abort () at /lib64/libc.so.6
#2  0x00007f97d95aab6c in g_assertion_message_expr.cold () at
/lib64/libglib-2.0.so.0
#3  0x00007f97d96089ff in g_assertion_message_expr () at
/lib64/libglib-2.0.so.0
#4  0x00005563b44cb391 in object_new_with_type (type=<optimized out>) at
qom/object.c:711
#5  0x00005563b44cb3e9 in object_new
(typename=typename@entry=0x5563b469e139 "pci-ohci") at qom/object.c:744
#6  0x00005563b4570d86 in qdev_new (name=name@entry=0x5563b469e139
"pci-ohci") at hw/core/qdev.c:153
#7  0x00005563b4323d51 in pci_new_multifunction (devfn=devfn@entry=-1,
multifunction=multifunction@entry=false, name=name@entry=0x5563b469e139
"pci-ohci") at hw/pci/pci.c:2178
#8  0x00005563b4324167 in pci_create_simple_multifunction
(bus=bus@entry=0x5563b5150640, devfn=devfn@entry=-1,
multifunction=multifunction@entry=false, name=name@entry=0x5563b469e139
"pci-ohci")
    at hw/pci/pci.c:2198
#9  0x00005563b432419a in pci_create_simple
(bus=bus@entry=0x5563b5150640, devfn=devfn@entry=-1,
name=name@entry=0x5563b469e139 "pci-ohci") at hw/pci/pci.c:2205
#10 0x00005563b436dc4c in loongson3_virt_devices_init
(pic=0x5563b5100200, machine=<optimized out>) at
hw/mips/loongson3_virt.c:455
#11 mips_loongson3_virt_init (machine=<optimized out>) at
hw/mips/loongson3_virt.c:612
#12 0x00005563b42e9ebb in machine_run_board_init
(machine=machine@entry=0x5563b4c80400) at hw/core/machine.c:1169
#13 0x00005563b44ab639 in qemu_init_board () at softmmu/vl.c:2455
#14 qmp_x_exit_preconfig (errp=<optimized out>) at softmmu/vl.c:2526
#15 qmp_x_exit_preconfig (errp=<optimized out>) at softmmu/vl.c:2519
#16 0x00005563b44af199 in qemu_init (argc=<optimized out>,
argv=<optimized out>, envp=<optimized out>) at softmmu/vl.c:3534
#17 0x00005563b41d0549 in main (argc=<optimized out>, argv=<optimized
out>, envp=<optimized out>) at softmmu/main.c:49

But this works:

$ qemu-system-mips64el -M loongson3-virt -accel qtest -nodefaults

So I guess we are good.

Paolo, shouldn't we abort() if configured using
--without-default-devices but not using -nodefaults? That would avoid
this kind of
debugging.

Thanks,

Phil.

