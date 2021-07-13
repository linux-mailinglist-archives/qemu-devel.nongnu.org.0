Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E41C3C6E71
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 12:25:48 +0200 (CEST)
Received: from localhost ([::1]:57666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Fbn-0000wB-87
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 06:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m3FZf-0008OW-QT
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:23:35 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:35742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m3FZd-00051M-PZ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:23:35 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 7-20020a9d0d070000b0290439abcef697so21967556oti.2
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 03:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JRtnP1kaIui/GYfPZcKJfVO2nsmtQhRunONE34WIRRc=;
 b=cySGUmZmhdwa8H1DnKpqf4YI84kpQ2yIAAEtU0pa4fRdeFwi4qeeXiQx3tx3QslFZi
 INhT1d4X+iMQZ2gntOKpD7kVIuUmK0lEQLNLnQmA2wlOisE6dfq4jVMjyDlEK7kldWbA
 G2z6aQGw9OMiQkNmBcP3vvjeMNyYR6fH6SCdRpE5KPNsvZCe7ZbSooHVLNDLV+sTdtzm
 BGVWRcCYY6q57+UYNd3xR6qFhApMV/VkmLVr6cmXuNWwz5erdSHk3QT1TLnoVLN6u1Qd
 /OKkIDXYkPcNXYUCzVLSOSqJe4xUctG3xcw/EiSeBRBnKdowuUVN2LwY8CKuzfLSrzP3
 AlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JRtnP1kaIui/GYfPZcKJfVO2nsmtQhRunONE34WIRRc=;
 b=SuxDtKV5lAC8qz51lqn1FiiAndqxTWiv1BTB9QZn9L7pd9ySCIs5eapOGAcFgDPbad
 LFkEJjpXeDLEEHvfKczq0EC1yikS0Tiwa+lEcNnzPp4Lzj1pqQRJETog1y+H/ms2yffJ
 e7OoVj+dxvgZWxzEvpaoMhzBg7FlZRUL8xrqXSvCSd72sWMLjzWcMhuDGG+Ix45Ub2t7
 G5++fr284jam+w5yCQv548oH2CA59lgkP795tFHDZUzm/mShUmNWi4ln0O7ojLQb3GKB
 ml5sOQXBPoqSQ/ou84Y8qjNpLNniI7KzN7lc8DoerFLyrGBbciP+lEm9bdd3hNV8xiiE
 RZLw==
X-Gm-Message-State: AOAM531z7SiT07l+zyVG+9cbwz51/hAo77wrDxRC9WlRGT+0l1xMDvrm
 kJkmD6lujoGafjqjwPas4U4EzUIaxa7Y7vzBvus=
X-Google-Smtp-Source: ABdhPJw5WAymCCreUwN189BHLlGFVlWgG69XmlErT0EE9Z3AkOStZtdL0HUVz8squPRqGthsWG5UK0w+M+xbzfucRE4=
X-Received: by 2002:a9d:6e10:: with SMTP id e16mr1803431otr.44.1626171812872; 
 Tue, 13 Jul 2021 03:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210713004205.775386-1-jusual@redhat.com>
 <20210713004205.775386-6-jusual@redhat.com>
 <20210713095931.61fa1281@redhat.com>
In-Reply-To: <20210713095931.61fa1281@redhat.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Tue, 13 Jul 2021 13:23:21 +0300
Message-ID: <CAC_L=vVLFFD5DuY1_Y7eBiORSz6HGPcro0aELf4e=QW15EUH1A@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] hw/acpi/ich9: Set ACPI PCI hot-plug as default on
 Q35
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004004d005c6fea1c5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Gibson <dgibson@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004004d005c6fea1c5
Content-Type: text/plain; charset="UTF-8"

Hi Igor,

On Tue, Jul 13, 2021 at 10:59 AM Igor Mammedov <imammedo@redhat.com> wrote:

> On Tue, 13 Jul 2021 02:42:04 +0200
> Julia Suvorova <jusual@redhat.com> wrote:
>
> > Q35 has three different types of PCI devices hot-plug: PCIe Native,
> > SHPC Native and ACPI hot-plug. This patch changes the default choice
> > for cold-plugged bridges from PCIe Native to ACPI Hot-plug with
> > ability to use SHPC and PCIe Native for hot-plugged bridges.
>
> Before we flip the switch,
> has the issue about not hotplug ports not getting IO (Michael)
> been addressed, if not are there any plans to fix it?
>
>
Following an offline discussion with Michael the understanding is
PCIe devices should work correctly without IO, so it only affects PCI
devices hot-plugged into PCIe ports, but those devices should be plugged
into pcie-pci bridges.

