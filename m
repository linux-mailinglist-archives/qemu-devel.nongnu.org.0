Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1F1612199
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 10:50:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oohWV-00071S-Jp; Sat, 29 Oct 2022 04:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oohWS-0006zp-7O; Sat, 29 Oct 2022 04:48:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oohWQ-0006T2-Li; Sat, 29 Oct 2022 04:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KHh8jS5ixS2ZFulXCMzYwSdHZDLKUhyVqxCfXhpDGhc=; b=wyhkG8jEG8jqUqBog57w5QpOI0
 TAcQb7BxdH1K0T9z89p7CoenAmXc963uvt3616Iwl+6/URdBnh8vX/HZEAmmlLPbgQ9tl25Vj0dW4
 OBXwVH4NJxE+IjanOKKI/GqG94UpLdds9W2ippPFFpbwBzn7mHrUNnRAN7TliJs/OG1Nls/Keu7N2
 g2l/fId4PazaFCpne+AHVEv/mG0KBLdvrc1c4VP0rEoxVMYXgUVPbAIAy3gTF7guyZ5U8rVusQkrg
 bxJGGvDTdkzs3UouSBcPVbfg68uLLKS0J4x3IPDwhJYgfYhqXV1AiSmlR+q2hSXF5h0gt5nuZ07zG
 vT9wQtZCN6HfyaosJvxCN/fbd70LMrD1TYM62ZR2yyoEcsxCiAj1NX+v6fbkWGm5nY/htpjkS2oi1
 S9ENewISsBNY69xiSVZlzswGXXzbbEv0mMQLQt1kz2p7kspV2PjLCk74gXvP/k3W77GyPiVzKw08v
 VHc9nkBLI97JE0VVMZQjmoqeeAijf7wtTlEfaAMySQVPmDDGS5dsu6wxhyIBnXi0/sGsf+NuyzSHG
 NTbylHnkRilzGbt2FPEPnJwNtrzGBD4OqejghnyV7JeyIuHARAV6Ysl3XirAfDTBCOtc3xymZzTho
 QX66Pm+c0uqYMXNTiSg4nVG7jsBjT4TWUnrfTcR7U=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oohWG-0008N7-Dd; Sat, 29 Oct 2022 09:48:48 +0100
Message-ID: <e2f298bc-d876-0089-8934-0b2061a1e46e@ilande.co.uk>
Date: Sat, 29 Oct 2022 09:48:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1666957578.git.balaton@eik.bme.hu>
 <ab891af01894bc01df0df78247da00fef4f59242.1666957578.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <ab891af01894bc01df0df78247da00fef4f59242.1666957578.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v6 13/19] mac_{old|new}world: Code style fix adding
 missing braces to if-s
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

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 6 ++++--
>   hw/ppc/mac_oldworld.c | 9 ++++++---
>   2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 6b2d781dea..37123daa6b 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -202,14 +202,16 @@ static void ppc_core99_init(MachineState *machine)
>           kernel_size = load_elf(machine->kernel_filename, NULL,
>                                  translate_kernel_address, NULL, NULL, NULL,
>                                  NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
> -        if (kernel_size < 0)
> +        if (kernel_size < 0) {
>               kernel_size = load_aout(machine->kernel_filename, kernel_base,
>                                       machine->ram_size - kernel_base,
>                                       bswap_needed, TARGET_PAGE_SIZE);
> -        if (kernel_size < 0)
> +        }
> +        if (kernel_size < 0) {
>               kernel_size = load_image_targphys(machine->kernel_filename,
>                                                 kernel_base,
>                                                 machine->ram_size - kernel_base);
> +        }
>           if (kernel_size < 0) {
>               error_report("could not load kernel '%s'",
>                            machine->kernel_filename);
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 23d9268281..558c639202 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -160,14 +160,16 @@ static void ppc_heathrow_init(MachineState *machine)
>           kernel_size = load_elf(machine->kernel_filename, NULL,
>                                  translate_kernel_address, NULL, NULL, NULL,
>                                  NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
> -        if (kernel_size < 0)
> +        if (kernel_size < 0) {
>               kernel_size = load_aout(machine->kernel_filename, kernel_base,
>                                       machine->ram_size - kernel_base,
>                                       bswap_needed, TARGET_PAGE_SIZE);
> -        if (kernel_size < 0)
> +        }
> +        if (kernel_size < 0) {
>               kernel_size = load_image_targphys(machine->kernel_filename,
>                                                 kernel_base,
>                                                 machine->ram_size - kernel_base);
> +        }
>           if (kernel_size < 0) {
>               error_report("could not load kernel '%s'",
>                            machine->kernel_filename);
> @@ -291,8 +293,9 @@ static void ppc_heathrow_init(MachineState *machine)
>           pci_create_simple(pci_bus, -1, "pci-ohci");
>       }
>   
> -    if (graphic_depth != 15 && graphic_depth != 32 && graphic_depth != 8)
> +    if (graphic_depth != 15 && graphic_depth != 32 && graphic_depth != 8) {
>           graphic_depth = 15;
> +    }
>   
>       /* No PCI init: the BIOS will do it */
>   

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

