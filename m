Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E506076E1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 14:29:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olr91-0005rz-He
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 08:28:59 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olr2y-0003TP-KH
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 08:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olr2o-0003Sw-4H
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 08:22:35 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olr2l-0005C6-CN
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 08:22:33 -0400
Received: by mail-io1-xd33.google.com with SMTP id l127so2100856iof.12
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 05:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TkiXdeeKeu9lj6pSmlQeIg2v9YmzLtvNV1HG3iVU5AA=;
 b=gXOPR/Dmgd4aZUm7YzNdar5ul4KfimJYzTeecwEr+4537xUHyXyAiWh+PAyg8UunZZ
 ND0lzYCWXvVP/8b50VmNmw5p9fWK1ftXupdRVkyftq3pUQBWH3+rvILeR48+Vai8prfK
 poDzsHzwiUZ1jB32fAdvLPfOesIu3GMxVDGM+RW91WBQN3D+wXPFrE9s99AH1aOdJbeR
 og6hKm0HAH7Tipfv4BhLeF3OqF+rga2MqsRm+G16EXcExOGL6RzxSPP0gjmp2fakmJN2
 fKbI/1rg30+hQy0Hlj3AVCrOoYxV1KN2kX162LWGgZuikD0qwJ1MpMMDWuJuvPzfzXEf
 UebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TkiXdeeKeu9lj6pSmlQeIg2v9YmzLtvNV1HG3iVU5AA=;
 b=FAC4K6S9cWJ+gmYdJXQ0EnODRO4j3u5Fj44bir+elCbijbROlczj+8TljK8FJkRbz0
 u8+66wFbaZlVallluhWIfOGQbcjdXatCNFsbm2/ybHy3/1vvfsmsvEeJBskL8aCGiuXc
 D9BYEyEfee1XzEVEKDOdNYDWTpoYD1HWRiBkZBOvup+0kT7/7AvZv+YGgk9HFqrtoW1a
 o9AiRvbRSz7ECOs6oUI+EjMUeM4TQ/LJ7XIQUdvvIBxpUh5PKq6Z1vG3ah5O0Uop9KS4
 JRmhxoXGdIy2ycCsDSR55Js9RiRfcixskr8dKMFhuhPCfZjyCNJHDbJOA969/Gp8hTBj
 moTw==
X-Gm-Message-State: ACrzQf2OWUnkYR2sUnbFT1xeXbhzi7xRSnqmr+6jLYirHOF3hsD4P3ko
 U+0ugTS4QZyhwUExHCd8P9xo9qn9UUhcvzH56epaEw==
X-Google-Smtp-Source: AMsMyM6M14mDYdGG9f6T7hlCWdyBnT5Q37ls9TiQdT+Ab+C6Wh8cyg1wi+wYlJNrf+yF+Vi8MUpFQcJkaUptI0nF5Xc=
X-Received: by 2002:a6b:8f91:0:b0:6bb:ee69:2ffe with SMTP id
 r139-20020a6b8f91000000b006bbee692ffemr14021771iod.34.1666354949738; Fri, 21
 Oct 2022 05:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
 <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
 <20221020150857-mutt-send-email-mst@kernel.org>
 <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
 <CAARzgww8P4Za=+r8q2a30TCY7Uzw6g2tgHeLLKr7R+WV-7qQVg@mail.gmail.com>
 <20221021042449-mutt-send-email-mst@kernel.org>
 <CAARzgwyW+ved0iVinWzSCg+KSCL67v+m6KySRdg_hUUev8JLDA@mail.gmail.com>
 <87k04t7ca6.fsf@linaro.org> <20221021053828-mutt-send-email-mst@kernel.org>
 <CAARzgwzQZXdJCxn_YmXPGOuVTd7CzwnZ=aQRjVgZ5p2XiTosQA@mail.gmail.com>
 <87bkq575m8.fsf@linaro.org>
In-Reply-To: <87bkq575m8.fsf@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 21 Oct 2022 17:52:17 +0530
Message-ID: <CAARzgwya9jw3YmAwHcSbzzTUewFcq8JR_hVM+=-cSePfyxO1CQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>, 
 Maydell Peter <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d9681705eb8a7eb4"
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd33.google.com
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

--000000000000d9681705eb8a7eb4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Oct, 2022, 5:26 pm Alex Benn=C3=A9e, <alex.bennee@linaro.org> wr=
ote:

