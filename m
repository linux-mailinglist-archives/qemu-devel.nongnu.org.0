Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF0F55FABE
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 10:38:50 +0200 (CEST)
Received: from localhost ([::1]:51872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6TDl-0007cW-6m
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 04:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ztong0001@gmail.com>)
 id 1o6T6q-0002pR-Dy; Wed, 29 Jun 2022 04:31:40 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:34778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ztong0001@gmail.com>)
 id 1o6T6o-00048l-Fq; Wed, 29 Jun 2022 04:31:40 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id i15so26717453ybp.1;
 Wed, 29 Jun 2022 01:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WRjCsVoCS8Yl2Ph+nNsGtNFuuBJlgWaCpVUwhLN9JT8=;
 b=NTnEu64BpT9npPNJsh22dwHx1uVs/OB6UK/5PUz3e3hK7Mm0BlF/bTxAootHBm2u1e
 cvW4dMsF4/9k+envvjplQMQNK72d2B7OTbNiYP3waWQl79mBh53fv76a+CYCkQEi+kxG
 GBSvfzlbC5ymBbudvMfdL7rAqdfSlgZkkgXUAZxBOCaBU/ocohSdv8WUs+eEzhp3sgJj
 O/IQIivV4qofHOEF7/AXfLogt+MJhjmzYRHwWS0WNf5E7/HK/+FXzuKyFyV+P90Be94/
 Hr52GzOTwZ7MdxvUxlaAfcIlNdfcuzUkx3HkrzDGJa9niIlY4Q9HFYr4Dq4Tkyjh7QTS
 Ppyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WRjCsVoCS8Yl2Ph+nNsGtNFuuBJlgWaCpVUwhLN9JT8=;
 b=0DbHHvnI3W9HAWVF2kF5u5qxMFoo/thnF//mpcI00kOwkGvXDhnT5Mjdz2nV/iiddv
 tqo8linrqElimaPxY0Brdb8dU3AbmBrPBeIv8Sx68BevLG07h7dVHSW/jhFqGgPyEXQf
 VE0ThS7DWDmRjLLDZz1pTRdFkp5OEREqlJWgPsF/LnjqchtulV7pXxe1NBZaz5wyXmxs
 x3Ia3fE4C4nbUHdPIKH5Cgd8bVgWSGBI0EidAKj7svImeetI8S2DIUFWsHmZiEZ1aviS
 TovU2/LOT8vWjHz4mckYZZp7Yo2egBmNwz0Qf0GUnewv4SfNI7BrAHcEBRmhcf9iZZNx
 cU1w==
X-Gm-Message-State: AJIora8RCxksmrV5mgWOBBok4R6mBCVbGjhkMKDKFWPTjFXen/x/unZ2
 4L6Jcx1CD/U7rWVoZCvDiYbr0KEG8RT/TYoOdGM=
X-Google-Smtp-Source: AGRyM1uF/1ME20ncqrcUNdH4ZYZ+jk2eg2H7zojrxhFrOqGKD9Az46l8G4l3M0wwT/shcGTB7kzGgLxTLnCShTKZ5QM=
X-Received: by 2002:a25:2e50:0:b0:669:9a76:beb with SMTP id
 b16-20020a252e50000000b006699a760bebmr1998186ybn.597.1656491496173; Wed, 29
 Jun 2022 01:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220506163106uscas1p20aa8ba0a290a9b50be54df6ec4f9cee0@uscas1p2.samsung.com>
 <20220506163059.2517-1-t.zhang2@samsung.com>
 <b3fd052f-658f-2e39-816b-9e5b9e521ec7@redhat.com>
In-Reply-To: <b3fd052f-658f-2e39-816b-9e5b9e521ec7@redhat.com>
From: Tong Zhang <ztong0001@gmail.com>
Date: Wed, 29 Jun 2022 01:31:25 -0700
Message-ID: <CAA5qM4C15k3k6TSngp0tbTN50kCFLfmBvrwf_pbHheVmoXpO4g@mail.gmail.com>
Subject: Re: [RESEND PATCH] hw/dma: fix crash caused by race condition
To: David Hildenbrand <david@redhat.com>
Cc: Francisco Londono <f.londono@samsung.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Stefan Hajnoczi <stefanha@gmail.com>, Tong Zhang <t.zhang2@samsung.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000033f58605e291fb33"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=ztong0001@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000033f58605e291fb33
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 29, 2022 at 12:29 AM David Hildenbrand <david@redhat.com> wrote:

