Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB6646BDDA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 15:36:47 +0100 (CET)
Received: from localhost ([::1]:48694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mubaH-0005md-RB
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 09:36:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mubYM-0004iY-LP
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 09:34:46 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:39649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mubYJ-0007U6-NH
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 09:34:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.54])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0A3071FFB0;
 Tue,  7 Dec 2021 14:34:40 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 7 Dec
 2021 15:34:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006fb34da70-b3e2-4c3d-a576-0161b81a04f7,
 EDCC1E77E28A65BD51DFCD2B92BF934EEA10E5FB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.201.172.254
Message-ID: <804b4711-9b4b-30bc-1655-4516a3a3ed8f@kaod.org>
Date: Tue, 7 Dec 2021 15:34:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 07/14] ppc/pnv: Introduce a num_pecs class attribute for
 PHB4 PEC devices
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-8-clg@kaod.org>
 <453c5cc3-5ac5-c6ff-fa7f-5ccb8492e314@linux.ibm.com>
 <fe4c3744-91b1-bd5b-2a04-e2782c46fc09@kaod.org>
 <6ee71d8d-33b8-47cf-66c1-92b960d3c5fe@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <6ee71d8d-33b8-47cf-66c1-92b960d3c5fe@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2907d093-4560-4168-b91e-06a3c0f22456
