Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267A551E557
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 09:51:39 +0200 (CEST)
Received: from localhost ([::1]:59256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnFE1-0005K2-OU
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 03:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1nnFBx-0004Ut-MU; Sat, 07 May 2022 03:49:30 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1nnFBw-00047T-2u; Sat, 07 May 2022 03:49:29 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so12730450pjb.5; 
 Sat, 07 May 2022 00:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WTTZLH+nVD2rl4MfeDYdfYgJSBe3+wz5NxL4WrsRBZ0=;
 b=G26aOLDZEobU0MbGIiCdnU7wrRbm3TLAKDIrEImL37RG73n/VvRNOLm0+iLQkrZPps
 hpO4V673im18RVY5a+XD6iLxP8gQviIvdus8O/a21AA/y0TEDsH6bnhXf6VfoAXWO1St
 ibDdY8gDRsnexOqaUdWiikqYkoOr02cZbz40VMvqSI/TBeaCspBtG0t3/liBb2UAoZqb
 /UZFsrnsCujtNHkIsGJkPIx27C0HEIs1EF9arFCzjLObugq+sSJFxOPq8vLidls13e5e
 JxQorid4yzA/uX7oOdQgDHGLJtWYZ2x343mX4ZM1sC3QFoahWDthjOGkpS1d/1GGNCZI
 S+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WTTZLH+nVD2rl4MfeDYdfYgJSBe3+wz5NxL4WrsRBZ0=;
 b=f9bJ1KR1k1d/jzHlrmjwBNx7Uj8a9Hj2Ty4yC/bjWjGknj/hyN7FgydTUFfRz0kMWu
 xl+3i7VC9RifMZfbRdfHK87v0hDmVJrj7JXZLwfF2xUqqbpDz9gA37864LfTdP/dJrzV
 IdiRyVQ7vg+QPXk6KRfrNqyOQ/LLJ02wmdJ73AhYepjIupz7MMQvcp7LaqXJYmLURIu6
 Z4hhp1kfeECIMxXA2L7z2KzLN3m1VKlg4wxW4XR2fExe2ULUPdjUtSzXpW8n+INiio5Q
 geMRhCex8UE9FxuQOB/U38VYgYMsx3rZM9QqM+DVc70eFJGv6pV3vl0eoTyUeYWMiNek
 odsQ==
X-Gm-Message-State: AOAM533TByz+M/uKUqgpgMeK2Icl8g9uhM/fDRYacnczfnWI7c07iUEm
 XbHOmm9ezV06zbTHxeKRtIujQXGarX5Cnqm7ZFE=
X-Google-Smtp-Source: ABdhPJxYcd2Iy5oGcFoZsghPI3i4CWEFDMaIiUobuylBx2aw7OztPYgmRoe7HzD9FtEBEmnkrbrTJWxdhYYyPa/GpNU=
X-Received: by 2002:a17:90b:11d1:b0:1db:d99f:62cc with SMTP id
 gv17-20020a17090b11d100b001dbd99f62ccmr8589446pjb.200.1651909765712; Sat, 07
 May 2022 00:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
 <20220506162129.2896966-5-peter.maydell@linaro.org>
 <CAFEAcA8bT_LzFTuuciWOUEVnozpOqySrpr1pkZ76MGEk4NK2RA@mail.gmail.com>
In-Reply-To: <CAFEAcA8bT_LzFTuuciWOUEVnozpOqySrpr1pkZ76MGEk4NK2RA@mail.gmail.com>
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Sat, 7 May 2022 16:49:15 +0900
Message-ID: <CANW9uysf_7AkpExkQP63UWZfh+aSVczZo=0LJTTt80_x7SMq6w@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/intc/arm_gicv3: Use correct number of priority
 bits for the CPU
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c94eff05de673656"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=itaru.kitayama@gmail.com; helo=mail-pj1-x102e.google.com
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

--000000000000c94eff05de673656
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter,
I=E2=80=99ll talk with Shuichiro this coming Monday (here most of us on vac=
ation),
and get back to you.

Itaru.

On Sat, May 7, 2022 at 1:34 Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 6 May 2022 at 17:21, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > Make the GICv3 set its number of bits of physical priority from the
> > implementation-specific value provided in the CPU state struct, in
> > the same way we already do for virtual priority bits.  Because this
> > would be a migration compatibility break, we provide a property
> > force-8-bit-prio which is enabled for 7.0 and earlier versioned board
> > models to retain the legacy "always use 8 bits" behaviour.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > I have guessed at the right value for the A64FX, but if we can
> > find the correct ICC_CTLR_EL1 value that would be better.
>
> Shuuichirou, Itaru: do either of you know the right setting for
> the A64FX for this? If you can find what the hardware value of
> the ICC_CTLR_EL3 or ICC_CTLR_EL1 register is (more specifically,
> the PRIBits subfield) that should be enough to tell us.
>
> > @@ -961,6 +964,12 @@ static void aarch64_a64fx_initfn(Object *obj)
> >      cpu->gic_num_lrs =3D 4;
> >      cpu->gic_vpribits =3D 5;
> >      cpu->gic_vprebits =3D 5;
> > +    /*
> > +     * TODO: What does the real A64FX GICv3 provide ?
> > +     * This is a guess based on what other Arm CPUs do; to find the
> correct
> > +     * answer we need the value of the A64FX's ICC_CTLR_EL1 register.
> > +     */
> > +    cpu->gic_pribits =3D 5;
> >
> >      /* Suppport of A64FX's vector length are 128,256 and 512bit only *=
/
> >      aarch64_add_sve_properties(obj);
> > --
> > 2.25.1
>
> thanks
> -- PMM
>

--000000000000c94eff05de673656
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Peter,</div><div dir=3D"auto">I=E2=80=99ll talk with Shui=
chiro this coming Monday (here most of us on vacation), and get back to you=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Itaru.</div><div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May=
 7, 2022 at 1:34 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.o=
rg">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">On Fri, 6 May 2022 at 17:21, Peter Maydell &lt;<a href=3D"mailto:p=
eter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; Make the GICv3 set its number of bits of physical priority from the<br=
>
&gt; implementation-specific value provided in the CPU state struct, in<br>
&gt; the same way we already do for virtual priority bits.=C2=A0 Because th=
is<br>
&gt; would be a migration compatibility break, we provide a property<br>
&gt; force-8-bit-prio which is enabled for 7.0 and earlier versioned board<=
br>
&gt; models to retain the legacy &quot;always use 8 bits&quot; behaviour.<b=
r>
&gt;<br>
&gt; Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt; I have guessed at the right value for the A64FX, but if we can<br>
&gt; find the correct ICC_CTLR_EL1 value that would be better.<br>
<br>
Shuuichirou, Itaru: do either of you know the right setting for<br>
the A64FX for this? If you can find what the hardware value of<br>
the ICC_CTLR_EL3 or ICC_CTLR_EL1 register is (more specifically,<br>
the PRIBits subfield) that should be enough to tell us.<br>
<br>
&gt; @@ -961,6 +964,12 @@ static void aarch64_a64fx_initfn(Object *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;gic_num_lrs =3D 4;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;gic_vpribits =3D 5;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;gic_vprebits =3D 5;<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* TODO: What does the real A64FX GICv3 provide ?<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0* This is a guess based on what other Arm CPUs do=
; to find the correct<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* answer we need the value of the A64FX&#39;s ICC=
_CTLR_EL1 register.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;gic_pribits =3D 5;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Suppport of A64FX&#39;s vector length are 128,2=
56 and 512bit only */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 aarch64_add_sve_properties(obj);<br>
&gt; --<br>
&gt; 2.25.1<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--000000000000c94eff05de673656--

