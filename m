Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D6E51721C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 17:01:48 +0200 (CEST)
Received: from localhost ([::1]:58188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlXYZ-0007At-CO
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 11:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nlXWn-0005RZ-UM; Mon, 02 May 2022 10:59:57 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:48705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nlXWl-0005bD-ET; Mon, 02 May 2022 10:59:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.48])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2C727FBF73FE;
 Mon,  2 May 2022 16:59:50 +0200 (CEST)
Received: from kaod.org (37.59.142.110) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 2 May
 2022 16:59:49 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S0041e830735-b8bf-4f5e-8d42-386d6a47fcc1,
 1C738C3314058F8CE8CF02D37F1FC3678EA14F63) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e0605fc2-af93-22b1-e702-c3ea5cda5fcd@kaod.org>
Date: Mon, 2 May 2022 16:59:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 00/21] target/ppc: Remove hidden usages of *env
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d0692f83-6f9d-4903-bdfc-5ba43185252d
X-Ovh-Tracer-Id: 17430619410452351852
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgfeivdeigeefteegffekhfejfeekhffgiefhgedtheehueeiueffteeviefglefhnecuffhomhgrihhnpehgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/22 16:39, Víctor Colombo wrote:
> By running the grep command `git grep -nr 'define \(fpscr\|msr\)_[a-z0-9]\+\>'`
> we can find multiple macros that use `env->fpscr` and `env->msr` but doesn't
> take *env as a parameter.
> 
> Richard Henderson said [1] that these macros hiding the usage of *env "are evil".
> This patch series remove them and substitute with an explicit usage of *env by
> using registerfields API.
> 
> Patch 20 (target/ppc: Add unused msr bits FIELDs) declares unused FIELDs, the
> same that were removed in patch 02 (target/ppc: Remove unused msr_* macros). I
> did that to keep the changes consistent with what was already present before.
> 
> Patch 21 (target/ppc: Change MSR_* to follow POWER ISA numbering convention)
> changes the MSR_* bit number to match POWER ISA by adding a new macro to
> 'invert' the ordering. (added in v2)
> 
> [1]: https://lists.gnu.org/archive/html/qemu-ppc/2021-11/msg00280.html
> 
> Patches requiring review: Patch 3 and after
> 
> Hello everyone, thanks for your kind reviews in v1,
> What do you think of this new approach I did for v2?

It looks real good. I hope we can queue it for the next PR.

Thanks,

C.



> 
> v2:
> - Abandon the ideia to add an M_MSR_* macro
> - Instead, use registerfields API as suggested by Richard
> - Add patch 21 to invert MSR_* values to match ISA ordering
> 
> Víctor Colombo (21):
>    target/ppc: Remove fpscr_* macros from cpu.h
>    target/ppc: Remove unused msr_* macros
>    target/ppc: Remove msr_pr macro
>    target/ppc: Remove msr_le macro
>    target/ppc: Remove msr_ds macro
>    target/ppc: Remove msr_ile macro
>    target/ppc: Remove msr_ee macro
>    target/ppc: Remove msr_ce macro
>    target/ppc: Remove msr_pow macro
>    target/ppc: Remove msr_me macro
>    target/ppc: Remove msr_gs macro
>    target/ppc: Remove msr_fp macro
>    target/ppc: Remove msr_me macro
>    target/ppc: Remove msr_ir macro
>    target/ppc: Remove msr_dr macro
>    target/ppc: Remove msr_ep macro
>    target/ppc: Remove msr_fe0 and msr_fe1 macros
>    target/ppc: Remove msr_ts macro
>    target/ppc: Remove msr_hv macro
>    target/ppc: Add unused msr bits FIELDs
>    target/ppc: Change MSR_* to follow POWER ISA numbering convention
> 
>   hw/ppc/pegasos2.c        |   2 +-
>   hw/ppc/spapr.c           |   2 +-
>   target/ppc/cpu.c         |   2 +-
>   target/ppc/cpu.h         | 214 ++++++++++++++++++---------------------
>   target/ppc/cpu_init.c    |  23 +++--
>   target/ppc/excp_helper.c |  66 +++++++-----
>   target/ppc/fpu_helper.c  |  28 ++---
>   target/ppc/gdbstub.c     |   2 +-
>   target/ppc/helper_regs.c |  12 +--
>   target/ppc/kvm.c         |   7 +-
>   target/ppc/machine.c     |   2 +-
>   target/ppc/mem_helper.c  |  23 +++--
>   target/ppc/misc_helper.c |   2 +-
>   target/ppc/mmu-radix64.c |  11 +-
>   target/ppc/mmu_common.c  |  40 ++++----
>   target/ppc/mmu_helper.c  |   6 +-
>   16 files changed, 225 insertions(+), 217 deletions(-)
> 


