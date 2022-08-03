Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE6D58914D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 19:25:35 +0200 (CEST)
Received: from localhost ([::1]:38998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJI7i-0006mH-EE
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 13:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJHyj-0003fy-1x; Wed, 03 Aug 2022 13:16:29 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29]:39854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJHyg-0003oF-Ri; Wed, 03 Aug 2022 13:16:16 -0400
Received: by mail-vk1-xa29.google.com with SMTP id q191so6726665vkb.6;
 Wed, 03 Aug 2022 10:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=9ywGJov6n/rBh2W5e4kQUqyLAk7InBfN0jJOKh4fUZk=;
 b=eU6V8fOIkrr1DQk6JGdDapn6AICxO6mFMC/CZC+gRBdcG8J6NzvOmV0vAxTtNTyJyW
 NjDt66mmFbaR2ZG8qcXkgOok6/7FDZ1ISV2zpIIrMgoQlAw+Xku7rvOF/Y2dJIdNPMyI
 Xz44TJQrSIoCOKOYaasQhwvdXF9ZuJDF4yLeTqoTL9N2Oo1p8HzJRUIv3vTH2/K4u9HB
 n+o7WoDM/lq2ylzBxqjwIl0VLQKV9/t5VD7ZyW8xxGoLyUVf7U27yMfBpQFJX1hiF0MT
 aoT/egt6c/DJc6v9M18TrlfPI01QBA3uXO9Ov3JNPaK/zJWprFB1NYFkTtGFsIg8h2sp
 yOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=9ywGJov6n/rBh2W5e4kQUqyLAk7InBfN0jJOKh4fUZk=;
 b=ZW5Iu6lloUVlH+YOMrGo5jA9mx4C+k/1+dHhSHEiXG104etp1O3A7NVkoazmdy33Fa
 R16+xANR6U/FEAF0okl4pzFxokEZrB7DyrxnnCwXeonkoXDUlegR7YnepRBJj8FmrVvf
 HEGQm6T86lCm/6iNEHew4iTHggY2FvcBbyaSbh97AuFzvMmAsCx6YU7sXtN6ez1aBh2T
 7+QU1i59kjie14C96ulPOSQogYuiplecOYFEKyuu1wU0bH7QlmWBIytSoU/9ivuBgTZD
 Ynt1J3Ey9UILJtcixVpdC5V9TweVpg61MOH+JrTsu7nyBSCOxLfTS6H1sqkBF0mRMMNO
 4vQw==
X-Gm-Message-State: ACgBeo2yk2oJiCjn8sSIBWVxOqccpT7KjLbI0sjJluRIbv9uTCx0ue1D
 RX8Brx/SezRnGLDcOsc5SrImTRRXVWQ=
X-Google-Smtp-Source: AA6agR6Y024/pUUmE8/msB8//mr2fjrFOicoiF7s+gLkw364IwxXaCs6bw+KZpvykqv1gM5UcXaM7Q==
X-Received: by 2002:a1f:d946:0:b0:378:188d:1bd with SMTP id
 q67-20020a1fd946000000b00378188d01bdmr512626vkg.21.1659546972196; 
 Wed, 03 Aug 2022 10:16:12 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 b25-20020ab06659000000b0038799595a89sm1593170uaq.37.2022.08.03.10.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 10:16:11 -0700 (PDT)
