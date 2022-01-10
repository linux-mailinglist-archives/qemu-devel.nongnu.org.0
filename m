Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0251D489075
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 07:59:13 +0100 (CET)
Received: from localhost ([::1]:39358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6oe4-0004jK-CX
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 01:59:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6oW2-00019H-46
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 01:50:50 -0500
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:38775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6oVy-0006nc-72
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 01:50:49 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.68])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6413C22093;
 Mon, 10 Jan 2022 06:50:41 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 07:50:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0036c7a2a14-8c5a-4a70-974e-7daceb42fe2c,
 BF6F17FB45C67FCD004F592EBF28FE1306A73352) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <246291be-c122-0cbc-bfa4-ad8717fcbc02@kaod.org>
Date: Mon, 10 Jan 2022 07:50:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <20220110050454.3689863-1-aik@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220110050454.3689863-1-aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b23e114f-36ef-4003-a91e-bc248e1b5cea
X-Ovh-Tracer-Id: 15510678593206717405
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudegledguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 06:04, Alexey Kardashevskiy wrote:
> The following changes since commit 0625c7760d5451d7436ef0738f763c6bb5141919:
> 
>    target/ppc: do not call hreg_compute_hflags() in helper_store_mmcr0() (2022-01-04 07:55:35 +0100)
> 
> are available in the Git repository at:
> 
>    git@github.com:aik/qemu.git tags/qemu-slof-20220110
> 
> for you to fetch changes up to 1c127fa8e2ff2b034ebf8e50faea2bbc5136afd2:
> 
>    pseries: Update SLOF firmware image (2022-01-10 15:31:14 +1100)
> 
> ----------------------------------------------------------------
> Alexey Kardashevskiy (1):
>        pseries: Update SLOF firmware image
> 
>   pc-bios/README   |   2 +-
>   pc-bios/slof.bin | Bin 991920 -> 992384 bytes
>   roms/SLOF        |   2 +-
>   3 files changed, 2 insertions(+), 2 deletions(-)
> 
> 
> *** Note: this is not for master, this is for pseries
> 
> The only change is that SLOF is compiled with -mcpu=power5
> to make it work on PPC970 too.

P5+ also. See below.

Thanks,

C.


   root@vm24:~# dmesg
   [    0.000000] hash-mmu: Page sizes from device-tree:
   [    0.000000] hash-mmu: base_shift=12: shift=12, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=0
   [    0.000000] Relocation on exceptions not supported
   [    0.000000] Page orders: linear mapping = 12, virtual = 12, io = 12, vmemmap = 12
   [    0.000000] hash-mmu: Initializing hash mmu with SLB
   [    0.000000] Linux version 5.15.0-2-powerpc64 (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.2.0-13) 11.2.0, GNU ld (GNU Binutils for Debian) 2.37) #1 SMP Debian 5.15.5-2 (2021-12-18)
   [    0.000000] Found initrd at 0xc000000003e00000:0xc0000000059d559e
   ...
   
   root@vm24:~# cat /proc/cpuinfo
   processor	: 0
   cpu		: POWER5+ (gs)
   clock		: 1000.000000MHz
   revision	: 2.1 (pvr 003b 0201)
   
   processor	: 1
   cpu		: POWER5+ (gs)
   clock		: 1000.000000MHz
   revision	: 2.1 (pvr 003b 0201)
   
   processor	: 2
   cpu		: POWER5+ (gs)
   clock		: 1000.000000MHz
   revision	: 2.1 (pvr 003b 0201)
   
   processor	: 3
   cpu		: POWER5+ (gs)
   clock		: 1000.000000MHz
   revision	: 2.1 (pvr 003b 0201)
   
   timebase	: 512000000
   platform	: pSeries
   model		: IBM pSeries (emulated by qemu)
   machine	: CHRP IBM pSeries (emulated by qemu)
   MMU		: Hash
   root@vm24:~# lspci
   00:01.0 SCSI storage controller: Red Hat, Inc. Virtio SCSI
   00:02.0 Ethernet controller: Red Hat, Inc. Virtio network device
   00:04.0 USB controller: Red Hat, Inc. QEMU XHCI Host Controller (rev 01)
   00:05.0 Unclassified device [00ff]: Red Hat, Inc. Virtio RNG
   00:09.0 Unclassified device [00ff]: Red Hat, Inc. Virtio memory balloon
   



