Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552FA609A3A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:11:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omih8-0005Oq-D8
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 17:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1omIOK-0001hF-Qs
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 13:34:36 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1omIOI-0004TN-IH
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 13:34:36 -0400
Received: by mail-io1-xd2d.google.com with SMTP id y80so4749983iof.3
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 10:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w5QTM5I5mWa6yqqtWNi0X+y2Ziyzd5MCE3AyIEIeuGs=;
 b=GPpQDJuDJzR1cVXulQvEsfTUXF+7vcRdXQoCIYKAdoxpdWPyD2DQnLIckNMK/Lvk02
 Ey68Db9Y5BFcL1G0jG6M/9Pax6bZjV6DH9DE48EgVyljoJ7ptpnhK0ffb7v5lY1oXhrP
 6qkJMUJhgXNE9eCSyh8jhWaHtUy3k/pdT9EZjJLiHoqXhjV74Asa59ZuMKyS5+Isa+7J
 2F+WGa4aQCAgGW443piGfRs4hjFgOmhiRk9jMT4aeOm4pHRKFBhoxigJGdtZOGu+32cR
 sHTZmUernD3Uu09kHEEGDATAZzZ/u4NeKKo/ps8aBfT1KkJynQGFYEl7uyps9kB4VsKF
 gDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w5QTM5I5mWa6yqqtWNi0X+y2Ziyzd5MCE3AyIEIeuGs=;
 b=xqSQDjSlWfxXKAtDCh402rLbyPwAlUpzWNoy1bzNvSSU3mMaLWo/EO5nSz7ANA2M2x
 gkI14c2eLxxx6mIYfOgOIyYcvSAFRjaaTLonN055XHE+K4DYjddBOeTD4XJPIKQwg9m3
 1zupHV0CbR9xLFYy/t0Vi8QbeUFudn3gTrGqo8WvjKbZRDojJEpdx+GSYdFK4kdJanjM
 hguWGuz8XdopPHIYBXPQ4sMiMbTgMpbSUuU4htqgP/jgV8Ry5WHYCNd2FgOQkN4EHJjY
 qtccuFzyGdA0BA7NpgG2oTu2wPP+6JuDVb3K6W0CgabMn7grS4aYe7L1SK90B0vf2txV
 8tdw==
X-Gm-Message-State: ACrzQf26AgMpUKoQ72otCsZe4NS/PmtvnjsIQq6G879ROlqWqEJL2n36
 4jSGW+teo7oBJTO5txLBso+ueTJJP9dooCBqNnIa7Q==
X-Google-Smtp-Source: AMsMyM47/ryaRvkyqc/ovEbQSo/VFVxX+SBroRy7odS2msNRVHjlUfCvziSiPwZ4BBGBQC0wRpTj8uALFrWwl6yJG58=
X-Received: by 2002:a05:6638:12d1:b0:363:e250:9ed with SMTP id
 v17-20020a05663812d100b00363e25009edmr18759129jas.309.1666460072592; Sat, 22
 Oct 2022 10:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgww8P4Za=+r8q2a30TCY7Uzw6g2tgHeLLKr7R+WV-7qQVg@mail.gmail.com>
 <20221021042449-mutt-send-email-mst@kernel.org>
 <CAARzgwyW+ved0iVinWzSCg+KSCL67v+m6KySRdg_hUUev8JLDA@mail.gmail.com>
 <87k04t7ca6.fsf@linaro.org> <20221021053828-mutt-send-email-mst@kernel.org>
 <CAARzgwzQZXdJCxn_YmXPGOuVTd7CzwnZ=aQRjVgZ5p2XiTosQA@mail.gmail.com>
 <87bkq575m8.fsf@linaro.org>
 <CAARzgwya9jw3YmAwHcSbzzTUewFcq8JR_hVM+=-cSePfyxO1CQ@mail.gmail.com>
 <87lep95ffx.fsf@linaro.org>
 <CAARzgwyEWCNbs5HG07Dnv_pkzmHwB++Pr47enZ_uFupXZSH09g@mail.gmail.com>
 <20221022124113-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221022124113-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Sat, 22 Oct 2022 23:04:21 +0530
