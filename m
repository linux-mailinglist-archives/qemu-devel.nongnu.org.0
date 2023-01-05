Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E5D65F0C7
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:06:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDSk4-0005pT-6b; Thu, 05 Jan 2023 11:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDSjv-0005pC-Pi; Thu, 05 Jan 2023 11:05:11 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDSjs-00047p-SB; Thu, 05 Jan 2023 11:05:11 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CE9D5749021;
 Thu,  5 Jan 2023 17:02:48 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8EF5574900C; Thu,  5 Jan 2023 17:02:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8D43D748131;
 Thu,  5 Jan 2023 17:02:48 +0100 (CET)
Date: Thu, 5 Jan 2023 17:02:48 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] hw/pci-host: Use register definitions from PCI
 standard
In-Reply-To: <20230105144142.51990-1-philmd@linaro.org>
Message-ID: <2489f6ef-997a-0cf5-fbdc-c05e4fb7c7fd@eik.bme.hu>
References: <20230105144142.51990-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-20947477-1672934568=:30257"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-20947477-1672934568=:30257
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 5 Jan 2023, Philippe Mathieu-Daudé wrote:
> No need to document magic values when the definition names
> from "standard-headers/linux/pci_regs.h" are self-explicit.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> hw/pci-host/grackle.c  |  2 +-
> hw/pci-host/raven.c    |  6 +++---
> hw/pci-host/uninorth.c | 30 +++++++++++-------------------
> 3 files changed, 15 insertions(+), 23 deletions(-)
>
> diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
> index 95945ac0f4..2a45cc13c3 100644
> --- a/hw/pci-host/grackle.c
> +++ b/hw/pci-host/grackle.c
> @@ -91,7 +91,7 @@ static void grackle_init(Object *obj)
>
> static void grackle_pci_realize(PCIDevice *d, Error **errp)
> {
> -    d->config[0x09] = 0x01;
> +    d->config[PCI_CLASS_PROG] = 0x01;
> }
>
> static void grackle_pci_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
> index 7a105e4a63..c47259a851 100644
> --- a/hw/pci-host/raven.c
> +++ b/hw/pci-host/raven.c
> @@ -329,9 +329,9 @@ static void raven_realize(PCIDevice *d, Error **errp)
>     char *filename;
>     int bios_size = -1;
>
> -    d->config[0x0C] = 0x08; // cache_line_size
> -    d->config[0x0D] = 0x10; // latency_timer
> -    d->config[0x34] = 0x00; // capabilities_pointer
> +    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
> +    d->config[PCI_LATENCY_TIMER] = 0x10;
> +    d->config[PCI_CAPABILITY_LIST] = 0x00;
>
>     memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_SIZE,
>                                      &error_fatal);
> diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
> index 8396c91d59..342baff12a 100644
> --- a/hw/pci-host/uninorth.c
> +++ b/hw/pci-host/uninorth.c
> @@ -277,11 +277,11 @@ static void pci_unin_internal_init(Object *obj)
> static void unin_main_pci_host_realize(PCIDevice *d, Error **errp)
> {
>     /* cache_line_size */
> -    d->config[0x0C] = 0x08;
> +    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
>     /* latency_timer */
> -    d->config[0x0D] = 0x10;
> +    d->config[PCI_LATENCY_TIMER] = 0x10;
>     /* capabilities_pointer */
> -    d->config[0x34] = 0x00;
> +    d->config[PCI_CAPABILITY_LIST] = 0x00;

Did you mean to remove the comments here as well?

Regards,
BALATON Zoltan

>     /*
>      * Set kMacRISCPCIAddressSelect (0x48) register to indicate PCI
> @@ -296,30 +296,22 @@ static void unin_main_pci_host_realize(PCIDevice *d, Error **errp)
>
> static void unin_agp_pci_host_realize(PCIDevice *d, Error **errp)
> {
> -    /* cache_line_size */
> -    d->config[0x0C] = 0x08;
> -    /* latency_timer */
> -    d->config[0x0D] = 0x10;
> -    /* capabilities_pointer
> -    d->config[0x34] = 0x80; */
> +    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
> +    d->config[PCI_LATENCY_TIMER] = 0x10;
> +    /* d->config[PCI_CAPABILITY_LIST] = 0x80; */
> }
>
> static void u3_agp_pci_host_realize(PCIDevice *d, Error **errp)
> {
> -    /* cache line size */
> -    d->config[0x0C] = 0x08;
> -    /* latency timer */
> -    d->config[0x0D] = 0x10;
> +    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
> +    d->config[PCI_LATENCY_TIMER] = 0x10;
> }
>
> static void unin_internal_pci_host_realize(PCIDevice *d, Error **errp)
> {
> -    /* cache_line_size */
> -    d->config[0x0C] = 0x08;
> -    /* latency_timer */
> -    d->config[0x0D] = 0x10;
> -    /* capabilities_pointer */
> -    d->config[0x34] = 0x00;
> +    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
> +    d->config[PCI_LATENCY_TIMER] = 0x10;
> +    d->config[PCI_CAPABILITY_LIST] = 0x00;
> }
>
> static void unin_main_pci_host_class_init(ObjectClass *klass, void *data)
>
--3866299591-20947477-1672934568=:30257--

