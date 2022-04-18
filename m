Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD5550604C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 01:38:10 +0200 (CEST)
Received: from localhost ([::1]:33770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngawb-0004yl-Ut
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 19:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ngavP-0003V5-Qz
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 19:36:55 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ngavO-0001N4-Ay
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 19:36:55 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o5-20020a17090ad20500b001ca8a1dc47aso677620pju.1
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 16:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NzkSN2GpIcC4cZVEfohlKZsZVl7gN6uf7ymut2ymjx8=;
 b=Bn139rtSgZzLguSzijUkA6VsIseSCAoByLk3ONE3sV1ApIUM5B9uSulix+jdRe16bv
 BOKIwJSQ1UbhdmM/wAKTN8fFxgmilsyqyc/M7hcZlNXFvF/WIfldfvP2rFF9R31hxJaN
 5Kcw163Z+1i3J59UbwW4TF+sBaGgYwgsNO1hfprvQGntX8DieqvNcvzsqYFZxnMVnvVg
 mxc41Tp9+ctAqX7Lo4pr/YzjbphHZhXpI8s1QvDfrzJRlOxv1qnXKw83UT2HVtNsXKg+
 7084X/TLDuQemzMCUDiGfpv30NOMoNmB1Thv5aywHrZL0cRVpQN6yE14YDqgPuaH/Xbx
 1QQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NzkSN2GpIcC4cZVEfohlKZsZVl7gN6uf7ymut2ymjx8=;
 b=qjf7jpKDSPJLy69j4fuVFZGQ7ot9DerKvn2UfPXObdC9vpwPqCVBx8qeNuKYDmQPpU
 ea+kv3TuBzz7OQFRuYHHcAxO0YuK04RUa9gyesQZN01+jpJ/827xlLs1DBQX7fm2/7Zd
 19j/aoEbKv+OKwV231qzKE75DAslmttRdWV1tWI4HQV97u4MT9WpRAfOhCpXgxGDTtFc
 1ByxPN7g2sX5G/jk0JsTA42G/xLxrFbKHfhq0wNtsNtv/dtMcDYBDwirWd8F8Jmo3F95
 A/hkhrWssweK9Evad7neCsJ74IghoQTSAWQaa8+tgNBpnoI3Z+wBuSDxamonEvLmeqol
 ntbg==
X-Gm-Message-State: AOAM531VjQqNCpwEgIBozvb0z4zUonVZr12pz7aEhiwNdZBqxpehh8AC
 v5TWQU+1MKRuOGAao0KhQTU4Yt67y5+RCoD6OuM=
X-Google-Smtp-Source: ABdhPJwvGYc4Tlx7H9g5Doj5rwGOqSkTsMJOig/pakFIcvuqFZl/WL0IEXqeyXOprT3bjLBWSHP0a9RJXvkBlqaM3g8=
X-Received: by 2002:a17:903:2406:b0:158:72dc:2d73 with SMTP id
 e6-20020a170903240600b0015872dc2d73mr13376059plo.46.1650325013084; Mon, 18
 Apr 2022 16:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220418090504.50107-1-faithilikerun@gmail.com>
 <a2cce793-3193-4026-c1da-d62c2741fcde@wdc.com>
In-Reply-To: <a2cce793-3193-4026-c1da-d62c2741fcde@wdc.com>
From: olc <faithilikerun@gmail.com>
Date: Tue, 19 Apr 2022 07:36:42 +0800
Message-ID: <CAAAx-8KtA7dmtZ4yzVc-H-K3FyHrvV0YkWDaPHLH6XCX4q8jQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Use io_ring_register_ring_fd() to skip fd operations
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: multipart/alternative; boundary="0000000000002b3de305dcf63c27"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1032.google.com
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
Cc: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002b3de305dcf63c27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for noticing the problem. I've done that.

Sam

Damien Le Moal <Damien.LeMoal@wdc.com> =E4=BA=8E2022=E5=B9=B44=E6=9C=8819=
=E6=97=A5=E5=91=A8=E4=BA=8C 06:24=E5=86=99=E9=81=93=EF=BC=9A

> On 2022/04/18 18:05, Sam Li wrote:
> > fix code style issue.
>
> This patch must be squashed into the previous one.
>
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  block/io_uring.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/block/io_uring.c b/block/io_uring.c
> > index 2942967126..57745ecfa1 100644
> > --- a/block/io_uring.c
> > +++ b/block/io_uring.c
> > @@ -436,10 +436,15 @@ LuringState *luring_init(Error **errp)
> >
> >      ioq_init(&s->io_q);
> >      if (io_uring_register_ring_fd(&s->ring) < 0) {
> > -        error_setg_errno(errp, errno, "failed to register linux
> io_uring ring file descriptor");
> > +        /*
> > +         * If the function fails, it will fallback to the non-optimize=
d
> io_uring
> > +         * operations.
> > +         */
>
> The comment wording is a little odd: given that the comment is inside the
> "if",
> meaning that we are in the case "the function failed", saying "if the
> function
> fails..." is strange. You could simply state something like:
>
>         /*
>          * Only warn about this error: we will fall back to the
> non-optimized
>          * io_uring operations.
>          */
>
> > +        error_setg_errno(errp, errno,
> > +                         "failed to register linux io_uring ring file
> descriptor");
> >      }
> > -    return s;
> >
> > +    return s;
> >  }
> >
> >  void luring_cleanup(LuringState *s)
>
>
> --
> Damien Le Moal
> Western Digital Research

--0000000000002b3de305dcf63c27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for noticing the problem. I&#39;ve done that.<div><=
br></div><div>Sam</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">Damien Le Moal &lt;<a href=3D"mailto:Damien.LeMoal@w=
dc.com">Damien.LeMoal@wdc.com</a>&gt; =E4=BA=8E2022=E5=B9=B44=E6=9C=8819=E6=
=97=A5=E5=91=A8=E4=BA=8C 06:24=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 2022/04/18 18:05, Sam Li wrote=
:<br>
&gt; fix code style issue.<br>
<br>
This patch must be squashed into the previous one.<br>
<br>
&gt; <br>
&gt; Signed-off-by: Sam Li &lt;<a href=3D"mailto:faithilikerun@gmail.com" t=
arget=3D"_blank">faithilikerun@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 block/io_uring.c | 9 +++++++--<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/block/io_uring.c b/block/io_uring.c<br>
&gt; index 2942967126..57745ecfa1 100644<br>
&gt; --- a/block/io_uring.c<br>
&gt; +++ b/block/io_uring.c<br>
&gt; @@ -436,10 +436,15 @@ LuringState *luring_init(Error **errp)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ioq_init(&amp;s-&gt;io_q);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (io_uring_register_ring_fd(&amp;s-&gt;ring) &lt=
; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;faile=
d to register linux io_uring ring file descriptor&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If the function fails, it will fa=
llback to the non-optimized io_uring<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* operations.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
<br>
The comment wording is a little odd: given that the comment is inside the &=
quot;if&quot;,<br>
meaning that we are in the case &quot;the function failed&quot;, saying &qu=
ot;if the function<br>
fails...&quot; is strange. You could simply state something like:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Only warn about this error: we will fal=
l back to the non-optimized<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* io_uring operations.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&quot;failed to register linux io_uring ring file desc=
riptor&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 return s;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 return s;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void luring_cleanup(LuringState *s)<br>
<br>
<br>
-- <br>
Damien Le Moal<br>
Western Digital Research</blockquote></div>

--0000000000002b3de305dcf63c27--

