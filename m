Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E36482F12
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 09:42:06 +0100 (CET)
Received: from localhost ([::1]:53136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Iuq-0001tp-9n
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 03:42:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4ItS-00013B-U9
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:40:38 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:56087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4ItQ-0001L5-O5
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:40:38 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.201])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 63903D526400;
 Mon,  3 Jan 2022 09:40:34 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 3 Jan
 2022 09:40:33 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002cbb3c7ad-b455-4d49-afc7-da8d3b606641,
 71ABFCEAB0EE88409933ED7B68EF8EFCD2601B88) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ef1465a3-27eb-83da-f925-4eb9e6dede78@kaod.org>
Date: Mon, 3 Jan 2022 09:40:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 16/17] pnv_phb4.c: do not set 'root-bus' as bus name
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
 <20211228193806.1198496-17-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211228193806.1198496-17-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 755f312a-af49-4ab2-8901-3334d0e70a62
X-Ovh-Tracer-Id: 13151073864155696096
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeftddguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/21 20:38, Daniel Henrique Barboza wrote:
> This change has the same motivation as the one done for pnv-phb3-root-bus
> buses previously. Defaulting every bus to 'root-bus' makes it impossible to attach
> root ports to specific buses and it doesn't allow for custom bus
> naming because we're ignoring the 'id' value when registering the root
> bus.
> 
> After this patch, creating pnv-phb4 devices with 'id' being set will
> result in the following qtree:
> 
> qemu-system-ppc64 -m 4G -machine powernv9,accel=tcg \
>     -device pnv-phb4,chip-id=0,index=0,id=pcie.0 \
>     -device pnv-phb4,chip-id=1,index=4,id=pcie.1
> 
> bus: main-system-bus
>    type System
>    dev: pnv-phb4, id "pcie.1"
>      index = 4 (0x4)
>      chip-id = 1 (0x1)
>      version = 704374636546 (0xa400000002)
>      device-id = 1217 (0x4c1)
>      x-config-reg-migration-enabled = true
>      bypass-iommu = false
>      bus: pcie.1
>        type pnv-phb4-root-bus
>    dev: pnv-phb4, id "pcie.0"
>      index = 0 (0x0)
>      chip-id = 0 (0x0)
>      version = 704374636546 (0xa400000002)
>      device-id = 1217 (0x4c1)
>      x-config-reg-migration-enabled = true
>      bypass-iommu = false
>      bus: pcie.0
>        type pnv-phb4-root-bus
> 
> And without setting any ids:
> 
> qemu-system-ppc64 -m 4G -machine powernv9,accel=tcg \
>     -device pnv-phb4,chip-id=0,index=0,id=pcie.0 \
>     -device pnv-phb4,chip-id=1,index=4,id=pcie.1
> 
> bus: main-system-bus
>    type System
>    dev: pnv-phb4, id ""
>      index = 4 (0x4)
>      chip-id = 1 (0x1)
>      version = 704374636546 (0xa400000002)
>      device-id = 1217 (0x4c1)
>      x-config-reg-migration-enabled = true
>      bypass-iommu = false
>      bus: pnv-phb4-root-bus.1
>        type pnv-phb4-root-bus
>    dev: pnv-phb4, id ""
>      index = 0 (0x0)
>      chip-id = 0 (0x0)
>      version = 704374636546 (0xa400000002)
>      device-id = 1217 (0x4c1)
>      x-config-reg-migration-enabled = true
>      bypass-iommu = false
>      bus: pnv-phb4-root-bus.0
>        type pnv-phb4-root-bus
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb4.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 7b53c12b7c..982a61ebc0 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1354,7 +1354,7 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       memory_region_init(&phb->pci_mmio, OBJECT(phb), name,
>                          PCI_MMIO_TOTAL_SIZE);
>   
> -    pci->bus = pci_register_root_bus(dev, "root-bus",
> +    pci->bus = pci_register_root_bus(dev, dev->id,
>                                        pnv_phb4_set_irq, pnv_phb4_map_irq, phb,
>                                        &phb->pci_mmio, &phb->pci_io,
>                                        0, 4, TYPE_PNV_PHB4_ROOT_BUS);
> 


