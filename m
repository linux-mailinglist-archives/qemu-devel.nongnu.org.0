Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296E74AECAD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 09:37:51 +0100 (CET)
Received: from localhost ([::1]:49238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHiU1-0006MM-Ge
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 03:37:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nHhek-0003OR-Mi; Wed, 09 Feb 2022 02:44:52 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:37125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nHheA-0004vu-Eh; Wed, 09 Feb 2022 02:44:15 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1420EDE023E8;
 Wed,  9 Feb 2022 08:44:12 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 08:44:11 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0036bf7896b-55cd-4949-aa6a-52e509768a37,
 D657DFC387B0B0E2C5DD546C0716E11BBFCF4DEE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.223.183
Message-ID: <ea9b7196-53c1-7bee-a3b5-c50a1ff9d9d5@kaod.org>
Date: Wed, 9 Feb 2022 08:44:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/11] target/ppc: powerpc_excp improvements [6xx] (7/n)
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220203200957.1434641-1-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220203200957.1434641-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 74748b42-9a42-42bb-9e60-d7e4d43ae19f
X-Ovh-Tracer-Id: 8127589953763642275
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrheekgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhm
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 21:09, Fabiano Rosas wrote:
> This series handles the 6xx family: 603, 604, G2, G2LE, MPC5xx and
> MPC8xx.
> 
> There is a patch upfront to move them all into the same
> POWERPC_EXCP_6xx, but otherwise the rest of the series is pretty much
> the same as I have done for the other CPUs.
> 
> This was tested with the 604 only. But I'm not too worried because
> these 32 bit CPUs are quite similar to one another.
> 
> Fabiano Rosas (11):
>    target/ppc: Merge exception model IDs for 6xx CPUs
>    target/ppc: Introduce powerpc_excp_6xx
>    target/ppc: Simplify powerpc_excp_6xx
>    target/ppc: 6xx: Critical exception cleanup
>    target/ppc: 6xx: Machine Check exception cleanup
>    target/ppc: 6xx: External interrupt cleanup
>    target/ppc: 6xx: Program exception cleanup
>    target/ppc: 6xx: System Call exception cleanup
>    target/ppc: 6xx: System Reset interrupt cleanup
>    target/ppc: 6xx: Software TLB exceptions cleanup
>    target/ppc: 6xx: Set SRRs directly in exception code
> 
>   target/ppc/cpu-qom.h     |   8 +-
>   target/ppc/cpu_init.c    |  18 ++--
>   target/ppc/excp_helper.c | 200 ++++++++++++++++++++++++++++++++++++++-
>   3 files changed, 208 insertions(+), 18 deletions(-)
> 


Applied to ppc-7.0.

Thanks,

C.


