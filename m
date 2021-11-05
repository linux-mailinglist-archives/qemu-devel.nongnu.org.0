Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87972446AEB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 23:32:12 +0100 (CET)
Received: from localhost ([::1]:40008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj7kp-0005yJ-5L
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 18:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mj7jY-00058N-Fj; Fri, 05 Nov 2021 18:30:52 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:46183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mj7jW-0007Wl-LF; Fri, 05 Nov 2021 18:30:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.105])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2B56CC9C72E2;
 Fri,  5 Nov 2021 23:30:46 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 5 Nov
 2021 23:30:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00599a222a3-0a61-47c0-b575-47f05382123f,
 ACBEE74C211706A3681C4B00B96A7A61B931BAD7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b156132f-e798-4abd-140a-632c23b0d5a7@kaod.org>
Date: Fri, 5 Nov 2021 23:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw/ppc/mac.h: Remove MAX_CPUS macro
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>
References: <20211105184216.120972-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211105184216.120972-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4b7b84e6-58a4-4fc2-b6a8-ac4400ee42c7
X-Ovh-Tracer-Id: 12724357797778918368
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeigdduiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekkeefheefvdefhefgjeelveekheeileehudevkeefvdfhleetiedvffdtudeknecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 19:42, Peter Maydell wrote:
> The mac.h header defines a MAX_CPUS macro. This is confusingly named,
> because it suggests it's a generic setting, but in fact it's used
> by only the g3beige and mac99 machines. It's also using a single
> macro for two values which aren't inherently the same -- if one
> of these two machines was updated to support SMP configurations
> then it would want a different max_cpus value to the other.
> 
> Since the macro is used in only two places, just expand it out
> and get rid of it. If hypothetical future work to support SMP
> in these boards needs a compile-time-known limit on the number
> of CPUs, we can give it a suitable name at that point.

Yes. the mac99 could theoretically support SMP with the 970MP CPU
but I have never seen plan for this.

Anyhow,
  
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
> Minor bit of cleanup prompted by discussion on
> https://gitlab.com/qemu-project/qemu/-/issues/672
> ---
>   hw/ppc/mac.h          | 3 ---
>   hw/ppc/mac_newworld.c | 3 ++-
>   hw/ppc/mac_oldworld.c | 3 ++-
>   3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
> index 22c8408078d..a1fa8f8e41a 100644
> --- a/hw/ppc/mac.h
> +++ b/hw/ppc/mac.h
> @@ -36,9 +36,6 @@
>   #include "hw/pci-host/uninorth.h"
>   #include "qom/object.h"
>   
> -/* SMP is not enabled, for now */
> -#define MAX_CPUS 1
> -
>   #define NVRAM_SIZE        0x2000
>   #define PROM_FILENAME    "openbios-ppc"
>   
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 7bb7ac39975..4bddb529c2a 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -581,7 +581,8 @@ static void core99_machine_class_init(ObjectClass *oc, void *data)
>       mc->desc = "Mac99 based PowerMAC";
>       mc->init = ppc_core99_init;
>       mc->block_default_type = IF_IDE;
> -    mc->max_cpus = MAX_CPUS;
> +    /* SMP is not supported currently */
> +    mc->max_cpus = 1;
>       mc->default_boot_order = "cd";
>       mc->default_display = "std";
>       mc->kvm_type = core99_kvm_type;
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index de2be960e6c..7016979a7cd 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -423,7 +423,8 @@ static void heathrow_class_init(ObjectClass *oc, void *data)
>       mc->desc = "Heathrow based PowerMAC";
>       mc->init = ppc_heathrow_init;
>       mc->block_default_type = IF_IDE;
> -    mc->max_cpus = MAX_CPUS;
> +    /* SMP is not supported currently */
> +    mc->max_cpus = 1;
>   #ifndef TARGET_PPC64
>       mc->is_default = true;
>   #endif
> 


