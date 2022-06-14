Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3712154ADE3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 12:05:11 +0200 (CEST)
Received: from localhost ([::1]:33230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o13Q6-00039Q-9l
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 06:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o13Eh-0001pv-A2
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 05:53:25 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:51567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o13Ee-0002ZD-Al
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 05:53:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 8171824FA9;
 Tue, 14 Jun 2022 09:53:17 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 14 Jun
 2022 11:53:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005b1e0471b-d643-4fd8-b1d0-2d34b05a8737,
 13435030B24A8B4E4D84E163F0172F78FE8A39D7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9ab21213-5a2b-2643-8b31-92fadf10b4dc@kaod.org>
Date: Tue, 14 Jun 2022 11:53:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 02/11] ppc/pnv: attach phb3/phb4 root ports in QOM tree
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, Daniel Henrique Barboza
 <danielhb@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <mark.cave-ayland@ilande.co.uk>
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-3-danielhb@linux.ibm.com>
 <a4293bb3-a069-867e-2714-66a6ef4efb65@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <a4293bb3-a069-867e-2714-66a6ef4efb65@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 23ac74cb-b4d2-4cde-8c32-b330f28d9578
X-Ovh-Tracer-Id: 6524871437986532259
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudduledgvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehmrghrkhdrtggrvhgvqdgrhihlrghnugesihhlrghnuggvrdgtohdruhhkpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/14/22 11:09, Frederic Barrat wrote:
> 
> 
> On 13/06/2022 17:44, Daniel Henrique Barboza wrote:
>> At this moment we leave the pnv-phb3(4)-root-port unattached in QOM:
>>
>>    /unattached (container)
>> (...)
>>      /device[2] (pnv-phb3-root-port)
>>        /bus master container[0] (memory-region)
>>        /bus master[0] (memory-region)
>>        /pci_bridge_io[0] (memory-region)
>>        /pci_bridge_io[1] (memory-region)
>>        /pci_bridge_mem[0] (memory-region)
>>        /pci_bridge_pci[0] (memory-region)
>>        /pci_bridge_pref_mem[0] (memory-region)
>>        /pci_bridge_vga_io_hi[0] (memory-region)
>>        /pci_bridge_vga_io_lo[0] (memory-region)
>>        /pci_bridge_vga_mem[0] (memory-region)
>>        /pcie.0 (PCIE)
>>
>> Let's make changes in pnv_phb_attach_root_port() to attach the created
>> root ports to its corresponding PHB.
>>
>> This is the result afterwards:
>>
>>      /pnv-phb3[0] (pnv-phb3)
>>        /lsi (ics)
>>        /msi (phb3-msi)
>>        /msi32[0] (memory-region)
>>        /msi64[0] (memory-region)
>>        /pbcq (pnv-pbcq)
>>      (...)
>>        /phb3_iommu[0] (pnv-phb3-iommu-memory-region)
>>        /pnv-phb3-root.0 (pnv-phb3-root)
>>          /pnv-phb3-root-port[0] (pnv-phb3-root-port)
>>            /bus master container[0] (memory-region)
>>            /bus master[0] (memory-region)
>>            /pci_bridge_io[0] (memory-region)
>>            /pci_bridge_io[1] (memory-region)
>>            /pci_bridge_mem[0] (memory-region)
>>            /pci_bridge_pci[0] (memory-region)
>>            /pci_bridge_pref_mem[0] (memory-region)
>>            /pci_bridge_vga_io_hi[0] (memory-region)
>>            /pci_bridge_vga_io_lo[0] (memory-region)
>>            /pci_bridge_vga_mem[0] (memory-region)
>>            /pcie.0 (PCIE)
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
>> ---
> 
> 
> I've always wondered if there was a good reason to have them detached. Glad to see there was none :-)

Wasn't it for libvirt integration ?

C.


> 
> Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
> 
>    Fred
> 
> 
>>   hw/pci-host/pnv_phb3.c | 2 +-
>>   hw/pci-host/pnv_phb4.c | 2 +-
>>   hw/ppc/pnv.c           | 7 ++++++-
>>   include/hw/ppc/pnv.h   | 2 +-
>>   4 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
>> index 26ac9b7123..4ba660f8b9 100644
>> --- a/hw/pci-host/pnv_phb3.c
>> +++ b/hw/pci-host/pnv_phb3.c
>> @@ -1052,7 +1052,7 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>>       pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
>> -    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), TYPE_PNV_PHB3_ROOT_PORT);
>> +    pnv_phb_attach_root_port(pci, TYPE_PNV_PHB3_ROOT_PORT, phb->phb_id);
>>   }
>>   void pnv_phb3_update_regions(PnvPHB3 *phb)
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index 23ad8de7ee..ffd9d8a947 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -1585,7 +1585,7 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>>       pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>>       /* Add a single Root port if running with defaults */
>> -    pnv_phb_attach_root_port(pci, pecc->rp_model);
>> +    pnv_phb_attach_root_port(pci, pecc->rp_model, phb->phb_id);
>>       /* Setup XIVE Source */
>>       if (phb->big_phb) {
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 7c08a78d6c..40e0cbd84d 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -1190,9 +1190,14 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
>>   }
>>   /* Attach a root port device */
>> -void pnv_phb_attach_root_port(PCIHostState *pci, const char *name)
>> +void pnv_phb_attach_root_port(PCIHostState *pci, const char *name, int index)
>>   {
>>       PCIDevice *root = pci_new(PCI_DEVFN(0, 0), name);
>> +    g_autofree char *default_id = g_strdup_printf("%s[%d]", name, index);
>> +    const char *dev_id = DEVICE(root)->id;
>> +
>> +    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
>> +                              OBJECT(root));
>>       pci_realize_and_unref(root, pci->bus, &error_fatal);
>>   }
>> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
>> index 86cb7d7f97..033890a23f 100644
>> --- a/include/hw/ppc/pnv.h
>> +++ b/include/hw/ppc/pnv.h
>> @@ -189,7 +189,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
>>                            TYPE_PNV_CHIP_POWER10)
>>   PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
>> -void pnv_phb_attach_root_port(PCIHostState *pci, const char *name);
>> +void pnv_phb_attach_root_port(PCIHostState *pci, const char *name, int index);
>>   #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
>>   typedef struct PnvMachineClass PnvMachineClass;


