Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC3351BE1B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:33:50 +0200 (CEST)
Received: from localhost ([::1]:59318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmZjw-0000hZ-Vu
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmZdf-0007BG-7P; Thu, 05 May 2022 07:27:19 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:36659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmZdd-0005Dh-Am; Thu, 05 May 2022 07:27:18 -0400
Received: by mail-lj1-x22f.google.com with SMTP id g16so5185547lja.3;
 Thu, 05 May 2022 04:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZdVN3a383OPzwV+cF1AW94Enq1cCQojZAgInES4br0E=;
 b=hBEcpHvnmVeoBDA/sDyisQT0XEcXX3J7ry9jqxzOSSdyTt0g4sJNQQ7vKAjG4s+grr
 qW7mkX9VRlzKUXAkCbjRs+kb1pbSQINSc3QPl0vyarzErYBSioeCSL1wB/Dr1WfOjAYo
 5H156+2y3PxjVCY8qs2Whi5gZK7iOHo05SreMkecq4KzxXzWvK0EskMj6tUKZ+dTR+Sf
 4n6KUh8Zby3c8C9YH3WytKWg7pdxy/PdNIBmUknGMfz6LINdwrHYTtn0fTHYmbh965QE
 ZhE5JxYm1PLjLQdXQ220hCAsewlDIhFKX5LB4g8XEvJD1qUMx22tyvgjlk0uMx2fc2oT
 RSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZdVN3a383OPzwV+cF1AW94Enq1cCQojZAgInES4br0E=;
 b=WFFEblA0CkBARr2nApuIY5hcP2t06vWVzs1cW+2y6OLFKotgmXqovxU3CW0mHo/8nY
 +Ttj/qsQIirQfPVbcgZQikWOxhiISzO9F+bYgUNBBxpm57SKF7GyEE1IpokhId2Xf8Al
 x2W5gQx6s7OhKvpYddeelNR3YCQrNrow9r7xc/Cy9yZDJYXO+cyntbevWxyx3F7L7KaY
 7VD5mOJo6RxaMc9O5b057+RlAlTErBgjLC9H8VwX4PhoYs1bwhmgQYoMNfzFfEYCL5f5
 +VtHLJFVxM74SHxgzYh3pNjPdc6/JhYVidEDaiqD4+poR45Zg5pjjfpWRqjn1C5e1rOn
 SZqw==
X-Gm-Message-State: AOAM530284bMJB1j/IEss9O11UUjm1S3ra4Zv2dLbCaeeAjDnlIjTwou
 gOFguWqdekGi+DdyR12sbdKXyPcIZRXWfxtWxHk=
X-Google-Smtp-Source: ABdhPJzPCBh6PisptwsAnBy9e7huoFQZYJWJZ7r5pci3Rl/4tdAQjA9Hh4s+4zDTGESW5MPIDSQP7gW8PT5u3BTWYNM=
X-Received: by 2002:a2e:90c1:0:b0:24f:eca:3eb2 with SMTP id
 o1-20020a2e90c1000000b0024f0eca3eb2mr16013083ljg.158.1651750033805; Thu, 05
 May 2022 04:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-6-marcandre.lureau@redhat.com>
 <87r158w7jf.fsf@pond.sub.org>
In-Reply-To: <87r158w7jf.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 5 May 2022 15:27:02 +0400
Message-ID: <CAJ+F1CKTTXSMGTTP5H9ZANVMQXECYZx2bOUrCozuK9iXzoQ==Q@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] qga: flatten safe_open_or_create()
To: Markus Armbruster <armbru@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>, Laurent Vivier <lvivier@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "open list:Block layer core" <qemu-block@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000005d6c105de420639"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000005d6c105de420639
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 5, 2022 at 3:20 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > There is a bit too much branching in the function, this can be
> > simplified a bit, and have a common exit point thanks to ERRP_PROPAGATE=
.
>
> Do you mean ERRP_GUARD()?
>

yes


>
> I'm not sure the commit reduces "branching", but it certainly reduces
> nesting, which I find improves readability.
>

ok


