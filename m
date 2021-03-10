Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD78334110
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:05:42 +0100 (CET)
Received: from localhost ([::1]:33480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK0P7-0001ZX-3l
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <famforupstream@gmail.com>)
 id 1lK0Jj-0005hi-T1; Wed, 10 Mar 2021 10:00:07 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:44388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <famforupstream@gmail.com>)
 id 1lK0Jh-0000qo-7v; Wed, 10 Mar 2021 10:00:07 -0500
Received: by mail-lf1-x130.google.com with SMTP id p21so33910670lfu.11;
 Wed, 10 Mar 2021 07:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hbOzuOvNeeQsz7iHGi/e7u8r+/gCrIQlNjaRO424dsQ=;
 b=ci1TqI8ap2ARCYKJU6YldJqMFwZsI+FF8aXLaTqOUBVgm559Ert3q3Jg3VwlOxNoP9
 15o/ibOWJeXadz4cFdxtIprkyYNHqnijbOmmWiEvAisjYFNkZAcDhGEBcWhuMYO3Gvag
 oSYjML3z00EPbNiIGMy/D4VRna/SMZ+1e4cdgALgN1r/i4VJ+ltSqcRj29fEnqli6m5q
 /J+kIjCrByS2bdZCJ1nUlCLCVXZI5e4HSfBzwUmPTZkjBqavsXLLO1ATJ7sYg423uvhb
 H3hz9edlWaDiMMvbFV/1HtEzsFHO4XtbPQaUxPyV9auwg5wGDyv4QZtrgMmP6zzitwgX
 bIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hbOzuOvNeeQsz7iHGi/e7u8r+/gCrIQlNjaRO424dsQ=;
 b=IjnEEtqQWzJX/YFwa15wHJGsYE/w1/Wsk0s970n3CIqBtFnmj2QdjdwSTy1t8JBskK
 W4C5wZJQa6CGLqQ2xqHlsOTHsf1C9V5+1oU/ozqe7RbCi8LqHGcmbVGNbfQ25KuQWlbG
 JLp7Z97r9r9QpVs0l+LyYEvUr0EhEGifDvung/daSBhitE84iPiuA/nJiTJi1aqhDUhh
 PP9oXWtCpHplN2lXliqSRAETfZIsXPqUrPozhxD8lxcbZobHrDcvarcvOBeV/UKogoDS
 EgAby6tUBQO63oNhzz8g3P50g+W432kLmL67B1tomfAAOU76QJr6DfMLhzjHPCgXG0/p
 LDTA==
X-Gm-Message-State: AOAM533krQHmuYcmn6xDPXEy68dtB+ehioyIFIGuwKnW4UxseAzF6pIq
 aphzpmdIK0ms5P+TPmNfY3G7zriGosVvL4O7DlY=
X-Google-Smtp-Source: ABdhPJx1D2TqdV+zu/goM6CnJ3oxMdq0gtLXeK5P1n/Vd27NuTbc5Ar1vFUPpJhbLtxL8YaP1xJ60Gq9fqNC8hAfpqU=
X-Received: by 2002:a05:6512:2016:: with SMTP id
 a22mr2239484lfb.645.1615388402175; 
 Wed, 10 Mar 2021 07:00:02 -0800 (PST)
MIME-Version: 1.0
References: <20210310141752.5113-1-fam@euphon.net>
 <fe6ad34d-2e4d-c187-21c4-9f26e3da14d8@virtuozzo.com>
