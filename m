Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9CD58F307
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 21:27:46 +0200 (CEST)
Received: from localhost ([::1]:41752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLrMm-0007Hl-MW
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 15:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oLrKY-0005pM-Az
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 15:25:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oLrKU-0005ej-R6
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 15:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660159520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V4WH+o0nEQZiENT/2WQOFqZjZFSRQUjC3g6kVFJ11IM=;
 b=DBq9mbxEaKGWVBDG8YcaDJ9PyKTbMmQkSCCNtCMv9t4ni0fHqhEyDplBkISmorPUMHmX6s
 z3M2/+AE4sFo1sb62jWD0j1O9vROPC5nrgZxp6TN5WuZWI6kZIGzbk0jfMRpJTe0m2gbez
 3RM0FJiHQA7zmdeWnWrph1KJdBVh3ug=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-KSF5M-yuMmiPrdE7n7kfcg-1; Wed, 10 Aug 2022 15:25:18 -0400
X-MC-Unique: KSF5M-yuMmiPrdE7n7kfcg-1
Received: by mail-lj1-f199.google.com with SMTP id
 g3-20020a2e9cc3000000b00253cc2b5ab5so4766812ljj.19
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 12:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=V4WH+o0nEQZiENT/2WQOFqZjZFSRQUjC3g6kVFJ11IM=;
 b=ylmTt6bq1kcqHRE/fXaPmy/ELry3Q0zgIDU0x0KwRTUsYB4NVmnp8hNyY8iHV8xi0e
 OtmuHbttpAx31DeakBo06wuhOc1Y3kGy1zOUrPvcqOZtxHNHN8IQTWLra9VuqWrtVXDK
 FxMvm1XMceil8NN+h4gBf4K/MeJBT2a+13aysh2DCxA8gL8Ijd4s6YqauIeGZVFJvhqI
 b5GVTYGfVJAjM/Et2lX6m+0x0VUBsOiyJHy+MCrGax3JlaMbWDkfie6OUlQaME2+mZwb
 T96Br6pR9lpxpzNjDuZjWFumNOKah2ZUvWhCJEX3skP6iDGg2zj6oRkdRe0LP4Sm3865
 BK0A==
X-Gm-Message-State: ACgBeo1m0vY4iYX1qE5lE/ivfE8cnZh2AF2l33gWg2cZSwT+J/WXANRc
 jR3++uupcYngJELg5cXKJddqXqcv/D8B15yqAEg/ZyD2/4bt5j1DEoiyLQr+ZfZy+2m03ScoFXx
 dx2YULwaYizIZdRFBcgq1obY2dJ7NASo=
X-Received: by 2002:a05:6512:b1a:b0:47f:b574:9539 with SMTP id
 w26-20020a0565120b1a00b0047fb5749539mr9558450lfu.143.1660159517408; 
 Wed, 10 Aug 2022 12:25:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6XtHS2KM3rjWxOXqoWLYtu0sH12ZGqf2oF79v74sp/QJzkct3U1+wn4MX9gC1Z/lmDFvEWPc3BbtMkvMQYFUg=
X-Received: by 2002:a05:6512:b1a:b0:47f:b574:9539 with SMTP id
 w26-20020a0565120b1a00b0047fb5749539mr9558443lfu.143.1660159517141; Wed, 10
 Aug 2022 12:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220810165942.104545-1-pbonzini@redhat.com>
 <20220810130346-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220810130346-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 10 Aug 2022 21:25:05 +0200
Message-ID: <CABgObfa0dr3H7tr8S5L+pLjFyJUMP7rVTPxr4senHDfofBq1RA@mail.gmail.com>
Subject: Re: [PATCH v3] pc: hide linuxboot RNG seed behind a machine property
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="0000000000004a478b05e5e80244"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000004a478b05e5e80244
Content-Type: text/plain; charset="UTF-8"

Il mer 10 ago 2022, 19:06 Michael S. Tsirkin <mst@redhat.com> ha scritto:

> > @@ -1387,6 +1405,7 @@ static void x86_machine_initfn(Object *obj)
> >      x86ms->acpi = ON_OFF_AUTO_AUTO;
> >      x86ms->pit = ON_OFF_AUTO_AUTO;
> >      x86ms->pic = ON_OFF_AUTO_AUTO;
> > +    x86ms->linuxboot_randomness = ON_OFF_AUTO_OFF;
> >      x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
> >      x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
> >      x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
>
>
> This is a weird thing to do in that there's no way to make it auto now.
>

Sure, -M x-linuxboot-randomness=auto works. And making it already
on/off/auto will limit future patches to the injection logic rather than
the QOM boilerplate.

Paolo

And in that case, let's just make it a simple boolean property for now?
>
> > @@ -1426,6 +1445,12 @@ static void x86_machine_class_init(ObjectClass
> *oc, void *data)
> >      object_class_property_set_description(oc, X86_MACHINE_PIT,
> >          "Enable i8254 PIT");
> >
> > +    object_class_property_add(oc, X86_MACHINE_LINUXBOOT_RANDOMNESS,
> "OnOffAuto",
> > +        x86_machine_get_linuxboot_randomness,
> x86_machine_set_linuxboot_randomness,
> > +        NULL, NULL);
> > +    object_class_property_set_description(oc,
> X86_MACHINE_LINUXBOOT_RANDOMNESS,
> > +        "Pass random number seed to -kernel Linux image");
> > +
> >      object_class_property_add(oc, X86_MACHINE_PIC, "OnOffAuto",
> >                                x86_machine_get_pic,
> >                                x86_machine_set_pic,
> > diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> > index 8435733bd6..9cc3f5d338 100644
> > --- a/include/hw/i386/pc.h
> > +++ b/include/hw/i386/pc.h
> > @@ -128,9 +128,6 @@ struct PCMachineClass {
> >
> >      /* create kvmclock device even when KVM PV features are not exposed
> */
> >      bool kvmclock_create_always;
> > -
> > -    /* skip passing an rng seed for legacy machines */
> > -    bool legacy_no_rng_seed;
> >  };
> >
> >  #define TYPE_PC_MACHINE "generic-pc-machine"
> > diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> > index 62fa5774f8..d7a2eb6f1c 100644
> > --- a/include/hw/i386/x86.h
> > +++ b/include/hw/i386/x86.h
> > @@ -70,6 +70,7 @@ struct X86MachineState {
> >      OnOffAuto acpi;
> >      OnOffAuto pit;
> >      OnOffAuto pic;
> > +    OnOffAuto linuxboot_randomness;
> >
> >      char *oem_id;
> >      char *oem_table_id;
> > @@ -94,6 +95,7 @@ struct X86MachineState {
> >  #define X86_MACHINE_OEM_ID           "x-oem-id"
> >  #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
> >  #define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
> > +#define X86_MACHINE_LINUXBOOT_RANDOMNESS "x-linuxboot-randomness"
> >
> >  #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
> >  OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
> > @@ -126,8 +128,7 @@ void x86_bios_rom_init(MachineState *ms, const char
> *default_firmware,
> >  void x86_load_linux(X86MachineState *x86ms,
> >                      FWCfgState *fw_cfg,
> >                      int acpi_data_size,
> > -                    bool pvh_enabled,
> > -                    bool legacy_no_rng_seed);
> > +                    bool pvh_enabled);
> >
> >  bool x86_machine_is_smm_enabled(const X86MachineState *x86ms);
> >  bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
> > --
> > 2.37.1
>
>

--0000000000004a478b05e5e80244
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 10 ago 2022, 19:06 Michael S. Tsirkin &lt;<a hr=
ef=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; ha scritto:</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
&gt; @@ -1387,6 +1405,7 @@ static void x86_machine_initfn(Object *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 x86ms-&gt;acpi =3D ON_OFF_AUTO_AUTO;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 x86ms-&gt;pit =3D ON_OFF_AUTO_AUTO;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 x86ms-&gt;pic =3D ON_OFF_AUTO_AUTO;<br>
&gt; +=C2=A0 =C2=A0 x86ms-&gt;linuxboot_randomness =3D ON_OFF_AUTO_OFF;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 x86ms-&gt;pci_irq_mask =3D ACPI_BUILD_PCI_IRQS;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 x86ms-&gt;oem_id =3D g_strndup(ACPI_BUILD_APPNAME6=
, 6);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 x86ms-&gt;oem_table_id =3D g_strndup(ACPI_BUILD_AP=
PNAME8, 8);<br>
<br>
<br>
This is a weird thing to do in that there&#39;s no way to make it auto now.=
<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Sure, -M x-linuxboot-randomness=3Dauto works. And making it already on/off/=
auto will limit future patches to the injection logic rather than the QOM b=
oilerplate.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
And in that case, let&#39;s just make it a simple boolean property for now?=
<br>
<br>
&gt; @@ -1426,6 +1445,12 @@ static void x86_machine_class_init(ObjectClass =
*oc, void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 object_class_property_set_description(oc, X86_MACH=
INE_PIT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Enable i8254 PIT&quot;);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 object_class_property_add(oc, X86_MACHINE_LINUXBOOT_RAN=
DOMNESS, &quot;OnOffAuto&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 x86_machine_get_linuxboot_randomness, x86=
_machine_set_linuxboot_randomness,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL);<br>
&gt; +=C2=A0 =C2=A0 object_class_property_set_description(oc, X86_MACHINE_L=
INUXBOOT_RANDOMNESS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Pass random number seed to -kernel =
Linux image&quot;);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 object_class_property_add(oc, X86_MACHINE_PIC, &qu=
ot;OnOffAuto&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x86_machine_get_pic,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x86_machine_set_pic,<br>
&gt; diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h<br>
&gt; index 8435733bd6..9cc3f5d338 100644<br>
&gt; --- a/include/hw/i386/pc.h<br>
&gt; +++ b/include/hw/i386/pc.h<br>
&gt; @@ -128,9 +128,6 @@ struct PCMachineClass {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* create kvmclock device even when KVM PV feature=
s are not exposed */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool kvmclock_create_always;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* skip passing an rng seed for legacy machines */<br>
&gt; -=C2=A0 =C2=A0 bool legacy_no_rng_seed;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define TYPE_PC_MACHINE &quot;generic-pc-machine&quot;<br>
&gt; diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h<br>
&gt; index 62fa5774f8..d7a2eb6f1c 100644<br>
&gt; --- a/include/hw/i386/x86.h<br>
&gt; +++ b/include/hw/i386/x86.h<br>
&gt; @@ -70,6 +70,7 @@ struct X86MachineState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 OnOffAuto acpi;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 OnOffAuto pit;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 OnOffAuto pic;<br>
&gt; +=C2=A0 =C2=A0 OnOffAuto linuxboot_randomness;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 char *oem_id;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 char *oem_table_id;<br>
&gt; @@ -94,6 +95,7 @@ struct X86MachineState {<br>
&gt;=C2=A0 #define X86_MACHINE_OEM_ID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;x-oem-id&quot;<br>
&gt;=C2=A0 #define X86_MACHINE_OEM_TABLE_ID=C2=A0 =C2=A0 =C2=A0&quot;x-oem-=
table-id&quot;<br>
&gt;=C2=A0 #define X86_MACHINE_BUS_LOCK_RATELIMIT=C2=A0 &quot;bus-lock-rate=
limit&quot;<br>
&gt; +#define X86_MACHINE_LINUXBOOT_RANDOMNESS &quot;x-linuxboot-randomness=
&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define TYPE_X86_MACHINE=C2=A0 =C2=A0MACHINE_TYPE_NAME(&quot;x86=
&quot;)<br>
&gt;=C2=A0 OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHIN=
E)<br>
&gt; @@ -126,8 +128,7 @@ void x86_bios_rom_init(MachineState *ms, const cha=
r *default_firmware,<br>
&gt;=C2=A0 void x86_load_linux(X86MachineState *x86ms,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 FWCfgState *fw_cfg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 int acpi_data_size,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bool pvh_enabled,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bool legacy_no_rng_seed);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bool pvh_enabled);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 bool x86_machine_is_smm_enabled(const X86MachineState *x86ms);<b=
r>
&gt;=C2=A0 bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);<=
br>
&gt; -- <br>
&gt; 2.37.1<br>
<br>
</blockquote></div></div></div>

--0000000000004a478b05e5e80244--


