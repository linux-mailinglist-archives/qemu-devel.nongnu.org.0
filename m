Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A35550A61D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:46:48 +0200 (CEST)
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZx9-0004qz-Ac
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nhZW4-0005N5-JN
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:18:48 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:41764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nhZW0-0007dq-Sz
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:18:46 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so5669081pjf.0
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 09:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cE/nTqTif6P1HPxIRKEcFOT2jYdAf96YvFfWF0zUtEU=;
 b=R2ZDVS3cJF5Tvn6RyVqVoHZxDBv5AcY5SzoTaGNJV8m9z0EZWQkpKkX+qK6PYEKS6M
 MPwafA2ybiWuy75qhKfYuyMUuG0Nh98Qq4iWJ5j521+59elZfbO5I+SIWFaP31OG7UEl
 4SGyImM5WUv7CZv1r5pXXlL+XwQweFCLy+Va62s4D39XLifU+Qgh737G770SEBqREp7/
 sKQhG3f/HHXWd8PQ3eQin1H2BPozXPvIFyxhCfjJxnK4rAi1yaWL+bDgrABEy/fvYZXz
 FwPhqcKFEE4sJZCsYT0KhSjD7cB6RIAdF59SpLFHSI0dW1jHAnB6xDtr8IuvqRPeCfrh
 BERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cE/nTqTif6P1HPxIRKEcFOT2jYdAf96YvFfWF0zUtEU=;
 b=yAM7eFOJ9CX4br6RnMeroYX3gD8wJhM8Jplusn4wr/WNcwTq0fx08RGOgpW+3mOwrY
 z6GWT1XlRenSD+yGhzJO/N8bp4VAKMNff5zG5tnLFosrH54/6Yp/u1PrlQMKMKvpAceW
 fXaHcEy9nJIUou67Xpcz+gxbFK9XgCyZb8GLgihXtXfw5xcvrbt4Huw3puVIh+jcV0+K
 UxUVzm7DxrNXHiHL5IpqTT+xEpRmy+M6xSZVu5ZWYLpA+/typOnA/7HrQvtB+8uj7wi3
 Nhi/5kd2MKVVkTm6zOQFsWEA4mVHzWt7SiV1RQR3e3NtEd37TPvsFRjNxn1nZ1QNEQ0k
 JIRg==
X-Gm-Message-State: AOAM530E//R6TGLEwakO2LHHpNs9uLmtb8frI+lSEHS0+6bSVpzOfkKY
 9XTSvr6L0hcLtVx6FBMYJiKZ8lWwLQ9+mnpcJcU=
X-Google-Smtp-Source: ABdhPJy6m6Hd0IhgWisa2mzd3cD1jV8gVE3HDip/KmCscKeAi40gWEqa7WawJjGAIv3n6oUFLJM2/Pg7yVxoCGUQJQk=
X-Received: by 2002:a17:902:f787:b0:14f:43ba:55fc with SMTP id
 q7-20020a170902f78700b0014f43ba55fcmr54200pln.3.1650557919910; Thu, 21 Apr
 2022 09:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220418233331.7528-1-faithilikerun@gmail.com>
 <20220421133600.GB1500162@fam-dell>
In-Reply-To: <20220421133600.GB1500162@fam-dell>
From: olc <faithilikerun@gmail.com>
Date: Fri, 22 Apr 2022 00:18:33 +0800
Message-ID: <CAAAx-8K3hQhSfkq7NObJr80FLxGs5=KVnYPU80h3XBN85FJd8A@mail.gmail.com>
Subject: Re: [PATCH v3] Use io_uring_register_ring_fd() to skip fd operations
To: Fam Zheng <fam@euphon.net>
Content-Type: multipart/alternative; boundary="0000000000007f5cb605dd2c76a2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1031.google.com
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
 Stefan Hajnoczi <stefanha@gmail.com>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007f5cb605dd2c76a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fam,
I've missed out freeing error object and error_report would be a better
case indeed.
Thanks for pointing out the problem.  I'll fix that in no time.

Best regards,
Sam



Fam Zheng <fam@euphon.net> =E4=BA=8E2022=E5=B9=B44=E6=9C=8821=E6=97=A5=E5=
=91=A8=E5=9B=9B 21:36=E5=86=99=E9=81=93=EF=BC=9A