In-Reply-To: <fe6ad34d-2e4d-c187-21c4-9f26e3da14d8@virtuozzo.com>
From: Fam Zheng <famforupstream@gmail.com>
Date: Wed, 10 Mar 2021 14:59:51 +0000
Message-ID: <CAGNx5+2TeVCKCTTjLadewBwOARLFgOKZdOhy8k8s6d+d=im3Bg@mail.gmail.com>
Subject: Re: [PATCH] block: Introduce zero-co:// and zero-aio://
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: multipart/alternative; boundary="000000000000e2d00e05bd2febb7"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=famforupstream@gmail.com; helo=mail-lf1-x130.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e2d00e05bd2febb7
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Mar 2021 at 14:41, Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 10.03.2021 17:17, fam@euphon.net wrote:
> > From: Fam Zheng <famzheng@amazon.com>
> >
> > null-co:// has a read-zeroes=off default, when used to in security
> > analysis, this can cause false positives because the driver doesn't
> > write to the read buffer.
> >
> > null-co:// has the highest possible performance as a block driver, so
> > let's keep it that way. This patch introduces zero-co:// and
> > zero-aio://, largely similar with null-*://, but have read-zeroes=on by
> > default, so it's more suitable in cases than null-co://.
> >
> > Signed-off-by: Fam Zheng <fam@euphon.net>
> > ---
> >   block/null.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 91 insertions(+)
> >
> > diff --git a/block/null.c b/block/null.c
> > index cc9b1d4ea7..5de97e8fda 100644
> > --- a/block/null.c
> > +++ b/block/null.c
> > @@ -76,6 +76,30 @@ static void null_aio_parse_filename(const char
> *filename, QDict *options,
> >       }
> >   }
> >
> > +static void zero_co_parse_filename(const char *filename, QDict *options,
> > +                                   Error **errp)
> > +{
> > +    /* This functions only exists so that a zero-co:// filename is
> accepted
> > +     * with the zero-co driver. */
> > +    if (strcmp(filename, "zero-co://")) {
> > +        error_setg(errp, "The only allowed filename for this driver is "
> > +                         "'zero-co://'");
> > +        return;
> > +    }
> > +}
> > +
> > +static void zero_aio_parse_filename(const char *filename, QDict
> *options,
> > +                                    Error **errp)
> > +{
> > +    /* This functions only exists so that a zero-aio:// filename is
> accepted
> > +     * with the zero-aio driver. */
> > +    if (strcmp(filename, "zero-aio://")) {
> > +        error_setg(errp, "The only allowed filename for this driver is "
> > +                         "'zero-aio://'");
> > +        return;
> > +    }
> > +}
> > +
> >   static int null_file_open(BlockDriverState *bs, QDict *options, int
> flags,
> >                             Error **errp)
> >   {
> > @@ -99,6 +123,29 @@ static int null_file_open(BlockDriverState *bs,
> QDict *options, int flags,
> >       return ret;
> >   }
> >
> > +static int zero_file_open(BlockDriverState *bs, QDict *options, int
> flags,
> > +                          Error **errp)
> > +{
> > +    QemuOpts *opts;
> > +    BDRVNullState *s = bs->opaque;
> > +    int ret = 0;
> > +
> > +    opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
> > +    qemu_opts_absorb_qdict(opts, options, &error_abort);
> > +    s->length =
> > +        qemu_opt_get_size(opts, BLOCK_OPT_SIZE, 1 << 30);
> > +    s->latency_ns =
> > +        qemu_opt_get_number(opts, NULL_OPT_LATENCY, 0);
> > +    if (s->latency_ns < 0) {
> > +        error_setg(errp, "latency-ns is invalid");
> > +        ret = -EINVAL;
> > +    }
> > +    s->read_zeroes = true;
> > +    qemu_opts_del(opts);
> > +    bs->supported_write_flags = BDRV_REQ_FUA;
> > +    return ret;
> > +}
> > +
> >   static int64_t null_getlength(BlockDriverState *bs)
> >   {
> >       BDRVNullState *s = bs->opaque;
> > @@ -316,10 +363,54 @@ static BlockDriver bdrv_null_aio = {
> >       .strong_runtime_opts    = null_strong_runtime_opts,
> >   };
> >
> > +static BlockDriver bdrv_zero_co = {
> > +    .format_name            = "zero-co",
> > +    .protocol_name          = "zero-co",
> > +    .instance_size          = sizeof(BDRVNullState),
> > +
> > +    .bdrv_file_open         = zero_file_open,
> > +    .bdrv_parse_filename    = zero_co_parse_filename,
> > +    .bdrv_getlength         = null_getlength,
> > +    .bdrv_get_allocated_file_size = null_allocated_file_size,
> > +
> > +    .bdrv_co_preadv         = null_co_preadv,
> > +    .bdrv_co_pwritev        = null_co_pwritev,
> > +    .bdrv_co_flush_to_disk  = null_co_flush,
> > +    .bdrv_reopen_prepare    = null_reopen_prepare,
> > +
> > +    .bdrv_co_block_status   = null_co_block_status,
> > +
> > +    .bdrv_refresh_filename  = null_refresh_filename,
> > +    .strong_runtime_opts    = null_strong_runtime_opts,
> > +};
> > +
> > +static BlockDriver bdrv_zero_aio = {
> > +    .format_name            = "zero-aio",
> > +    .protocol_name          = "zero-aio",
> > +    .instance_size          = sizeof(BDRVNullState),
> > +
> > +    .bdrv_file_open         = zero_file_open,
> > +    .bdrv_parse_filename    = zero_aio_parse_filename,
> > +    .bdrv_getlength         = null_getlength,
> > +    .bdrv_get_allocated_file_size = null_allocated_file_size,
> > +
> > +    .bdrv_aio_preadv        = null_aio_preadv,
> > +    .bdrv_aio_pwritev       = null_aio_pwritev,
> > +    .bdrv_aio_flush         = null_aio_flush,
> > +    .bdrv_reopen_prepare    = null_reopen_prepare,
> > +
> > +    .bdrv_co_block_status   = null_co_block_status,
> > +
> > +    .bdrv_refresh_filename  = null_refresh_filename,
> > +    .strong_runtime_opts    = null_strong_runtime_opts,
> > +};
>
> I don't think we need separate zero-aio driver. What is the actual
> difference?
>
> Probably zero-co is enough, and we can call it just zero. And then, maybe
> add null driver (same as null-co, but without read_zeroes option) and
> deprecate null-co and null-aio drivers. Thus we'll get two clean well
> defined things: null and zero drivers..
>

Sounds good to me, I'll just call it zero:// for this patch and leave the
null convergence and deprecation business for another patch.

Fam


>
> > +
> >   static void bdrv_null_init(void)
> >   {
> >       bdrv_register(&bdrv_null_co);
> >       bdrv_register(&bdrv_null_aio);
> > +    bdrv_register(&bdrv_zero_co);
> > +    bdrv_register(&bdrv_zero_aio);
> >   }
> >
> >   block_init(bdrv_null_init);
> >
>
>
> --
> Best regards,
> Vladimir
>
>

--000000000000e2d00e05bd2febb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 10 Mar 2021 at 14:41, Vladimi=
r Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vseme=
ntsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">10.03.2021 17:17, <a href=3D"mailto:fam@euphon.net" targ=
et=3D"_blank">fam@euphon.net</a> wrote:<br>
&gt; From: Fam Zheng &lt;<a href=3D"mailto:famzheng@amazon.com" target=3D"_=
blank">famzheng@amazon.com</a>&gt;<br>
&gt; <br>
&gt; null-co:// has a read-zeroes=3Doff default, when used to in security<b=
r>
&gt; analysis, this can cause false positives because the driver doesn&#39;=
t<br>
&gt; write to the read buffer.<br>
&gt; <br>
&gt; null-co:// has the highest possible performance as a block driver, so<=
br>
&gt; let&#39;s keep it that way. This patch introduces zero-co:// and<br>
&gt; zero-aio://, largely similar with null-*://, but have read-zeroes=3Don=
 by<br>
&gt; default, so it&#39;s more suitable in cases than null-co://.<br>
&gt; <br>
&gt; Signed-off-by: Fam Zheng &lt;<a href=3D"mailto:fam@euphon.net" target=
=3D"_blank">fam@euphon.net</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0block/null.c | 91 ++++++++++++++++++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 91 insertions(+)<br>
&gt; <br>
&gt; diff --git a/block/null.c b/block/null.c<br>
&gt; index cc9b1d4ea7..5de97e8fda 100644<br>
&gt; --- a/block/null.c<br>
&gt; +++ b/block/null.c<br>
&gt; @@ -76,6 +76,30 @@ static void null_aio_parse_filename(const char *fil=
ename, QDict *options,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static void zero_co_parse_filename(const char *filename, QDict *optio=
ns,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 /* This functions only exists so that a zero-co:// file=
name is accepted<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* with the zero-co driver. */<br>
&gt; +=C2=A0 =C2=A0 if (strcmp(filename, &quot;zero-co://&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;The only allowed f=
ilename for this driver is &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&quot;&#39;zero-co://&#39;&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void zero_aio_parse_filename(const char *filename, QDict *opti=
ons,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 /* This functions only exists so that a zero-aio:// fil=
ename is accepted<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* with the zero-aio driver. */<br>
&gt; +=C2=A0 =C2=A0 if (strcmp(filename, &quot;zero-aio://&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;The only allowed f=
ilename for this driver is &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&quot;&#39;zero-aio://&#39;&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static int null_file_open(BlockDriverState *bs, QDict *opt=
ions, int flags,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; @@ -99,6 +123,29 @@ static int null_file_open(BlockDriverState *bs, QD=
ict *options, int flags,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static int zero_file_open(BlockDriverState *bs, QDict *options, int f=
lags,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 QemuOpts *opts;<br>
&gt; +=C2=A0 =C2=A0 BDRVNullState *s =3D bs-&gt;opaque;<br>
&gt; +=C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 opts =3D qemu_opts_create(&amp;runtime_opts, NULL, 0, &=
amp;error_abort);<br>
&gt; +=C2=A0 =C2=A0 qemu_opts_absorb_qdict(opts, options, &amp;error_abort)=
;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;length =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_opt_get_size(opts, BLOCK_OPT_SIZE, 1=
 &lt;&lt; 30);<br>
&gt; +=C2=A0 =C2=A0 s-&gt;latency_ns =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_opt_get_number(opts, NULL_OPT_LATENC=
Y, 0);<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;latency_ns &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;latency-ns is inva=
lid&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 s-&gt;read_zeroes =3D true;<br>
&gt; +=C2=A0 =C2=A0 qemu_opts_del(opts);<br>
&gt; +=C2=A0 =C2=A0 bs-&gt;supported_write_flags =3D BDRV_REQ_FUA;<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static int64_t null_getlength(BlockDriverState *bs)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0BDRVNullState *s =3D bs-&gt;opaque;<br>
&gt; @@ -316,10 +363,54 @@ static BlockDriver bdrv_null_aio =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.strong_runtime_opts=C2=A0 =C2=A0 =3D null_s=
trong_runtime_opts,<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static BlockDriver bdrv_zero_co =3D {<br>
&gt; +=C2=A0 =C2=A0 .format_name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;zero-co&quot;,<br>
&gt; +=C2=A0 =C2=A0 .protocol_name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &q=
uot;zero-co&quot;,<br>
&gt; +=C2=A0 =C2=A0 .instance_size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D si=
zeof(BDRVNullState),<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 .bdrv_file_open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ze=
ro_file_open,<br>
&gt; +=C2=A0 =C2=A0 .bdrv_parse_filename=C2=A0 =C2=A0 =3D zero_co_parse_fil=
ename,<br>
&gt; +=C2=A0 =C2=A0 .bdrv_getlength=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D nu=
ll_getlength,<br>
&gt; +=C2=A0 =C2=A0 .bdrv_get_allocated_file_size =3D null_allocated_file_s=
ize,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 .bdrv_co_preadv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D nu=
ll_co_preadv,<br>
&gt; +=C2=A0 =C2=A0 .bdrv_co_pwritev=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D null_co=
_pwritev,<br>
&gt; +=C2=A0 =C2=A0 .bdrv_co_flush_to_disk=C2=A0 =3D null_co_flush,<br>
&gt; +=C2=A0 =C2=A0 .bdrv_reopen_prepare=C2=A0 =C2=A0 =3D null_reopen_prepa=
re,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 .bdrv_co_block_status=C2=A0 =C2=A0=3D null_co_block_sta=
tus,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 .bdrv_refresh_filename=C2=A0 =3D null_refresh_filename,=
<br>
&gt; +=C2=A0 =C2=A0 .strong_runtime_opts=C2=A0 =C2=A0 =3D null_strong_runti=
me_opts,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static BlockDriver bdrv_zero_aio =3D {<br>
&gt; +=C2=A0 =C2=A0 .format_name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;zero-aio&quot;,<br>
&gt; +=C2=A0 =C2=A0 .protocol_name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &q=
uot;zero-aio&quot;,<br>
&gt; +=C2=A0 =C2=A0 .instance_size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D si=
zeof(BDRVNullState),<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 .bdrv_file_open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ze=
ro_file_open,<br>
&gt; +=C2=A0 =C2=A0 .bdrv_parse_filename=C2=A0 =C2=A0 =3D zero_aio_parse_fi=
lename,<br>
&gt; +=C2=A0 =C2=A0 .bdrv_getlength=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D nu=
ll_getlength,<br>
&gt; +=C2=A0 =C2=A0 .bdrv_get_allocated_file_size =3D null_allocated_file_s=
ize,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 .bdrv_aio_preadv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D null_ai=
o_preadv,<br>
&gt; +=C2=A0 =C2=A0 .bdrv_aio_pwritev=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D null_ai=
o_pwritev,<br>
&gt; +=C2=A0 =C2=A0 .bdrv_aio_flush=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D nu=
ll_aio_flush,<br>
&gt; +=C2=A0 =C2=A0 .bdrv_reopen_prepare=C2=A0 =C2=A0 =3D null_reopen_prepa=
re,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 .bdrv_co_block_status=C2=A0 =C2=A0=3D null_co_block_sta=
tus,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 .bdrv_refresh_filename=C2=A0 =3D null_refresh_filename,=
<br>
&gt; +=C2=A0 =C2=A0 .strong_runtime_opts=C2=A0 =C2=A0 =3D null_strong_runti=
me_opts,<br>
&gt; +};<br>
<br>
I don&#39;t think we need separate zero-aio driver. What is the actual diff=
erence?<br>
<br>
Probably zero-co is enough, and we can call it just zero. And then, maybe a=
dd null driver (same as null-co, but without read_zeroes option) and deprec=
ate null-co and null-aio drivers. Thus we&#39;ll get two clean well defined=
 things: null and zero drivers..<br></blockquote><div><br></div><div>Sounds=
 good to me, I&#39;ll just call it zero:// for this patch and leave the nul=
l convergence and deprecation business for another patch.</div><div><br></d=
iv><div>Fam</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static void bdrv_null_init(void)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bdrv_register(&amp;bdrv_null_co);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bdrv_register(&amp;bdrv_null_aio);<br>
&gt; +=C2=A0 =C2=A0 bdrv_register(&amp;bdrv_zero_co);<br>
&gt; +=C2=A0 =C2=A0 bdrv_register(&amp;bdrv_zero_aio);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0block_init(bdrv_null_init);<br>
&gt; <br>
<br>
<br>
-- <br>
Best regards,<br>
Vladimir<br>
<br>
</blockquote></div></div>

--000000000000e2d00e05bd2febb7--

