Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CBE39079A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:26:52 +0200 (CEST)
Received: from localhost ([::1]:33376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llapP-0007D0-Ay
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1llZuf-0006CI-NJ; Tue, 25 May 2021 12:28:17 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:33447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1llZuc-0002OW-4e; Tue, 25 May 2021 12:28:13 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so29211004oto.0; 
 Tue, 25 May 2021 09:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+WcEJO4OgTD+y9sry4kOUGaIUx8WIMo/i3hpwApzx+U=;
 b=fn7g+nWrsnmQ4dqbEo5Tc+Nugi985k5Ine+NPWUTCtsRuxY//hh+flCAdO9nBIKGUE
 vEqlUIorC3TLHCBlV7yEcsegkc8DAsT69BTLSmch7ERUXk7ivQdd+ysBWZVYgwoph0eJ
 RMD7ZYQtDdjgSkiQ0U7FDjh+lvjORlzuBdyGU47fwnWL9aX3RNAPyIswpVkgA7vNUH4z
 l3hGAA9ZPlRzSJkWtwe5DXQD8Dj83ZcGwi43Prs/R0x0pgqWboBQUFmZ1dtswWsnlnbo
 cbkN5NU8tNFJqqr//vrS1Vs3blaNT6ruDvS25Fv92Ylgj0MDeLxqzeMOHIwJw9ArN9nT
 nbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+WcEJO4OgTD+y9sry4kOUGaIUx8WIMo/i3hpwApzx+U=;
 b=nqHf3Yl+r2VO1LL460BZHyTU4Ozliwx8P+ETHF3fe5B+9lwCtpscZptN+OFjXh7zIL
 KhZYOBB5rQrz3WuWTP75L8jwGMeAj1lVOGozme9CA1kY89VJHhg8+ngbhT3SNogyEDHk
 wDFGiP6xDlekVJCRik6oY80pgKkYriL96QBXjEZW+lThstl95gelAYl7om4XVG1I4ISZ
 u+69DCahXcchRP614lP0UNn2rlnhmXHiVm5rg3tSaCGe8Tqz39AAbguWNGKmDhGNYU4L
 RdwUPDFQfctaWLi1ZLR5TT0U/8X6XntJCbiWZi8zFYDqgF5Lj9ZQkK+EPbJOdFpHNsYB
 8w+g==
X-Gm-Message-State: AOAM533+AHARXFReBja3zlkklk0Gu6JyAvm2c81r7yENCBHayWdH7YQ+
 qMuC1rkyLT/wlnKBTU4+5dGYW9WYp+fWZ0S9vwc=
X-Google-Smtp-Source: ABdhPJxdigVEgbh8pTX7nM9y/DhqFBRNJYAPjUudAsokwr8gfcP+y4zUVf/ATL3gsCrKGOkFc69wN5tIuqdUTw3fZA4=
X-Received: by 2002:a9d:554b:: with SMTP id h11mr23505273oti.4.1621960088342; 
 Tue, 25 May 2021 09:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
In-Reply-To: <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
From: Swetha Joshi <swethajoshi139@gmail.com>
Date: Tue, 25 May 2021 09:27:57 -0700
Message-ID: <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e7d3c105c32a0278"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=swethajoshi139@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e7d3c105c32a0278
Content-Type: text/plain; charset="UTF-8"

Hey Peter, Phil,

Yeah like Peter mentioned, when KVM is enabled and we don't want VIRT
enabled, there are a couple of routines that are being called from virt.h
and ghes.h, which is resulting in errors. I came up with this simple fix
but if you think there is a better solution to it I'll let you/ other
developers who own it decide and fix it because I don't have much
experience or visibility into what happens internally, my knowledge is
restricted to just using the configs.

Thank you for the feedback.

On Tue, May 25, 2021 at 2:05 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 25 May 2021 at 04:21, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 5/24/21 7:58 PM, Swetha Joshi wrote:
> > > Signed-off-by: Swetha Joshi <swethajoshi139@gmail.com>
> > > ---
> > >   target/arm/kvm64.c | 12 ++++++++----
> > >   1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > You're still missing the commit message.
> >
> > >
> > > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > > index dff85f6db9..47a4d9d831 100644
> > > --- a/target/arm/kvm64.c
> > > +++ b/target/arm/kvm64.c
> > > @@ -1403,7 +1403,10 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int
> code, void *addr)
> > >       hwaddr paddr;
> > >       Object *obj = qdev_get_machine();
> > >       VirtMachineState *vms = VIRT_MACHINE(obj);
> > > -    bool acpi_enabled = virt_is_acpi_enabled(vms);
> > > +    bool acpi_enabled = false;
> > > +#ifdef CONFIG_ARM_VIRT
> > > +    acpi_enabled = virt_is_acpi_enabled(vms);
> > > +#endif /* CONFIG_ARM_VIRT */
> > >
> > >       assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
> > >
> > > @@ -1426,12 +1429,13 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int
> code, void *addr)
> > >                */
> > >               if (code == BUS_MCEERR_AR) {
> > >                   kvm_cpu_synchronize_state(c);
> > > -                if (!acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA,
> paddr)) {
> > > -                    kvm_inject_arm_sea(c);
> > > -                } else {
> > > +#ifdef CONFIG_ACPI_APEI
> > > +                if (acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA,
> paddr)) {
> > >                       error_report("failed to record the error");
> > >                       abort();
> > >                   }
> > > +#endif /* CONFIG_ACPI_APEI */
> > > +                kvm_inject_arm_sea(c);
> > >               }
> >
> > Otherwise the actual patch looks ok.
>
> I feel like the underlying problem here is that we let a
> virt-board-specific
> bit of code slip into what should be generic Arm/KVM code here. We do
> need to know "does the board actually have an ACPI table we can record the
> memory error into", but that shouldn't be a specific query to virt board
> code. I think (but have not tested) that a nicer solution would look like:
>
> bool acpi_ghes_present(void)
> {
>     return object_resolve_path_type("", TYPE_ACPI_GED, NULL) != NULL;
> }
>
> in hw/acpi/ghes.c, and then using that function instead of
> virt_is_acpi_enabled().
>
> That avoids the CONFIG_ARM_VIRT specific reference and the need for ifdefs,
> and means that any future Arm board that wants to can support memory errors
> via ACPI tables by creating the ACPI_GED device and setting up the ACPI
> tables as virt does.
>
> (You will also need: a stub "return false" version in a new ghes-stub.c
> file,
> in an if_false clause in the meson.build line for ghes.c similar to the way
> ipmi.c/ipmi-stub.c are done; a prototype in include/hw/acpi/ghes.h with a
> doc-comment block documenting the function; possibly to add a stub for
> acpi_ghes_record_errors() in the new ghes-stub.c.)
>
> thanks
> -- PMM
>


