Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444EE40F566
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 11:57:03 +0200 (CEST)
Received: from localhost ([::1]:40522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRAcA-0006qe-CE
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 05:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mRAZq-0005Hs-H7
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:54:38 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mRAZo-0000F6-I8
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:54:38 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 a194-20020a1c98cb000000b0030b41ac389fso1740516wme.2
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 02:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bLxx2IwOwRvPhr3v6Do21piRFPMqHmHiGLdYe501Q+w=;
 b=PGEYZVJ7yq9e8hVBj1Fh0OLjFQCwwfD+lP8YDzDpgg1l7fOBTT+PwSGK7EWIiDZ+jw
 oa42gIaCocUoZHJDp67PUtLCZJ3lK9M/jpfwDJ910CQ8bkQOXHxEjZ3ol9V7V3AYai4a
 1LDjUHvVflxdgaMySJKPdDoSDFwcxIVoGx/OetfMB1hYSYujO4+XoNb8ALxw3h1m01OW
 L2qN9sshMnG3s5uRuF4LWZIpcUPHqSWsL7PQZSz/+O0qnJTqA7KFSQaANl2WhSOElz7a
 zxI31qVeocTljKdcjcSt861qXCStSOIzXf5xAB/JYo33cNUkbK3FVf75x/JFBNjAvY1O
 x/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bLxx2IwOwRvPhr3v6Do21piRFPMqHmHiGLdYe501Q+w=;
 b=1foW2bTQkBgHRNTxQTFT+Hpkh6Cyp6XowbUtRFjNJzmvUymZs5nIB6YtPEs2OwwQWk
 xzunDAhauClxnka+Lgz79RhlqW4XU8sv7q/nLAZBjoWT+zEwViPoHEEcnRr7+hDN6n2Y
 mSrHeiaeORqPBe5/k26YD6qCwhx83zBBB5ByxFAjJxf8wvvBbxlbRDMCJcbdVHsNd7Os
 7Eio27wbQ/0NnhxCkAoBmnHRcD4hieM8oZoAK55kAcp/mu6X2z/d6WL+buu6VQvPk/XP
 LCAtfvX1jLl5sa5ND8BQGXPiu0QRWWYMpUPzNKn03JcP0HdsKVyQZ+aAd0N4bGJApSXN
 FsnQ==
X-Gm-Message-State: AOAM532zTgQ0Kx9Xk9H79X+Vaigvxygz51/UCcVaY8b1TLANumxJjvz5
 sHVPJh4MvRuyow8eMbK+T8jKAzVY13l5qCEcp2o=
X-Google-Smtp-Source: ABdhPJy2N+ZyEEOWsm6O79Z9xZ4DZiaLaUMlFCwCepAuNhTyM9xJBDSPFiKHB7xtgaX/fZwivX1YfdV5mMQZ/8KH1A4=
X-Received: by 2002:a1c:f206:: with SMTP id s6mr14067867wmc.15.1631872474103; 
 Fri, 17 Sep 2021 02:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <YURYvaOpya498Xx2@yekko> <87k0jfh88i.fsf@redhat.com>
In-Reply-To: <87k0jfh88i.fsf@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 17 Sep 2021 13:54:22 +0400
Message-ID: <CAJ+F1CJJvqVQrG5iPXV2s7oLbduHfAhHs0pHdZ8XbxLkNi42VQ@mail.gmail.com>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000023433305cc2deb03"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU <qemu-devel@nongnu.org>, hreitz@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000023433305cc2deb03
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Sep 17, 2021 at 1:19 PM Cornelia Huck <cohuck@redhat.com> wrote:

> On Fri, Sep 17 2021, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> > Hi all,
> >
> > At the qemu-in-rust BoF at KVM Forum, I volunteered to look into
> > whether Rust supported all the host/build platforms that qemu does,
> > which is obviously vital if we want to make Rust a non-optional
> > component of the build.
> >
> > I've added the information to our wiki at:
> >       https://wiki.qemu.org/RustInQemu
>
> Thank you for doing that!
>
>
Yes, the condensed coloured matrix is much more readable than the Rust long
list. I wonder if they would also adopt it :)


