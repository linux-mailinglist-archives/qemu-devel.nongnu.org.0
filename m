Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0D360830B
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 03:09:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om2qg-0006Ih-2Y; Fri, 21 Oct 2022 20:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1om2qe-0006Ia-Ee
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 20:58:48 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1om2qc-0000RQ-4u
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 20:58:48 -0400
Received: by mail-io1-xd35.google.com with SMTP id 137so3664328iou.9
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 17:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PJ6eZHB6746uG0WAldJ7HMhbbZscVcLsoMX1u1kbLBM=;
 b=2cxg0oCG/H2lgr5Aty51n0Sn+2eUOSWcw6cok/KW2ZDckAxfATZGGfSL8f0fFgxUh/
 XWyyyyg0W2BaHvtBGKRNjwz3XHdkyhKsUfjM2VEe9gO9wuFD+p9K+duCmy66qowly4vK
 exvbBWr7gk7C3lsZeO1vGmQZYwEbOahz0bSD/iYDHJznTLiHY+3mdEoW7Uz4Z2/wwcfw
 0Nf6Mp91FEEwuP8iNtLNJRCJW99xlgqp5OY9Ewlt00eTY1luI+IP3UHK2lut+yy69t/e
 ZQdAztwT6RfeqdZVP/xhNmcnC3bKg+XsXWb8Q9sCouyDSVhcXZCrpODMKc0vHcq8kekO
 n7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PJ6eZHB6746uG0WAldJ7HMhbbZscVcLsoMX1u1kbLBM=;
 b=XY6t6j/kmOaFDfrW68PlJuWLkoAefuBChKBYY45azroYr+I7u58TNgBhvivzKk+6OA
 MEbn2HQzYwuRl4En+8WI+rlgGbsvahOQfU/DZP07csRRLgFHGcp+O5317vwpyONcWS3o
 zmqnrhx9VwoPScYgzA2JSefYF1zamN9VSIcx/o93fClkJchTLLzEAY2Ok8DaQF/inHAz
 cXE5y2pNoewjExvIrky7/dXfLPpTEYN2ocVQQcJyx1fQuChOibrWlaUeq//n8MtPOr7l
 bNt04eKBiCKwXHsJPNdo3929YUL7A9SdxUkvYDW9sUHVOqON9G5ZISu1nIfyoOivhE6A
 yleg==
X-Gm-Message-State: ACrzQf2oahxVsbcbhr9R6ZhUTaK+y1Tj/SViSQxTAIuItAZ6d408dqjl
 CqUJ8aKh1AUraGdkLSbu6xPh5wmeyfmutaESuVtFdg==
X-Google-Smtp-Source: AMsMyM7XPXl/ogj+OmQJmgmF8mTuM46iNPvGK2vMCe8IcMu5fRqwmyBQqSAaCoFF4CUImoV2j4rKtPL+Q4iGrP/U518=
X-Received: by 2002:a5d:9f4e:0:b0:6bb:6d59:8b72 with SMTP id
 u14-20020a5d9f4e000000b006bb6d598b72mr14809862iot.28.1666400324037; Fri, 21
 Oct 2022 17:58:44 -0700 (PDT)
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
 <CAARzgwy8iEDxet6bHxe4AqU=9qQfC=pk=QWoLdF+rz61T1+bMQ@mail.gmail.com>
 <87pmel5fm7.fsf@linaro.org>
In-Reply-To: <87pmel5fm7.fsf@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Sat, 22 Oct 2022 06:28:32 +0530
Message-ID: <CAARzgwygyiK7FZppZEczHV3p8yz43N2v9-hL374mrNPWowDWXg@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="0000000000005e44a305eb950f06"
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd35.google.com
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

--0000000000005e44a305eb950f06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2022 at 21:32 Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

