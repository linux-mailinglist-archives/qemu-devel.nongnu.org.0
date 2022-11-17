Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F59162E123
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 17:11:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovhSq-0002pL-Lk; Thu, 17 Nov 2022 11:10:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ovhSk-0002oZ-88
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:10:02 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ovhSi-0006Il-IL
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:10:01 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.216])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 243DF1400F3BF;
 Thu, 17 Nov 2022 17:09:47 +0100 (CET)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 17 Nov
 2022 17:09:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001e5771bad-94b4-4de6-a678-74d6f7be063b,
 AE5717285A2AC47C671D2CB192D1CF6730B7D7F3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1b9e9c89-f9d0-7914-30b6-2ba0ea43c7ac@kaod.org>
Date: Thu, 17 Nov 2022 17:09:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0] MAINTAINERS: downgrade PPC KVM/TCG CPUs and
 pSeries to 'Odd Fixes'
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>, Greg
 Kurz <groug@kaod.org>
References: <20221117153218.182835-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221117153218.182835-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 5abac170-f7a1-41b4-a121-251cdc1316cb
X-Ovh-Tracer-Id: 6686438073125211043
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgdekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/17/22 16:32, Daniel Henrique Barboza wrote:
> The maintainer is no longer being paid to maintain these components. All
> maintainership work is being done in his personal time since the middle
> of the 7.2 development cycle.

Thanks to you, Daniel. It was great work !
  
> Change the status of PPC KVM CPUs, PPC TCG CPUs and the pSeries machine
> to 'Odd Fixes', reflecting that the maintainer no longer has exclusive
> time to dedicate to them. It'll also (hopefully) keep expectations under
> check when/if these components are used in a customer product.
> 
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

C.

> ---
>   MAINTAINERS | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index be151f0024..1d43153e5f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -264,7 +264,7 @@ R: Cédric Le Goater <clg@kaod.org>
>   R: David Gibson <david@gibson.dropbear.id.au>
>   R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
> -S: Maintained
> +S: Odd Fixes
>   F: target/ppc/
>   F: hw/ppc/ppc.c
>   F: hw/ppc/ppc_booke.c
> @@ -389,7 +389,7 @@ M: Daniel Henrique Barboza <danielhb413@gmail.com>
>   R: Cédric Le Goater <clg@kaod.org>
>   R: David Gibson <david@gibson.dropbear.id.au>
>   R: Greg Kurz <groug@kaod.org>
> -S: Maintained
> +S: Odd Fixes
>   F: target/ppc/kvm.c
>   
>   S390 KVM CPUs
> @@ -1367,7 +1367,7 @@ R: Cédric Le Goater <clg@kaod.org>
>   R: David Gibson <david@gibson.dropbear.id.au>
>   R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
> -S: Maintained
> +S: Odd Fixes
>   F: hw/*/spapr*
>   F: include/hw/*/spapr*
>   F: hw/*/xics*


