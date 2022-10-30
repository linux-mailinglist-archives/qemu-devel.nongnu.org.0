Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394A2612D1F
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:01:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGLk-0005Hs-KY; Sun, 30 Oct 2022 18:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opGLi-0005HK-Cx; Sun, 30 Oct 2022 18:00:10 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opGLg-0007Lj-Hq; Sun, 30 Oct 2022 18:00:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uREOXVlorG0U3QNed8Kd6/1NYDboVhOD1tXcDQyJ22E=; b=ZyAzG2WfSkpvodJ37l2oGIrinp
 WdoNe1DogOsK3gKS1bTA5Oy0YgrC/qwHs+yMyS8uQfz3sWC3l+LGKitX0iYenAzWWasBRKb0RbkS1
 OfDZae0SlbXz4iJhx5MCzxcO5uCvZOr/lXT83Gj++PidDHHIDOSc/cWvUJXgRfb/pIcARwW6mZN21
 s4Yo69VikgUfN6tnI9fKgoftLX4L9QvvOEO6MYiXlvFHjHeTgRWLtqfuR8xK394A3kuwVL1fsgtVk
 9PZGVAigyRQvOij1ztQZEMvI1meNTok+2zLBu8AhTJLfcVrT8v6kXl7tVipQbDkNf9NEYFcq1fAoS
 zgBgGC4icKbznwEYYA7OX5GHK3lHT7kb+sW0OrEtjffUpRU5kT2ZgLBIDXdfcE0AD+V2o7l3lF8w9
 IjQ8iuYJkoBKdtPhyg1jlHqigdFZFfmbFRxRL5TOGPVNn7VHvEPjPKvF+EJ3yEWolsop6OnaQ0wZN
 eIG8WDf8nOfQOnHofCiRQqva3904vAYVjPOpoMsT0qopDgs5Ui4CMnh6GonJkcvJatf0qi15g4Oa6
 z1dPLglt0ZdnF5tKq7GtHZunmeufA+HDNjmUVcEIhCn6QAM6DAFenTMvdnzhwFkgUyiraFghpKrVu
 QMDaeH1cNybHWzxtLfx4LX2hyaUOWKQjOg+l/iH8g=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opGLT-0002qK-Uu; Sun, 30 Oct 2022 22:00:00 +0000
Message-ID: <5c3c02a8-5ff2-16ed-f5ec-03f5da750123@ilande.co.uk>
Date: Sun, 30 Oct 2022 21:59:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1666957578.git.balaton@eik.bme.hu>
 <8dac3515b29976a61dacda07752175d7531dca3c.1666957578.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <8dac3515b29976a61dacda07752175d7531dca3c.1666957578.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v6 04/19] mac_{old|new}world: Avoid else branch by setting
 default value
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/2022 12:56, BALATON Zoltan wrote:

