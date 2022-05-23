Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C95B5315A8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 21:13:34 +0200 (CEST)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntDUi-0006P8-UL
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 15:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ntDTP-0005eU-D3
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:12:11 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:33742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ntDTN-0006g5-Fw
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:12:11 -0400
Received: by mail-lf1-x136.google.com with SMTP id bu29so27286355lfb.0
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 12:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XeU9+pXYz4AuuX3eY5r7dRcTrZknepZ/j8arQrqGGvw=;
 b=KbA/jg7jhRzSuXQa1BRwxEQhSRErIqoPwXQKcvnTiT3A1sRQOPMZcmNee3fGPZG1a8
 dGH/fPz2oHgttrKjhm24vMI+KWQ62AYkgZ20p0J6vUaKeoNUgSkrxvALL1RyPu1p5/IP
 iDMHSakLVq1oAoqVEdQtndGXk5/1GJGzcgUq1/Hwqt1s1n/K85itHkAsy9mRrL7Zv0Xt
 lPvQUmMVXfKlBaxdo/lKc5yFw80Blf8KzBSYQ4EGqmYzaCpgwasODYFjP54eYARem+hS
 k6r7kwxlbfLfSN6ybattIWdSY7a3BrRUkyfGRHbo9L3C9dPX/rDgjejQPfUliCBym7TM
 B6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XeU9+pXYz4AuuX3eY5r7dRcTrZknepZ/j8arQrqGGvw=;
 b=u4Sij8zLiRcIW4iWCZhKbU/mht3d+aUupQn7CdcFgT/KxpogHVneFZ3i9iWCLuEpFV
 2EHyTMo1Tt6KHHfyW2T+pumQU0vw3zwCg9dEctmobS+gTjRccSSq/rBKBvQ3rHS6SMuy
 5r6MVLiXofhubHc4xAlP9Uh98Fje/pxOnQUxpZZGY7cZQ1D+TsWaFGycTQUyzuJXnrSt
 uy+ZOiYZg9QxXv17l+uDGSfT7KJiT5LCcmY/143269AS/n0r5M672qfXR3Zr643TAH+A
 Mny8AUeGzgT7695X0x6QFjyjlEVH4HVLFrdS3qPKZPShwNdUsqVHxvmmcSLYjNGopkw1
 JOng==
X-Gm-Message-State: AOAM533TW9SEokhxA1I+/7O/p5482vP/dS/97hMXeherlEwkPn8tl21V
 +ikaxlGKSvU4BHGnDgBvOpd9RgCdxOhGK0GQiws=
X-Google-Smtp-Source: ABdhPJzBZcKzfNP4bseNAX1h6R/eXbR5R5YfeYRxMzATauWqzW+gk7HVCme+whPPax8YNeGUxGnH08ZzxkZbHq6HStU=
X-Received: by 2002:ac2:5cd9:0:b0:478:591d:a404 with SMTP id
 f25-20020ac25cd9000000b00478591da404mr11201421lfq.532.1653333126248; Mon, 23
 May 2022 12:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
 <20220513180821.905149-6-marcandre.lureau@redhat.com>
 <YouBGRfgzlsGi99n@redhat.com>
 <CAJ+F1CKV0U8g9NCpX6LvE6HTVLdNv-RkHxLeaAU2PjeRKVT6fw@mail.gmail.com>
 <YovKuQ6GZ79Ad9b0@redhat.com>
 <CAJ+F1CK9ta=5XKfuH+ec6EOM3kdFmfzf5QZz=bdSquwQxbKW6g@mail.gmail.com>
 <YovOLpiqvMQagD0f@redhat.com>
In-Reply-To: <YovOLpiqvMQagD0f@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 23 May 2022 21:11:54 +0200
Message-ID: <CAJ+F1CJn8DPAUeQPuDP-p6nEwfjQZ5EbSxvZ+0RM=SZECTuRWw@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] osdep: export qemu_open_cloexec()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000af811905dfb29d58"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
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