X-Ovh-Tracer-Id: 8142508130190265251
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeehgdeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.44,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/21 15:03, Frederic Barrat wrote:
> 
> 
> On 07/12/2021 11:45, Cédric Le Goater wrote:
>> On 12/7/21 11:00, Frederic Barrat wrote:
>>>
>>>
>>> On 02/12/2021 15:42, Cédric Le Goater wrote:
>>>> POWER9 processor comes with 3 PHB4 PECs (PCI Express Controller) and
>>>> each PEC can have several PHBs :
>>>>
>>>>    * PEC0 provides 1 PHB  (PHB0)
>>>>    * PEC1 provides 2 PHBs (PHB1 and PHB2)
>>>>    * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)
>>>>
>>>> A num_pecs class attribute represents better the logic units of the
>>>> POWER9 chip. Use that instead of num_phbs which fits POWER8 chips.
>>>> This will ease adding support for user created devices.
>>>>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>>
>>> With this patch, chip->num_phbs is only defined and used on P8. We may want to add a comment to make it clear.
>>
>> Yes.
>>
>> With the latest changes, I think we can now move num_phbs under PnvChip8
>> and num_pecs under PnvChip9 since they are only used in these routines :
>>
>> P8:
>>      static void pnv_chip_power8_instance_init(Object *obj)
>>              chip->num_phbs = pcc->num_phbs;
>>          for (i = 0; i < chip->num_phbs; i++) {
>>
>>      static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>>          for (i = 0; i < chip->num_phbs; i++) {
>> P9:
>>      static void pnv_chip_power9_instance_init(Object *obj)
>>              chip->num_pecs = pcc->num_pecs;
>>          for (i = 0; i < chip->num_pecs; i++) {
>>
>>      static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>>          for (i = 0; i < chip->num_pecs; i++) {
>>
>>> As I review this series, something is bugging me though: the difference of handling between P8 and P9.
>>> On P9, we seem to have a more logical hiearachy:
>>> phb <- PCI controller (PEC) <- chip
>>
>> Yes. It's cleaner than P8 in terms of logic. P8 initial support was
>> done hastily for skiboot bringup in 2014.
>>
>>> With P8, we don't have an explicit PEC, but we have a PBCQ object, which is somewhat similar. The hierarchy seems also more convoluted.
>>
>> But we don't have stacks on P8. Do we ?
> 
> 
> Stacks were introduced on P9 because all the lanes handled by a PEC could be grouped differently, each group being called a stack. And each stack is associated to a PHB.
> On P8, there's no such split, so the doc didn't mention stacks. But each PEC handles exactly one PHB. So we could still keep the same abstractions.
> On all chips, a PEC would really be equal to a pbcq interface to the power bus. The pbcq is servicing one (on P8) or more (on P9/P10) PHBs.
> 
> 
> 
>>> I don't see why it's treated differently. It seems both chips could be treated the same, which would make the code easier to follow.
>>
>> I agree. Daniel certainly would also :)
>>
>>> That's outside of the scope of this series though. 
>>
>> Well, this patchset enables libvirt support for the PowerNV machines.
>> Once this is pushed, we need to keep the API, the object model names
>> being part of it.
>>
>> 7.0 is a good time for a change, really. After that, we won't be able
>> to change the QOM hierarchy that much.
>>
>>> So maybe for a future patch? Who knows, I might volunteer...
>>
>> You would introduce a phb3-pec on top of the phb3s ?
> 
> Or rename pnv_phb3_pbcq.c to pnv_phb3_pec.c and starts from there. Conceptually, the TYPE_PNV_PBCQ and TYPE_PNV_PHB4_PEC_STACK objects seem close. But that's easy to say in an email...

It's a start.

Here is the PHB3 QOM tree :

    /pnv-phb3[0] (pnv-phb3)
       /lsi (ics)
       /msi (phb3-msi)
       /msi32[0] (memory-region)
       /msi64[0] (memory-region)
       /pbcq (pnv-pbcq)
         /pbcq-mmio0[0] (memory-region)
         /pbcq-mmio1[0] (memory-region)
         /pbcq-phb[0] (memory-region)
         /xscom-pbcq-nest-0.0[0] (memory-region)
         /xscom-pbcq-pci-0.0[0] (memory-region)
         /xscom-pbcq-spci-0.0[0] (memory-region)
       /pci-io[0] (memory-region)
       /pci-mmio[0] (memory-region)
       /pcie-mmcfg-mmio[0] (memory-region)
       /phb3-m32[0] (memory-region)
       /phb3-regs[0] (memory-region)
       /phb3_iommu[0] (pnv-phb3-iommu-memory-region)
       /root (pnv-phb3-root-port)
         /bus master container[0] (memory-region)
         /bus master[0] (memory-region)
         /pci_bridge_io[0] (memory-region)
         /pci_bridge_io[1] (memory-region)
         /pci_bridge_mem[0] (memory-region)
         /pci_bridge_pci[0] (memory-region)
         /pci_bridge_pref_mem[0] (memory-region)
         /pci_bridge_vga_io_hi[0] (memory-region)
         /pci_bridge_vga_io_lo[0] (memory-region)
         /pci_bridge_vga_mem[0] (memory-region)
         /pcie.0 (PCIE)
       /root-bus (pnv-phb3-root-bus)

We would swap 'pnv-phb3' and 'pnv-pbcq' and rename it to 'pnv-phb3-pec'.
Looks good to me. This should clarify the relationship between objects.

I never like the back pointer to the phb under pbcq:

     (qemu) qom-list /machine/chip[0]/pnv-phb3[0]/pbcq
     type (string)
     parent_bus (link<bus>)
     realized (bool)
     hotplugged (bool)
     hotpluggable (bool)
     pbcq-mmio0[0] (child<memory-region>)
     xscom-pbcq-spci-0.0[0] (child<memory-region>)
     xscom-pbcq-nest-0.0[0] (child<memory-region>)
     pbcq-mmio1[0] (child<memory-region>)
     phb (link<pnv-phb3>)
     pbcq-phb[0] (child<memory-region>)
     xscom-pbcq-pci-0.0[0] (child<memory-region>)
     

That's P9 for the reference :

     /pnv-phb4-pec[0] (pnv-phb4-pec)
       /stack[0] (pnv-phb4-pec-stack)
         /pec-0.0-stack-0-int[0] (memory-region)
         /pec-0.0-stack-0-mmio0[0] (memory-region)
         /pec-0.0-stack-0-mmio1[0] (memory-region)
         /pec-0.0-stack-0-phb[0] (memory-region)
         /phb (pnv-phb4)
           /msi32[0] (memory-region)
           /msi64[0] (memory-region)
           /pcie-mmcfg-mmio[0] (memory-region)
           /phb4-0.0-iommu[0] (pnv-phb4-iommu-memory-region)
           /phb4-0.0-pci-io[0] (memory-region)
           /phb4-0.0-pci-mmio[0] (memory-region)
           /phb4-0.0-regs[0] (memory-region)
           /phb4-mbar0[0] (memory-region)
           /root (pnv-phb4-root-port)
             /bus master container[0] (memory-region)
             /bus master[0] (memory-region)
             /pci_bridge_io[0] (memory-region)
             /pci_bridge_io[1] (memory-region)
             /pci_bridge_mem[0] (memory-region)
             /pci_bridge_pci[0] (memory-region)
             /pci_bridge_pref_mem[0] (memory-region)
             /pci_bridge_vga_io_hi[0] (memory-region)
             /pci_bridge_vga_io_lo[0] (memory-region)
             /pci_bridge_vga_mem[0] (memory-region)
             /pcie.0 (PCIE)
           /root-bus (pnv-phb4-root-bus)
           /source (xive-source)
             /xive.esb-emulated[0] (memory-region)
             /xive.esb[0] (memory-region)
           /xscom-pec-0.0-pci-stack-0-phb[0] (memory-region)
         /xscom-pec-0.0-nest-stack-0[0] (memory-region)
         /xscom-pec-0.0-pci-stack-0[0] (memory-region)
       /xscom-pec-0.0-nest[0] (memory-region)
       /xscom-pec-0.0-pci[0] (memory-region)


Thanks,

C.

