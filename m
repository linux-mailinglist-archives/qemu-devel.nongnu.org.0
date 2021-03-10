Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C5833405D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 15:29:26 +0100 (CET)
Received: from localhost ([::1]:46374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJzq1-0006r5-7g
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 09:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <famforupstream@gmail.com>)
 id 1lJzp2-0006Lx-HQ; Wed, 10 Mar 2021 09:28:24 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:45425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <famforupstream@gmail.com>)
 id 1lJzp0-0007eU-GW; Wed, 10 Mar 2021 09:28:24 -0500
Received: by mail-lj1-x22b.google.com with SMTP id c19so17513253ljn.12;
 Wed, 10 Mar 2021 06:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/1LmzObYTvGidmJNV8u0Bj6EGMDguRMdf8VN6bvBjX0=;
 b=Y1iNmTi6OAs7CrIKWQ8zjyx84mFtIWj1TeEJVjUWUHzmITdCEqb6SKLZ1yZZKfl5Mv
 wkEOCvOmzMAzd/JCg7vi1X5H4mytWXmPkvFw+kU0b4GMb2YIso/KDPg39o49oX345LuF
 AdjJNV8K1VoAl2Q5oQJ6poBwKx5Fps1/RnlQ4VT0OmhD5wfZyT7WfJ882pbDXrfojebk
 7zfb2JmWVHgQL8N7ctglEwL1H7JmK82F87nXzVk/vJgZKaXbo5NE20Pu3dvrZWCmd89L
 tppgXKTeAkL4zK9UHjdswn9gCbCTeajgHtEjWWgfwiazzHabrOkY94o4DzJUJKPf9Rx0
 Xr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/1LmzObYTvGidmJNV8u0Bj6EGMDguRMdf8VN6bvBjX0=;
 b=hfjIm+DPVKORv889jiQHSc6GeAdmgLHj7mrtJazwnA9n9lpuLIl2myp7b2tmZ5JlhR
 JO/ybv3txVF85Bmd1f/P5vLu1i5qDBmN8oX7uwGA+kSunHQ9iJLErVjl9xsg8GVika67
 E98G3HNLmqyaCi5JwBa89mcGOeZG8xu6MgCvoKZip/maI8RK38+O2/RkdtvAFYABC6xq
 J2CIW5570HQRUnhwfyr6tTD+BPCRNM6AQnqkgZiWWmP6aucoVYPh1KkErKCIOOKbfanB
 w8ITCPcGNWhh/emyyya8QzuiNJ0JOMXTBLsmoanlbVC79GxDUttL9PLHJ1fDn4pfBGm+
 8Kcg==
X-Gm-Message-State: AOAM5316PYRop5q6TqCxTPc6kR9tOMRILQdHWjqmpP1RdnrOUFTkk9en
 71HJnntGLhO7Qp6C6c56WZfXak70jJhcVjOTi9aMmDamnKU=
X-Google-Smtp-Source: ABdhPJz3AJ+mLt2G3BOzaMWiM9Ey7sfC8lE83T92AMNjKlIoRtXtk0MQP4T3ksIdJtIo1Ni+qyC1g7iG+e26q/iVaUM=
X-Received: by 2002:a2e:9c94:: with SMTP id x20mr2019043lji.338.1615386500138; 
 Wed, 10 Mar 2021 06:28:20 -0800 (PST)
MIME-Version: 1.0
References: <20210310141752.5113-1-fam@euphon.net>
 <d16dce2d-f844-5e58-6ae1-bbf366e74b60@redhat.com>
