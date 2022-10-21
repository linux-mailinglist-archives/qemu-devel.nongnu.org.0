Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CF260806E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 22:59:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxCx-0006kx-Fg; Fri, 21 Oct 2022 14:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olui1-0007I7-LU
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:17:23 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oluhx-0000GX-5v
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:17:21 -0400
Received: by mail-io1-xd2f.google.com with SMTP id y80so2709578iof.3
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 09:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fpDhMyo9fAHsgmqrZYJr6GA004fAc+9hkorhhpuIPjw=;
 b=B8xgazacPv25Y8SDaXRDkyQNP4We7MHyhwqeAtrGRrcdeBJlKQ7lcz9Cpl4wyiOJ3G
 83DTA6M8X8HzJwTBv2bOyphpkTFBOXusn8DuHpUNN4AD6Y3kXxMQbYKKIUYcfP1VcoQ1
 TNK2eAUvFQDz4inzJ/5SyVyX5qmD4zCRyBsQP2MWWKpqUVhgdYQPwGRQSkBG7ElCYoWn
 2zJo4rv+F5ELlCIz6zBN84Qf/bRi64fCEwPUhsTWWcU0BJrs1dFcLfFbo6SrBAGxVgd8
 eW7eD6fh8+aVjZhR9VhDE9D11kzxFHn/MAfzGE6p6/9bOTjDcIxoEjTjHER1MF0eWE7T
 iW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fpDhMyo9fAHsgmqrZYJr6GA004fAc+9hkorhhpuIPjw=;
 b=H27GeO4hbwSHU3MVK/xWL4bbAtK1qDUgUNMsnECCY8ai5zmKShHkVCdCWVkDseCDyC
 T9nohn46tzOP0CsHKbrvybD4fAxUGsXSXtPxpdF/GURhQsn/7Yg3ft/J/G+820dDHc5/
 X8psxOkYHnkPq2WCOUVfqIGJ8QIdGQOl2KJaDh2h6sbZcLcOGhCNm04knqnw++Hubbos
 V4KVdckQYWYpeo3Wv+eKPGV5UqcCG30XiL/sIoebQU43u/AfPgBT3rhX8dVTksl43YYW
 vQ/viUIDFyz35szZf6DFVw24g17Fol+2Lfw7RzNEtuCu0RRRqPPxofsEHMbQ0fiPqwbA
 c3Sg==
X-Gm-Message-State: ACrzQf2I+5lQevQFPtY2HP4gO3/UJAhAQBUmRbFNa6eS0lzEMjtJ43qP
 U874MXDIQvUrb9UULdBHjUY2cBff122POEtxoeKhZg==
X-Google-Smtp-Source: AMsMyM6iDH1sRqunI0RRQN8t3kefu6bQScAwaDYyU/YRqjQ8b9QzFseu8jvWOWkDMq88Q2Iyn5xLfw6qmygtzaIHcsI=
X-Received: by 2002:a05:6602:346:b0:6bb:f236:ae68 with SMTP id
 w6-20020a056602034600b006bbf236ae68mr13378257iou.161.1666369035679; Fri, 21
 Oct 2022 09:17:15 -0700 (PDT)
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
 <CAARzgwya9jw3YmAwHcSbzzTUewFcq8JR_hVM+=-cSePfyxO1CQ@mail.gmail.com>
 <87lep95ffx.fsf@linaro.org>
In-Reply-To: <87lep95ffx.fsf@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 21 Oct 2022 21:47:04 +0530
Message-ID: <CAARzgwyEWCNbs5HG07Dnv_pkzmHwB++Pr47enZ_uFupXZSH09g@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>, 
 Maydell Peter <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006fdb8605eb8dc601"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000006fdb8605eb8dc601
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2022 at 21:36 Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

>
> Ani Sinha <ani@anisinha.ca> writes:
>
> <snip>
> >
> >  We have added a mirror of biosbits to the QEMU project so there is no
> >  reason why we can't track changes and modifications there (we do this
> >  for TestFloat which is forked from the upstream SoftFloat code).
> >
> > The whole idea was that say an acpi developer added support for a new
> table in QEMU, he should write a corresponding
> > test for bits so that the same table is exercised during run time.
> Making those changes from a single repo (either directly
> > or through a submodule)  makes things lit simpler and also keeps things
> in sync with each other. If we use separate
> > repos for acpi bits test, it will be another mess when comes to
> developers adding changes and keeping things in sync.
> >
> > Anyways these things should have been brought up earlier. I'm out of th=
e
> debate.
> >
> > I've sent v7 , incremental work over the last 6 months in my spare time
> without getting any pay. So take it or scrap it.
> >
> > =F0=9F=98=8A
>
> I'm sorry you feel that way but you asked for people to spend their time
> reviewing your code and giving feedback.