>
> Ani Sinha <ani@anisinha.ca> writes:
>
> > On Fri, Oct 21, 2022 at 3:10 PM Michael S. Tsirkin <mst@redhat.com>
> wrote:
> >>
> >> On Fri, Oct 21, 2022 at 10:30:09AM +0100, Alex Benn=C3=A9e wrote:
> >> >
> >> > Ani Sinha <ani@anisinha.ca> writes:
> >> >
> >> > > On Fri, Oct 21, 2022 at 2:02 PM Michael S. Tsirkin <mst@redhat.com=
>
> wrote:
> >> > >>
> >> > >> On Fri, Oct 21, 2022 at 05:45:15AM +0530, Ani Sinha wrote:
> >> > >> > And have multiple platform specific branches in bits that have
> fixes for those
> >> > >> > platforms so that bits can run there. Plus the existing test ca=
n
> be enhanced to
> >> > >> > pull in binaries from those branches based on the platform on
> which it is being
> >> > >> > run.
> >> > >> >
> >> > >>
> >> > >> What a mess.
> >> > >> Who is going to be testing all these million platforms?
> >> > >
> >> > > I am not talking about branches in QEMU but branches in bits.
> >> > > If you are going to test multiple platforms, you do need to build
> bits
> >> > > binaries for them. There is no way around it.
> >> > > bits is not all platform independent python. It does have binary
> executables.
> >> > >
> >> > > Currently bits is built only for the x86 platform. Other platforms
> are
> >> > > not tested. I doubt if anyone even tried building bits for arm or
> >> > > mips.
> >> >
> >> > I'm not worried about test bits on other targets, but we do run x86
> >> > targets on a number of hosts. The current reliance on a special
> patched
> >> > host build tool for only one architecture is the problem. If  we jus=
t
> >> > download the iso that problem goes away.
> >>
> >> =F0=9F=91=8Dwhat he said.
> >
> > Yes, in that case the problem is that upstream bits does not pass all
> > the test out of the box. Hence we are taking this approach of keeping
> > some test scripts in QEMU repo and modifying them. Then generating the
> > iso with the modified scripts. It also helps developers who want to
> > write new tests or make enhancements to existing tests.
> > If modifications need to be made to tests, they need to be versioned.
> > We have gone through the route of not using submodules and I am not
> > going to open that can of worms again.
>
> We have added a mirror of biosbits to the QEMU project so there is no
> reason why we can't track changes and modifications there (we do this
> for TestFloat which is forked from the upstream SoftFloat code).
>

The whole idea was that say an acpi developer added support for a new table
in QEMU, he should write a corresponding test for bits so that the same
table is exercised during run time. Making those changes from a single repo
(either directly or through a submodule)  makes things lit simpler and also
keeps things in sync with each other. If we use separate repos for acpi
bits test, it will be another mess when comes to developers adding changes
and keeping things in sync.

Anyways these things should have been brought up earlier. I'm out of the
debate.

I've sent v7 , incremental work over the last 6 months in my spare time
without getting any pay. So take it or scrap it.

=F0=9F=98=8A

> Maintaining and occasionally re-based "vendor" branch shouldn't be too
> hard and would track the changes we've made for QEMU's purposes.
>
> > We also have no consensus on where to keep the one time built iso that
> > we can download for this test you are proposing.
>
> How big is the eventual ISO? If it's small we could just enable some CI
> steps and serve the ISOs directly as tagged build artefacts from GitLab.
>
> > So let's figure out the above first. Programmatically downloading an
> > iso and running tests within a VM would be a much simpler test than
> > the one I wrote. We can add a subtest or a brand new test anytime if
> > we can figure out the above logistics.
> >
> >>
> >> > > It makes sense to try things incrementally once we have something
> going.
> >> > >
> >> > > Lets discuss this on a separate thread.
> >> > >
> >> > >> All this does nothing at all to help developers avoid
> >> > >> bugs and when they do trigger debug the issue. Which is
> >> > >> after all why we have testing.
> >> > >> Yes once in a very long while we are going to tweak
> >> > >> something in the tests, and for that rare occurence
> >> > >> it makes sense to periodically rebuild everything,
> >> > >> otherwise code bitrots.
> >> > >>
> >> > >> But the test is supposed to run within a VM anyway, let's
> >> > >> have an image and be done with it.
> >> > >>
> >> > >> --
> >> > >> MST
> >> > >>
> >> >
> >> >
> >> > --
> >> > Alex Benn=C3=A9e
> >>
>
>
> --
> Alex Benn=C3=A9e
>

--000000000000d9681705eb8a7eb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 21 Oct, 2022, 5:26 pm Alex Benn=C3=A9e, &lt;<a=
 href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><br>
Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_blank" rel=3D"n=
oreferrer">ani@anisinha.ca</a>&gt; writes:<br>
<br>
&gt; On Fri, Oct 21, 2022 at 3:10 PM Michael S. Tsirkin &lt;<a href=3D"mail=
to:mst@redhat.com" target=3D"_blank" rel=3D"noreferrer">mst@redhat.com</a>&=
gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Oct 21, 2022 at 10:30:09AM +0100, Alex Benn=C3=A9e wrote:<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_b=
lank" rel=3D"noreferrer">ani@anisinha.ca</a>&gt; writes:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; On Fri, Oct 21, 2022 at 2:02 PM Michael S. Tsirkin &lt;<=
a href=3D"mailto:mst@redhat.com" target=3D"_blank" rel=3D"noreferrer">mst@r=
edhat.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; On Fri, Oct 21, 2022 at 05:45:15AM +0530, Ani Sinha =
wrote:<br>
&gt;&gt; &gt; &gt;&gt; &gt; And have multiple platform specific branches in=
 bits that have fixes for those<br>