In-Reply-To: <d16dce2d-f844-5e58-6ae1-bbf366e74b60@redhat.com>
From: Fam Zheng <famforupstream@gmail.com>
Date: Wed, 10 Mar 2021 14:28:09 +0000
Message-ID: <CAGNx5+34xWD33-YQmS_Tw-bV3nFMJSpB72c6paGpN4pdmmPkAg@mail.gmail.com>
Subject: Re: [PATCH] block: Introduce zero-co:// and zero-aio://
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008409c205bd2f7a6c"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=famforupstream@gmail.com; helo=mail-lj1-x22b.google.com
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
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008409c205bd2f7a6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Mar 2021 at 14:24, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> On 3/10/21 3:17 PM, fam@euphon.net wrote:
> > From: Fam Zheng <famzheng@amazon.com>
> >
> > null-co:// has a read-zeroes=3Doff default, when used to in security
> > analysis, this can cause false positives because the driver doesn't
> > write to the read buffer.
> >
> > null-co:// has the highest possible performance as a block driver, so
> > let's keep it that way. This patch introduces zero-co:// and
> > zero-aio://, largely similar with null-*://, but have read-zeroes=3Don =
by
> > default, so it's more suitable in cases than null-co://.
>
> Thanks!
>
> >
> > Signed-off-by: Fam Zheng <fam@euphon.net>
> > ---
> >  block/null.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 91 insertions(+)
>
> > +static int zero_file_open(BlockDriverState *bs, QDict *options, int
> flags,
> > +                          Error **errp)
> > +{
> > +    QemuOpts *opts;
> > +    BDRVNullState *s =3D bs->opaque;
> > +    int ret =3D 0;
> > +
> > +    opts =3D qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
> > +    qemu_opts_absorb_qdict(opts, options, &error_abort);
> > +    s->length =3D
> > +        qemu_opt_get_size(opts, BLOCK_OPT_SIZE, 1 << 30);
>
> Please do not use this magic default value, let's always explicit the
> size.
>
>     s->length =3D qemu_opt_get_size(opts, BLOCK_OPT_SIZE, 0);
>     if (s->length < 0) {
>         error_setg(errp, "%s is invalid", BLOCK_OPT_SIZE);
>         ret =3D -EINVAL;
>     }


Doesn't that result in a bare

  -blockdev zero-co://

would have 0 byte in size?

I'm copying what null-co:// does today, and it's convenient for tests. Why
is a default size bad?

Fam



>
>
> +    s->latency_ns =3D
> > +        qemu_opt_get_number(opts, NULL_OPT_LATENCY, 0);
> > +    if (s->latency_ns < 0) {
> > +        error_setg(errp, "latency-ns is invalid");
> > +        ret =3D -EINVAL;
> > +    }
> > +    s->read_zeroes =3D true;
> > +    qemu_opts_del(opts);
> > +    bs->supported_write_flags =3D BDRV_REQ_FUA;
> > +    return ret;
> > +}
>
> Otherwise LGTM :)
>
>
>

--0000000000008409c205bd2f7a6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 10 Mar 2021 at 14:24, Philipp=
e Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 3/10/21 3:17 PM, <a href=3D"mailto:fam@euphon.net" target=3D"_blank"=
>fam@euphon.net</a> wrote:<br>
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
<br>
Thanks!<br>
<br>
&gt; <br>
&gt; Signed-off-by: Fam Zheng &lt;<a href=3D"mailto:fam@euphon.net" target=
=3D"_blank">fam@euphon.net</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 block/null.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 91 insertions(+)<br>
<br>
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
<br>
Please do not use this magic default value, let&#39;s always explicit the<b=
r>
size.<br>
<br>
=C2=A0 =C2=A0 s-&gt;length =3D qemu_opt_get_size(opts, BLOCK_OPT_SIZE, 0);<=
br>
=C2=A0 =C2=A0 if (s-&gt;length &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;%s is invalid&quot;, BLO=
CK_OPT_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;<br>
=C2=A0 =C2=A0 }</blockquote><div><br></div><div>Doesn&#39;t that result in =
a bare</div><div><br></div><div>=C2=A0 -blockdev zero-co://</div><div><br><=
/div><div>would have 0 byte in size?</div><div><br></div><div>I&#39;m copyi=
ng what null-co:// does today, and it&#39;s convenient for tests. Why is a =
default size bad?</div><div><br></div><div>Fam</div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0<br></bloc=
kquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
<br>
Otherwise LGTM :)<br>
<br>
<br>
</blockquote></div></div>

--0000000000008409c205bd2f7a6c--

