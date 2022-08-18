Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985EB5983FB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 15:21:52 +0200 (CEST)
Received: from localhost ([::1]:54154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOfT5-0008L8-8T
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 09:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oOfNA-0003S0-0D
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 09:15:44 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:37899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oOfN7-0008Vm-1A
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 09:15:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.107])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 41DF8211CD;
 Thu, 18 Aug 2022 13:15:28 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 18 Aug
 2022 15:15:26 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004deb33316-c558-44a5-814e-9dd65cf420cc,
 138D267EF392F478FDB2EE7689F651729D1C1BCC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <6e2e3120-93bb-1418-b494-9413acd15932@kaod.org>
Date: Thu, 18 Aug 2022 15:15:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 24/31] ppc4xx: Fix code style problems reported by
 checkpatch
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1660746880.git.balaton@eik.bme.hu>
 <62798fbe9c200da3e0c870601ed9162b1c3a50a5.1660746880.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <62798fbe9c200da3e0c870601ed9162b1c3a50a5.1660746880.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7daa7536-e31b-4cd6-967a-aaa7fce168df
X-Ovh-Tracer-Id: 4282923249559243683
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehledgfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/17/22 17:08, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/ppc/ppc405_uc.c     |  5 +++--
>   hw/ppc/ppc440_bamboo.c | 27 ++++++++++++++----------
>   hw/ppc/ppc440_uc.c     |  3 ++-
>   hw/ppc/ppc4xx_devs.c   | 48 +++++++++++++++++++++++-------------------
>   hw/ppc/ppc4xx_pci.c    | 31 +++++++++++++++++----------
>   5 files changed, 67 insertions(+), 47 deletions(-)
> 
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index d541134632..6296130936 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -540,10 +540,11 @@ static void ppc4xx_gpt_set_irqs(Ppc405GptState *gpt)
>   
>       mask = 0x00008000;
>       for (i = 0; i < 5; i++) {
> -        if (gpt->is & gpt->im & mask)
> +        if (gpt->is & gpt->im & mask) {
>               qemu_irq_raise(gpt->irqs[i]);
> -        else
> +        } else {
>               qemu_irq_lower(gpt->irqs[i]);
> +        }
>           mask = mask >> 1;
>       }
>   }
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index b14a9ef776..ea945a1c99 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -84,27 +84,30 @@ static int bamboo_load_device_tree(hwaddr addr,
>   
>       ret = qemu_fdt_setprop(fdt, "/memory", "reg", mem_reg_property,
>                              sizeof(mem_reg_property));
> -    if (ret < 0)
> +    if (ret < 0) {
>           fprintf(stderr, "couldn't set /memory/reg\n");
> -
> +    }
>       ret = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
>                                   initrd_base);
> -    if (ret < 0)
> +    if (ret < 0) {
>           fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
> -
> +    }
>       ret = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
>                                   (initrd_base + initrd_size));
> -    if (ret < 0)
> +    if (ret < 0) {
>           fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
> -
> +    }
>       ret = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
>                                     kernel_cmdline);
> -    if (ret < 0)
> +    if (ret < 0) {
>           fprintf(stderr, "couldn't set /chosen/bootargs\n");
> +    }
>   
> -    /* Copy data from the host device tree into the guest. Since the guest can
> +    /*
> +     * Copy data from the host device tree into the guest. Since the guest can
>        * directly access the timebase without host involvement, we must expose
> -     * the correct frequencies. */
> +     * the correct frequencies.
> +     */
>       if (kvm_enabled()) {
>           tb_freq = kvmppc_get_tbfreq();
>           clock_freq = kvmppc_get_clockfreq();
> @@ -246,8 +249,10 @@ static void bamboo_init(MachineState *machine)
>       if (pcibus) {
>           /* Register network interfaces. */
>           for (i = 0; i < nb_nics; i++) {
> -            /* There are no PCI NICs on the Bamboo board, but there are
> -             * PCI slots, so we can pick whatever default model we want. */
> +            /*
> +             * There are no PCI NICs on the Bamboo board, but there are
> +             * PCI slots, so we can pick whatever default model we want.
> +             */
>               pci_nic_init_nofail(&nd_table[i], pcibus, "e1000", NULL);
>           }
>       }
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index 11fdb88c22..53e981ddf4 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -1028,7 +1028,8 @@ void ppc4xx_dma_init(CPUPPCState *env, int dcr_base)
>   
>   /*****************************************************************************/
>   /* PCI Express controller */
> -/* FIXME: This is not complete and does not work, only implemented partially
> +/*
> + * FIXME: This is not complete and does not work, only implemented partially
>    * to allow firmware and guests to find an empty bus. Cards should use PCI.
>    */
>   #include "hw/pci/pcie_host.h"
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index 27ebbb2ffc..ce38ae65e6 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -65,12 +65,12 @@ enum {
>       SDRAM0_CFGDATA = 0x011,
>   };
>   
> -/* XXX: TOFIX: some patches have made this code become inconsistent:
> +/*
> + * XXX: TOFIX: some patches have made this code become inconsistent:
>    *      there are type inconsistencies, mixing hwaddr, target_ulong
>    *      and uint32_t
>    */
> -static uint32_t sdram_bcr (hwaddr ram_base,
> -                           hwaddr ram_size)
> +static uint32_t sdram_bcr(hwaddr ram_base, hwaddr ram_size)
>   {
>       uint32_t bcr;
>   
> @@ -113,16 +113,17 @@ static inline hwaddr sdram_base(uint32_t bcr)
>       return bcr & 0xFF800000;
>   }
>   
> -static target_ulong sdram_size (uint32_t bcr)
> +static target_ulong sdram_size(uint32_t bcr)
>   {
>       target_ulong size;
>       int sh;
>   
>       sh = (bcr >> 17) & 0x7;
> -    if (sh == 7)
> +    if (sh == 7) {
>           size = -1;
> -    else
> +    } else {
>           size = (4 * MiB) << sh;
> +    }
>   
>       return size;
>   }
> @@ -153,7 +154,7 @@ static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int i,
>       }
>   }
>   
> -static void sdram_map_bcr (ppc4xx_sdram_t *sdram)
> +static void sdram_map_bcr(ppc4xx_sdram_t *sdram)
>   {
>       int i;
>   
> @@ -167,7 +168,7 @@ static void sdram_map_bcr (ppc4xx_sdram_t *sdram)
>       }
>   }
>   
> -static void sdram_unmap_bcr (ppc4xx_sdram_t *sdram)
> +static void sdram_unmap_bcr(ppc4xx_sdram_t *sdram)
>   {
>       int i;
>   
> @@ -179,7 +180,7 @@ static void sdram_unmap_bcr (ppc4xx_sdram_t *sdram)
>       }
>   }
>   
> -static uint32_t dcr_read_sdram (void *opaque, int dcrn)
> +static uint32_t dcr_read_sdram(void *opaque, int dcrn)
>   {
>       ppc4xx_sdram_t *sdram;
>       uint32_t ret;
> @@ -247,7 +248,7 @@ static uint32_t dcr_read_sdram (void *opaque, int dcrn)
>       return ret;
>   }
>   
> -static void dcr_write_sdram (void *opaque, int dcrn, uint32_t val)
> +static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
>   {
>       ppc4xx_sdram_t *sdram;
>   
> @@ -280,10 +281,11 @@ static void dcr_write_sdram (void *opaque, int dcrn, uint32_t val)
>                   sdram_unmap_bcr(sdram);
>                   sdram->status |= 0x80000000;
>               }
> -            if (!(sdram->cfg & 0x40000000) && (val & 0x40000000))
> +            if (!(sdram->cfg & 0x40000000) && (val & 0x40000000)) {
>                   sdram->status |= 0x40000000;
> -            else if ((sdram->cfg & 0x40000000) && !(val & 0x40000000))
> +            } else if ((sdram->cfg & 0x40000000) && !(val & 0x40000000)) {
>                   sdram->status &= ~0x40000000;
> +            }
>               sdram->cfg = val;
>               break;
>           case 0x24: /* SDRAM_STATUS */
> @@ -315,10 +317,11 @@ static void dcr_write_sdram (void *opaque, int dcrn, uint32_t val)
>               break;
>           case 0x98: /* SDRAM_ECCESR */
>               val &= 0xFFF0F000;
> -            if (sdram->eccesr == 0 && val != 0)
> +            if (sdram->eccesr == 0 && val != 0) {
>                   qemu_irq_raise(sdram->irq);
> -            else if (sdram->eccesr != 0 && val == 0)
> +            } else if (sdram->eccesr != 0 && val == 0) {
>                   qemu_irq_lower(sdram->irq);
> +            }
>               sdram->eccesr = val;
>               break;
>           default: /* Error */
> @@ -328,7 +331,7 @@ static void dcr_write_sdram (void *opaque, int dcrn, uint32_t val)
>       }
>   }
>   
> -static void sdram_reset (void *opaque)
> +static void sdram_reset(void *opaque)
>   {
>       ppc4xx_sdram_t *sdram;
>   
> @@ -348,11 +351,11 @@ static void sdram_reset (void *opaque)
>       sdram->cfg = 0x00800000;
>   }
>   
> -void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq irq, int nbanks,
> -                        MemoryRegion *ram_memories,
> -                        hwaddr *ram_bases,
> -                        hwaddr *ram_sizes,
> -                        int do_init)
> +void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
> +                       MemoryRegion *ram_memories,
> +                       hwaddr *ram_bases,
> +                       hwaddr *ram_sizes,
> +                       int do_init)
>   {
>       ppc4xx_sdram_t *sdram;
>   
> @@ -371,8 +374,9 @@ void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq irq, int nbanks,
>                        sdram, &dcr_read_sdram, &dcr_write_sdram);
>       ppc_dcr_register(env, SDRAM0_CFGDATA,
>                        sdram, &dcr_read_sdram, &dcr_write_sdram);
> -    if (do_init)
> +    if (do_init) {
>           sdram_map_bcr(sdram);
> +    }
>   }
>   
>   /*
> @@ -429,7 +433,7 @@ void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>           }
>           error_report("at most %d bank%s of %s MiB each supported",
>                        nr_banks, nr_banks == 1 ? "" : "s", s->str);
> -        error_printf("Possible valid RAM size: %" PRIi64 " MiB \n",
> +        error_printf("Possible valid RAM size: %" PRIi64 " MiB\n",
>               used_size ? used_size / MiB : sdram_bank_sizes[i - 1] / MiB);
>   
>           g_string_free(s, true);
> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
> index 5df97e6d15..8642b96455 100644
> --- a/hw/ppc/ppc4xx_pci.c
> +++ b/hw/ppc/ppc4xx_pci.c
> @@ -16,8 +16,10 @@
>    * Authors: Hollis Blanchard <hollisb@us.ibm.com>
>    */
>   
> -/* This file implements emulation of the 32-bit PCI controller found in some
> - * 4xx SoCs, such as the 440EP. */
> +/*
> + * This file implements emulation of the 32-bit PCI controller found in some
> + * 4xx SoCs, such as the 440EP.
> + */
>   
>   #include "qemu/osdep.h"
>   #include "qemu/log.h"
> @@ -65,8 +67,10 @@ struct PPC4xxPCIState {
>   #define PCIC0_CFGADDR       0x0
>   #define PCIC0_CFGDATA       0x4
>   
> -/* PLB Memory Map (PMM) registers specify which PLB addresses are translated to
> - * PCI accesses. */
> +/*
> + * PLB Memory Map (PMM) registers specify which PLB addresses are translated to
> + * PCI accesses.
> + */
>   #define PCIL0_PMM0LA        0x0
>   #define PCIL0_PMM0MA        0x4
>   #define PCIL0_PMM0PCILA     0x8
> @@ -80,8 +84,10 @@ struct PPC4xxPCIState {
>   #define PCIL0_PMM2PCILA     0x28
>   #define PCIL0_PMM2PCIHA     0x2c
>   
> -/* PCI Target Map (PTM) registers specify which PCI addresses are translated to
> - * PLB accesses. */
> +/*
> + * PCI Target Map (PTM) registers specify which PCI addresses are translated to
> + * PLB accesses.
> + */
>   #define PCIL0_PTM1MS        0x30
>   #define PCIL0_PTM1LA        0x34
>   #define PCIL0_PTM2MS        0x38
> @@ -96,9 +102,10 @@ static void ppc4xx_pci_reg_write4(void *opaque, hwaddr offset,
>   {
>       struct PPC4xxPCIState *pci = opaque;
>   
> -    /* We ignore all target attempts at PCI configuration, effectively
> -     * assuming a bidirectional 1:1 mapping of PLB and PCI space. */
> -
> +    /*
> +     * We ignore all target attempts at PCI configuration, effectively
> +     * assuming a bidirectional 1:1 mapping of PLB and PCI space.
> +     */
>       switch (offset) {
>       case PCIL0_PMM0LA:
>           pci->pmm[0].la = value;
> @@ -243,8 +250,10 @@ static void ppc4xx_pci_reset(void *opaque)
>       memset(pci->ptm, 0, sizeof(pci->ptm));
>   }
>   
> -/* On Bamboo, all pins from each slot are tied to a single board IRQ. This
> - * may need further refactoring for other boards. */
> +/*
> + * On Bamboo, all pins from each slot are tied to a single board IRQ.
> + * This may need further refactoring for other boards.
> + */
>   static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)
>   {
>       int slot = PCI_SLOT(pci_dev->devfn);


