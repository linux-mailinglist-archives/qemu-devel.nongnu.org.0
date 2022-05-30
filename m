Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0FE5378E1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 12:14:31 +0200 (CEST)
Received: from localhost ([::1]:34390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvcPu-000392-KY
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 06:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvcLb-0001uP-6z
 for qemu-devel@nongnu.org; Mon, 30 May 2022 06:10:03 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:36549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvcLV-0001AH-33
 for qemu-devel@nongnu.org; Mon, 30 May 2022 06:09:59 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.17])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 07FC126380;
 Mon, 30 May 2022 10:09:52 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 30 May
 2022 12:09:52 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002fdc0734b-0517-4e65-a2c1-dbf850532fed,
 5C71732C2466BA2B6DA87B8E2AF7D05D1CABB0C8) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <92287a4f-50b5-0e9e-a1a1-70ba1790b179@kaod.org>
Date: Mon, 30 May 2022 12:09:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PULL v2 75/86] include/hw/pci/pcie_host: Correct
 PCIE_MMCFG_SIZE_MAX
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>, <qemu-devel@nongnu.org>, Peter
 Maydell <peter.maydell@linaro.org>, Francisco Iglesias
 <frasse.iglesias@gmail.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Murilo Opsfelder Araujo
 <muriloo@linux.ibm.com>
References: <20220516204913.542894-1-mst@redhat.com>
 <20220516204913.542894-76-mst@redhat.com>
 <96abb644-4031-7d7f-db45-6376f8f74161@gmail.com>
 <de56b35-c77-e979-b8bd-17c439f4b56d@eik.bme.hu>
 <bbab97ff-c24f-7318-ed83-218e52481451@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <bbab97ff-c24f-7318-ed83-218e52481451@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8fdb5f96-bddf-4469-b260-ad7c5c21a27d
X-Ovh-Tracer-Id: 10948250696175356917
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeeigddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeeggffggfehjefgudefieeuffevheetjefgleeukefggeetgfffjeehtdfgjefgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepmhhurhhilhhooheslhhinhhugidrihgsmhdrtghomh
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/30/22 11:42, Thomas Huth wrote:
> On 26/05/2022 17.54, BALATON Zoltan wrote:
>> Hello,
>>
>> On Thu, 26 May 2022, Daniel Henrique Barboza wrote:
>>> Hi,
>>>
>>> This patch broke the boot of the sam460ex ppc machine:
>>>
>>> qemu-system-ppc -M sam460ex -kernel ./buildroot/qemu_ppc_sam460ex-latest/vmlinux \
>>> -device virtio-net-pci,netdev=net0 -netdev user,id=net0 -serial mon:stdio \
>>> -nographic -snapshot
>>> qemu-system-ppc: ../hw/pci/pcie_host.c:97: pcie_host_mmcfg_init: Assertion `size <= PCIE_MMCFG_SIZE_MAX' failed.
>>
>> Thanks for noticing this. I usually only test it during the freeze. Wasn't there a test patch submitted by Philippe before? Isn't that yet merged or included in CI? That should catch these before breaking it.
> 
> Seems like there is only the (primitive) boot-serial test so far:
> 
> $ grep -r sam460ex tests/
> tests/qtest/boot-serial-test.c:    { "ppc", "sam460ex", "-m 256", "DRAM:  256 MiB" },
> tests/qtest/boot-serial-test.c:    { "ppc64", "sam460ex", "-device e1000", "8086  100e" },
> 
> If there is a guest kernel available for public download somewhere,
> it would be great if you could add an avocado test for this machine
> (see e.g. the tests/avocado/ppc_*.py files for a template).

We use these buildroot kernel and rootfs images :

    https://github.com/legoater/qemu-ppc-boot

The whole takes about 5m40s to run on a 8*2 Intel(R) Core(TM)
i7-10700 CPU @ 2.90GHz.

Thanks,

C.


./ppc-boot.sh -q --prefix=/home/legoater/work/qemu/qemu-ppc.git/install/
ref405ep : Linux /init login DONE (PASSED)
bamboo : Linux /init net login DONE (PASSED)
sam460ex : ASSERT (FAILED)
g3beige-604 : FW Linux Linux /init net login DONE (PASSED)
g3beige-g3 : FW Linux Linux /init net login DONE (PASSED)
mac99-g4 : FW Linux Linux /init net login DONE (PASSED)
mac99-7447 : FW Linux Linux /init net login DONE (PASSED)
mac99-7448 : FW Linux Linux /init net login DONE (PASSED)
mac99-7450 : FW Linux Linux /init net login DONE (PASSED)
mpc8544ds : Linux /init net login DONE (PASSED)
e500mc : Linux /init net login DONE (PASSED)
40p : FW login DONE (PASSED)
e5500 : Linux /init net login DONE (PASSED)
e6500 : Linux /init net login DONE (PASSED)
g5-32 : FW Linux Linux /init net login DONE (PASSED)
g5-64 : FW Linux Linux /init net login DONE (PASSED)
pseries-970 : FW Linux Linux /init net login DONE (PASSED)
pseries-970mp : FW Linux Linux /init net login DONE (PASSED)
pseries-POWER5+ : FW Linux Linux /init net login DONE (PASSED)
pseries : FW Linux Linux /init net login DONE (PASSED)
pseriesle8 : FW Linux Linux /init net login DONE (PASSED)
pseriesle9 : FW Linux Linux /init net login DONE (PASSED)
pseriesle-vof : Linux /init net login DONE (PASSED)
pseriesle10 : FW Linux Linux /init net login DONE (PASSED)
powernv8 : FW Linux /init net login DONE (PASSED)
powernv9 : FW Linux /init net login DONE (PASSED)
powernv10 : FW Linux /init net login DONE (PASSED)




