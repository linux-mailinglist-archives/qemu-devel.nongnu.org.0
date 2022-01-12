Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C862E48C3C4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:11:16 +0100 (CET)
Received: from localhost ([::1]:35836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cTD-0004tc-U6
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:11:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7c0q-0007tO-Fz
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:41:56 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:39551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7c0h-0005bL-GA
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:41:49 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CCF2AD736687;
 Wed, 12 Jan 2022 12:41:44 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 12 Jan
 2022 12:41:44 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00543f1ec25-506d-41be-96e8-2f78ca44233b,
 C5437DA5DF8DB845CC48CAA380855665EAA33ED7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d9cbb334-bcfa-1c5e-7d06-4d2c9bcbfe98@kaod.org>
Date: Wed, 12 Jan 2022 12:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/2] spapr: Fix support of POWER5+ processors
Content-Language: en-US
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220105095142.3990430-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220105095142.3990430-1-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ce28dbca-82bf-47b7-8f3f-49bccf611498
X-Ovh-Tracer-Id: 13724719868383169443
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtddugddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuveelvdejteegteefieevfeetffefvddvieekteevleefgeelgfeutedvfedvfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 10:51, Cédric Le Goater wrote:
> Hello,
> 
> Grab the images under :
> 
>    https://github.com/legoater/qemu-ppc-boot/tree/main/buildroot/qemu_ppc64_pseries_p5p-2021.11-730-g4f325ce788-20220104
> 
> and run with :
> 
>    qemu-system-ppc64 -M pseries -cpu POWER5+ -m 1G -smp 2 -kernel ./vmlinux -append "root=/dev/sda" -drive file=./rootfs.ext2,if=scsi,index=0,format=raw  -device spapr-vlan,netdev=net0 -netdev user,id=net0 -serial mon:stdio -nographic -nodefaults
> 
> CPU 970, 970MP are also well supported.
> 
> Virtio devices and USB should be avoided because SLOF would use a
> 'stdbrx' instruction (cpu_to_le64 helper) which is invalid under
> POWER5+ and 970 CPUs. SLOF needs to be compiled with -mcpu=power5 to
> fix this issue.
> 
> Thanks,
> 
> C.
> 
> Cédric Le Goater (2):
>    target/ppc: Add popcntb instruction to POWER5+ processors
>    spapr: Fix support of POWER5+ processors
> 
>   hw/ppc/spapr.c        | 10 ++++++----
>   target/ppc/cpu_init.c |  1 +
>   2 files changed, 7 insertions(+), 4 deletions(-)
> 



Applied to ppc7.0.

Thanks,

C.

