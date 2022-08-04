Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6885897E0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 08:49:15 +0200 (CEST)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJUfS-0005I4-8t
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 02:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oJUas-00027Q-E0
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 02:44:30 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oJUaq-0004u0-E7
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 02:44:30 -0400
Received: by mail-ej1-x635.google.com with SMTP id k26so19451813ejx.5
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 23:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=IpPls1YEPRPa2qP/O6E8pGoE67d+QZMvSneo8eybJ08=;
 b=yK8ymLgYlQHMGgUXBbdNcE5fiL2j08PThBHq1dPJcCLu9EUfCtYrjftjgYabkAdX+x
 xn6Q8XwREz8lpnn374Mefh2gGP5zFcH1mrwFvshVfnzXGBzyeUjhcmt2St+axPKrmQzQ
 NYVm2YnD5IFlKTGZctP3d7gIBmS9HXX7t6rGM4aPy34GpEjIccIOVDwvszP2WjcJCWZ/
 damUv2YK6EG/f6z/PQXzLNQ4B1y7rair8H9OHOm2dGK6+A35N6bh5aiQcux58NGpAHni
 Fm1xv74RdG/Yu0qqdag443P72Mvy7tqjK0GgVimuFgylyY2PL7k8aFIaZ5oNk6pYfV6j
 630g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=IpPls1YEPRPa2qP/O6E8pGoE67d+QZMvSneo8eybJ08=;
 b=6Fq62twn1fiob3F/fOPr68TQc+lEh6r+PXn6RC3QKiWrhgQvE5Pm8OIgF8iAbe89RG
 K22zQ0Iqh1r2luKzWeBJKgp3mtb+HUYEh54+jyYkqJQpNsKsqsqS2jcNMXnpna6xOdwG
 MpnafYOtVgSd/hSBW9ScBw7qIbXJkvZM/Hm0DE+e549UAv19MTn7p5d3c31kzO6YPM1l
 6ks5TZdTemckdjYmy3+RApJ6elfUV8Zm74cWyuSWNiTASPm481ejbvqdCvDSTS7Pn/rE
 HoP9h2N6mBvIeA5INaUODU8YBe9+9vaq3AiNr9JUbAiUS4ICgRo7vrr2/ejsYZcdqnMa
 7dVg==
X-Gm-Message-State: ACgBeo1Ew8Q6/J6D3Hhcs3UH+/NfFLrHOvbfmb/dzzAwvbKeNHKrxmXr
 5CwuhltUrkW+7BvsRBOpjkaCx5F61n0uxcEr+Z3ydA==
X-Google-Smtp-Source: AA6agR5OaDq4jomq9EGyMa8ZBAl5ZY+1vdZ0lrYXhTfaJL9vH9KtS2+peY785DBzZRnGmxaQDy6ua++zvcFFcMo11oE=
X-Received: by 2002:a17:907:16a2:b0:72b:87c9:af07 with SMTP id
 hc34-20020a17090716a200b0072b87c9af07mr331159ejc.121.1659595465295; Wed, 03
 Aug 2022 23:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <20220803175930-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220803175930-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 3 Aug 2022 23:44:14 -0700
Message-ID: <CAARzgwzyDLzLYJ95pTUp7i0v=AHUg8K=_3ao+H4uQg6+nJp-Dw@mail.gmail.com>
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features of
 PIIX4_PM
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, aurelien@aurel32.net,
 dgilbert@redhat.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, peter.maydell@linaro.org, 
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000002e3d2b05e564aebe"
Received-SPF: none client-ip=2a00:1450:4864:20::635;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

--0000000000002e3d2b05e564aebe
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 3, 2022 at 3:00 PM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Thu, Jul 28, 2022 at 07:50:34AM -0400, Igor Mammedov wrote:
> > QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
> >   $ qemu-system-mips -monitor stdio
> >   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> >   Segmentation fault (core dumped)
> >
> > It happens due to PIIX4_PM trying to parse hotplug vmstate structures
> > which are valid only for x86 and not for MIPS (as it requires ACPI
> > tables support which is not existent for ithe later)
> >
> > Issue was probably exposed by trying to cleanup/compile out unused
> > ACPI bits from MIPS target (but forgetting about migration bits).
> >
> > Disable compiled out features using compat properties as the least
> > risky way to deal with issue.
> >
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>
>
> For 7.1 this seems like the lesser evil.
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>


Yes for 7.1, let's go ahead with this aa it seems least risky approach.

I've already reviewed it.


>
> > ---
> > PS:
> > another approach could be setting defaults to disabled state and
> > enabling them using compat props on PC machines (which is more
> > code to deal with => more risky) or continue with PIIX4_PM
> > refactoring to split x86-shism out (which I'm not really
> > interested in due to risk of regressions for not much of
> > benefit)
> > ---
> >  hw/mips/malta.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> > index 7a0ec513b0..0e932988e0 100644
> > --- a/hw/mips/malta.c
> > +++ b/hw/mips/malta.c
> > @@ -1442,6 +1442,14 @@ static const TypeInfo mips_malta_device = {
> >      .instance_init = mips_malta_instance_init,
> >  };
> >
> > +GlobalProperty malta_compat[] = {
> > +    { "PIIX4_PM", "memory-hotplug-support", "off" },
> > +    { "PIIX4_PM", "acpi-pci-hotplug-with-bridge-support", "off" },
> > +    { "PIIX4_PM", "acpi-root-pci-hotplug", "off" },
> > +    { "PIIX4_PM", "x-not-migrate-acpi-index", "true" },
> > +};
> > +const size_t malta_compat_len = G_N_ELEMENTS(malta_compat);
> > +
> >  static void mips_malta_machine_init(MachineClass *mc)
> >  {
> >      mc->desc = "MIPS Malta Core LV";
> > @@ -1455,6 +1463,7 @@ static void mips_malta_machine_init(MachineClass
> *mc)
> >      mc->default_cpu_type = MIPS_CPU_TYPE_NAME("24Kf");
> >  #endif
> >      mc->default_ram_id = "mips_malta.ram";
> > +    compat_props_add(mc->compat_props, malta_compat, malta_compat_len);
> >  }
> >
> >  DEFINE_MACHINE("malta", mips_malta_machine_init)
> > --
> > 2.31.1
>
>

