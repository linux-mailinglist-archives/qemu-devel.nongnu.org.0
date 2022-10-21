Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD4C6078CE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 15:44:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olsKJ-0006zQ-9D
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:44:44 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrqG-0000cz-MY
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olrq7-0008HB-4b
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:13:31 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olrq4-0001i6-PS
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:13:30 -0400
Received: by mail-io1-xd2e.google.com with SMTP id n73so2203021iod.13
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 06:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rA+Ucv7C6givlHvD6KZSvs/aYnF1dUVnwTDdsXTu4hQ=;
 b=f7Nu2GoEasB2cbb5msFN6zQLGFiF7Xrfr6elI3Ae5NDd9cOSKTalNJrIJ9wumGErx0
 A261wypBfjDIgimsmXoMe2JbkC5vyY7KxJXuhypZ7e/0wQxmQe7JoRDFS8zWNuHBV9ZK
 sAsb+QtWc2XGLRI0i20iwjO2YKJBtzPhccXMx20kUvTdmsdiYNlGeXXTJiyw1L384W1o
 qqkEax9WiU+cFy+BLd2lI+VejBAuPdY0+KGePOZUe+yInPRkWCZJCIiH3falVdbaulut
 HQxU7GH+Vk198KndgBunRB5FgLQz6R8i0PROtYTc7t7JOpKrvRx/ltdruujKitq47WRZ
 XctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rA+Ucv7C6givlHvD6KZSvs/aYnF1dUVnwTDdsXTu4hQ=;
 b=1jpZH2fyJnP1gpp522Pp7k3Tm4mfrLe+Y5Chv950zQykA6cAZB9ecVE2qVg4ZxZrGZ
 ax+NQyM23C6a4L6eemEzH8VVJrVhoNywl8rYUlaGEKZoHxx9/oiZpinAv68bRQWODmyn
 suvsxBTgoLRFfNUWbvZfB4W86wPQTxUDWhWMNxSPtR4yweOwDIOj/x6QS5kEp6KaHHFC
 z0Pty7pcBCvs/gyBUPPmhjLTMqMpo63vKYyL2Giai/Vk5XyNo/FJ8SrYm0Q1LudiPWIp
 FvE/7v/CKZsLhc/gIWllqIeWvk+8dL2YQWTO6LPKpZVGsORNJ86GeIYfGHsGkdZ3LCRN
 qcbA==
X-Gm-Message-State: ACrzQf3g9MR6Gj6knH3dGQsMmHR+cwhUgxfYML0i5VARSRhDFwYPw0y9
 LGOGMdIe6inANbaR3fwzY4BULjjomV6H7V50nT2+5g==
X-Google-Smtp-Source: AMsMyM5KoziY80bZhT7hmxVeCrMKyOjTWseuh1KarLOF5KBsr5Esso2ha6TVI8SbJZGVxRMBXYPrV0CDDdnrnvK0N5g=
X-Received: by 2002:a02:cc55:0:b0:364:ef:c546 with SMTP id
 i21-20020a02cc55000000b0036400efc546mr13654230jaq.265.1666358007444; 
 Fri, 21 Oct 2022 06:13:27 -0700 (PDT)
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
In-Reply-To: <CAARzgwya9jw3YmAwHcSbzzTUewFcq8JR_hVM+=-cSePfyxO1CQ@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 21 Oct 2022 18:43:14 +0530
Message-ID: <CAARzgwy8iEDxet6bHxe4AqU=9qQfC=pk=QWoLdF+rz61T1+bMQ@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="0000000000001a4f1d05eb8b35a6"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2e.google.com
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

--0000000000001a4f1d05eb8b35a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Oct, 2022, 5:52 pm Ani Sinha, <ani@anisinha.ca> wrote:

