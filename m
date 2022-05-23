Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75B353157C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 20:25:32 +0200 (CEST)
Received: from localhost ([::1]:57174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntCkF-0003zE-S5
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 14:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ntCOU-000225-BL
 for qemu-devel@nongnu.org; Mon, 23 May 2022 14:03:02 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:33395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ntCOR-0004TV-66
 for qemu-devel@nongnu.org; Mon, 23 May 2022 14:03:01 -0400
Received: by mail-lj1-x22f.google.com with SMTP id 27so13205053ljw.0
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 11:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MH+M8Bh0CbR9eUgXzdNFfMgvhBhrHXgI9Ctwz+nFHl4=;
 b=oZMsBRj/kE1aQ0oA9aSuahJGK5rl8h/QEWGwn0BXiReD92Eyldb565s44GqBEgAO3A
 Yq+HcVWK7dI7cojg2O3V2/m3Ibw7Fd5/3kGatEWkNvpfXJYRhy+J4WPSLIWhwbx9RPtK
 2a2H1pjm6IgyDdFdGNSD0vTCpUELwwpOhEtAlNSXQUaC3VGSoE9+BbixItux/WQ3LkuG
 BS1jkPeBsm7hqHDkRWDLahIzDn6AZBuuv7xy3eSkEZHroQy2M64966fKHlnGks6XbgXX
 7Xl5Fvgpy0/KxTGDpT82BgVrsBcUNYULPgQ60v/v0ODaaXDj7+0tj1uTtNY28fCZ8fpX
 36tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MH+M8Bh0CbR9eUgXzdNFfMgvhBhrHXgI9Ctwz+nFHl4=;
 b=2UcYlgKK7eGHSUnBYTruB+lNZYnLQEaU95HiwrOlO+jB4lLy25yhWMjvAY9EeEePs8
 5qMTXVfewoxLbquxMC7GU9abG1abf5C0abm7AQvunUhUrlT8xy8IzjHkjWbD5sxHLwsI
 +rcncStNHo77rtSbdDlL+2WjaMXqLvefO0iHk7kfxHGg0p4pKNnY9ZZYTwEA9H30M033
 PapS37N9FFLxYf3eK4aFBLaOteKAQdBtg4ZXPkp4ZBvzj482KCARJnwUoxEhRnZtsKLE
 lItW93cDA2tk4y+o+9h72C3BC7A/0EdLFdHqQmOWIew3fF1ArKK4+8gJf4xbLXoZUchs
 JHiA==
X-Gm-Message-State: AOAM532V6FUv4MnAJjDjTNoXrr+mGi7nTcAkIKzpZEGjZd1J2ERM8yuN
 IckAz636JG4EaVCd8Ok6AnFOVh/BqvSNk4lrHvk=
X-Google-Smtp-Source: ABdhPJzcQrb4IcuCsuqylhivPFgD1Rnu5eGyEPRCF8lHTe6zgvYpwdxnk2O9+sTEsE4H7LMSg43WcEgPdBFtP6S08Fk=
X-Received: by 2002:a2e:9ec9:0:b0:253:e132:6e3d with SMTP id
 h9-20020a2e9ec9000000b00253e1326e3dmr8027191ljk.345.1653328977307; Mon, 23
 May 2022 11:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
 <20220513180821.905149-6-marcandre.lureau@redhat.com>
 <YouBGRfgzlsGi99n@redhat.com>
 <CAJ+F1CKV0U8g9NCpX6LvE6HTVLdNv-RkHxLeaAU2PjeRKVT6fw@mail.gmail.com>
 <YovKuQ6GZ79Ad9b0@redhat.com>
In-Reply-To: <YovKuQ6GZ79Ad9b0@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 23 May 2022 20:02:45 +0200
Message-ID: <CAJ+F1CK9ta=5XKfuH+ec6EOM3kdFmfzf5QZz=bdSquwQxbKW6g@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] osdep: export qemu_open_cloexec()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000063af1105dfb1a618"
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