> On 06.05.22 18:31, Tong Zhang wrote:
> > assert(dbs->acb) is meant to check the return value of io_func per
> > documented in commit 6bee44ea34 ("dma: the passed io_func does not
> > return NULL"). However, there is a chance that after calling
> > aio_context_release(dbs->ctx); the dma_blk_cb function is called before
> > the assertion and dbs->acb is set to NULL again at line 121. Thus when
> > we run assert at line 181 it will fail.
> >
> >   softmmu/dma-helpers.c:181: dma_blk_cb: Assertion `dbs->acb' failed.
> >
> > Reported-by: Francisco Londono <f.londono@samsung.com>
> > Signed-off-by: Tong Zhang <t.zhang2@samsung.com>
> > ---
> >  softmmu/dma-helpers.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> > index 7820fec54c..cb81017928 100644
> > --- a/softmmu/dma-helpers.c
> > +++ b/softmmu/dma-helpers.c
> > @@ -177,8 +177,8 @@ static void dma_blk_cb(void *opaque, int ret)
> >      aio_context_acquire(dbs->ctx);
> >      dbs->acb = dbs->io_func(dbs->offset, &dbs->iov,
> >                              dma_blk_cb, dbs, dbs->io_func_opaque);
> > -    aio_context_release(dbs->ctx);
> >      assert(dbs->acb);
> > +    aio_context_release(dbs->ctx);
> >  }
> >
> >  static void dma_aio_cancel(BlockAIOCB *acb)
>
> Please don't resend patches if the previous submission came to the
> conclusion that it's unclear how this should help.
>
>
> https://lkml.kernel.org/r/CAJSP0QW396RY_g8LS1mncDZcOv5GamURy+xv+s8zMcdq03OOMA@mail.gmail.com
>
>
> I *still* don't understand the interaction between the lock and the
> assertion and so far nobody was able to clarify.
>
> --
> Thanks,
>
> David / dhildenb
>
hello

This message is sent way before the discussion


>

--00000000000033f58605e291fb33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jun 29, 2022 at 12:29 AM David Hildenbrand &lt;<a h=
ref=3D"mailto:david@redhat.com">david@redhat.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)">On 06.05.22 18:31, Tong Zhang wrote:<br>
&gt; assert(dbs-&gt;acb) is meant to check the return value of io_func per<=
br>
&gt; documented in commit 6bee44ea34 (&quot;dma: the passed io_func does no=
t<br>
&gt; return NULL&quot;). However, there is a chance that after calling<br>
&gt; aio_context_release(dbs-&gt;ctx); the dma_blk_cb function is called be=
fore<br>
&gt; the assertion and dbs-&gt;acb is set to NULL again at line 121. Thus w=
hen<br>
&gt; we run assert at line 181 it will fail.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0softmmu/dma-helpers.c:181: dma_blk_cb: Assertion `dbs-&gt;=
acb&#39; failed.<br>
&gt; <br>
&gt; Reported-by: Francisco Londono &lt;<a href=3D"mailto:f.londono@samsung=
.com" target=3D"_blank">f.londono@samsung.com</a>&gt;<br>
&gt; Signed-off-by: Tong Zhang &lt;<a href=3D"mailto:t.zhang2@samsung.com" =
target=3D"_blank">t.zhang2@samsung.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 softmmu/dma-helpers.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c<br>
&gt; index 7820fec54c..cb81017928 100644<br>
&gt; --- a/softmmu/dma-helpers.c<br>
&gt; +++ b/softmmu/dma-helpers.c<br>
&gt; @@ -177,8 +177,8 @@ static void dma_blk_cb(void *opaque, int ret)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 aio_context_acquire(dbs-&gt;ctx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dbs-&gt;acb =3D dbs-&gt;io_func(dbs-&gt;offset, &a=
mp;dbs-&gt;iov,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_blk_cb, dbs, dbs-&gt;io_func_opaque)=
;<br>
&gt; -=C2=A0 =C2=A0 aio_context_release(dbs-&gt;ctx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert(dbs-&gt;acb);<br>
&gt; +=C2=A0 =C2=A0 aio_context_release(dbs-&gt;ctx);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void dma_aio_cancel(BlockAIOCB *acb)<br>
<br>
Please don&#39;t resend patches if the previous submission came to the<br>
conclusion that it&#39;s unclear how this should help.<br>
<br>
<a href=3D"https://lkml.kernel.org/r/CAJSP0QW396RY_g8LS1mncDZcOv5GamURy+xv+=
s8zMcdq03OOMA@mail.gmail.com" rel=3D"noreferrer" target=3D"_blank">https://=
lkml.kernel.org/r/CAJSP0QW396RY_g8LS1mncDZcOv5GamURy+xv+s8zMcdq03OOMA@mail.=
gmail.com</a><br>
<br>
<br>
I *still* don&#39;t understand the interaction between the lock and the<br>
assertion and so far nobody was able to clarify.<br>
<br>
-- <br>
Thanks,<br>
<br>
David / dhildenb<br>
</blockquote><div dir=3D"auto">hello</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">This message is sent way before the discussion=C2=A0</div><div=
 dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)"><br>
</blockquote></div></div>

--00000000000033f58605e291fb33--

