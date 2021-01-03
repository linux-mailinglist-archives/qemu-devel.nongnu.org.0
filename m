Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1072E8CF4
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 16:40:36 +0100 (CET)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw5Ug-0006JG-Qz
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 10:40:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw5SR-0005O9-Ks
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 10:38:16 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw5SP-0003N5-VF
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 10:38:15 -0500
Received: by mail-wr1-x430.google.com with SMTP id r3so28444408wrt.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 07:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V/bRpr+NKzOYYo6iHGTymEdjLu5fxQEpLhvnSWuz8ss=;
 b=mTaZjL4MnHeUpqETR3p2WEUJIpVNB+QzPXpKG3pD2f0d/y/J92D+SA/RGkx3Qj8Z6q
 b3Mv0f3egbnu9r+m3bfzgIpS4en4xu9BZ8Hyt5wG03HnMnLRmXm/RqMYlxvmQ6XW7BUz
 KqdWY3Md0/FHFDYJkzI3gPjmfcL5SsXUe9tZwasHmloWDZuparyweN/LVoGAi7X7pYD7
 Y6utHkSQaywPDdJC55NvtXC5K5T6T+7COcMlCxseEC3JDcySkDcshrwQW9QK9Ii2GO04
 9GfqG8gGOUAXwRTOnlQbYo1VxURyknhdr296JmtQou1X5wexnINt73T+Z4sMgYmt+6Ii
 cRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V/bRpr+NKzOYYo6iHGTymEdjLu5fxQEpLhvnSWuz8ss=;
 b=aYaxbTm7W9CO1smwSlgWtcwc/7ifVbZDcfVVfpHbu3cCCOvh1Kv0wXSetpZsHsVFj+
 Vm908AhH0xWequJTLSFewPvwatDpU9WCFLz2ntV4S2ISlRvmBCTzivoZohP9rG98xcdt
 ZWL9t0ZIFJrz5QgVap6fbV5DRFv+Me7+2iFZcHx/SM+hKSp5D1DAPauhRG2W1iUksoPr
 FoJ8dDeo3tmoEdeuTurV2RyWqUF6oad8wOK6Ob7Ty6jo7/j2AdOO9edbH8qg3HbI7+hU
 C9gBlooL1/KZv8099MkXR7iH8va9g87/dSuMGICt82z/wlf+ri0VSrS70FgKDltQMoH1
 Ot3w==
X-Gm-Message-State: AOAM532c2PcnOu9ayNjNwJAtf7g3VrRiVCxhD3mjiZObLbp46RAC9xxv
 gKSnH33kKOr3jQUASEhe9F4=
X-Google-Smtp-Source: ABdhPJyn4e4Fefb22smm0uu5tZDHzAc59TcySBoxV9oA09nK10ZuHSPl7o+yIqpE39fmkVK6fPeUiQ==
X-Received: by 2002:a5d:4d45:: with SMTP id a5mr78119688wru.380.1609688292560; 
 Sun, 03 Jan 2021 07:38:12 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id c6sm64951700wrh.7.2021.01.03.07.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 07:38:11 -0800 (PST)
Subject: Re: [PATCH V19 4/5] hw/mips: Add Loongson-3 machine support
To: Huacai Chen <chenhuacai@kernel.org>
References: <20201221110538.3186646-1-chenhuacai@kernel.org>
 <20201221110538.3186646-5-chenhuacai@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <049c6932-ef3c-4658-06a1-799dc2607631@amsat.org>
Date: Sun, 3 Jan 2021 16:38:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201221110538.3186646-5-chenhuacai@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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

Hi Huacai,

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

Can you point to a tag/commit? (Thinking about looking at this
commit in few years from now).

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

> +    /*
> +     * The whole MMIO range among configure registers doesn't generate
> +     * exception when accessing invalid memory. Create some unimplememted
> +     * devices to emulate this feature.
> +     */
> +    create_unimplemented_device("mmio fallback 0", 0x10000000, 256 * MiB);
> +    create_unimplemented_device("mmio fallback 1", 0x30000000, 256 * MiB);
> +
> +    liointc = qdev_new("loongson.liointc");
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(liointc), &error_fatal);
> +
> +    sysbus_mmio_map(SYS_BUS_DEVICE(liointc), 0, virt_memmap[VIRT_LIOINTC].base);
> +
> +    serial_mm_init(address_space_mem, virt_memmap[VIRT_UART].base, 0,
> +                   qdev_get_gpio_in(liointc, UART_IRQ), 115200, serial_hd(0),
> +                   DEVICE_NATIVE_ENDIAN);
> +
> +    sysbus_create_simple("goldfish_rtc", virt_memmap[VIRT_RTC].base,
> +                         qdev_get_gpio_in(liointc, RTC_IRQ));
> +
> +    cpuclk = clock_new(OBJECT(machine), "cpu-refclk");
> +    clock_set_hz(cpuclk, DEF_LOONGSON3_FREQ);

Shouldn't this be:

       clock_set_hz(cpuclk, get_cpu_freq_hz());

?

> +
> +    for (i = 0; i < machine->smp.cpus; i++) {
> +        int ip;
> +
> +        /* init CPUs */
> +        cpu = mips_cpu_create_with_clock(machine->cpu_type, cpuclk);
> +
> +        /* Init internal devices */
> +        cpu_mips_irq_init_cpu(cpu);
> +        cpu_mips_clock_init(cpu);
> +        qemu_register_reset(main_cpu_reset, cpu);
> +
> +        if (i >= 4) {
> +            continue; /* Only node-0 can be connected to LIOINTC */
> +        }
> +
> +        for (ip = 0; ip < 4 ; ip++) {
> +            int pin = i * 4 + ip;
> +            sysbus_connect_irq(SYS_BUS_DEVICE(liointc),
> +                               pin, cpu->env.irq[ip + 2]);
> +        }
> +    }
> +    env = &MIPS_CPU(first_cpu)->env;
...