-- 
Regards

Swetha Joshi.

--000000000000e7d3c105c32a0278
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Peter, Phil,<div><br></div><div>Yeah like Peter mentio=
ned, when KVM is enabled and we don&#39;t want VIRT enabled, there are a co=
uple of routines that are being=C2=A0called from virt.h and ghes.h, which i=
s resulting in errors. I came up with this simple fix but if you think ther=
e is a better solution to it I&#39;ll let you/ other developers who own it =
decide and fix it because I don&#39;t have much experience=C2=A0or visibili=
ty into what happens internally, my knowledge is restricted to just using t=
he configs.=C2=A0</div><div><br></div><div>Thank you for the feedback.</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Tue, May 25, 2021 at 2:05 AM Peter Maydell &lt;<a href=3D"mailto:peter.=
maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Tue, 25 May 2021 at 04:21, R=
ichard Henderson<br>
&lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richa=
rd.henderson@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 5/24/21 7:58 PM, Swetha Joshi wrote:<br>
&gt; &gt; Signed-off-by: Swetha Joshi &lt;<a href=3D"mailto:swethajoshi139@=
gmail.com" target=3D"_blank">swethajoshi139@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0target/arm/kvm64.c | 12 ++++++++----<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 8 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; You&#39;re still missing the commit message.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c<br>
&gt; &gt; index dff85f6db9..47a4d9d831 100644<br>
&gt; &gt; --- a/target/arm/kvm64.c<br>
&gt; &gt; +++ b/target/arm/kvm64.c<br>
&gt; &gt; @@ -1403,7 +1403,10 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, =
int code, void *addr)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr paddr;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Object *obj =3D qdev_get_machine();<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VirtMachineState *vms =3D VIRT_MACHINE(=
obj);<br>
&gt; &gt; -=C2=A0 =C2=A0 bool acpi_enabled =3D virt_is_acpi_enabled(vms);<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 bool acpi_enabled =3D false;<br>
&gt; &gt; +#ifdef CONFIG_ARM_VIRT<br>
&gt; &gt; +=C2=A0 =C2=A0 acpi_enabled =3D virt_is_acpi_enabled(vms);<br>
&gt; &gt; +#endif /* CONFIG_ARM_VIRT */<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0assert(code =3D=3D BUS_MCEERR_AR || cod=
e =3D=3D BUS_MCEERR_AO);<br>
&gt; &gt;<br>
&gt; &gt; @@ -1426,12 +1429,13 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c,=
 int code, void *addr)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (code =
=3D=3D BUS_MCEERR_AR) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0kvm_cpu_synchronize_state(c);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!acp=
i_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 kvm_inject_arm_sea(c);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {=
<br>
&gt; &gt; +#ifdef CONFIG_ACPI_APEI<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (acpi=
_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0error_report(&quot;failed to record the error&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0abort();<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>
&gt; &gt; +#endif /* CONFIG_ACPI_APEI */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kvm_inje=
ct_arm_sea(c);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; Otherwise the actual patch looks ok.<br>
<br>
I feel like the underlying problem here is that we let a virt-board-specifi=
c<br>
bit of code slip into what should be generic Arm/KVM code here. We do<br>
need to know &quot;does the board actually have an ACPI table we can record=
 the<br>
memory error into&quot;, but that shouldn&#39;t be a specific query to virt=
 board<br>
code. I think (but have not tested) that a nicer solution would look like:<=
br>
<br>
bool acpi_ghes_present(void)<br>
{<br>
=C2=A0 =C2=A0 return object_resolve_path_type(&quot;&quot;, TYPE_ACPI_GED, =
NULL) !=3D NULL;<br>
}<br>
<br>
in hw/acpi/ghes.c, and then using that function instead of<br>
virt_is_acpi_enabled().<br>
<br>
That avoids the CONFIG_ARM_VIRT specific reference and the need for ifdefs,=
<br>
and means that any future Arm board that wants to can support memory errors=
<br>
via ACPI tables by creating the ACPI_GED device and setting up the ACPI<br>
tables as virt does.<br>
<br>
(You will also need: a stub &quot;return false&quot; version in a new ghes-=
stub.c file,<br>
in an if_false clause in the meson.build line for ghes.c similar to the way=
<br>
ipmi.c/ipmi-stub.c are done; a prototype in include/hw/acpi/ghes.h with a<b=
r>
doc-comment block documenting the function; possibly to add a stub for<br>
acpi_ghes_record_errors() in the new ghes-stub.c.)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards<div><br></div><div>Swet=
ha Joshi.</div></div></div>

--000000000000e7d3c105c32a0278--

