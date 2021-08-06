Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F173E3096
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 22:54:00 +0200 (CEST)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC6qt-0000ps-8f
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 16:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mC6pE-0007ab-I8
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 16:52:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mC6pB-0007Lh-EU
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 16:52:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628283131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rvFaE80roGSPL3j0DmtxzhIG5Bh/LMXYZ3j1x35+Jn8=;
 b=cDsWupqugeheUazy8xPJfnGB8KhNDeSOMfwseWkSzqmv71hm9SC1u+JKgtYWmtdjVBQpww
 a44WmKoxNNT6ZmkqmdmbM4Fm5j8A2b07HtXwuO4w/jVXffDPYB09dytqaWhFX0ArfmTh+y
 3xNDNvHl2IN9zSdu2Hrxnz2Ad1CNi/U=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-AOst7eUrPzulUX9NS6PYgQ-1; Fri, 06 Aug 2021 16:52:08 -0400
X-MC-Unique: AOst7eUrPzulUX9NS6PYgQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 n2-20020aca40020000b029025c9037b7faso4749156oia.14
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 13:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rvFaE80roGSPL3j0DmtxzhIG5Bh/LMXYZ3j1x35+Jn8=;
 b=cqQ7I2BlaIxQCnBH+M2aaAufMoRmc+IEe0Igj26Au1XDcFMitBfSwVxMw+HbazLPnV
 jfv/p4Kz5d8x/dguGrgeLG70u/080RwfVznP6//RbwDzxeVSg/YjFqRVQ215uEXsRjKv
 3okT96mcMPcnvhSox6GnuNrtiuT1/oNTDkzrjkiOHaoQfLsmKu68+g8do60NvfV96P4a
 5I4BTJhZkz62jDzft+rlJM+8w7uuUmuoUUZtbY8CtiHKXLqE2z7J+TB+Eatid+EnZ9xd
 BIumUxhlXvjtu8rjjnyqTog/xObK8gW93aJxrKi4m3FpV1Hh5S1b4XyjeUm8B4nXgn/o
 +5ng==
X-Gm-Message-State: AOAM530H0Ji/5nhHXWqousSr8/uJkkzYLJA+39X2uF9f0tAIue+rEtzC
 DxVYPvLirwRY6HdNC9L8uRZM1UdhMUwil5gILpF5mzb3Vw8fuJXZHBJ0HXyLgd/H8KcUcxatM8m
 gACeH7XtxxB0IJR457tXXsEfeu3ui3vE=
X-Received: by 2002:a05:6830:1604:: with SMTP id
 g4mr9077730otr.45.1628283127468; 
 Fri, 06 Aug 2021 13:52:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzI+8fOtRq8V3wcG9HkBtxt0o4RlCIRfOJUrx8GZISNx0zBueGVOLrFy6IvEMWbUUfhFFOXsy4C3zTXwPw2cI4=
X-Received: by 2002:a05:6830:1604:: with SMTP id
 g4mr9077718otr.45.1628283127317; 
 Fri, 06 Aug 2021 13:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210806155132.1955881-1-jsnow@redhat.com>
 <20210806155132.1955881-3-jsnow@redhat.com>
 <6a221103-09f6-7a5d-5739-143818b67514@amsat.org>
 <3a93e2ec-9583-ffa3-11fd-1f145d3083d1@amsat.org>
