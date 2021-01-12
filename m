Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A00D2F32F1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:28:37 +0100 (CET)
Received: from localhost ([::1]:38112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzKey-0003T0-Ic
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:28:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kzKdm-0002iA-SZ; Tue, 12 Jan 2021 09:27:22 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kzKdl-0003Tx-86; Tue, 12 Jan 2021 09:27:22 -0500
Received: by mail-ed1-x52c.google.com with SMTP id b2so2523818edm.3;
 Tue, 12 Jan 2021 06:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7VFukBH4KjfFcT1bix3AmAiCf6+j2YE6QgnZsD20hXk=;
 b=cjq7wh7jWth3Az+RXlyMCNyX/vTTLS8Ga0r5Kpr3Q1HxN8RrjWMa3BmIzauwTcD0xB
 ZVjWDQoeIS85nyACJ9atxUqS9BFh/1UeMUvxtpNPzT//CqpvPTzBhULJ076iTU+ySa8J
 L0JnmfD4ur50Hegoxo2ZzvxFtVN101o181O8OGFqtQqfE9Wdji5PNBnX1KIKob8jNJAv
 gVL62bpkEwWQ92moNUWVuwC1LTLywujLdLx/e9uD3+fVp3paDwzBfdgc5YQiUdh+NFpJ
 t+GR6xpI2mYvbtY8gdXqNNiHuZt+L+WEd49OoC8MAjreYWoQllUREJGwrx7Q4XqzoW8t
 ufPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7VFukBH4KjfFcT1bix3AmAiCf6+j2YE6QgnZsD20hXk=;
 b=gVa2O/pJ/C5NC4t/pvZX9r0xp8Z+xf7UPosL8FaNfkYq5fN3u1G2GuFYvABLyMYFre
 ZrGwdoFWehPeFLcniKu5xEIOumbxgT5wal4SmZm7h1M4nYgM8CnEw+TGVYm79vOV8f4P
 pN48uukwg+LqXemXqsuLr5Y237NYhS2GALFhp1aYRjTVG3c947Q/szlKdMO/8LGMQCbO
 NmqFOpkiH2CUdhHRmlteWcRVwtqIny/YFldTBTEChIqH2rK01oHLguoULon5x6ljetwJ
 EVeaTFhcubkNNwPC7fAaR3ZQ80sZsz2DuI5scWl0LoosuGOYtBTrLr1dIAGGSCApNiTd
 OLNQ==
X-Gm-Message-State: AOAM530iye0ny8/c3QYZamVYbHN7oWHenCf37qDcb6vjxIn9J/cn21Zp
 kPO6R7QixJm+yd2uGlvBBj2pVr653GXVt1aqXU0=
X-Google-Smtp-Source: ABdhPJwdcgyHJj7hAfosyu5xUKNUeOSqily0VR9mkcRV4Kbw9xwK8RHttLYSpo77eyyT2HQWZcwr+Tshz+liqz+qt9g=
X-Received: by 2002:aa7:c558:: with SMTP id s24mr3727086edr.257.1610461638951; 
 Tue, 12 Jan 2021 06:27:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609167865.git.lukasstraub2@web.de>
 <69934ceacfd33a7dfe53db145ecc630ad39ee47c.1609167865.git.lukasstraub2@web.de>
 <CAJ+F1CLLiHca4Lf_nL7p2+Q3MT5JA0Qn9W6g14q0MYtYoROOdA@mail.gmail.com>
 <87ft374myk.fsf@dusky.pond.sub.org>
 <CAJ+F1C+osNqR_7FBVoVh2Fg65axrQVWoOVbbuRtjiNysj=k+HQ@mail.gmail.com>
 <87pn2ansrv.fsf@dusky.pond.sub.org>
In-Reply-To: <87pn2ansrv.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 12 Jan 2021 18:27:06 +0400
Message-ID: <CAJ+F1CKm-BFeu2Od4gm_JSVEEk_XB4vym1Mqgimk6pubAW5zkw@mail.gmail.com>
Subject: Re: [PATCH v14 1/7] Introduce yank feature
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ea052405b8b4d174"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52c.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqVw=?= <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ea052405b8b4d174
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 6:18 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>
> > On Mon, Jan 11, 2021 at 5:34 PM Markus Armbruster <armbru@redhat.com>
> wrote:
> >
> >> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
> >>
> >> > Hi
> >> >
> >> > On Mon, Dec 28, 2020 at 7:08 PM Lukas Straub <lukasstraub2@web.de>
> >> wrote:
> >> >
> >> >> The yank feature allows to recover from hanging qemu by "yanking"
> >> >> at various parts. Other qemu systems can register themselves and
> >> >> multiple yank functions. Then all yank functions for selected
> >> >> instances can be called by the 'yank' out-of-band qmp command.
> >> >> Available instances can be queried by a 'query-yank' oob command.
> >> >>
> >> >
> >> > Looking at the changes and API usage, I wonder if it wouldn't have
> been
> >> > simpler to associate the yank function directly with the YankInstanc=
e
> >> > (removing the need for register/unregister functions - tracking the
> state
> >> > left to the callback). Have you tried that approach? If not, I could
> >> check
> >> > if this idea would work.
> >>
> >> Considering we're at v14...  would it make sense to commit the current
> >> approach, then explore the alternative approach on top?
> >>
> >>
> > works for me
> >
> >> If yes, is v14 committable as is?
> >>
> >>
> > Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Thanks!  Does your ACK apply to the series, or just to PATCH 1?
>

I didn't look much at the rest of the series, but PATCH 3 too, I'll reply
there.


--=20
Marc-Andr=C3=A9 Lureau

--000000000000ea052405b8b4d174
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 12, 2021 at 6:18 PM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Marc=
-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=
=3D"_blank">marcandre.lureau@gmail.com</a>&gt; writes:<br>
<br>
&gt; On Mon, Jan 11, 2021 at 5:34 PM Markus Armbruster &lt;<a href=3D"mailt=
o:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmai=
l.com" target=3D"_blank">marcandre.lureau@gmail.com</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; Hi<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Mon, Dec 28, 2020 at 7:08 PM Lukas Straub &lt;<a href=3D"m=
ailto:lukasstraub2@web.de" target=3D"_blank">lukasstraub2@web.de</a>&gt;<br=
>
&gt;&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; The yank feature allows to recover from hanging qemu by &=
quot;yanking&quot;<br>
&gt;&gt; &gt;&gt; at various parts. Other qemu systems can register themsel=
ves and<br>
&gt;&gt; &gt;&gt; multiple yank functions. Then all yank functions for sele=
cted<br>
&gt;&gt; &gt;&gt; instances can be called by the &#39;yank&#39; out-of-band=
 qmp command.<br>
&gt;&gt; &gt;&gt; Available instances can be queried by a &#39;query-yank&#=
39; oob command.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Looking at the changes and API usage, I wonder if it wouldn&#=
39;t have been<br>
&gt;&gt; &gt; simpler to associate the yank function directly with the Yank=
Instance<br>
&gt;&gt; &gt; (removing the need for register/unregister functions - tracki=
ng the state<br>
&gt;&gt; &gt; left to the callback). Have you tried that approach? If not, =
I could<br>
&gt;&gt; check<br>
&gt;&gt; &gt; if this idea would work.<br>
&gt;&gt;<br>
&gt;&gt; Considering we&#39;re at v14...=C2=A0 would it make sense to commi=
t the current<br>
&gt;&gt; approach, then explore the alternative approach on top?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; works for me<br>
&gt;<br>
&gt;&gt; If yes, is v14 committable as is?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; Acked-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Thanks!=C2=A0 Does your ACK apply to the series, or just to PATCH 1?<br></b=
lockquote><div><br></div><div>I didn&#39;t look much at the rest of the ser=
ies, but PATCH 3 too, I&#39;ll reply there.<br></div></div><br clear=3D"all=
"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lur=
eau<br></div></div>

--000000000000ea052405b8b4d174--

