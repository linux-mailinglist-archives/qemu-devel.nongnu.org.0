Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E684939E5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 12:50:24 +0100 (CET)
Received: from localhost ([::1]:42110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA9Tr-0002YI-He
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 06:50:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nA97w-0000QH-C9
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:27:45 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:42293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nA97r-0003ze-IC
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:27:42 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A722FD8B0276;
 Wed, 19 Jan 2022 12:27:23 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 12:27:23 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00540f99e9e-59e5-4df1-a49a-3776f4aac9ef,
 D7DF39B65A0956CFE557F682C3487E629228C0D9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7fd0c83c-ebd7-fc77-a05d-7fd2dd7b430b@kaod.org>
Date: Wed, 19 Jan 2022 12:27:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 01/14] target/ppc: 405: Rename MSR_POW to MSR_WE
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-2-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220118184448.852996-2-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3cbf0722-9318-4596-9b69-542da7e20346
X-Ovh-Tracer-Id: 17697739161528666918
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudehgddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsrghlrghtohhnsegvihhkrdgsmhgvrdhhuh
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 19:44, Fabiano Rosas wrote:
> Bit 13 is the Wait State Enable bit. Give it its proper name.
> 
> As far as I can see we don't do anything with MSR_POW for the 405, so
> this change has no effect.
> 
> Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/cpu.h      | 1 +
>   target/ppc/cpu_init.c | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 2560b70c5f..66e13075c3 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -327,6 +327,7 @@ typedef enum {
>   #define MSR_S    22 /* Secure state                                          */
>   #define MSR_KEY  19 /* key bit on 603e                                       */
>   #define MSR_POW  18 /* Power management                                      */
> +#define MSR_WE   18 /* Wait State Enable on 405                              */
>   #define MSR_TGPR 17 /* TGPR usage on 602/603                        x        */
>   #define MSR_CE   17 /* Critical interrupt enable on embedded PowerPC x       */
>   #define MSR_ILE  16 /* Interrupt little-endian mode                          */
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index e30e86fe9d..e63705b1c6 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -2535,7 +2535,7 @@ POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
>                          PPC_MEM_SYNC | PPC_MEM_EIEIO |
>                          PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
>                          PPC_4xx_COMMON | PPC_405_MAC | PPC_40x_EXCP;
> -    pcc->msr_mask = (1ull << MSR_POW) |
> +    pcc->msr_mask = (1ull << MSR_WE) |
>                       (1ull << MSR_CE) |
>                       (1ull << MSR_EE) |
>                       (1ull << MSR_PR) |
> 