> >
> > TBH, the coverage is not as good as I expected.  Linux, macOS and
> > Windows are pretty much ok, with the exception of Linux on Sparc.
> > There are a lot of gaps in *BSD support, however.
>
> Yes :(
>

Can we say reasonably that QEMU is supported on *BSD other than x86 (and
aarch64?), I wonder. Maybe we should consider moving those under the
unsupported rank.


>
> Do we actually have an idea what we would require? I'm surprised that
> there are so many targets without host tools or without std support (but
> maybe they are only missing small things.)
>

For sparc 32, it was added to support Gentoo at that time which didn't
switch to 64-bit yet (https://github.com/rust-lang/rust/pull/48297)

For the past 2-3y, Gentoo sparc is now 64 bit. (like Debian apparently for
a while)

But apparently, by lack of CI it was downgraded to Tier-3.

Is it reasonable to officially drop support for sparc 32 in QEMU too?


> >
> > I've included some notes on where the information comes from, and some
> > uncertainties in there.
> >
> > I've made an effort to get the information correct, but double
> > checking would be appreciated.
>
> I did not spot any errors on a quick cross check, but I'm not really
> sure about what the BSDs support.
>
> >
> > I haven't yet looked into the packaging situation for the Rust
> > toolchain on various platforms and distros, but I still intend to do
> > so.
>
>
>
I would share our wiki page on r/rust if you don't mind, as there are
various people that can help us fill the gaps I think.

Thanks

--=20
Marc-Andr=C3=A9 Lureau

--00000000000023433305cc2deb03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 1:19 PM Cor=
nelia Huck &lt;<a href=3D"mailto:cohuck@redhat.com">cohuck@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri=
, Sep 17 2021, David Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.=
au" target=3D"_blank">david@gibson.dropbear.id.au</a>&gt; wrote:<br>
<br>
&gt; Hi all,<br>
&gt;<br>
&gt; At the qemu-in-rust BoF at KVM Forum, I volunteered to look into<br>
&gt; whether Rust supported all the host/build platforms that qemu does,<br=
>
&gt; which is obviously vital if we want to make Rust a non-optional<br>
&gt; component of the build.<br>
&gt;<br>
&gt; I&#39;ve added the information to our wiki at:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://wiki.qemu.org/RustInQemu"=
 rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/RustInQemu</a><=
br>
<br>
Thank you for doing that!<br>
<br></blockquote><div><br></div><div>Yes, the condensed coloured matrix is =
much more readable than the Rust long list. I wonder if they would also ado=
pt it :)<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt;<br>
&gt; TBH, the coverage is not as good as I expected.=C2=A0 Linux, macOS and=
<br>
&gt; Windows are pretty much ok, with the exception of Linux on Sparc.<br>
&gt; There are a lot of gaps in *BSD support, however.<br>
<br>
Yes :(<br></blockquote><div><br></div><div>Can we say reasonably that QEMU =
is supported on *BSD other than x86 (and aarch64?), I wonder. Maybe we shou=
ld consider moving those under the unsupported rank.<br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Do we actually have an idea what we would require? I&#39;m surprised that<b=
r>
there are so many targets without host tools or without std support (but<br=
>
maybe they are only missing small things.)<br></blockquote><div><br></div><=
div>For sparc 32, it was added to support Gentoo at that time which didn&#3=
9;t switch to 64-bit yet (<a href=3D"https://github.com/rust-lang/rust/pull=
/48297">https://github.com/rust-lang/rust/pull/48297</a>)</div><div><br></d=
iv><div>For the past 2-3y, Gentoo sparc is now 64 bit. (like Debian apparen=
tly for a while)<br></div><div><br></div><div>But apparently, by lack of CI=
 it was downgraded to Tier-3.</div><div><br></div><div>Is it reasonable to =
officially drop support for sparc 32 in QEMU too?<br></div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; I&#39;ve included some notes on where the information comes from, and =
some<br>
&gt; uncertainties in there.<br>
&gt;<br>
&gt; I&#39;ve made an effort to get the information correct, but double<br>
&gt; checking would be appreciated.<br>
<br>
I did not spot any errors on a quick cross check, but I&#39;m not really<br=
>
sure about what the BSDs support.<br>
<br>
&gt;<br>
&gt; I haven&#39;t yet looked into the packaging situation for the Rust<br>
&gt; toolchain on various platforms and distros, but I still intend to do<b=
r>
&gt; so.<br>
<br>
<br>
</blockquote></div><div><br></div><div>I would share our wiki page on r/rus=
t if you don&#39;t mind, as there are various people that can help us fill =
the gaps I think.</div><div><br></div><div>Thanks<br></div><br>-- <br><div =
dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div=
>

--00000000000023433305cc2deb03--

