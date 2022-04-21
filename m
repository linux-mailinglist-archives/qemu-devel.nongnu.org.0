Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888B550A065
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 15:09:28 +0200 (CEST)
Received: from localhost ([::1]:60278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhWYp-0004aM-M6
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 09:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhWXb-00037u-8k
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:08:11 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:34539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhWXW-0006jd-3o
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:08:10 -0400
Received: by mail-qk1-x72d.google.com with SMTP id j9so3483500qkg.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7zjKv8Ammm+kKIhYKIaIi3AiiKJ1NqGD3HayX23+Zug=;
 b=Ey8Rgl1tT3OBcupK+r2TbQYYYiQy9xsLYytE9x6xaOEevQcj17hnInU8G4kv0WO0th
 IA+L2C8mAsoMYWcgtfh1RGCj0RLXz3OFP1cLSGpE7fTFpqrimxcSKo5qWgiI8A7smyi/
 fC+gjuVtz+Zq/h8f6JivEyVBbXTLq8vomqvwv2mEi2EYPoYagONnqvmg6EeSyMZ0FGLm
 kfs9puXwIVoCc2FdFJvUwyhH15RFaJJC/Tmi6bAMcNJvSGofpclN97Ansq2MI817lDXe
 YMghCOq4nhUqLc7p118Vce1SYj9vEhCZcVx9nemDZa1btS2KiBDHNLRQ1BwNzKB7YS2U
 3pGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7zjKv8Ammm+kKIhYKIaIi3AiiKJ1NqGD3HayX23+Zug=;
 b=bGavK8xdB7BR6KkmssjzqIFcjtFQL7jN4CSls101rNQG/hGU8JSIQXM4chuE70quRA
 Rqch3x4aEnM5tG0vz45reCtWKazhRJneqAF5du/eJiwycNFmXKHvM9MAgv8XiWsMc6yw
 5BGnlPtu72Uxon9SQ1mJSuzBnovPtT0+xuN2nKiNBkAO3NeZZVWwN2GheMPTpWsuFjED
 OXQsuClsaVViEAQIEbcFlY4/aVdylBZuLpiR7+tD0TFdN3ICoCsZG56Q5HIuGeQhKwbO
 kCCHJwAP7OAbL0AHE4D1MVGWi3Tpx0Aq/GcX5Oz57UVjwOJP329h1XM0vihTU8ILvzQO
 Hw/Q==
X-Gm-Message-State: AOAM531gZSgOcMCJ5qQZarrOVWY7iLJpcKjKz3gl7jbjpPqiPYMn1HvW
 7MYy7Az3VmdiLXTkRNH094LFDgjDC5Z5CrqLMoc=
X-Google-Smtp-Source: ABdhPJyGsTKodGNu4HXtVlKwjaN8gopadYKC1uh2d/lZ8UGHe8Qsm48MqsandyxNlxu7EJzqN/yilRyy1LK8CZdF+t0=
X-Received: by 2002:a05:620a:4093:b0:69c:fda:3cf2 with SMTP id
 f19-20020a05620a409300b0069c0fda3cf2mr15377171qko.245.1650546485060; Thu, 21
 Apr 2022 06:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-33-marcandre.lureau@redhat.com>
 <YmAqpOStkQ1DY/rm@redhat.com>
In-Reply-To: <YmAqpOStkQ1DY/rm@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Apr 2022 17:07:53 +0400
Message-ID: <CAJ+F1CJ0FkGX-Kk3wD92iDS23xUnvjJZvNB3SDsQRbF7epHDmw@mail.gmail.com>
Subject: Re: [PATCH 32/41] qtest: simplify socket_send()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ed6b5d05dd29cc67"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x72d.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ed6b5d05dd29cc67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Apr 20, 2022 at 8:20 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Apr 20, 2022 at 05:26:15PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Reuse qemu_write_full().
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  tests/qtest/libqtest.c | 16 ++--------------
> >  1 file changed, 2 insertions(+), 14 deletions(-)
> >
> > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > index 7b5890dcc487..2b9bdb947d6f 100644
> > --- a/tests/qtest/libqtest.c
> > +++ b/tests/qtest/libqtest.c
> > @@ -414,21 +414,9 @@ void qtest_quit(QTestState *s)
> >
> >  static void socket_send(int fd, const char *buf, size_t size)
> >  {
> > -    size_t offset;
> > -
> > -    offset =3D 0;
> > -    while (offset < size) {
> > -        ssize_t len;
> > +    size_t res =3D qemu_write_full(fd, buf, size);
> >
> > -        len =3D write(fd, buf + offset, size - offset);
> > -        if (len =3D=3D -1 && errno =3D=3D EINTR) {
> > -            continue;
> > -        }
> > -
> > -        g_assert_cmpint(len, >, 0);
> > -
> > -        offset +=3D len;
> > -    }
> > +    assert(res =3D=3D size);
> >  }
>
> IMHO socket_send should jsut be deleted, with the few callers
> directly using qemu_write_full
>

It's not a big deal, it's an internal helper. There is an additional
assert() there, and the socket_send_fds() pair. I'll leave it for now.

thanks

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ed6b5d05dd29cc67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 8:20 PM Dan=
iel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Wed, Apr 20, 2022 at 05:26:15PM +0400, <a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wro=
te:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Reuse qemu_write_full().<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 tests/qtest/libqtest.c | 16 ++--------------<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 14 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
&gt; index 7b5890dcc487..2b9bdb947d6f 100644<br>
&gt; --- a/tests/qtest/libqtest.c<br>
&gt; +++ b/tests/qtest/libqtest.c<br>
&gt; @@ -414,21 +414,9 @@ void qtest_quit(QTestState *s)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void socket_send(int fd, const char *buf, size_t size)<br=
>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 size_t offset;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 offset =3D 0;<br>
&gt; -=C2=A0 =C2=A0 while (offset &lt; size) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ssize_t len;<br>
&gt; +=C2=A0 =C2=A0 size_t res =3D qemu_write_full(fd, buf, size);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D write(fd, buf + offset, size - of=
fset);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len =3D=3D -1 &amp;&amp; errno =3D=3D=
 EINTR) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpint(len, &gt;, 0);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset +=3D len;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 assert(res =3D=3D size);<br>
&gt;=C2=A0 }<br>
<br>
IMHO socket_send should jsut be deleted, with the few callers<br>
directly using qemu_write_full<br></blockquote></div><div><br></div><div>It=
&#39;s not a big deal, it&#39;s an internal helper. There is an additional =
assert() there, and the socket_send_fds() pair. I&#39;ll leave it for now.<=
/div><div><br></div><div>thanks<br></div><div><br></div>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000ed6b5d05dd29cc67--

