Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D826D3FF4DF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 22:26:10 +0200 (CEST)
Received: from localhost ([::1]:47638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLtHl-0003YR-TY
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 16:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1mLtD1-0004V9-1B
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:21:15 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:41858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1mLtCx-0002Gp-Nf
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:21:14 -0400
Received: by mail-ua1-x92b.google.com with SMTP id 75so1579780uav.8
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 13:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jf+vSnNSG8wRRg/XiOKT6LAgXtHyEiy/oi1zTo/WSN8=;
 b=pQ8uCbudFmSM3utsdgAArdjWg5SgXVR9a5uebFwoVz4a/5N+3dzi0epZO6F8cdC+MC
 hPnUtS2umGoeJP2mZkR4zQAqmcbPjDW0aOL0N8Rsax9ir84Gc7xc/Lfnu98ISeJSwJ8E
 GrQI1m/8d0YyNehyPK8FdgtOnbsWISLlets2rBl2CtowLDg5Z2Z6lMFGwELkQoCHonBO
 qwnawJzAlztcP5zRAscyt1ekzxRNpzFPiPNjhqNWkfoCCencQ92nRnP5Vgzzv8YtpPWm
 qQMzT8g+ANqT/9iRE8VrG4TtdsAiLHDtsHjxADqrDNE73KLS0lj4ccJWBpRMUrNZZbIT
 kTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jf+vSnNSG8wRRg/XiOKT6LAgXtHyEiy/oi1zTo/WSN8=;
 b=DKXSJiAdZpwrjPPHHuDmY3cxe++e7rNPkRYML8+RmgifrJT1OTdtPqbOZzZ4pi4/Gf
 5Hv3Y8IFT3E1d1GRvz5koc/H/q9iluR23iX/oq2D8NBDG5oXZZ4Oaf7tTJrHn9gmQXzf
 NyeDm//S6R7ciQy5/LDLHNyvt0Q0DyIu0s9qqyZFRpi5XaviWQ5JUlgYT8h5Y62ciGTn
 ZHN9qIqqS99Hj/kHvF6G+c5nMTig0XjzMWnxDLBljGKgW6a41WqEJPO3Ogk6upI0MUtn
 gkwVBbpdIVelSHI1i7P5WulqJRT0YvuhgRMt9Edh6dygwSqnXXmWxwvSuESFjknrJ/jh
 +C1g==
X-Gm-Message-State: AOAM5311kKyjKpbH7AeZCVho+3vhbz22/SaJgWAEtzN46X2pbQdraVM9
 6qaVd1+yDRvZyyu1XFDFc+hDsRiPRDJv9d0jaQAhVMY6ANQ=
X-Google-Smtp-Source: ABdhPJyqIWxWfDCgTuBKOk9wzjoe9PMXkfvjOyM7vnUPJFWqp7A/V4Ff4qs4IJ4bQ7VoKbunhAX725BmO4e3JcS6D3Q=
X-Received: by 2002:a9f:25c1:: with SMTP id 59mr80969uaf.15.1630614069773;
 Thu, 02 Sep 2021 13:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210902181642.315792-1-crauer@google.com>
In-Reply-To: <20210902181642.315792-1-crauer@google.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 2 Sep 2021 13:20:58 -0700
Message-ID: <CAO=notxshTtgy6NESywBrQ18W30gvXR3cEVK0Twp_VaoVaG-aw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Add support for kudo-bmc board.
To: Chris Rauer <crauer@google.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, 
 CS20 KFTing <kfting@nuvoton.com>
Content-Type: multipart/alternative; boundary="00000000000065777505cb08ec33"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=venture@google.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000065777505cb08ec33
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 2, 2021 at 12:01 PM Chris Rauer <crauer@google.com> wrote:

> kudo-bmc is a board supported by OpenBMC.
> https://github.com/openbmc/openbmc/tree/master/meta-fii/meta-kudo
>
> Tested: Booted kudo firmware.
> Signed-off-by: Chris Rauer <crauer@google.com>
>
Reviewed-by: Patrick Venture <venture@google.com>

> ---
>  docs/system/arm/nuvoton.rst |  1 +
>  hw/arm/npcm7xx_boards.c     | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>
> diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
> index 69f57c2886..adf497e679 100644
> --- a/docs/system/arm/nuvoton.rst
> +++ b/docs/system/arm/nuvoton.rst
> @@ -20,6 +20,7 @@ Hyperscale applications. The following machines are
> based on this chip :
>
>  - ``quanta-gbs-bmc``    Quanta GBS server BMC
>  - ``quanta-gsj``        Quanta GSJ server BMC
> +- ``kudo-bmc``          Fii USA Kudo server BMC
>
>  There are also two more SoCs, NPCM710 and NPCM705, which are single-core
>  variants of NPCM750 and NPCM730, respectively. These are currently not
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index e5a3243995..c80f442adb 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -31,6 +31,7 @@
>  #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
>  #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
>  #define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff
> +#define KUDO_BMC_POWER_ON_STRAPS 0x00001fff
>
>  static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
>
> @@ -357,6 +358,23 @@ static void quanta_gbs_init(MachineState *machine)
>      npcm7xx_load_kernel(machine, soc);
>  }
>
> +static void kudo_bmc_init(MachineState *machine)
> +{
> +    NPCM7xxState *soc;
> +
> +    soc = npcm7xx_create_soc(machine, KUDO_BMC_POWER_ON_STRAPS);
> +    npcm7xx_connect_dram(soc, machine->ram);
> +    qdev_realize(DEVICE(soc), NULL, &error_fatal);
> +
> +    npcm7xx_load_bootrom(machine, soc);
> +    npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
> +                          drive_get(IF_MTD, 0, 0));
> +    npcm7xx_connect_flash(&soc->fiu[1], 0, "mx66u51235f",
> +                          drive_get(IF_MTD, 3, 0));
> +
> +    npcm7xx_load_kernel(machine, soc);
> +}
> +
>  static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char
> *type)
>  {
>      NPCM7xxClass *sc = NPCM7XX_CLASS(object_class_by_name(type));
> @@ -417,6 +435,18 @@ static void gbs_bmc_machine_class_init(ObjectClass
> *oc, void *data)
>      mc->default_ram_size = 1 * GiB;
>  }
>
> +static void kudo_bmc_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
> +
> +    mc->desc = "Kudo BMC (Cortex A9)";
> +    mc->init = kudo_bmc_init;
> +    mc->default_ram_size = 1 * GiB;
> +};
> +
>  static const TypeInfo npcm7xx_machine_types[] = {
>      {
>          .name           = TYPE_NPCM7XX_MACHINE,
> @@ -437,6 +467,10 @@ static const TypeInfo npcm7xx_machine_types[] = {
>          .name           = MACHINE_TYPE_NAME("quanta-gbs-bmc"),
>          .parent         = TYPE_NPCM7XX_MACHINE,
>          .class_init     = gbs_bmc_machine_class_init,
> +    }, {
> +        .name           = MACHINE_TYPE_NAME("kudo-bmc"),
> +        .parent         = TYPE_NPCM7XX_MACHINE,
> +        .class_init     = kudo_bmc_machine_class_init,
>      },
>  };
>
> --
> 2.33.0.153.gba50c8fa24-goog
>
>
>

--00000000000065777505cb08ec33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 12:01 PM Chris=
 Rauer &lt;<a href=3D"mailto:crauer@google.com">crauer@google.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">kudo-bmc i=
s a board supported by OpenBMC.<br>
<a href=3D"https://github.com/openbmc/openbmc/tree/master/meta-fii/meta-kud=
o" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/openbmc/=
tree/master/meta-fii/meta-kudo</a><br>
<br>
Tested: Booted kudo firmware.<br>
Signed-off-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com" target=
=3D"_blank">crauer@google.com</a>&gt;<br></blockquote><div>Reviewed-by: Pat=
rick Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</=
a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0docs/system/arm/nuvoton.rst |=C2=A0 1 +<br>
=C2=A0hw/arm/npcm7xx_boards.c=C2=A0 =C2=A0 =C2=A0| 34 +++++++++++++++++++++=
+++++++++++++<br>
=C2=A02 files changed, 35 insertions(+)<br>
<br>
diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst<br>
index 69f57c2886..adf497e679 100644<br>
--- a/docs/system/arm/nuvoton.rst<br>
+++ b/docs/system/arm/nuvoton.rst<br>
@@ -20,6 +20,7 @@ Hyperscale applications. The following machines are based=
 on this chip :<br>
<br>
=C2=A0- ``quanta-gbs-bmc``=C2=A0 =C2=A0 Quanta GBS server BMC<br>
=C2=A0- ``quanta-gsj``=C2=A0 =C2=A0 =C2=A0 =C2=A0 Quanta GSJ server BMC<br>
+- ``kudo-bmc``=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Fii USA Kudo server BMC<b=
r>
<br>
=C2=A0There are also two more SoCs, NPCM710 and NPCM705, which are single-c=
ore<br>
=C2=A0variants of NPCM750 and NPCM730, respectively. These are currently no=
t<br>
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c<br>
index e5a3243995..c80f442adb 100644<br>
--- a/hw/arm/npcm7xx_boards.c<br>
+++ b/hw/arm/npcm7xx_boards.c<br>
@@ -31,6 +31,7 @@<br>
=C2=A0#define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7<br>
=C2=A0#define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff<br>
=C2=A0#define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff<br>
+#define KUDO_BMC_POWER_ON_STRAPS 0x00001fff<br>
<br>
=C2=A0static const char npcm7xx_default_bootrom[] =3D &quot;npcm7xx_bootrom=
.bin&quot;;<br>
<br>
@@ -357,6 +358,23 @@ static void quanta_gbs_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0npcm7xx_load_kernel(machine, soc);<br>
=C2=A0}<br>
<br>
+static void kudo_bmc_init(MachineState *machine)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxState *soc;<br>
+<br>
+=C2=A0 =C2=A0 soc =3D npcm7xx_create_soc(machine, KUDO_BMC_POWER_ON_STRAPS=
);<br>
+=C2=A0 =C2=A0 npcm7xx_connect_dram(soc, machine-&gt;ram);<br>
+=C2=A0 =C2=A0 qdev_realize(DEVICE(soc), NULL, &amp;error_fatal);<br>
+<br>
+=C2=A0 =C2=A0 npcm7xx_load_bootrom(machine, soc);<br>
+=C2=A0 =C2=A0 npcm7xx_connect_flash(&amp;soc-&gt;fiu[0], 0, &quot;mx66u512=
35f&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 drive_get(IF_MTD, 0, 0));<br>
+=C2=A0 =C2=A0 npcm7xx_connect_flash(&amp;soc-&gt;fiu[1], 0, &quot;mx66u512=
35f&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 drive_get(IF_MTD, 3, 0));<br>
+<br>
+=C2=A0 =C2=A0 npcm7xx_load_kernel(machine, soc);<br>
+}<br>
+<br>
=C2=A0static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char=
 *type)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxClass *sc =3D NPCM7XX_CLASS(object_class_by_name=
(type));<br>
@@ -417,6 +435,18 @@ static void gbs_bmc_machine_class_init(ObjectClass *oc=
, void *data)<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;default_ram_size =3D 1 * GiB;<br>
=C2=A0}<br>
<br>
+static void kudo_bmc_machine_class_init(ObjectClass *oc, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxMachineClass *nmc =3D NPCM7XX_MACHINE_CLASS(oc);<br>
+=C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_CLASS(oc);<br>
+<br>
+=C2=A0 =C2=A0 npcm7xx_set_soc_type(nmc, TYPE_NPCM730);<br>
+<br>
+=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Kudo BMC (Cortex A9)&quot;;<br>
+=C2=A0 =C2=A0 mc-&gt;init =3D kudo_bmc_init;<br>
+=C2=A0 =C2=A0 mc-&gt;default_ram_size =3D 1 * GiB;<br>
+};<br>
+<br>
=C2=A0static const TypeInfo npcm7xx_machine_types[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D TYPE_NPCM7XX_MACHINE,<br>
@@ -437,6 +467,10 @@ static const TypeInfo npcm7xx_machine_types[] =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D MACHINE_TYPE_NAME(&quot;quanta-gbs-bmc&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TYPE_NPCM7XX_MACHINE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =C2=A0=3D gbs_bm=
c_machine_class_init,<br>
+=C2=A0 =C2=A0 }, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D MACHINE_TYPE_NAME(&quot;kudo-bmc&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D T=
YPE_NPCM7XX_MACHINE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =C2=A0=3D kudo_bmc_ma=
chine_class_init,<br>
=C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0};<br>
<br>
-- <br>
2.33.0.153.gba50c8fa24-goog<br>
<br>
<br>
</blockquote></div></div>

--00000000000065777505cb08ec33--