&gt;&gt; &gt; &gt;&gt; &gt; platforms so that bits can run there. Plus the =
existing test can be enhanced to<br>
&gt;&gt; &gt; &gt;&gt; &gt; pull in binaries from those branches based on t=
he platform on which it is being<br>
&gt;&gt; &gt; &gt;&gt; &gt; run.<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; What a mess.<br>
&gt;&gt; &gt; &gt;&gt; Who is going to be testing all these million platfor=
ms?<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I am not talking about branches in QEMU but branches in =
bits.<br>
&gt;&gt; &gt; &gt; If you are going to test multiple platforms, you do need=
 to build bits<br>
&gt;&gt; &gt; &gt; binaries for them. There is no way around it.<br>
&gt;&gt; &gt; &gt; bits is not all platform independent python. It does hav=
e binary executables.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Currently bits is built only for the x86 platform. Other=
 platforms are<br>
&gt;&gt; &gt; &gt; not tested. I doubt if anyone even tried building bits f=
or arm or<br>
&gt;&gt; &gt; &gt; mips.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;m not worried about test bits on other targets, but we =
do run x86<br>
&gt;&gt; &gt; targets on a number of hosts. The current reliance on a speci=
al patched<br>
&gt;&gt; &gt; host build tool for only one architecture is the problem. If=
=C2=A0 we just<br>
&gt;&gt; &gt; download the iso that problem goes away.<br>
&gt;&gt;<br>
&gt;&gt; =F0=9F=91=8Dwhat he said.<br>
&gt;<br>
&gt; Yes, in that case the problem is that upstream bits does not pass all<=
br>
&gt; the test out of the box. Hence we are taking this approach of keeping<=
br>
&gt; some test scripts in QEMU repo and modifying them. Then generating the=
<br>
&gt; iso with the modified scripts. It also helps developers who want to<br=
>
&gt; write new tests or make enhancements to existing tests.<br>
&gt; If modifications need to be made to tests, they need to be versioned.<=
br>
&gt; We have gone through the route of not using submodules and I am not<br=
>
&gt; going to open that can of worms again.<br>
<br>
We have added a mirror of biosbits to the QEMU project so there is no<br>
reason why we can&#39;t track changes and modifications there (we do this<b=
r>
for TestFloat which is forked from the upstream SoftFloat code).<br></block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">The whole i=
dea was that say an acpi developer added support for a new table in QEMU, h=
e should write a corresponding test for bits so that the same table is exer=
cised during run time. Making those changes from a single repo (either dire=
ctly or through a submodule)=C2=A0 makes things lit simpler and also keeps =
things in sync with each other. If we use separate repos for acpi bits test=
, it will be another mess when comes to developers adding changes and keepi=
ng things in sync.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Anyways these things should have been brought up earlier. I&#39;m out of t=
he debate.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;v=
e sent v7 , incremental work over the last 6 months in my spare time withou=
t getting any pay. So take it or scrap it.=C2=A0</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">=F0=9F=98=8A</div><div dir=3D"auto"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
Maintaining and occasionally re-based &quot;vendor&quot; branch shouldn&#39=
;t be too<br>
hard and would track the changes we&#39;ve made for QEMU&#39;s purposes.<br=
>
<br>
&gt; We also have no consensus on where to keep the one time built iso that=
<br>
&gt; we can download for this test you are proposing.<br>
<br>
How big is the eventual ISO? If it&#39;s small we could just enable some CI=
<br>
steps and serve the ISOs directly as tagged build artefacts from GitLab.<br=
>
<br>
&gt; So let&#39;s figure out the above first. Programmatically downloading =
an<br>
&gt; iso and running tests within a VM would be a much simpler test than<br=
>
&gt; the one I wrote. We can add a subtest or a brand new test anytime if<b=
r>
&gt; we can figure out the above logistics.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; &gt; It makes sense to try things incrementally once we have =
something going.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Lets discuss this on a separate thread.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; All this does nothing at all to help developers avoi=
d<br>
&gt;&gt; &gt; &gt;&gt; bugs and when they do trigger debug the issue. Which=
 is<br>
&gt;&gt; &gt; &gt;&gt; after all why we have testing.<br>
&gt;&gt; &gt; &gt;&gt; Yes once in a very long while we are going to tweak<=
br>
&gt;&gt; &gt; &gt;&gt; something in the tests, and for that rare occurence<=
br>
&gt;&gt; &gt; &gt;&gt; it makes sense to periodically rebuild everything,<b=
r>
&gt;&gt; &gt; &gt;&gt; otherwise code bitrots.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; But the test is supposed to run within a VM anyway, =
let&#39;s<br>
&gt;&gt; &gt; &gt;&gt; have an image and be done with it.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; --<br>
&gt;&gt; &gt; &gt;&gt; MST<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Alex Benn=C3=A9e<br>
&gt;&gt;<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div></div>

--000000000000d9681705eb8a7eb4--