> On 2022-04-19 07:33, Sam Li wrote:
> > Linux recently added a new io_uring(7) optimization API that QEMU
> > doesn't take advantage of yet. The liburing library that QEMU uses
> > has added a corresponding new API calling io_uring_register_ring_fd().
> > When this API is called after creating the ring, the io_uring_submit()
> > library function passes a flag to the io_uring_enter(2) syscall
> > allowing it to skip the ring file descriptor fdget()/fdput()
> > operations. This saves some CPU cycles.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  block/io_uring.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/block/io_uring.c b/block/io_uring.c
> > index 782afdb433..51f4834b69 100644
> > --- a/block/io_uring.c
> > +++ b/block/io_uring.c
> > @@ -435,8 +435,16 @@ LuringState *luring_init(Error **errp)
> >      }
> >
> >      ioq_init(&s->io_q);
> > -    return s;
> > +    if (io_uring_register_ring_fd(&s->ring) < 0) {
> > +        /*
> > +         * Only warn about this error: we will fallback to the
> non-optimized
> > +         * io_uring operations.
> > +         */
> > +        error_setg_errno(errp, errno,
> > +                         "failed to register linux io_uring ring file
> descriptor");
> > +    }
> >
> > +    return s;
>
> As a general convention, I don't think the errp is going to get proper
> handling
> by the callers, if non-NULL is returned like here. IOW a matching
> error_free is
> never called and this is memory leak?
>
> I guess error_report is better?
>
> Fam
>
> >  }
> >
> >  void luring_cleanup(LuringState *s)
> > --
> > 2.35.1
> >
> >
>

--0000000000007f5cb605dd2c76a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Fam,<br><div>I&#39;ve missed out freeing error object a=
nd error_report would be a better case indeed.=C2=A0</div><div>Thanks for p=
ointing out the problem.=C2=A0 I&#39;ll fix that in no time.</div><div><br>=
</div><div>Best regards,</div><div>Sam</div><div><br></div><div><br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">F=
am Zheng &lt;<a href=3D"mailto:fam@euphon.net">fam@euphon.net</a>&gt; =E4=
=BA=8E2022=E5=B9=B44=E6=9C=8821=E6=97=A5=E5=91=A8=E5=9B=9B 21:36=E5=86=99=
=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 2022-04-19 07:33, Sam Li wrote:<br>
&gt; Linux recently added a new io_uring(7) optimization API that QEMU<br>
&gt; doesn&#39;t take advantage of yet. The liburing library that QEMU uses=
<br>
&gt; has added a corresponding new API calling io_uring_register_ring_fd().=
<br>
&gt; When this API is called after creating the ring, the io_uring_submit()=
<br>
&gt; library function passes a flag to the io_uring_enter(2) syscall<br>
&gt; allowing it to skip the ring file descriptor fdget()/fdput()<br>
&gt; operations. This saves some CPU cycles.<br>
&gt; <br>
&gt; Signed-off-by: Sam Li &lt;<a href=3D"mailto:faithilikerun@gmail.com" t=
arget=3D"_blank">faithilikerun@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 block/io_uring.c | 10 +++++++++-<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/block/io_uring.c b/block/io_uring.c<br>
&gt; index 782afdb433..51f4834b69 100644<br>
&gt; --- a/block/io_uring.c<br>
&gt; +++ b/block/io_uring.c<br>
&gt; @@ -435,8 +435,16 @@ LuringState *luring_init(Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ioq_init(&amp;s-&gt;io_q);<br>
&gt; -=C2=A0 =C2=A0 return s;<br>
&gt; +=C2=A0 =C2=A0 if (io_uring_register_ring_fd(&amp;s-&gt;ring) &lt; 0) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Only warn about this error: we wi=
ll fallback to the non-optimized<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* io_uring operations.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&quot;failed to register linux io_uring ring file desc=
riptor&quot;);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 return s;<br>
<br>
As a general convention, I don&#39;t think the errp is going to get proper =
handling<br>
by the callers, if non-NULL is returned like here. IOW a matching error_fre=
e is<br>
never called and this is memory leak?<br>
<br>
I guess error_report is better?<br>
<br>
Fam<br>
<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void luring_cleanup(LuringState *s)<br>
&gt; -- <br>
&gt; 2.35.1<br>
&gt; <br>
&gt; <br>
</blockquote></div>

--0000000000007f5cb605dd2c76a2--

