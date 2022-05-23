Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF953154E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 19:34:15 +0200 (CEST)
Received: from localhost ([::1]:57490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntBwa-0002Bl-64
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 13:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ntBtS-000061-Ky
 for qemu-devel@nongnu.org; Mon, 23 May 2022 13:30:58 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:38858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ntBtQ-0007W4-ER
 for qemu-devel@nongnu.org; Mon, 23 May 2022 13:30:58 -0400
Received: by mail-lj1-x233.google.com with SMTP id q1so8375017ljb.5
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 10:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l+xlJN7z2H7UL8hMEqsozM2nTRZ9KYqAOkYF9GOS7aw=;
 b=XUoi3yz6GnbfQxkljCJcl2cKqyaLLNuzJo2tRYZb1a5fLmxvW0neo0U1XzGG/uxxQ/
 3l6KfVZrwdichhA6ZmbKAbgJ18+30FuRmXmRMJxWbsIt/oIZeIYGc4yK/fCvfe0CkkQe
 E8uexa+E01o3yz/QnH8haZQn2Mf9CoaYGTEbZ89qtyhl6adlWpHR8EldIy8xi6XM8VSg
 HCILzSPeKya67ut+7tVa1xSad8v2WSx9BfEQv+RPkZvhFjz8O6mjBhIAsTCWrf3A1lTZ
 d4HERkQpR+akNEKC0P/RShHcb6vs473DzFglSsaOV6yCrBCBEJSPCsOvtbsC6GcbGN11
 xnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l+xlJN7z2H7UL8hMEqsozM2nTRZ9KYqAOkYF9GOS7aw=;
 b=kHKxk9y9GAWbkP9zK5IjcWRjwcia6fFKk/lJTSu3RRRtXVNm02Ech572ZJcAp/5GUH
 sYmIK+VuWqP8d4Mbw9c2foj0y4KPwy1wY+LKOKdyEZF4sbfDzdnExjiHymxxrL9HW3e7
 6mN6HJuvmQ/iS7aYdyMz3moDIetYtlQMgMWG4MMuAD42oQFPfgapHrZtnmUV0yipLti+
 YgXJOiwPA36VZlXaEJpYpwGqyvHMHa+KyQb32KsoORzJMmxaQkH2lDb0ag3/BNlLh4rQ
 WygObUg3hRFk8Axns4B/h58aSjt9vaL27h9cPb+kyKkerVtNiLaa+Als3GK/Q5Y2y/zA
 xKUQ==
X-Gm-Message-State: AOAM532YFIx1/9nGxwm3LR4PWAWmUhX9V5bfX/MMOaU+Vy2sxEXrf/VX
 TWeo/hjmm2kBg4aUjTa1XSUVht8kvc/lF1LbpI0=
X-Google-Smtp-Source: ABdhPJyJXcFfYv23TuxUkS8a4tYLoNt0f9ZAbUsfPCOR+PmEUgUUb2ZaoMI7jbb05LQuMCPW1etdRMbBGqyPAlsP+2E=
X-Received: by 2002:a2e:8e21:0:b0:253:d33d:d684 with SMTP id
 r1-20020a2e8e21000000b00253d33dd684mr13103011ljk.507.1653327053887; Mon, 23
 May 2022 10:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
 <20220513180821.905149-6-marcandre.lureau@redhat.com>
 <YouBGRfgzlsGi99n@redhat.com>
In-Reply-To: <YouBGRfgzlsGi99n@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 23 May 2022 19:30:42 +0200
Message-ID: <CAJ+F1CKV0U8g9NCpX6LvE6HTVLdNv-RkHxLeaAU2PjeRKVT6fw@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] osdep: export qemu_open_cloexec()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bea02f05dfb133a9"
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x233.google.com
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

--000000000000bea02f05dfb133a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, May 23, 2022 at 2:43 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Fri, May 13, 2022 at 08:08:11PM +0200, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Used in the next patch, to simplify qga code.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/qemu/osdep.h |  1 +
> >  util/osdep.c         | 10 ++++++++--
> >  2 files changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index 67cc465416..64f51cfb7a 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -489,6 +489,7 @@ void sigaction_invoke(struct sigaction *action,
> >   */
> >  int qemu_open_old(const char *name, int flags, ...);
> >  int qemu_open(const char *name, int flags, Error **errp);
> > +int qemu_open_cloexec(const char *name, int flags, mode_t mode, Error
> **errp);
>
> I don't think we should be exporting this - it is just a variant of the
> 'qemu_open_old' method that we wanted callers to stop using in favour
> of explicitly deciding between 'qemu_open' and 'qemu_create'.
>


qemu_open() has "/dev/fdset" handling, which qemu-ga and other tools don't
need.

(qemu_open_old() doesn't set CLOEXEC)


>
> >  int qemu_create(const char *name, int flags, mode_t mode, Error **errp=
);
> >  int qemu_close(int fd);
> >  int qemu_unlink(const char *name);
> > diff --git a/util/osdep.c b/util/osdep.c
> > index 60fcbbaebe..545a88e1fd 100644
> > --- a/util/osdep.c
> > +++ b/util/osdep.c
> > @@ -279,9 +279,11 @@ int qemu_lock_fd_test(int fd, int64_t start,
> int64_t len, bool exclusive)
> >  }
> >  #endif
> >
> > -static int qemu_open_cloexec(const char *name, int flags, mode_t mode)
> > +int qemu_open_cloexec(const char *name, int flags, mode_t mode, Error
> **errp)
> >  {
> > +    ERRP_GUARD();
> >      int ret;
> > +
> >  #ifdef O_CLOEXEC
> >      ret =3D open(name, flags | O_CLOEXEC, mode);
> >  #else
> > @@ -290,6 +292,10 @@ static int qemu_open_cloexec(const char *name, int
> flags, mode_t mode)
> >          qemu_set_cloexec(ret);
> >      }
> >  #endif
> > +    if (ret =3D=3D -1) {
> > +        error_setg_errno(errp, errno, "Failed to open file '%s'", name=
);
> > +    }
> > +
>
> This will mean that qemu_open_internal() caller will now be overwriting
> an existing error message.
>

NULL is passed as errp argument of qemu_open_cloexec() in
qemu_open_internal().


>
> >      return ret;
> >  }
> >
> > @@ -327,7 +333,7 @@ qemu_open_internal(const char *name, int flags,
> mode_t mode, Error **errp)
> >      }
> >  #endif
> >
> > -    ret =3D qemu_open_cloexec(name, flags, mode);
> > +    ret =3D qemu_open_cloexec(name, flags, mode, NULL);
> >
>