I=E2=80=99m sorry but you don=E2=80=99t understand. Giving feedback is one =
thing. Asking
people to make major changes to their design late in the game is completely
not acceptable imho and outright rude. . I=E2=80=99ve been sending out the =
patch
series with cc to anyone who should remotely care about this stuff. So if
major rework is needed it should be pointed out earlier and not later. I=E2=
=80=99ve
begged people on irc even to take look at this stuff including Igor and
others. What else do you expect me to do?

If you don't have time to take
> it forward then fine


I=E2=80=99m extremely discouraged by this and have lost all motivation. It=
=E2=80=99s not
that I have no time. I squeeze all my spare time to work on this beyond my
paid responsibilities. Please be respectful of that.


but I'm afraid a "take it or leave it" attitude
> will just result in it not getting merged.
>
> Hopefully someone else who has the time to look into it will be able to
> pick it up later.
>
> --
> Alex Benn=C3=A9e
>

--0000000000006fdb8605eb8dc601
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 21, 2022 at 21:36 Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)"><br>
Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_blank">ani@anis=
inha.ca</a>&gt; writes:<br>
<br>
&lt;snip&gt;<br>
&gt;<br>
&gt;=C2=A0 We have added a mirror of biosbits to the QEMU project so there =
is no<br>
&gt;=C2=A0 reason why we can&#39;t track changes and modifications there (w=
e do this<br>
&gt;=C2=A0 for TestFloat which is forked from the upstream SoftFloat code).=
<br>
&gt;<br>
&gt; The whole idea was that say an acpi developer added support for a new =
table in QEMU, he should write a corresponding<br>
&gt; test for bits so that the same table is exercised during run time. Mak=
ing those changes from a single repo (either directly<br>
&gt; or through a submodule)=C2=A0 makes things lit simpler and also keeps =
things in sync with each other. If we use separate<br>
&gt; repos for acpi bits test, it will be another mess when comes to develo=
pers adding changes and keeping things in sync. <br>
&gt;<br>
&gt; Anyways these things should have been brought up earlier. I&#39;m out =
of the debate. <br>
&gt;<br>
&gt; I&#39;ve sent v7 , incremental work over the last 6 months in my spare=
 time without getting any pay. So take it or scrap it. <br>
&gt;<br>
&gt; =F0=9F=98=8A<br>
<br>
I&#39;m sorry you feel that way but you asked for people to spend their tim=
e<br>
reviewing your code and giving feedback. </blockquote><div dir=3D"auto"><br=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">I=E2=80=99m sorry but =
you don=E2=80=99t understand. Giving feedback is one thing. Asking people t=
o make major changes to their design late in the game is completely not acc=
eptable imho and outright rude. . I=E2=80=99ve been sending out the patch s=
eries with cc to anyone who should remotely care about this stuff. So if ma=
jor rework is needed it should be pointed out earlier and not later. I=E2=
=80=99ve begged people on irc even to take look at this stuff including Igo=
r and others. What else do you expect me to do?=C2=A0</div><div dir=3D"auto=
"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-=
left-color:rgb(204,204,204)" dir=3D"auto">If you don&#39;t have time to tak=
e<br>
it forward then fine</blockquote><div dir=3D"auto"><br></div><div dir=3D"au=
to">I=E2=80=99m extremely discouraged by this and have lost all motivation.=
 It=E2=80=99s not that I have no time. I squeeze all my spare time to work =
on this beyond my paid responsibilities. Please be respectful of that.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" =
dir=3D"auto"> but I&#39;m afraid a &quot;take it or leave it&quot; attitude=
<br>
will just result in it not getting merged.<br>
<br>
Hopefully someone else who has the time to look into it will be able to<br>
pick it up later.<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div>

--0000000000006fdb8605eb8dc601--

