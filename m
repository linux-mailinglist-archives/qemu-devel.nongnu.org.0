Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E9E5EEEBC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 09:18:47 +0200 (CEST)
Received: from localhost ([::1]:60880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odnok-0006xZ-II
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 03:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odngE-0000oL-B5; Thu, 29 Sep 2022 03:10:01 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odngC-0003Ep-Ng; Thu, 29 Sep 2022 03:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6CdndAavSuGjHgdolDE6ydBIatLYzQbZNNad7qSlge8=; b=IlDDMdMttgqIGeo0exJVE4YHIj
 TW+lFLspas0i8qK1F4iNLXze/KNMM43/tGr2ovZp+kTDSVGarvPhueoFxWJzhqivsyBq6lEy6UeM1
 JDrQnqHky25XORmFQZO+uerLyvYyzqYdaUpT8YgFKe0dh6JU99yTE8VFgvgB8AG2gfovDXgb/Z0v5
 FDwXEcfWZchINufFLf7brH56mHELgzQwaVNfyxdfATv75NG/slCBnxhT6jbOpGmN9u8uG8JQ/H4tf
 WLZgs6oMku63fWJfzLBeYt89y4zDQrKFIx0l0qmm0krzl7FZmA4E6vFgC19ws6xfnObMi0MAQUJIo
 hqRfyM34CNYIobLA3r8nvaESt29c6WoA1p7RsUPI6FWmdTKNQ3xWYNb4dIs+qK7k0m6F+HiB3AU+4
 eXFvPE6p0M8L17Avsy0r1ZTkS6u2a1owXeO9S7wEn+r1OOIkrGtjviazziE/GSenZ58pqVwfs5yBR
 Ev5CxHR5j1ElsTKPAPylpdHGObOphJh7qiWZVb6nsFmsKotCDNthQ6XFQj5OtDx4UojgArbFaeg1T
 BkxSh+uOX81jER8rKmtFpi9tiA5ijoGckAl3tnZvJHQRmMaAmFO2ZXvZSoFZ3KmCiYU8J1EKBVmEo
 OwKQ1CjN+fdMUKuBh4V5prM/I45egXw9QBz8rncqk=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odneR-000BZY-KJ; Thu, 29 Sep 2022 08:08:11 +0100
Message-ID: <e1d901cc-2330-f800-d7f5-8f6c2a39ab6b@ilande.co.uk>
Date: Thu, 29 Sep 2022 08:09:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1664108862.git.balaton@eik.bme.hu>
 <b2ce87d54a591223cc7eb5855f8f14bc1b802c81.1664108862.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <b2ce87d54a591223cc7eb5855f8f14bc1b802c81.1664108862.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 03/13] mac_{old|new}world: Set tbfreq at declaration
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/09/2022 13:38, BALATON Zoltan wrote:

> The tbfreq variable is only set once in an if-else which can be done
> at the variable declaration saving some lines of code and making it
> simpler.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 9 +--------
>   hw/ppc/mac_oldworld.c | 9 +--------
>   2 files changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 27e4e8d136..6327694f85 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -130,7 +130,7 @@ static void ppc_core99_init(MachineState *machine)
>       DeviceState *dev, *pic_dev;
>       DeviceState *uninorth_internal_dev = NULL, *uninorth_agp_dev = NULL;
>       hwaddr nvram_addr = 0xFFF04000;
> -    uint64_t tbfreq;
> +    uint64_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq() : TBFREQ;
>   
>       /* init CPUs */
>       for (i = 0; i < machine->smp.cpus; i++) {
> @@ -343,13 +343,6 @@ static void ppc_core99_init(MachineState *machine)
>       has_adb = (core99_machine->via_config == CORE99_VIA_CONFIG_CUDA ||
>                  core99_machine->via_config == CORE99_VIA_CONFIG_PMU_ADB);
>   
> -    /* Timebase Frequency */
> -    if (kvm_enabled()) {
> -        tbfreq = kvmppc_get_tbfreq();
> -    } else {
> -        tbfreq = TBFREQ;
> -    }
> -
>       /* init basic PC hardware */
>       pci_bus = PCI_HOST_BRIDGE(uninorth_pci)->bus;
>   
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 86512d31ad..5cabc410e7 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -99,7 +99,7 @@ static void ppc_heathrow_init(MachineState *machine)
>       uint16_t ppc_boot_device;
>       DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
>       void *fw_cfg;
> -    uint64_t tbfreq;
> +    uint64_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq() : TBFREQ;
>   
>       /* init CPUs */
>       for (i = 0; i < machine->smp.cpus; i++) {
> @@ -223,13 +223,6 @@ static void ppc_heathrow_init(MachineState *machine)
>           }
>       }
>   
> -    /* Timebase Frequency */
> -    if (kvm_enabled()) {
> -        tbfreq = kvmppc_get_tbfreq();
> -    } else {
> -        tbfreq = TBFREQ;
> -    }
> -
>       /* Grackle PCI host bridge */
>       grackle_dev = qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
>       qdev_prop_set_uint32(grackle_dev, "ofw-addr", 0x80000000);

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

