Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC68405AEF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 18:32:36 +0200 (CEST)
Received: from localhost ([::1]:58752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOMyZ-0000xd-NQ
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 12:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mOMwJ-0007tf-NR
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:30:15 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mOMwG-0001x0-Jn
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:30:15 -0400
Received: by mail-wr1-x435.google.com with SMTP id q11so3406421wrr.9
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 09:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mPRp4BqjF6aI2ggvx+XnvOZ/k6ufhj3AfUR4Vok6vp0=;
 b=l1dMytx2g8FOMHaVMEERuPpAske5o9rUgD7K3+p6N3HDEuKFbTHVWLpBoIgtivHf+6
 aYlIF/moZwqujwp/45Ztai/kJTxX4VRrl1kDwf/DmtLSMaxzmEjOXeEn2D1lWMd5pjas
 Tre4TYoT7329cqFrTOfw0R+6F5P5XNwNawwcwm84sEl5rv/bAVrryQ/A/ytWaCz8+KSz
 DPfI5OpVYC/joLNFMkY2DLEM9ze5f1ANv1YLmqtNYfjzG22HLizzueZ6BZWITYvcbYlC
 e7PZqDBbJg/5LR/B/wDnRBknkVn2IGGKG7gnge2FnSC3dTPiZUcX83EHRTuVCrjR+C3D
 l0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mPRp4BqjF6aI2ggvx+XnvOZ/k6ufhj3AfUR4Vok6vp0=;
 b=o7Qki8klFA5M2brQm8+1IlAqkWWuf6TShDGXVxoc+YmeMLmMbB8T8kjYG/NyebPpqx
 V91Ye3lXVupFobEjyZWMZI35l2wtUHlzDl4A4XBSQUXkV7bYEBuoFYA9rarDVRvSL7Rr
 2iOyiLTY2m/BIsXgf/8T5HDCDOl+FlFgKXqT5eCbjwcX7eyUIaBXRPYILqzuhOacSuwB
 AymV9gOUCJjDBvatyAxdd3/Pt+3GNWTfDDn6yA2LugA3hfralwhgoBk5sSoPXA9Oxqve
 9rVYmYaHXdpRkmt46oIy4moOObCttjMmxd6nzu5h5KjejLcEIXjaxqXsGtQDCKU/MShr
 aR9A==
X-Gm-Message-State: AOAM530UYv2I3cTXf9YSOeOz4zJf/jAgU+7hFQPvElPIhuwGW9M077bU
 fo/sb6LpWQd8A+5SOJW1kCTkcNNmOrE1OKH71po=
X-Google-Smtp-Source: ABdhPJxcEQcbJ4cQIuWzVHftLPeT5uDYMq6qjTxiiP/Jpm3zkiZhFEIdEaPC3XcnXqgnWsSuUmd3zPhZA4qMYrzu2dg=
X-Received: by 2002:a05:6000:1010:: with SMTP id
 a16mr4643989wrx.70.1631205010709; 
 Thu, 09 Sep 2021 09:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
 <CAFEAcA-=P+p7etUiLUzDxDzfe8N6TQyLC5=ExTSzgG4iOh0-dQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-=P+p7etUiLUzDxDzfe8N6TQyLC5=ExTSzgG4iOh0-dQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 9 Sep 2021 20:29:58 +0400
Message-ID: <CAJ+F1C+xL5_2c+7pSequokT-0yJ=pUT2V81iX_A_WLyVsWywEQ@mail.gmail.com>
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000381fc005cb9283ef"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Ian Jackson <iwj@xenproject.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000381fc005cb9283ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Sep 9, 2021 at 8:04 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 7 Sept 2021 at 13:32, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Most likely, QEMU will want tighter control over the sources, rather
> > than relying on crates.io downloading, use a git submodule with all the
> > dependencies. However, cargo --offline was added in 1.36.
> >
> > "cargo vendor" helps gathering and updating the dependencies.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  configure                 | 8 ++++++++
> >  meson.build               | 7 ++++++-
> >  .cargo/config.toml.in     | 5 +++++
> >  .cargo/meson.build        | 5 +++++
> >  .gitmodules               | 4 ++++
> >  rust/vendored             | 1 +
> >  scripts/archive-source.sh | 2 +-
> >  scripts/cargo_wrapper.py  | 1 +
> >  8 files changed, 31 insertions(+), 2 deletions(-)
> >  create mode 100644 .cargo/config.toml.in
> >  create mode 100644 .cargo/meson.build
> >  create mode 160000 rust/vendored
>
> So, this is a lot of extra code in a submodule. Historically we've
> found that submodules are a colossal pain, and so I think we should
> think about whether we really want to have all our rust dependencies
> in a submodule forever.
>
> I am definitely only at the beginner stage with Rust, but I think
> we should have a discussion about what the different alternative
> options are here, and what we want to achieve, so that we know
> why we're doing this and what we're gaining from the pain...
>
> For instance, could we instead commit Cargo.lock in git and
> use that to nail down specific versions of the dependencies ?
>
>
Yes, that's the main reason this file exists I think.

FWIW, the "why submodules" for the C dependencies we ship
> like that is basically
>  * C doesn't have a package manager, so if we need a dependency that
>    distros don't ship then we need to wrap it up and provide it ourselves
>

Have we considered meson wrap? I never really looked at it in detail, not
sure if that would work for us.
https://mesonbuild.com/Wrap-dependency-system-manual.html

 * where we ship binary blobs (guest BIOS etc) we want to also ship
>    the source code for those blobs
> I think for Rust dependencies those don't really apply.
>

And we mirror all those dependencies at the same location.


> Overall, I think that to the extent that we can look like a "normal"
> user of Rust, that's a good plan. Distros may well want to be able
> to do "build against our packaged rust stuff rather than downloading
> from crates.io" but I imagine they have machinery for that already;
> if we act like most other Rust programs we have better chances of
> not breaking that machinery.
>

True, at least on Fedora, there is machinery to package "regular" Rust
programs/crates in an automated way.  Vendoring dependencies should work
equally, but may not conform with distro policies, so they have extra work
eventually (it seems vendoring is more and more common though, with go
projects for example)


> We do already effectively do "download code when QEMU is built" --
> the makefile invokes scripts/git-submodule-update which pulls
> down submodule code. (Thanks to Ian for pointing out this framing
> of the question.)
>
> (I'm not personally a fan of the "download everything from crates.io"
> Rust ecosystem, but it is what it is, and wishing the Rust world
> worked more like a trad Linux-distro-provides-all-your-dependencies
> isn't, alas, going to make it so :-))
>
>
A nice alternative to vendoring that could work well for QEMU is to mirror
the Rust crate we use, so we have similar control and guarantee over them
as submodules, and use `[patch.crates-io]` to point at qemu-project
locations.


--=20
Marc-Andr=C3=A9 Lureau

--000000000000381fc005cb9283ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 9, 2021 at 8:04 PM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Tue, 7 Sept 2021 at 13:32, &lt;<a href=3D"mailto:marcandre.lureau=
@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Most likely, QEMU will want tighter control over the sources, rather<b=
r>
&gt; than relying on <a href=3D"http://crates.io" rel=3D"noreferrer" target=
=3D"_blank">crates.io</a> downloading, use a git submodule with all the<br>
&gt; dependencies. However, cargo --offline was added in 1.36.<br>
&gt;<br>
&gt; &quot;cargo vendor&quot; helps gathering and updating the dependencies=
.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 8 ++++++++<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 7 ++++++-<br>
&gt;=C2=A0 .cargo/<a href=3D"http://config.toml.in" rel=3D"noreferrer" targ=
et=3D"_blank">config.toml.in</a>=C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
&gt;=C2=A0 .cargo/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
&gt;=C2=A0 .gitmodules=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 4 ++++<br>
&gt;=C2=A0 rust/vendored=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
 +<br>
&gt;=C2=A0 scripts/archive-source.sh | 2 +-<br>
&gt;=C2=A0 scripts/cargo_wrapper.py=C2=A0 | 1 +<br>
&gt;=C2=A0 8 files changed, 31 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 .cargo/<a href=3D"http://config.toml.in" rel=
=3D"noreferrer" target=3D"_blank">config.toml.in</a><br>
&gt;=C2=A0 create mode 100644 .cargo/meson.build<br>
&gt;=C2=A0 create mode 160000 rust/vendored<br>
<br>
So, this is a lot of extra code in a submodule. Historically we&#39;ve<br>
found that submodules are a colossal pain, and so I think we should<br>
think about whether we really want to have all our rust dependencies<br>
in a submodule forever.<br>
<br>
I am definitely only at the beginner stage with Rust, but I think<br>
we should have a discussion about what the different alternative<br>
options are here, and what we want to achieve, so that we know<br>
why we&#39;re doing this and what we&#39;re gaining from the pain...<br>
<br>
For instance, could we instead commit Cargo.lock in git and<br>
use that to nail down specific versions of the dependencies ?<br>
<br></blockquote><div><br></div><div>Yes, that&#39;s the main reason this f=
ile exists I think.<br></div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
FWIW, the &quot;why submodules&quot; for the C dependencies we ship<br>
like that is basically<br>
=C2=A0* C doesn&#39;t have a package manager, so if we need a dependency th=
at<br>
=C2=A0 =C2=A0distros don&#39;t ship then we need to wrap it up and provide =
it ourselves<br></blockquote><div><br></div><div>Have we considered meson w=
rap? I never really looked at it in detail, not sure if that would work for=
 us. <a href=3D"https://mesonbuild.com/Wrap-dependency-system-manual.html">=
https://mesonbuild.com/Wrap-dependency-system-manual.html</a></div><div> <b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0* where we ship binary blobs (guest BIOS etc) we want to also ship<br=
>
=C2=A0 =C2=A0the source code for those blobs<br>
I think for Rust dependencies those don&#39;t really apply.<br></blockquote=
><div><br></div><div>And we mirror all those dependencies at the same locat=
ion.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
Overall, I think that to the extent that we can look like a &quot;normal&qu=
ot;<br>
user of Rust, that&#39;s a good plan. Distros may well want to be able<br>
to do &quot;build against our packaged rust stuff rather than downloading<b=
r>
from <a href=3D"http://crates.io" rel=3D"noreferrer" target=3D"_blank">crat=
es.io</a>&quot; but I imagine they have machinery for that already;<br>
if we act like most other Rust programs we have better chances of<br>
not breaking that machinery.<br></blockquote><div><br></div><div>True, at l=
east on Fedora, there is machinery to package &quot;regular&quot; Rust prog=
rams/crates in an automated way.=C2=A0 Vendoring dependencies should work e=
qually, but may not conform with distro policies, so they have extra work e=
ventually (it seems vendoring is more and more common though, with go proje=
cts for example)<br></div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
We do already effectively do &quot;download code when QEMU is built&quot; -=
-<br>
the makefile invokes scripts/git-submodule-update which pulls<br>
down submodule code. (Thanks to Ian for pointing out this framing<br>
of the question.)<br>
<br>
(I&#39;m not personally a fan of the &quot;download everything from <a href=
=3D"http://crates.io" rel=3D"noreferrer" target=3D"_blank">crates.io</a>&qu=
ot;<br>
Rust ecosystem, but it is what it is, and wishing the Rust world<br>
worked more like a trad Linux-distro-provides-all-your-dependencies<br>
isn&#39;t, alas, going to make it so :-))<br>
<br></blockquote><div><br></div><div>A nice alternative to vendoring that c=
ould work well for QEMU is to mirror the Rust crate we use, so we have simi=
lar control and guarantee over them as submodules, and use `[patch.crates-i=
o]` to point at qemu-project locations.<br></div><div>=C2=A0<br clear=3D"al=
l"></div></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-A=
ndr=C3=A9 Lureau<br></div></div>

--000000000000381fc005cb9283ef--