--0000000000002e3d2b05e564aebe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 3, 2022 at 3:00 PM Michael S. Tsirkin &lt;<a hr=
ef=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,=
204,204)">On Thu, Jul 28, 2022 at 07:50:34AM -0400, Igor Mammedov wrote:<br=
>
&gt; QEMU crashes trying to save VMSTATE when only MIPS target are compiled=
 in<br>
&gt;=C2=A0 =C2=A0$ qemu-system-mips -monitor stdio<br>
&gt;=C2=A0 =C2=A0(qemu) migrate &quot;exec:gzip -c &gt; STATEFILE.gz&quot;<=
br>
&gt;=C2=A0 =C2=A0Segmentation fault (core dumped)<br>
&gt; <br>
&gt; It happens due to PIIX4_PM trying to parse hotplug vmstate structures<=
br>
&gt; which are valid only for x86 and not for MIPS (as it requires ACPI<br>
&gt; tables support which is not existent for ithe later)<br>
&gt; <br>
&gt; Issue was probably exposed by trying to cleanup/compile out unused<br>
&gt; ACPI bits from MIPS target (but forgetting about migration bits).<br>
&gt; <br>
&gt; Disable compiled out features using compat properties as the least<br>
&gt; risky way to deal with issue.<br>
&gt; <br>
&gt; Signed-off-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com=
" target=3D"_blank">imammedo@redhat.com</a>&gt;<br>
<br>
<br>
For 7.1 this seems like the lesser evil.<br>
<br>
Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=
=3D"_blank">mst@redhat.com</a>&gt;</blockquote><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Yes for 7.1, let&#39;s go ahead with this aa it seems lea=
st risky approach.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>I&#39;ve already reviewed it.=C2=A0</div><div dir=3D"auto"><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(20=
4,204,204)" dir=3D"auto"><br>
<br>
&gt; ---<br>
&gt; PS:<br>
&gt; another approach could be setting defaults to disabled state and<br>
&gt; enabling them using compat props on PC machines (which is more<br>
&gt; code to deal with =3D&gt; more risky) or continue with PIIX4_PM<br>
&gt; refactoring to split x86-shism out (which I&#39;m not really<br>
&gt; interested in due to risk of regressions for not much of<br>
&gt; benefit)<br>
&gt; ---<br>
&gt;=C2=A0 hw/mips/malta.c | 9 +++++++++<br>
&gt;=C2=A0 1 file changed, 9 insertions(+)<br>
&gt; <br>
&gt; diff --git a/hw/mips/malta.c b/hw/mips/malta.c<br>
&gt; index 7a0ec513b0..0e932988e0 100644<br>
&gt; --- a/hw/mips/malta.c<br>
&gt; +++ b/hw/mips/malta.c<br>
&gt; @@ -1442,6 +1442,14 @@ static const TypeInfo mips_malta_device =3D {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 .instance_init =3D mips_malta_instance_init,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +GlobalProperty malta_compat[] =3D {<br>
&gt; +=C2=A0 =C2=A0 { &quot;PIIX4_PM&quot;, &quot;memory-hotplug-support&qu=
ot;, &quot;off&quot; },<br>
&gt; +=C2=A0 =C2=A0 { &quot;PIIX4_PM&quot;, &quot;acpi-pci-hotplug-with-bri=
dge-support&quot;, &quot;off&quot; },<br>
&gt; +=C2=A0 =C2=A0 { &quot;PIIX4_PM&quot;, &quot;acpi-root-pci-hotplug&quo=
t;, &quot;off&quot; },<br>
&gt; +=C2=A0 =C2=A0 { &quot;PIIX4_PM&quot;, &quot;x-not-migrate-acpi-index&=
quot;, &quot;true&quot; },<br>
&gt; +};<br>
&gt; +const size_t malta_compat_len =3D G_N_ELEMENTS(malta_compat);<br>
&gt; +<br>
&gt;=C2=A0 static void mips_malta_machine_init(MachineClass *mc)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mc-&gt;desc =3D &quot;MIPS Malta Core LV&quot;;<br=
>
&gt; @@ -1455,6 +1463,7 @@ static void mips_malta_machine_init(MachineClass=
 *mc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mc-&gt;default_cpu_type =3D MIPS_CPU_TYPE_NAME(&qu=
ot;24Kf&quot;);<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mc-&gt;default_ram_id =3D &quot;mips_malta.ram&quo=
t;;<br>
&gt; +=C2=A0 =C2=A0 compat_props_add(mc-&gt;compat_props, malta_compat, mal=
ta_compat_len);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEFINE_MACHINE(&quot;malta&quot;, mips_malta_machine_init)<br>
&gt; -- <br>
&gt; 2.31.1<br>
<br>
</blockquote></div></div>

--0000000000002e3d2b05e564aebe--

