Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9319A62D86E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 11:52:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovcTO-0005jo-Vt; Thu, 17 Nov 2022 05:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1ovcTM-0005jQ-M9; Thu, 17 Nov 2022 05:50:20 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1ovcTK-0006ux-EW; Thu, 17 Nov 2022 05:50:20 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.193])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9081113FE649E;
 Thu, 17 Nov 2022 11:50:13 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 17 Nov
 2022 11:50:12 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006fb0943b1-95f7-4e4d-bcdb-0c0e18157452,
 247B43F2E41D7204BC7F135E5139F4EBEC0764F5) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 17 Nov 2022 11:50:05 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
CC: Vaibhav Jain <vaibhav@linux.ibm.com>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>, <david@gibson.dropbear.id.au>, <clg@kaod.org>,
 "Kowshik Jois B S" <kowsjois@linux.ibm.com>
Subject: Re: [PATCH] target/ppc: Fix build warnings when building with
 'disable-tcg'
Message-ID: <20221117115005.4b23a318@bahia>
In-Reply-To: <9b92deef-e0ef-101d-8f7e-2b4634bde6de@gmail.com>
References: <20221116131743.658708-1-vaibhav@linux.ibm.com>
 <9b92deef-e0ef-101d-8f7e-2b4634bde6de@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 5abef19b-8e55-47b4-b6ea-b8e20822dd81
X-Ovh-Tracer-Id: 1289436869567420777
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehhfevffdtffdvudeuvedvjedtkeffjedvledtvdejudejueetudejgeelheehvdenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoghhrohhugheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhvrghisghhrghvsehlihhnuhigrdhisghmrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhkohifshhjohhisheslhhinhhugidrihgsmhdrtghomhdptghlgheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmoh
 guvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 17 Nov 2022 07:11:51 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> Queued in gitlab.com/danielhb/qemu/tree/ppc-next with the following tags:
>=20

You are planning a PR before 7.2-rc2, right ?

>=20
>      Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>      Fixes: 61bd1d2942 ("target/ppc: Convert to tcg_ops restore_state_to_=
opc")
>      Fixes: 670f1da374 ("target/ppc: Implement hashst and hashchk")

The guard macro also covers the following two, introduced by yet another co=
mmit.

  HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
  HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)

Fixes: 53ae2aeb9407 ("target/ppc: Implement hashstp and hashchkp")

>      Resolves: https://gitlab.com/qemu-project/qemu/-/issues/377

Err... I don't see any relation with this issue.

Cedric ?

But this resolves the issue created by Vaibhav for 7.2 :

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1319

>      Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>      Reviewed-by: Greg Kurz <groug@kaod.org>
>      Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>      Tested-by: Kowshik Jois B S <kowsjois@linux.vnet.ibm.com>
>=20
>=20
> Thanks,
>=20
>=20
> Daniel
>=20
> On 11/16/22 10:17, Vaibhav Jain wrote:
> > Kowshik reported that building qemu with GCC 12.2.1 for 'ppc64-softmmu'
> > target is failing due to following build warnings:
> >=20
> > <snip>
> >   ../target/ppc/cpu_init.c:7018:13: error: 'ppc_restore_state_to_opc' d=
efined but not used [-Werror=3Dunused-function]
> >   7018 | static void ppc_restore_state_to_opc(CPUState *cs,
> > <snip>
> >=20
> > Fix this by wrapping these function definitions in 'ifdef CONFIG_TCG' s=
o that
> > they are only defined if qemu is compiled with '--enable-tcg'
> >=20
> > Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
> > Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> > ---
> >   target/ppc/cpu_init.c    | 2 ++
> >   target/ppc/excp_helper.c | 2 ++
> >   2 files changed, 4 insertions(+)
> >=20
> > diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> > index 32e94153d1..cbf0081374 100644
> > --- a/target/ppc/cpu_init.c
> > +++ b/target/ppc/cpu_init.c
> > @@ -7015,6 +7015,7 @@ static vaddr ppc_cpu_get_pc(CPUState *cs)
> >       return cpu->env.nip;
> >   }
> >  =20
> > +#ifdef CONFIG_TCG
> >   static void ppc_restore_state_to_opc(CPUState *cs,
> >                                        const TranslationBlock *tb,
> >                                        const uint64_t *data)
> > @@ -7023,6 +7024,7 @@ static void ppc_restore_state_to_opc(CPUState *cs,
> >  =20
> >       cpu->env.nip =3D data[0];
> >   }
> > +#endif /* CONFIG_TCG */
> >  =20
> >   static bool ppc_cpu_has_work(CPUState *cs)
> >   {
> > diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> > index a05a2ed595..94adcb766b 100644
> > --- a/target/ppc/excp_helper.c
> > +++ b/target/ppc/excp_helper.c
> > @@ -2842,6 +2842,7 @@ void helper_td(CPUPPCState *env, target_ulong arg=
1, target_ulong arg2,
> >   #endif
> >   #endif
> >  =20
> > +#ifdef CONFIG_TCG
> >   static uint32_t helper_SIMON_LIKE_32_64(uint32_t x, uint64_t key, uin=
t32_t lane)
> >   {
> >       const uint16_t c =3D 0xfffc;
> > @@ -2924,6 +2925,7 @@ HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
> >   HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
> >   HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
> >   HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
> > +#endif /* CONFIG_TCG */
> >  =20
> >   #if !defined(CONFIG_USER_ONLY)
> >  =20


