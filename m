Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EB6482F02
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 09:27:40 +0100 (CET)
Received: from localhost ([::1]:36076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Igt-0007gW-O1
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 03:27:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4Ieo-00062a-5K
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:25:30 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:57647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4Iel-0005lS-Sk
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:25:29 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.194])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5127920698;
 Mon,  3 Jan 2022 08:25:24 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 3 Jan
 2022 09:25:24 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004338f250e-09f0-48d8-9ad1-e9f229aac205,
 71ABFCEAB0EE88409933ED7B68EF8EFCD2601B88) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0a0b7ad2-b8ef-44bb-7d41-f977666202a9@kaod.org>
Date: Mon, 3 Jan 2022 09:25:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 02/17] pnv_phb3.c: do not set 'root-bus' as bus name
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
 <20211228193806.1198496-3-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211228193806.1198496-3-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0603b317-3cbf-461b-9d2f-f84dc55eb6c1
X-Ovh-Tracer-Id: 12895213108514556896
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeftddguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 12/28/21 20:37, Daniel Henrique Barboza wrote:
> All pnv-phb3-root-bus buses are being created as 'root-bus'. This
> makes it impossible to, for example, add a pnv-phb3-root-port in
> a specific root bus, since they all have the same name. By default
> the device will be parented by the pnv-phb3 device that precedeced it in
> the QEMU command line.
> 
> Moreover, this doesn't all for custom bus naming. Libvirt, for instance,
> likes to name these buses as 'pcie.N', where 'N' is the index value of
> the controller in the domain XML, by using the 'id' command line
> attribute. At this moment this is also being ignored - the created root
> bus will always be named 'root-bus'.
> 
> This patch fixes both scenarios by removing the 'root-bus' name from the
> pci_register_root_bus() call. If an "id" is provided, use that.
> Otherwise use 'NULL' as bus name. The 'NULL' value will be handled in
> qbus_init_internal() and it will defaulted as lowercase bus type + the
> global bus_id value.
> 
> After this path we can define the bus name by using the 'id' attribute:
> 
> qemu-system-ppc64 -m 4G -machine powernv8,accel=tcg \
>      -device pnv-phb3,chip-id=0,index=1,id=pcie.0
> 
>    dev: pnv-phb3, id "pcie.0"
>      index = 1 (0x1)
>      chip-id = 0 (0x0)
>      x-config-reg-migration-enabled = true
>      bypass-iommu = false
>      bus: pcie.0
>        type pnv-phb3-root-bus
> 
> And without an 'id' we will have the following default:
> 
> qemu-system-ppc64 -m 4G -machine powernv8,accel=tcg \
>      -device pnv-phb3,chip-id=0,index=1
> 
>    dev: pnv-phb3, id ""
>      index = 1 (0x1)
>      chip-id = 0 (0x0)
>      x-config-reg-migration-enabled = true
>      bypass-iommu = false
>      bus: pnv-phb3-root-bus.0
>        type pnv-phb3-root-bus
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb3.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 130d392b3e..f1b1f109a3 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1064,7 +1064,8 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>       memory_region_init(&phb->pci_mmio, OBJECT(phb), "pci-mmio",
>                          PCI_MMIO_TOTAL_SIZE);
>   
> -    pci->bus = pci_register_root_bus(dev, "root-bus",
> +    pci->bus = pci_register_root_bus(dev,
> +                                     dev->id ? dev->id : NULL,
>                                        pnv_phb3_set_irq, pnv_phb3_map_irq, phb,
>                                        &phb->pci_mmio, &phb->pci_io,
>                                        0, 4, TYPE_PNV_PHB3_ROOT_BUS);
> 


