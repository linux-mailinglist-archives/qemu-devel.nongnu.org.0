Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938E06947AE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:06:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZPK-0006uh-Rb; Mon, 13 Feb 2023 09:02:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pRZOu-0006ga-OY; Mon, 13 Feb 2023 09:01:51 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pRZOm-0005v0-Ku; Mon, 13 Feb 2023 09:01:44 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B6152320091C;
 Mon, 13 Feb 2023 09:01:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 13 Feb 2023 09:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1676296881; x=
 1676383281; bh=JxYKsfAGn1jvYvsEvF89yijVLdPx7EbvqkOtZH6Tnqc=; b=H
 gSdlDeKhIV4QbRpbG59CX6OghFrfQPYf3l01EHa9owWrgPg+KbJT4eeb70n/ak3+
 OrvJySdyhIJw4k7vGFVJAGNsYdVvhD6lbl9wfPLWHs56r5FT1GNGaap2F5MNAWln
 WYUX2HUBOQ8MKol3UOHaY2HIiBpn1izuxbNOrIx0uxVVH4K15X3GQbH6VTJyJ5qf
 +YRVLZKdUjVkWD9tjkhZJ2lsFrqwB8rwPiD4uxjYNs+hxD+vdSNTLoZ/O1H4jEii
 VlfOpKqg9MagkSlm7rYjDAxj8JlmMZwxENh3h4TGzpYDCUB60KCqzBAq0dAoGKaS
 SYVrXy07Y5kdJi7b/PfYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676296881; x=
 1676383281; bh=JxYKsfAGn1jvYvsEvF89yijVLdPx7EbvqkOtZH6Tnqc=; b=C
 YlendfAR6JtVOOuSxTgv/KnXk49NZeajorttohdG2JJE3TVpDhgTgDMQsa5ixIW2
 M3s1GMc70WZ/jTQkmskn7jcskOLpYVS0ynGoErBWw8FSbnZnuzsT+oMf99Cb1ZSb
 NlRaQd+FG43Fh9/+LSMnNYeyY5Wj5f3ZtkR9Nbsq8jVQ37JU5HnhxsGX8tz2nQxd
 sTrnCpDHWqgtOE28LQxsqmuTqU/jEXlFN9sjfGpI/TIRYK6m40kxeuM2/QH7UiMe
 /yWI5yBbtF6Wu8v6RnV9tZ2NA0QbjAl0Igsm0eesie6JiFZfGFWg9pCIQqgM4g7s
 UjzCvCbnFCVFrZr1FpNfw==
X-ME-Sender: <xms:sULqY_HD4_D21q4ETXpG381j8ScEXLza0bFbY7XzuJ81ljnYtkdBZQ>
 <xme:sULqY8UPJxuUQbznt4f1jgxnEQ2equB7z3OhhMJLGgRE8qsNJjNG7R3zXUAzS4HLo
 2Fyta5cD7MiCDpc5VI>
X-ME-Received: <xmr:sULqYxINyf7U2lfxb-RGEi821xvYTQ5R_TBOS5KZjdeD9Ih6TsetoQDqkxEE04adAwm7Nw1OrE7Knm5dx_p4OzwJk23HlkuQ8yk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeiuddgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
 ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:sULqY9Eo1ApSkv5-H36OoSkh9IpSYNNNblEFUUl_pJ0tKE8tKeefow>
 <xmx:sULqY1Xr8FN-kXtC8E4EdcQSiu0ahu5FdE3WhIlEOOKU53MJqRmM1Q>
 <xmx:sULqY4MtRVoyLD1-d7oTM36dGeJ3BIbpXvdGf9lmsve47zfpM0t4tw>
 <xmx:sULqY7yPDMOQWTKpCZQdN7gKZJ5Iz4LEkZWHsvLg7TDhR3t_JLQRBQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Feb 2023 09:01:20 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [RFC PATCH 9/9] hw/mips/itu: Pass SAAR using QOM link property
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230203113650.78146-10-philmd@linaro.org>
Date: Mon, 13 Feb 2023 14:01:07 +0000
Cc: BALATON Zoltan via <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <90C61816-46A7-4A42-95A8-D207065CB200@flygoat.com>
References: <20230203113650.78146-1-philmd@linaro.org>
 <20230203113650.78146-10-philmd@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
Received-SPF: pass client-ip=64.147.123.24;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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



