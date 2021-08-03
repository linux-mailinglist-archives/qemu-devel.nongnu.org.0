Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E646F3DED32
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 13:53:22 +0200 (CEST)
Received: from localhost ([::1]:60332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAsz3-0007ks-Up
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 07:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mAsyH-00074a-2B
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:52:33 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mAsyE-0005no-9q
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:52:32 -0400
Received: by mail-ej1-x62e.google.com with SMTP id gs8so35886015ejc.13
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 04:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qaUuahge3S+cFwumrefRhg7GhpndEy8n3NLDVOMdSwU=;
 b=ABsrDrCQ2Kh8lZuF4oGK9AeoIM5upNqPDs0BERzJrucLVdU4THXmtVPF5fd1wZ1Sk0
 hKVfm9W+yFrLYMgZ2VR92aYDAxL/o08pIJqX0RCXLGjsUNjlxojvAMdywOTQ9rlgqoii
 SQAv6//14+7YetGcl7DIZ96HMANuxgToOgQROH7RJ5J2IGXAAqwkQX2ZKX6rAd8zM7ya
 XBRQMKdMoI77da973ZuGxs0qnoMoImsRx5EyaV0S7imOuIiTE9UfMkjkyk0T/L/+Tr9D
 aO+i7S9QLFxMgCBxEEHfU5M0a/Ng+HMW+oJk1cBw0uHDs30D4FTRrRka0bryWvfXpGPS
 MyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qaUuahge3S+cFwumrefRhg7GhpndEy8n3NLDVOMdSwU=;
 b=dhiXwHmW1TgfywidPJ0zHOJ+yBGWImhZTFod10cNM2Z0RO6ysl5CJV9nvbK3KYu+QX
 ejX0YzAOMFo52gDmycTwrwZ57Ypci3Af0DEiGHzjN8zvTGNM8OrJJ1CBMoB59ulHB7ZH
 7zICUTxKC8wZYkiZWkEKnIcDwVT926mLop8CX2P/lFytaKtltu76N2H3MHc8cI/Hb94a
 cMYeyFElAMj5fWGprrCetfyumju6Xo7C9DN00ldJTvKr/OHwtuQyihVYzCMSqolG6h0e
 jnpzlzOjR9GK3hjQBgLaPR8LDpq9otIjt6t3qA3xZe0rUNmV8JO64ghUWLYWAp+JU4hC
 +OJA==
X-Gm-Message-State: AOAM532/Ff5ng+tiBWpAFIZxSrsUPcXFiq46x9GNQ1cS4ON/f36FDUEC
 9PxU+tvSzcXf8/c33pYdhpQ+OSzdhCH53ToGIGM=
X-Google-Smtp-Source: ABdhPJxIz5L5JWNb++ATlvHr6WihUImnQ7k7At+00+5eaUO82bROsgQEBFaTNUFen15qa9I1BQGMR0af1j8P14LC06Q=
X-Received: by 2002:a17:906:838e:: with SMTP id
 p14mr16091136ejx.527.1627991548687; 
 Tue, 03 Aug 2021 04:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210728105133.2557239-1-marcandre.lureau@redhat.com>
 <CAFEAcA_L==a3+sp3smMCD1SBPkXQFavvJRzeK7Bd05Tf_DEZzw@mail.gmail.com>
 <CAJ+F1CKkx3JbL3Xw3CAzF7B7r6Nj=Cyn32tZcVZeY9V=uSq7sQ@mail.gmail.com>
 <CAFEAcA8R0yKvM40HmoTOmr_YEvq0kFOPFOzWwHN=4oFc-vLL=Q@mail.gmail.com>
 <CAJ+F1CK3OV8fHL2XGCxTPv8AotDHUzrcoe9JoE=5gKLnskw6Eg@mail.gmail.com>
 <CAFEAcA9jagAAWuJRxYJ6OQg72n4uoV1PT3dgSxNOYJFpW5xi+g@mail.gmail.com>
 <CAJ+F1CJ79-ZrE2J8XZaoBt3LzprB0Z4YJb7cU_hvQf8qd84L1g@mail.gmail.com>
 <CAFEAcA8saN260spE0BPD_++2zasVrsyYzaP_YBMfcPRzv+nxSg@mail.gmail.com>
 <CAFEAcA9nqTfo6+BrfDqm8w6ELhg21BpDwbvimeLH=eC2dt7aBw@mail.gmail.com>
In-Reply-To: <CAFEAcA9nqTfo6+BrfDqm8w6ELhg21BpDwbvimeLH=eC2dt7aBw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 3 Aug 2021 15:52:16 +0400
Message-ID: <CAJ+F1CLR8Ge4PLdpvitvVUrQ5Ea_HVaVFojr=H6UFs=3z2pN=w@mail.gmail.com>
Subject: Re: [PULL 0/1] Libslirp update
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f4fd1105c8a651d2"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f4fd1105c8a651d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 3, 2021 at 1:50 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 3 Aug 2021 at 10:08, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> > Are you testing by starting with a before-the-libslirp-merge
> > change QEMU, doing a build, then updating to the libslirp
> > changes, and then doing a 'make' without reconfigure or
> > 'make clean' ? I suspect this is perhaps to do with it being
> > an incremental build.
>
> More specifically:
>
> $ git checkout master
> $ mkdir build/slirptest
> $ (cd build/slirptest && ../../configure --target-list=3Darm-softmmu
> --enable-debug --disable-docs --disable-tools)
> $ make -C build/slirptest -j8
> $ git checkout remotes/elmarco/libslirp
> $ make -C build/slirptest
> $ mkdir build/slirp2
> $ (cd build/slirptest && ../../configure --target-list=3Darm-softmmu
> --enable-debug --disable-docs --disable-tools)
> $ make -C build/slirp2
>
> The build/slirptest directory has built a .so, and the
> build/slirp2 directory has built a static .a.
>
> (Both builds succeed because they're not hitting the clang
> static analyzer thing, but they shouldn't be building different
> types of library.)
>
> Running '../../meson/meson.py configure' in slirp2 gives
> (ignoring the non libslirp parts of the output):
>
> Subproject libslirp:
>
>   Core options                  Current Value
> Possible Values
> Description
>   ------------                  -------------
> ---------------
> -----------
>   libslirp:default_library      static
> [shared, static, both]                                        Default
> library type
>   libslirp:werror               true                           [true,
> false]                                                 Treat warnings
> as errors
>
>   Project options               Current Value
> Possible Values
> Description
>   ---------------               -------------
> ---------------
> -----------
>   libslirp:version_suffix
>                                                       Suffix to append
> to SLIRP_VERSION_STRING
>
> In slirptest I get only:
>
> Subproject libslirp:
>
>   Project options               Current Value
> Possible Values
> Description
>   ---------------               -------------
> ---------------
> -----------
>   libslirp:version_suffix
>                                                       Suffix to append
> to SLIRP_VERSION_STRING
>
>
> So somehow meson has failed to apply the default_library and werror
> options in
> the incremental build case.
>
>
Thanks for the detailed steps. It turns out that incremental build with
subprojects is broken with meson < 0.57.2 (
https://github.com/mesonbuild/meson/pull/8424).

Either we acknowledge that, or we fix the qemu meson.build for now with the
missing -lresolv for osx/bsd.

I am going to work on a patch for the second option, but leave the decision
open.





--=20
Marc-Andr=C3=A9 Lureau

--000000000000f4fd1105c8a651d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 1:50 PM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Tue, 3 Aug 2021 at 10:08, Peter Maydell &lt;<a href=3D"mailto:pet=
er.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; w=
rote:<br>
&gt; Are you testing by starting with a before-the-libslirp-merge<br>
&gt; change QEMU, doing a build, then updating to the libslirp<br>
&gt; changes, and then doing a &#39;make&#39; without reconfigure or<br>
&gt; &#39;make clean&#39; ? I suspect this is perhaps to do with it being<b=
r>
&gt; an incremental build.<br>
<br>
More specifically:<br>
<br>
$ git checkout master<br>
$ mkdir build/slirptest<br>
$ (cd build/slirptest &amp;&amp; ../../configure --target-list=3Darm-softmm=
u<br>
--enable-debug --disable-docs --disable-tools)<br>
$ make -C build/slirptest -j8<br>
$ git checkout remotes/elmarco/libslirp<br>
$ make -C build/slirptest<br>
$ mkdir build/slirp2<br>
$ (cd build/slirptest &amp;&amp; ../../configure --target-list=3Darm-softmm=
u<br>
--enable-debug --disable-docs --disable-tools)<br>
$ make -C build/slirp2<br>
<br>
The build/slirptest directory has built a .so, and the<br>
build/slirp2 directory has built a static .a.<br>
<br>
(Both builds succeed because they&#39;re not hitting the clang<br>
static analyzer thing, but they shouldn&#39;t be building different<br>
types of library.)<br>
<br>
Running &#39;../../meson/meson.py configure&#39; in slirp2 gives<br>
(ignoring the non libslirp parts of the output):<br>
<br>
Subproject libslirp:<br>
<br>
=C2=A0 Core options=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Current Value<br>
Possible Values<br>
Description<br>
=C2=A0 ------------=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -------------<br>
---------------<br>
-----------<br>
=C2=A0 libslirp:default_library=C2=A0 =C2=A0 =C2=A0 static<br>
[shared, static, both]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Default<br>
library type<br>
=C2=A0 libslirp:werror=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0true=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[true,<br>
false]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Treat warnings<br>
as errors<br>
<br>
=C2=A0 Project options=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Current Value<br>
Possible Values<br>
Description<br>
=C2=A0 ---------------=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-------------<br>
---------------<br>
-----------<br>
=C2=A0 libslirp:version_suffix<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Suffix to append<br>
to SLIRP_VERSION_STRING<br>
<br>
In slirptest I get only:<br>
<br>
Subproject libslirp:<br>
<br>
=C2=A0 Project options=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Current Value<br>
Possible Values<br>
Description<br>
=C2=A0 ---------------=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-------------<br>
---------------<br>
-----------<br>
=C2=A0 libslirp:version_suffix<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Suffix to append<br>
to SLIRP_VERSION_STRING<br>
<br>
<br>
So somehow meson has failed to apply the default_library and werror options=
 in<br>
the incremental build case.<br clear=3D"all"><br></blockquote><div><br></di=
v><div>Thanks for the detailed steps. It turns out that incremental build w=
ith subprojects is broken with meson &lt; 0.57.2 (<a href=3D"https://github=
.com/mesonbuild/meson/pull/8424">https://github.com/mesonbuild/meson/pull/8=
424</a>).</div><div><br></div><div>Either we acknowledge that, or we fix th=
e qemu meson.build for now with the missing -lresolv for osx/bsd.</div><div=
><br></div><div>I am going to work on a patch for the second option, but le=
ave the decision open.<br></div><div><br></div><div><br></div><div><br></di=
v><div> <br></div></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signatur=
e">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f4fd1105c8a651d2--