In-Reply-To: <3a93e2ec-9583-ffa3-11fd-1f145d3083d1@amsat.org>
From: John Snow <jsnow@redhat.com>
Date: Fri, 6 Aug 2021 16:51:56 -0400
Message-ID: <CAFn=p-Y3T62FOeoe7rhQ9wpDajhaAtk7424r8QJaR6=ja1S=YQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] docs/devel: create "Developing QEMU" subsection
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000065decd05c8ea35e7"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000065decd05c8ea35e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 6, 2021 at 12:42 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 8/6/21 6:40 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 8/6/21 5:51 PM, John Snow wrote:
> >> Signed-off-by: John Snow <jsnow@redhat.com>
> >> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >> ---
> >>  docs/devel/index.rst               |  6 +-----
> >>  docs/devel/section-development.rst | 12 ++++++++++++
> >>  2 files changed, 13 insertions(+), 5 deletions(-)
> >>  create mode 100644 docs/devel/section-development.rst
> >>
> >> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> >> index 008d489d751..57016edd841 100644
> >> --- a/docs/devel/index.rst
> >> +++ b/docs/devel/index.rst
> >> @@ -10,9 +10,7 @@ modifying QEMU's source code.
> >>     :includehidden:
> >>
> >>     section-community-governance
> >> -   build-system
> >> -   style
> >> -   kconfig
> >> +   section-development
> >>     testing
> >>     fuzzing
> >>     control-flow-integrity
> >> @@ -20,11 +18,9 @@ modifying QEMU's source code.
> >>     memory
> >>     migration
> >>     atomics
> >> -   stable-process
> >>     ci
> >>     qtest
> >>     decodetree
> >> -   secure-coding-practices
> >>     tcg
> >>     tcg-icount
> >>     tracing
> >> diff --git a/docs/devel/section-development.rst
> b/docs/devel/section-development.rst
> >> new file mode 100644
> >> index 00000000000..bba4fea30cb
> >> --- /dev/null
> >> +++ b/docs/devel/section-development.rst
> >> @@ -0,0 +1,12 @@
> >> +Developing QEMU
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +.. toctree::
> >> +   :maxdepth: 2
> >> +   :includehidden:
> >> +
> >
> > Could we order from generic to specific?
>
> Oh this is alphetically sorted, nevermind.
>
>
If you want to give them a better "armchair order", I personally welcome
it. A good intro paragraph or two directly in the section-*.rst that
introduces the contents to follow, alongside a brief copy-editing of the
layout and organization of the docs in the section would be very helpful.
It was just more than I wanted to tackle with a quick series.

--00000000000065decd05c8ea35e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 6, 2021 at 12:42 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 8/6/21 6:40 PM, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; On 8/6/21 5:51 PM, John Snow wrote:<br>
&gt;&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" t=
arget=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt;&gt; Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@li=
naro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt;&gt; Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@lin=
aro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 docs/devel/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 6 +-----<br>
&gt;&gt;=C2=A0 docs/devel/section-development.rst | 12 ++++++++++++<br>
&gt;&gt;=C2=A0 2 files changed, 13 insertions(+), 5 deletions(-)<br>
&gt;&gt;=C2=A0 create mode 100644 docs/devel/section-development.rst<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/docs/devel/index.rst b/docs/devel/index.rst<br>
&gt;&gt; index 008d489d751..57016edd841 100644<br>
&gt;&gt; --- a/docs/devel/index.rst<br>
&gt;&gt; +++ b/docs/devel/index.rst<br>
&gt;&gt; @@ -10,9 +10,7 @@ modifying QEMU&#39;s source code.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0:includehidden:<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0section-community-governance<br>
&gt;&gt; -=C2=A0 =C2=A0build-system<br>
&gt;&gt; -=C2=A0 =C2=A0style<br>
&gt;&gt; -=C2=A0 =C2=A0kconfig<br>
&gt;&gt; +=C2=A0 =C2=A0section-development<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0testing<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0fuzzing<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0control-flow-integrity<br>
&gt;&gt; @@ -20,11 +18,9 @@ modifying QEMU&#39;s source code.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0memory<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0migration<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0atomics<br>
&gt;&gt; -=C2=A0 =C2=A0stable-process<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0ci<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0qtest<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0decodetree<br>
&gt;&gt; -=C2=A0 =C2=A0secure-coding-practices<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0tcg<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0tcg-icount<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0tracing<br>
&gt;&gt; diff --git a/docs/devel/section-development.rst b/docs/devel/secti=
on-development.rst<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 00000000000..bba4fea30cb<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/docs/devel/section-development.rst<br>
&gt;&gt; @@ -0,0 +1,12 @@<br>
&gt;&gt; +Developing QEMU<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +<br>
&gt;&gt; +.. toctree::<br>
&gt;&gt; +=C2=A0 =C2=A0:maxdepth: 2<br>
&gt;&gt; +=C2=A0 =C2=A0:includehidden:<br>
&gt;&gt; +<br>
&gt; <br>
&gt; Could we order from generic to specific?<br>
<br>
Oh this is alphetically sorted, nevermind.<br>
<br></blockquote><div><br></div><div>If you want to give them a better &quo=
t;armchair order&quot;, I personally welcome it. A good intro paragraph or =
two directly in the section-*.rst that introduces the contents to follow, a=
longside a brief copy-editing of the layout and organization of the docs in=
 the section would be very helpful. It was just more than I wanted to tackl=
e with a quick series. <br></div></div></div>

--00000000000065decd05c8ea35e7--


