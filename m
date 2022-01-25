Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1057149B3CB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 13:21:37 +0100 (CET)
Received: from localhost ([::1]:49386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCKpL-00046j-Qj
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 07:21:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nCKeA-0004pT-QC; Tue, 25 Jan 2022 07:10:03 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:38581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nCKe6-0001Lr-SQ; Tue, 25 Jan 2022 07:10:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.141])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 52332D9E42EE;
 Tue, 25 Jan 2022 13:09:50 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 25 Jan
 2022 13:09:49 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00699dfd747-7751-4484-bae2-f6d09f31e81f,
 81DEFC5675B4A2B0B4575F732D37872089199EF9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3f226f0a-e98e-103b-631c-e1b7bbd47e06@kaod.org>
Date: Tue, 25 Jan 2022 13:09:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/5] target/ppc: books: Machine Check exception cleanup
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220124184605.999353-1-farosas@linux.ibm.com>
 <20220124184605.999353-4-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220124184605.999353-4-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 38ea40eb-e8a6-49b4-8fa3-3dd3b3a959eb
X-Ovh-Tracer-Id: 16757331265399983011
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/24/22 19:46, Fabiano Rosas wrote:
> powerpc_excp_books is BookS only, so remove 40x and BookE code.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   target/ppc/excp_helper.c | 17 -----------------
>   1 file changed, 17 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 0d27dfb2c5..e5f09e1984 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -632,23 +632,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>           /* machine check exceptions don't have ME set */
>           new_msr &= ~((target_ulong)1 << MSR_ME);
>   
> -        /* XXX: should also have something loaded in DAR / DSISR */
> -        switch (excp_model) {
> -        case POWERPC_EXCP_40x:
> -            srr0 = SPR_40x_SRR2;
> -            srr1 = SPR_40x_SRR3;
> -            break;
> -        case POWERPC_EXCP_BOOKE:
> -            /* FIXME: choose one or the other based on CPU type */
> -            srr0 = SPR_BOOKE_MCSRR0;
> -            srr1 = SPR_BOOKE_MCSRR1;
> -
> -            env->spr[SPR_BOOKE_CSRR0] = env->nip;
> -            env->spr[SPR_BOOKE_CSRR1] = msr;
> -            break;
> -        default:
> -            break;
> -        }
>           break;
>       case POWERPC_EXCP_DSI:       /* Data storage exception                   */
>           trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
> 


