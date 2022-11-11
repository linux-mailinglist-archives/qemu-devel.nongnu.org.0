Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC7E625D74
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:48:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVJA-0002KZ-OS; Fri, 11 Nov 2022 09:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otVIi-0002IZ-Lj
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:46:38 -0500
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otVIg-0005kr-NK
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:46:36 -0500
Received: by mail-il1-x12f.google.com with SMTP id e19so2628438ili.4
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 06:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bR6rDXFJZ1s0DfMp5cLjFXNannHrgHxaDUGePZnAJy8=;
 b=oy15JxDcW3vzRJwJbswldhjDbPr+gR2C2tA4ttYxt56Ecc3CG5i9RJpSXLTLtpWEJm
 Zcv80LnjD66aUekw2U31KPo0xjFxHbKUUw/ZgG8FApabmHuHK+qrj3I10udl4K34qeHj
 O2r+3pqXWZtvpJg89/Tm4ebFoP9NlghCSr4mBDSDQ7PUGt1W3zhVwKUCTmrOlPLHXB25
 46WCW5rjXPrEfz+0fXYwSc9gPIEQfndGnW45H7+rrrwaxXmZc7i0/5UAHY651HdENLqJ
 oSs7CEbhobTSDXYXSKIYDYDtXFvFDmlZGuIlHyOrcVokyyc3uJWW1VGYekSwBTcHaPyM
 izAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bR6rDXFJZ1s0DfMp5cLjFXNannHrgHxaDUGePZnAJy8=;
 b=5VnZS9jW0gPGyQm/mQw/IWwSgtUzi7PSUtP/LFRaIsKOBzJSrdsJibCcrKuZDUsLvH
 R0T0jtJOIyuCt0Jtwb8YgWUAU0gCJ2HRzTqgyAofFerzQDsI8dx61XiroS1Rs3n3NX0O
 7qlPlchZiRlw9dVXqJoQ0JMprhwALN4LMhDlMufdhkvFJBeutv1b15y/Pvt92aMxAcwn
 Fn1Zj/kAFl730HQ8jRnWcUuYd7I8Qv5IEatkXFvnOssp62mPEiPg3C+USeT5xxPD5ljf
 JXvkcp5kre4x6xIctxsi0R2vTT5SEN6JuVEaY6LcIhRHPENRT9lmKvUAtsJczmLnKjhR
 y36g==
X-Gm-Message-State: ANoB5pk5IqWCJOzuYUgnLxuvLCxFBwkBxP8A7eWchAph9scnuTGCBj3p
 hOy0cVi8t8drLskci92hzckOwTE0KhV7FvzcGqAGQA==
X-Google-Smtp-Source: AA0mqf54o4Kt487vbLO3DtmCdismQx3sz4rurlWLajQfdZln2xDoVQTLYoLo1X0kICWvBVpq1/OdZX/CW8e6dpWrq0Q=
X-Received: by 2002:a92:c745:0:b0:2f9:8a1e:914b with SMTP id
 y5-20020a92c745000000b002f98a1e914bmr1199108ilp.259.1668177993117; Fri, 11
 Nov 2022 06:46:33 -0800 (PST)
MIME-Version: 1.0
References: <20221111123108.1231451-1-ani@anisinha.ca>
 <20221111093255-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221111093255-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 11 Nov 2022 20:16:22 +0530
Message-ID: <CAARzgwxDEwMNqxH9Q9Otf3Tn6ZUUJ2onJKNQJ3iUzmAimGAA7A@mail.gmail.com>
Subject: Re: [PATCH v2] acpi/tests/avocado/bits: some misc fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org, 
 qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b3cc8c05ed32f42b"
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000b3cc8c05ed32f42b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2022 at 20:05 Michael S. Tsirkin <mst@redhat.com> wrote:

> On Fri, Nov 11, 2022 at 06:01:08PM +0530, Ani Sinha wrote:
> > Most of the changes are trivial. The bits test timeout has now been
> increased
> > to 110 seconds in order to accommodate slower systems and fewer
> unnecessary
> > failures. Removed of the reference to non-existent README file in docs.
> >
> > CC: Thomas Huth <thuth@redhat.com>
> > CC: qemu-trivial@nongnu.org
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
>
> You need to pick a tree through which work on these
> will be merged.
> If it's my pc/pci tree you need to add that to MAINTAINERS
> so I get to see the patches.


Adding you to MAINTAINERS should be enough right?