Message-ID: <CAARzgwzH_PawXvpaTZY=Fwti6OzZxR4ipL0Bfir=7KnkAcfd_A@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000a8e5aa05eba2f81f"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2d.google.com
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

--000000000000a8e5aa05eba2f81f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 22, 2022 at 22:15 Michael S. Tsirkin <mst@redhat.com> wrote:

> On Fri, Oct 21, 2022 at 09:47:04PM +0530, Ani Sinha wrote:
> >
> >
> > On Fri, Oct 21, 2022 at 21:36 Alex Benn=C3=A9e <alex.bennee@linaro.org>
> wrote:
> >
> >
> >     Ani Sinha <ani@anisinha.ca> writes:
> >
> >     <snip>
> >     >
> >     >  We have added a mirror of biosbits to the QEMU project so there
> is no
> >     >  reason why we can't track changes and modifications there (we do
> this
> >     >  for TestFloat which is forked from the upstream SoftFloat code).
> >     >
> >     > The whole idea was that say an acpi developer added support for a
> new
> >     table in QEMU, he should write a corresponding
> >     > test for bits so that the same table is exercised during run time=
.
> Making
> >     those changes from a single repo (either directly
> >     > or through a submodule)  makes things lit simpler and also keeps
> things
> >     in sync with each other. If we use separate
> >     > repos for acpi bits test, it will be another mess when comes to
> >     developers adding changes and keeping things in sync.
> >     >
> >     > Anyways these things should have been brought up earlier. I'm out
> of the
> >     debate.
> >     >
> >     > I've sent v7 , incremental work over the last 6 months in my spar=
e
> time
> >     without getting any pay. So take it or scrap it.
> >     >
> >     > =F0=9F=98=8A
> >
> >     I'm sorry you feel that way but you asked for people to spend their
> time
> >     reviewing your code and giving feedback.
> >
> >
> >
> > I=E2=80=99m sorry but you don=E2=80=99t understand. Giving feedback is =
one thing. Asking
> people
> > to make major changes to their design late in the game is completely no=
t
> > acceptable imho and outright rude. . I=E2=80=99ve been sending out the =
patch
> series
> > with cc to anyone who should remotely care about this stuff. So if majo=
r
> rework
> > is needed it should be pointed out earlier and not later. I=E2=80=99ve =
begged
> people on
> > irc even to take look at this stuff including Igor and others. What els=
e
> do you
> > expect me to do?
> >
> >
> >     If you don't have time to take
> >     it forward then fine
> >
> >
> > I=E2=80=99m extremely discouraged by this and have lost all motivation.=
 It=E2=80=99s not
> that I
> > have no time. I squeeze all my spare time to work on this beyond my pai=
d
> > responsibilities. Please be respectful of that.
> >
>
>
> Woa I hope you'll get the motivation back.
>
> I feel more testing for acpi can only help, even if it is
> limited to specific hosts at the moment.
>
> Let's start small, and build out.
>
> So IMHO major changes aren't strictly necessary to get this merged.
> Alex sent a bunch of code review comments - do you think you can
> address them?


I=E2=80=99ve addressed them in v7.


> The limitations and TODO should just IMHO be mentioned in the
> cover letter and probably in comments in the code.
>
> Thanks!
>
>
> >
> >     but I'm afraid a "take it or leave it" attitude
> >     will just result in it not getting merged.
> >
> >     Hopefully someone else who has the time to look into it will be abl=
e
> to
> >     pick it up later.
> >
> >     --
> >     Alex Benn=C3=A9e
> >
>
>

