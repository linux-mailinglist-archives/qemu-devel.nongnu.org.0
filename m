Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C23B64EDFA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:32:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Ch8-00061F-Hr; Fri, 16 Dec 2022 10:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p6Ch5-00060c-Um
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:32:16 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p6Ch4-0002ap-6K
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:32:15 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.140])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2C961237C9;
 Fri, 16 Dec 2022 15:32:02 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 16 Dec
 2022 16:32:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002727c843c-e0e4-428f-90a7-9e5ccebdc07a,
 36D6BF8FF35675F329F930B0EBA591211D20A595) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <832b5af6-dffd-7fa1-d648-3068834f8a15@kaod.org>
Date: Fri, 16 Dec 2022 16:32:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/6] Trivial PPC cleanups
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, David Gibson
 <david@gibson.dropbear.id.au>, Michael Tokarev <mjt@tls.msk.ru>,
 <qemu-trivial@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>
References: <20221216145709.271940-1-shentey@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221216145709.271940-1-shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 46e7dd84-43b9-4703-bc47-637054e47868
X-Ovh-Tracer-Id: 10336042620765506482
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejgdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshhhvghnthgvhiesghhmrghilhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpvggughgrrhdrihhglhgvshhirghssehgmhgrihhlrdgtohhmpdhlrghurhgvnhhtsehvihhvihgvrhdrvghupdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhmjhhtsehtlhhsrdhmshhkrdhruhdpqhgvmhhuqdhtrhhivhhirghlsehnohhnghhnuhdrohhrghdpuggrnhhivghlhhgsgedufeesgh
 hmrghilhdrtghomhdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/16/22 15:57, Bernhard Beschow wrote:
> These are some patches which helped me when getting a u-boot image to run on ppce500 machine.

Nice. Did you simply use the qemu-ppce500_defconfig ? or an u-boot old image ?

We could update the qemu_ppc_e500mc_defconfig in buildroot to generate the
uboot.bin if that worked.


> 
> Testing done:
> - `make check`
> - `make check-avocado`
> 
> Bernhard Beschow (6):
>    target/ppc/mmu_common: Log which effective address had no TLB entry
>      found
>    target/ppc/mmu_common: Fix table layout of "info tlb" HMP command
>    hw/ppc/virtex_ml507: Prefer local over global variable
>    hw/ppc/e500: Prefer local variable over qdev_get_machine()
>    hw/ppc/e500: Resolve variable shadowing
>    hw/ppc/e500: Move comment to more appropriate place
> 
>   hw/ppc/e500.c           | 10 ++++------
>   hw/ppc/virtex_ml507.c   |  2 +-
>   target/ppc/mmu_common.c |  5 +++--
>   3 files changed, 8 insertions(+), 9 deletions(-)
> 


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