>
>
> On Fri, 21 Oct, 2022, 5:26 pm Alex Benn=C3=A9e, <alex.bennee@linaro.org> =
wrote:
>
>>
>> Ani Sinha <ani@anisinha.ca> writes:
>>
>> > On Fri, Oct 21, 2022 at 3:10 PM Michael S. Tsirkin <mst@redhat.com>
>> wrote:
>> >>
>> >> On Fri, Oct 21, 2022 at 10:30:09AM +0100, Alex Benn=C3=A9e wrote:
>> >> >
>> >> > Ani Sinha <ani@anisinha.ca> writes:
>> >> >
>> >> > > On Fri, Oct 21, 2022 at 2:02 PM Michael S. Tsirkin <mst@redhat.co=
m>
>> wrote:
>> >> > >>
>> >> > >> On Fri, Oct 21, 2022 at 05:45:15AM +0530, Ani Sinha wrote:
>> >> > >> > And have multiple platform specific branches in bits that have
>> fixes for those
>> >> > >> > platforms so that bits can run there. Plus the existing test
>> can be enhanced to
>> >> > >> > pull in binaries from those branches based on the platform on
>> which it is being
>> >> > >> > run.
>> >> > >> >
>> >> > >>
>> >> > >> What a mess.
>> >> > >> Who is going to be testing all these million platforms?
>> >> > >
>> >> > > I am not talking about branches in QEMU but branches in bits.
>> >> > > If you are going to test multiple platforms, you do need to build
>> bits
>> >> > > binaries for them. There is no way around it.
>> >> > > bits is not all platform independent python. It does have binary
>> executables.
>> >> > >
>> >> > > Currently bits is built only for the x86 platform. Other platform=
s
>> are
>> >> > > not tested. I doubt if anyone even tried building bits for arm or
>> >> > > mips.
>> >> >
>> >> > I'm not worried about test bits on other targets, but we do run x86
>> >> > targets on a number of hosts. The current reliance on a special
>> patched
>> >> > host build tool for only one architecture is the problem. If  we ju=
st
>> >> > download the iso that problem goes away.
>> >>
>> >> =F0=9F=91=8Dwhat he said.
>> >
>> > Yes, in that case the problem is that upstream bits does not pass all
>> > the test out of the box. Hence we are taking this approach of keeping
>> > some test scripts in QEMU repo and modifying them. Then generating the
>> > iso with the modified scripts. It also helps developers who want to
>> > write new tests or make enhancements to existing tests.
>> > If modifications need to be made to tests, they need to be versioned.
>> > We have gone through the route of not using submodules and I am not
>> > going to open that can of worms again.
>>
>> We have added a mirror of biosbits to the QEMU project so there is no
>> reason why we can't track changes and modifications there (we do this
>> for TestFloat which is forked from the upstream SoftFloat code).
>>
>
> The whole idea was that say an acpi developer added support for a new
> table in QEMU, he should write a corresponding test for bits so that the
> same table is exercised during run time. Making those changes from a sing=
le
> repo (either directly or through a submodule)  makes things lit simpler a=
nd
> also keeps things in sync with each other. If we use separate repos for
> acpi bits test, it will be another mess when comes to developers adding
> changes and keeping things in sync.
>

Not only this. let's look at the developers workflow.

(A) check out bits repo.
(B) write new test.
(C) build the bits iso.
(D) get back to QEMU repo.
(E) point the test to the new iso so that the test gets executed.
(F) oops something failed. So let's rinse and repeat.
(G) once ready, send a PR for bits repo. update tags and figure out how
gitlab ci works so that the QEMU test can point to it. To do that figure
out the artefact  hash and other parameters.
(H) send a patch for QEMU repo to update the test to point to new iso.


How complicated is that? How complicated will it be for the reviewer? Right
now the developer can simply make changes from a single repo and run a
avocado test and check logs for failures. Once test is fixed, they can run
the test again to make sure everything passes. Once done, commit the test
in QEMU repo. If the test exercises a new table we make sure that the
commits adding the new table is already present before the test that
exercises it is committed. Send a patch for review. The reviewer applies
the patch and simply runs the avocado test from QEMU repo. Everything is in
one place. No back and forth between two repos. A lot like "make check".

--0000000000001a4f1d05eb8b35a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 21 Oct, 2022, 5:52 pm Ani Sinha, &lt;<a href=
=3D"mailto:ani@anisinha.ca">ani@anisinha.ca</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"auto"><div><br><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 21 Oct, 2022, 5:26 pm =
Alex Benn=C3=A9e, &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=3D"_=
blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><br>
Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" rel=3D"noreferrer noreferr=
er" target=3D"_blank">ani@anisinha.ca</a>&gt; writes:<br>
<br>
&gt; On Fri, Oct 21, 2022 at 3:10 PM Michael S. Tsirkin &lt;<a href=3D"mail=
to:mst@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">mst@redh=
at.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Oct 21, 2022 at 10:30:09AM +0100, Alex Benn=C3=A9e wrote:<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" rel=3D"noref=
errer noreferrer" target=3D"_blank">ani@anisinha.ca</a>&gt; writes:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; On Fri, Oct 21, 2022 at 2:02 PM Michael S. Tsirkin &lt;<=
a href=3D"mailto:mst@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">mst@redhat.com</a>&gt; wrote:<br>
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
ng things in sync.=C2=A0</div></div></blockquote></div></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Not only this. let&#39;s look at the develo=
pers workflow.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(A) check=
 out bits repo.</div><div dir=3D"auto">(B) write new test.</div><div dir=3D=
"auto">(C) build the bits iso.</div><div dir=3D"auto">(D) get back to QEMU =
repo.</div><div dir=3D"auto">(E) point the test to the new iso so that the =
test gets executed.</div><div dir=3D"auto">(F) oops something failed. So le=
t&#39;s rinse and repeat.</div><div dir=3D"auto">(G) once ready, send a PR =
for bits repo. update tags and figure out how gitlab ci works so that the Q=
EMU test can point to it. To do that figure out the artefact=C2=A0 hash and=
 other parameters.</div><div dir=3D"auto">(H) send a patch for QEMU repo to=
 update the test to point to new iso.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">How complicated is that? How comp=
licated will it be for the reviewer? Right now the developer can simply mak=
e changes from a single repo and run a avocado test and check logs for fail=
ures. Once test is fixed, they can run the test again to make sure everythi=
ng passes. Once done, commit the test in QEMU repo. If the test exercises a=
 new table we make sure that the commits adding the new table is already pr=
esent before the test that exercises it is committed. Send a patch for revi=
ew. The reviewer applies the patch and simply runs the avocado test from QE=
MU repo. Everything is in one place. No back and forth between two repos. A=
 lot like &quot;make check&quot;.=C2=A0</div><div dir=3D"auto"><br></div></=
div>

--0000000000001a4f1d05eb8b35a6--

