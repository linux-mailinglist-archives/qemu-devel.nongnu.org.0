Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B6D48615A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 09:21:49 +0100 (CET)
Received: from localhost ([::1]:59696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5O1q-00024J-QR
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 03:21:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5NzC-0006yO-Ev
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 03:19:02 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:48497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5Nz9-0001sf-W8
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 03:19:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.208])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id DD59C20AB0;
 Thu,  6 Jan 2022 08:18:57 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 09:18:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00690c6a133-3a6f-4969-bb92-8fc5fb3a8438,
 021048AAC49377EB75D2DE2E73CB44671C288654) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9d3401ac-70d5-7635-0bce-15f7346eb8a1@kaod.org>
Date: Thu, 6 Jan 2022 09:18:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 00/18] user creatable pnv-phb3/pnv-phb4 devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220105212338.49899-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 587b5e39-99e8-4086-a8a0-aa8c6f54e9db
X-Ovh-Tracer-Id: 11957338489815010272
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefkedgfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeeuheelfeevheehtdefvdevvdfggfekueekheffjeevhfevudevveeljeethfeunecuffhomhgrihhnpehgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 22:23, Daniel Henrique Barboza wrote:
> Hi,
> 
> This second version was rebased with upstream and includes fixed/amended
> versions of relevant patches that were sent to the mailing list and aren't
> upstream yet. In this process 4 patches from v1 were discarded, becoming
> either irrelevant or squashed into others.
> 
> The patches are organized as follows:
> 
> - patches 1-4: enable user creatable phb3/phb4 root ports

Looking closer at models and domain files in libvirt, aren't user
creatable phb3/phb4 root ports enough ? Do we really need the
pnv-phb3/pnv-phb4 devices to be user created also ?


That said, I am no expert in libvirt,

Thanks,

C.