--000000000000a8e5aa05eba2f81f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Oct 22, 2022 at 22:15 Michael S. Tsirkin &lt;<a hre=
f=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)">On Fri, Oct 21, 2022 at 09:47:04PM +0530, Ani Sinha wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Oct 21, 2022 at 21:36 Alex Benn=C3=A9e &lt;<a href=3D"mailto:a=
lex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt; wro=
te:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" ta=
rget=3D"_blank">ani@anisinha.ca</a>&gt; writes:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;snip&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 We have added a mirror of biosbits to th=
e QEMU project so there is no<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 reason why we can&#39;t track changes an=
d modifications there (we do this<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 for TestFloat which is forked from the u=
pstream SoftFloat code).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The whole idea was that say an acpi developer =
added support for a new<br>
&gt;=C2=A0 =C2=A0 =C2=A0table in QEMU, he should write a corresponding<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; test for bits so that the same table is exerci=
sed during run time. Making<br>
&gt;=C2=A0 =C2=A0 =C2=A0those changes from a single repo (either directly<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; or through a submodule)=C2=A0 makes things lit=
 simpler and also keeps things<br>
&gt;=C2=A0 =C2=A0 =C2=A0in sync with each other. If we use separate<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; repos for acpi bits test, it will be another m=
ess when comes to<br>
&gt;=C2=A0 =C2=A0 =C2=A0developers adding changes and keeping things in syn=
c.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Anyways these things should have been brought =
up earlier. I&#39;m out of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0debate.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I&#39;ve sent v7 , incremental work over the l=
ast 6 months in my spare time<br>
&gt;=C2=A0 =C2=A0 =C2=A0without getting any pay. So take it or scrap it.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =F0=9F=98=8A<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m sorry you feel that way but you asked for p=
eople to spend their time<br>
&gt;=C2=A0 =C2=A0 =C2=A0reviewing your code and giving feedback.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; I=E2=80=99m sorry but you don=E2=80=99t understand. Giving feedback is=
 one thing. Asking people<br>
&gt; to make major changes to their design late in the game is completely n=
ot<br>
&gt; acceptable imho and outright rude. . I=E2=80=99ve been sending out the=
 patch series<br>
&gt; with cc to anyone who should remotely care about this stuff. So if maj=
or rework<br>
&gt; is needed it should be pointed out earlier and not later. I=E2=80=99ve=
 begged people on<br>
&gt; irc even to take look at this stuff including Igor and others. What el=
se do you<br>
&gt; expect me to do?=C2=A0<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0If you don&#39;t have time to take<br>
&gt;=C2=A0 =C2=A0 =C2=A0it forward then fine<br>
&gt; <br>
&gt; <br>
&gt; I=E2=80=99m extremely discouraged by this and have lost all motivation=
. It=E2=80=99s not that I<br>
&gt; have no time. I squeeze all my spare time to work on this beyond my pa=
id<br>
&gt; responsibilities. Please be respectful of that.<br>
&gt; <br>
<br>
<br>
Woa I hope you&#39;ll get the motivation back.<br>
<br>
I feel more testing for acpi can only help, even if it is<br>
limited to specific hosts at the moment.<br>
<br>
Let&#39;s start small, and build out.<br>
<br>
So IMHO major changes aren&#39;t strictly necessary to get this merged.<br>
Alex sent a bunch of code review comments - do you think you can<br>
address them?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I=
=E2=80=99ve addressed them in v7.</div><div dir=3D"auto"><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)" dir=3D"auto"><br>
The limitations and TODO should just IMHO be mentioned in the<br>
cover letter and probably in comments in the code.<br>
<br>
Thanks!<br>
<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0but I&#39;m afraid a &quot;take it or leave it&quot=
; attitude<br>
&gt;=C2=A0 =C2=A0 =C2=A0will just result in it not getting merged.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hopefully someone else who has the time to look int=
o it will be able to<br>
&gt;=C2=A0 =C2=A0 =C2=A0pick it up later.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0Alex Benn=C3=A9e<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000a8e5aa05eba2f81f--

