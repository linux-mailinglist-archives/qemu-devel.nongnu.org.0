Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3736048A9B4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 09:40:30 +0100 (CET)
Received: from localhost ([::1]:40718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Chh-0006vT-9H
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 03:40:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7Cez-0005Bl-LQ
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 03:37:44 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:44915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7Cew-0003nt-ER
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 03:37:41 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.235])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 8FCBD22015;
 Tue, 11 Jan 2022 08:37:35 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 11 Jan
 2022 09:37:34 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002813bb30d-b94f-4c55-86ff-b0ec5869d8fb,
 5383433EA887FCAE918FFCB03530F9AACAE8953B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <529d0efc-2deb-162c-011d-bd64ddb45234@kaod.org>
Date: Tue, 11 Jan 2022 09:37:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/8] target/ppc: powerpc_excp improvements [40x] (3/n)
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220110181546.4131853-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9c6de5cd-98e6-4a2b-aed6-659d0695b26c
X-Ovh-Tracer-Id: 4742008933109173097
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehvddguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevtedvjefgvdeuudfggfeukeethfdtfeetfeffkeekgfekheeihedufeeitddvueenucffohhmrghinhepnhhonhhgnhhurdhorhhgpdhgnhhurdhorhhgpdhgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuh
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 19:15, Fabiano Rosas wrote:
> This is the first series of the exception model-specific changes. I
> intend to keep this same structure for the rest of the exception
> models.
> 
> == preparation ==
> 
> First few patches are cleanups specific to this model. This comes
> first because I'm using some of these changes to help validate what
> should be removed in the subsequent patches.
> 
> == new powerpc_excp function ==
> 
> One patch copies the powerpc_excp function as is and renames it to the
> exception model in question. Doing this first facilitates spotting
> what changed from the _legacy version.
> 
> The following patch changes everything that needs to be changed at the
> top level (MSR mask, SF, ILE, AIL, SRRs, etc.) and removes exceptions
> that are not used by this processor family.
> 
> == exceptions cleanup ==
> 
> After the new powerpc_excp function has been made specific to that one
> exception model, go through every exception removing anything that
> does not apply to this model.
> 
> Based on legoater/ppc-7.0
> 
> Cleanups 2/n [in ppc-7.0]:
> https://lists.nongnu.org/archive/html/qemu-ppc/2022-01/msg00252.html
> 
> Cleanups 1/n [already merged]:
> https://mail.gnu.org/archive/html/qemu-ppc/2021-12/msg00696.html
> 
> RFC v2:
> https://lists.nongnu.org/archive/html/qemu-ppc/2021-12/msg00542.html
> 
> RFC v1:
> https://lists.nongnu.org/archive/html/qemu-ppc/2021-06/msg00026.html
> 
> Fabiano Rosas (8):
>    target/ppc: 405: Add missing MSR bits to msr_mask
>    target/ppc: 405: Add missing exception handlers
>    target/ppc: Introduce powerpc_excp_40x
>    squash target/ppc: Introduce powerpc_excp_40x
>    target/ppc: 405: Critical exceptions cleanup
>    target/ppc: 405: Machine check exception cleanup
>    target/ppc: 405: External exception cleanup
>    target/ppc: 405: System call exception cleanup
> 
>   target/ppc/cpu_init.c    |   8 +-
>   target/ppc/excp_helper.c | 246 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 253 insertions(+), 1 deletion(-)
> 

The 405 CPU emulation is not "fully" functional today. the latest kernel
boots, see instructions here :

   https://github.com/legoater/qemu/wiki/ref405ep

but user space segfaults after a while. I suspect some registers (r31)
being clobbered. The same user space image boots correctly under the
QEMU bamboo machine using a 440EP CPU.

That said, the 405 MMU, DECR, SYSCALL exceptions seem to work fine.
So it might be the kernel in some dark corner when restoring user
context.

It would be nice to fix to get a test better coverage for this patchset.
Anyhow, these are good cleanups and they won't be gated by 405 user
space being broken.

Thanks,

C.