--000000000000af811905dfb29d58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, May 23, 2022 at 8:11 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Mon, May 23, 2022 at 08:02:45PM +0200, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Mon, May 23, 2022 at 7:56 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> > wrote:
> >
> > > On Mon, May 23, 2022 at 07:30:42PM +0200, Marc-Andr=C3=A9 Lureau wrot=
e:
> > > > Hi
> > > >
> > > > On Mon, May 23, 2022 at 2:43 PM Daniel P. Berrang=C3=A9 <
> berrange@redhat.com>
> > > > wrote:
> > > >
> > > > > On Fri, May 13, 2022 at 08:08:11PM +0200,
> marcandre.lureau@redhat.com
> > > > > wrote:
> > > > > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > > > >
> > > > > > Used in the next patch, to simplify qga code.
> > > > > >
> > > > > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.=
com>
> > > > > > ---
> > > > > >  include/qemu/osdep.h |  1 +
> > > > > >  util/osdep.c         | 10 ++++++++--
> > > > > >  2 files changed, 9 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > > > > > index 67cc465416..64f51cfb7a 100644
> > > > > > --- a/include/qemu/osdep.h
> > > > > > +++ b/include/qemu/osdep.h
> > > > > > @@ -489,6 +489,7 @@ void sigaction_invoke(struct sigaction
> *action,
> > > > > >   */
> > > > > >  int qemu_open_old(const char *name, int flags, ...);
> > > > > >  int qemu_open(const char *name, int flags, Error **errp);
> > > > > > +int qemu_open_cloexec(const char *name, int flags, mode_t mode=
,
> > > Error
> > > > > **errp);
> > > > >
> > > > > I don't think we should be exporting this - it is just a variant
> of the
> > > > > 'qemu_open_old' method that we wanted callers to stop using in
> favour
> > > > > of explicitly deciding between 'qemu_open' and 'qemu_create'.
> > > > >
> > > >
> > > >
> > > > qemu_open() has "/dev/fdset" handling, which qemu-ga and other tool=
s
> > > don't
> > > > need.
> > >
> > > Right, but exporting this as 'qemu_open_cloexec' is going to mislead
> > > people into thinking it is a better version of 'qemu_open'. This will
> > > cause us to loose support for /dev/fdset in places where we actually
> > > need it.
> > >
> >
> > > It is pretty harmless to have /dev/fdset there, even if the tool does
> > > not need it - that's been the case with many QEMU tools for many year=
s.
> > > If we think it is actually a real problem though, we should just have
> > > a way to toggle it on/off from the existing APIs.
> > >
> > >
> > It's a bit problematic to make qemu-ga standalone, and have a common
> shared
> > subproject/library.
> >
> > Maybe introduce a callback for QEMU/QMP "/dev/fdset" handling ? any
> better
> > idea ?
>
> If we want to make qemu-ga standalone, then IMHO we should be
> aggressively switching it to use as many GLib APIs as possible,
> eliminating its reliance on any of QEMU's home-grown portability
> functions. All the 'FILE *' / 'open' scenarios could be replaced
> with GIO's GFile/GInputStream/GOutputStream for example.
>

I am not too eager to do that kind of refactoring. Even rewriting in Rust
seems a bit pointless to me, even if I would have more motivation.

Also there are times you do open() for things that are not stream-related.
And glib sadly doesn't really offer a solution for open(CLOEXEC).

I guess I can simply add an open_cloexec() helper function in qemu-ga alone
for now.

--000000000000af811905dfb29d58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 23, 2022 at 8:11 PM Dan=
iel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Mon, May 23, 2022 at 08:02:45PM +0200, Marc-Andr=C3=A9 Lureau wr=
ote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Mon, May 23, 2022 at 7:56 PM Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<=
br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Mon, May 23, 2022 at 07:30:42PM +0200, Marc-Andr=C3=A9 Lureau =
wrote:<br>
&gt; &gt; &gt; Hi<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, May 23, 2022 at 2:43 PM Daniel P. Berrang=C3=A9 &lt;=
<a href=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.co=
m</a>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Fri, May 13, 2022 at 08:08:11PM +0200, <a href=3D"ma=
ilto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat=
.com</a><br>
&gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto=
:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com=
</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Used in the next patch, to simplify qga code.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=
=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@=
redhat.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 include/qemu/osdep.h |=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 util/osdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 10 ++++++++--<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 2 files changed, 9 insertions(+), 2 deletion=
s(-)<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/include/qemu/osdep.h b/include/qemu/o=
sdep.h<br>
&gt; &gt; &gt; &gt; &gt; index 67cc465416..64f51cfb7a 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/include/qemu/osdep.h<br>
&gt; &gt; &gt; &gt; &gt; +++ b/include/qemu/osdep.h<br>
&gt; &gt; &gt; &gt; &gt; @@ -489,6 +489,7 @@ void sigaction_invoke(struct s=
igaction *action,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 int qemu_open_old(const char *name, int flag=
s, ...);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 int qemu_open(const char *name, int flags, E=
rror **errp);<br>
&gt; &gt; &gt; &gt; &gt; +int qemu_open_cloexec(const char *name, int flags=
, mode_t mode,<br>
&gt; &gt; Error<br>
&gt; &gt; &gt; &gt; **errp);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I don&#39;t think we should be exporting this - it is j=
ust a variant of the<br>
&gt; &gt; &gt; &gt; &#39;qemu_open_old&#39; method that we wanted callers t=
o stop using in favour<br>
&gt; &gt; &gt; &gt; of explicitly deciding between &#39;qemu_open&#39; and =
&#39;qemu_create&#39;.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; qemu_open() has &quot;/dev/fdset&quot; handling, which qemu-=
ga and other tools<br>
&gt; &gt; don&#39;t<br>
&gt; &gt; &gt; need.<br>
&gt; &gt;<br>
&gt; &gt; Right, but exporting this as &#39;qemu_open_cloexec&#39; is going=
 to mislead<br>
&gt; &gt; people into thinking it is a better version of &#39;qemu_open&#39=
;. This will<br>
&gt; &gt; cause us to loose support for /dev/fdset in places where we actua=
lly<br>
&gt; &gt; need it.<br>
&gt; &gt;<br>
&gt; <br>
&gt; &gt; It is pretty harmless to have /dev/fdset there, even if the tool =
does<br>
&gt; &gt; not need it - that&#39;s been the case with many QEMU tools for m=
any years.<br>
&gt; &gt; If we think it is actually a real problem though, we should just =
have<br>
&gt; &gt; a way to toggle it on/off from the existing APIs.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; It&#39;s a bit problematic to make qemu-ga standalone, and have a comm=
on shared<br>
&gt; subproject/library.<br>
&gt; <br>
&gt; Maybe introduce a callback for QEMU/QMP &quot;/dev/fdset&quot; handlin=
g ? any better<br>
&gt; idea ?<br>
<br>
If we want to make qemu-ga standalone, then IMHO we should be<br>
aggressively switching it to use as many GLib APIs as possible,<br>
eliminating its reliance on any of QEMU&#39;s home-grown portability<br>
functions. All the &#39;FILE *&#39; / &#39;open&#39; scenarios could be rep=
laced<br>
with GIO&#39;s GFile/GInputStream/GOutputStream for example.<br></blockquot=
e><div><br></div><div>I am not too eager to do that kind of refactoring. Ev=
en rewriting in Rust seems a bit pointless to me, even if I would have more=
 motivation.</div><div><br></div><div>Also there are times you do open() fo=
r things that are not stream-related.=C2=A0 And glib sadly doesn&#39;t real=
ly offer a solution for open(CLOEXEC).</div><div><br></div><div>I guess I c=
an simply add an open_cloexec() helper function in qemu-ga alone for now.<b=
r></div></div></div>

--000000000000af811905dfb29d58--

