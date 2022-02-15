Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CCD4B7468
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 19:34:50 +0100 (CET)
Received: from localhost ([::1]:58384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK2f3-0002wD-OC
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 13:34:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nK2dW-0001M5-Az
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:33:14 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:59449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nK2dU-0006BH-1Q
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:33:13 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.235])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 61459E01ED07;
 Tue, 15 Feb 2022 19:33:09 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 19:33:08 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002d20b8875-5019-4f3a-a5da-3ee40d1cd3fe,
 2487B4E7026A90D95ED29794538901B35B4D209A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <459593cb-6ab7-1998-687d-7b4b96f8cb97@kaod.org>
Date: Tue, 15 Feb 2022 19:33:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/9] ppc: nested KVM HV for spapr virtual hypervisor
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20220215031642.1691873-1-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220215031642.1691873-1-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 79c041b9-a79f-46bb-b571-8632ff1ca0de
X-Ovh-Tracer-Id: 17430337933397625824
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeggdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehfrghrohhsrghssehlihhnuhigrdhisghmrdgtohhm
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
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
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/22 04:16, Nicholas Piggin wrote:
> Here is the rollup of patches in much better shape since the RFC.
> I include the 2 first ones unchanged from independent submission
> just to be clear that this series requires them.
> 
> Thanks Cedric and Fabiano for wading through my poor quality RFC
> code, very good changes suggested and I hope I got most of them
> and this one is easier to follow.

This is in good shape and functional. I will try to propose a small
buildroot environment for it, so that we don't have to start a full
distro to test.

I would like to talk about the naming. KVM-HV is I think "reserved"
to the PowerNV platform (baremetal). We also have KVM-PR which runs
KVM guests on various platforms, including pseries.

How can we call this yet another KVM PPC implementation ?

Thanks,

C.

> 
> Thanks,
> Nick
> 
> Nicholas Piggin (9):
>    target/ppc: raise HV interrupts for partition table entry problems
>    spapr: prevent hdec timer being set up under virtual hypervisor
>    ppc: allow the hdecr timer to be created/destroyed
>    target/ppc: add vhyp addressing mode helper for radix MMU
>    target/ppc: make vhyp get_pate method take lpid and return success
>    target/ppc: add helper for books vhyp hypercall handler
>    target/ppc: Add powerpc_reset_excp_state helper
>    target/ppc: Introduce a vhyp framework for nested HV support
>    spapr: implement nested-hv capability for the virtual hypervisor
> 
>   hw/ppc/pegasos2.c        |   6 +
>   hw/ppc/ppc.c             |  22 ++-
>   hw/ppc/spapr.c           |  41 ++++-
>   hw/ppc/spapr_caps.c      |  11 +-
>   hw/ppc/spapr_cpu_core.c  |   6 +-
>   hw/ppc/spapr_hcall.c     | 321 +++++++++++++++++++++++++++++++++++++++
>   include/hw/ppc/ppc.h     |   3 +
>   include/hw/ppc/spapr.h   |  74 ++++++++-
>   target/ppc/cpu.h         |   8 +-
>   target/ppc/excp_helper.c | 129 ++++++++++++----
>   target/ppc/mmu-radix64.c |  41 ++++-
>   11 files changed, 610 insertions(+), 52 deletions(-)
> 


