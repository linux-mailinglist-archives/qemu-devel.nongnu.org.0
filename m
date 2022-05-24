Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3E053323A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 22:14:16 +0200 (CEST)
Received: from localhost ([::1]:50654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntav1-0000Zy-JT
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 16:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntaqF-0005wd-IQ
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:09:19 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntaqC-00028V-62
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:09:19 -0400
Received: by mail-ed1-x532.google.com with SMTP id i40so24471995eda.7
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 13:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fKjUnk5hSt3R76kHvgP4rvHMrBaJH7wD/n2hz1M+Bgw=;
 b=GDI6oD+ClxSUQjJlaI7FP0bN3yv9hkq5Vin3sdM0zRxuwOifhXhnp7qzJ/72SiYuIk
 zVLLgeVRqXL7FKmHgXKDMj7Zdhgr/Xiz4ZD8TPwqDVNo3mdqUR7LLzUoYnjKP2VbE3Up
 3DrDVahHMg1sr0OhTg4xLgcATxF7mDIimGRP4WRa7oT/qwgbJOBopJyEsfVcNB/1zR+m
 J+0IDXZ0mx8tU1tsw/fN8uP31CGL9JqrcR0XNr9PQifr6JL5X5f2/Y96GcSc3u25GZtM
 BVYj0l1Ig/n+AyMEmdg8qR0j3yYCWoomdeSBgFBCGMontbVZa4Ryrugl9q9WsIai6kOl
 ZcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fKjUnk5hSt3R76kHvgP4rvHMrBaJH7wD/n2hz1M+Bgw=;
 b=J9/ruHscqN1ZZVffDINQl3mfmQ5/96Jr63QWlcC6K4i/I7miOYgcTd670JtTiJMS+r
 QeI0IXhDZfMsplj9b08670XsgeOdhc6Si2Qh1YH6svKs+n2H2E7DcQMGZZ4BEgloG/dJ
 1KWfKIoiGcqrO7zUaeT24quVA/dKM10jQfjyS1/bRguu4jJMJ9EwGrGtQHuKoLhF1FA6
 iFjnuTofqkILWaWMTo31j7BuvUtRiSCzTrMzt0LF1hGn/X2C70wfiR2l5v3rFzNWps/r
 5zN0Y3FVK3Fgtd2Kvfr04gKzcCp/vI7CNcwCzWgPnbVgJTNFoGBVZI5xHfVM7k8je2W9
 I19A==
X-Gm-Message-State: AOAM530NSWR4zk+EJ/r//xWDTb428vVC6OK2Oqx2SCaO0z2zUfTNUVwA
 8nMxsSqGNUuYZRMvhm7YsDy3cvXA4ypT8UNoG9n4Mg==
X-Google-Smtp-Source: ABdhPJxiFtZd8jAJ+CkTS+yPOXuH1Ri1MAq+LpgqDBZCzw5nXPDWlAfGhm9FIKs3UqwSAPhxJ7uI2AlnJSK6oAXLhcU=
X-Received: by 2002:aa7:d88f:0:b0:42a:adb3:be01 with SMTP id
 u15-20020aa7d88f000000b0042aadb3be01mr31364124edq.219.1653422954415; Tue, 24
 May 2022 13:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-8-damien.hedde@greensocs.com>
In-Reply-To: <20220223090706.4888-8-damien.hedde@greensocs.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 25 May 2022 04:09:01 +0800
Message-ID: <CALw707q1Xsnr3JFUvSv1wh5Vh6TaeWyt6+FMiNswNJnFEny0JA@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] none-machine: add the NoneMachineState structure
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 mark.burton@greensocs.com, edgari@xilinx.com, 
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000dc9bf305dfc7872c"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=jim.shu@sifive.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dc9bf305dfc7872c
Content-Type: text/plain; charset="UTF-8"

Tested-by: Jim Shu <jim.shu@sifive.com>

On Wed, Feb 23, 2022 at 5:59 PM Damien Hedde <damien.hedde@greensocs.com>
wrote:

