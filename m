Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63156097A6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 03:01:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omiUf-0002aU-B7
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 17:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1omHb3-0006Vd-Ni
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 12:43:41 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1omHao-0001rs-K1
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 12:43:41 -0400
Received: by mail-io1-xd34.google.com with SMTP id b79so4683555iof.5
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 09:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bjdY60ZUetdy8hNFK9HbEq+vRTJ5FJraQZ/UMhiC3Hw=;
 b=VYQg93nNmyxSzyecPpC9pGIoDCg4QVLzd/gprDENRafB4knB0X8BcpoSX4M/fFXW3D
 D+RHhz1qTg/cAyCpjfBJ4W/s1GQkL5e7d2jEeodneFKFFqyMBnOwVS6vtRez3sc2fsnX
 Qh1EyTWfoqOb404d1SftI3hI7L5OESlbksy9xLRZ7+DHc/rD05FugdyVoFMOrxGAMezf
 OcDQ3xjtL5LEkieo/7MgaL0/stERA++3anJmsbRBaeDS8aRKz0cOlEOLv/HS9UAhCy6w
 194bA3H0RtwuR6+55VJo9NB2BIzxgLys0EqCDJokpWTbjILacx4I8uQe95mHry6h6Trf
 votw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bjdY60ZUetdy8hNFK9HbEq+vRTJ5FJraQZ/UMhiC3Hw=;
 b=Clva0sjgTuEElocu2sPKEDPEo4+OIh6BKT0YyMjKCBaBGTS2oJDO3vMiNXtWw2cnK2
 1zE27p3cOF7l9Z99XFnKq/1SPsdb1rxUxhmjodRQreILIcK3MJcjbF/RVzPWszjgrz+e
 l8U+iQWGYRdQ/1Gq0O88Ko6Fj4aor4bWtPAeBR4vEJtAF3nUS4m9TL45SF2VdQoR4hOK
 eyE0r/x4wlJw0PDDQa+v2AgP54ADJRzjGsOinRqADTYO4b+tRRpP2ClyoEa783ks294F
 iwcL8gAeLZ14S9efjSzENpgVXuZOa0qNEctxxcJbc3gnkkB7yGkys+UxTzU0d2rtCTuG
 NnnQ==
X-Gm-Message-State: ACrzQf08DCkYeTGdewlVinBGxTMF4D6o07+vU+zKUjaK0vB9yJLUT3Tg
 Hh9NJNFuTtSL61fClW1zyDPmJnskslGkyYX0KkZx7Q==
X-Google-Smtp-Source: AMsMyM4ii6OmH37h31pyn+zFwJqJaFn9Mt3T6fTzh/+EGbp0+XOO5wtp7CIoCOAacgQ0+/WSU9s8OuuSBnrJdNEaz4s=
X-Received: by 2002:a6b:4a01:0:b0:6bc:d4ae:321c with SMTP id
 w1-20020a6b4a01000000b006bcd4ae321cmr16819418iob.59.1666457004364; Sat, 22
 Oct 2022 09:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221021042449-mutt-send-email-mst@kernel.org>
 <CAARzgwyW+ved0iVinWzSCg+KSCL67v+m6KySRdg_hUUev8JLDA@mail.gmail.com>
 <87k04t7ca6.fsf@linaro.org> <20221021053828-mutt-send-email-mst@kernel.org>
 <CAARzgwzQZXdJCxn_YmXPGOuVTd7CzwnZ=aQRjVgZ5p2XiTosQA@mail.gmail.com>
 <87bkq575m8.fsf@linaro.org>
 <CAARzgwya9jw3YmAwHcSbzzTUewFcq8JR_hVM+=-cSePfyxO1CQ@mail.gmail.com>
 <CAARzgwy8iEDxet6bHxe4AqU=9qQfC=pk=QWoLdF+rz61T1+bMQ@mail.gmail.com>
 <87pmel5fm7.fsf@linaro.org>
 <CAARzgwygyiK7FZppZEczHV3p8yz43N2v9-hL374mrNPWowDWXg@mail.gmail.com>
 <20221022123308-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221022123308-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Sat, 22 Oct 2022 22:13:13 +0530
Message-ID: <CAARzgwztz3TG+f8+NoYU6KyxNQBKfZ76abTDPXs696iNiw5BEQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>, 
 Maydell Peter <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c76c1605eba2411f"
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd34.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

--000000000000c76c1605eba2411f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 22, 2022 at 22:05 Michael S. Tsirkin <mst@redhat.com> wrote:

