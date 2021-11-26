Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361D145F2B6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 18:13:17 +0100 (CET)
Received: from localhost ([::1]:60780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqemh-00033a-Oy
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 12:13:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mqeiG-0007hY-NY; Fri, 26 Nov 2021 12:08:43 -0500
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:48767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mqeiC-00088T-In; Fri, 26 Nov 2021 12:08:40 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.35])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 03B862132B;
 Fri, 26 Nov 2021 17:08:30 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 18:08:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002ae2c0c61-a260-4f8a-9b1d-23efd51c776e,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <988a5133-e1a1-829d-452a-0e1dd72a0098@kaod.org>
Date: Fri, 26 Nov 2021 18:08:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] ppc/pnv: Tune the POWER9 PCIe Host bridge model
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>, 
 Leandro Lupori <leandro.lupori@eldorado.org.br>,
 <alfredo.junior@eldorado.org.br>
References: <20211116170133.724751-1-fbarrat@linux.ibm.com>
 <20211116170133.724751-2-fbarrat@linux.ibm.com>
 <427ef2ee-6871-0d27-f485-90ad142f6266@kaod.org>
In-Reply-To: <427ef2ee-6871-0d27-f485-90ad142f6266@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 33d2af86-05e7-4c1f-b7ae-7d99b9ade7d5
X-Ovh-Tracer-Id: 1481121328171289449
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuhffvfhgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgudefgffhgeduleeuudeulefgkeeigffhhedthefhleelleekgeettedtuddtueenucffohhmrghinhepfhhrvggvsghsugdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprghlfhhrvgguohdrjhhunhhiohhrsegvlhguohhrrgguohdrohhrghdrsghr
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.993,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[ Adding Alfredo the thread ]

On 11/26/21 10:09, Cédric Le Goater wrote:
> On 11/16/21 18:01, Frederic Barrat wrote:
>> The PHB v4 found on POWER9 doesn't request any LSI, so let's clear the
>> Interrupt Pin register in the config space so that the model matches
>> the hardware.
>>
>> If we don't, then we inherit from the default pcie root bridge, which
>> requests a LSI. And because we don't map it correctly in the device
>> tree, all PHBs allocate the same bogus hw interrupt. We end up with
>> inconsistent interrupt controller (xive) data. The problem goes away
>> if we don't allocate the LSI in the first place.
>>
>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
>> ---
>>   hw/pci-host/pnv_phb4.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index 5c375a9f28..1659d55b4f 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -1234,10 +1234,13 @@ static void pnv_phb4_reset(DeviceState *dev)
>>       PCIDevice *root_dev = PCI_DEVICE(&phb->root);
>>       /*
>> -     * Configure PCI device id at reset using a property.
>> +     * Configure the PCI device at reset:
>> +     *   - set the Vendor and Device ID to for the root bridge
>> +     *   - no LSI
>>        */
>>       pci_config_set_vendor_id(root_dev->config, PCI_VENDOR_ID_IBM);
>>       pci_config_set_device_id(root_dev->config, phb->device_id);
>> +    pci_config_set_interrupt_pin(root_dev->config, 0);
>>   }
>>   static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
>>
> 
> FYI, I am seeing an issue with FreeBSD when booting from iso :
> 
>    https://download.freebsd.org/ftp/snapshots/powerpc/powerpc64/ISO-IMAGES/14.0/FreeBSD-14.0-CURRENT-powerpc-powerpc64-20211028-4827bf76bce-250301-disc1.iso.xz
> 
> Thanks,
> 
> C.
> 
> SIGTERM received, booting...
> KDB: debugger backends: ddb
> KDB: current backend: ddb
> ---<<BOOT>>---
> Copyright (c) 1992-2021 The FreeBSD Project.
> Copyright (c) 1979, 1980, 1983, 1986, 1988, 1989, 1991, 1992, 1993, 1994
>      The Regents of the University of California. All rights reserved.
> FreeBSD is a registered trademark of The FreeBSD Foundation.
> FreeBSD 14.0-CURRENT #0 main-n250301-4827bf76bce: Thu Oct 28 06:53:58 UTC 2021
>      root@releng1.nyi.freebsd.org:/usr/obj/usr/src/powerpc.powerpc64/sys/GENERIC64 powerpc
> FreeBSD clang version 12.0.1 (git@github.com:llvm/llvm-project.git llvmorg-12.0.1-0-gfed41342a82f)
> WARNING: WITNESS option enabled, expect reduced performance.
> VT: init without driver.
> ofw_initrd: initrd loaded at 0x28000000-0x28c7928c
> cpu0: IBM POWER9 revision 2.0, 1000.00 MHz
> cpu0: Features dc007182<PPC32,PPC64,ALTIVEC,FPU,MMU,SMT,ISNOOP,ARCH205,ARCH206,VSX,TRUELE>
> cpu0: Features2 bee00000<ARCH207,DSCR,ISEL,TAR,VCRYPTO,ARCH300,IEEE128,DARN>
> real memory  = 1014484992 (967 MB)
> avail memory = 117903360 (112 MB)
> random: registering fast source PowerISA DARN random number generator
> random: fast provider: "PowerISA DARN random number generator"
> arc4random: WARNING: initial seeding bypassed the cryptographic random device because it was not yet seeded and the knob 'bypass_before_seeding' was enabled.
> random: entropy device external interface
> kbd0 at kbdmux0
> ofwbus0: <Open Firmware Device Tree> on nexus0
> opal0: <OPAL Abstraction Firmware> irq 1048560,1048561,1048562,1048563,1048564,1048565,1048566,1048567,1048568,1048569,1048570,1048571,1048572,1048573 on ofwbus0
> opal0: registered as a time-of-day clock, resolution 0.002000s
> simplebus0: <Flattened device tree simple bus> mem 0x6030000000000-0x60300ffffffff on ofwbus0
> pcib0: <OPAL Host-PCI bridge> mem 0x600c3c0000000-0x600c3c0000fff,0x600c300000000-0x600c30fffffff on ofwbus0
> pci0: <OFW PCI bus> numa-domain 0 on pcib0
> qemu-system-ppc64: ../hw/pci/pci.c:1487: pci_irq_handler: Assertion `0 <= irq_num && irq_num < PCI_NUM_PINS' failed.
> 
> 


