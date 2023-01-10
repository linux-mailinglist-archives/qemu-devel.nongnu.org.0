Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9290C664EC0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 23:27:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFN4G-00045b-Py; Tue, 10 Jan 2023 17:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFN4E-00045F-Mg; Tue, 10 Jan 2023 17:26:02 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFN4C-0008RB-Vo; Tue, 10 Jan 2023 17:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tdadf0WiEUJFLoPhsmeJP8cGH/AUSB2Jw1S0yO8e+eo=; b=E5MpvIzMet9ufimTyeTGOnPkZC
 Ul62OsUCBg0FxTVtSBjXiiiwv4iCiQqdSg3nITvZbQDiTrb0owzrSmV56nvAbsZWx9B90jL2IWT5a
 QgaMyq97aLWVVa7sgf9Y6NAIi0DptIKogi/J2dOSShAXbciVtAdR8qWLYXZgKFyQ2NCbQBB3RngXd
 Q3SzOT9X/1FiMiHNZ2M61jALktr0EBI7KcyFDHxOrTwlQWSP2CsEZAvhQ24dWL1M7uGtdtl+bJGlE
 kJPfTyYP4Z+IUWUI8CXWTI05ll/EuT0DIQnvI3bCAHkUj0nUBuv+9ApQcIKb+lBFZj54y+Ht54by5
 9cqMbbGa6zWhMuRveGBJfanbXTZwdTw1d48YOSFBdZRBC6Fl0cyewuoBwS6Zp+BUAVeDCwlicNOCd
 t3QNYdsS7vq+1sQwXWNVPWpq99HpWbVVXWKwMaBmVX21izoFN6Tn+7ESF1yYHsLswq5mGQ+rmXEdc
 Rs+dWMRgUXQ2o9u7U4/mzrv8pnNAS33edAq9kI9RqLeKQscEgH6n+BjAxXYA9/dXire5dc5jUESjj
 80LAruVu9MPATWMOn+NKJ4YrDM+GIwzF+D4OgntPi28eVgJwyl6/6Ii5OmAfOPqrpDDiDylcAegQl
 Uq23wcTMKejo/9UhgzGzhMpqZbb5wGHtIGA2ugDVg=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFN3l-0008XY-EZ; Tue, 10 Jan 2023 22:25:37 +0000
Message-ID: <8e775600-f394-0e9c-9ee9-15dd635275e9@ilande.co.uk>
Date: Tue, 10 Jan 2023 22:25:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <e8d6aa41eeb0461d285fa4c12e0fff05d366e8fa.1672868854.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <e8d6aa41eeb0461d285fa4c12e0fff05d366e8fa.1672868854.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v7 3/7] mac_{old,new}world: Pass MacOS VGA NDRV in card
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04/01/2023 21:59, BALATON Zoltan wrote:

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
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 18 ++++++------------
>   hw/ppc/mac_oldworld.c | 18 ++++++------------
>   2 files changed, 12 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 460c14b5e3..60c9c27986 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -510,18 +510,6 @@ static void ppc_core99_init(MachineState *machine)
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
> @@ -565,6 +553,11 @@ static int core99_kvm_type(MachineState *machine, const char *arg)
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
> @@ -585,6 +578,7 @@ static void core99_machine_class_init(ObjectClass *oc, void *data)
>   #endif
>       mc->default_ram_id = "ppc_core99.ram";
>       mc->ignore_boot_device_suffixes = true;
> +    compat_props_add(mc->compat_props, props, G_N_ELEMENTS(props));
>       fwc->get_dev_path = core99_fw_dev_path;
>   }
>   
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 5a7b25a4a8..6a1b1ad47a 100644
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

The qemu_vga.ndrv is deliberately kept separate from the PCI option ROM because it is 
a binary generated by a separate project: otherwise you'd end up creating a 
dependency between OpenBIOS and QemuMacDrivers, which is almost impossible to achieve 
since qemu_vga.ndrv can only (currently) be built in an emulated MacOS 9 guest.

The best way to do this would be to extract the PCI config words from your ATI 
OpenBIOS patches and the alter drivers/vga.fs so that it only generates the 
driver,AAPL,MacOS,PowerPC property if the device id and vendor id match that of the 
QEMU VGA device.


ATB,

Mark.