> On Sat, Oct 22, 2022 at 06:28:32AM +0530, Ani Sinha wrote:
> >
> >
> > On Fri, Oct 21, 2022 at 21:32 Alex Benn=C3=A9e <alex.bennee@linaro.org>
> wrote:
> >
> >
> >     Ani Sinha <ani@anisinha.ca> writes:
> >
> >     > On Fri, 21 Oct, 2022, 5:52 pm Ani Sinha, <ani@anisinha.ca> wrote:
> >     >
> >     >  On Fri, 21 Oct, 2022, 5:26 pm Alex Benn=C3=A9e, <
> alex.bennee@linaro.org>
> >     wrote:
> >     >
> >     >  Ani Sinha <ani@anisinha.ca> writes:
> >     >
> >     >  > On Fri, Oct 21, 2022 at 3:10 PM Michael S. Tsirkin <
> mst@redhat.com>
> >     wrote:
> >     >  >>
> >     >  >> On Fri, Oct 21, 2022 at 10:30:09AM +0100, Alex Benn=C3=A9e wr=
ote:
> >     >  >> >
> >     >  >> > Ani Sinha <ani@anisinha.ca> writes:
> >     >  >> >
> >     >  >> > > On Fri, Oct 21, 2022 at 2:02 PM Michael S. Tsirkin <
> >     mst@redhat.com> wrote:
> >     >  >> > >>
> >     >  >> > >> On Fri, Oct 21, 2022 at 05:45:15AM +0530, Ani Sinha wrot=
e:
> >     >  >> > >> > And have multiple platform specific branches in bits
> that have
> >     fixes for those
> >     >  >> > >> > platforms so that bits can run there. Plus the existin=
g
> test
> >     can be enhanced to
> >     >  >> > >> > pull in binaries from those branches based on the
> platform on
> >     which it is being
> >     >  >> > >> > run.
> >     >  >> > >> >
> >     >  >> > >>
> >     >  >> > >> What a mess.
> >     >  >> > >> Who is going to be testing all these million platforms?
> >     >  >> > >
> >     >  >> > > I am not talking about branches in QEMU but branches in
> bits.
> >     >  >> > > If you are going to test multiple platforms, you do need
> to build
> >     bits
> >     >  >> > > binaries for them. There is no way around it.
> >     >  >> > > bits is not all platform independent python. It does have
> binary
> >     executables.
> >     >  >> > >
> >     >  >> > > Currently bits is built only for the x86 platform. Other
> >     platforms are
> >     >  >> > > not tested. I doubt if anyone even tried building bits fo=
r
> arm or
> >     >  >> > > mips.
> >     >  >> >
> >     >  >> > I'm not worried about test bits on other targets, but we do
> run x86
> >     >  >> > targets on a number of hosts. The current reliance on a
> special
> >     patched
> >     >  >> > host build tool for only one architecture is the problem.
> If  we
> >     just
> >     >  >> > download the iso that problem goes away.
> >     >  >>
> >     >  >> =F0=9F=91=8Dwhat he said.
> >     >  >
> >     >  > Yes, in that case the problem is that upstream bits does not
> pass all
> >     >  > the test out of the box. Hence we are taking this approach of
> keeping
> >     >  > some test scripts in QEMU repo and modifying them. Then
> generating the
> >     >  > iso with the modified scripts. It also helps developers who
> want to
> >     >  > write new tests or make enhancements to existing tests.
> >     >  > If modifications need to be made to tests, they need to be
> versioned.
> >     >  > We have gone through the route of not using submodules and I a=
m
> not
> >     >  > going to open that can of worms again.
> >     >
> >     >  We have added a mirror of biosbits to the QEMU project so there
> is no
> >     >  reason why we can't track changes and modifications there (we do
> this
> >     >  for TestFloat which is forked from the upstream SoftFloat code).
> >
> >
> > One last option. Commit this patch set but also double commit patch 3 t=
o
> the
> > bits repo so that we can build an iso that would successfully run all
> tests for
> > a separate platform independent test to be written later.
> >
> > Then we will have two tests:
> >
> > - this one for developers writing new test.
> > - platform independent one for a basic sanity.
> >
> > I=E2=80=99m just documenting the fact that I have proposed ideas that c=
an work
> where
> > all can be happy. It=E2=80=99s up to others to take it or keep objectin=
g and
> killing
> > motivations for freelance contributors.
>
> I think it's ok to apply this as is for starters.
> Anyone has objections?
>
> Down the road I think things should be refactored slightly to work as
> follows:
> - test developers can check out biosbits repo to create the iso
> - everyone else gets iso downloaded


It will be difficult to convince test developers to check out another repo
and go back and forth between two repos. If the bits repo was a sub module
that=E2=80=99s another story.

Test developers should use the test scripts from qemu repo. Someone then
later can incrementally commit these new tests into bits repo and generate
newer iso at some periodic intervals. Since I am the maintainer of the bits
repo I can do the second part.



>
> Objections to this plan?
>
>
> >
> >
> >
> >     >
> >     >
> >
>
>

--000000000000c76c1605eba2411f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Oct 22, 2022 at 22:05 Michael S. Tsirkin &lt;<a hre=
f=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)">On Sat, Oct 22, 2022 at 06:28:32AM +0530, Ani Sinha wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Oct 21, 2022 at 21:32 Alex Benn=C3=A9e &lt;<a href=3D"mailto:a=
lex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt; wro=
te:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" ta=
rget=3D"_blank">ani@anisinha.ca</a>&gt; writes:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Fri, 21 Oct, 2022, 5:52 pm Ani Sinha, &lt;<=
a href=3D"mailto:ani@anisinha.ca" target=3D"_blank">ani@anisinha.ca</a>&gt;=
 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 On Fri, 21 Oct, 2022, 5:26 pm Alex Benn=
