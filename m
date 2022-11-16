Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 827EC62C260
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 16:22:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovKDZ-0000iv-Q2; Wed, 16 Nov 2022 10:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ovKDX-0000i7-PA
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 10:20:47 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ovKDU-0002qS-6T
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 10:20:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.144])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id AA325293AA;
 Wed, 16 Nov 2022 15:20:32 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 16 Nov
 2022 16:20:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00169ed0103-b021-4210-b355-055f42446ca6,
 05BFD173BFC32032A37E1D5DF151F249ADEF9212) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 16 Nov 2022 16:20:25 +0100
From: Greg Kurz <groug@kaod.org>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
CC: <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>,
 <david@gibson.dropbear.id.au>, <clg@kaod.org>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, "Kowshik Jois B S" <kowsjois@linux.ibm.com>
Subject: Re: [PATCH] target/ppc: Fix build warnings when building with
 'disable-tcg'
Message-ID: <20221116162025.330e5a4f@bahia>
In-Reply-To: <20221116131743.658708-1-vaibhav@linux.ibm.com>
References: <20221116131743.658708-1-vaibhav@linux.ibm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 7f3abd74-02ff-438d-bc7c-3231644c32c6
X-Ovh-Tracer-Id: 18428729677405919593
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeigdejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeludeltdejkeduveeiuedthfelueefkeeuiefhieehvedtjeejtdffiefhfeeuveenucffohhmrghinhepnhhonhhgnhhurdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoghhrohhugheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehvrghisghhrghvsehlihhnuhigrdhisghmrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhkohifshhjohhisheslhhinhhugidrihgsmhdrtghomhdptghlgheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmoh
 guvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.49.222; envelope-from=groug@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Vaibhav,

Nice to see some people are still building QEMU at IBM ;-)

On Wed, 16 Nov 2022 18:47:43 +0530
Vaibhav Jain <vaibhav@linux.ibm.com> wrote:

> Kowshik reported that building qemu with GCC 12.2.1 for 'ppc64-softmmu'
> target is failing due to following build warnings:
> 
> <snip>
>  ../target/ppc/cpu_init.c:7018:13: error: 'ppc_restore_state_to_opc' defined but not used [-Werror=unused-function]
>  7018 | static void ppc_restore_state_to_opc(CPUState *cs,
> <snip>
> 
> Fix this by wrapping these function definitions in 'ifdef CONFIG_TCG' so that
> they are only defined if qemu is compiled with '--enable-tcg'
> 
> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

This was introduced by a recent commit.

Fixes: 61bd1d29421a ("target/ppc: Convert to tcg_ops restore_state_to_opc")


Vaibhav,

This is serious enough it should get fixed in 7.2. Please fill up an
issue as explain in [1].

Cheers,

--
Greg

[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg00137.html

>  target/ppc/cpu_init.c    | 2 ++
>  target/ppc/excp_helper.c | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 32e94153d1..cbf0081374 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7015,6 +7015,7 @@ static vaddr ppc_cpu_get_pc(CPUState *cs)
>      return cpu->env.nip;
>  }
>  
> +#ifdef CONFIG_TCG
>  static void ppc_restore_state_to_opc(CPUState *cs,
>                                       const TranslationBlock *tb,
>                                       const uint64_t *data)
> @@ -7023,6 +7024,7 @@ static void ppc_restore_state_to_opc(CPUState *cs,
>  
>      cpu->env.nip = data[0];
>  }
> +#endif /* CONFIG_TCG */
>  
>  static bool ppc_cpu_has_work(CPUState *cs)
>  {
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index a05a2ed595..94adcb766b 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -2842,6 +2842,7 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
>  #endif
>  #endif
>  
> +#ifdef CONFIG_TCG
>  static uint32_t helper_SIMON_LIKE_32_64(uint32_t x, uint64_t key, uint32_t lane)
>  {
>      const uint16_t c = 0xfffc;
> @@ -2924,6 +2925,7 @@ HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
>  HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
>  HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
>  HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
> +#endif /* CONFIG_TCG */
>  
>  #if !defined(CONFIG_USER_ONLY)
>  


