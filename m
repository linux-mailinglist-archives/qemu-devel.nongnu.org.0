Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDC340A90A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 10:19:56 +0200 (CEST)
Received: from localhost ([::1]:58798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ3fX-000720-7u
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 04:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mQ3e1-0006JX-Sg
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:18:22 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mQ3dy-0003gu-GF
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:18:21 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso1342514wmb.2
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 01:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fIHKmDEO3e7eZVACbbjQ5/Wxf6pVOacq+4SVsm08e9o=;
 b=Ibs6NnmXl7EVKWE5THzVqq+Vs+kMWab2nmMILjmdP2nh7niU+NjIlQkdlqpn+SwLqn
 gN6mPZQMbGXP+8IBJwyq0apZQDXdDr/qXEZJAeyPo3N5F1Kheh0zJ50SFM7Q1xcrM9Ut
 4rq/fuht5ILnnjO+rPDwantilTvNfCEj3PtdLpCKOzVxNQebfuFBtAUFCu/0PK6iFk8w
 hbV73xOf6oB0ppLR5njMyz0Enea6f88agPY3/Eg9weJizAH37O7HdNAq1qV8O9lBPyXr
 e9uyK2NuXdLIoaFf43RMYQct+Kt7oYZpg4/MvV3SlxPk5pJXQYDMCEt2Cy3Kjrl1Tb68
 bMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fIHKmDEO3e7eZVACbbjQ5/Wxf6pVOacq+4SVsm08e9o=;
 b=klCtBdzCRd9MVIaJaduitOnL9mWg+BSdTfvbNAAukmmmL8N+nxLpRGg25LaC2vV0rl
 Zbm/1AW5o06cL4uv2Ll/TlBoZ5nsTc8UC1YHNt1vPrpSunNkjM+K2RwxzvLNYaxbnjTb
 iqbT817KyA9Yqt/tUNXrz4ywbllKDA17S7ERt6DDj5kLQX16W6VcczVR4eY7hf1FbInt
 X4OJDkZ5Guy1/GmItDBvserdhc4Co37WdOUE1tUSoyHrLzXfyBYE2y+wtCrUTIAmbWbk
 TPmcLgFSp2KBVJXfmPosCyRkn/FzAWFYezjvE6spvMPOc01DKdzsR2Xtbtwp4fv5shCf
 Q5og==
X-Gm-Message-State: AOAM531btaoxQWTmkNNosyi7DqHojXeo0JCSdwqRuhKUkuq5mq9ZXM47
 Io5rpdpkwKbtkpZ/7VciXVkIX9dW5JX5rRA7llc=
X-Google-Smtp-Source: ABdhPJzefGULsui2seNpa0zR8KSLBrVR03CysJUmfjLOffpcUF+yxU3AQ64cCA/UR5+WauhXACA3ROgAqW/9TPTs0xI=
X-Received: by 2002:a1c:7503:: with SMTP id o3mr715403wmc.129.1631607494761;
 Tue, 14 Sep 2021 01:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210913130950.214756-1-marcandre.lureau@redhat.com>
 <CAFEAcA97pX7qHLXkGL23_ygFk2hcJEw2J7CSKDJukdbxpvgKpg@mail.gmail.com>
In-Reply-To: <CAFEAcA97pX7qHLXkGL23_ygFk2hcJEw2J7CSKDJukdbxpvgKpg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 14 Sep 2021 12:18:03 +0400
Message-ID: <CAJ+F1C+QKX6b4d1p_6KksvKzHp6S2VSmOU5QXN68dOX8qrb3vg@mail.gmail.com>
Subject: Re: [PATCH v2] docs: add supported host CPU architectures section
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000235f9505cbf039f0"
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000235f9505cbf039f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Sep 13, 2021 at 6:28 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 13 Sept 2021 at 14:10, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > I was looking for such documentation, but couldn't find it. Add it to
> > the build-platform.rst document.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  docs/about/build-platforms.rst | 28 ++++++++++++++++++++++++++++
> >  meson.build                    |  2 +-
> >  2 files changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/docs/about/build-platforms.rst
> b/docs/about/build-platforms.rst
> > index 692323609e..518a19aff7 100644
> > --- a/docs/about/build-platforms.rst
> > +++ b/docs/about/build-platforms.rst
> > @@ -29,6 +29,34 @@ The `Repology`_ site is a useful resource to identif=
y
> >  currently shipped versions of software in various operating systems,
> >  though it does not cover all distros listed below.
> >
> > +Supported host architectures
> > +----------------------------
> > +
> > +Those hosts have a native TCG backend and are regularly tested:
> > +
> > +  .. list-table::
> > +   :header-rows: 1
> > +
> > +   * - CPU Architecture
> > +     - Accelerators
> > +   * - Arm
> > +     - kvm (64 bit only), xen
> > +   * - MIPS
> > +     - kvm
> > +   * - PPC
> > +     - kvm
> > +   * - RISC-V
> > +     -
> > +   * - s390x
> > +     - kvm
> > +   * - SPARC
> > +     -
> > +   * - x86
> > +     - kvm, xen, hax, hvf (64 bit only), nvmm, whpx (64 bit only)
>
> I still wonder if this would be clearer if we listed 'tcg' as
> an accelerator like all the others, rather than describing it as
> a kind of special case in the text above the table. After all, you
> can select it with '-accel tcg' the same as any other.
>

ok


> I think the information in the table is correct now.
>
> Sort the list of accelerators alphabetically ?
>

ok


> > +
> > +Other architectures are not actively maintained. They may be removed i=
n
> future
> > +releases.
> > +
> >  Linux OS, macOS, FreeBSD, NetBSD, OpenBSD
> >  -----------------------------------------
> >
> > diff --git a/meson.build b/meson.build
> > index 9a64d16943..27593c9b90 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -78,7 +78,7 @@ endif
> >
> >  accelerator_targets =3D { 'CONFIG_KVM': kvm_targets }
> >  if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
> > -  # i368 emulator provides xenpv machine type for multiple architectur=
es
> > +  # i386 emulator provides xenpv machine type for multiple architectur=
es
> >    accelerator_targets +=3D {
> >      'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
> >    }
>
> This change appears to be unrelated ?
>

minor typo found while looking at our related build script parts. Worth a
different patch?


--=20
Marc-Andr=C3=A9 Lureau

--000000000000235f9505cbf039f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 13, 2021 at 6:28 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Mon, 13 Sept 2021 at 14:10, &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; I was looking for such documentation, but couldn&#39;t find it. Add it=
 to<br>
&gt; the build-platform.rst document.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 docs/about/build-platforms.rst | 28 ++++++++++++++++++++++++++++=
<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 2 files changed, 29 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/docs/about/build-platforms.rst b/docs/about/build-platfor=
ms.rst<br>
&gt; index 692323609e..518a19aff7 100644<br>
&gt; --- a/docs/about/build-platforms.rst<br>
&gt; +++ b/docs/about/build-platforms.rst<br>
&gt; @@ -29,6 +29,34 @@ The `Repology`_ site is a useful resource to identi=
fy<br>
&gt;=C2=A0 currently shipped versions of software in various operating syst=
ems,<br>
&gt;=C2=A0 though it does not cover all distros listed below.<br>
&gt;<br>
&gt; +Supported host architectures<br>
&gt; +----------------------------<br>
&gt; +<br>
&gt; +Those hosts have a native TCG backend and are regularly tested:<br>
&gt; +<br>
&gt; +=C2=A0 .. list-table::<br>
&gt; +=C2=A0 =C2=A0:header-rows: 1<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0* - CPU Architecture<br>
&gt; +=C2=A0 =C2=A0 =C2=A0- Accelerators<br>
&gt; +=C2=A0 =C2=A0* - Arm<br>
&gt; +=C2=A0 =C2=A0 =C2=A0- kvm (64 bit only), xen<br>
&gt; +=C2=A0 =C2=A0* - MIPS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0- kvm<br>
&gt; +=C2=A0 =C2=A0* - PPC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0- kvm<br>
&gt; +=C2=A0 =C2=A0* - RISC-V<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-<br>
&gt; +=C2=A0 =C2=A0* - s390x<br>
&gt; +=C2=A0 =C2=A0 =C2=A0- kvm<br>
&gt; +=C2=A0 =C2=A0* - SPARC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-<br>
&gt; +=C2=A0 =C2=A0* - x86<br>
&gt; +=C2=A0 =C2=A0 =C2=A0- kvm, xen, hax, hvf (64 bit only), nvmm, whpx (6=
4 bit only)<br>
<br>
I still wonder if this would be clearer if we listed &#39;tcg&#39; as<br>
an accelerator like all the others, rather than describing it as<br>
a kind of special case in the text above the table. After all, you<br>
can select it with &#39;-accel tcg&#39; the same as any other.<br></blockqu=
ote><div><br></div><div>ok</div><div> <br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
I think the information in the table is correct now.<br>
<br>
Sort the list of accelerators alphabetically ?<br></blockquote><div><br></d=
iv><div>ok</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt; +<br>
&gt; +Other architectures are not actively maintained. They may be removed =
in future<br>
&gt; +releases.<br>
&gt; +<br>
&gt;=C2=A0 Linux OS, macOS, FreeBSD, NetBSD, OpenBSD<br>
&gt;=C2=A0 -----------------------------------------<br>
&gt;<br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index 9a64d16943..27593c9b90 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -78,7 +78,7 @@ endif<br>
&gt;<br>
&gt;=C2=A0 accelerator_targets =3D { &#39;CONFIG_KVM&#39;: kvm_targets }<br=
>
&gt;=C2=A0 if cpu in [&#39;x86&#39;, &#39;x86_64&#39;, &#39;arm&#39;, &#39;=
aarch64&#39;]<br>
&gt; -=C2=A0 # i368 emulator provides xenpv machine type for multiple archi=
tectures<br>
&gt; +=C2=A0 # i386 emulator provides xenpv machine type for multiple archi=
tectures<br>
&gt;=C2=A0 =C2=A0 accelerator_targets +=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;CONFIG_XEN&#39;: [&#39;i386-softmmu&#39;, &#3=
9;x86_64-softmmu&#39;],<br>
&gt;=C2=A0 =C2=A0 }<br>
<br>
This change appears to be unrelated ?<br></blockquote><div><br></div><div>m=
inor typo=C2=A0found while looking at our related build script parts. Worth=
 a different patch?<br></div></div><br clear=3D"all"><br>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000235f9505cbf039f0--

