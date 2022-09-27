Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE985EC00D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:46:00 +0200 (CEST)
Received: from localhost ([::1]:37864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od86B-0004cO-13
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1od7lY-0000uC-Ur
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:24:43 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:42503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1od7lW-0004Pa-92
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:24:40 -0400
Received: by mail-io1-xd30.google.com with SMTP id 138so7349567iou.9
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Dbuy6kfppEl+4wlDUlSDF7Vi7Q79jUOZozN+LyPoPfQ=;
 b=Vnf49cQfGYbefPYpFnE2RJvKpbl5qISYIGxLF2Z7sX9IzswEfWU2/wcVBD9NjEIXKc
 MLp6JcoZs0E0hR6Upa/k696hOURHUC40BuaAQX67gPzS5lePz2YkLb+Oaj7Y2AYT4Nc5
 1hhajK21JHG8lzCUkIiezCvukg+ouJFoKO/Dzs3ih3l9Gf8qlCjPN9jkHIHNAza7UUws
 jEHcrZXG/TWwvZGN4mrpNeNV5AZ/XQpbkoL+zOhgkoc6hsMGwo2G8jd9Xkapbh1aYduq
 llxEGcYhLuYhrKUp7LKlyhtS0YqRQou9QHxZW/TdCNm7VLryEFznblb3PUGXXhZvRxlE
 fToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Dbuy6kfppEl+4wlDUlSDF7Vi7Q79jUOZozN+LyPoPfQ=;
 b=5LcCagqPLldc1XHUbPgXKNsovKqCdTgN9mAQi6wJl7K6g95mmq4iolfOQDyRdXwDVy
 IYdSISJKzbFVqvbl3BVzh1zIYi/5Vt6D5OKWyG5LpRAu8CN3rcQjSpIdlAho/KecT9LN
 wy8oD99DxQZNYiNOj4JrlIRCtolxZ4m0RZVyjTyXQHi7MBvk3f1e2y4C+UrHu2pRdLa+
 DieFB+6RKiN06QqA8LxZaVxqOPQ886bkkF3EkGy0JdCbzc59Ue3l/ByP236Q7kIqZnc7
 uLRNpp2r8keEpfFxbTp4GVVQGZhTWCBLODvliz2WbdmJLJ8tSKq7tzAojpZr5AHIpiqT
 14Bg==
X-Gm-Message-State: ACrzQf0UtZoBSR0WMfhh7SehoNPSG4KPZyPb1PvU+WdzyfGdxGqqjI3x
 ZX7UtZ8bejKKiUdHO9/HTdCFihSxtaoEO58TLdjNLw==
X-Google-Smtp-Source: AMsMyM5RRyyccm4NaKaNkzjxcJ9ssZ/asTsSxupg/xW+nkuED9pWPbRoFigDMTD0LUjcq+arH95JPvBpWsQwMrrWbWs=
X-Received: by 2002:a05:6638:2491:b0:35a:53dd:f98e with SMTP id
 x17-20020a056638249100b0035a53ddf98emr13969958jat.261.1664274276703; Tue, 27
 Sep 2022 03:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220715015941-mutt-send-email-mst@kernel.org>
 <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
 <20220716112943-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
 <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
 <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com>
 <CAARzgwxpm-tF3OwK95gHe+9_6qBebiqPFLug-59RUt85aCnuZQ@mail.gmail.com>
 <YzLN3Y1pNO8SVn9M@redhat.com>
In-Reply-To: <YzLN3Y1pNO8SVn9M@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 27 Sep 2022 15:54:25 +0530
Message-ID: <CAARzgwzWo6D1HeqP7NSOGTduQU+K=dgzwKN6JGA3WVYEmpnBLg@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, imammedo@redhat.com,
 jsnow@redhat.com, 
 pbonzini@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org, 
 thuth@redhat.com
Content-Type: multipart/alternative; boundary="0000000000001278a505e9a60d98"
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--0000000000001278a505e9a60d98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2022 at 15:48 Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Tue, Sep 27, 2022 at 03:37:39PM +0530, Ani Sinha wrote:
> > > > > > > >
> > > > > > > > OK fine. Lets figuire out how to push bits somewhere in
> git.qemu.org and
> > > > > > > > the binaries in some other repo first. Everything else
> hinges on that. We
> > > > > > > > can fix the rest of the bits later incrementally.
> > > > > > >
> > > > > > > DanPB, any thoughts on putting bits on git.qemu.org or where
> and how to
> > > > > > > keep the binaries?
> > > > > >
> > > > > > Can we please conclude on this?
> > > > > > Peter, can you please fork the repo? I have tried many times to
> reach
> > > > > > you on IRC but failed.
> > > > >
> > > > > Probably because of travel around KVM forum.
> > > > >
> > > > > I think given our CI is under pressure again due to gitlab free
> tier
> > > > > limits, tying binaries to CI isn't a great idea at this stage.
> > > > > Can Ani just upload binaies to qemu.org for now?
> > > >
> > > > I agree with Michael here. Having a full ci/cd job for this is
> > > > overkill IMHO. We should create a repo just for the binaries, have =
a
> > > > README there to explain how we generate them and check in new
> versions
> > > > as and when needed (it won't be frequent).
> > > > How about biosbits-bin repo?
> > >
> > > If QEMU is hosting binaries, where any part contains GPL code, then w=
e
> > > need to be providing the full and corresponding source and the build
> > > scripts needed to re-create the binary. Once we have such scripts it
> > > should be trivial to trigger that from a CI job. If it isn't then
> > > we're doing something wrong.
> >
> > I was thinking of commiting the build scripts in a branch of
> > https://gitlab.com/qemu-project/biosbits-bits.
> > This would separate them from the main source. The scripts would build
> > a version of qemu-bits based on the version information passed to it
> > from the environment.
> > Before I committed the scripts, I wanted to check whether we would
> > want to do that or have a separate repo containing the binaries and
> > the build scripts.
> > Seems we want the former.
> >
> > As for the gitlab-ci, I looked at the yaml file and the qemu ones
> > looks quite complicated. Can someone help me generate one based on the
> > build script here?
> >
> https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.=
sh
>
> Yes, QEMU's rules aren't a good place to start if you're trying
> to learn gitlab CI, as they're very advanced.
>
> The simple case though is quite simple.
>
>   * You need a container image to act as the build env
>   * In 'before_script'  install any packages you need on top of the
>     base container image for build deps
>   * In 'script'  run whatever shell commands you need in order
>     to build the project
>   * Add an 'artifacts' section to publish one (or more) files/dirs
>     as output
>
> The simplest example would be something like
>
>    mybuild:
>      image: fedora:36
>      before_script:
>        - dnf install -y gcc
>      script:
>        - gcc -o myapp myapp.c
>      artifacts
>        paths:
>          - myapp
>
>
> So essentially use 'docker run yourimage:tag' locally to bring
> up the build env, and interactively work out what packags yuo
> need to install, and what scripts to invoke to build it. When
> you have it figured out, just copy those commands into the
> before_script/script sections in .gitlab-ci.yml


I already have a Dockerfile and a build script rahe uses it to generate the
binaries

https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile


>
>
> Note, the .gitlab-ci.yml file would be in the git repo of the
> project you're building typically, which would be the main
> 'biosbits' project i presume.
>
> There's a fairly decent reference of syntax here:
>
>   https://docs.gitlab.com/ee/ci/yaml/
>
> And broader set of docs
>
>  https://docs.gitlab.com/ee/ci/
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--0000000000001278a505e9a60d98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Sep 27, 2022 at 15:48 Daniel P. Berrang=C3=A9 &lt;<=
a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On Tue, Sep 27, 2022 at 03:37:39PM +0=
530, Ani Sinha wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; OK fine. Lets figuire out how to push bi=
ts somewhere in <a href=3D"http://git.qemu.org" rel=3D"noreferrer" target=
=3D"_blank">git.qemu.org</a> and<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; the binaries in some other repo first. E=
verything else hinges on that. We<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; can fix the rest of the bits later incre=
mentally.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; DanPB, any thoughts on putting bits on <a hre=
f=3D"http://git.qemu.org" rel=3D"noreferrer" target=3D"_blank">git.qemu.org=
</a> or where and how to<br>
&gt; &gt; &gt; &gt; &gt; &gt; keep the binaries?<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Can we please conclude on this?<br>
&gt; &gt; &gt; &gt; &gt; Peter, can you please fork the repo? I have tried =
many times to reach<br>
&gt; &gt; &gt; &gt; &gt; you on IRC but failed.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Probably because of travel around KVM forum.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I think given our CI is under pressure again due to git=
lab free tier<br>
&gt; &gt; &gt; &gt; limits, tying binaries to CI isn&#39;t a great idea at =
this stage.<br>
&gt; &gt; &gt; &gt; Can Ani just upload binaies to <a href=3D"http://qemu.o=
rg" rel=3D"noreferrer" target=3D"_blank">qemu.org</a> for now?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I agree with Michael here. Having a full ci/cd job for this =
is<br>
&gt; &gt; &gt; overkill IMHO. We should create a repo just for the binaries=
, have a<br>
&gt; &gt; &gt; README there to explain how we generate them and check in ne=
w versions<br>
&gt; &gt; &gt; as and when needed (it won&#39;t be frequent).<br>
&gt; &gt; &gt; How about biosbits-bin repo?<br>
&gt; &gt;<br>
&gt; &gt; If QEMU is hosting binaries, where any part contains GPL code, th=
en we<br>
&gt; &gt; need to be providing the full and corresponding source and the bu=
ild<br>
&gt; &gt; scripts needed to re-create the binary. Once we have such scripts=
 it<br>
&gt; &gt; should be trivial to trigger that from a CI job. If it isn&#39;t =
then<br>
&gt; &gt; we&#39;re doing something wrong.<br>
&gt; <br>
&gt; I was thinking of commiting the build scripts in a branch of<br>
&gt; <a href=3D"https://gitlab.com/qemu-project/biosbits-bits" rel=3D"noref=
errer" target=3D"_blank">https://gitlab.com/qemu-project/biosbits-bits</a>.=
<br>
&gt; This would separate them from the main source. The scripts would build=
<br>
&gt; a version of qemu-bits based on the version information passed to it<b=
r>
&gt; from the environment.<br>
&gt; Before I committed the scripts, I wanted to check whether we would<br>
&gt; want to do that or have a separate repo containing the binaries and<br=
>
&gt; the build scripts.<br>
&gt; Seems we want the former.<br>
&gt; <br>
&gt; As for the gitlab-ci, I looked at the yaml file and the qemu ones<br>
&gt; looks quite complicated. Can someone help me generate one based on the=
<br>
&gt; build script here?<br>
&gt; <a href=3D"https://github.com/ani-sinha/bits/blob/bits-qemu-logging/bu=
ild-artifacts.sh" rel=3D"noreferrer" target=3D"_blank">https://github.com/a=
ni-sinha/bits/blob/bits-qemu-logging/build-artifacts.sh</a><br>
<br>
Yes, QEMU&#39;s rules aren&#39;t a good place to start if you&#39;re trying=
<br>
to learn gitlab CI, as they&#39;re very advanced.<br>
<br>
The simple case though is quite simple.<br>
<br>
=C2=A0 * You need a container image to act as the build env<br>
=C2=A0 * In &#39;before_script&#39;=C2=A0 install any packages you need on =
top of the<br>
=C2=A0 =C2=A0 base container image for build deps<br>
=C2=A0 * In &#39;script&#39;=C2=A0 run whatever shell commands you need in =
order<br>
=C2=A0 =C2=A0 to build the project<br>
=C2=A0 * Add an &#39;artifacts&#39; section to publish one (or more) files/=
dirs<br>
=C2=A0 =C2=A0 as output<br>
<br>
The simplest example would be something like<br>
<br>
=C2=A0 =C2=A0mybuild:<br>
=C2=A0 =C2=A0 =C2=A0image: fedora:36<br>
=C2=A0 =C2=A0 =C2=A0before_script:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- dnf install -y gcc<br>
=C2=A0 =C2=A0 =C2=A0script:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- gcc -o myapp myapp.c<br>
=C2=A0 =C2=A0 =C2=A0artifacts<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0paths:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- myapp<br>
<br>
<br>
So essentially use &#39;docker run yourimage:tag&#39; locally to bring<br>
up the build env, and interactively work out what packags yuo<br>
need to install, and what scripts to invoke to build it. When<br>
you have it figured out, just copy those commands into the<br>
before_script/script sections in .gitlab-ci.yml</blockquote><div dir=3D"aut=
o"><br></div><div dir=3D"auto">I already have a Dockerfile and a build scri=
pt rahe uses it to generate the binaries=C2=A0</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><div><a href=3D"https://github.com/ani-sinha/bits/bl=
ob/bits-qemu-logging/Dockerfile">https://github.com/ani-sinha/bits/blob/bit=
s-qemu-logging/Dockerfile</a></div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
 dir=3D"auto"><br>
<br>
<br>
Note, the .gitlab-ci.yml file would be in the git repo of the<br>
project you&#39;re building typically, which would be the main<br>
&#39;biosbits&#39; project i presume. <br>
<br>
There&#39;s a fairly decent reference of syntax here:<br>
<br>
=C2=A0 <a href=3D"https://docs.gitlab.com/ee/ci/yaml/" rel=3D"noreferrer" t=
arget=3D"_blank">https://docs.gitlab.com/ee/ci/yaml/</a><br>
<br>
And broader set of docs<br>
<br>
=C2=A0<a href=3D"https://docs.gitlab.com/ee/ci/" rel=3D"noreferrer" target=
=3D"_blank">https://docs.gitlab.com/ee/ci/</a><br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--0000000000001278a505e9a60d98--