here


> >      if (ret =3D=3D -1) {
> >          const char *action =3D flags & O_CREAT ? "create" : "open";
> > --
> > 2.36.1
> >
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000bea02f05dfb133a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 23, 2022 at 2:43 PM Dan=
iel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Fri, May 13, 2022 at 08:08:11PM +0200, <a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wro=
te:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Used in the next patch, to simplify qga code.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 include/qemu/osdep.h |=C2=A0 1 +<br>
&gt;=C2=A0 util/osdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++++++--<br=
>
&gt;=C2=A0 2 files changed, 9 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h<br>
&gt; index 67cc465416..64f51cfb7a 100644<br>
&gt; --- a/include/qemu/osdep.h<br>
&gt; +++ b/include/qemu/osdep.h<br>
&gt; @@ -489,6 +489,7 @@ void sigaction_invoke(struct sigaction *action,<br=
>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 int qemu_open_old(const char *name, int flags, ...);<br>
&gt;=C2=A0 int qemu_open(const char *name, int flags, Error **errp);<br>
&gt; +int qemu_open_cloexec(const char *name, int flags, mode_t mode, Error=
 **errp);<br>
<br>
I don&#39;t think we should be exporting this - it is just a variant of the=
<br>
&#39;qemu_open_old&#39; method that we wanted callers to stop using in favo=
ur<br>
of explicitly deciding between &#39;qemu_open&#39; and &#39;qemu_create&#39=
;.<br></blockquote><div><br></div><div><br></div><div>qemu_open() has &quot=
;/dev/fdset&quot; handling, which qemu-ga and other tools don&#39;t need.</=
div><div><br></div><div>(qemu_open_old() doesn&#39;t set CLOEXEC)<br></div>=
<div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 int qemu_create(const char *name, int flags, mode_t mode, Error =
**errp);<br>
&gt;=C2=A0 int qemu_close(int fd);<br>
&gt;=C2=A0 int qemu_unlink(const char *name);<br>
&gt; diff --git a/util/osdep.c b/util/osdep.c<br>
&gt; index 60fcbbaebe..545a88e1fd 100644<br>
&gt; --- a/util/osdep.c<br>
&gt; +++ b/util/osdep.c<br>
&gt; @@ -279,9 +279,11 @@ int qemu_lock_fd_test(int fd, int64_t start, int6=
4_t len, bool exclusive)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt; -static int qemu_open_cloexec(const char *name, int flags, mode_t mode=
)<br>
&gt; +int qemu_open_cloexec(const char *name, int flags, mode_t mode, Error=
 **errp)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt; +<br>
&gt;=C2=A0 #ifdef O_CLOEXEC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D open(name, flags | O_CLOEXEC, mode);<br>
&gt;=C2=A0 #else<br>
&gt; @@ -290,6 +292,10 @@ static int qemu_open_cloexec(const char *name, in=
t flags, mode_t mode)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_cloexec(ret);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;Faile=
d to open file &#39;%s&#39;&quot;, name);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
<br>
This will mean that qemu_open_internal() caller will now be overwriting<br>
an existing error message.<br></blockquote><div><br></div><div>NULL is pass=
ed as errp argument of qemu_open_cloexec() in qemu_open_internal().</div><d=
iv>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -327,7 +333,7 @@ qemu_open_internal(const char *name, int flags, mo=
de_t mode, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 ret =3D qemu_open_cloexec(name, flags, mode);<br>
&gt; +=C2=A0 =C2=A0 ret =3D qemu_open_cloexec(name, flags, mode, NULL);<br>
&gt;=C2=A0 <br></blockquote><div><br></div><div>here</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *action =3D flags &amp; O=
_CREAT ? &quot;create&quot; : &quot;open&quot;;<br>
&gt; -- <br>
&gt; 2.36.1<br>
&gt; <br>
&gt; <br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000bea02f05dfb133a9--