> The none machine was using the parent state structure.
> We'll need a custom state to add a field in the following commit.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/core/null-machine.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
> index f586a4bef5..7eb258af07 100644
> --- a/hw/core/null-machine.c
> +++ b/hw/core/null-machine.c
> @@ -17,6 +17,13 @@
>  #include "exec/address-spaces.h"
>  #include "hw/core/cpu.h"
>
> +struct NoneMachineState {
> +    MachineState parent;
> +};
> +
> +#define TYPE_NONE_MACHINE MACHINE_TYPE_NAME("none")
> +OBJECT_DECLARE_SIMPLE_TYPE(NoneMachineState, NONE_MACHINE)
> +
>  static void machine_none_init(MachineState *mch)
>  {
>      CPUState *cpu = NULL;
> @@ -42,8 +49,10 @@ static void machine_none_init(MachineState *mch)
>      }
>  }
>
> -static void machine_none_machine_init(MachineClass *mc)
> +static void machine_none_class_init(ObjectClass *oc, void *data)
>  {
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
>      mc->desc = "empty machine";
>      mc->init = machine_none_init;
>      mc->max_cpus = 1;
> @@ -56,4 +65,15 @@ static void machine_none_machine_init(MachineClass *mc)
>      mc->no_sdcard = 1;
>  }
>
> -DEFINE_MACHINE("none", machine_none_machine_init)
> +static const TypeInfo none_machine_info = {
> +    .name          = TYPE_NONE_MACHINE,
> +    .parent        = TYPE_MACHINE,
> +    .instance_size = sizeof(NoneMachineState),
> +    .class_init    = machine_none_class_init,
> +};
> +
> +static void none_machine_register_types(void)
> +{
> +    type_register_static(&none_machine_info);
> +}
> +type_init(none_machine_register_types);
> --
> 2.35.1
>
>
>

--000000000000dc9bf305dfc7872c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.co=
m" target=3D"_blank">jim.shu@sifive.com</a>&gt;<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 23, 2022 at =
5:59 PM Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.com" targ=
et=3D"_blank">damien.hedde@greensocs.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">The none machine was using the pare=
nt state structure.<br>
We&#39;ll need a custom state to add a field in the following commit.<br>
<br>
Signed-off-by: Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.co=
m" target=3D"_blank">damien.hedde@greensocs.com</a>&gt;<br>
---<br>
=C2=A0hw/core/null-machine.c | 24 ++++++++++++++++++++++--<br>
=C2=A01 file changed, 22 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c<br>
index f586a4bef5..7eb258af07 100644<br>
--- a/hw/core/null-machine.c<br>
+++ b/hw/core/null-machine.c<br>
@@ -17,6 +17,13 @@<br>
=C2=A0#include &quot;exec/address-spaces.h&quot;<br>
=C2=A0#include &quot;hw/core/cpu.h&quot;<br>
<br>
+struct NoneMachineState {<br>
+=C2=A0 =C2=A0 MachineState parent;<br>
+};<br>
+<br>
+#define TYPE_NONE_MACHINE MACHINE_TYPE_NAME(&quot;none&quot;)<br>
+OBJECT_DECLARE_SIMPLE_TYPE(NoneMachineState, NONE_MACHINE)<br>
+<br>
=C2=A0static void machine_none_init(MachineState *mch)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cpu =3D NULL;<br>
@@ -42,8 +49,10 @@ static void machine_none_init(MachineState *mch)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void machine_none_machine_init(MachineClass *mc)<br>
+static void machine_none_class_init(ObjectClass *oc, void *data)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_CLASS(oc);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;desc =3D &quot;empty machine&quot;;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;init =3D machine_none_init;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;max_cpus =3D 1;<br>
@@ -56,4 +65,15 @@ static void machine_none_machine_init(MachineClass *mc)<=
br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;no_sdcard =3D 1;<br>
=C2=A0}<br>
<br>
-DEFINE_MACHINE(&quot;none&quot;, machine_none_machine_init)<br>
+static const TypeInfo none_machine_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_NONE_MACHIN=
E,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_MACHINE,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(NoneMachineState),<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D machine_none_class_init,<br>
+};<br>
+<br>
+static void none_machine_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;none_machine_info);<br>
+}<br>
+type_init(none_machine_register_types);<br>
-- <br>
2.35.1<br>
<br>
<br>
</blockquote></div>

--000000000000dc9bf305dfc7872c--

