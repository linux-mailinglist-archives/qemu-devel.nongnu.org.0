Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FB1403D88
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:22:17 +0200 (CEST)
Received: from localhost ([::1]:55644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO0L2-00085P-IM
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mO0JO-0006Um-Kc
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:20:36 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:43814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mO0JK-0004PT-Oo
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:20:33 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so1986877wms.2
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 09:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tOh78fbqM/FSQyTsnvvVZoAW5Ben4AGSoJdVpUJUncY=;
 b=iH6JgbMVhBvgNxxKl5+n2vEty9wD1x6VZq1aMQ7kbnviBhdcnkRK2kdKyZpY67gI7S
 qRG5BS2qge/hrxktJf8Sfqizzz4Q4jtPfOk/1a8HuBLA3lH4q91Wd0TYgy4xQ9ppCwWU
 SwG+h4A3BwHDYBL/aS2+fc/khM0W3prMExVQG0IPwImxp0PqHTH63PbzbqsAfuORUiXk
 aVU25y6EyIu2zxq3SYBjZuoOmVGBFkmPIV7V6LYwrAXI4aosC9jbFXWt70Zh9FXScGl6
 HDca1YgwU9+b5siPlruvZ9zsHCr1XdnmzOkNQch8lJ6t3y0/YXvlCphLeUZBXlkkYdPz
 MGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tOh78fbqM/FSQyTsnvvVZoAW5Ben4AGSoJdVpUJUncY=;
 b=3UGUVCl7ingcrSoMhZbHVN4SMcn/xY1myKs5X4zX6SMD8Tt53TD2yV4L+3Iwu989Xv
 KwePh0e6X32tzB1O7/myLROji5tbVgzHY96mmU0sP6+uNJnj9tMK3hvCZFfE1560XqBi
 +y7HGm/4MQa7ov2zG5nGkZ47u+vjJ4H5c4gt+4TPu9gEm7Bp384a7NgUuKdT2z/Fn0w1
 9B8T7mA/5Rhk6FHMG3m4anWeDsAQelFxroV/PRAdZUfAAPmYAlnLcxQ98AqwtQ4NwGCz
 4SeN0h58iba7wfdsl7X/lL7KMxUxLexvlpJzhlyLax1We2pBdjN0xOPAOzapB/fsOciD
 TQLw==
X-Gm-Message-State: AOAM533B5XyXa2TQjN5HbYxFRg3qli8Ptr6ifnw+QzZQPlRsmjbRZlIL
 Vn6e5+4qbwrTSOMEf8xSN6br2HR+MIyMfuoIBo8=
X-Google-Smtp-Source: ABdhPJw1HMX+zyqEOvN7LP0HGdGYxqqJWBsncFeaUigNaemeWVNZ+49+hJCJkPQ7XxyYIHMm06guDFpCzLGtXwYm4Gw=
X-Received: by 2002:a1c:7503:: with SMTP id o3mr4358515wmc.129.1631118028263; 
 Wed, 08 Sep 2021 09:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
 <24888.55565.53378.616422@mariner.uk.xensource.com>
In-Reply-To: <24888.55565.53378.616422@mariner.uk.xensource.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 8 Sep 2021 20:20:16 +0400
Message-ID: <CAJ+F1CJR9hAd+2MJZ1X9s2vBW=fG++mgk75M+Ww166orq3KdNg@mail.gmail.com>
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
To: Ian Jackson <iwj@xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000a9552c05cb7e429a"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

--000000000000a9552c05cb7e429a
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

You can start by reading `cargo doc -p common --open`. The generated code
needs some environment variables set, so `cargo doc -p qga` will fail
unless you set the environment variable

MESON_BUILD_ROOT=3D`pwd` cargo doc -p qga --open --document-private-items

works, but the QAPI types aren't documented, so this is a bit useless at
this point. I wonder if I could put the schema doc, hmm...


> I tried commenting out the `replace-with` in .cargo/config.toml
> but evidently the systme isn't intended to be used that way.
>
> Ian.
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a9552c05cb7e429a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 8, 2021 at 7:40 PM Ian =
Jackson &lt;<a href=3D"mailto:iwj@xenproject.org">iwj@xenproject.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a href=
=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@=
redhat.com</a> writes (&quot;[RFC v3 13/32] rust: use vendored-sources&quot=
;):<br>
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
those via the output from rustdoc.<br></blockquote><div><br></div><div>You =
can start by reading `cargo doc -p common --open`. The generated code needs=
 some environment variables set, so `cargo doc -p qga` will fail unless you=
 set the environment variable</div><div><br></div><div>MESON_BUILD_ROOT=3D`=
pwd` cargo doc -p qga --open --document-private-items</div><div><br></div><=
div>works, but the QAPI types aren&#39;t documented, so this is a bit usele=
ss at this point. I wonder if I could put the schema doc, hmm...<br></div><=
div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I tried commenting out the `replace-with` in .cargo/config.toml<br>
but evidently the systme isn&#39;t intended to be used that way.<br>
<br>
Ian.<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a9552c05cb7e429a--

