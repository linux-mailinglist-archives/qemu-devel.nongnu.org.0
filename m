Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1374C6DBEB2
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 07:02:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plNAm-0003ja-JF; Sun, 09 Apr 2023 01:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1plNAj-0003hy-Lh
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 01:01:02 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1plNAd-0008Bx-V0
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 01:01:01 -0400
Received: by mail-ej1-x631.google.com with SMTP id sg7so16974213ejc.9
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 22:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681016454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q58XBBYIFMh0zwY1x60q0iOmVZ6R/79z2AnAHuA5nvQ=;
 b=kC4DBf2qhmkfIWdUEtpNOF/KN6unsZFcxKdilzyy7jcXt1vLZ5wufuslxMpjazfhXR
 ufKmbNDdoCoyqerdqX6ksosXW+k0MF52yJ8MJRKMStmaQhZfQtI4i9CR0CU6GXfUWZpL
 pXL/DAcc42aDfkJ8mwsrJeVUj5rdFImGkcFtbV07wrSC/AMnlh1DolRk59hYmKvrXb7v
 Qp1pMnSLJEwsaMGGv5OW5IU9id2AURF3H6R/IXurLEqeK0/kl4/TIcd/2mB5qdFaAHGL
 uXL4EgT7U1qWQSiwKMdrA3NWAHqcjdRu7K7bN3ivLZMiDlcLI18+ejturfMYaEkLezVd
 46rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681016454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q58XBBYIFMh0zwY1x60q0iOmVZ6R/79z2AnAHuA5nvQ=;
 b=oqOGgX/N4geC7rbO5FkGB8v5Jd7uESH46NwcKQuwbPbNBAJeZ7KvzQeyNFYYNUiRKP
 A7DfXYfwQgKKkhagCe4fHxsHPRfGw/DwCts55WUx+oS+KxoNof6L7rXfPIi56F+TNXuF
 dV9ytu8r111WrjMa4tr4W+eZa3rwK0j5ApQdwmv74Fsf733Rn4ICbv0Fmd/OEQuqrLJa
 ovL9+t3tmpXniGbm8nP0JXQl1m9RYYXpd8NpGEGMc95p56CPaZlUXWV5tPQxtiOOzNxc
 Ctcb+v4yEmszWQO0anz2I80tC4kB0xKL4fTvepnX9eplrOJprRmStwLTP1RgTVsMa0Nj
 yHtQ==
X-Gm-Message-State: AAQBX9cofHtNN0F9WNzDshRr0H+KgMfWj0zzu4DyvQzBrAjSOlQPnVV6
 nJvX/bl5KC0UdexAMX7Wqf7xcssS4mgh8A3b/1axpw==
X-Google-Smtp-Source: AKy350YfpRew6z+9V+qMT8cEAXYEG/G2VSn99ACqhPhEGm8AAvPPhUK1leq4yCpfQYVYTnwJPvJWmN5ACEfzQ460aAA=
X-Received: by 2002:a17:906:4a88:b0:931:6921:bdbb with SMTP id
 x8-20020a1709064a8800b009316921bdbbmr1512421eju.2.1681016453805; Sat, 08 Apr
 2023 22:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-15-imp@bsdimp.com>
 <ec3175a6-e793-9ad0-3afc-15db35281385@linaro.org>
In-Reply-To: <ec3175a6-e793-9ad0-3afc-15db35281385@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 8 Apr 2023 23:00:46 -0600
Message-ID: <CANCZdfpoO_bSn6BObQT+Dy=cON_MBFODGQU3OjHyzgu1bggt+w@mail.gmail.com>
Subject: Re: [PATCH 14/16] bsd-user: Implment core dumps
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, reinoud@netbsd.org, riastradh@netbsd.org, 
 ryoon@netbsd.org, jrtc27@jrtc27.com, kevans@freebsd.org, 
 Brad Smith <brad@comstyle.com>, Stacey Son <sson@freebsd.org>,
 Ed Schouten <ed@nuxi.nl>
Content-Type: multipart/alternative; boundary="000000000000974a7f05f8e0241d"
Received-SPF: none client-ip=2a00:1450:4864:20::631;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x631.google.com
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

--000000000000974a7f05f8e0241d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 8, 2023 at 1:15=E2=80=AFPM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 4/5/23 14:36, Warner Losh wrote:
> > From: Stacey Son <sson@FreeBSD.org>
> >
> > Bring in the code that was originally copied from linxu-user/elfload.c
> > and moved to elfcore.c. This code then removed the Linux specific bits,
> > replacing them with FreeBSD specific bits. The commit history for this
> > is not at all what we'd like (it was done in one go by sson in
> > 227070562fc in one commit, with very few followup tweaks). Since the
> > original commit, this code has been moved, and updated by sson and ed
> > slightly. That makes it hard to split into smaller commits.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Ed Schouten <ed@nuxi.nl>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/elfcore.c | 1318 +++++++++++++++++++++++++++++++++++++++++++=
-
> >   1 file changed, 1315 insertions(+), 3 deletions(-)
> >
> > diff --git a/bsd-user/elfcore.c b/bsd-user/elfcore.c
> > index c49d9280e2d..2905f2b8414 100644
> > --- a/bsd-user/elfcore.c
> > +++ b/bsd-user/elfcore.c
> > @@ -1,10 +1,1322 @@
> > -/* Stubbed out version of core dump support, explicitly in public
> domain */
> > +/*
> > + *  ELF loading code
> > + *
> > + *  Copyright (c) 2015 Stacey D. Son
> > + *
> > + *  This program is free software; you can redistribute it and/or modi=
fy
> > + *  it under the terms of the GNU General Public License as published =
by
> > + *  the Free Software Foundation; either version 2 of the License, or
> > + *  (at your option) any later version.
> > + *
> > + *  This program is distributed in the hope that it will be useful,
> > + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *  GNU General Public License for more details.
> > + *
> > + *  You should have received a copy of the GNU General Public License
> > + *  along with this program; if not, see <http://www.gnu.org/licenses/
> >.
> > + */
> > +#include "qemu/osdep.h"
> >
> > -static int elf_core_dump(int signr, CPUArchState *env)
> > +#ifdef USE_ELF_CORE_DUMP
>
> Would this ever be unset?
>

