Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAD44AEC2F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 09:24:05 +0100 (CET)
Received: from localhost ([::1]:37516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHiGi-0006Om-9E
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 03:24:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nHhdE-0003I1-2Q
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 02:43:25 -0500
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:34679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nHhdB-0004qe-9S
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 02:43:15 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.21])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 505E421300;
 Wed,  9 Feb 2022 07:43:10 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 08:43:07 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00163ac441d-d96b-49e6-8592-62372a2343a0,
 6011F8B921976590CD78E2F91FBBAF540C01AD6C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.223.183
Message-ID: <39470e0f-ce5d-30c6-def2-86f6bde2959b@kaod.org>
Date: Wed, 9 Feb 2022 08:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/11] target/ppc: powerpc_excp improvements [BookE] (6/n)
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220128224018.1228062-1-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220128224018.1228062-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 91f8ae6c-833d-44d9-8ebf-b1d66665ff58
X-Ovh-Tracer-Id: 8110419980839717795
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrheekgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/22 23:40, Fabiano Rosas wrote:
> This series handles the BookE exception code.
> 
> Tested the following machines/CPUs:
> 
> == bamboo ==
> 440ep, 460ex, 440-xilinx-w-dfpu
> 
> == sam460ex ==
> 440ep, 460ex, 440-xilinx-w-dfpu
> 
> == mpc8544ds ==
> e500v1, e500v2
> 
> == ppce500 ==
> e500mc, e5500, e6500
> 
> About the remaining CPUs:
> 
> - The 440x4 have been partially removed in the past. I sent a separate
>    patch removing what's left of it.
> 
> - The 440x5 (440-xilinx) boots with the bamboo machine but it
>    segfaults in userspace (also in master).
> 
> - The e200 is broken in master due to an assert in _spr_register (the
>    DSRR0/1 registers are being registered twice). After fixing that
>    QEMU crashes due to lack of IRQ controller (there's a TODO in the
>    init_proc_e200).
> 
> Fabiano Rosas (11):
>    target/ppc: Introduce powerpc_excp_booke
>    target/ppc: Simplify powerpc_excp_booke
>    target/ppc: booke: Critical exception cleanup
>    target/ppc: booke: Machine Check cleanups
>    target/ppc: booke: Data Storage exception cleanup
>    target/ppc: booke: Instruction storage exception cleanup
>    target/ppc: booke: External interrupt cleanup
>    target/ppc: booke: Alignment interrupt cleanup
>    target/ppc: booke: System Call exception cleanup
>    target/ppc: booke: Watchdog Timer interrupt
>    target/ppc: booke: System Reset exception cleanup
> 
>   target/ppc/excp_helper.c | 228 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 228 insertions(+)
> 
Applied to ppc-7.0.

Thanks,

C.



