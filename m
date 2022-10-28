Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882A3610DB6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:52:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooM1I-0001IA-07; Fri, 28 Oct 2022 05:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooM1E-0001Hk-ND; Fri, 28 Oct 2022 05:51:17 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooM1C-0003WZ-4j; Fri, 28 Oct 2022 05:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5P7Hy0TJxkjAz/XNeVa7J9fD20GRpWf1yeUBkYZ0ib8=; b=WIMFtlhGH8mr+SB5d9B9uj725v
 u2q2kFVTa5TzuyK+plJg3GDNR1p0Bt0GpgogaEp/MMnv07SIFlhpCeRDxQNVZzym4u82bMmoaSmPu
 aPnr72iE0n7TwQHNAMB+gLfk2G16IsCAHgFncwaX9igsMt4A/Ai4bggTy8DkdRxmRiJVIANhrTTll
 ZoBYCYb77tGwI2o0W8FXZuMEpk0D6clapLHKuGRewmGuFby3WsrXkL6b+TegnDijYkdnLgLgogQnk
 J9rvMrF8v8Z+sFzWtCui72XXccJNbd6wpAWAsLYcyYuI+jpCNbrRZkKc4SDu+PT0B8z5gvQBPCNV6
 9pDZSDOUqmf3sQlOeVrZBgs/9Z4pMneVqPk2k6Q98c7Fw6+xNte42wqsIR79FXKfcd/letrogo1sH
 sb1oLUTu6MmG7syyCSh300F/aquvj8AfsD1mI8SWD01w8dSJm5usL7iv8rUJwyrnSxnFoAFH66UqC
 sbjbgymrCq2qn9SHLKGqIUQgAzFlv6D2L4RILxkQYRzi7uA+6mgdYazHm4PqWqzqfcMe11WXqa2Yo
 mD6B+DpkwKwhlSRIL87sqSltt+rJTr2PcBOvh8xsx8jpsnxTlFx0iApJ0BKgKLiG5NOBl52a9SlhY
 FLwjZNraz8dE+oG0f2heahcT7f0GCeyiOxF0ZbiS4=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooM13-0007Qa-AW; Fri, 28 Oct 2022 10:51:09 +0100
Message-ID: <d3bdb406-70d3-d60d-b481-7d88736a2e4b@ilande.co.uk>
Date: Fri, 28 Oct 2022 10:51:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1666715145.git.balaton@eik.bme.hu>
 <915b28547446c1fad749fbab2943b13e3a0d856b.1666733213.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <915b28547446c1fad749fbab2943b13e3a0d856b.1666733213.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v5 20/20] mac_{old, new}world: Pass MacOS VGA NDRV in card
 ROM instead of fw_cfg
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

On 25/10/2022 22:31, BALATON Zoltan wrote:

> OpenBIOS cannot run FCode ROMs yet but it can detect NDRV in VGA card
> ROM and add it to the device tree for MacOS. Pass the NDRV this way
> instead of via fw_cfg. This solves the problem with OpenBIOS also
> adding the NDRV to ati-vga which it does not work with. This does not
> need any changes to OpenBIOS as this NDRV ROM handling is already
> there but this patch also allows simplifying OpenBIOS later to remove
> the fw_cfg ndrv handling from the vga FCode and also drop the
> vga-ndrv? option which is not needed any more as users can disable the
> ndrv with -device VGA,romfile="" (or override it with their own NDRV
> or ROM). Once FCode support is implemented in OpenBIOS, the proper
> FCode ROM can be set the same way so this paves the way to remove some
> hacks.

This is not correct though: in a real option ROM the NDRV is included as part of the 
ROM payload and is not a standalone file. The IEEE-1275 PCI specification gives the 
correct format for an option ROM which at minimum contains a header, and likely some 
additional FCode.

Isn't the immediate problem here that the NDRV handling in OpenBIOS needs to be 
improved so that it can be disabled for particular VGA devices such as ATI?

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 18 ++++++------------
>   hw/ppc/mac_oldworld.c | 18 ++++++------------
>   2 files changed, 12 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index de4a7bae12..1d12bd85ed 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -526,18 +526,6 @@ static void ppc_core99_init(MachineState *machine)
>       fw_cfg_add_i32(fw_cfg, FW_CFG_PPC_BUSFREQ, BUSFREQ);
>       fw_cfg_add_i32(fw_cfg, FW_CFG_PPC_NVRAM_ADDR, nvram_addr);
>   
> -    /* MacOS NDRV VGA driver */
> -    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, NDRV_VGA_FILENAME);
> -    if (filename) {
> -        gchar *ndrv_file;
> -        gsize ndrv_size;
> -
> -        if (g_file_get_contents(filename, &ndrv_file, &ndrv_size, NULL)) {
> -            fw_cfg_add_file(fw_cfg, "ndrv/qemu_vga.ndrv", ndrv_file, ndrv_size);
> -        }
> -        g_free(filename);
> -    }
> -
>       qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
>   }
>   
> @@ -581,6 +569,11 @@ static int core99_kvm_type(MachineState *machine, const char *arg)
>       return 2;
>   }
>   
> +static GlobalProperty props[] = {
> +    /* MacOS NDRV VGA driver */
> +    { "VGA", "romfile", NDRV_VGA_FILENAME },
> +};
> +
>   static void core99_machine_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -601,6 +594,7 @@ static void core99_machine_class_init(ObjectClass *oc, void *data)
>   #endif
>       mc->default_ram_id = "ppc_core99.ram";
>       mc->ignore_boot_device_suffixes = true;
> +    compat_props_add(mc->compat_props, props, G_N_ELEMENTS(props));
>       fwc->get_dev_path = core99_fw_dev_path;
>   }
>   
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index eecc54da59..e7d35135d6 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -344,18 +344,6 @@ static void ppc_heathrow_init(MachineState *machine)
>       fw_cfg_add_i32(fw_cfg, FW_CFG_PPC_CLOCKFREQ, CLOCKFREQ);
>       fw_cfg_add_i32(fw_cfg, FW_CFG_PPC_BUSFREQ, BUSFREQ);
>   
> -    /* MacOS NDRV VGA driver */
> -    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, NDRV_VGA_FILENAME);
> -    if (filename) {
> -        gchar *ndrv_file;
> -        gsize ndrv_size;
> -
> -        if (g_file_get_contents(filename, &ndrv_file, &ndrv_size, NULL)) {
> -            fw_cfg_add_file(fw_cfg, "ndrv/qemu_vga.ndrv", ndrv_file, ndrv_size);
> -        }
> -        g_free(filename);
> -    }
> -
>       qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
>   }
>   
> @@ -400,6 +388,11 @@ static int heathrow_kvm_type(MachineState *machine, const char *arg)
>       return 2;
>   }
>   
> +static GlobalProperty props[] = {
> +    /* MacOS NDRV VGA driver */
> +    { "VGA", "romfile", NDRV_VGA_FILENAME },
> +};
> +
>   static void heathrow_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -420,6 +413,7 @@ static void heathrow_class_init(ObjectClass *oc, void *data)
>       mc->default_display = "std";
>       mc->ignore_boot_device_suffixes = true;
>       mc->default_ram_id = "ppc_heathrow.ram";
> +    compat_props_add(mc->compat_props, props, G_N_ELEMENTS(props));
>       fwc->get_dev_path = heathrow_fw_dev_path;
>   }
>   


ATB,

Mark.

