Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577BA3E3BAA
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 18:45:54 +0200 (CEST)
Received: from localhost ([::1]:51786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mClvs-0000zg-Tz
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 12:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mClue-0000GG-Jt
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 12:44:36 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:40514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mCluc-0008Pz-Ml
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 12:44:36 -0400
Received: by mail-qt1-x82f.google.com with SMTP id y9so349451qtv.7
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 09:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mL+DYZxNVsL7icvPcQBpdo9LOi3nR/q2KI697GssCzk=;
 b=A3awW9j0prYGRg3w3xDzQoVcJeIgwgffYJto4gqpIGSQw3bv9yW1hd6yNIkIn1DVKP
 bRogb38DMARvcp8t/1J0b5EnHfF2R+te4RQT6GNbkUIX6uLyYG25nlk+H4G5jwLDJIBi
 PRJWG+n9wWHXunXWCxLdIkqjbLEbdL54Nf1lEBJZPfGYud52z0etOrrSKLQBY28BSy4q
 64vAN/6MXVNiFd6vXeDW71AitRxyJPdea+/1NFCz6QX6gQIcCz/AuUkNfnax9xGLbBNg
 BTiVUoSbfxKhcES/fHELxJkCNeOwWgY8DHpExhD6Q84prICGwyjIXcvLwaFqmkaFklYa
 7ERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mL+DYZxNVsL7icvPcQBpdo9LOi3nR/q2KI697GssCzk=;
 b=WBtl7g/sd/PQs/HGCDVb1C2RZFdJJfG5FIc9X/5/bVQpTwXpp/IO6wGxc50fTzTu2y
 FcT3g6Ntk7Vq6hUHeuVAXazh69P7Ob6i/HgjT0A1rO+zeNltrznwSOM36nZ004DeXwy8
 LpvLSrQTBW/HUBbX5kyy5jwhtnp1N88f2p7oESPaP3K7A8u1vw/J4X//2QpX3MF/n4jn
 Pn04u90G9SV/l/KZXVSyARXAZd4uYnrcA0graWtA4f7HusJAcHa4fLzdS02dn35Mwb6L
 FGlh1eNZGJNTX0AXHa9GYDLAb0JxZLL/M95UtErUCO6M2XdHlenH0jl+x2s26mbRZXsX
 YF7Q==
X-Gm-Message-State: AOAM532Z8G+01lf69qPXMRFpudvqYOPkgwSrnGwYkNuI4MJjZp5oJkVm
 e4cLMViFIikcD+hf2ddfjkPrNpw32PI4ab/jxLHDwQ==
X-Google-Smtp-Source: ABdhPJwADuf4O5Hjy3a3jl5I6JZEIP4zHcOLVaIKy+3gEazXt7sJCMo4Ax5xjwLDvLeDtOVRYerBYD3I8UQpmrdOZf8=
X-Received: by 2002:ac8:6759:: with SMTP id n25mr16582197qtp.49.1628441073235; 
 Sun, 08 Aug 2021 09:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-21-imp@bsdimp.com>
 <cb6879c2-441b-dde6-2768-47963bbb60fa@linaro.org>
In-Reply-To: <cb6879c2-441b-dde6-2768-47963bbb60fa@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 8 Aug 2021 10:44:22 -0600
Message-ID: <CANCZdfq8UUiv2NtVUULGKRzswEPKsWey-wPoZ2xP5F-sq9ng8A@mail.gmail.com>
Subject: Re: [PATCH for 6.2 20/49] bsd-user: save the path the qemu emulator
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b54cb005c90efba3"
Received-SPF: none client-ip=2607:f8b0:4864:20::82f;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b54cb005c90efba3
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 7, 2021 at 11:24 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/7/21 11:42 AM, Warner Losh wrote:
> > Save the path to the qemu emulator. This will be used later when we have
> > a more complete implementation of exec.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/main.c | 21 +++++++++++++++++++++
> >   bsd-user/qemu.h |  1 +
> >   2 files changed, 22 insertions(+)
>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>
> > +char qemu_proc_pathname[PATH_MAX];  /* full path to exeutable */
> ...
> > +    len = PATH_MAX;
>
> Maybe better with sizeof?
>

It is. Thanks! Will make the change.

Warner

--000000000000b54cb005c90efba3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 7, 2021 at 11:24 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 8/7/21 11:42 AM, Warner Losh wrote:<br>
&gt; Save the path to the qemu emulator. This will be used later when we ha=
ve<br>
&gt; a more complete implementation of exec.<br>
&gt; <br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/main.c | 21 +++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0bsd-user/qemu.h |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A02 files changed, 22 insertions(+)<br>
<br>
Acked-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.=
org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
&gt; +char qemu_proc_pathname[PATH_MAX];=C2=A0 /* full path to exeutable */=
<br>
...<br>
&gt; +=C2=A0 =C2=A0 len =3D PATH_MAX;<br>
<br>
Maybe better with sizeof?<br></blockquote><div><br></div><div>It is. Thanks=
! Will make the change.</div><div><br></div><div>Warner=C2=A0</div></div></=
div>

--000000000000b54cb005c90efba3--