>
>
> > ---
> >  changed from v1: address Thomas' suggestions.
> >
> >  docs/devel/acpi-bits.rst   | 7 +++----
> >  tests/avocado/acpi-bits.py | 5 +++--
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
> > index c9564d871a..2c776ab166 100644
> > --- a/docs/devel/acpi-bits.rst
> > +++ b/docs/devel/acpi-bits.rst
> > @@ -38,10 +38,9 @@ Under ``tests/avocado/`` as the root we have:
> >     =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 bits-config
> >     =E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 bits-cfg.txt
> >     =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 bits-tests
> > -   =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 smbios.py2
> > -   =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 testacpi.py2
> > -   =E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 testcpuid.py2
> > -   =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 README
> > +   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 smbios.py2
> > +   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 testacpi.py2
> > +   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 testcpuid.py2
> >     =E2=94=9C=E2=94=80=E2=94=80 acpi-bits.py
> >
> >  * ``tests/avocado``:
> > diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> > index 8745a58a76..2edc36fc26 100644
> > --- a/tests/avocado/acpi-bits.py
> > +++ b/tests/avocado/acpi-bits.py
> > @@ -385,8 +385,9 @@ def test_acpi_smbios_bits(self):
> >          self._vm.launch()
> >          # biosbits has been configured to run all the specified test
> suites
> >          # in batch mode and then automatically initiate a vm shutdown.
> > -        # sleep for maximum of one minute
> > -        max_sleep_time =3D time.monotonic() + 60
> > +        # sleep for maximum of a minute and 50 seconds in order to
> accommodate
> > +        # even slower test setups.
> > +        max_sleep_time =3D time.monotonic() + 110
> >          while self._vm.is_running() and time.monotonic() <
> max_sleep_time:
> >              time.sleep(1)
> >
> > --
> > 2.34.1
> >
> >
> >
>
>

--000000000000b3cc8c05ed32f42b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Nov 11, 2022 at 20:05 Michael S. Tsirkin &lt;<a hre=
f=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)">On Fri, Nov 11, 2022 at 06:01:08PM +0530, Ani Sinha wrote:<br>
&gt; Most of the changes are trivial. The bits test timeout has now been in=
creased<br>
&gt; to 110 seconds in order to accommodate slower systems and fewer unnece=
ssary<br>
&gt; failures. Removed of the reference to non-existent README file in docs=
.<br>
&gt; <br>
&gt; CC: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_bla=
nk">thuth@redhat.com</a>&gt;<br>
&gt; CC: <a href=3D"mailto:qemu-trivial@nongnu.org" target=3D"_blank">qemu-=
trivial@nongnu.org</a><br>
&gt; Signed-off-by: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=
=3D"_blank">ani@anisinha.ca</a>&gt;<br>
<br>
You need to pick a tree through which work on these<br>
will be merged.<br>
If it&#39;s my pc/pci tree you need to add that to MAINTAINERS<br>
so I get to see the patches.</blockquote><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Adding you to MAINTAINERS should be enough right?=C2=A0</div><d=
iv dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-le=
ft:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
<br>
&gt; ---<br>
&gt;=C2=A0 changed from v1: address Thomas&#39; suggestions.<br>
&gt; <br>
&gt;=C2=A0 docs/devel/acpi-bits.rst=C2=A0 =C2=A0| 7 +++----<br>
&gt;=C2=A0 tests/avocado/acpi-bits.py | 5 +++--<br>
&gt;=C2=A0 2 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst<br>
&gt; index c9564d871a..2c776ab166 100644<br>
&gt; --- a/docs/devel/acpi-bits.rst<br>
&gt; +++ b/docs/devel/acpi-bits.rst<br>
&gt; @@ -38,10 +38,9 @@ Under ``tests/avocado/`` as the root we have:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 bits-config<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 bit=
s-cfg.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 bits-tests<br=
>
&gt; -=C2=A0 =C2=A0=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 smbios.p=
y2<br>
&gt; -=C2=A0 =C2=A0=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 testacpi=
.py2<br>
&gt; -=C2=A0 =C2=A0=E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 testcpui=
d.py2<br>
&gt; -=C2=A0 =C2=A0=E2=94=82 =E2=94=94=E2=94=80=E2=94=80 README<br>
&gt; +=C2=A0 =C2=A0=E2=94=82=C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 smbios=
.py2<br>
&gt; +=C2=A0 =C2=A0=E2=94=82=C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 testac=
pi.py2<br>
&gt; +=C2=A0 =C2=A0=E2=94=82=C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=94=80 testcp=
uid.py2<br>
&gt;=C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 acpi-bits.py<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 * ``tests/avocado``:<br>
&gt; diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py<b=
r>
&gt; index 8745a58a76..2edc36fc26 100644<br>
&gt; --- a/tests/avocado/acpi-bits.py<br>
&gt; +++ b/tests/avocado/acpi-bits.py<br>
&gt; @@ -385,8 +385,9 @@ def test_acpi_smbios_bits(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._vm.launch()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # biosbits has been configured to ru=
n all the specified test suites<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # in batch mode and then automatical=
ly initiate a vm shutdown.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # sleep for maximum of one minute<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_sleep_time =3D time.monotonic() + 60<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # sleep for maximum of a minute and 50 se=
conds in order to accommodate<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # even slower test setups.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_sleep_time =3D time.monotonic() + 110=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while self._vm.is_running() and time=
.monotonic() &lt; max_sleep_time:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(1)<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000b3cc8c05ed32f42b--