Message-ID: <5c55b1f1-625b-3a4d-84bd-cfc2e0532162@gmail.com>
Date: Wed, 3 Aug 2022 14:16:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 01/20] ppc/ppc405: Remove taihu machine
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-2-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220803132844.2370514-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 8/3/22 10:28, Cédric Le Goater wrote:
> It has been deprecated since 7.0.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   docs/about/deprecated.rst       |   9 --
>   docs/about/removed-features.rst |   6 +
>   docs/system/ppc/embedded.rst    |   1 -
>   hw/ppc/ppc405_boards.c          | 232 --------------------------------
>   MAINTAINERS                     |   2 +-
>   5 files changed, 7 insertions(+), 243 deletions(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 7ee26626d5cf..2f9b41aaea48 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -233,15 +233,6 @@ deprecated; use the new name ``dtb-randomness`` instead. The new name
>   better reflects the way this property affects all random data within
>   the device tree blob, not just the ``kaslr-seed`` node.
>   
> -PPC 405 ``taihu`` machine (since 7.0)
> -'''''''''''''''''''''''''''''''''''''
> -
> -The PPC 405 CPU is a system-on-a-chip, so all 405 machines are very similar,
> -except for some external periphery. However, the periphery of the ``taihu``
> -machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
> -been implemented), so there is not much value added by this board. Use the
> -``ref405ep`` machine instead.
> -
>   ``pc-i440fx-1.4`` up to ``pc-i440fx-1.7`` (since 7.0)
>   '''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index c7b9dadd5d63..8fad2f4d5e9b 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -661,6 +661,12 @@ Aspeed ``swift-bmc`` machine (removed in 7.0)
>   This machine was removed because it was unused. Alternative AST2500 based
>   OpenPOWER machines are ``witherspoon-bmc`` and ``romulus-bmc``.
>   
> +ppc ``taihu`` machine (removed in 7.2)
> +'''''''''''''''''''''''''''''''''''''''''''''
> +
> +This machine was removed because it was partially emulated and 405
> +machines are very similar. Use the ``ref405ep`` machine instead.
> +
>   linux-user mode CPUs
>   --------------------
>   
> diff --git a/docs/system/ppc/embedded.rst b/docs/system/ppc/embedded.rst
> index cfffbda24da9..af3b3d9fa460 100644
> --- a/docs/system/ppc/embedded.rst
> +++ b/docs/system/ppc/embedded.rst
> @@ -6,5 +6,4 @@ Embedded family boards
>   - ``ppce500``              generic paravirt e500 platform
>   - ``ref405ep``             ref405ep
>   - ``sam460ex``             aCube Sam460ex
> -- ``taihu``                taihu
>   - ``virtex-ml507``         Xilinx Virtex ML507 reference design
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index a66ad05e3ac3..1a4e7588c584 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -342,241 +342,9 @@ static const TypeInfo ref405ep_type = {
>       .class_init = ref405ep_class_init,
>   };
>   
> -/*****************************************************************************/
> -/* AMCC Taihu evaluation board */
> -/* - PowerPC 405EP processor
> - * - SDRAM               128 MB at 0x00000000
> - * - Boot flash          2 MB   at 0xFFE00000
> - * - Application flash   32 MB  at 0xFC000000
> - * - 2 serial ports
> - * - 2 ethernet PHY
> - * - 1 USB 1.1 device    0x50000000
> - * - 1 LCD display       0x50100000
> - * - 1 CPLD              0x50100000
> - * - 1 I2C EEPROM
> - * - 1 I2C thermal sensor
> - * - a set of LEDs
> - * - bit-bang SPI port using GPIOs
> - * - 1 EBC interface connector 0 0x50200000
> - * - 1 cardbus controller + expansion slot.
> - * - 1 PCI expansion slot.
> - */
> -typedef struct taihu_cpld_t taihu_cpld_t;
> -struct taihu_cpld_t {
> -    uint8_t reg0;
> -    uint8_t reg1;
> -};
> -
> -static uint64_t taihu_cpld_read(void *opaque, hwaddr addr, unsigned size)
> -{
> -    taihu_cpld_t *cpld;
> -    uint32_t ret;
> -
> -    cpld = opaque;
> -    switch (addr) {
> -    case 0x0:
> -        ret = cpld->reg0;
> -        break;
> -    case 0x1:
> -        ret = cpld->reg1;
> -        break;
> -    default:
> -        ret = 0;
> -        break;
> -    }
> -
> -    return ret;
> -}
> -
> -static void taihu_cpld_write(void *opaque, hwaddr addr,
> -                             uint64_t value, unsigned size)
> -{
> -    taihu_cpld_t *cpld;
> -
> -    cpld = opaque;
> -    switch (addr) {
> -    case 0x0:
> -        /* Read only */
> -        break;
> -    case 0x1:
> -        cpld->reg1 = value;
> -        break;
> -    default:
> -        break;
> -    }
> -}
> -
> -static const MemoryRegionOps taihu_cpld_ops = {
> -    .read = taihu_cpld_read,
> -    .write = taihu_cpld_write,
> -    .impl = {
> -        .min_access_size = 1,
> -        .max_access_size = 1,
> -    },
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> -};
> -
> -static void taihu_cpld_reset (void *opaque)
> -{
> -    taihu_cpld_t *cpld;
> -
> -    cpld = opaque;
> -    cpld->reg0 = 0x01;
> -    cpld->reg1 = 0x80;
> -}
> -
> -static void taihu_cpld_init(MemoryRegion *sysmem, uint32_t base)
> -{
> -    taihu_cpld_t *cpld;
> -    MemoryRegion *cpld_memory = g_new(MemoryRegion, 1);
> -
> -    cpld = g_new0(taihu_cpld_t, 1);
> -    memory_region_init_io(cpld_memory, NULL, &taihu_cpld_ops, cpld, "cpld", 0x100);
> -    memory_region_add_subregion(sysmem, base, cpld_memory);
> -    qemu_register_reset(&taihu_cpld_reset, cpld);
> -}
> -
> -static void taihu_405ep_init(MachineState *machine)
> -{
> -    MachineClass *mc = MACHINE_GET_CLASS(machine);
> -    const char *bios_name = machine->firmware ?: BIOS_FILENAME;
> -    const char *kernel_filename = machine->kernel_filename;
> -    const char *initrd_filename = machine->initrd_filename;
> -    char *filename;
> -    MemoryRegion *sysmem = get_system_memory();
> -    MemoryRegion *bios;
> -    MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
> -    hwaddr ram_bases[2], ram_sizes[2];
> -    long bios_size;
> -    target_ulong kernel_base, initrd_base;
> -    long kernel_size, initrd_size;
> -    int linux_boot;
> -    int fl_idx;
> -    DriveInfo *dinfo;
> -    DeviceState *uicdev;
> -
> -    if (machine->ram_size != mc->default_ram_size) {
> -        char *sz = size_to_str(mc->default_ram_size);
> -        error_report("Invalid RAM size, should be %s", sz);
> -        g_free(sz);
> -        exit(EXIT_FAILURE);
> -    }
> -
> -    ram_bases[0] = 0;
> -    ram_sizes[0] = 0x04000000;
> -    memory_region_init_alias(&ram_memories[0], NULL,
> -                             "taihu_405ep.ram-0", machine->ram, ram_bases[0],
> -                             ram_sizes[0]);
> -    ram_bases[1] = 0x04000000;
> -    ram_sizes[1] = 0x04000000;
> -    memory_region_init_alias(&ram_memories[1], NULL,
> -                             "taihu_405ep.ram-1", machine->ram, ram_bases[1],
> -                             ram_sizes[1]);
> -    ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
> -                  33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
> -    /* allocate and load BIOS */
> -    fl_idx = 0;
> -#if defined(USE_FLASH_BIOS)
> -    dinfo = drive_get(IF_PFLASH, 0, fl_idx);
> -    if (dinfo) {
> -        bios_size = 2 * MiB;
> -        pflash_cfi02_register(0xFFE00000,
> -                              "taihu_405ep.bios", bios_size,
> -                              blk_by_legacy_dinfo(dinfo),
> -                              64 * KiB, 1,
> -                              4, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, 0x2AA,
> -                              1);
> -        fl_idx++;
> -    } else
> -#endif
> -    {
> -        bios = g_new(MemoryRegion, 1);
> -        memory_region_init_rom(bios, NULL, "taihu_405ep.bios", BIOS_SIZE,
> -                               &error_fatal);
> -        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> -        if (filename) {
> -            bios_size = load_image_size(filename,
> -                                        memory_region_get_ram_ptr(bios),
> -                                        BIOS_SIZE);
> -            g_free(filename);
> -            if (bios_size < 0) {
> -                error_report("Could not load PowerPC BIOS '%s'", bios_name);
> -                exit(1);
> -            }
> -            bios_size = (bios_size + 0xfff) & ~0xfff;
> -            memory_region_add_subregion(sysmem, (uint32_t)(-bios_size), bios);
> -        } else if (!qtest_enabled()) {
> -            error_report("Could not load PowerPC BIOS '%s'", bios_name);
> -            exit(1);
> -        }
> -    }
> -    /* Register Linux flash */
> -    dinfo = drive_get(IF_PFLASH, 0, fl_idx);
> -    if (dinfo) {
> -        bios_size = 32 * MiB;
> -        pflash_cfi02_register(0xfc000000, "taihu_405ep.flash", bios_size,
> -                              blk_by_legacy_dinfo(dinfo),
> -                              64 * KiB, 1,
> -                              4, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, 0x2AA,
> -                              1);
> -        fl_idx++;
> -    }
> -    /* Register CLPD & LCD display */
> -    taihu_cpld_init(sysmem, 0x50100000);
> -    /* Load kernel */
> -    linux_boot = (kernel_filename != NULL);
> -    if (linux_boot) {
> -        kernel_base = KERNEL_LOAD_ADDR;
> -        /* now we can load the kernel */
> -        kernel_size = load_image_targphys(kernel_filename, kernel_base,
> -                                          machine->ram_size - kernel_base);
> -        if (kernel_size < 0) {
> -            error_report("could not load kernel '%s'", kernel_filename);
> -            exit(1);
> -        }
> -        /* load initrd */
> -        if (initrd_filename) {
> -            initrd_base = INITRD_LOAD_ADDR;
> -            initrd_size = load_image_targphys(initrd_filename, initrd_base,
> -                                              machine->ram_size - initrd_base);
> -            if (initrd_size < 0) {
> -                error_report("could not load initial ram disk '%s'",
> -                             initrd_filename);
> -                exit(1);
> -            }
> -        } else {
> -            initrd_base = 0;
> -            initrd_size = 0;
> -        }
> -    } else {
> -        kernel_base = 0;
> -        kernel_size = 0;
> -        initrd_base = 0;
> -        initrd_size = 0;
> -    }
> -}
> -
> -static void taihu_class_init(ObjectClass *oc, void *data)
> -{
> -    MachineClass *mc = MACHINE_CLASS(oc);
> -
> -    mc->desc = "taihu";
> -    mc->init = taihu_405ep_init;
> -    mc->default_ram_size = 0x08000000;
> -    mc->default_ram_id = "taihu_405ep.ram";
> -    mc->deprecation_reason = "incomplete, use 'ref405ep' instead";
> -}
> -
> -static const TypeInfo taihu_type = {
> -    .name = MACHINE_TYPE_NAME("taihu"),
> -    .parent = TYPE_MACHINE,
> -    .class_init = taihu_class_init,
> -};
> -
>   static void ppc405_machine_init(void)
>   {
>       type_register_static(&ref405ep_type);
> -    type_register_static(&taihu_type);
>   }
>   
>   type_init(ppc405_machine_init)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5ce4227ff650..1729c0901cea 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1282,7 +1282,7 @@ F: hw/openrisc/openrisc_sim.c
>   
>   PowerPC Machines
>   ----------------
> -405 (ref405ep and taihu)
> +405 (ref405ep)
>   L: qemu-ppc@nongnu.org
>   S: Orphan
>   F: hw/ppc/ppc405_boards.c

