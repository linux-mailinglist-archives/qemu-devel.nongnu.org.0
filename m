Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D966F4ECE94
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:18:14 +0200 (CEST)
Received: from localhost ([::1]:33806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZfhl-0006z2-GA
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:18:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nZfgt-0006Gm-MC
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:17:19 -0400
Received: from [2a00:1450:4864:20::12f] (port=45578
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nZfgr-0007KI-Ob
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:17:19 -0400
Received: by mail-lf1-x12f.google.com with SMTP id p10so32150866lfa.12
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sgauWVefrby6egrHcV7Dg0WPBqrilhJmRETLNAuABKs=;
 b=gFBHPTo0EVS/u8FV+LLYu6x7bbMLmkAJr4VAwTle9+yyLX3mODRShuI7LkJfwxZ9qe
 bDla8Ui+fVgPAGMWvLnnqwuxeLUEAkcBEGJe0/4iXcN8YrHviQOIq71hzeFNhqAkqnpn
 qkUnXlfDdYjA/ZTkaaBB5gxbOO0dYr2dfP5d1RKA33TnOOjl4pjb7S5frTkpb8DmEISU
 U+9t1om2q3dqfxlCAXLGrcORdCtNCuslZFWO6GVvWP+fIfjoA8vp7bG/GV6CsETLg/8n
 Cao5RbMrbPOnrUzF9+s8IheI3Xj4F72XpoDzctvhApbogbYHxQJWrfV1eM1kR31z5ohu
 X0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sgauWVefrby6egrHcV7Dg0WPBqrilhJmRETLNAuABKs=;
 b=0RnRXr+9Cy4AdnZ5FiG+b5UOA4sjlGzW9I+9sdNGjDeDRQSI+oap9vDMi0S5w1zLuR
 Hy0b/yko/vbZTsT6yLtZ+5Hnu+G+weAD4HMugCMERsqKvwMq15UtTTpB48/bsENejJCU
 +72qqtH/as69ebEwet8Bnf5GMINi8z1/LeUMhWfO5LxvVd1SgubQM96MtVPDmK5sqzJv
 XvJmkXVXLe12zHtPn7fOOHI1awqoQkkMPE3J4IALXnc9sIuKu1n2tDnGHjPixwkG39SB
 xH161LIUv5tcdFIUVuDvra/HUNBsqoq5WsyrRWgAssJrG5sRglOARRWks+bmrLMS1Jai
 srxA==
X-Gm-Message-State: AOAM531YnEtHoEOcaigoXfYktb6gFI8GlhxZ21u3MnWaIbKnGUAe1nnp
 Ex1fweF1xwGmIOUO3XCyIYoQ+532n+JjpE0I5Ss=
X-Google-Smtp-Source: ABdhPJzW6g9ODNK6tMT28Jt6fGtKirDzCpTXWTOUQfCL9ajl7O7L7jjSxgkWUjejQH/cjLK3s2YJYl8K7RdpUF1LU98=
X-Received: by 2002:a05:6512:1585:b0:448:3936:a5a0 with SMTP id
 bp5-20020a056512158500b004483936a5a0mr8222477lfb.108.1648675035563; Wed, 30
 Mar 2022 14:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220330181947.68497-1-wwcohen@gmail.com>
 <b7487b9a-fda3-3576-34b3-5cf556c83de6@gmail.com>
In-Reply-To: <b7487b9a-fda3-3576-34b3-5cf556c83de6@gmail.com>
From: Will Cohen <wwcohen@gmail.com>
Date: Wed, 30 Mar 2022 17:17:02 -0400
Message-ID: <CAB26zV0StFAcX3KbwfTpXZxjza8N0gr2S5zMwQEJPCKxBEQ5Sw@mail.gmail.com>
Subject: Re: [PATCH] 9p: move limits.h include from 9p.c to 9p.h
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d84bad05db7611a4"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Fabian Franz <fabianfranz.oss@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d84bad05db7611a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 4:24 PM Philippe Mathieu-Daud=C3=A9 <
philippe.mathieu.daude@gmail.com> wrote:

> Hi,
>
> On 30/3/22 20:19, Will Cohen wrote:
> > As noted by https://gitlab.com/qemu-project/qemu/-/issues/950, within
> > the patch set adding 9p functionality to darwin, the commit
> > 38d7fd68b0c8775b5253ab84367419621aa032e6 introduced an issue where
> > limits.h, which defines XATTR_SIZE_MAX, is included in 9p.c, though the
> > referenced constant is needed in 9p.h. This commit fixes that issue by
> > moving the include to 9p.h.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/950


Thanks -- I'll adjust the syntax accordingly in v2.


>
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
> >   hw/9pfs/9p.c | 5 -----
> >   hw/9pfs/9p.h | 5 +++++
> >   2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index dcaa602d4c..59c531ed47 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -33,11 +33,6 @@
> >   #include "migration/blocker.h"
> >   #include "qemu/xxhash.h"
> >   #include <math.h>
> > -#ifdef CONFIG_LINUX
> > -#include <linux/limits.h>
> > -#else
> > -#include <limits.h>
> > -#endif
> >
> >   int open_fd_hw;
> >   int total_open_fd;
> > diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> > index af2635fae9..0ce4da375c 100644
> > --- a/hw/9pfs/9p.h
> > +++ b/hw/9pfs/9p.h
> > @@ -9,6 +9,11 @@
> >   #include "qemu/thread.h"
> >   #include "qemu/coroutine.h"
> >   #include "qemu/qht.h"
> > +#ifdef CONFIG_LINUX
> > +#include <linux/limits.h>
> > +#else
> > +#include <limits.h>
> > +#endif
>
> Except XATTR_SIZE_MAX, I don't see anything in 9p.h which
> requires <limits.h>.
>
> $ git grep P9_XATTR_SIZE_MAX
> hw/9pfs/9p.c:3960:    if (size > P9_XATTR_SIZE_MAX) {
> hw/9pfs/9p.h:484:#define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
> hw/9pfs/9p.h:495:#define P9_XATTR_SIZE_MAX 65536
> hw/9pfs/9p.h:497:#error Missing definition for P9_XATTR_SIZE_MAX for
> this host system
>
> Only 9p.c requires this definition, what about moving the
> offending code to the .c?
>

That works as well. I suppose I was just trying to keep it conceptually
cleaner with the constants in the .h, but on second thought I agree keeping
it more efficiently contained in the .c is a better move. Will resubmit
with that change as v2.


>
> Regards,
>
> Phil.
>

--000000000000d84bad05db7611a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Mar 30, 2022 at 4:24 PM Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philippe.mathieu.daude@gmail.com">=
philippe.mathieu.daude@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On 30/3/22 20:19, Will Cohen wrote:<br>
&gt; As noted by <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/9=
50" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qe=
mu/-/issues/950</a>, within<br>
&gt; the patch set adding 9p functionality to darwin, the commit<br>
&gt; 38d7fd68b0c8775b5253ab84367419621aa032e6 introduced an issue where<br>
&gt; limits.h, which defines XATTR_SIZE_MAX, is included in 9p.c, though th=
e<br>
&gt; referenced constant is needed in 9p.h. This commit fixes that issue by=
<br>
&gt; moving the include to 9p.h.<br>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/950" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/is=
sues/950</a></blockquote><div><br></div><div>Thanks -- I&#39;ll adjust the =
syntax accordingly in v2.</div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><br>
<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/9pfs/9p.c | 5 -----<br>
&gt;=C2=A0 =C2=A0hw/9pfs/9p.h | 5 +++++<br>
&gt;=C2=A0 =C2=A02 files changed, 5 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c<br>
&gt; index dcaa602d4c..59c531ed47 100644<br>
&gt; --- a/hw/9pfs/9p.c<br>
&gt; +++ b/hw/9pfs/9p.c<br>
&gt; @@ -33,11 +33,6 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;migration/blocker.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/xxhash.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &lt;math.h&gt;<br>
&gt; -#ifdef CONFIG_LINUX<br>
&gt; -#include &lt;linux/limits.h&gt;<br>
&gt; -#else<br>
&gt; -#include &lt;limits.h&gt;<br>
&gt; -#endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0int open_fd_hw;<br>
&gt;=C2=A0 =C2=A0int total_open_fd;<br>
&gt; diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h<br>
&gt; index af2635fae9..0ce4da375c 100644<br>
&gt; --- a/hw/9pfs/9p.h<br>
&gt; +++ b/hw/9pfs/9p.h<br>
&gt; @@ -9,6 +9,11 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/thread.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/coroutine.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/qht.h&quot;<br>
&gt; +#ifdef CONFIG_LINUX<br>
&gt; +#include &lt;linux/limits.h&gt;<br>
&gt; +#else<br>
&gt; +#include &lt;limits.h&gt;<br>
&gt; +#endif<br>
<br>
Except XATTR_SIZE_MAX, I don&#39;t see anything in 9p.h which<br>
requires &lt;limits.h&gt;.<br>
<br>
$ git grep P9_XATTR_SIZE_MAX<br>
hw/9pfs/9p.c:3960:=C2=A0 =C2=A0 if (size &gt; P9_XATTR_SIZE_MAX) {<br>
hw/9pfs/9p.h:484:#define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX<br>
hw/9pfs/9p.h:495:#define P9_XATTR_SIZE_MAX 65536<br>
hw/9pfs/9p.h:497:#error Missing definition for P9_XATTR_SIZE_MAX for <br>
this host system<br>
<br>
Only 9p.c requires this definition, what about moving the<br>
offending code to the .c?<br></blockquote><div><br></div><div>That works as=
 well. I suppose I was just trying to keep it conceptually cleaner with the=
 constants in the .h, but on second thought I agree keeping it more efficie=
ntly contained in the .c is a better move. Will resubmit with that change a=
s v2.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
Regards,<br>
<br>
Phil.<br>
</blockquote></div></div>

--000000000000d84bad05db7611a4--

