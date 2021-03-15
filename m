Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B4733B047
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:48:25 +0100 (CET)
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkls-0005OB-Fv
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLkkG-0004nB-7V
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:46:45 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:40174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLkkE-00043e-1m
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:46:43 -0400
Received: by mail-il1-x129.google.com with SMTP id e7so8858952ile.7
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 03:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RDWB2IW+Z3svJoFCdW5eGbn7Ra97uIVuIYjSnbYrA18=;
 b=h0iYnW2bwnvNLHmR2BYO4reIlzZSXNn0v/5P4AIDESeTwibM1qvVKf1rz7DVMqprEw
 galaDOuyUpa+GIigWcxUZYx3U924SO9KkSCZt/kKYHQ9vDduntXkFHQX3L5TSWbEChD+
 5cZ3w7+ZjWq5mFR3Tf3VgbfBTQmX53nieyQ9Bv0Om7PJy7pQcUdqc/feiSHmgOsbYIDv
 xgE0fUGw/b2oLaWiyou0m9cpzbxadH4DPfnSBpVb8aBCMTsnmVeygb799IVw2eUlO3Lp
 cCMxFtsWBmUzGa7LvK7N0xD3lVE9J3d3wq9sojTnCfGCMM5Rf2cdEDXLzH0hjPmh7XGZ
 GE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RDWB2IW+Z3svJoFCdW5eGbn7Ra97uIVuIYjSnbYrA18=;
 b=f8WIoMmUNULTZyTFGTBeb4DajoLDk/3H7OCf+CfV4ChtO0Q0e41/J1hO6SZ5XKEVXn
 DQp/1KLHZqWGVUhGrnFPe7mZEKjUmYfYP870yyOzyesATERo2zUwAbQKh//c8SbOxxYN
 u/RA8ldxftGwy3Ait8BRI9qHsoALhoxREA99YjXeqhsa5zbjqQACCrQ4HR3Kj5pqXs9n
 UFEozrG4RGMm1tum/vM5DumCPWqrZ95Y0LgJKg0MYvSGFxkJ5D3LlJeYSdqUYlryeC3z
 K88HPXBCVjyOy9Re3Ugkrpyj8ZxeouFlKqxMedzGOQOp0fcmwScZAbS+5cZw9k6qHV7A
 N8fg==
X-Gm-Message-State: AOAM533a24FKFRVZE3YWTesjTNrGrsiyiRtXCqMypoWsYFIBwN7Fmnrm
 fxJAfEhdCJdAdHIhzyCMJSlSjzp/TGeypHKm26I=
X-Google-Smtp-Source: ABdhPJx+Rs+cs1QnwqOq8dp4mqtP/fQiWl87xpHX3kT+F/AnuTNvqtHUoN60evbR5ybjcLmt2z4Uc6Mh5pDX+RkjVFQ=
X-Received: by 2002:a92:ce89:: with SMTP id r9mr10382223ilo.191.1615805200509; 
 Mon, 15 Mar 2021 03:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
 <20210314032324.45142-9-ma.mandourr@gmail.com>
 <YE8wZ7WWdtqIW/kt@stefanha-x1.localdomain>
In-Reply-To: <YE8wZ7WWdtqIW/kt@stefanha-x1.localdomain>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Mon, 15 Mar 2021 12:46:29 +0200
Message-ID: <CAD-LL6gzDC5KcN3BNa-xULywRLmWFSTHyWCM-5851EY0Pum04g@mail.gmail.com>
Subject: Re: [PATCH 8/8] tools/virtiofsd: Replacing malloc-like calls with
 GLib's variants
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000000af1305bd90f7ac"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x129.google.com
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000000af1305bd90f7ac
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 15, 2021 at 12:01 PM Stefan Hajnoczi <stefanha@redhat.com>
wrote:

> On Sun, Mar 14, 2021 at 05:23:24AM +0200, Mahmoud Mandour wrote:
> > @@ -130,7 +130,7 @@ static struct fuse_req *fuse_ll_alloc_req(struct
> fuse_session *se)
> >  {
> >      struct fuse_req *req;
> >
> > -    req = (struct fuse_req *)calloc(1, sizeof(struct fuse_req));
> > +    req = g_try_new(struct fuse_req, 1);
>
> g_try_new0() since the original call was calloc(3)?
>
> > @@ -411,7 +411,7 @@ static int lo_map_grow(struct lo_map *map, size_t
> new_nelems)
> >          return 1;
> >      }
> >
> > -    new_elems = realloc(map->elems, sizeof(map->elems[0]) * new_nelems);
> > +    new_elems = g_realloc_n(map->elems, new_nelems,
> sizeof(map->elems[0]));
>
> g_try_realloc_n() since failure is handled below?
>
> Stefan
>

Hello Mr. Stefan,

You're correct. I'm really sorry for such small and strangely obvious
errors.
If the patch is going to be ACKed, will you edit those problems or shall I
fix them and
resend the patch again alone?

--00000000000000af1305bd90f7ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 15, 2021 at 12:01 PM Stef=
an Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Sun, Mar 14, 2021 at 05:23:24AM +0200, Mahmoud Mandour wrote:<br>
&gt; @@ -130,7 +130,7 @@ static struct fuse_req *fuse_ll_alloc_req(struct f=
use_session *se)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct fuse_req *req;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 req =3D (struct fuse_req *)calloc(1, sizeof(struct fuse=
_req));<br>
&gt; +=C2=A0 =C2=A0 req =3D g_try_new(struct fuse_req, 1);<br>
<br>
g_try_new0() since the original call was calloc(3)?<br>
<br>
&gt; @@ -411,7 +411,7 @@ static int lo_map_grow(struct lo_map *map, size_t =
new_nelems)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 new_elems =3D realloc(map-&gt;elems, sizeof(map-&gt;ele=
ms[0]) * new_nelems);<br>
&gt; +=C2=A0 =C2=A0 new_elems =3D g_realloc_n(map-&gt;elems, new_nelems, si=
zeof(map-&gt;elems[0]));<br>
<br>
g_try_realloc_n() since failure is handled below?<br>
<br>
Stefan<br></blockquote><div><br></div><div>Hello Mr. Stefan,</div><div><br>=
</div><div>You&#39;re correct. I&#39;m really sorry for such small and stra=
ngely obvious errors.</div><div>If the patch is going to be ACKed, will you=
 edit those problems or shall I fix them and</div><div>resend the patch aga=
in alone?=C2=A0=C2=A0</div></div></div>

--00000000000000af1305bd90f7ac--

