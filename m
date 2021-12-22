Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB6147CD42
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 08:07:28 +0100 (CET)
Received: from localhost ([::1]:55554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzvih-0002Sj-Jp
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 02:07:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mzvMD-0001P4-BQ
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 01:44:14 -0500
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:34829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mzvMA-00051R-1G
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 01:44:12 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.141])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D00A2217E2;
 Wed, 22 Dec 2021 06:44:07 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 07:44:07 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0043e054e19-c688-491d-9b33-2ddddd3f5fa4,
 22B606D71DB07679CF58DDA73D3573C2F131FB73) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <67270efb-1110-4439-13d7-49be94730c17@kaod.org>
Date: Wed, 22 Dec 2021 07:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/4] dma: Let ld*_dma() take MemTxAttrs argument
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211218145111.1540114-1-philmd@redhat.com>
 <20211218145111.1540114-3-philmd@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211218145111.1540114-3-philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fdccafbb-b798-48ba-9b14-f90ffbe4f6c6
X-Ovh-Tracer-Id: 14499057528847240065
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddthedguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/21 15:51, Philippe Mathieu-Daudé wrote:
> Let devices specify transaction attributes when calling ld*_dma().
> 
> Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   include/hw/pci/pci.h       |  3 ++-
>   include/hw/ppc/spapr_vio.h |  3 ++-
>   include/sysemu/dma.h       | 11 ++++++-----
>   hw/intc/pnv_xive.c         |  7 ++++---
>   hw/usb/hcd-xhci.c          |  6 +++---
>   5 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index d07e9707b48..0613308b1b6 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -854,7 +854,8 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
>       static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,      \
>                                                      dma_addr_t addr)     \
>       {                                                                   \
> -        return ld##_l##_dma(pci_get_address_space(dev), addr);          \
> +        return ld##_l##_dma(pci_get_address_space(dev), addr,           \
> +                            MEMTXATTRS_UNSPECIFIED);                    \
>       }                                                                   \
>       static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
>                                           dma_addr_t addr, uint##_bits##_t val) \
> diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
> index e87f8e6f596..d2ec9b0637f 100644
> --- a/include/hw/ppc/spapr_vio.h
> +++ b/include/hw/ppc/spapr_vio.h
> @@ -126,7 +126,8 @@ static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t taddr,
>           (stl_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
>   #define vio_stq(_dev, _addr, _val) \
>           (stq_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
> -#define vio_ldq(_dev, _addr) (ldq_be_dma(&(_dev)->as, (_addr)))
> +#define vio_ldq(_dev, _addr) \
> +        (ldq_be_dma(&(_dev)->as, (_addr), MEMTXATTRS_UNSPECIFIED))
>   
>   int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
>   
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index 2a60d2c5d61..b711d390a4f 100644
> --- a/include/sysemu/dma.h
> +++ b/include/sysemu/dma.h
> @@ -242,10 +242,11 @@ static inline void dma_memory_unmap(AddressSpace *as,
>   
>   #define DEFINE_LDST_DMA(_lname, _sname, _bits, _end) \
>       static inline uint##_bits##_t ld##_lname##_##_end##_dma(AddressSpace *as, \
> -                                                            dma_addr_t addr) \
> +                                                            dma_addr_t addr, \
> +                                                            MemTxAttrs attrs) \
>       {                                                                   \
>           uint##_bits##_t val;                                            \
> -        dma_memory_read(as, addr, &val, (_bits) / 8, MEMTXATTRS_UNSPECIFIED); \
> +        dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
>           return _end##_bits##_to_cpu(val);                               \
>       }                                                                   \
>       static inline void st##_sname##_##_end##_dma(AddressSpace *as,      \
> @@ -254,14 +255,14 @@ static inline void dma_memory_unmap(AddressSpace *as,
>                                                    MemTxAttrs attrs)      \
>       {                                                                   \
>           val = cpu_to_##_end##_bits(val);                                \
> -        dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
> +        dma_memory_write(as, addr, &val, (_bits) / 8, attrs);           \
>       }
>   
> -static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
> +static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAttrs attrs)
>   {
>       uint8_t val;
>   
> -    dma_memory_read(as, addr, &val, 1, MEMTXATTRS_UNSPECIFIED);
> +    dma_memory_read(as, addr, &val, 1, attrs);
>       return val;
>   }
>   
> diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
> index ad43483612e..d9249bbc0c1 100644
> --- a/hw/intc/pnv_xive.c
> +++ b/hw/intc/pnv_xive.c
> @@ -172,7 +172,7 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xive, uint32_t type,
>   
>       /* Get the page size of the indirect table. */
>       vsd_addr = vsd & VSD_ADDRESS_MASK;
> -    vsd = ldq_be_dma(&address_space_memory, vsd_addr);
> +    vsd = ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPECIFIED);
>   
>       if (!(vsd & VSD_ADDRESS_MASK)) {
>   #ifdef XIVE_DEBUG
> @@ -195,7 +195,8 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xive, uint32_t type,
>       /* Load the VSD we are looking for, if not already done */
>       if (vsd_idx) {
>           vsd_addr = vsd_addr + vsd_idx * XIVE_VSD_SIZE;
> -        vsd = ldq_be_dma(&address_space_memory, vsd_addr);
> +        vsd = ldq_be_dma(&address_space_memory, vsd_addr,
> +                         MEMTXATTRS_UNSPECIFIED);
>   
>           if (!(vsd & VSD_ADDRESS_MASK)) {
>   #ifdef XIVE_DEBUG
> @@ -542,7 +543,7 @@ static uint64_t pnv_xive_vst_per_subpage(PnvXive *xive, uint32_t type)
>   
>       /* Get the page size of the indirect table. */
>       vsd_addr = vsd & VSD_ADDRESS_MASK;
> -    vsd = ldq_be_dma(&address_space_memory, vsd_addr);
> +    vsd = ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPECIFIED);
>   
>       if (!(vsd & VSD_ADDRESS_MASK)) {
>   #ifdef XIVE_DEBUG
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index ed2b9ea456e..d960b814587 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -2062,7 +2062,7 @@ static TRBCCode xhci_address_slot(XHCIState *xhci, unsigned int slotid,
>       assert(slotid >= 1 && slotid <= xhci->numslots);
>   
>       dcbaap = xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
> -    poctx = ldq_le_dma(xhci->as, dcbaap + 8 * slotid);
> +    poctx = ldq_le_dma(xhci->as, dcbaap + 8 * slotid, MEMTXATTRS_UNSPECIFIED);
>       ictx = xhci_mask64(pictx);
>       octx = xhci_mask64(poctx);
>   
> @@ -3437,8 +3437,8 @@ static int usb_xhci_post_load(void *opaque, int version_id)
>           if (!slot->addressed) {
>               continue;
>           }
> -        slot->ctx =
> -            xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * slotid));
> +        slot->ctx = xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * slotid,
> +                                           MEMTXATTRS_UNSPECIFIED));
>           xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx));
>           slot->uport = xhci_lookup_uport(xhci, slot_ctx);
>           if (!slot->uport) {
> 