> - patches 5-10: enable user creatable pnv-phb3 devices
> - patches 11-18: enable user creatable pnv-phb4 devices
> 
> Here are some examples of what we're able to do with this series:
> 
> * powernv8 machine with -nodefaults,2 pnv-phb3s with 'pcie.N' name,
> one of them with a root port and a netcard:
> 
> $ qemu-system-ppc64 -m 4G -machine powernv8,accel=tcg -smp 2,cores=2,threads=1 \
> -bios skiboot.lid  -kernel vmlinux -initrd buildroot.rootfs.cpio \
> -append 'console=hvc0 ro xmon=on' \
> -nodefaults \
> -serial mon:stdio -nographic \
> -device pnv-phb3,chip-id=0,index=0,id=pcie.0 \
> -device pnv-phb3,chip-id=0,index=2,id=pcie.2 \
> -device pnv-phb3-root-port,bus=pcie.2,id=pcie.5 \
> -netdev bridge,helper=/usr/libexec/qemu-bridge-helper,br=virbr0,id=net0 \
> -device e1000e,netdev=net0,mac=C0:ff:EE:00:01:04,bus=pcie.5,addr=0x0
> 
> * powernv9 machine with -nodefaults, 3 of the available 12 pnv-phb4 devices
> created, 2 root ports, one of the port with a pcie-pci-bridge and
> devices connected in the bridge:
> 
> $ qemu-system-ppc64 -m 4G -machine powernv9 \
> -smp 2,sockets=2,cores=1,threads=1 \
> -accel tcg,thread=multi -bios skiboot.lid \
> -kernel vmlinux -initrd buildroot.rootfs.cpio \
> -append 'console=hvc0 ro xmon=on' \
> -nodefaults \
> -serial mon:stdio -nographic \
> -device pnv-phb4,chip-id=0,index=0,id=pcie.0 \
> -device pnv-phb4,chip-id=0,index=4,id=pcie.1 \
> -device pnv-phb4,chip-id=1,index=3,id=pcie.2 \
> -device pnv-phb4-root-port,id=root0,bus=pcie.2 \
> -device pnv-phb4-root-port,id=root1,bus=pcie.1 \
> -device pcie-pci-bridge,id=bridge1,bus=root0,addr=0x0 \
> -device nvme,bus=bridge1,addr=0x1,drive=drive0,serial=1234 \
> -drive file=./simics-disk.raw,if=none,id=drive0,format=raw,cache=none \
> -device e1000e,netdev=net0,mac=C0:ff:EE:00:01:04,bus=bridge1,addr=0x3 \
> -netdev bridge,helper=/usr/libexec/qemu-bridge-helper,br=virbr0,id=net0 \
> -device nec-usb-xhci,bus=bridge1,addr=0x2
> 
> 
> * powernv8/9 with default settings can be used as usual. The work done
> in this series didn't change the name of the buses created by the
> default root ports (named pcie.0...N):
> 
> $ qemu-system-ppc64 -m 4G \
> -machine powernv9 -smp 2,sockets=2,cores=1,threads=1  \
> -accel tcg,thread=multi -bios skiboot.lid  \
> -kernel vmlinux -initrd buildroot.rootfs.cpio \
> -append 'console=hvc0 ro xmon=on' \
> -serial mon:stdio -nographic \
> -device pcie-pci-bridge,id=bridge1,bus=pcie.0,addr=0x0 \
> -device nvme,bus=bridge1,addr=0x1,drive=drive0,serial=1234  \
> -drive file=./simics-disk.raw,if=none,id=drive0,format=raw,cache=none \
> -device e1000e,netdev=net0,mac=C0:ff:EE:00:01:04,bus=bridge1,addr=0x3 \
> -netdev bridge,helper=/usr/libexec/qemu-bridge-helper,br=virbr0,id=net0 \
> -device nec-usb-xhci,bus=bridge1,addr=0x2
> 
> 
> Changes from v1:
> - rebased with upstream at 7d4ae4d497807
> - added relevant patches that aren't upstream yet from "ppc/pnv:
> Preliminary cleanups before user created PHBs" [1] and "ppc/pnv: Add
> support for user created PHB3/PHB4 devices" [2] series
> - renamed phb3/phb4 default buses name to 'pnv-phb3-root' and
> 'pnv-phb4-root'
> - renamed pnv_pec_get_phb_id() to pnv_phb4_pec_get_phb_id()
> - patch 'introduce pnv_pec_init_stack_xscom()' moved to patch 16 to
> be closer with patch 17 that uses it
> - v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg04427.html
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg03810.html
> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg01548.html
> 
> 
> Cédric Le Goater (5):
>    ppc/pnv: Attach PHB3 root port device when defaults are enabled
>    ppc/pnv: Introduce support for user created PHB3 devices
>    ppc/pnv: Reparent user created PHB3 devices to the PnvChip
>    ppc/pnv: Complete user created PHB3 devices
>    ppc/pnv: Move num_phbs under Pnv8Chip
> 
> Daniel Henrique Barboza (13):
>    pnv_phb3.c: add unique chassis and slot for pnv_phb3_root_port
>    pnv_phb4.c: add unique chassis and slot for pnv_phb4_root_port
>    pnv_phb4.c: make pnv-phb4-root-port user creatable
>    pnv_phb4.c: check if root port exists in rc_config functions
>    pnv_phb3.h: change TYPE_PNV_PHB3_ROOT_BUS name
>    pnv_phb4.c: introduce pnv_phb4_set_stack_phb_props()
>    pnv_phb4_pec.c: move pnv_pec_phb_offset() to pnv_phb4.c
>    pnv_phb4_pec: use pnv_phb4_pec_get_phb_id() in pnv_pec_dt_xscom()
>    pnv_phb4.h: turn phb into a pointer in struct PnvPhb4PecStack
>    pnv_phb4_pec.c: use 'default_enabled()' to init stack->phb
>    pnv_phb4.c: introduce pnv_pec_init_stack_xscom()
>    ppc/pnv: Introduce user creatable pnv-phb4 devices
>    pnv_phb4.c: change TYPE_PNV_PHB4_ROOT_BUS name
> 
>   hw/pci-host/pnv_phb3.c         |  57 ++++++++--
>   hw/pci-host/pnv_phb4.c         | 193 ++++++++++++++++++++++++++++++---
>   hw/pci-host/pnv_phb4_pec.c     |  86 ++++++---------
>   hw/ppc/pnv.c                   |  55 ++++++++--
>   include/hw/pci-host/pnv_phb3.h |   4 +-
>   include/hw/pci-host/pnv_phb4.h |  15 ++-
>   include/hw/ppc/pnv.h           |   8 +-
>   7 files changed, 322 insertions(+), 96 deletions(-)
> 


