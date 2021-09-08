Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060F4403D15
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:57:49 +0200 (CEST)
Received: from localhost ([::1]:53658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzxM-0001s6-3f
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mNznY-000347-Sq
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:47:41 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mNznW-0005IU-TC
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:47:40 -0400
Received: by mail-wm1-x334.google.com with SMTP id i3so2096899wmq.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 08:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XvXjT5rXAk+jNtwokEyIwLQd9y94o9vjnyCYZMs6Wmg=;
 b=Z1pSPw2bEfFbYAS34Pr0szlgrhs6DOUoiGwCRGUDTuDkJ8ojKbtFAltdBkMqjzz8MK
 XFAOeL/jXoYBRb1TMJWHqLXeMFI2kAGN+Iv8aHwP6HXYLs19AF3JpocZX84Dwst798jN
 RVni1SMBZvfMTHltuJ53zfAiObYyWkiAI7quIpIRUr3plTq9KQYVsoTA+vLefVJFds5d
 58SThcoGq9dlQgYg3HmMfh6jtrAujXLbW4Heqr/P4CvXBhVtoBgGNikHo+vaUtDk2IoO
 LE+NEyWE86/zzX4AxB7enk7a9wtC8azHs4ZWE6i5DOXS0TUiFvtDIrlBKi2WNBisT4Nx
 qohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XvXjT5rXAk+jNtwokEyIwLQd9y94o9vjnyCYZMs6Wmg=;
 b=An4eD1kaU4SCwhjNSACxdOK7dokcV/KLMY0i2jWgJYMGEmCv0gYD5Xk39qdMzBcCzL
 2Ea/szvUKum1QYxKq46+NwaWZXbaemdwfuRrFWGNy6Jt0uyw7Fh7NNBmVdM18JMgu6dE
 r0IKkQ9abFAhNKFewCCAMeoJNFq5QGlENGUmyTW9sLFM2fyksvMjmv167zmF9v3apb/d
 BEfrvYVslBJe1/S41mkTjvWtoCIx9uQjl3uinYWUaR18PlxtFdjamT6xJCjlGsRlK9av
 /KrtulsR7JTi0556zd7VV7B8uQmRsEy87KlH1ey3IRiaBurNIZQDut4EIfEv4Eds8355
 koow==
X-Gm-Message-State: AOAM530v4aRNam5OkWhLY9DBPghgplhAaStfp3joZ7FRyFbtHKl/qDnM
 G5rnIAWCp201sZLnW7464U9w5WiG3NtX8dFEStM=
X-Google-Smtp-Source: ABdhPJxemx4ikrTZpcfuvC8bSKOcQmVrhtTewRk0eufPKO+E9lY482ryHbRMJqmd5tNEDolHQIZ8Uoy9UaQpwZX1w7k=
X-Received: by 2002:a1c:f206:: with SMTP id s6mr4235055wmc.15.1631116057481;
 Wed, 08 Sep 2021 08:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
 <24888.55565.53378.616422@mariner.uk.xensource.com>
In-Reply-To: <24888.55565.53378.616422@mariner.uk.xensource.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 8 Sep 2021 19:47:25 +0400
Message-ID: <CAJ+F1CJF-0j0+kP=_Zwox9LsspFN+6kUG54uhdKx9KaHLx=H9A@mail.gmail.com>
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
To: Ian Jackson <iwj@xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000031966e05cb7dcde0"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x334.google.com
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
 "Daniel P. Berrange" <berrange@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000031966e05cb7dcde0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 8, 2021 at 7:40 PM Ian Jackson <iwj@xenproject.org> wrote:

> marcandre.lureau@redhat.com writes ("[RFC v3 13/32] rust: use
> vendored-sources"):
> > Most likely, QEMU will want tighter control over the sources, rather
> > than relying on crates.io downloading, use a git submodule with all the
> > dependencies. However, cargo --offline was added in 1.36.
>
> Hi.
>
> pm215 pointed me at this, as I have some background in Rust.
> I definitely approve of having Rust in Qemu.  I don't have an opinion
> about whether the sources should be vendored this way.
>
> But, I tried to build this, and
>
>     error: failed to select a version for the requirement `cc =3D "=3D1.0=
.70"`
>     candidate versions found which didn't match: 1.0.69
>     location searched: directory source
> `/volatile/rustcargo/Rustup/Qemu/qemu.pwt/rust/vendored` (which is
> replacing registry `crates-io`)
>     required by package `nix v0.20.1`
>         ... which is depended on by `qga v0.1.0
> (/volatile/rustcargo/Rustup/Qemu/qemu.pwt/qga)`
>     perhaps a crate was updated and forgotten to be re-vendored?
>     As a reminder, you're using offline mode (--offline) which can
> sometimes cause surprising resolution failures, if this error is too
> confusing you may wish to retry without the offline flag.
>
> I think the most important part here is to get the general APIs,
> presented to general Rust code in Qemu, right.  So I wanted to review
> those via the output from rustdoc.
>
> I tried commenting out the `replace-with` in .cargo/config.toml
> but evidently the systme isn't intended to be used that way.
>
> Ian.
>
>
Hmm, I do "cargo vendor --versioned-dirs ../rust/vendored" to vendor crates=
.

It seems cc was updated, and I didn't update the submodule accordingly. For
reference, this is the dependency tree that WFM:

$ cargo tree -p qga
qga v0.1.0 (/home/elmarco/src/qemu/qga)
=E2=94=9C=E2=94=80=E2=94=80 common v0.1.0 (/home/elmarco/src/qemu/rust/comm=
on)
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 libc v0.2.101
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 nix v0.20.1
=E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 bitflags v1.2.1
=E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 cfg-if v1.0.0
=E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 libc v0.2.101
=E2=94=82       =E2=94=94=E2=94=80=E2=94=80 memoffset v0.6.4
=E2=94=82           [build-dependencies]
=E2=94=82           =E2=94=94=E2=94=80=E2=94=80 autocfg v1.0.1
=E2=94=9C=E2=94=80=E2=94=80 hostname v0.3.1
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 libc v0.2.101
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 match_cfg v0.1.0
=E2=94=94=E2=94=80=E2=94=80 nix v0.20.1 (*)


--=20
Marc-Andr=C3=A9 Lureau

--00000000000031966e05cb7dcde0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 8, 2021 at 7:40 PM=
 Ian Jackson &lt;<a href=3D"mailto:iwj@xenproject.org">iwj@xenproject.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a=
 href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lu=
reau@redhat.com</a> writes (&quot;[RFC v3 13/32] rust: use vendored-sources=
&quot;):<br>
&gt; Most likely, QEMU will want tighter control over the sources, rather<b=
r>
&gt; than relying on <a href=3D"http://crates.io" rel=3D"noreferrer" target=
=3D"_blank">crates.io</a> downloading, use a git submodule with all the<br>
&gt; dependencies. However, cargo --offline was added in 1.36.<br>
<br>
Hi.<br>
<br>
pm215 pointed me at this, as I have some background in Rust.<br>
I definitely approve of having Rust in Qemu.=C2=A0 I don&#39;t have an opin=
ion<br>
about whether the sources should be vendored this way.<br>
<br>
But, I tried to build this, and<br>
<br>
=C2=A0 =C2=A0 error: failed to select a version for the requirement `cc =3D=
 &quot;=3D1.0.70&quot;`<br>
=C2=A0 =C2=A0 candidate versions found which didn&#39;t match: 1.0.69<br>
=C2=A0 =C2=A0 location searched: directory source `/volatile/rustcargo/Rust=
up/Qemu/qemu.pwt/rust/vendored` (which is replacing registry `crates-io`)<b=
r>
=C2=A0 =C2=A0 required by package `nix v0.20.1`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ... which is depended on by `qga v0.1.0 (/volat=
ile/rustcargo/Rustup/Qemu/qemu.pwt/qga)`<br>
=C2=A0 =C2=A0 perhaps a crate was updated and forgotten to be re-vendored?<=
br>
=C2=A0 =C2=A0 As a reminder, you&#39;re using offline mode (--offline) whic=
h can sometimes cause surprising resolution failures, if this error is too =
confusing you may wish to retry without the offline flag.<br>
<br>
I think the most important part here is to get the general APIs,<br>
presented to general Rust code in Qemu, right.=C2=A0 So I wanted to review<=
br>
those via the output from rustdoc.<br>
<br>
I tried commenting out the `replace-with` in .cargo/config.toml<br>
but evidently the systme isn&#39;t intended to be used that way.<br>
<br>
Ian.<br>
<br>
</blockquote></div><br clear=3D"all"></div><div>Hmm, I do &quot;cargo vendo=
r --versioned-dirs ../rust/vendored&quot; to vendor crates.</div><div><br><=
/div><div>It seems cc was updated, and I didn&#39;t update the submodule ac=
cordingly. For reference, this is the dependency tree that WFM:<br></div><d=
iv><br></div><div>$ cargo tree -p qga =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>qga v0.1=
.0 (/home/elmarco/src/qemu/qga)<br>=E2=94=9C=E2=94=80=E2=94=80 common v0.1.=
0 (/home/elmarco/src/qemu/rust/common)<br>=E2=94=82 =C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 libc v0.2.101<br>=E2=94=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 =
nix v0.20.1<br>=E2=94=82 =C2=A0 =C2=A0 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 b=
itflags v1.2.1<br>=E2=94=82 =C2=A0 =C2=A0 =C2=A0 =E2=94=9C=E2=94=80=E2=94=
=80 cfg-if v1.0.0<br>=E2=94=82 =C2=A0 =C2=A0 =C2=A0 =E2=94=9C=E2=94=80=E2=
=94=80 libc v0.2.101<br>=E2=94=82 =C2=A0 =C2=A0 =C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 memoffset v0.6.4<br>=E2=94=82 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
[build-dependencies]<br>=E2=94=82 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=94=
=94=E2=94=80=E2=94=80 autocfg v1.0.1<br>=E2=94=9C=E2=94=80=E2=94=80 hostnam=
e v0.3.1<br>=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 libc v0.2.101<br>=
=E2=94=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 match_cfg v0.1.0<br>=E2=94=94=
=E2=94=80=E2=94=80 nix v0.20.1 (*)<br></div><div><br></div><div><br></div><=
div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lurea=
u<br></div></div></div>

--00000000000031966e05cb7dcde0--

