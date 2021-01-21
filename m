Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E012FF5E4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:32:10 +0100 (CET)
Received: from localhost ([::1]:34498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gcj-0005Mx-Cx
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:32:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l2gZm-0003Ac-Uu
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:29:06 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:44932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l2gZk-0007j3-Jb
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:29:06 -0500
Received: by mail-vs1-xe35.google.com with SMTP id f22so1792019vsk.11
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FqnMb2DwBye7QSDKyyN4BzHMdNjGAQSaCeG0/iYTf1g=;
 b=H7mY4Yap2bIAAUeSKBLR/Q4SQb3jsdQhHGcghj5dZEBgn2yqbOrVBu6nNZTS2QSpRx
 HucHZbwcVrcn9lsVxbFNq8wBFyRMzAHR2hcFe0nXDCNkU6g8vgWlXW48HLG7vaTIwNfI
 jXmcBVvi6XPIl63bIKCDrLaaZmwlIW/Bu8n50QLyk+6s4K4x2wlY5r9XB7jgpIVup/A3
 jwNLmintyZ4eKeFqHr9F+Q442iCjCQerbeuDcJL50mPECleerm1bPHHhmtq5zZvHv9fC
 aKY0FXXoLLG1fnaKyAALdmrCvP8m25n0vxILzzrna9hUns3l65osgpEf/jJI//djmhLE
 uUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FqnMb2DwBye7QSDKyyN4BzHMdNjGAQSaCeG0/iYTf1g=;
 b=NojvqomOHI4yTWjEjknBHD42idm4n/OQTdZrr2dZaoq2wNC7UDaxNT8R7OxoUZz8t1
 46QlfeXR4ITiQ0UfTedmTIOPmbCmFoM7t2Uk22pZogeKOPSBTRZLnvqv7KVXYk2lTPFm
 rOxiSm9veVj7knDtVUTjWQrtQ95WmKZZ3TDBwM8Vz+RraxcTPY9csqBzYJ789HYwT7+H
 tXLuGqydN1CVmPojKWJl21F5tYMQZnWoOvv1ik9hMwoOXm12AzNBav/tB6ClZx5tXjVD
 mVgQfbJiAE6K1X34lsVACGfBQ7kT09Bt1aNdlVSmt2GxUV6fvzMnI/pC2SOalCM2Wrxu
 EiKw==
X-Gm-Message-State: AOAM533oem+ahRmo5gwwBTAMOpAgCUMswSsYdFf6D+GFxMwERWMXhn8w
 NRJJjA5zfTVBZpQcxLN5w0DwjjxOLVfn++vRr6XAEA==
X-Google-Smtp-Source: ABdhPJy8Xy2vY1R3r4CuvQdB6WJDEkN3Z5S8mtmQYjzZuDbD4I0Oerbjm+q/aehfXzh05sbBo9QTmoEjvuqoJjV2Rp4=
X-Received: by 2002:a67:fc4c:: with SMTP id p12mr1461162vsq.46.1611260940609; 
 Thu, 21 Jan 2021 12:29:00 -0800 (PST)
MIME-Version: 1.0
References: <20210121082314.458600-1-dje@google.com>
 <CAJ+F1CJ5SB2RHuR6KzoA8K0Tdpeam+=LdSRbax6W6WQ+18qqUA@mail.gmail.com>
In-Reply-To: <CAJ+F1CJ5SB2RHuR6KzoA8K0Tdpeam+=LdSRbax6W6WQ+18qqUA@mail.gmail.com>
Date: Thu, 21 Jan 2021 12:28:24 -0800
Message-ID: <CADPb22R9c+e1i-3CYWOc=U9Yr+F=86=T3sZ2p3jBNrn9m2kwGg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add ipv6 hostfwd support
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000001bc6c05b96eecb5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=dje@google.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Doug Evans <dje@google.com>
From: dje--- via <qemu-devel@nongnu.org>

--00000000000001bc6c05b96eecb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 1:41 AM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi Doug,
>
> On Thu, Jan 21, 2021 at 12:24 PM dje--- via <qemu-devel@nongnu.org> wrote=
:
> >
> > Hi. This patchset takes the original patch from Maxim,
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html
> > and updates it.
> >
> > The first patch is the slirp additions, the second patch adds the u/i.
>
> libslirp is maintained on gitlab. Can you open a merge request?
> https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests
>
> thanks
>


Hi. Sure, no problem.
I wasn't sure what the procedure is but figured it would come out during
the review.
How does review of libslirp patches work?
I gather Samuel is a libslirp maintainer so I'm guessing it just needs to
be approved here (after appropriate review) and then afterwards I should
file the merge request?



>
> >
> > Doug Evans (2):
> >   slirp: Add ipv6 hostfwd support
> >   net: Add ipv6_hostfwd option
> >
> > Slirp:
> >  src/libslirp.h |   6 +++
> >  src/slirp.c    |  51 +++++++++++++++++++++--
> >  src/socket.c   | 109 +++++++++++++++++++++++++++++++++++--------------
> >  src/socket.h   |   9 ++++
> >  src/udp.c      |  73 ++++++++++++++++++++++++++-------
> >  src/udp.h      |   2 +
> >  6 files changed, 202 insertions(+), 48 deletions(-)
> >
> > QEMU:
> >  hmp-commands.hx     |  29 ++++-
> >  include/net/slirp.h |   2 +
> >  net/slirp.c         | 311 +++++++++++++++++++++++++++++++++++---------
> >  qapi/net.json       |   1 +
> >  slirp               |   2 +-
> >  5 files changed, 279 insertions(+), 66 deletions(-)
> >
> > --
> > 2.30.0.296.g2bfb1c46d8-goog
> >
> >
>
>
> --
> Marc-Andr=C3=A9 Lureau
>

--00000000000001bc6c05b96eecb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Thu, Jan 21, 2021 at 1:41 AM Marc-Andr=C3=A9 Lureau &lt;<a=
 href=3D"mailto:marcandre.lureau@gmail.com">marcandre.lureau@gmail.com</a>&=
gt; wrote:<br></div></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi Doug,<br>
<br>
On Thu, Jan 21, 2021 at 12:24 PM dje--- via &lt;<a href=3D"mailto:qemu-deve=
l@nongnu.org" target=3D"_blank">qemu-devel@nongnu.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi. This patchset takes the original patch from Maxim,<br>
&gt; <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg56957=
3.html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/q=
emu-devel@nongnu.org/msg569573.html</a><br>
&gt; and updates it.<br>
&gt;<br>
&gt; The first patch is the slirp additions, the second patch adds the u/i.=
<br>
<br>
libslirp is maintained on gitlab. Can you open a merge request?<br>
<a href=3D"https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/slirp/l=
ibslirp/-/merge_requests</a><br>
<br>
thanks<br></blockquote><div><br></div><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">Hi. Sure, no problem.</div><div class=
=3D"gmail_default" style=3D"font-size:small">I wasn&#39;t sure what the pro=
cedure is but figured it would come out during the review.</div><div class=
=3D"gmail_default" style=3D"font-size:small">How does review of libslirp=C2=
=A0patches work?</div><div class=3D"gmail_default" style=3D"font-size:small=
">I gather Samuel is a libslirp maintainer so I&#39;m guessing it just need=
s to be approved here (after appropriate review) and then afterwards I shou=
ld file the merge request?</div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Doug Evans (2):<br>
&gt;=C2=A0 =C2=A0slirp: Add ipv6 hostfwd support<br>
&gt;=C2=A0 =C2=A0net: Add ipv6_hostfwd option<br>
&gt;<br>
&gt; Slirp:<br>
&gt;=C2=A0 src/libslirp.h |=C2=A0 =C2=A06 +++<br>
&gt;=C2=A0 src/slirp.c=C2=A0 =C2=A0 |=C2=A0 51 +++++++++++++++++++++--<br>
&gt;=C2=A0 src/socket.c=C2=A0 =C2=A0| 109 +++++++++++++++++++++++++++++++++=
++--------------<br>
&gt;=C2=A0 src/socket.h=C2=A0 =C2=A0|=C2=A0 =C2=A09 ++++<br>
&gt;=C2=A0 src/udp.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 73 +++++++++++++++++++++++=
+++-------<br>
&gt;=C2=A0 src/udp.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 6 files changed, 202 insertions(+), 48 deletions(-)<br>
&gt;<br>
&gt; QEMU:<br>
&gt;=C2=A0 hmp-commands.hx=C2=A0 =C2=A0 =C2=A0|=C2=A0 29 ++++-<br>
&gt;=C2=A0 include/net/slirp.h |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 net/slirp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 311 +++++++++++++=
++++++++++++++++++++++---------<br>
&gt;=C2=A0 qapi/net.json=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 slirp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +-<br>
&gt;=C2=A0 5 files changed, 279 insertions(+), 66 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.30.0.296.g2bfb1c46d8-goog<br>
&gt;<br>
&gt;<br>
<br>
<br>
-- <br>
Marc-Andr=C3=A9 Lureau<br>
</blockquote></div></div>

--00000000000001bc6c05b96eecb5--

