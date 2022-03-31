Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFB74EE258
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 22:08:08 +0200 (CEST)
Received: from localhost ([::1]:55668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na15T-0004CO-Ex
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 16:08:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1na13n-00030A-Jw
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:06:23 -0400
Received: from [2a00:1450:4864:20::22d] (port=35478
 helo=mail-lj1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1na13l-0007wY-As
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:06:23 -0400
Received: by mail-lj1-x22d.google.com with SMTP id h11so1254595ljb.2
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 13:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1gIC/TrBvBdrAoQGxKLHNSJg6H7Ycs4RoupLBGOkmu0=;
 b=UZ1LxPnhf56Yw6bzLmlJ7Fvi8w67RMbuIM+YxcjpTrEpAQ6kLDZYys5C9MHAmDM1q/
 JbUChE11TIcSPIHfKCN9Z1vvwno2ntI2DDMS4cWjGq6JUyP/j4zsEHjNLHYFx24ZN7pU
 na9h1DcvdicRup9rIMHv4HrK4/QVCOFf5BX/Ns+0pSJ+41uJWTu1SvTYQ4yyNKYVzQnc
 rH5dkX86t0kSn5GS5w16KBeSdqwMtHrLFRHv5MuenY1msa6rIK3+9JZrYYn99O+lpzjV
 hc/rO5ItGhRSjwCZUmkDlyry8o2op18sK8ga+cx/xjU0UmbQT98iMWw+cEVpVzzeyKbB
 tpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1gIC/TrBvBdrAoQGxKLHNSJg6H7Ycs4RoupLBGOkmu0=;
 b=qs4I+wzg2rWn3TNMfbJmboaLSMF1SFavtxssixKBkgbWw0+kpQb2mOT2MuR0yg0mlq
 r7+Qge03z2Qd+Ces2lhMwAB3EMeFOnycqDDEN353hWCBJq3G3TXhgBFuLljvnBmwqj6p
 Tq8VUm4NWuvcovBOW2xmgx1pKR8pXs6uW86DVhKRfPPbSc87/7u0/I+yZ+McQwAFvFCg
 TnDRhBD4ko7o2sQLlqcCUrsQpmpsMGAK4fjGq6IqMP1xM6/ptC6jLW3FwK2Ei0YISsWi
 keIznqd6ckFY74K4N79pbQhwFNobEkqwQbgcvklAwPlyYd6GA6GcyaM5WR5iBsjWp42C
 lcKw==
X-Gm-Message-State: AOAM531zCe4+rN6q7+7AX2kK41XarxLLpj/piWGC7MSkwwUeGH4LLLgW
 o1vCXmTW69F5A5lJzK/9kgoLxWQOCzI83hebH5I=
X-Google-Smtp-Source: ABdhPJz4LCvwwX+36Tu7rvYIxtrfQrvQhFF6/6Fsmb1FqMPpebV/4ZguQW9A/VaUdbagduJgrklEWOXn9VaZfpUnSfY=
X-Received: by 2002:a2e:a4b4:0:b0:246:2930:53d7 with SMTP id
 g20-20020a2ea4b4000000b00246293053d7mr11463349ljm.74.1648757176670; Thu, 31
 Mar 2022 13:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220331182651.887-1-wwcohen@gmail.com>
 <CAFEAcA9Ab_+8K-RcJeCFAmGkeu6xqL-dsAQuTETqRhCM6ncZmA@mail.gmail.com>
In-Reply-To: <CAFEAcA9Ab_+8K-RcJeCFAmGkeu6xqL-dsAQuTETqRhCM6ncZmA@mail.gmail.com>
From: Will Cohen <wwcohen@gmail.com>
Date: Thu, 31 Mar 2022 16:06:05 -0400
Message-ID: <CAB26zV2UkS4unxXkTLiF8T5aY9YaCpcUd2DRbzb0_FHTt+uyyw@mail.gmail.com>
Subject: Re: [PATCH v2] 9p: move P9_XATTR_SIZE_MAX from 9p.h to 9p.c
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d61e7805db893105"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x22d.google.com
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

--000000000000d61e7805db893105
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 31, 2022 at 4:00 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 31 Mar 2022 at 19:27, Will Cohen <wwcohen@gmail.com> wrote:
> >
> > The patch set adding 9p functionality to darwin introduced an issue
> > where limits.h, which defines XATTR_SIZE_MAX, is included in 9p.c,
> > though the referenced constant is needed in 9p.h. This commit fixes that
> > issue by moving the definition of P9_XATTR_SIZE_MAX, which uses
> > XATTR_SIZE_MAX, to also be in 9p.c.
> >
> > Additionally, this commit moves the location of the system headers
> > include in 9p.c to occur before the project headers.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/950
> > Fixes: 38d7fd68b0 ("9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX")
> >
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
> >  hw/9pfs/9p.c | 28 +++++++++++++++++++++++-----
> >  hw/9pfs/9p.h | 18 ------------------
> >  2 files changed, 23 insertions(+), 23 deletions(-)
> >
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index dcaa602d4c..b9152c7882 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -16,6 +16,11 @@
> >   * https://wiki.qemu.org/Documentation/9p
> >   */
> >
> > +#ifdef CONFIG_LINUX
> > +#include <linux/limits.h>
> > +#else
> > +#include <limits.h>
> > +#endif
> >  #include "qemu/osdep.h"
>
> osdep.h must always be the first include line in any .c file.
>

Understood, apologies -- if there's other changes for a v3 I can resubmit
accordingly, but if this otherwise looks okay then I would be fine with a
QEMU maintainer adjusting the header placement as needed when preparing for
submission to the main tree.

Will


>
> thanks
> -- PMM
>

--000000000000d61e7805db893105
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Mar 31, 2022 at 4:00 PM Peter May=
dell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.o=
rg</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Thu, 31 Mar 2022 at 19:27, Will Cohen &lt;<=
a href=3D"mailto:wwcohen@gmail.com" target=3D"_blank">wwcohen@gmail.com</a>=
&gt; wrote:<br>
&gt;<br>
&gt; The patch set adding 9p functionality to darwin introduced an issue<br=
>
&gt; where limits.h, which defines XATTR_SIZE_MAX, is included in 9p.c,<br>
&gt; though the referenced constant is needed in 9p.h. This commit fixes th=
at<br>
&gt; issue by moving the definition of P9_XATTR_SIZE_MAX, which uses<br>
&gt; XATTR_SIZE_MAX, to also be in 9p.c.<br>
&gt;<br>
&gt; Additionally, this commit moves the location of the system headers<br>
&gt; include in 9p.c to occur before the project headers.<br>
&gt;<br>
&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/950=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu=
/-/issues/950</a><br>
&gt; Fixes: 38d7fd68b0 (&quot;9p: darwin: Move XATTR_SIZE_MAX-&gt;P9_XATTR_=
SIZE_MAX&quot;)<br>
&gt;<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/9pfs/9p.c | 28 +++++++++++++++++++++++-----<br>
&gt;=C2=A0 hw/9pfs/9p.h | 18 ------------------<br>
&gt;=C2=A0 2 files changed, 23 insertions(+), 23 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c<br>
&gt; index dcaa602d4c..b9152c7882 100644<br>
&gt; --- a/hw/9pfs/9p.c<br>
&gt; +++ b/hw/9pfs/9p.c<br>
&gt; @@ -16,6 +16,11 @@<br>
&gt;=C2=A0 =C2=A0* <a href=3D"https://wiki.qemu.org/Documentation/9p" rel=
=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/Documentation/9p</a=
><br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;<br>
&gt; +#ifdef CONFIG_LINUX<br>
&gt; +#include &lt;linux/limits.h&gt;<br>
&gt; +#else<br>
&gt; +#include &lt;limits.h&gt;<br>
&gt; +#endif<br>
&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
<br>
osdep.h must always be the first include line in any .c file.<br></blockquo=
te><div>=C2=A0</div><div>Understood, apologies -- if there&#39;s other chan=
ges for a v3 I can resubmit accordingly, but if this otherwise looks okay t=
hen I would be fine with a QEMU maintainer adjusting the header placement a=
s needed when preparing for submission to the main tree.</div><div><br></di=
v><div>Will<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--000000000000d61e7805db893105--

