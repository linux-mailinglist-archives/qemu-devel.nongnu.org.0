Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAB448930F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:09:42 +0100 (CET)
Received: from localhost ([::1]:53476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6pkL-0006xL-8P
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:09:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6pfe-0004Yw-Sp
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:04:54 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:49169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6pfc-0008Il-Nb
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:04:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.68])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 7C8B920BC9;
 Mon, 10 Jan 2022 08:04:45 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 09:04:44 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004a09a0ba3-db91-45be-9d58-7c574669f209,
 BF6F17FB45C67FCD004F592EBF28FE1306A73352) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <10391a07-e5e1-99e6-ed68-c93520534f29@kaod.org>
Date: Mon, 10 Jan 2022 09:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc: Fix e6500 boot
Content-Language: en-US
To: "mario@locati.it" <mario@locati.it>, <balaton@eik.bme.hu>
References: <20211213133542.2608540-1-farosas@linux.ibm.com>
 <724f7563-f36c-2c37-3b94-951c3d922861@eik.bme.hu>
 <R4OPHT$7F12C66D1107397991E0E4C978FE6AF1@locati.it>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <R4OPHT$7F12C66D1107397991E0E4C978FE6AF1@locati.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2b12793e-a55b-48d9-a1d0-0a0c360be771
X-Ovh-Tracer-Id: 16761553391470873382
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudegledguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieejieevleeutdfhffefleehteduieehueetueduvddutdekudeffffffeeftdfhnecuffhomhgrihhnpeefvddrshhonecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Mario,

> 
> I have tried to launch a freshly compiled qemu from git master on a NXP T2080RDB devkit that has a e6500 CPU in combination with a freshly compiled kernel 5.16-rc6
> I have Debian SID ppc64 up and running using such a kernel, and when I launch qemu to run a VM with the same debian sid for ppc64 and the same kernel using --enable-kvm I end up with a kernel panic
> 
> [....]
> Run /sbin/init as init process
> random: fast init done
> systemd[1]: illegal instruction (4) at 3fff96562ac8 nip 3fff96562ac8 lr 3fff96562aa8 code 1 in libc-2.32.so[3fff96516000+1f7000]
> systemd[1]: code: 60000000 38600006 9122b7e8 4801bead 60000000 60000000 8122b7e8 2c090004
> systemd[1]: code: 40820014 39200005 60000000 9122b7e8 <00000000> 60000000 8122b7e8 2c090005
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
> Rebooting in 180 seconds..

I spend sometime looking at the kernel and QEMU and I noticed that
TCG e6500 machines have an issue when the kernel has KVM support.
I have limited knowledge on that topic but e6500 has extra MMU
features that an hypervisor could use for the guest and the e6500
emulation clearly doesn't have support for it.

In the guest, could you try with to run the KVM guest with a kernel
without KVM support and let us know ?

Thanks,

C.

