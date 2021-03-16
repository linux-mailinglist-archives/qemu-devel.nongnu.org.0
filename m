Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA55233CFCC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:26:24 +0100 (CET)
Received: from localhost ([::1]:57012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM51z-0005C3-Qf
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lM4sy-00006w-1g; Tue, 16 Mar 2021 04:17:04 -0400
Received: from 7.mo51.mail-out.ovh.net ([46.105.33.25]:33873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lM4sw-0001eD-4X; Tue, 16 Mar 2021 04:17:03 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.149])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id C781B27371A;
 Tue, 16 Mar 2021 09:16:57 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 16 Mar
 2021 09:16:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003b1b4bf3b-1861-410b-ae3e-4f5536ad6450,
 F4745E3E32A08DF6AE8813652EB4480BB0CFD8A0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v4 06/17] target/ppc: Fix comment for MSR_FE{0,1}
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5a7d9f75-a77d-b0a6-c87a-7766628c04ce@kaod.org>
Date: Tue, 16 Mar 2021 09:16:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210315184615.1985590-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9fb6de86-a5a1-4354-8f2f-a1ef667f79ae
X-Ovh-Tracer-Id: 7600105847524330464
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefuddguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 7:46 PM, Richard Henderson wrote:
> As per hreg_compute_hflags:
> 
>   We 'forget' FE0 & FE1: we'll never generate imprecise exceptions
> 
> remove the hflags marker from the respective comments.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  target/ppc/cpu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 79c4033a42..fd13489dce 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -322,13 +322,13 @@ typedef struct ppc_v3_pate_t {
>  #define MSR_PR   14 /* Problem state                                  hflags */
>  #define MSR_FP   13 /* Floating point available                       hflags */
>  #define MSR_ME   12 /* Machine check interrupt enable                        */
> -#define MSR_FE0  11 /* Floating point exception mode 0                hflags */
> +#define MSR_FE0  11 /* Floating point exception mode 0                       */
>  #define MSR_SE   10 /* Single-step trace enable                     x hflags */
>  #define MSR_DWE  10 /* Debug wait enable on 405                     x        */
>  #define MSR_UBLE 10 /* User BTB lock enable on e500                 x        */
>  #define MSR_BE   9  /* Branch trace enable                          x hflags */
>  #define MSR_DE   9  /* Debug interrupts enable on embedded PowerPC  x        */
> -#define MSR_FE1  8  /* Floating point exception mode 1                hflags */
> +#define MSR_FE1  8  /* Floating point exception mode 1                       */
>  #define MSR_AL   7  /* AL bit on POWER                                       */
>  #define MSR_EP   6  /* Exception prefix on 601                               */
>  #define MSR_IR   5  /* Instruction relocate                                  */
> 


