Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165605891C0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 19:49:27 +0200 (CEST)
Received: from localhost ([::1]:47574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJIUn-0007dM-VL
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 13:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oJI8v-0000Zz-3w
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 13:26:49 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:47024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oJI8s-00075y-TL
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 13:26:48 -0400
Received: by mail-qt1-x829.google.com with SMTP id b18so3753931qtq.13
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 10:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1vzDBSwUbYDVS67+VHtfzxonhgl/cm4QagO8xtF15us=;
 b=O+jvPzQDoCj7zLz1kdwLsx5IGTZHR5255Fx8ErncQWxkRsQeaJjh8m/yQk6ENqRwr0
 lq20zRImSDrNvYuA5n7s94FZOrxGAvAGz/SguHtDa1TDVi1QIdZ45GwU8s30cObP413K
 fIKm4N70646gY8riaS+7qjFooMb4Vwt7NKLzgW19RANk4zK6lZAKSVF6bXXHKZO8y512
 n4cTfXLo2RicVH4S7GIkftRUsH53wQDk10we4ZU1TYaNkb1iJuxY9HCKQXSOStF3h2gz
 iWU47mzVQR2L1IRogQgP20evr6Wj1HRWIrFQfmsojw79sv4Y47opnYqHu+vKKch68ilA
 LMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1vzDBSwUbYDVS67+VHtfzxonhgl/cm4QagO8xtF15us=;
 b=qDb+h5Qf0KfxHklNstkx9vQCtvWG3r8t4QkXWw06XJGaebKGCGu82UBRxKv0vlHiul
 OdDjd3hZ+F73rrvmlHE8XRL6xmVYMrN1Q5C2KmD0lPjlND88hTQptmTSrEsWF63UojK3
 KtaH3y82/LhkKmqqZINlyxF32OHJDVBTyDdRJmTzikoyvYZ3KU+cgWvw67200dKTtt0q
 C0kUe/OImok6zZF547fZoDPmdflPU5qLb2DZyocL+UAMMBHaeN7LBnaqEuPoZZXiso3/
 PZ+t7dDt8pGNtTTFFMxUo3H4vHsqbiM0ERywludkHZWbdmDH9+JXJWJNkc28TpDkuSsm
 hDxQ==
X-Gm-Message-State: AJIora8ZHST0wGo91NH4G+Gp7OsBgbQjjVuCT9LAo+JBAW5SIyjyPbau
 XpleRXB1XCco+HM16cBQQqJ5TenOzeFQOWeQAeg=
X-Google-Smtp-Source: AGRyM1vp4JnwQErhWnCeIWZYWj4dfwsSxyHNzZw0PC9vl8CILcT9Zsmf2/nRE+dsYkBHwXVoAJ0ZqWuBFdgF4MDsUkw=
X-Received: by 2002:a05:622a:14c8:b0:31f:bc3:fc0b with SMTP id
 u8-20020a05622a14c800b0031f0bc3fc0bmr23318839qtx.666.1659547605576; Wed, 03
 Aug 2022 10:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <CAFEAcA95sRW8u2NFDa1BX7uNg2t85Yr_kPgWWC+5QnJobygwMA@mail.gmail.com>
 <20220728151627.119d57d5@redhat.com>
 <769cfc18-9585-5ddf-de46-52aa64328cea@amsat.org>
In-Reply-To: <769cfc18-9585-5ddf-de46-52aa64328cea@amsat.org>
From: Bernhard Beschow <shentey@gmail.com>
Date: Wed, 3 Aug 2022 19:26:30 +0200
Message-ID: <CAG4p6K53y=Oe9vynXgGYTZ9CfHewsDeE3mFDkEb-_us7rgaBcg@mail.gmail.com>
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features of
 PIIX4_PM
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000084af2305e5598961"
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=shentey@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

--00000000000084af2305e5598961
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 2, 2022 at 8:37 AM Philippe Mathieu-Daud=C3=A9 via <
qemu-devel@nongnu.org> wrote:

> On 28/7/22 15:16, Igor Mammedov wrote:
> > On Thu, 28 Jul 2022 13:29:07 +0100
> > Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> >> On Thu, 28 Jul 2022 at 12:50, Igor Mammedov <imammedo@redhat.com>
> wrote:
> >>>
> >>> QEMU crashes trying to save VMSTATE when only MIPS target are compile=
d
> in
> >>>    $ qemu-system-mips -monitor stdio
> >>>    (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> >>>    Segmentation fault (core dumped)
> >>>
> >>> It happens due to PIIX4_PM trying to parse hotplug vmstate structures
> >>> which are valid only for x86 and not for MIPS (as it requires ACPI
> >>> tables support which is not existent for ithe later)
>
> We already discussed this Frankenstein PIIX4 problem 2 and 4 years ago:
>
> https://lore.kernel.org/qemu-devel/4d42697e-ba84-e5af-3a17-a2cc52cf0dbc@r=
edhat.com/
>
> https://lore.kernel.org/qemu-devel/20190304210359-mutt-send-email-mst@ker=
nel.org/


Interesting reads!


> >>> Issue was probably exposed by trying to cleanup/compile out unused
> >>> ACPI bits from MIPS target (but forgetting about migration bits).
> >>>
> >>> Disable compiled out features using compat properties as the least
> >>> risky way to deal with issue.
>
> So now MIPS is forced to use meaningless compat[] to satisfy X86.
>
> Am I wrong seeing this as a dirty hack creeping in, yet another
> technical debt that will hit (me...) back in a close future?
>
> Are we sure there are no better solution (probably more time consuming
> and involving refactors) we could do instead?
>

Working on the consolidation of piix3 and -4 soutbridges [1] I've stumbled
over certain design decisions where board/platform specific assumptions are
baked into the piix device models. I figure that's the core of the issue.

In our case the ACPI functionality is implemented by inheritance while
perhaps it should be implemented using composition. With composition, the
ACPI functionality could be injected by the caller: The pc board would
inject it while the Malta board wouldn't. This would solve both the crash
and above design problem.

I'd be willing to implement it but can't make any promises about the time
frame since I'm currently doing this in my free time. Any hints regarding
the implementation would be welcome, though.

Best regards,
Bernhard

[1] https://github.com/shentok/qemu/commits/piix-consolidate


> Thanks,
>
> Phil.
>
> >>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >>
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/995
> >>
> >>> ---
> >>> PS:
> >>> another approach could be setting defaults to disabled state and
> >>> enabling them using compat props on PC machines (which is more
> >>> code to deal with =3D> more risky) or continue with PIIX4_PM
> >>> refactoring to split x86-shism out (which I'm not really
> >>> interested in due to risk of regressions for not much of
> >>> benefit)
> >>> ---
> >>>   hw/mips/malta.c | 9 +++++++++
> >>>   1 file changed, 9 insertions(+)
> >>>
> >>> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> >>> index 7a0ec513b0..0e932988e0 100644
> >>> --- a/hw/mips/malta.c
> >>> +++ b/hw/mips/malta.c
> >>> @@ -1442,6 +1442,14 @@ static const TypeInfo mips_malta_device =3D {
> >>>       .instance_init =3D mips_malta_instance_init,
> >>>   };
> >>>
> >>> +GlobalProperty malta_compat[] =3D {
> >>> +    { "PIIX4_PM", "memory-hotplug-support", "off" },
> >>> +    { "PIIX4_PM", "acpi-pci-hotplug-with-bridge-support", "off" },
> >>> +    { "PIIX4_PM", "acpi-root-pci-hotplug", "off" },
> >>> +    { "PIIX4_PM", "x-not-migrate-acpi-index", "true" },
> >>> +};
> >>
> >> Is there an easy way to assert in hw/acpi/piix4.c that if
> >> CONFIG_ACPI_PCIHP was not set then the board has initialized
> >> all these properties to the don't-use-hotplug state ?
> >> That would be a guard against similar bugs (though I suppose
> >> we probably aren't likely to add new piix4 boards...)
> >
> > unfortunately new features still creep in 'pc' machine
> > ex: "acpi-root-pci-hotplug"), and I don't see an easy
> > way to compile that nor enforce that in the future.
> >
> > Far from easy would be split piix4_pm on base/enhanced
> > classes so we wouldn't need x86 specific hacks in 'base'
> > variant (assuming 'enhanced' could maintain the current
> > VMSTATE to keep cross-version migration working).
> >
> >>> +const size_t malta_compat_len =3D G_N_ELEMENTS(malta_compat);
> >>> +
> >>>   static void mips_malta_machine_init(MachineClass *mc)
> >>>   {
> >>>       mc->desc =3D "MIPS Malta Core LV";
> >>> @@ -1455,6 +1463,7 @@ static void mips_malta_machine_init(MachineClas=
s
> *mc)
> >>>       mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("24Kf");
> >>>   #endif
> >>>       mc->default_ram_id =3D "mips_malta.ram";
> >>> +    compat_props_add(mc->compat_props, malta_compat,
> malta_compat_len);
> >>>   }
> >>>
> >>>   DEFINE_MACHINE("malta", mips_malta_machine_init)
> >>> --
> >>> 2.31.1
> >>
> >> thanks
> >> -- PMM
> >>
> >
>
>
>

--00000000000084af2305e5598961
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Aug 2, 2022 at 8:37 AM Philippe Mathieu-Daud=C3=A9 via &lt;<=
a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 28/7/22 15:=
16, Igor Mammedov wrote:<br>
&gt; On Thu, 28 Jul 2022 13:29:07 +0100<br>
&gt; Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=
=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; On Thu, 28 Jul 2022 at 12:50, Igor Mammedov &lt;<a href=3D"mailto:=
imammedo@redhat.com" target=3D"_blank">imammedo@redhat.com</a>&gt; wrote:<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; QEMU crashes trying to save VMSTATE when only MIPS target are =
compiled in<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 $ qemu-system-mips -monitor stdio<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 (qemu) migrate &quot;exec:gzip -c &gt; STATEFILE.=
gz&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 Segmentation fault (core dumped)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; It happens due to PIIX4_PM trying to parse hotplug vmstate str=
uctures<br>
&gt;&gt;&gt; which are valid only for x86 and not for MIPS (as it requires =
ACPI<br>
&gt;&gt;&gt; tables support which is not existent for ithe later)<br>
<br>
We already discussed this Frankenstein PIIX4 problem 2 and 4 years ago:<br>
<a href=3D"https://lore.kernel.org/qemu-devel/4d42697e-ba84-e5af-3a17-a2cc5=
2cf0dbc@redhat.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kern=
el.org/qemu-devel/4d42697e-ba84-e5af-3a17-a2cc52cf0dbc@redhat.com/</a><br>
<a href=3D"https://lore.kernel.org/qemu-devel/20190304210359-mutt-send-emai=
l-mst@kernel.org/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel=
.org/qemu-devel/20190304210359-mutt-send-email-mst@kernel.org/</a></blockqu=
ote><div><br></div><div>Interesting reads!</div><div>=C2=A0<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt;&gt; Issue was probably exposed by trying to cleanup/compile out un=
used<br>
&gt;&gt;&gt; ACPI bits from MIPS target (but forgetting about migration bit=
s).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Disable compiled out features using compat properties as the l=
east<br>
&gt;&gt;&gt; risky way to deal with issue.<br>
<br>
So now MIPS is forced to use meaningless compat[] to satisfy X86.<br>
<br>
Am I wrong seeing this as a dirty hack creeping in, yet another<br>
technical debt that will hit (me...) back in a close future?<br>
<br>
Are we sure there are no better solution (probably more time consuming<br>
and involving refactors) we could do instead?<br></blockquote><div><br></di=
v><div>Working on the consolidation of piix3 and -4 soutbridges [1] I&#39;v=
e stumbled over certain design decisions where board/platform specific assu=
mptions are baked into the piix device models. I figure that&#39;s the core=
 of the issue.</div><div><br></div><div>In our case the ACPI functionality =
is implemented by inheritance while perhaps it should be implemented using =
composition. With composition, the ACPI functionality could be injected by =
the caller: The pc board would inject it while the Malta board wouldn&#39;t=
. This would solve both the crash and above design problem.<br></div><div><=
br></div><div>I&#39;d be willing to implement it but can&#39;t  make any pr=
omises about the time frame since I&#39;m currently doing this in my free t=
ime. Any hints regarding the implementation would be welcome, though.</div>=
<div><br></div><div>Best regards,</div><div>Bernhard<br></div><div><br></di=
v><div>[1] <a href=3D"https://github.com/shentok/qemu/commits/piix-consolid=
ate">https://github.com/shentok/qemu/commits/piix-consolidate</a></div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
<br>
Phil.<br>
<br>
&gt;&gt;&gt; Signed-off-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@re=
dhat.com" target=3D"_blank">imammedo@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues=
/995" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/=
qemu/-/issues/995</a><br>
&gt;&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; PS:<br>
&gt;&gt;&gt; another approach could be setting defaults to disabled state a=
nd<br>
&gt;&gt;&gt; enabling them using compat props on PC machines (which is more=
<br>
&gt;&gt;&gt; code to deal with =3D&gt; more risky) or continue with PIIX4_P=
M<br>
&gt;&gt;&gt; refactoring to split x86-shism out (which I&#39;m not really<b=
r>
&gt;&gt;&gt; interested in due to risk of regressions for not much of<br>
&gt;&gt;&gt; benefit)<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0hw/mips/malta.c | 9 +++++++++<br>
&gt;&gt;&gt;=C2=A0 =C2=A01 file changed, 9 insertions(+)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/hw/mips/malta.c b/hw/mips/malta.c<br>
&gt;&gt;&gt; index 7a0ec513b0..0e932988e0 100644<br>
&gt;&gt;&gt; --- a/hw/mips/malta.c<br>
&gt;&gt;&gt; +++ b/hw/mips/malta.c<br>
&gt;&gt;&gt; @@ -1442,6 +1442,14 @@ static const TypeInfo mips_malta_device=
 =3D {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.instance_init =3D mips_malta_instan=
ce_init,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0};<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +GlobalProperty malta_compat[] =3D {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 { &quot;PIIX4_PM&quot;, &quot;memory-hotplug-su=
pport&quot;, &quot;off&quot; },<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 { &quot;PIIX4_PM&quot;, &quot;acpi-pci-hotplug-=
with-bridge-support&quot;, &quot;off&quot; },<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 { &quot;PIIX4_PM&quot;, &quot;acpi-root-pci-hot=
plug&quot;, &quot;off&quot; },<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 { &quot;PIIX4_PM&quot;, &quot;x-not-migrate-acp=
i-index&quot;, &quot;true&quot; },<br>
&gt;&gt;&gt; +};<br>
&gt;&gt;<br>
&gt;&gt; Is there an easy way to assert in hw/acpi/piix4.c that if<br>
&gt;&gt; CONFIG_ACPI_PCIHP was not set then the board has initialized<br>
&gt;&gt; all these properties to the don&#39;t-use-hotplug state ?<br>
&gt;&gt; That would be a guard against similar bugs (though I suppose<br>
&gt;&gt; we probably aren&#39;t likely to add new piix4 boards...)<br>
&gt; <br>
&gt; unfortunately new features still creep in &#39;pc&#39; machine<br>
&gt; ex: &quot;acpi-root-pci-hotplug&quot;), and I don&#39;t see an easy<br=
>
&gt; way to compile that nor enforce that in the future.<br>
&gt; <br>
&gt; Far from easy would be split piix4_pm on base/enhanced<br>
&gt; classes so we wouldn&#39;t need x86 specific hacks in &#39;base&#39;<b=
r>
&gt; variant (assuming &#39;enhanced&#39; could maintain the current<br>
&gt; VMSTATE to keep cross-version migration working).<br>
&gt; <br>
&gt;&gt;&gt; +const size_t malta_compat_len =3D G_N_ELEMENTS(malta_compat);=
<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0static void mips_malta_machine_init(MachineClass *=
mc)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mc-&gt;desc =3D &quot;MIPS Malta Cor=
e LV&quot;;<br>
&gt;&gt;&gt; @@ -1455,6 +1463,7 @@ static void mips_malta_machine_init(Mach=
ineClass *mc)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mc-&gt;default_cpu_type =3D MIPS_CPU=
_TYPE_NAME(&quot;24Kf&quot;);<br>
&gt;&gt;&gt;=C2=A0 =C2=A0#endif<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mc-&gt;default_ram_id =3D &quot;mips=
_malta.ram&quot;;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 compat_props_add(mc-&gt;compat_props, malta_com=
pat, malta_compat_len);<br>
&gt;&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0DEFINE_MACHINE(&quot;malta&quot;, mips_malta_machi=
ne_init)<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.31.1<br>
&gt;&gt;<br>
&gt;&gt; thanks<br>
&gt;&gt; -- PMM<br>
&gt;&gt;<br>
&gt; <br>
<br>
<br>
</blockquote></div></div>

--00000000000084af2305e5598961--