>
> > This also helps with the following error handling changes.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  qga/commands-posix.c | 124 ++++++++++++++++++++++---------------------
> >  1 file changed, 63 insertions(+), 61 deletions(-)
>
> I think the diff is easier to review with space change ignored:
>
> | diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> | index 78f2f21001..b4b19d3eb4 100644
> | --- a/qga/commands-posix.c
> | +++ b/qga/commands-posix.c
> | @@ -315,12 +315,14 @@ find_open_flag(const char *mode_str, Error **errp=
)
> |  static FILE *
> |  safe_open_or_create(const char *path, const char *mode, Error **errp)
> |  {
> | -    Error *local_err =3D NULL;
> | -    int oflag;
> | +    ERRP_GUARD();
> | +    int oflag, fd =3D -1;
>
> I'd prefer
>
>   +    ERRP_GUARD();
>        int oflag;
>   +    int fd =3D -1;
>
>
ok


> because it's slightly less churn, and I dislike variables with and
> without initializer in the same declaration.  Matter of taste.
>
> | +    FILE *f =3D NULL;
> |
> | -    oflag =3D find_open_flag(mode, &local_err);
> | -    if (local_err =3D=3D NULL) {
> | -        int fd;
> | +    oflag =3D find_open_flag(mode, errp);
> | +    if (*errp) {
>
> I'd prefer
>
>        if (oflag < 0) {
>
> No need for ERRP_GUARD() then, as far as I can tell.
>
>
"qga: use qemu_open_cloexec() for safe_open_or_create()" expects it to be
non-null though, I can move it there.


> | +        goto end;
> | +    }
> |
> |      /* If the caller wants / allows creation of a new file, we
> implement it
> |       * with a two step process: open() + (open() / fchmod()).
> | @@ -349,39 +351,39 @@ safe_open_or_create(const char *path, const char
> *mode, Error **errp)
> |          oflag &=3D ~(unsigned)O_CREAT;
> |          fd =3D open(path, oflag);
> |      }
> | -
> |      if (fd =3D=3D -1) {
> | -            error_setg_errno(&local_err, errno, "failed to open file
> '%s' "
> | -                             "(mode: '%s')", path, mode);
> | -        } else {
> | +        error_setg_errno(errp, errno,
> | +                         "failed to open file '%s' "
> | +                         "(mode: '%s')",
> | +                         path, mode);
> | +        goto end;
> | +    }
> | +
> |      qemu_set_cloexec(fd);
> |
> |      if ((oflag & O_CREAT) && fchmod(fd, DEFAULT_NEW_FILE_MODE) =3D=3D =
-1) {
> | -                error_setg_errno(&local_err, errno, "failed to set
> permission "
> | -                                 "0%03o on new file '%s' (mode: '%s')"=
,
> | +        error_setg_errno(errp, errno,
> | +                         "failed to set permission 0%03o on new file
> '%s' (mode: '%s')",
> |                           (unsigned)DEFAULT_NEW_FILE_MODE, path, mode);
> | -            } else {
> | -                FILE *f;
> | +        goto end;
> | +    }
> |
> |      f =3D fdopen(fd, mode);
> |      if (f =3D=3D NULL) {
> | -                    error_setg_errno(&local_err, errno, "failed to
> associate "
> | -                                     "stdio stream with file descripto=
r
> %d, "
> | -                                     "file '%s' (mode: '%s')", fd,
> path, mode);
> | -                } else {
> | -                    return f;
> | -                }
> | +        error_setg_errno(errp, errno,
> | +                         "failed to associate stdio stream with file
> descriptor %d, "
> | +                         "file '%s' (mode: '%s')",
> | +                         fd, path, mode);
> |      }
> |
> | +end:
> | +    if (f =3D=3D NULL && fd !=3D -1) {
> |          close(fd);
> |          if (oflag & O_CREAT) {
> |              unlink(path);
> |          }
> |      }
> | -    }
> | -
> | -    error_propagate(errp, local_err);
> | -    return NULL;
> | +    return f;
> |  }
> |
> |  int64_t qmp_guest_file_open(const char *path, bool has_mode, const cha=
r
> *mode,
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000005d6c105de420639
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 5, 2022 at 3:20 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a =
href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lur=
eau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; There is a bit too much branching in the function, this can be<br>
&gt; simplified a bit, and have a common exit point thanks to ERRP_PROPAGAT=
E.<br>
<br>
Do you mean ERRP_GUARD()?<br></blockquote><div><br></div><div>yes</div><div=
>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I&#39;m not sure the commit reduces &quot;branching&quot;, but it certainly=
 reduces<br>
nesting, which I find improves readability.<br></blockquote><div><br></div>=
<div>ok</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; This also helps with the following error handling changes.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 qga/commands-posix.c | 124 ++++++++++++++++++++++---------------=
------<br>
&gt;=C2=A0 1 file changed, 63 insertions(+), 61 deletions(-)<br>
<br>
I think the diff is easier to review with space change ignored:<br>
<br>
| diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
| index 78f2f21001..b4b19d3eb4 100644<br>
| --- a/qga/commands-posix.c<br>
| +++ b/qga/commands-posix.c<br>
| @@ -315,12 +315,14 @@ find_open_flag(const char *mode_str, Error **errp)<=
br>
|=C2=A0 static FILE *<br>
|=C2=A0 safe_open_or_create(const char *path, const char *mode, Error **err=
p)<br>
|=C2=A0 {<br>
| -=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
| -=C2=A0 =C2=A0 int oflag;<br>
| +=C2=A0 =C2=A0 ERRP_GUARD();<br>
| +=C2=A0 =C2=A0 int oflag, fd =3D -1;<br>
<br>
I&#39;d prefer<br>
<br>
=C2=A0 +=C2=A0 =C2=A0 ERRP_GUARD();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0int oflag;<br>
=C2=A0 +=C2=A0 =C2=A0 int fd =3D -1;<br>
<br></blockquote><div><br></div><div>ok</div><div>=C2=A0<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
because it&#39;s slightly less churn, and I dislike variables with and<br>
without initializer in the same declaration.=C2=A0 Matter of taste.<br>
<br>
| +=C2=A0 =C2=A0 FILE *f =3D NULL;<br>
| <br>
| -=C2=A0 =C2=A0 oflag =3D find_open_flag(mode, &amp;local_err);<br>
| -=C2=A0 =C2=A0 if (local_err =3D=3D NULL) {<br>
| -=C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd;<br>
| +=C2=A0 =C2=A0 oflag =3D find_open_flag(mode, errp);<br>
| +=C2=A0 =C2=A0 if (*errp) {<br>
<br>
I&#39;d prefer<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (oflag &lt; 0) {<br>
<br>
No need for ERRP_GUARD() then, as far as I can tell.<br>
<br></blockquote><div><br></div><div>&quot;qga: use qemu_open_cloexec() for=
 safe_open_or_create()&quot; expects it to be non-null though, I can move i=
t there.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
| +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto end;<br>
| +=C2=A0 =C2=A0 }<br>
| <br>
|=C2=A0 =C2=A0 =C2=A0 /* If the caller wants / allows creation of a new fil=
e, we implement it<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0* with a two step process: open() + (open() / f=
chmod()).<br>
| @@ -349,39 +351,39 @@ safe_open_or_create(const char *path, const char *m=
ode, Error **errp)<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oflag &amp;=3D ~(unsigned)O_CREAT;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D open(path, oflag);<br>
|=C2=A0 =C2=A0 =C2=A0 }<br>
| -<br>
|=C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
| -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(&amp;local_er=
r, errno, &quot;failed to open file &#39;%s&#39; &quot;<br>
| -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;(mode: &#39;%s&#39;)&quot;, path, m=
ode);<br>
| -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
| +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno,<br>
| +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;failed to open file &#39;%s&#39; &quot;<br>
| +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;(mode: &#39;%s&#39;)&quot;,<br>
| +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0path, mode);<br>
| +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto end;<br>
| +=C2=A0 =C2=A0 }<br>
| +<br>
|=C2=A0 =C2=A0 =C2=A0 qemu_set_cloexec(fd);<br>
| <br>
|=C2=A0 =C2=A0 =C2=A0 if ((oflag &amp; O_CREAT) &amp;&amp; fchmod(fd, DEFAU=
LT_NEW_FILE_MODE) =3D=3D -1) {<br>
| -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno=
(&amp;local_err, errno, &quot;failed to set permission &quot;<br>
| -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;0%03o on new file &#3=
9;%s&#39; (mode: &#39;%s&#39;)&quot;,<br>
| +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno,<br>
| +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;failed to set permission 0%03o on new file &#39;%=
s&#39; (mode: &#39;%s&#39;)&quot;,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(unsigned)DEFAULT_NEW_FILE_MODE, path, mode);<br>
| -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
| -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FILE *f;<br>
| +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto end;<br>
| +=C2=A0 =C2=A0 }<br>
| <br>
|=C2=A0 =C2=A0 =C2=A0 f =3D fdopen(fd, mode);<br>
|=C2=A0 =C2=A0 =C2=A0 if (f =3D=3D NULL) {<br>
| -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 er=
ror_setg_errno(&amp;local_err, errno, &quot;failed to associate &quot;<br>
| -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;stdio s=
tream with file descriptor %d, &quot;<br>
| -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;file &#=
39;%s&#39; (mode: &#39;%s&#39;)&quot;, fd, path, mode);<br>
| -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
| -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 re=
turn f;<br>
| -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
| +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno,<br>
| +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;failed to associate stdio stream with file descri=
ptor %d, &quot;<br>
| +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;file &#39;%s&#39; (mode: &#39;%s&#39;)&quot;,<br>
| +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0fd, path, mode);<br>
|=C2=A0 =C2=A0 =C2=A0 }<br>
| <br>
| +end:<br>
| +=C2=A0 =C2=A0 if (f =3D=3D NULL &amp;&amp; fd !=3D -1) {<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oflag &amp; O_CREAT) {<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlink(path);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
|=C2=A0 =C2=A0 =C2=A0 }<br>
| -=C2=A0 =C2=A0 }<br>
| -<br>
| -=C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
| -=C2=A0 =C2=A0 return NULL;<br>
| +=C2=A0 =C2=A0 return f;<br>
|=C2=A0 }<br>
| <br>
|=C2=A0 int64_t qmp_guest_file_open(const char *path, bool has_mode, const =
char *mode,<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000005d6c105de420639--

