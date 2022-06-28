Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D345855BFB6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:13:29 +0200 (CEST)
Received: from localhost ([::1]:54394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67Hk-0003Qa-Sy
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o66v1-0002Ml-D8
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:50:00 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o66ux-0007w4-Ch
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:49:58 -0400
Received: by mail-ed1-x52d.google.com with SMTP id r18so8656981edb.9
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 01:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CHpGcRMo7QP7xJu0zVJtGNfV6FFw+0tjlqFt5LwsNjE=;
 b=YZH5c0ve9AjAsD+gvKB2TXadZpDKuI8oXUIgV8ndpHpcM6NwdHI5bQeiOgxweuoHxo
 1BaLj8E2Nl2mcZVa+ZpWg3FFjy8Ap6JU1Ra6nY5GJuBHSuSnjpGCbLgXGrR65edYExQq
 SzhNkhtonNozxXVkgw7aPnCkoIOfP0fkOJIipZwc/dj9dJ4ehFrbjkUlEhDy9x+i8phF
 4ZSoSPWE1lFujRtcShooGkeL6BSmYEryhCAQSCMvAASa+udnLrRHY5hJdf+9uu86zHJf
 cbDcqfVeGiN/rWyL5GnZ3erhwr3D0L+LfrouKcRhOM5slXr01pBzHzEnPgHfYylpY4f1
 nESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CHpGcRMo7QP7xJu0zVJtGNfV6FFw+0tjlqFt5LwsNjE=;
 b=NH9btEffEfFOu9TvbUReJen+u38riidw+ZjAoYXqk5D1gHvjsNjUEJMQv2XIODRZCm
 VKFrgdkfQ37Tw1O5h5RVm3IE3wijjU+yfvIMpoYsXptyAus6roabM79H7p1hCYYR3eAo
 vgCabjX108njaDtddjn+rICh8eNr9N4UFfP25Gywja+hAOOFE2KueNMR/tSl5WtlRq1q
 g3XgCpW5b8YpdjcO8zlwJte7b8LuftXV0gJM/O9VqCGAa8yrYWQ/Pf9Iy/hz49syTjPy
 i7lPzeFrGlfBbQ/LutRCjlj1mFnAR/oGTUqqzPrJ4CY0ibJIsjV44yAFZwlhM0+bDAXh
 DSgw==
X-Gm-Message-State: AJIora+Iqda3znbZQ1AA0gX46lZwn4z9Kok5fAMHNLJ6Er9ElfqlE6WS
 88HOylGAf7AviZR7kqy+fh5kN+yl/BtzORb9o170dA==
X-Google-Smtp-Source: AGRyM1syjJUd8aXQEnq6xQDVcfTSH4BZdn3TjEKt5XN7MyoRAwKONfZvZmsdPrNqLzCaC1+63cjNSQhpSVz3ycWvpaA=
X-Received: by 2002:a05:6402:2708:b0:435:da6f:3272 with SMTP id
 y8-20020a056402270800b00435da6f3272mr21202058edd.160.1656406192688; Tue, 28
 Jun 2022 01:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgwwf_WRWzbwPorpa-4XN7T6f6D7CRo70+07Z8LgZO+5Spg@mail.gmail.com>
 <20220628021757-mutt-send-email-mst@kernel.org>
 <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
 <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
In-Reply-To: <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 14:19:41 +0530
Message-ID: <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b8435805e27e1e52"
Received-SPF: none client-ip=2a00:1450:4864:20::52d;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000b8435805e27e1e52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2022 at 14:05 Ani Sinha <ani@anisinha.ca> wrote:

> On Tue, Jun 28, 2022 at 1:58 PM Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 28/06/2022 10.23, Daniel P. Berrang=C3=A9 wrote:
> > > On Tue, Jun 28, 2022 at 01:21:35PM +0530, Ani Sinha wrote:
> > >> On Tue, Jun 28, 2022 at 1:19 PM Daniel P. Berrang=C3=A9 <
> berrange@redhat.com> wrote:
> > >>>
> > >>> On Tue, Jun 28, 2022 at 09:25:35AM +0200, Thomas Huth wrote:
> > >>>> On 28/06/2022 09.10, Michael S. Tsirkin wrote:
> > >>>>> On Tue, Jun 28, 2022 at 09:03:33AM +0200, Thomas Huth wrote:
> > >>>>>>>>>>>> No problem with that. So that's venv. But do we need pip
> and pulling
> > >>>>>>>>>>>> packages from the net during testing?
> > >>>>>>>>>>>
> > >>>>>>>>>>> We do that too. See requirements.txt in tests/
> > >>>>>>>>>>> Following two are downloaded:
> > >>>>>>>>>>> avocado-framework=3D=3D88.1
> > >>>>>>>>>>> pycdlib=3D=3D1.11.0
> > >>>>>>>>>>>
> > >>>>>>>>>>> Also see this line in Makefie.include:
> > >>>>>>>>>>>
> > >>>>>>>>>>> $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
> > >>>>>>>>>>
> > >>>>>>>>>> Right but that's avocado since it pulls lots of stuff from
> > >>>>>>>>>> the net anyway.
> > >>>>>>>>>> Are the libraries in question not packaged on major distros?
> > >>>>>>>>>
> > >>>>>>>>> Currently I only need this:
> > >>>>>>>>> https://github.com/python-tap/tappy
> > >>>>>>>>> which is the basic TAP processing library for python.
> > >>>>>>>>>
> > >>>>>>>>> It seems its only installed through pip:
> > >>>>>>>>> https://tappy.readthedocs.io/en/latest/
> > >>>>>>>>>
> > >>>>>>>>> I do not think this is packaged by default. It's such a basic
> library
> > >>>>>>>>> for parsing test output that maybe we can keep this somewhere
> within
> > >>>>>>>>> the python src tree? Not sure ...
> > >>>>>>>>
> > >>>>>>>> It's pretty small for sure. Another submodule?
> > >>>>>>>
> > >>>>>>> Unlike BITS, this one is likely going to be maintained for a
> while and
> > >>>>>>> will receive new releases through
> > >>>>>>> https://pypi.org/project/tap.py/
> > >>>>>>> so forking is OK but someone has to keep this updated.
> > >>>>>>>
> > >>>>>>> I am open to anything. Whatever feels right is fine to me.
> > >>>>>>
> > >>>>>> John Snow is currently working on the "Pythonification" of
> various QEMU
> > >>>>>> bits, I think you should loop him into this discussion, too.
> > >>>>>>
> > >>>>>>    Thomas
> > >>>>>
> > >>>>> submodule does not mean we fork necessarily. We could have
> > >>>>> all options: check for the module and use it if there, if not
> > >>>>> use one from system if not there install with pip ..
> > >>>>> But yea, I'm not sure what's best either.
> > >>>>
> > >>>> submodules create a dependency on an internet connection, too. So
> before you
> > >>>> add yet another submodule (which have a couple of other
> disadvantages), I
> > >>>> think you could also directly use the venv here.
> > >>>
> > >>> Definitely not submodules.
> > >>>
> > >>> We need to get out of the mindset that submodules are needed for
> every new
> > >>> dependancy we add. Submodules are only appropriate if the external
> project
> > >>> is designed to be used as a copylib (eg the keycodemapdb tool), or
> if we
> > >>> need to bundle in order to prevent a regression for previously
> deployed
> > >>> QEMU installs where the dependancy is known not to exist on all our
> > >>> supported platforms.
> > >>>
> > >>> This does not apply in this case, because the proposed use of tappy
> is
> > >>> merely for a test case. Meson just needs to check if tappy exists
> and if
> > >>> it does, then use it, otherwise skip the tests that need it. The
> user can
> > >>> arrange to install tappy, as they do with the majority of other dep=
s.
> > >>>
> > >>> If John's venv stuff is relevant, then we don't even need the meson
> checks,
> > >>> just delegate to the venv setup.
> > >>>
> > >>> Regardless, no submodules are needed or desirable.
> > >>
> > >> What about keeping biosbits stuff? Source or pre-built.
> > >
> > > Shipping them as pre-built binaries in QEMU is not a viable option
> > > IMHO, especially for grub as a GPL'd project we need to be extremely
> > > clear about the exact corresponding source and build process for any
> > > binary.
> > >
> > > For this kind of thing I would generally expect the distro to provide
> > > packages that we consume. Looking at biosbits I see it is itself
> > > bundling a bunch more 3rd party projects, libffi, grub2, and includin=
g
> > > even an ancient version of python as a submodule.
> > >
> > > So bundling a pre-built biosbits in QEMU appears to mean that we're i=
n
> > > turn going to unexpectedly bundle a bunch of other 3rd party projects
> > > too, all with dubious license compliance. I don't think this looks li=
ke
> > > something we should have in qemu.git or qemu tarballs. It will also
> > > make it challenging for the distro to take biosbits at all, unless
> > > those 3rd party bundles can be eliminated in favour of using existing
> > > builds their have packaged for grub, python, libffi, etc.
> >
> > So if this depends on some third party binary bits, I think this is
> pretty
> > similar to the tests in the avocado directory ... there we download thi=
rd
> > party binaries, too... Wouldn't it make sense to adapt your tests to th=
at
> > framework?
>
> I do not want to bring in the whole avocado framework because it would
> unnecessarily make things complicated. I just need the qemu machine
> python library and that is enough. For downloading third party stuff,

we can simply wget things from somewhere.


https://pypi.org/project/wget/

That get_asset() call is an overkill for downloading two archives.


>
> >
> >   Thomas
> >
>

--000000000000b8435805e27e1e52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jun 28, 2022 at 14:05 Ani Sinha &lt;<a href=3D"mail=
to:ani@anisinha.ca">ani@anisinha.ca</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">On Tue, Jun 28, 2022 at 1:58 PM Thomas Huth &lt;<a href=3D"=
mailto:thuth@redhat.com" target=3D"_blank">thuth@redhat.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; On 28/06/2022 10.23, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; &gt; On Tue, Jun 28, 2022 at 01:21:35PM +0530, Ani Sinha wrote:<br>
&gt; &gt;&gt; On Tue, Jun 28, 2022 at 1:19 PM Daniel P. Berrang=C3=A9 &lt;<=
a href=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com=
</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; On Tue, Jun 28, 2022 at 09:25:35AM +0200, Thomas Huth wro=
te:<br>
&gt; &gt;&gt;&gt;&gt; On 28/06/2022 09.10, Michael S. Tsirkin wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt; On Tue, Jun 28, 2022 at 09:03:33AM +0200, Thomas =
Huth wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; No problem with that.=
 So that&#39;s venv. But do we need pip and pulling<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; packages from the net=
 during testing?<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; We do that too. See requi=
rements.txt in tests/<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Following two are downloa=
ded:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; avocado-framework=3D=3D88=
.1<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; pycdlib=3D=3D1.11.0<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Also see this line in Mak=
efie.include:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; $(call quiet-venv-pip,ins=
tall -r $(TESTS_VENV_REQ))<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Right but that&#39;s avocado =
since it pulls lots of stuff from<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the net anyway.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Are the libraries in question=
 not packaged on major distros?<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Currently I only need this:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://github.com/pyt=
hon-tap/tappy" rel=3D"noreferrer" target=3D"_blank">https://github.com/pyth=
on-tap/tappy</a><br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; which is the basic TAP processing=
 library for python.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; It seems its only installed throu=
gh pip:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://tappy.readthed=
ocs.io/en/latest/" rel=3D"noreferrer" target=3D"_blank">https://tappy.readt=
hedocs.io/en/latest/</a><br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I do not think this is packaged b=
y default. It&#39;s such a basic library<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; for parsing test output that mayb=
e we can keep this somewhere within<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the python src tree? Not sure ...=
<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; It&#39;s pretty small for sure. Anoth=
er submodule?<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; Unlike BITS, this one is likely going to =
be maintained for a while and<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; will receive new releases through<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://pypi.org/project/tap.p=
y/" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/project/tap.py/</=
a><br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; so forking is OK but someone has to keep =
this updated.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; I am open to anything. Whatever feels rig=
ht is fine to me.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; John Snow is currently working on the &quot;P=
ythonification&quot; of various QEMU<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; bits, I think you should loop him into this d=
iscussion, too.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 Thomas<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; submodule does not mean we fork necessarily. We c=
ould have<br>
&gt; &gt;&gt;&gt;&gt;&gt; all options: check for the module and use it if t=
here, if not<br>
&gt; &gt;&gt;&gt;&gt;&gt; use one from system if not there install with pip=
 ..<br>
&gt; &gt;&gt;&gt;&gt;&gt; But yea, I&#39;m not sure what&#39;s best either.=
<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; submodules create a dependency on an internet connect=
ion, too. So before you<br>
&gt; &gt;&gt;&gt;&gt; add yet another submodule (which have a couple of oth=
er disadvantages), I<br>
&gt; &gt;&gt;&gt;&gt; think you could also directly use the venv here.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Definitely not submodules.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; We need to get out of the mindset that submodules are nee=
ded for every new<br>
&gt; &gt;&gt;&gt; dependancy we add. Submodules are only appropriate if the=
 external project<br>
&gt; &gt;&gt;&gt; is designed to be used as a copylib (eg the keycodemapdb =
tool), or if we<br>
&gt; &gt;&gt;&gt; need to bundle in order to prevent a regression for previ=
ously deployed<br>
&gt; &gt;&gt;&gt; QEMU installs where the dependancy is known not to exist =
on all our<br>
&gt; &gt;&gt;&gt; supported platforms.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; This does not apply in this case, because the proposed us=
e of tappy is<br>
&gt; &gt;&gt;&gt; merely for a test case. Meson just needs to check if tapp=
y exists and if<br>
&gt; &gt;&gt;&gt; it does, then use it, otherwise skip the tests that need =
it. The user can<br>
&gt; &gt;&gt;&gt; arrange to install tappy, as they do with the majority of=
 other deps.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; If John&#39;s venv stuff is relevant, then we don&#39;t e=
ven need the meson checks,<br>
&gt; &gt;&gt;&gt; just delegate to the venv setup.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Regardless, no submodules are needed or desirable.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; What about keeping biosbits stuff? Source or pre-built.<br>
&gt; &gt;<br>
&gt; &gt; Shipping them as pre-built binaries in QEMU is not a viable optio=
n<br>
&gt; &gt; IMHO, especially for grub as a GPL&#39;d project we need to be ex=
tremely<br>
&gt; &gt; clear about the exact corresponding source and build process for =
any<br>
&gt; &gt; binary.<br>
&gt; &gt;<br>
&gt; &gt; For this kind of thing I would generally expect the distro to pro=
vide<br>
&gt; &gt; packages that we consume. Looking at biosbits I see it is itself<=
br>
&gt; &gt; bundling a bunch more 3rd party projects, libffi, grub2, and incl=
uding<br>
&gt; &gt; even an ancient version of python as a submodule.<br>
&gt; &gt;<br>
&gt; &gt; So bundling a pre-built biosbits in QEMU appears to mean that we&=
#39;re in<br>
&gt; &gt; turn going to unexpectedly bundle a bunch of other 3rd party proj=
ects<br>
&gt; &gt; too, all with dubious license compliance. I don&#39;t think this =
looks like<br>
&gt; &gt; something we should have in qemu.git or qemu tarballs. It will al=
so<br>
&gt; &gt; make it challenging for the distro to take biosbits at all, unles=
s<br>
&gt; &gt; those 3rd party bundles can be eliminated in favour of using exis=
ting<br>
&gt; &gt; builds their have packaged for grub, python, libffi, etc.<br>
&gt;<br>
&gt; So if this depends on some third party binary bits, I think this is pr=
etty<br>
&gt; similar to the tests in the avocado directory ... there we download th=
ird<br>
&gt; party binaries, too... Wouldn&#39;t it make sense to adapt your tests =
to that<br>
&gt; framework?<br>
<br>
I do not want to bring in the whole avocado framework because it would<br>
unnecessarily make things complicated. I just need the qemu machine<br>
python library and that is enough. For downloading third party stuff,</bloc=
kquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex" dir=3D"auto">
we can simply wget things from somewhere.</blockquote><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div><a href=3D"https://pypi.org/project/wget/">ht=
tps://pypi.org/project/wget/</a></div><br></div><div dir=3D"auto">That get_=
asset() call is an overkill for downloading two archives.=C2=A0</div><div d=
ir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Thomas<br>
&gt;<br>
</blockquote></div></div>

--000000000000b8435805e27e1e52--