=C3=A9e, &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=3D"_blank">al=
ex.bennee@linaro.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Ani Sinha &lt;<a href=3D"mailto:ani@anis=
inha.ca" target=3D"_blank">ani@anisinha.ca</a>&gt; writes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt; On Fri, Oct 21, 2022 at 3:10 PM Mic=
hael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=3D"_blank">mst=
@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; On Fri, Oct 21, 2022 at 10:30:0=
9AM +0100, Alex Benn=C3=A9e wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; Ani Sinha &lt;<a href=3D"m=
ailto:ani@anisinha.ca" target=3D"_blank">ani@anisinha.ca</a>&gt; writes:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt; On Fri, Oct 21, 2022 =
at 2:02 PM Michael S. Tsirkin &lt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:mst@redhat.com" target=3D"_blank"=
>mst@redhat.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; On Fri, Oct 21, 2=
022 at 05:45:15AM +0530, Ani Sinha wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; &gt; And have mul=
tiple platform specific branches in bits that have<br>
&gt;=C2=A0 =C2=A0 =C2=A0fixes for those<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; &gt; platforms so=
 that bits can run there. Plus the existing test<br>
&gt;=C2=A0 =C2=A0 =C2=A0can be enhanced to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; &gt; pull in bina=
ries from those branches based on the platform on<br>
&gt;=C2=A0 =C2=A0 =C2=A0which it is being<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; &gt; run.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; What a mess.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; Who is going to b=
e testing all these million platforms?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt; I am not talking abou=
t branches in QEMU but branches in bits.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt; If you are going to t=
est multiple platforms, you do need to build<br>
&gt;=C2=A0 =C2=A0 =C2=A0bits<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt; binaries for them. Th=
ere is no way around it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt; bits is not all platf=
orm independent python. It does have binary<br>
&gt;=C2=A0 =C2=A0 =C2=A0executables.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt; Currently bits is bui=
lt only for the x86 platform. Other<br>
&gt;=C2=A0 =C2=A0 =C2=A0platforms are<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt; not tested. I doubt i=
f anyone even tried building bits for arm or<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; &gt; mips.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; I&#39;m not worried about =
test bits on other targets, but we do run x86<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; targets on a number of hos=
ts. The current reliance on a special<br>
&gt;=C2=A0 =C2=A0 =C2=A0patched<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; host build tool for only o=
ne architecture is the problem. If=C2=A0 we<br>
&gt;=C2=A0 =C2=A0 =C2=A0just<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; &gt; download the iso that prob=
lem goes away.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;&gt; =F0=9F=91=8Dwhat he said.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt; Yes, in that case the problem is th=
at upstream bits does not pass all<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt; the test out of the box. Hence we a=
re taking this approach of keeping<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt; some test scripts in QEMU repo and =
modifying them. Then generating the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt; iso with the modified scripts. It a=
lso helps developers who want to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt; write new tests or make enhancement=
s to existing tests.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt; If modifications need to be made to=
 tests, they need to be versioned.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt; We have gone through the route of n=
ot using submodules and I am not<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 &gt; going to open that can of worms aga=
in.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 We have added a mirror of biosbits to th=
e QEMU project so there is no<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 reason why we can&#39;t track changes an=
d modifications there (we do this<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 for TestFloat which is forked from the u=
pstream SoftFloat code).<br>
&gt; <br>
&gt; <br>
&gt; One last option. Commit this patch set but also double commit patch 3 =
to the<br>
&gt; bits repo so that we can build an iso that would successfully run all =
tests for<br>
&gt; a separate platform independent test to be written later.<br>
&gt; <br>
&gt; Then we will have two tests:<br>
&gt; <br>
&gt; - this one for developers writing new test.<br>
&gt; - platform independent one for a basic sanity.<br>
&gt; <br>
&gt; I=E2=80=99m just documenting the fact that I have proposed ideas that =
can work where<br>
&gt; all can be happy. It=E2=80=99s up to others to take it or keep objecti=
ng and killing<br>
&gt; motivations for freelance contributors.=C2=A0<br>
<br>
I think it&#39;s ok to apply this as is for starters.<br>
Anyone has objections?<br>
<br>
Down the road I think things should be refactored slightly to work as follo=
ws:<br>
- test developers can check out biosbits repo to create the iso<br>
- everyone else gets iso downloaded</blockquote><div dir=3D"auto"><br></div=
><div dir=3D"auto">It will be difficult to convince test developers to chec=
k out another repo and go back and forth between two repos. If the bits rep=
o was a sub module that=E2=80=99s another story.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Test developers should use the test scripts from q=
emu repo. Someone then later can incrementally commit these new tests into =
bits repo and generate newer iso at some periodic intervals. Since I am the=
 maintainer of the bits repo I can do the second part.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Objections to this plan?<br>
<br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000c76c1605eba2411f--

