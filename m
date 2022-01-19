Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3835E493988
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 12:34:12 +0100 (CET)
Received: from localhost ([::1]:46968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA9EB-00039v-AX
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 06:34:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nA96w-0008Ka-0b
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:26:42 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:36581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nA96s-0003m9-1v
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:26:41 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.162])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id BCD8420FE5;
 Wed, 19 Jan 2022 11:26:22 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 12:26:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006a7e72bde-bde2-4398-86f5-cb0300193c1e,
 D7DF39B65A0956CFE557F682C3487E629228C0D9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <918ed9ee-8904-a003-4582-ee11062a7c7e@kaod.org>
Date: Wed, 19 Jan 2022 12:26:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 02/14] target/ppc: 405: Add missing MSR_ME bit
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-3-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220118184448.852996-3-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 474f0e10-f1a0-488e-b90a-cd3553e2059a
X-Ovh-Tracer-Id: 17680569187363162918
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudehgddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsrghlrghtohhnsegvihhkrdgsmhgvrdhhuh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 19:44, Fabiano Rosas wrote:
> The 405 MSR has the Machine Check Enable bit. We're making use of it
> when dispatching Machine Check, so add the bit to the msr_mask.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   target/ppc/cpu_init.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index e63705b1c6..23a13036b2 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -2540,6 +2540,7 @@ POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
>                       (1ull << MSR_EE) |
>                       (1ull << MSR_PR) |
>                       (1ull << MSR_FP) |
> +                    (1ull << MSR_ME) |
>                       (1ull << MSR_DWE) |
>                       (1ull << MSR_DE) |
>                       (1ull << MSR_IR) |
> 


