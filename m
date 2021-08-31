Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617953FCC4B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:27:49 +0200 (CEST)
Received: from localhost ([::1]:36244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7Xw-0004Vo-VC
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mL7Sx-0008Ot-G9
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:22:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mL7Sv-0006Cn-Nq
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630430548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2IKPzZVh2vUSM0lXoWaU94FE+1ThRkyEvfpsdfcrEO8=;
 b=EkiSb/yMVIZROvPpYawA8iHhUDtBFXVX8nKM1HJyYKuBc7hT9SQ7/xOIPxWVTwoysDoaqt
 TujUiJxsoEItB17n9f51pxQ9dRE47XaEmVK+If7RSxRnKkauPRBvhOBnuUg46YpwS3t5W4
 UBRqRA4rl8puTcdybdYQpCy4/QUrVIc=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-gzh54I_nObyFTAQm3bQq_g-1; Tue, 31 Aug 2021 13:22:13 -0400
X-MC-Unique: gzh54I_nObyFTAQm3bQq_g-1
Received: by mail-pf1-f197.google.com with SMTP id
 v65-20020a627a44000000b003f286b054cbso1891583pfc.11
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 10:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2IKPzZVh2vUSM0lXoWaU94FE+1ThRkyEvfpsdfcrEO8=;
 b=MwUaQfb/fB4oYGuZku+/YqDUZMsFm0a3oTxG+Ezs7jQpRfzEVvdthNht4kn4kbZEsN
 KxMS/16nHYwG/sBQlGXYnuvzbat/zCbeYgiv0WKAp+z+Pw5RuyPL8upo0ON2E5DvbH4c
 oMMvTFww/51XXqlTDAD+TFDxekAl7qXnvO0iqMT0TshPlu8q3SJz7gscGDxnQ/UVbFui
 DLfwyW1ju48ZpfLni3rgMYQzH4PlbtfOEVht7apk1k+lU7olNHXyXUkQG8KbAOyxdaVd
 1y/rAnFhYb+gEgApkJElv7lOtUYPrD3nC0Nt719p6FtwOAsqUAJ6SsZGH3hCGzhDHzuD
 CpDw==
X-Gm-Message-State: AOAM531YMNeuZUHb2LyCpFkOw05xLb2UdLuuWuxUqfvkTD9jcWclz0iu
 KyDZheDvaZq4ByV+OtTP4yJuBUAO102opGKym45CNWwpVMmglOM1sctmfvMsR7Zqqc5tiqybsZs
 n6a1KK+ZoWkwJT+FejfPyv7aaPj1BRRE=
X-Received: by 2002:a17:90a:c798:: with SMTP id
 gn24mr6453130pjb.97.1630430532400; 
 Tue, 31 Aug 2021 10:22:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBXQbuAeNj37UjTiDFPQJnsfmnCuiJg4pFRyA0lvbW+9mbmzMXN9sRyPkpeZPbjLPmXhCB5T1FGPsSn96lq8s=
X-Received: by 2002:a17:90a:c798:: with SMTP id
 gn24mr6453110pjb.97.1630430532120; 
 Tue, 31 Aug 2021 10:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210830225449.1509719-1-mjt@msgid.tls.msk.ru>
 <c5887473-1df2-5827-e9c7-e6f0470ab332@msgid.tls.msk.ru>
In-Reply-To: <c5887473-1df2-5827-e9c7-e6f0470ab332@msgid.tls.msk.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 31 Aug 2021 21:22:01 +0400
Message-ID: <CAMxuvawU2d6fFBczkDcPAJzYP4dSoin7UnesX2idHfd1WAyTOA@mail.gmail.com>
Subject: Re: qemu-sockets: account for trailing \0 byte in unix socket pathname
To: Michael Tokarev <mjt@tls.msk.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b2ca2e05cade3041"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b2ca2e05cade3041
Content-Type: text/plain; charset="UTF-8"

Hi

On Tue, Aug 31, 2021 at 9:17 PM Michael Tokarev <mjt@tls.msk.ru> wrote:

> 31.08.2021 01:54, Michael Tokarev wrote:
> > Linux kernel can return size of af_unix socket to be
> > one byte larger than sockaddr_un structure - adding
> > the trailing zero byte.
> >
> > Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> > Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f (first in 6.1.0)
> > Cc: qemu-stable@nongnu.org
> >
> > diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> > index f2f3676d1f..83926dc2bc 100644
> > --- a/util/qemu-sockets.c
> > +++ b/util/qemu-sockets.c
> > @@ -1345,8 +1345,9 @@ socket_sockaddr_to_address_unix(struct
> sockaddr_storage *sa,
> >       SocketAddress *addr;
> >       struct sockaddr_un *su = (struct sockaddr_un *)sa;
> >
> > +    /* kernel might have added \0 terminator to non-abstract socket */
> >       assert(salen >= sizeof(su->sun_family) + 1 &&
> > -           salen <= sizeof(struct sockaddr_un));
> > +           salen <= sizeof(struct sockaddr_un) + su->sun_path[0] ? 1 :
> 0);
> >
> >       addr = g_new0(SocketAddress, 1);
> >       addr->type = SOCKET_ADDRESS_TYPE_UNIX;
>
> Actually, this is not sufficient.
>
> While this change fixes one issue (the famous trailing null byte \0),
> the actual assertion failure occurs because salen = 2, ie, too SMALL,
> not too large.
>
> So it looks like libvirt provides an unnamed socket there, --
> maybe from a socketpair(2)?
>

Yes

Ok, I guess it should still check for salen >= sizeof(su->sun_family)

and then modify if (salen > sizeof(su->sun_family) && !su->sun_path[0]) {


> Hwell..
>

hmm, too bad we didn't catch it during RC!

(strange that it seems to hit Debian libvirt/virt-manager users and
apparently not on Fedora)

--000000000000b2ca2e05cade3041
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 31, 2021 at 9:17 PM Mic=
hael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru">mjt@tls.msk.ru</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">31.08.2021=
 01:54, Michael Tokarev wrote:<br>
&gt; Linux kernel can return size of af_unix socket to be<br>
&gt; one byte larger than sockaddr_un structure - adding<br>
&gt; the trailing zero byte.<br>
&gt; <br>
&gt; Signed-off-by: Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru" t=
arget=3D"_blank">mjt@tls.msk.ru</a>&gt;<br>
&gt; Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f (first in 6.1.0)<br>
&gt; Cc: <a href=3D"mailto:qemu-stable@nongnu.org" target=3D"_blank">qemu-s=
table@nongnu.org</a><br>
&gt; <br>
&gt; diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
&gt; index f2f3676d1f..83926dc2bc 100644<br>
&gt; --- a/util/qemu-sockets.c<br>
&gt; +++ b/util/qemu-sockets.c<br>
&gt; @@ -1345,8 +1345,9 @@ socket_sockaddr_to_address_unix(struct sockaddr_=
storage *sa,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SocketAddress *addr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sockaddr_un *su =3D (struct sockaddr_=
un *)sa;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 /* kernel might have added \0 terminator to non-abstrac=
t socket */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0assert(salen &gt;=3D sizeof(su-&gt;sun_famil=
y) + 1 &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0salen &lt;=3D sizeof(struct =
sockaddr_un));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0salen &lt;=3D sizeof(struct =
sockaddr_un) + su-&gt;sun_path[0] ? 1 : 0);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D g_new0(SocketAddress, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;type =3D SOCKET_ADDRESS_TYPE_UNIX;<=
br>
<br>
Actually, this is not sufficient.<br>
<br>
While this change fixes one issue (the famous trailing null byte \0),<br>
the actual assertion failure occurs because salen =3D 2, ie, too SMALL,<br>
not too large.<br>
<br>
So it looks like libvirt provides an unnamed socket there, --<br>
maybe from a socketpair(2)?<br></blockquote><div><br></div><div>Yes<br></di=
v><div><br></div><div>Ok, I guess it should still check for salen &gt;=3D s=
izeof(su-&gt;sun_family)</div><div><br></div><div>and then modify if (salen=
 &gt; sizeof(su-&gt;sun_family) &amp;&amp; !su-&gt;sun_path[0]) {</div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Hwell..<br></blockquote><div><br></div><div>hmm, too bad we didn&#39;t catc=
h it during RC! <br></div><div><br></div><div>(strange that it seems to hit=
 Debian libvirt/virt-manager users and apparently not on Fedora)<br></div><=
/div></div>

--000000000000b2ca2e05cade3041--