> Several variables are set in if-else branches where the else branch
> can be removed by setting a default value at the variable declaration
> which leads to simlpler code that is easier to follow.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 19 ++++---------------
>   hw/ppc/mac_oldworld.c | 18 ++++--------------
>   2 files changed, 8 insertions(+), 29 deletions(-)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 6327694f85..6bc3bd19be 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -111,11 +111,11 @@ static void ppc_core99_init(MachineState *machine)
>       CPUPPCState *env = NULL;
>       char *filename;
>       IrqLines *openpic_irqs;
> -    int i, j, k, ppc_boot_device, machine_arch, bios_size;
> +    int i, j, k, ppc_boot_device, machine_arch, bios_size = -1;
>       const char *bios_name = machine->firmware ?: PROM_FILENAME;
>       MemoryRegion *bios = g_new(MemoryRegion, 1);
> -    hwaddr kernel_base, initrd_base, cmdline_base = 0;
> -    long kernel_size, initrd_size;
> +    hwaddr kernel_base = 0, initrd_base = 0, cmdline_base = 0;
> +    long kernel_size = 0, initrd_size = 0;
>       UNINHostState *uninorth_pci;
>       PCIBus *pci_bus;
>       PCIDevice *macio;
> @@ -165,8 +165,6 @@ static void ppc_core99_init(MachineState *machine)
>               bios_size = load_image_targphys(filename, PROM_BASE, PROM_SIZE);
>           }
>           g_free(filename);
> -    } else {
> -        bios_size = -1;
>       }
>       if (bios_size < 0 || bios_size > PROM_SIZE) {
>           error_report("could not load PowerPC bios '%s'", bios_name);
> @@ -174,15 +172,12 @@ static void ppc_core99_init(MachineState *machine)
>       }
>   
>       if (machine->kernel_filename) {
> -        int bswap_needed;
> +        int bswap_needed = 0;
>   
>   #ifdef BSWAP_NEEDED
>           bswap_needed = 1;
> -#else
> -        bswap_needed = 0;
>   #endif
>           kernel_base = KERNEL_LOAD_ADDR;
> -
>           kernel_size = load_elf(machine->kernel_filename, NULL,
>                                  translate_kernel_address, NULL, NULL, NULL,
>                                  NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
> @@ -212,16 +207,10 @@ static void ppc_core99_init(MachineState *machine)
>               }
>               cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
>           } else {
> -            initrd_base = 0;
> -            initrd_size = 0;
>               cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
>           }
>           ppc_boot_device = 'm';
>       } else {
> -        kernel_base = 0;
> -        kernel_size = 0;
> -        initrd_base = 0;
> -        initrd_size = 0;
>           ppc_boot_device = '\0';
>           /* We consider that NewWorld PowerMac never have any floppy drive
>            * For now, OHW cannot boot from the network.
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 5cabc410e7..cb67e44081 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -84,11 +84,11 @@ static void ppc_heathrow_init(MachineState *machine)
>       PowerPCCPU *cpu = NULL;
>       CPUPPCState *env = NULL;
>       char *filename;
> -    int i, bios_size;
> +    int i, bios_size = -1;
>       MemoryRegion *bios = g_new(MemoryRegion, 1);
>       uint64_t bios_addr;
> -    uint32_t kernel_base, initrd_base, cmdline_base = 0;
> -    int32_t kernel_size, initrd_size;
> +    uint32_t kernel_base = 0, initrd_base = 0, cmdline_base = 0;
> +    int32_t kernel_size = 0, initrd_size = 0;
>       PCIBus *pci_bus;
>       PCIDevice *macio;
>       MACIOIDEState *macio_ide;
> @@ -139,8 +139,6 @@ static void ppc_heathrow_init(MachineState *machine)
>               bios_addr = PROM_BASE;
>           }
>           g_free(filename);
> -    } else {
> -        bios_size = -1;
>       }
>       if (bios_size < 0 || bios_addr - PROM_BASE + bios_size > PROM_SIZE) {
>           error_report("could not load PowerPC bios '%s'", bios_name);
> @@ -148,12 +146,10 @@ static void ppc_heathrow_init(MachineState *machine)
>       }
>   
>       if (machine->kernel_filename) {
> -        int bswap_needed;
> +        int bswap_needed = 0;
>   
>   #ifdef BSWAP_NEEDED
>           bswap_needed = 1;
> -#else
> -        bswap_needed = 0;
>   #endif
>           kernel_base = KERNEL_LOAD_ADDR;
>           kernel_size = load_elf(machine->kernel_filename, NULL,
> @@ -186,16 +182,10 @@ static void ppc_heathrow_init(MachineState *machine)
>               }
>               cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
>           } else {
> -            initrd_base = 0;
> -            initrd_size = 0;
>               cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
>           }
>           ppc_boot_device = 'm';
>       } else {
> -        kernel_base = 0;
> -        kernel_size = 0;
> -        initrd_base = 0;
> -        initrd_size = 0;
>           ppc_boot_device = '\0';
>           for (i = 0; machine->boot_config.order[i] != '\0'; i++) {
>               /*

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

