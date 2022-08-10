Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0189D58EFE1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 17:58:45 +0200 (CEST)
Received: from localhost ([::1]:42658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLo6V-0008MI-JH
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 11:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oLo5L-0006nT-Ex
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 11:57:31 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:36771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oLo5J-0006iU-Vx
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 11:57:31 -0400
Received: by mail-lf1-x12d.google.com with SMTP id c17so21841886lfb.3
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 08:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=J3t6ixFiXS4qTBVKF6EzQmdznkwqcap+cjUt+4MYxxY=;
 b=Gt9n4tPx5J8xRZW4NoA5A0WdPIppVa7BUo+6nhF457vrVBm3HC0HDUVetnkPlFDIc4
 3iu/riIBKqvB/MXLPab8Ds26NJ3prrSCNI+JawRg6X0Xtd0KEUNbX+wwvZX/F4iWulQV
 oyf3RKOwqpiC42VACPT20AZxtBJAkkAMvgA81BrmY8eUBlFf/Kgwm5uajK5txy5AeBW7
 hAkgVuDcndhXhQVuHFuegjtkLDH1gcRqcviga4rnyZLVduO/QDtzvfAsOUcNispMZUCP
 JTFxpCwlg32mt21aCNaeituBskz5BZcD6SbPgT+EbOTS+OMx+us2+9gyoZ9g9U0jK2Wr
 EEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=J3t6ixFiXS4qTBVKF6EzQmdznkwqcap+cjUt+4MYxxY=;
 b=XoOBc/09LxIQdHS4HEBk9sK/LNYakt3HeJlVXzyS67VcML6U9bo6PWRHN4UU7sdFy2
 Kn1HgW1KpmKV7g24klofhmyF6kM7N66Zg3+rOo/u4Br6P2eZYaRQumJWEBnnh+XclOR3
 mFAuWZiUAZTPL5HoXItlWKkF5fAjrUDybBDR4R7LnCrtoYTIjF+kTa04dEXJdVKPJvnX
 XdY+NcjXF5Zcde3WDEFxLNhDQn/iRBeXUFiPdwR9eaEU81QUtkcpe7xrcblcZiKnNDZD
 7I8p9FnKPuXmTziMRa0xjUhnSDpwlSNQuS6U5VYrKxWvwaRx9P+k2D8vB3eeue0f+rp4
 o5ow==
X-Gm-Message-State: ACgBeo3zsEzbkQT3rb0qOrHfBU8snlZaJ34uFg9gd4s6lHYhU9wZeKbI
 IPO3Wpb3LCIFFOkBECijaGrA1KoAjgdAZbLRKUg=
X-Google-Smtp-Source: AA6agR57ZGsaZLRy8rJ0V0irefAxTQCWh4z8u+dMdebkB7OYGXqm2VgkzFu0Iy2X+1rlnlrZ5AtAjgu+RMK7GAGr8kY=
X-Received: by 2002:a05:6512:2306:b0:48b:2905:21a8 with SMTP id
 o6-20020a056512230600b0048b290521a8mr10764671lfu.167.1660147047500; Wed, 10
 Aug 2022 08:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220809164308.1182645-1-bmeng.cn@gmail.com>
 <CAJ+F1C+KqH7Egr_9f=w=qn4AXVEgaGsZ0nmpHL08PfHaZJ4wzg@mail.gmail.com>
 <CAEUhbmUC-aRi4o7G3TELNmJ5DnEZDjdnw5PJNTeQMbeT5TcUYA@mail.gmail.com>
In-Reply-To: <CAEUhbmUC-aRi4o7G3TELNmJ5DnEZDjdnw5PJNTeQMbeT5TcUYA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 10 Aug 2022 19:57:15 +0400
Message-ID: <CAJ+F1C+-0P01vUdD_sJA0JGOXj1Z6R1zOQ_K38Kr8x1aMhHV-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] util/main-loop: Fix maximum number of wait objects
 for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000ac23105e5e51b19"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000000ac23105e5e51b19
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2022 at 7:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Wed, Aug 10, 2022 at 1:06 AM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Tue, Aug 9, 2022 at 8:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> From: Bin Meng <bin.meng@windriver.com>
> >>
> >> The maximum number of wait objects for win32 should be
> >> MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
> >>
> >> Fix the logic in qemu_add_wait_object() to avoid adding
> >> the same HANDLE twice.
> >>
> >
> > Please make that a separate patch.
> >
> >>
> >> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >> ---
> >>
> >> Changes in v2:
> >> - fix the logic in qemu_add_wait_object() to avoid adding
> >>   the same HANDLE twice
> >>
> >
> > Still NACK, did you understand my argument about array bounds?
> >
> > "if (found)" will access the arrays at position i+1 =3D=3D
> MAXIMUM_WAIT_OBJECTS. We need the +1 for that logic to work without OOB
> access.
> >
>
> The delete logic was updated in v2. If position is at
> MAXIMUM_WAIT_OBJECTS - 1, the loop will break.
>

Ah I missed that. That new condition looks wrong to me. Not only it is
redundant with the loop condition check if w->num =3D=3D MAXIMUM_WAIT_OBJEC=
TS

But you still access the array at MAXIMUM_WAIT_OBJECTS index, which
requires arrays of MAXIMUM_WAIT_OBJECTS+1 size, since it's 0-indexed..

Unless I say crap, which happens sometime :)

--=20
Marc-Andr=C3=A9 Lureau

--0000000000000ac23105e5e51b19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 10, 2022 at 7:20 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Aug=
 10, 2022 at 1:06 AM Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Tue, Aug 9, 2022 at 8:43 PM Bin Meng &lt;<a href=3D"mailto:bmeng.cn=
@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; The maximum number of wait objects for win32 should be<br>
&gt;&gt; MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.<br>
&gt;&gt;<br>
&gt;&gt; Fix the logic in qemu_add_wait_object() to avoid adding<br>
&gt;&gt; the same HANDLE twice.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Please make that a separate patch.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.c=
om" target=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt; Changes in v2:<br>
&gt;&gt; - fix the logic in qemu_add_wait_object() to avoid adding<br>
&gt;&gt;=C2=A0 =C2=A0the same HANDLE twice<br>
&gt;&gt;<br>
&gt;<br>
&gt; Still NACK, did you understand my argument about array bounds?<br>
&gt;<br>
&gt; &quot;if (found)&quot; will access the arrays at position i+1 =3D=3D M=
AXIMUM_WAIT_OBJECTS. We need the +1 for that logic to work without OOB acce=
ss.<br>
&gt;<br>
<br>
The delete logic was updated in v2. If position is at<br>
MAXIMUM_WAIT_OBJECTS - 1, the loop will break.<br></blockquote><div><br></d=
iv><div>Ah I missed that. That new condition looks wrong to me. Not only it=
 is redundant with the loop condition check if w-&gt;num =3D=3D MAXIMUM_WAI=
T_OBJECTS</div></div><div class=3D"gmail_quote"><br></div><div class=3D"gma=
il_quote">But you still access the array at MAXIMUM_WAIT_OBJECTS index, whi=
ch requires arrays of MAXIMUM_WAIT_OBJECTS+1 size, since it&#39;s 0-indexed=
..</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Unl=
ess I say crap, which happens sometime :)<br></div><br>-- <br><div dir=3D"l=
tr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000000ac23105e5e51b19--

