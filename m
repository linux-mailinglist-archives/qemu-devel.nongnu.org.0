Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848BD3CB9DB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:30:04 +0200 (CEST)
Received: from localhost ([::1]:40554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Pmt-0000jd-HE
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m4PaF-0003yg-Hq
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:16:59 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e]:38902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m4PaD-0005DB-KF
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:16:59 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 128-20020a4a11860000b029024b19a4d98eso2508298ooc.5
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 08:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s61WvCnCaYmoIN9j+r8DOuHV2B9sXzdSLu+pvwp1ZAs=;
 b=N38ontKwkZ4Ec3epfogZRRQMWwRvi2Yc4JuxObrrgj8xynDHLuR4Q5OgzYEN2+1wIc
 RFPn7jt4ApUqu8gwzl7bpbWwAewsACfU5oz6I4fmOKLGcKB+AjZaas6sR5EGUiqkxsrr
 kQ1QEhdbxFcmJZDszC/Rb/FN4wNbAI07LCIHhk1pCzZc2X3/eaAIQBkgNsNzUstnSqRE
 vgavSBpUho8SXl5djHn5GPbNnZBfI9YHIQMm+EawTMSJ1daECyTRwFVr4qfNgzu6Vnh/
 V7mk6OWDJxVzP4jHIFfwBCElya88XQfl8SWcpABq33AtwCaV86MNyw9Ndr//qXpnFCbj
 9RJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s61WvCnCaYmoIN9j+r8DOuHV2B9sXzdSLu+pvwp1ZAs=;
 b=UMR4doHFyAkHEpF9UIvzZuCxAVxe4pJhUdTGY/lR4e7a9lRXpNp484upoqAlufUV5E
 59C7+HhkLgIU+2y6VcY2d8yrchQ1Fe4qmspIwbFEBCt2THM+/I2vF0c6+qSgS0p3SQnw
 V3o02PwMf5L+eojky3PmhxLesTMbegyhEGzwPbD6ebTZ0gX+1ex7NMbouaSAfQGwMC3I
 GHAJp+GWAJ6xqXFrBCVntG8IBCqpySz8pSmxA6amMwqEjkEjx8UG637e6YdjWTKvcMTf
 JrfBcEKItv2YwIW9GyB7/3qUttCHvJBDYN0UPgoxdosnYIYLsrGJzax7+Msv4Wmqard2
 HIwg==
X-Gm-Message-State: AOAM532jeI+/DsXS9jZ+pU724laSK6pPVhn73CbgircUQnhSzZm8TH6p
 j8YzITWXTjJTNN1WNFQCNmB1b3hNHnv5HwWQgBk=
X-Google-Smtp-Source: ABdhPJzisi/1myc3l8fAqeG6ILclSaKtKNzPJn9EH9WfiB2Ojf2zaTCUrKhtrd54CtKgUo/dQmDh67VUx1fR+NSupBE=
X-Received: by 2002:a4a:6f0e:: with SMTP id h14mr7921327ooc.9.1626448616309;
 Fri, 16 Jul 2021 08:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp_5vmoL1xFr6rVUzbyb2LyxyndOrxKMsyvgkqq_EX=hOg@mail.gmail.com>
 <CAFEAcA_jBPwqHCyCAq6yJPfHtwV-h2xdNARX=GTe6gn1Cao97Q@mail.gmail.com>
 <CAK7rcp99ZiRw1zVMAGAO6t=yaDuZyNPwToRd1x34JzEvNHtj2w@mail.gmail.com>
 <CAFEAcA8dcouHz=UnDyksZ17fsGom4r=ciHu7oX-f3gDjnCX54Q@mail.gmail.com>
 <CAK7rcp_S5Z5M3bDum3f_ppequ47PaYHs0Gp=LST5jnF_VsCkuA@mail.gmail.com>
In-Reply-To: <CAK7rcp_S5Z5M3bDum3f_ppequ47PaYHs0Gp=LST5jnF_VsCkuA@mail.gmail.com>
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Fri, 16 Jul 2021 10:16:44 -0500
Message-ID: <CAK7rcp9uNpQcFepqMugg6qv2LWMY5O=TPBDp7uKAUs0whjmrbQ@mail.gmail.com>
Subject: Re: QEMU System and User targets
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000005476205c73f14bc"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000005476205c73f14bc
Content-Type: text/plain; charset="UTF-8"

