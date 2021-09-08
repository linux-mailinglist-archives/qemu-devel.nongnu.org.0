Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90823403D75
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:17:38 +0200 (CEST)
Received: from localhost ([::1]:48754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO0GX-0003Lg-50
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mO0ER-0001w2-5g
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:15:28 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mO0EM-0000tb-Vs
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:15:26 -0400
Received: by mail-wr1-x433.google.com with SMTP id g16so4149118wrb.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 09:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MPGeft/XEGURbrh3KuR7T60ZfzBU74vEoJ4it6oxv/Y=;
 b=BN9btDZVzmKiwsaosI6gBHCWRSqT6X32Dsyxi5Q9bzIp7xP0Fql3OmhmKgxtRBZb0d
 fwqbpnladXwGykDbAvDEGOeruQTX7MGHEPAdTvYFPoNMaPwuFAEPTjGuvcUQuFa15imT
 yRooCC8WQVtkQz91Sz/HWmqbub14ny9z926ayyYK2FkaB6uyRh0h0B1aSBHxMqJ2AJOU
 gy5grq7fCOL/9GhP3flRMEgBlKQZqPnV2XjVAg4PBiTYMBuJvEKouqVuG1WoCzFaDh9D
 +QOe4xGc+0D+4+g/oFIKJU7q+ar1ww8Lvy+0I2B6G5J5xy6RtNKDhA4oddZkpjFxE3Nx
 K1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MPGeft/XEGURbrh3KuR7T60ZfzBU74vEoJ4it6oxv/Y=;
 b=GQGDBVtEpW7Z3V1YmlQUwdCIeavnkk8jLybdOPfL02VOe5XRAFsopN9AOjlzhIoV5f
 PyCuOfuFK/tQksYvYCY1o4AnnOywOejJ2BegVN2npdu718S3DrgNwMF/CZkDAnhpTGBh
 qfit1iY3QBB5wAkr/BRLgDfD3AJjk7yA7BKGG6u9hbII2mR9N2nonBnv63zq39szJtn/
 lRdgg/OqkCXSYtzzMldnk85cjJ7J4R4G6yTKC7TU8GKJEOMUBXJynx8px26OaYxejvQM
 NF/k0ISQds7Jdtv3PEuhvrlcz7qIdYyktdmaOXIpsLo56PpsALb8umqO5ZfoWg66LnRf
 Ylcw==
X-Gm-Message-State: AOAM531q2KPRDmuyhbn3/WAhBcFVDImQ+BAStiMJ72esYQzogLfWiIbj
 yd+ajqrxzbH3sZ9EJJeRBWBFfqQFpeg/LYCbuVQ=
X-Google-Smtp-Source: ABdhPJwFFntx905Tbq4hmSnWPCfwI0ZrZB9I3EbFQM02vatmzlWXroJHbocJLaNY68MYF/qhEIfT/uev80u84AQJ4hA=
X-Received: by 2002:adf:ff8e:: with SMTP id j14mr4860829wrr.239.1631117721149; 
 Wed, 08 Sep 2021 09:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
 <24888.55565.53378.616422@mariner.uk.xensource.com>
 <CAJ+F1CJF-0j0+kP=_Zwox9LsspFN+6kUG54uhdKx9KaHLx=H9A@mail.gmail.com>
 <24888.56575.675507.669862@mariner.uk.xensource.com>
In-Reply-To: <24888.56575.675507.669862@mariner.uk.xensource.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 8 Sep 2021 20:15:08 +0400
Message-ID: <CAJ+F1CJ4bhzXd0ASrtcGzn63i04HMWHDbgoAoWqizKnhRqiWjw@mail.gmail.com>
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
To: Ian Jackson <iwj@xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000005b272305cb7e30de"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x433.google.com
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

--0000000000005b272305cb7e30de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 8, 2021 at 7:55 PM Ian Jackson <iwj@xenproject.org> wrote:

> Marc-Andr=C3=A9 Lureau writes ("Re: [RFC v3 13/32] rust: use vendored-sou=
rces"):
> > Hmm, I do "cargo vendor --versioned-dirs ../rust/vendored" to vendor
> crates.
> >
> > It seems cc was updated, and I didn't update the submodule accordingly.
> For
> > reference, this is the dependency tree that WFM:
>
> git submodules are just awful IMO.
>

Yes, but it's often (always?) the user fault. CI should help, when it will
check Rust code.


> > $ cargo tree -p qga
> > qga v0.1.0 (/home/elmarco/src/qemu/qga)
> > =E2=94=9C=E2=94=80=E2=94=80 common v0.1.0 (/home/elmarco/src/qemu/rust/=
common)
> > =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 libc v0.2.101
> > =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 nix v0.20.1
> > =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 bitflags v1.2.1
> > =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 cfg-if v1.0.0
> > =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 libc v0.2.101
> > =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 memoffset v0.6.4
> > =E2=94=82           [build-dependencies]
> > =E2=94=82           =E2=94=94=E2=94=80=E2=94=80 autocfg v1.0.1
> > =E2=94=9C=E2=94=80=E2=94=80 hostname v0.3.1
> > =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 libc v0.2.101
> > =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 match_cfg v0.1.0
> > =E2=94=94=E2=94=80=E2=94=80 nix v0.20.1 (*)
>
> With the .config/cargo.toml "replace-with" commented out, I see this:
>
> rustcargo@zealot:~/Rustup/Qemu/qemu.pwt/build$ cargo tree -p qga
> qga v0.1.0 (/volatile/rustcargo/Rustup/Qemu/qemu.pwt/qga)
> =E2=94=9C=E2=94=80=E2=94=80 common v0.1.0 (/volatile/rustcargo/Rustup/Qem=
u/qemu.pwt/rust/common)
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 libc v0.2.101
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 nix v0.20.1
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 bitflags v1.2.1
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 cfg-if v1.0.0
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 libc v0.2.101
> =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 memoffset v0.6.4
> =E2=94=82           [build-dependencies]
> =E2=94=82           =E2=94=94=E2=94=80=E2=94=80 autocfg v1.0.1
> =E2=94=9C=E2=94=80=E2=94=80 hostname v0.3.1
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 libc v0.2.101
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 match_cfg v0.1.0
> =E2=94=94=E2=94=80=E2=94=80 nix v0.20.1 (*)
> rustcargo@zealot:~/Rustup/Qemu/qemu.pwt/build$
>
> Which is the same as yours.  Although "cargo build" doesn't work
> build, guessed from the messagese that perhaps this was the automatic
> codegen hadn't run.  I'm now trying "make" and and it seems to be
> running.
>
> With the "replace-with" uncommented, cargo tree bombs out.  I'm afraid
> I haven't used cargo vendor so I'm not sure if I am going in the right
> direction with this workaround.  Hopefully it will finish the build.
>
> Would it be possible to have a configure option to use unvendored
> upstream Rust libraries from crates.io ?
>

Not easily, but we could have a --disable-rust-offline configure option.
Whether this is desirable, I am not sure.


--=20
Marc-Andr=C3=A9 Lureau

--0000000000005b272305cb7e30de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 8, 2021 at 7:55 PM Ian =
Jackson &lt;<a href=3D"mailto:iwj@xenproject.org">iwj@xenproject.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Marc-An=
dr=C3=A9 Lureau writes (&quot;Re: [RFC v3 13/32] rust: use vendored-sources=
&quot;):<br>
&gt; Hmm, I do &quot;cargo vendor --versioned-dirs ../rust/vendored&quot; t=
o vendor crates.<br>
&gt; <br>
&gt; It seems cc was updated, and I didn&#39;t update the submodule accordi=
ngly. For<br>
&gt; reference, this is the dependency tree that WFM:<br>
<br>
git submodules are just awful IMO.<br></blockquote><div><br></div><div>Yes,=
 but it&#39;s often (always?) the user fault. CI should help, when it will =
check Rust code.<br></div><div> <br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
&gt; $ cargo tree -p qga =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; qga v0.1.0 (/home/elmarco/src/qemu/qga)<br>
&gt; =E2=94=9C=E2=94=80=E2=94=80 common v0.1.0 (/home/elmarco/src/qemu/rust=
/common)<br>
&gt; =E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 libc v0.2.101<br>
&gt; =E2=94=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 nix v0.20.1<br>
&gt; =E2=94=82 =C2=A0 =C2=A0 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 bitflags v1=
.2.1<br>
&gt; =E2=94=82 =C2=A0 =C2=A0 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 cfg-if v1.0=
.0<br>
&gt; =E2=94=82 =C2=A0 =C2=A0 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 libc v0.2.1=
01<br>
&gt; =E2=94=82 =C2=A0 =C2=A0 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 memoffset v=
0.6.4<br>
&gt; =E2=94=82 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [build-dependencies]<br>
&gt; =E2=94=82 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=94=94=E2=94=80=E2=94=
=80 autocfg v1.0.1<br>
&gt; =E2=94=9C=E2=94=80=E2=94=80 hostname v0.3.1<br>
&gt; =E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 libc v0.2.101<br>
&gt; =E2=94=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 match_cfg v0.1.0<br>
&gt; =E2=94=94=E2=94=80=E2=94=80 nix v0.20.1 (*)<br>
<br>
With the .config/cargo.toml &quot;replace-with&quot; commented out, I see t=
his:<br>
<br>
rustcargo@zealot:~/Rustup/Qemu/qemu.pwt/build$ cargo tree -p qga<br>
qga v0.1.0 (/volatile/rustcargo/Rustup/Qemu/qemu.pwt/qga)<br>
=E2=94=9C=E2=94=80=E2=94=80 common v0.1.0 (/volatile/rustcargo/Rustup/Qemu/=
qemu.pwt/rust/common)<br>
=E2=94=82=C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 libc v0.2.101<br>
=E2=94=82=C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=94=80 nix v0.20.1<br>
=E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 bitflags v1=
.2.1<br>
=E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 cfg-if v1.0=
.0<br>
=E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 libc v0.2.1=
01<br>
=E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=94=80 memoffset v=
0.6.4<br>
=E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[build-dependencies]<br>
=E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=94=
=80 autocfg v1.0.1<br>
=E2=94=9C=E2=94=80=E2=94=80 hostname v0.3.1<br>
=E2=94=82=C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 libc v0.2.101<br>
=E2=94=82=C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=94=80 match_cfg v0.1.0<br>
=E2=94=94=E2=94=80=E2=94=80 nix v0.20.1 (*)<br>
rustcargo@zealot:~/Rustup/Qemu/qemu.pwt/build$ <br>
<br>
Which is the same as yours.=C2=A0 Although &quot;cargo build&quot; doesn&#3=
9;t work<br>
build, guessed from the messagese that perhaps this was the automatic<br>
codegen hadn&#39;t run.=C2=A0 I&#39;m now trying &quot;make&quot; and and i=
t seems to be<br>
running.<br>
<br>
With the &quot;replace-with&quot; uncommented, cargo tree bombs out.=C2=A0 =
I&#39;m afraid<br>
I haven&#39;t used cargo vendor so I&#39;m not sure if I am going in the ri=
ght<br>
direction with this workaround.=C2=A0 Hopefully it will finish the build.<b=
r>
<br>
Would it be possible to have a configure option to use unvendored<br>
upstream Rust libraries from <a href=3D"http://crates.io" rel=3D"noreferrer=
" target=3D"_blank">crates.io</a> ?<br></blockquote><div><br></div><div>Not=
 easily, but we could have a --disable-rust-offline configure option. Wheth=
er this is desirable, I am not sure.<br></div></div><br clear=3D"all"><br>-=
- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br>=
</div></div>

--0000000000005b272305cb7e30de--

