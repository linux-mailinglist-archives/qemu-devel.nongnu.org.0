Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B774ECF4E
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 00:01:40 +0200 (CEST)
Received: from localhost ([::1]:55766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZgNn-00038u-7U
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 18:01:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nZgI7-0004E9-Bf
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:55:47 -0400
Received: from [2a00:1450:4864:20::132] (port=44553
 helo=mail-lf1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nZgI5-0008A4-Ce
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:55:47 -0400
Received: by mail-lf1-x132.google.com with SMTP id m3so38156997lfj.11
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q+wss07gm/ONYJEeKoYpyGvo2AUgk6VSR7XOUKgs/wQ=;
 b=WCHcjXpgqcnxoJhE5S6C4DkCPooYLv9KvH2xeHJUJDne2Z5e3CU/LLYRbQ/6tKOLjd
 so1O07I4c2qkP5/h+klhIRv7Fx2J1sZJez2FF7HWLOi3RNYrDArzbNVykyy/c6XMuVf7
 Cq22LWnmLVHlZHAX9HqcZPiXTJUNKG2YLktkD/zbHNsB+Uh9UYHDGdUAWabLMsyDbHH5
 bjbn80TSAUFaj3Fm8d+mHifdR7IXJJ04Oh0ZDrEwX72OjA7zVkBwEv5l+kzFQECputM1
 8XxjB/R1z+hWshhkKvYf3lBEvWwAovktC5JfvY3KD/tLOUu0YnBqWwMQoHMxnCEX4e4n
 64WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q+wss07gm/ONYJEeKoYpyGvo2AUgk6VSR7XOUKgs/wQ=;
 b=LJENvceNmUqMawVtsk5BH+6bfreYBLzPKC++zbkwbTHMavA3BioLZ75VKh/9RX+dli
 WwiGMnyHDZqNOHyBAXcECBfJo32ffX3G/qU5bdAolH29q0sy6ijaCraHWjJeCCfo9uyI
 X5NPriXi4UDpDDY9LBOSXMd/ZlxJb0IUE3luzL8BAyF3IuKby06REgg4Mdy6ZLajXuJE
 rfyu2JCyoKiL4NGATkZ/IIRqSulpXF8k9A+mynSxOu4kCiboHTWkBdpPPknkMFc7aifa
 mHTmZDNqwSUcoE7G59EiAexePn8z/3KwQjKoJfqYAnXKLeHtcZmAZ/a3Z0OgFcsOlpk6
 dJ6w==
X-Gm-Message-State: AOAM533QyNqQ+tVVyPGAxlouSIdrWbBwmaXFlmoIjsPSnzfvseu14pws
 hKJqX9dIrdlJ9CVGEIssuqItHKqTGFcp8F11Co8=
X-Google-Smtp-Source: ABdhPJxLKpwKGPoNQ4sP3Oin04PWgoCVnMhEdPWkKoDekI5LO401K7sEf32UUhLT0NSI0/0We1P5EGfzet+ChAqLZjo=
X-Received: by 2002:a05:6512:1585:b0:448:3936:a5a0 with SMTP id
 bp5-20020a056512158500b004483936a5a0mr8327403lfb.108.1648677343136; Wed, 30
 Mar 2022 14:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220330181947.68497-1-wwcohen@gmail.com>
 <CAFEAcA-a8BUqGGGMPexauFq-DEwSy6SQc9G9MuH=WX3P2H1a1A@mail.gmail.com>
In-Reply-To: <CAFEAcA-a8BUqGGGMPexauFq-DEwSy6SQc9G9MuH=WX3P2H1a1A@mail.gmail.com>
From: Will Cohen <wwcohen@gmail.com>
Date: Wed, 30 Mar 2022 17:55:29 -0400
Message-ID: <CAB26zV2zZg3Nri9i4LcnCvYkX-T33Pbn2FwU6hP_LEKiab_tVA@mail.gmail.com>
Subject: Re: [PATCH] 9p: move limits.h include from 9p.c to 9p.h
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000630f1105db769b73"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::132
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x132.google.com
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
 Michael Roitzsch <reactorcontrol@icloud.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000630f1105db769b73
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 30, 2022 at 5:31 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 30 Mar 2022 at 19:26, Will Cohen <wwcohen@gmail.com> wrote:
> >
> > As noted by https://gitlab.com/qemu-project/qemu/-/issues/950, within
> > the patch set adding 9p functionality to darwin, the commit
> > 38d7fd68b0c8775b5253ab84367419621aa032e6 introduced an issue where
> > limits.h, which defines XATTR_SIZE_MAX, is included in 9p.c, though the
> > referenced constant is needed in 9p.h. This commit fixes that issue by
> > moving the include to 9p.h.
> >
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
> >  hw/9pfs/9p.c | 5 -----
> >  hw/9pfs/9p.h | 5 +++++
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index dcaa602d4c..59c531ed47 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -33,11 +33,6 @@
> >  #include "migration/blocker.h"
> >  #include "qemu/xxhash.h"
> >  #include <math.h>
> > -#ifdef CONFIG_LINUX
> > -#include <linux/limits.h>
> > -#else
> > -#include <limits.h>
> > -#endif
> >
> >  int open_fd_hw;
> >  int total_open_fd;
> > diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> > index af2635fae9..0ce4da375c 100644
> > --- a/hw/9pfs/9p.h
> > +++ b/hw/9pfs/9p.h
> > @@ -9,6 +9,11 @@
> >  #include "qemu/thread.h"
> >  #include "qemu/coroutine.h"
> >  #include "qemu/qht.h"
> > +#ifdef CONFIG_LINUX
> > +#include <linux/limits.h>
> > +#else
> > +#include <limits.h>
> > +#endif
>
> Is it possible to do this with a meson.build check for whatever
> host property we're relying on here rather than with a
> "which OS is this?" ifdef ?
>

To confirm -- the game plan in this case would be to do a check for
something along the lines of
config_host_data.set('CONFIG_XATTR_SIZE_MAX',
cc.has_header_symbol('linux/limits.h', 'XATTR_SIZE_MAX'))
and using that in the corresponding ifs, right?

That makes sense -- if there's no objections, I'll go this route for v2,
which I can submit tomorrow.


> thanks
> -- PMM
>

--000000000000630f1105db769b73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Mar 30, 2022 at 5:31 PM Peter May=
dell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.o=
rg</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Wed, 30 Mar 2022 at 19:26, Will Cohen &lt;<=
a href=3D"mailto:wwcohen@gmail.com" target=3D"_blank">wwcohen@gmail.com</a>=
&gt; wrote:<br>
&gt;<br>
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
&gt;<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/9pfs/9p.c | 5 -----<br>
&gt;=C2=A0 hw/9pfs/9p.h | 5 +++++<br>
&gt;=C2=A0 2 files changed, 5 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c<br>
&gt; index dcaa602d4c..59c531ed47 100644<br>
&gt; --- a/hw/9pfs/9p.c<br>
&gt; +++ b/hw/9pfs/9p.c<br>
&gt; @@ -33,11 +33,6 @@<br>
&gt;=C2=A0 #include &quot;migration/blocker.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/xxhash.h&quot;<br>
&gt;=C2=A0 #include &lt;math.h&gt;<br>
&gt; -#ifdef CONFIG_LINUX<br>
&gt; -#include &lt;linux/limits.h&gt;<br>
&gt; -#else<br>
&gt; -#include &lt;limits.h&gt;<br>
&gt; -#endif<br>
&gt;<br>
&gt;=C2=A0 int open_fd_hw;<br>
&gt;=C2=A0 int total_open_fd;<br>
&gt; diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h<br>
&gt; index af2635fae9..0ce4da375c 100644<br>
&gt; --- a/hw/9pfs/9p.h<br>
&gt; +++ b/hw/9pfs/9p.h<br>
&gt; @@ -9,6 +9,11 @@<br>
&gt;=C2=A0 #include &quot;qemu/thread.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/coroutine.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/qht.h&quot;<br>
&gt; +#ifdef CONFIG_LINUX<br>
&gt; +#include &lt;linux/limits.h&gt;<br>
&gt; +#else<br>
&gt; +#include &lt;limits.h&gt;<br>
&gt; +#endif<br>
<br>
Is it possible to do this with a meson.build check for whatever<br>
host property we&#39;re relying on here rather than with a<br>
&quot;which OS is this?&quot; ifdef ?<br></blockquote><div><br></div><div>T=
o confirm -- the game plan in this case would be to do a check for somethin=
g along the lines of<br></div><div>config_host_data.set(&#39;CONFIG_XATTR_S=
IZE_MAX&#39;, cc.has_header_symbol(&#39;linux/limits.h&#39;, &#39;XATTR_SIZ=
E_MAX&#39;))</div><div>and using that in the corresponding ifs, right? <br>=
</div><div><br></div><div>That makes sense -- if there&#39;s no objections,=
 I&#39;ll go this route for v2, which I can submit tomorrow.</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--000000000000630f1105db769b73--