> 2023=E5=B9=B42=E6=9C=883=E6=97=A5 11:36=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> QOM objects shouldn't access each other internals fields
> except using the QOM API.
>=20
> mips_cps_realize() instantiates a TYPE_MIPS_ITU object, and
> directly sets the 'saar' pointer:
>=20
>   if (saar_present) {
>       s->itu.saar =3D &env->CP0_SAAR;
>   }
>=20
> In order to avoid that, pass the MIPS_CPU object via a QOM
> link property, and set the 'saar' pointer in mips_itu_realize().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Tested with ITU cases.

> ---
> RFC because not tested.
> ---
> hw/mips/cps.c              | 23 ++++++-----------------
> hw/misc/mips_itu.c         | 26 ++++++++++++++++++--------
> include/hw/misc/mips_itu.h |  5 ++---
> 3 files changed, 26 insertions(+), 28 deletions(-)
>=20
> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
> index 38acc57468..2b5269ebf1 100644
> --- a/hw/mips/cps.c
> +++ b/hw/mips/cps.c
> @@ -66,20 +66,17 @@ static bool cpu_mips_itu_supported(CPUMIPSState =
*env)
> static void mips_cps_realize(DeviceState *dev, Error **errp)
> {
>     MIPSCPSState *s =3D MIPS_CPS(dev);
> -    CPUMIPSState *env;
> -    MIPSCPU *cpu;
> -    int i;
>     target_ulong gcr_base;
>     bool itu_present =3D false;
> -    bool saar_present =3D false;
>=20
>     if (!clock_get(s->clock)) {
>         error_setg(errp, "CPS input clock is not connected to an =
output clock");
>         return;
>     }
>=20
> -    for (i =3D 0; i < s->num_vp; i++) {
> -        cpu =3D MIPS_CPU(object_new(s->cpu_type));
> +    for (int i =3D 0; i < s->num_vp; i++) {
> +        MIPSCPU *cpu =3D MIPS_CPU(object_new(s->cpu_type));
> +        CPUMIPSState *env =3D &cpu->env;
>=20
>         /* All VPs are halted on reset. Leave powering up to CPC. */
>         if (!object_property_set_bool(OBJECT(cpu), =
"start-powered-off", true,
> @@ -97,7 +94,6 @@ static void mips_cps_realize(DeviceState *dev, Error =
**errp)
>         cpu_mips_irq_init_cpu(cpu);
>         cpu_mips_clock_init(cpu);
>=20
> -        env =3D &cpu->env;
>         if (cpu_mips_itu_supported(env)) {
>             itu_present =3D true;
>             /* Attach ITC Tag to the VP */
> @@ -107,22 +103,15 @@ static void mips_cps_realize(DeviceState *dev, =
Error **errp)
>         qemu_register_reset(main_cpu_reset, cpu);
>     }
>=20
> -    cpu =3D MIPS_CPU(first_cpu);
> -    env =3D &cpu->env;
> -    saar_present =3D (bool)env->saarp;
> -
>     /* Inter-Thread Communication Unit */
>     if (itu_present) {
>         object_initialize_child(OBJECT(dev), "itu", &s->itu, =
TYPE_MIPS_ITU);
> +        object_property_set_link(OBJECT(&s->itu), "cpu[0]",
> +                                 OBJECT(first_cpu), &error_abort);
>         object_property_set_uint(OBJECT(&s->itu), "num-fifo", 16,
>                                 &error_abort);
>         object_property_set_uint(OBJECT(&s->itu), "num-semaphores", =
16,
>                                 &error_abort);
> -        object_property_set_bool(OBJECT(&s->itu), "saar-present", =
saar_present,
> -                                 &error_abort);
> -        if (saar_present) {
> -            s->itu.saar =3D &env->CP0_SAAR;
> -        }
>         if (!sysbus_realize(SYS_BUS_DEVICE(&s->itu), errp)) {
>             return;
>         }
> @@ -158,7 +147,7 @@ static void mips_cps_realize(DeviceState *dev, =
Error **errp)
>                             =
sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gic), 0));
>=20
>     /* Global Configuration Registers */
> -    gcr_base =3D env->CP0_CMGCRBase << 4;
> +    gcr_base =3D MIPS_CPU(first_cpu)->env.CP0_CMGCRBase << 4;
>=20
>     object_initialize_child(OBJECT(dev), "gcr", &s->gcr, =
TYPE_MIPS_GCR);
>     object_property_set_uint(OBJECT(&s->gcr), "num-vp", s->num_vp,
> diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
> index a06cdd10ea..0eda302db4 100644
> --- a/hw/misc/mips_itu.c
> +++ b/hw/misc/mips_itu.c
> @@ -93,10 +93,10 @@ void itc_reconfigure(MIPSITUState *tag)
>     uint64_t size =3D (1 * KiB) + (am[1] & ITC_AM1_ADDR_MASK_MASK);
>     bool is_enabled =3D (am[0] & ITC_AM0_EN_MASK) !=3D 0;
>=20
> -    if (tag->saar_present) {
> -        address =3D ((*(uint64_t *) tag->saar) & 0xFFFFFFFFE000ULL) =
<< 4;
> -        size =3D 1ULL << ((*(uint64_t *) tag->saar >> 1) & 0x1f);
> -        is_enabled =3D *(uint64_t *) tag->saar & 1;
> +    if (tag->saar) {
> +        address =3D (tag->saar[0] & 0xFFFFFFFFE000ULL) << 4;
> +        size =3D 1ULL << ((tag->saar[0] >> 1) & 0x1f);
> +        is_enabled =3D tag->saar[0] & 1;
>     }
>=20
>     memory_region_transaction_begin();
> @@ -157,7 +157,7 @@ static inline ITCView get_itc_view(hwaddr addr)
> static inline int get_cell_stride_shift(const MIPSITUState *s)
> {
>     /* Minimum interval (for EntryGain =3D 0) is 128 B */
> -    if (s->saar_present) {
> +    if (s->saar) {
>         return 7 + ((s->icr0 >> ITC_ICR0_BLK_GRAIN) &
>                     ITC_ICR0_BLK_GRAIN_MASK);
>     } else {
> @@ -515,6 +515,7 @@ static void mips_itu_init(Object *obj)
> static void mips_itu_realize(DeviceState *dev, Error **errp)
> {
>     MIPSITUState *s =3D MIPS_ITU(dev);
> +    CPUMIPSState *env;
>=20
>     if (s->num_fifo > ITC_FIFO_NUM_MAX) {
>         error_setg(errp, "Exceed maximum number of FIFO cells: %d",
> @@ -526,6 +527,15 @@ static void mips_itu_realize(DeviceState *dev, =
Error **errp)
>                    s->num_semaphores);
>         return;
>     }
> +    if (!s->cpu0) {
> +        error_setg(errp, "Missing 'cpu[0]' property");
> +        return;
> +    }
> +
> +    env =3D &s->cpu0->env;
> +    if (env->saarp) {
> +        s->saar =3D env->CP0_SAAR;
> +    }
>=20
>     s->cell =3D g_new(ITCStorageCell, get_num_cells(s));
> }
> @@ -534,8 +544,8 @@ static void mips_itu_reset(DeviceState *dev)
> {
>     MIPSITUState *s =3D MIPS_ITU(dev);
>=20
> -    if (s->saar_present) {
> -        *(uint64_t *) s->saar =3D 0x11 << 1;
> +    if (s->saar) {
> +        s->saar[0] =3D 0x11 << 1;
>         s->icr0 =3D get_num_cells(s) << ITC_ICR0_CELL_NUM;
>     } else {
>         s->ITCAddressMap[0] =3D 0;
> @@ -553,7 +563,7 @@ static Property mips_itu_properties[] =3D {
>                       ITC_FIFO_NUM_MAX),
>     DEFINE_PROP_UINT32("num-semaphores", MIPSITUState, num_semaphores,
>                       ITC_SEMAPH_NUM_MAX),
> -    DEFINE_PROP_BOOL("saar-present", MIPSITUState, saar_present, =
false),
> +    DEFINE_PROP_LINK("cpu[0]", MIPSITUState, cpu0, TYPE_MIPS_CPU, =
MIPSCPU *),
>     DEFINE_PROP_END_OF_LIST(),
> };
>=20
> diff --git a/include/hw/misc/mips_itu.h b/include/hw/misc/mips_itu.h
> index ab6d286c38..35218b2d14 100644
> --- a/include/hw/misc/mips_itu.h
> +++ b/include/hw/misc/mips_itu.h
> @@ -72,9 +72,8 @@ struct MIPSITUState {
>     uint64_t icr0;
>=20
>     /* SAAR */
> -    bool saar_present;
> -    void *saar;
> -
> +    uint64_t *saar;
> +    MIPSCPU *cpu0;
> };
>=20
> /* Get ITC Configuration Tag memory region. */
> --=20
> 2.38.1
>=20