When I go to build the qemu softmmu target the shared files - the i386_ss
of my arch - gives problems where the build system isn't specifying the
include headers for the compiler to find the surrounding headers that
belong to different parts of the qemu library. I was able to edit my own
source only so much before recursive header dependencies had included their
own respective qemu library components subdirectories, at which point the
build fails with cannot find header. I want to know, are these shared
source set files not supposed to include those qemu subcomponents? Or
resolve a different way for each target using #ifdef guards? I would think
that this would be modularized from within the qemu subcomponent library.
And I think that configure and meson are working together to generate the
correct build commands to these shared components. So I'm unsure what to do.

On Thu, Jul 15, 2021 at 11:39 AM Kenneth Adam Miller <
kennethadammiller@gmail.com> wrote:

> Oh I didn't know that there was a i386_user_ss in order to see that it was
> intended that they were shared that way, so I initially thought that
> i386_ss was user only until I saw it in the build.
>
> On Thu, Jul 15, 2021 at 11:35 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Thu, 15 Jul 2021 at 17:25, Kenneth Adam Miller
>> <kennethadammiller@gmail.com> wrote:
>> >
>> > Well certainly, I know they are different executables. I'm just trying
>> to understand how the different targets work.
>> >
>> > By subsumes, I mean that just looking at the meson.build for i386, you
>> can see that there are files added to the i386_ss, but not visibly added to
>> the softmmu target. But the softmmu target has those files built whenever
>> you configure and build it.
>>
>> In the meson.build files, i386_ss is files built for both softmmu and
>> user;
>> i386_user_ss is files built for usermode only; i386_softmmu_ss is files
>> built for softmmu only. target/i386/meson.build sets target_arch,
>> target_softmmu_arch and target_user_arch to these sourcesets.
>> The top level meson.build adds the relevant target_* sourcesets to the
>> set of sources required to build the various executables.
>>
>> Some source files also use #ifdefs: you can look for ifdefs on
>> CONFIG_USER_ONLY and CONFIG_SOFTMMU to find code that's conditionally
>> compiled in different ways for the two executables.
>>
>> -- PMM
>>
>

--00000000000005476205c73f14bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">When I go to build the qemu softmmu target the shared file=
s - the i386_ss of my arch - gives problems where the build system isn&#39;=
t specifying the include headers for the compiler to find the surrounding h=
eaders that belong to different parts of the qemu library. I was able to ed=
it my own source only so much before recursive header dependencies had incl=
uded their own respective qemu library components subdirectories, at which =
point the build fails with cannot find header. I want to know, are these sh=
ared source set files not supposed to include those qemu subcomponents? Or =
resolve a different way for each target using #ifdef guards? I would think =
that this would be modularized from within the qemu subcomponent library. A=
nd I think that configure and meson are working together to generate the co=
rrect build commands to these shared components. So I&#39;m unsure what to =
do.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Jul 15, 2021 at 11:39 AM Kenneth Adam Miller &lt;<a href=3D"mail=
to:kennethadammiller@gmail.com">kennethadammiller@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
>Oh I didn&#39;t know that there was a i386_user_ss=C2=A0in order to see th=
at it was intended that they were shared that way, so I initially thought t=
hat i386_ss was user only until I saw it in the build.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 15, 2021=
 at 11:35 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" =
target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Thu, 15 Jul 2021 at 17:25, Ken=
neth Adam Miller<br>
&lt;<a href=3D"mailto:kennethadammiller@gmail.com" target=3D"_blank">kennet=
hadammiller@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Well certainly, I know they are different executables. I&#39;m just tr=
ying to understand how the different targets work.<br>
&gt;<br>
&gt; By subsumes, I mean that just looking at the meson.build for i386, you=
 can see that there are files added to the i386_ss, but not visibly added t=
o the softmmu target. But the softmmu target has those files built whenever=
 you configure and build it.<br>
<br>
In the meson.build files, i386_ss is files built for both softmmu and user;=
<br>
i386_user_ss is files built for usermode only; i386_softmmu_ss is files<br>
built for softmmu only. target/i386/meson.build sets target_arch,<br>
target_softmmu_arch and target_user_arch to these sourcesets.<br>
The top level meson.build adds the relevant target_* sourcesets to the<br>
set of sources required to build the various executables.<br>
<br>
Some source files also use #ifdefs: you can look for ifdefs on<br>
CONFIG_USER_ONLY and CONFIG_SOFTMMU to find code that&#39;s conditionally<b=
r>
compiled in different ways for the two executables.<br>
<br>
-- PMM<br>
</blockquote></div>
</blockquote></div>

--00000000000005476205c73f14bc--

