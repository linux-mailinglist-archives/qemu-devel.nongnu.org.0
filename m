Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3555347CD89
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 08:28:48 +0100 (CET)
Received: from localhost ([::1]:47994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzw3L-0000Kd-A0
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 02:28:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvM9-0001Ok-Iw; Wed, 22 Dec 2021 01:44:12 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:58993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvM7-000510-1B; Wed, 22 Dec 2021 01:44:08 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.228])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B9D782167F;
 Wed, 22 Dec 2021 06:44:03 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 07:44:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004a2c44463-1379-4fb3-80eb-4b541f5eecf9,
 22B606D71DB07679CF58DDA73D3573C2F131FB73) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <17de7e50-1683-1819-34e3-421881bbafc3@kaod.org>
Date: Wed, 22 Dec 2021 07:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/4] dma: Let st*_dma() take MemTxAttrs argument
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211218145111.1540114-1-philmd@redhat.com>
 <20211218145111.1540114-2-philmd@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211218145111.1540114-2-philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bc5cd8aa-fe40-4818-a154-f4356e052d91
X-Ovh-Tracer-Id: 14497931626522446721
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddthedguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
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
> Let devices specify transaction attributes when calling st*_dma().
> 
> Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   include/hw/pci/pci.h       |  3 ++-
>   include/hw/ppc/spapr_vio.h | 12 ++++++++----
>   include/sysemu/dma.h       | 10 ++++++----
>   hw/nvram/fw_cfg.c          |  4 ++--
>   4 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index a751ab5a75d..d07e9707b48 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -859,7 +859,8 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
>       static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
>                                           dma_addr_t addr, uint##_bits##_t val) \
>       {                                                                   \
> -        st##_s##_dma(pci_get_address_space(dev), addr, val);            \
> +        st##_s##_dma(pci_get_address_space(dev), addr, val, \
> +                     MEMTXATTRS_UNSPECIFIED); \
>       }
>   
>   PCI_DMA_DEFINE_LDST(ub, b, 8);
> diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
> index 5d2ea8e6656..e87f8e6f596 100644
> --- a/include/hw/ppc/spapr_vio.h
> +++ b/include/hw/ppc/spapr_vio.h
> @@ -118,10 +118,14 @@ static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t taddr,
>           H_DEST_PARM : H_SUCCESS;
>   }
>   
> -#define vio_stb(_dev, _addr, _val) (stb_dma(&(_dev)->as, (_addr), (_val)))
> -#define vio_sth(_dev, _addr, _val) (stw_be_dma(&(_dev)->as, (_addr), (_val)))
> -#define vio_stl(_dev, _addr, _val) (stl_be_dma(&(_dev)->as, (_addr), (_val)))
> -#define vio_stq(_dev, _addr, _val) (stq_be_dma(&(_dev)->as, (_addr), (_val)))
> +#define vio_stb(_dev, _addr, _val) \
> +        (stb_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
> +#define vio_sth(_dev, _addr, _val) \
> +        (stw_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
> +#define vio_stl(_dev, _addr, _val) \
> +        (stl_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
> +#define vio_stq(_dev, _addr, _val) \
> +        (stq_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
>   #define vio_ldq(_dev, _addr) (ldq_be_dma(&(_dev)->as, (_addr)))
>   
>   int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index 9f998edbea4..2a60d2c5d61 100644
> --- a/include/sysemu/dma.h
> +++ b/include/sysemu/dma.h
> @@ -250,10 +250,11 @@ static inline void dma_memory_unmap(AddressSpace *as,
>       }                                                                   \
>       static inline void st##_sname##_##_end##_dma(AddressSpace *as,      \
>                                                    dma_addr_t addr,       \
> -                                                 uint##_bits##_t val)   \
> +                                                 uint##_bits##_t val,   \
> +                                                 MemTxAttrs attrs)      \
>       {                                                                   \
>           val = cpu_to_##_end##_bits(val);                                \
> -        dma_memory_write(as, addr, &val, (_bits) / 8, MEMTXATTRS_UNSPECIFIED); \
> +        dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
>       }
>   
>   static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
> @@ -264,9 +265,10 @@ static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
>       return val;
>   }
>   
> -static inline void stb_dma(AddressSpace *as, dma_addr_t addr, uint8_t val)
> +static inline void stb_dma(AddressSpace *as, dma_addr_t addr,
> +                           uint8_t val, MemTxAttrs attrs)
>   {
> -    dma_memory_write(as, addr, &val, 1, MEMTXATTRS_UNSPECIFIED);
> +    dma_memory_write(as, addr, &val, 1, attrs);
>   }
>   
>   DEFINE_LDST_DMA(uw, w, 16, le);
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 9b91b15cb08..e5f3c981841 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -360,7 +360,7 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
>       if (dma_memory_read(s->dma_as, dma_addr,
>                           &dma, sizeof(dma), MEMTXATTRS_UNSPECIFIED)) {
>           stl_be_dma(s->dma_as, dma_addr + offsetof(FWCfgDmaAccess, control),
> -                   FW_CFG_DMA_CTL_ERROR);
> +                   FW_CFG_DMA_CTL_ERROR, MEMTXATTRS_UNSPECIFIED);
>           return;
>       }
>   
> @@ -446,7 +446,7 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
>       }
>   
>       stl_be_dma(s->dma_as, dma_addr + offsetof(FWCfgDmaAccess, control),
> -                dma.control);
> +                dma.control, MEMTXATTRS_UNSPECIFIED);
>   
>       trace_fw_cfg_read(s, 0);
>   }
> 


