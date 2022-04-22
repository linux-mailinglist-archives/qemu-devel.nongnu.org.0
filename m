Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D7950BA1C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 16:30:20 +0200 (CEST)
Received: from localhost ([::1]:55824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhuId-0001zS-8C
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 10:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhuGS-00083m-D6
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:28:05 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:42553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhuGQ-0002Id-LF
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:28:03 -0400
Received: by mail-qk1-x72c.google.com with SMTP id j6so5886126qkp.9
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 07:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bYVuToFBIYT/C7LMvCW8JkVxP8MvRQJiDMINAWjw/SM=;
 b=hG4tKVT/waedsSZv7FM1hg17duFZGRnusJab7OwnQDK1QLM+ihXK9ktRZszr7GFf9f
 ucDCIPprG5syVzbYHHd+eptTd9Z0p0f5iIwbMj/5QGc7UzhOq6/cs64KlMKpjaggN5Ya
 c/f7wVBn4eTpSXgv/Op4Ezof8IgUv0YITpDLYEjKt4ruFP/WpyAYRhZtbuWA0qW6JlGv
 VM3bADH9FGBaq+z7/Vn83kXu74OdTIdOWbhauxReVoz9bcQFRmIXGAlcv4niPw4apo02
 tGK5KJKRwWABI7eFhlX5i69dyqPJ9EHlvahHg3mumwd0g8ah17P5E8tc3S16jtiXc9J/
 taWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bYVuToFBIYT/C7LMvCW8JkVxP8MvRQJiDMINAWjw/SM=;
 b=T/CYqgDfi1Q4X58K6wODUwnhtq0DgEs9wh63zVkvMO6fzNLw054X5vELn/9ivIa1oZ
 +mFdeQKZqkKBNTo2mGKsesHmHdAwbgNJ6nJF/+7Pl7g0qF39kiSc2UuMhMGhErdkk3S5
 AuBa4VvHiLhtFErHWX0gkH3nFpu+qTdwrbFbYuuhBlChYOpaJec4iFzD96zybI3X3u2e
 31LXACwLdDWjBBfKU/kq53MNZNAMK754LpIcoJdJvaF9UR0i0fjB5V1MH+kXel9ybvUj
 bv+aYvjZhGDXJaUO3fata69TJsXTfdbaoI8oJjt6iDh0kLyklajnEyUb1+7Ke4xVputN
 MYcQ==
X-Gm-Message-State: AOAM532VZPie1wpUfbsmiahBEWZXTn1aEJg74ILwZKPs+/tUErol+oVz
 HLLpM+lA6WuT2ErGP4K6oNxibm3a/wJpX67dAHE=
X-Google-Smtp-Source: ABdhPJzcfzCJOvCgR2BF2016P6UOT7Wsi+ndpIYXgR54Brh64Vk25wJ4JrQWfbDi5o3lN/wkLPCjGw+WtH2ap2KA96k=
X-Received: by 2002:ae9:ef4e:0:b0:69e:2403:eae8 with SMTP id
 d75-20020ae9ef4e000000b0069e2403eae8mr2715213qkg.397.1650637681194; Fri, 22
 Apr 2022 07:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
 <20220422083639.3156978-9-marcandre.lureau@redhat.com>
 <20220422142455.zcwiwxyrt2ueygl2@redhat.com>
In-Reply-To: <20220422142455.zcwiwxyrt2ueygl2@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 22 Apr 2022 18:27:49 +0400
Message-ID: <CAJ+F1CJ_foGQCdS0KRrpiFVgbPqAt_9fcDspsvVV3nSg5At1WA@mail.gmail.com>
Subject: Re: [PATCH 08/10] Use g_unix_set_fd_nonblocking()
To: Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a3fb1305dd3f086f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x72c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a3fb1305dd3f086f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Apr 22, 2022 at 6:25 PM Eric Blake <eblake@redhat.com> wrote:

> On Fri, Apr 22, 2022 at 12:36:37PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > API available since glib 2.30. It also preserves errno.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/misc/ivshmem.c           | 2 +-
> >  util/event_notifier-posix.c | 6 ++----
> >  util/main-loop.c            | 2 +-
> >  3 files changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> > index e7c0099bdaf6..a1cd3dcc51cf 100644
> > --- a/hw/misc/ivshmem.c
> > +++ b/hw/misc/ivshmem.c
> > @@ -537,7 +537,7 @@ static void process_msg_connect(IVShmemState *s,
> uint16_t posn, int fd,
> >
> >      IVSHMEM_DPRINTF("eventfds[%d][%d] =3D %d\n", posn, vector, fd);
> >      event_notifier_init_fd(&peer->eventfds[vector], fd);
> > -    fcntl_setfl(fd, O_NONBLOCK); /* msix/irqfd poll non block */
> > +    g_unix_set_fd_nonblocking(fd, TRUE, NULL); /* msix/irqfd poll non
> block */
>
> Does glib require us to use their non-standard TRUE, or can we merely
> pass true and rely on C promotion rules to make the code look nicer?
>
>
No, type promotion is fine fortunately. Will change it to "true".


--=20
Marc-Andr=C3=A9 Lureau

--000000000000a3fb1305dd3f086f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 22, 2022 at 6:25 PM Eri=
c Blake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, A=
pr 22, 2022 at 12:36:37PM +0400, <a href=3D"mailto:marcandre.lureau@redhat.=
com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; API available since glib 2.30. It also preserves errno.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 hw/misc/ivshmem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-=
<br>
&gt;=C2=A0 util/event_notifier-posix.c | 6 ++----<br>
&gt;=C2=A0 util/main-loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-=
<br>
&gt;=C2=A0 3 files changed, 4 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c<br>
&gt; index e7c0099bdaf6..a1cd3dcc51cf 100644<br>
&gt; --- a/hw/misc/ivshmem.c<br>
&gt; +++ b/hw/misc/ivshmem.c<br>
&gt; @@ -537,7 +537,7 @@ static void process_msg_connect(IVShmemState *s, u=
int16_t posn, int fd,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 IVSHMEM_DPRINTF(&quot;eventfds[%d][%d] =3D %d\n&qu=
ot;, posn, vector, fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 event_notifier_init_fd(&amp;peer-&gt;eventfds[vect=
or], fd);<br>
&gt; -=C2=A0 =C2=A0 fcntl_setfl(fd, O_NONBLOCK); /* msix/irqfd poll non blo=
ck */<br>
&gt; +=C2=A0 =C2=A0 g_unix_set_fd_nonblocking(fd, TRUE, NULL); /* msix/irqf=
d poll non block */<br>
<br>
Does glib require us to use their non-standard TRUE, or can we merely<br>
pass true and rely on C promotion rules to make the code look nicer?<br>
<br></blockquote><div><br></div><div>No, type promotion is fine fortunately=
. Will change it to &quot;true&quot;.<br></div></div><br clear=3D"all"><br>=
-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br=
></div></div>

--000000000000a3fb1305dd3f086f--