>
> Ani Sinha <ani@anisinha.ca> writes:
>
> > On Fri, 21 Oct, 2022, 5:52 pm Ani Sinha, <ani@anisinha.ca> wrote:
> >
> >  On Fri, 21 Oct, 2022, 5:26 pm Alex Benn=C3=A9e, <alex.bennee@linaro.or=
g>
> wrote:
> >
> >  Ani Sinha <ani@anisinha.ca> writes:
> >
> >  > On Fri, Oct 21, 2022 at 3:10 PM Michael S. Tsirkin <mst@redhat.com>
> wrote:
> >  >>
> >  >> On Fri, Oct 21, 2022 at 10:30:09AM +0100, Alex Benn=C3=A9e wrote:
> >  >> >
> >  >> > Ani Sinha <ani@anisinha.ca> writes:
> >  >> >
> >  >> > > On Fri, Oct 21, 2022 at 2:02 PM Michael S. Tsirkin <
> mst@redhat.com> wrote:
> >  >> > >>
> >  >> > >> On Fri, Oct 21, 2022 at 05:45:15AM +0530, Ani Sinha wrote:
> >  >> > >> > And have multiple platform specific branches in bits that
> have fixes for those
> >  >> > >> > platforms so that bits can run there. Plus the existing test
> can be enhanced to
> >  >> > >> > pull in binaries from those branches based on the platform o=
n
> which it is being
> >  >> > >> > run.
> >  >> > >> >
> >  >> > >>
> >  >> > >> What a mess.
> >  >> > >> Who is going to be testing all these million platforms?
> >  >> > >
> >  >> > > I am not talking about branches in QEMU but branches in bits.
> >  >> > > If you are going to test multiple platforms, you do need to
> build bits
> >  >> > > binaries for them. There is no way around it.
> >  >> > > bits is not all platform independent python. It does have binar=
y
> executables.
> >  >> > >
> >  >> > > Currently bits is built only for the x86 platform. Other
> platforms are
> >  >> > > not tested. I doubt if anyone even tried building bits for arm =
or
> >  >> > > mips.
> >  >> >
> >  >> > I'm not worried about test bits on other targets, but we do run x=
86
> >  >> > targets on a number of hosts. The current reliance on a special
> patched
> >  >> > host build tool for only one architecture is the problem. If  we
> just
> >  >> > download the iso that problem goes away.
> >  >>
> >  >> =F0=9F=91=8Dwhat he said.
> >  >
> >  > Yes, in that case the problem is that upstream bits does not pass al=
l
> >  > the test out of the box. Hence we are taking this approach of keepin=
g
> >  > some test scripts in QEMU repo and modifying them. Then generating t=
he
> >  > iso with the modified scripts. It also helps developers who want to
> >  > write new tests or make enhancements to existing tests.
> >  > If modifications need to be made to tests, they need to be versioned=
.
> >  > We have gone through the route of not using submodules and I am not
> >  > going to open that can of worms again.
> >
> >  We have added a mirror of biosbits to the QEMU project so there is no
> >  reason why we can't track changes and modifications there (we do this
> >  for TestFloat which is forked from the upstream SoftFloat code).


One last option. Commit this patch set but also double commit patch 3 to
the bits repo so that we can build an iso that would successfully run all
tests for a separate platform independent test to be written later.

Then we will have two tests:

- this one for developers writing new test.
- platform independent one for a basic sanity.

I=E2=80=99m just documenting the fact that I have proposed ideas that can w=
ork
where all can be happy. It=E2=80=99s up to others to take it or keep object=
ing and
killing motivations for freelance contributors.



> >
> >

