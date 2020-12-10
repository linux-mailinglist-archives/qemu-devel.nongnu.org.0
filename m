Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269D22D5C29
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:44:32 +0100 (CET)
Received: from localhost ([::1]:52092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMFD-0006FU-5B
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:44:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1knM7E-0007fY-Hf
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:36:16 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1knM79-0006ot-49
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:36:16 -0500
Received: by mail-ej1-x633.google.com with SMTP id qw4so7296350ejb.12
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 05:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=web8ncJI076fmmd8MBMA3tfSKeNQx7IBH9Aodca1CdI=;
 b=cy03t5onMkkM5AdweSFUa8wXIDRTiWkcIN74MqlmynESJhpepG7utQ+NI8fXhFtrez
 OZj6t++Yfoj6BG3Qnv4IglmipFjUkBlRqf8Xb3NhCWYoZP9p+DLANz9Oh+IZzF7e4wNX
 QEwsROu3g+nk2Yt0sfkRuOmU1+b1XRPDh1SsjfanEU43b7Gn+L5AbaLXpHRprpdds4U2
 20vOxpG9aWe0e0PKkrZ66aRvbxpwQCpC2w70SeziCP4vMDklZnswmvFs3iYk1LIVEUhB
 wcTPm4lbN27AqgFUOKxlRWpucuDmpXx0arO0qazLPbsVOf3Ja5+4VrqxZ+zenUvZRwhV
 UJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=web8ncJI076fmmd8MBMA3tfSKeNQx7IBH9Aodca1CdI=;
 b=EqCYDWdexzui+e/VOU7NtRBm3/zOMyu4q1o+faA0YhPn/1VBImZoqBEvMir1of6eyn
 +pdMyQbRcl5Zq5mlo/B0yudlxzXcLSlOB04ZVC8NaRogNLoPI50y5RPM/DuOQ3R8K4qS
 x8LN2/UDSdUmGBKoh8Ea2XWbe3RYZW6q2Lz0KiFu+uDcAbmrE6ht621AwiInT3wA4Frj
 AWz8j3HX2iJ/aTvnwYRuS1poMR0v++dttuIni0JipEA7mMY0F+BgvZOIMa8uYkbFfNXE
 9jbf9eIjLWmooXmtTgSSS076wp5k2DEpNCJt8h0c6+H7JN0bcdBXhO2Q9bZpmgksQ1Cb
 601A==
X-Gm-Message-State: AOAM532OwR63WwTFRWaSPku2DoWklh0euJ2Ch/N+4WthQ8iYTpy85KpX
 CxWGP60QN8xJ2F6t7o6Y0uN3Mnax8MTBSVMlhac=
X-Google-Smtp-Source: ABdhPJzUuLyr68ek/tbknsj09NXsOjxJgppyWul4jjl2EiKrqjAL7kOPwe9jLhpWISU3Xq4taFZYPSQcx9xaHFJc20I=
X-Received: by 2002:a17:906:8587:: with SMTP id
 v7mr6215966ejx.381.1607607368364; 
 Thu, 10 Dec 2020 05:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-5-marcandre.lureau@redhat.com>
 <CAFEAcA-P=PMn92xYG4xUo6EuQVzvCDcyTvCpO_mfyOLWLB19Xw@mail.gmail.com>
In-Reply-To: <CAFEAcA-P=PMn92xYG4xUo6EuQVzvCDcyTvCpO_mfyOLWLB19Xw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 10 Dec 2020 17:35:56 +0400
Message-ID: <CAJ+F1CLAm9HGeaW_esVd1_CUhuTSsTr20xUG8LmtEfPOqv=myA@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] compiler.h: remove GCC < 3 __builtin_expect
 fallback
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002135d805b61c4278"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002135d805b61c4278
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Nov 26, 2020 at 3:57 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 26 Nov 2020 at 11:29, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Since commit efc6c07 ("configure: Add a test for the minimum compiler
> > version"), QEMU explicitely depends on GCC >=3D 4.8.
> >
> > (clang >=3D 3.8 advertizes itself as GCC >=3D 4.2 compatible)
>
> All clangs always have advertised themselves as gcc-4.2-compatible,
> as far as I'm aware. 3.4 is the version we need to care about,
> I think it probably supported __builtin_expect(). (A test
> of the whole series with gcc 4.8 and clang 3.4 would confirm this.)
>

clang 3.4 also advertizes as gcc-4.2, thus we can safely remove that
__builtin_expect() fallback (if it didn't have it, it would have failed for
a long while)

I also checked the __builtin_expect() support with clang-3.4.2-9.el7.x86_64
from EPEL7 successfully.




--=20
Marc-Andr=C3=A9 Lureau

--0000000000002135d805b61c4278
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Nov 26, 2020 at 3:57 PM Peter Maydell=
 &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Thu, 26 Nov 2020 at 11:29, &lt;<a href=3D"mailto:marcandre.lureau@redhat.c=
om" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Since commit efc6c07 (&quot;configure: Add a test for the minimum comp=
iler<br>
&gt; version&quot;), QEMU explicitely depends on GCC &gt;=3D 4.8.<br>
&gt;<br>
&gt; (clang &gt;=3D 3.8 advertizes itself as GCC &gt;=3D 4.2 compatible)<br=
>
<br>
All clangs always have advertised themselves as gcc-4.2-compatible,<br>
as far as I&#39;m aware. 3.4 is the version we need to care about,<br>
I think it probably supported __builtin_expect(). (A test<br>
of the whole series with gcc 4.8 and clang 3.4 would confirm this.)<br></bl=
ockquote><div><br></div><div>clang 3.4 also advertizes as gcc-4.2, thus we =
can safely remove that __builtin_expect() fallback (if it didn&#39;t have i=
t, it would have failed for a long while)</div><div><br></div><div>I also c=
hecked the __builtin_expect() support with clang-3.4.2-9.el7.x86_64 from EP=
EL7 successfully.<br></div><div><br></div><div><br></div><br clear=3D"all">=
</div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9=
 Lureau<br></div></div>

--0000000000002135d805b61c4278--