--00000000000063af1105dfb1a618
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, May 23, 2022 at 7:56 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Mon, May 23, 2022 at 07:30:42PM +0200, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Mon, May 23, 2022 at 2:43 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> > wrote:
> >
> > > On Fri, May 13, 2022 at 08:08:11PM +0200, marcandre.lureau@redhat.com
> > > wrote:
> > > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > >
> > > > Used in the next patch, to simplify qga code.
> > > >
> > > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > > ---
> > > >  include/qemu/osdep.h |  1 +
> > > >  util/osdep.c         | 10 ++++++++--
> > > >  2 files changed, 9 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > > > index 67cc465416..64f51cfb7a 100644
> > > > --- a/include/qemu/osdep.h
> > > > +++ b/include/qemu/osdep.h
> > > > @@ -489,6 +489,7 @@ void sigaction_invoke(struct sigaction *action,
> > > >   */
> > > >  int qemu_open_old(const char *name, int flags, ...);
> > > >  int qemu_open(const char *name, int flags, Error **errp);
> > > > +int qemu_open_cloexec(const char *name, int flags, mode_t mode,
> Error
> > > **errp);
> > >
> > > I don't think we should be exporting this - it is just a variant of t=
he
> > > 'qemu_open_old' method that we wanted callers to stop using in favour
> > > of explicitly deciding between 'qemu_open' and 'qemu_create'.
> > >
> >
> >
> > qemu_open() has "/dev/fdset" handling, which qemu-ga and other tools
> don't
> > need.
>
> Right, but exporting this as 'qemu_open_cloexec' is going to mislead
> people into thinking it is a better version of 'qemu_open'. This will
> cause us to loose support for /dev/fdset in places where we actually
> need it.
>

> It is pretty harmless to have /dev/fdset there, even if the tool does
> not need it - that's been the case with many QEMU tools for many years.
> If we think it is actually a real problem though, we should just have
> a way to toggle it on/off from the existing APIs.
>
>
It's a bit problematic to make qemu-ga standalone, and have a common shared
subproject/library.

Maybe introduce a callback for QEMU/QMP "/dev/fdset" handling ? any better
idea ?

eg put  'bool allow_fdset =3D true"   in softmmu/vl.c, and
> 'bool allow_fdset =3D false' in stubs/open.c, and then make
> qemu_open_internal conditionalize itself on this global
> variable, so only the system emulators get fdset support
> activated.
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

--=20
Marc-Andr=C3=A9 Lureau

--00000000000063af1105dfb1a618
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 23, 2022 at 7:56 PM Dan=
iel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Mon, May 23, 2022 at 07:30:42PM +0200, Marc-Andr=C3=A9 Lureau wr=
ote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Mon, May 23, 2022 at 2:43 PM Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<=
br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Fri, May 13, 2022 at 08:08:11PM +0200, <a href=3D"mailto:marca=
ndre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a><b=
r>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre=
.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Used in the next patch, to simplify qga code.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:=
marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com<=
/a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 include/qemu/osdep.h |=C2=A0 1 +<br>
&gt; &gt; &gt;=C2=A0 util/osdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++=
+++++--<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 9 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h<br>
&gt; &gt; &gt; index 67cc465416..64f51cfb7a 100644<br>
&gt; &gt; &gt; --- a/include/qemu/osdep.h<br>
&gt; &gt; &gt; +++ b/include/qemu/osdep.h<br>
&gt; &gt; &gt; @@ -489,6 +489,7 @@ void sigaction_invoke(struct sigaction *=
action,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt; &gt;=C2=A0 int qemu_open_old(const char *name, int flags, ...);<b=
r>
&gt; &gt; &gt;=C2=A0 int qemu_open(const char *name, int flags, Error **err=
p);<br>
&gt; &gt; &gt; +int qemu_open_cloexec(const char *name, int flags, mode_t m=
ode, Error<br>
&gt; &gt; **errp);<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t think we should be exporting this - it is just a vari=
ant of the<br>
&gt; &gt; &#39;qemu_open_old&#39; method that we wanted callers to stop usi=
ng in favour<br>
&gt; &gt; of explicitly deciding between &#39;qemu_open&#39; and &#39;qemu_=
create&#39;.<br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; qemu_open() has &quot;/dev/fdset&quot; handling, which qemu-ga and oth=
er tools don&#39;t<br>
&gt; need.<br>
<br>
Right, but exporting this as &#39;qemu_open_cloexec&#39; is going to mislea=
d<br>
people into thinking it is a better version of &#39;qemu_open&#39;. This wi=
ll<br>
cause us to loose support for /dev/fdset in places where we actually<br>
need it. <br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
It is pretty harmless to have /dev/fdset there, even if the tool does<br>
not need it - that&#39;s been the case with many QEMU tools for many years.=
<br>
If we think it is actually a real problem though, we should just have<br>
a way to toggle it on/off from the existing APIs.<br>
<br></blockquote><div><br></div><div>It&#39;s a bit problematic to make qem=
u-ga standalone, and have a common shared subproject/library.</div><div><br=
></div><div>Maybe introduce a callback for QEMU/QMP &quot;/dev/fdset&quot; =
handling ? any better idea ?=C2=A0 <br></div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
eg put=C2=A0 &#39;bool allow_fdset =3D true&quot;=C2=A0 =C2=A0in softmmu/vl=
.c, and<br>
&#39;bool allow_fdset =3D false&#39; in stubs/open.c, and then make<br>
qemu_open_internal conditionalize itself on this global <br>
variable, so only the system emulators get fdset support<br>
activated.<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000063af1105dfb1a618--