--0000000000005e44a305eb950f06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 21, 2022 at 21:32 Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)"><br>
Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_blank">ani@anis=
inha.ca</a>&gt; writes:<br>
<br>
&gt; On Fri, 21 Oct, 2022, 5:52 pm Ani Sinha, &lt;<a href=3D"mailto:ani@ani=
sinha.ca" target=3D"_blank">ani@anisinha.ca</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 On Fri, 21 Oct, 2022, 5:26 pm Alex Benn=C3=A9e, &lt;<a href=3D"m=
ailto:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&=
gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_blan=
k">ani@anisinha.ca</a>&gt; writes:<br>
&gt;<br>
&gt;=C2=A0 &gt; On Fri, Oct 21, 2022 at 3:10 PM Michael S. Tsirkin &lt;<a h=
ref=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrot=
e:<br>
&gt;=C2=A0 &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; On Fri, Oct 21, 2022 at 10:30:09AM +0100, Alex Benn=C3=
=A9e wrote:<br>
&gt;=C2=A0 &gt;&gt; &gt;<br>
&gt;=C2=A0 &gt;&gt; &gt; Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" t=
arget=3D"_blank">ani@anisinha.ca</a>&gt; writes:<br>
&gt;=C2=A0 &gt;&gt; &gt;<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt; On Fri, Oct 21, 2022 at 2:02 PM Michael S. Ts=
irkin &lt;<a href=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.co=
m</a>&gt; wrote:<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; On Fri, Oct 21, 2022 at 05:45:15AM +0530,=
 Ani Sinha wrote:<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; &gt; And have multiple platform specific =
branches in bits that have fixes for those<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; &gt; platforms so that bits can run there=
. Plus the existing test can be enhanced to<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; &gt; pull in binaries from those branches=
 based on the platform on which it is being<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; &gt; run.<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; What a mess.<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; Who is going to be testing all these mill=
ion platforms?<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt; I am not talking about branches in QEMU but b=
ranches in bits.<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt; If you are going to test multiple platforms, =
you do need to build bits<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt; binaries for them. There is no way around it.=
<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt; bits is not all platform independent python. =
It does have binary executables.<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt; Currently bits is built only for the x86 plat=
form. Other platforms are<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt; not tested. I doubt if anyone even tried buil=
ding bits for arm or<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt; mips.<br>
&gt;=C2=A0 &gt;&gt; &gt;<br>
&gt;=C2=A0 &gt;&gt; &gt; I&#39;m not worried about test bits on other targe=
ts, but we do run x86<br>
&gt;=C2=A0 &gt;&gt; &gt; targets on a number of hosts. The current reliance=
 on a special patched<br>
&gt;=C2=A0 &gt;&gt; &gt; host build tool for only one architecture is the p=
roblem. If=C2=A0 we just<br>
&gt;=C2=A0 &gt;&gt; &gt; download the iso that problem goes away.<br>
&gt;=C2=A0 &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; =F0=9F=91=8Dwhat he said.<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; Yes, in that case the problem is that upstream bits does no=
t pass all<br>
&gt;=C2=A0 &gt; the test out of the box. Hence we are taking this approach =
of keeping<br>
&gt;=C2=A0 &gt; some test scripts in QEMU repo and modifying them. Then gen=
erating the<br>
&gt;=C2=A0 &gt; iso with the modified scripts. It also helps developers who=
 want to<br>
&gt;=C2=A0 &gt; write new tests or make enhancements to existing tests.<br>
&gt;=C2=A0 &gt; If modifications need to be made to tests, they need to be =
versioned.<br>
&gt;=C2=A0 &gt; We have gone through the route of not using submodules and =
I am not<br>
&gt;=C2=A0 &gt; going to open that can of worms again.<br>
&gt;<br>
&gt;=C2=A0 We have added a mirror of biosbits to the QEMU project so there =
is no<br>
&gt;=C2=A0 reason why we can&#39;t track changes and modifications there (w=
e do this<br>
&gt;=C2=A0 for TestFloat which is forked from the upstream SoftFloat code).=
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">One last option.=
 Commit this patch set but also double commit patch 3 to the bits repo so t=
hat we can build an iso that would successfully run all tests for a separat=
e platform independent test to be written later.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Then we will have two tests:</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">- this one for developers writing new test.</=
div><div dir=3D"auto">- platform independent one for a basic sanity.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">I=E2=80=99m just documenting t=
he fact that I have proposed ideas that can work where all can be happy. It=
=E2=80=99s up to others to take it or keep objecting and killing motivation=
s for freelance contributors.=C2=A0</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1=
ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
&gt;<br>
&gt;=C2=A0</blockquote></div></div>

--0000000000005e44a305eb950f06--

