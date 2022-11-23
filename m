Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EE363634E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 16:22:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxrYz-0004nI-MR; Wed, 23 Nov 2022 10:21:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oxrYx-0004mu-R0
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:21:23 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oxrYv-0006QX-O6
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:21:23 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B8BF63200201;
 Wed, 23 Nov 2022 10:21:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 23 Nov 2022 10:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669216876; x=
 1669303276; bh=Bpzkm/pqw9X0+qFuY2n0rtbp1dgYmfCxWmx/QFzhiEs=; b=v
 kvzk28fRqg2CgFugQiYRgG9QywEfc2RnX40zFxJ8RXsvto8t5r9rHjAZZgtXP5Qd
 9xHgeNF9qKa+9aClFZnA9fI1ZuYmP+JETgTCBT+sbSDoSjMzHayonfbCaAYyJFeH
 ogDx9BEAReZIYL/FNK9MFelZazgTLmwanx9sVdhPUKTV25O31lzQFVPzRIeY+AqX
 vIe052/6wIAT+dN3ImPigI8X5nGbARt9YoyljyPRATNOK7bzRV5enisjg86GGX9Y
 PAj8plQO+u6YtjSSlSjJm7yITM1HarrymismRql/B4rnbBrqhn06RlzTV/vYbetv
 I5H0DcJvcgSSy3YdRZJAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669216876; x=
 1669303276; bh=Bpzkm/pqw9X0+qFuY2n0rtbp1dgYmfCxWmx/QFzhiEs=; b=A
 4MkPcqezC/BUMwimOTwxajEQpoE6P74z2QGcNlrSg67qpKPDpdYxFeDjTHPf/Eqy
 Pa6eH07ULTcMjNAU6t/smtfw4yc57UDfv7WiQMlkV9qgpzFc2v/ADnBPQxXcy1I6
 MUhO7A5/TPbQ+BTOicPrEgFh/UeF6gpOesV2yLVCnfWZ9hd/Tluz00+EYtnqS0gl
 3FC2bIf5x/MyYthok30xI7cCw4NWXVamhjnN3fKFkAdcHih3R//5FGcT9aMKumlX
 UMZdFqye0LHlE/nS0l3siSyV3tSZQ105+Ub1wZzfcp9R7G+zr0pjLrgrHMjOUYyN
 2tllHDTl3Q4rV1D0wpG/Q==
X-ME-Sender: <xms:bDp-Y9BmHhUDgeDkaigT5VQBU0PJYPcrJV5H5HS-hGubVVFB5QQrnQ>
 <xme:bDp-Y7jCBr4EsC-X1Soxm-dRWxYQKp8YnJtfX160LTQwES70uaTdWXnQKWSTEAiH3
 IqWfnNpw-riVkuAV1M>
X-ME-Received: <xmr:bDp-Y4mQ0gTbBBY-PhrmUvreZq2DQW96vH773YAjDBe6RyRQpX8lvL1ybfgN8r7ZijHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefhffel
 vdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:bDp-Y3wMsoxWx8kgr4VBmli-nU3Ws-dZkqH8bpRUj_wb9B0z8UMSpQ>
 <xmx:bDp-YyR9miXh7wGJHPuBVeqRePAPFDB1qQKWx51Z1mT1f8M04h73tQ>
 <xmx:bDp-Y6Y8TOUQ-ocGlmmmJJcbDxULJ8U7aR0Hli7TKUpj0ADMAbEFhQ>
 <xmx:bDp-Y77VA4rbhNYGcNSmyCTBadBVQYapOSMl4qrsbfAj50Gp9jcSNA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:21:15 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH] target/mips: Properly set C0_CMGCRBase after CPU reset
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20221114162526.355652-1-jiaxun.yang@flygoat.com>
Date: Wed, 23 Nov 2022 15:21:07 +0000
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FBB584F6-1508-4251-8C58-16C3BD5A838E@flygoat.com>
References: <20221114162526.355652-1-jiaxun.yang@flygoat.com>
To: BALATON Zoltan via <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
Received-SPF: pass client-ip=64.147.123.19;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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