I was sure that some architectures didn't use this. However, they all have
them, so I'll
remove it.


> Typo in subject.
>

Doh! Yes. Thanks.


> I'm not going to review this one line by line, but
>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>

I've looked at this at a high level, and it seems legit...  But it is a bit
daunting... And for a 'debug' feature,
I'm OK with 'working and looks OK'... If it were more central, I'd worry
more about it, but we still have
about 20k lines to upstream and I'd rather more of them be looked at than
this if push comes to shove....

Warner


> r~
>

--000000000000974a7f05f8e0241d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 8, 2023 at 1:15=E2=80=AFP=
M Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">ric=
hard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 4/5/23 14:36, Warner Losh wrote:<br>
&gt; From: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; <br>
&gt; Bring in the code that was originally copied from linxu-user/elfload.c=
<br>
&gt; and moved to elfcore.c. This code then removed the Linux specific bits=
,<br>
&gt; replacing them with FreeBSD specific bits. The commit history for this=
<br>
&gt; is not at all what we&#39;d like (it was done in one go by sson in<br>
&gt; 227070562fc in one commit, with very few followup tweaks). Since the<b=
r>
&gt; original commit, this code has been moved, and updated by sson and ed<=
br>
&gt; slightly. That makes it hard to split into smaller commits.<br>
&gt; <br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Ed Schouten &lt;<a href=3D"mailto:ed@nuxi.nl" target=3D=
"_blank">ed@nuxi.nl</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/elfcore.c | 1318 ++++++++++++++++++++++++++++++++=
+++++++++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 1315 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/bsd-user/elfcore.c b/bsd-user/elfcore.c<br>
&gt; index c49d9280e2d..2905f2b8414 100644<br>
&gt; --- a/bsd-user/elfcore.c<br>
&gt; +++ b/bsd-user/elfcore.c<br>
&gt; @@ -1,10 +1,1322 @@<br>
&gt; -/* Stubbed out version of core dump support, explicitly in public dom=
ain */<br>
&gt; +/*<br>
&gt; + *=C2=A0 ELF loading code<br>
&gt; + *<br>
&gt; + *=C2=A0 Copyright (c) 2015 Stacey D. Son<br>
&gt; + *<br>
&gt; + *=C2=A0 This program is free software; you can redistribute it and/o=
r modify<br>
&gt; + *=C2=A0 it under the terms of the GNU General Public License as publ=
ished by<br>
&gt; + *=C2=A0 the Free Software Foundation; either version 2 of the Licens=
e, or<br>
&gt; + *=C2=A0 (at your option) any later version.<br>
&gt; + *<br>
&gt; + *=C2=A0 This program is distributed in the hope that it will be usef=
ul,<br>
&gt; + *=C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty =
of<br>
&gt; + *=C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 S=
ee the<br>
&gt; + *=C2=A0 GNU General Public License for more details.<br>
&gt; + *<br>
&gt; + *=C2=A0 You should have received a copy of the GNU General Public Li=
cense<br>
&gt; + *=C2=A0 along with this program; if not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
&gt; + */<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -static int elf_core_dump(int signr, CPUArchState *env)<br>
&gt; +#ifdef USE_ELF_CORE_DUMP<br>
<br>
Would this ever be unset?<br></blockquote><div><br></div><div>I was sure th=
at some architectures didn&#39;t use this. However, they all have them, so =
I&#39;ll</div><div>remove it.<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Typo in subject.<br></blockquote><div><br></div><div>Doh! Yes. Thanks.<br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I&#39;m not going to review this one line by line, but<br>
<br>
Acked-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.=
org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockquote=
><div><br></div><div>I&#39;ve looked at this at a high level, and it seems =
legit...=C2=A0 But it is a bit daunting... And for a &#39;debug&#39; featur=
e,</div><div>I&#39;m OK with &#39;working and looks OK&#39;... If it were m=
ore central, I&#39;d worry more about it, but we still have</div><div>about=
 20k lines to upstream and I&#39;d rather more of them be looked at than th=
is if push comes to shove....<br></div><div><br></div><div>Warner <br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
r~<br>
</blockquote></div></div>

--000000000000974a7f05f8e0241d--