Another alternative is to drop this patch and let ACPI hotplug be an option
and not the default until we find a solution, meaning delaying the flip
until 6.2 since today is the soft-freeze.

I will let Michael decide, I am fine one way or the other.

Thanks,
Marcel



>
> > This is a list of the PCIe Native hot-plug issues that led to this
> > change:
> >     * no racy behavior during boot (see 110c477c2ed)
> >     * no delay during deleting - after the actual power off software
> >       must wait at least 1 second before indicating about it. This case
> >       is quite important for users, it even has its own bug:
> >           https://bugzilla.redhat.com/show_bug.cgi?id=1594168
> >     * no timer-based behavior - in addition to the previous example,
> >       the attention button has a 5-second waiting period, during which
> >       the operation can be canceled with a second press. While this
> >       looks fine for manual button control, automation will result in
> >       the need to queue or drop events, and the software receiving
> >       events in all sort of unspecified combinations of attention/power
> >       indicator states, which is racy and uppredictable.
> >     * fixes:
> >         * https://bugzilla.redhat.com/show_bug.cgi?id=1752465
> >         * https://bugzilla.redhat.com/show_bug.cgi?id=1690256
> >
> > To return to PCIe Native hot-plug:
> >     -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
> >
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  hw/acpi/ich9.c | 2 +-
> >  hw/i386/pc.c   | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> > index 2f4eb453ac..778e27b659 100644
> > --- a/hw/acpi/ich9.c
> > +++ b/hw/acpi/ich9.c
> > @@ -427,7 +427,7 @@ void ich9_pm_add_properties(Object *obj,
> ICH9LPCPMRegs *pm)
> >      pm->disable_s3 = 0;
> >      pm->disable_s4 = 0;
> >      pm->s4_val = 2;
> > -    pm->use_acpi_hotplug_bridge = false;
> > +    pm->use_acpi_hotplug_bridge = true;
> >
> >      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
> >                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 8e1220db72..7e03848792 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -98,6 +98,7 @@ GlobalProperty pc_compat_6_0[] = {
> >      { "qemu64" "-" TYPE_X86_CPU, "family", "6" },
> >      { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
> >      { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
> > +    { "ICH9-LPC", "acpi-pci-hotplug-with-bridge-support", "off" },
> >  };
> >  const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
> >
>
>

--0000000000004004d005c6fea1c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Igor,</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 13, 2021 at 10:59 AM =
Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com">imammedo@redhat.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Tue, 13 Jul 2021 02:42:04 +0200<br>
Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com" target=3D"_blank">j=
usual@redhat.com</a>&gt; wrote:<br>
<br>
&gt; Q35 has three different types of PCI devices hot-plug: PCIe Native,<br=
>
&gt; SHPC Native and ACPI hot-plug. This patch changes the default choice<b=
r>
&gt; for cold-plugged bridges from PCIe Native to ACPI Hot-plug with<br>
&gt; ability to use SHPC and PCIe Native for hot-plugged bridges.<br>
<br>
Before we flip the switch,<br>
has the issue about not hotplug ports not getting IO (Michael)<br>
been addressed, if not are there any plans to fix it?<br>
<br></blockquote><div><br></div><div>Following an offline discussion with M=
ichael the understanding is</div><div>PCIe devices should work correctly wi=
thout IO, so it only affects PCI</div><div>devices hot-plugged into PCIe po=
rts, but those devices should be plugged</div><div>into pcie-pci bridges.</=
div><div><br></div><div>Another alternative is to drop this patch and let A=
CPI hotplug be an option</div><div>and not the default until we find a solu=
tion, meaning delaying the flip</div><div>until 6.2 since today is the soft=
-freeze.=C2=A0</div><div><br></div><div>I will let Michael decide, I am fin=
e one way=C2=A0or the other.</div><div><br></div><div>Thanks,</div><div>Mar=
cel</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
&gt; This is a list of the PCIe Native hot-plug issues that led to this<br>
&gt; change:<br>
&gt;=C2=A0 =C2=A0 =C2=A0* no racy behavior during boot (see 110c477c2ed)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0* no delay during deleting - after the actual power=
 off software<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0must wait at least 1 second before indicatin=
g about it. This case<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0is quite important for users, it even has it=
s own bug:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://bugzilla.re=
dhat.com/show_bug.cgi?id=3D1594168" rel=3D"noreferrer" target=3D"_blank">ht=
tps://bugzilla.redhat.com/show_bug.cgi?id=3D1594168</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0* no timer-based behavior - in addition to the prev=
ious example,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the attention button has a 5-second waiting =
period, during which<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the operation can be canceled with a second =
press. While this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0looks fine for manual button control, automa=
tion will result in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the need to queue or drop events, and the so=
ftware receiving<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0events in all sort of unspecified combinatio=
ns of attention/power<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0indicator states, which is racy and uppredic=
table.<br>
&gt;=C2=A0 =C2=A0 =C2=A0* fixes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* <a href=3D"https://bugzilla.redhat.=
com/show_bug.cgi?id=3D1752465" rel=3D"noreferrer" target=3D"_blank">https:/=
/bugzilla.redhat.com/show_bug.cgi?id=3D1752465</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* <a href=3D"https://bugzilla.redhat.=
com/show_bug.cgi?id=3D1690256" rel=3D"noreferrer" target=3D"_blank">https:/=
/bugzilla.redhat.com/show_bug.cgi?id=3D1690256</a><br>
&gt; <br>
&gt; To return to PCIe Native hot-plug:<br>
&gt;=C2=A0 =C2=A0 =C2=A0-global ICH9-LPC.acpi-pci-hotplug-with-bridge-suppo=
rt=3Doff<br>
&gt; <br>
&gt; Signed-off-by: Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com"=
 target=3D"_blank">jusual@redhat.com</a>&gt;<br>
&gt; Reviewed-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" =
target=3D"_blank">imammedo@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/acpi/ich9.c | 2 +-<br>
&gt;=C2=A0 hw/i386/pc.c=C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c<br>
&gt; index 2f4eb453ac..778e27b659 100644<br>
&gt; --- a/hw/acpi/ich9.c<br>
&gt; +++ b/hw/acpi/ich9.c<br>
&gt; @@ -427,7 +427,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPM=
Regs *pm)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pm-&gt;disable_s3 =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pm-&gt;disable_s4 =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pm-&gt;s4_val =3D 2;<br>
&gt; -=C2=A0 =C2=A0 pm-&gt;use_acpi_hotplug_bridge =3D false;<br>
&gt; +=C2=A0 =C2=A0 pm-&gt;use_acpi_hotplug_bridge =3D true;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 object_property_add_uint32_ptr(obj, ACPI_PM_PROP_P=
M_IO_BASE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pm-&gt;p=
m_io_base, OBJ_PROP_FLAG_READ);<br>
&gt; diff --git a/hw/i386/pc.c b/hw/i386/pc.c<br>
&gt; index 8e1220db72..7e03848792 100644<br>
&gt; --- a/hw/i386/pc.c<br>
&gt; +++ b/hw/i386/pc.c<br>
&gt; @@ -98,6 +98,7 @@ GlobalProperty pc_compat_6_0[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 { &quot;qemu64&quot; &quot;-&quot; TYPE_X86_CPU, &=
quot;family&quot;, &quot;6&quot; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 { &quot;qemu64&quot; &quot;-&quot; TYPE_X86_CPU, &=
quot;model&quot;, &quot;6&quot; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 { &quot;qemu64&quot; &quot;-&quot; TYPE_X86_CPU, &=
quot;stepping&quot;, &quot;3&quot; },<br>
&gt; +=C2=A0 =C2=A0 { &quot;ICH9-LPC&quot;, &quot;acpi-pci-hotplug-with-bri=
dge-support&quot;, &quot;off&quot; },<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 const size_t pc_compat_6_0_len =3D G_N_ELEMENTS(pc_compat_6_0);<=
br>
&gt;=C2=A0 <br>
<br>
</blockquote></div></div>

--0000000000004004d005c6fea1c5--