> 2022=E5=B9=B411=E6=9C=8814=E6=97=A5 16:25=EF=BC=8CJiaxun Yang =
<jiaxun.yang@flygoat.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Value of C0_CMGCRBase will be reseted to default when cpu reset
> happens. In some cases software may move GCR base and then initiate
> a CPU reset, this will leave C0_CMGCRBase of reseted core incorrect.
>=20
> Implement a callback in CMGCR device to allow C0_CMGCRBase and other
> global states to be overriden after CPU reset.
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> This fixes SMP boot for Boston board.
> I'm not sure if it's the best palce to make such a callback,
> but we can add more global states such as BEV here in future.

Ping :-)

Any comments?

> ---
> hw/mips/cps.c        | 3 ++-
> hw/misc/mips_cmgcr.c | 5 +++++
> target/mips/cpu.c    | 4 +++-
> target/mips/cpu.h    | 4 ++++
> 4 files changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
> index 2b436700ce..29b10ff8d0 100644
> --- a/hw/mips/cps.c
> +++ b/hw/mips/cps.c
> @@ -98,6 +98,7 @@ static void mips_cps_realize(DeviceState *dev, Error =
**errp)
>         cpu_mips_clock_init(cpu);
>=20
>         env =3D &cpu->env;
> +        env->gcr =3D &s->gcr;
>         if (cpu_mips_itu_supported(env)) {
>             itu_present =3D true;
>             /* Attach ITC Tag to the VP */
> @@ -158,7 +159,7 @@ static void mips_cps_realize(DeviceState *dev, =
Error **errp)
>                             =
sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gic), 0));
>=20
>     /* Global Configuration Registers */
> -    gcr_base =3D env->CP0_CMGCRBase << 4;
> +    gcr_base =3D GCR_BASE_ADDR;
>=20
>     object_initialize_child(OBJECT(dev), "gcr", &s->gcr, =
TYPE_MIPS_GCR);
>     object_property_set_int(OBJECT(&s->gcr), "num-vp", s->num_vp,
> diff --git a/hw/misc/mips_cmgcr.c b/hw/misc/mips_cmgcr.c
> index 3c8b37f700..f2108b7d32 100644
> --- a/hw/misc/mips_cmgcr.c
> +++ b/hw/misc/mips_cmgcr.c
> @@ -19,6 +19,11 @@
> #include "hw/qdev-properties.h"
> #include "hw/intc/mips_gic.h"
>=20
> +void gcr_cpu_reset(struct MIPSGCRState *s, CPUMIPSState *env)
> +{
> +    env->CP0_CMGCRBase =3D s->gcr_base >> 4;
> +}
> +
> static inline bool is_cpc_connected(MIPSGCRState *s)
> {
>     return s->cpc_mr !=3D NULL;
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index e997c1b9cb..d0a76b95f7 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -297,7 +297,9 @@ static void mips_cpu_reset(DeviceState *dev)
>         env->CP0_EBase |=3D (int32_t)0x80000000;
>     }
>     if (env->CP0_Config3 & (1 << CP0C3_CMGCR)) {
> -        env->CP0_CMGCRBase =3D 0x1fbf8000 >> 4;
> +        if (env->gcr) {
> +            gcr_cpu_reset(env->gcr, env);
> +        }
>     }
>     env->CP0_EntryHi_ASID_mask =3D (env->CP0_Config5 & (1 << =
CP0C5_MI)) ?
>             0x0 : (env->CP0_Config4 & (1 << CP0C4_AE)) ? 0x3ff : 0xff;
> diff --git a/target/mips/cpu.h b/target/mips/cpu.h
> index 0a085643a3..c345e6b1c7 100644
> --- a/target/mips/cpu.h
> +++ b/target/mips/cpu.h
> @@ -1154,6 +1154,7 @@ typedef struct CPUArchState {
>     CPUMIPSTLBContext *tlb;
>     void *irq[8];
>     struct MIPSITUState *itu;
> +    struct MIPSGCRState *gcr;
>     MemoryRegion *itc_tag; /* ITC Configuration Tags */
> #endif
>=20
> @@ -1310,6 +1311,9 @@ void cpu_mips_soft_irq(CPUMIPSState *env, int =
irq, int level);
> /* mips_itu.c */
> void itc_reconfigure(struct MIPSITUState *tag);
>=20
> +/* mips_cmgcr.c */
> +void gcr_cpu_reset(struct MIPSGCRState *s, CPUMIPSState *env);
> +
> #endif /* !CONFIG_USER_ONLY */
>=20
> /* helper.c */
> --=20
> 2.37.4
>=20


