Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40314A9461
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 08:16:20 +0100 (CET)
Received: from localhost ([::1]:53222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFspP-00086q-HU
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 02:16:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nFsK4-00048g-Nf
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 01:44:03 -0500
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:35429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nFsJs-00042q-Qt
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 01:43:52 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.62])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4FD9420E75;
 Fri,  4 Feb 2022 06:42:39 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Feb
 2022 07:42:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0045dfb7e65-c95f-42b2-8df0-186c7750d44a,
 E02F21966AB5735DF2D4F60193DC12F1F11ACCB9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f8a83c3d-be90-30bc-5cdf-752fe3d1b04c@kaod.org>
Date: Fri, 4 Feb 2022 07:42:38 +0100
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
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6e8288b6-b148-4fc1-91bd-3d1650a53944
X-Ovh-Tracer-Id: 14618402917176675235
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrgeekgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 2/3/22 21:09, Fabiano Rosas wrote:

> This series handles the 6xx family: 603, 604, G2, G2LE, 

What about the e300 ? I guess it's only a 603 variant for QEMU.

> MPC5xx and MPC8xx.

These are linux-user only, no MMU. I wonder if we shouldn't simply
drop support. At least we could remove POWERPC_MMU_MPC8xx.

C.

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


