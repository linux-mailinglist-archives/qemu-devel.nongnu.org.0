Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433AD56A9BF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 19:37:26 +0200 (CEST)
Received: from localhost ([::1]:33890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9VRM-00020R-Uy
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 13:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o9VPN-0000Xd-8U; Thu, 07 Jul 2022 13:35:21 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:37726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o9VPL-00023J-Am; Thu, 07 Jul 2022 13:35:20 -0400
Received: by mail-lf1-x132.google.com with SMTP id t24so32368810lfr.4;
 Thu, 07 Jul 2022 10:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Ybq1OU6D6bKrZ6zyzdlzXYcLvMWgv8O4NaBiObZZWA=;
 b=ot1L+v2nzSf6RgoGH5HN1zXgRiPe3nIYQRmEIsCn+iw4MdSsZthlkUwMZC9Qd/tF0b
 x1HcHLutWv5zywbelh89u0pzaWzoPk2uv0i7bVQqgwNe1XApoaNsBeqsr3kSgkIAgWk4
 ZyXlYlC2T8F1RhFoBXJpB1592jRD1KXhGJGXoTVjJWpQhjK+k+Zl4hAoMZYTo3Qrjs7m
 MVcbnN7ZVUGhsLLiCIhAwfzNzUtx3ZavLl/mRHMxlyO5rFYyUUqCLHBoJ0d5oSN5gMw5
 XILXrlTwRNKSJ1q4qoTdMd5+0jCTYnz9rJyCqwqZ9LaawcnshP+GmMp6x9iddWk4vC9f
 8hSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Ybq1OU6D6bKrZ6zyzdlzXYcLvMWgv8O4NaBiObZZWA=;
 b=tAIluOd18gVWSP6q70uEHkWjGYt7ovqExxZkbJ86psHlrYn5+weLvpAnKVc4KMkrlJ
 iBLf6JE6k7gWR45M900nfEErrg7Sw5wLU6eAB2M6C+sbJm4/XgJM+TDFg+Z+oU+rQbVC
 CqvvqACa4wKe8DyUBAK1F+t6SU+V9cdWqrBkqbO8bv1T+gWWJlARWM3eO9D0OSSCkwSc
 buSQz4suKkKG95o9p7UWGxYWXPAqy9ZFL301Fog/9d4RtPcDiccZoO9SS9LD3qJ5nuOG
 8TmSQXiFcePUQ9myCwo+hFoEu99X7bPJPslmd0HiYbw40j0VJdnqkd1jG2uxa7jsQb5U
 WOjA==
X-Gm-Message-State: AJIora9XZ/KKZN5TkkUHVs6UoUcPsbXxRrXTdOa79vPGZwWPE85WhrMg
 QyHnvfHQ6trraysgH3Mgaj8I8VjTRS0/MB0T1SM=
X-Google-Smtp-Source: AGRyM1tNB5BHC2Z0dFu7mEajXvYTEWR/Ps29ysQMOb1itZxXwj3A2a7UobxqFG+o6Z+kMPOVILyhuREE6CgLz7WtY9s=
X-Received: by 2002:a05:6512:3da8:b0:47f:616d:e54c with SMTP id
 k40-20020a0565123da800b0047f616de54cmr32960291lfv.218.1657215316601; Thu, 07
 Jul 2022 10:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-2-marcandre.lureau@redhat.com>
 <87edyxdscx.fsf@pond.sub.org>
In-Reply-To: <87edyxdscx.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 7 Jul 2022 21:35:05 +0400
Message-ID: <CAJ+F1CLtkoHZWwyBDJH6ZNek=McM3k8OQhKsVfcidXvRToqY3Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] monitor: make error_vprintf_unless_qmp() static
To: Markus Armbruster <armbru@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>, 
 Kyle Evans <kevans@freebsd.org>, Hanna Reitz <hreitz@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fam Zheng <fam@euphon.net>, 
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000043301405e33a8213"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x132.google.com
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

--00000000000043301405e33a8213
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jul 7, 2022 at 4:25 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Not needed outside monitor.c. Remove the needless stub.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/monitor/monitor.h | 1 -
> >  monitor/monitor.c         | 3 ++-
> >  stubs/error-printf.c      | 5 -----
> >  3 files changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> > index a4b40e8391db..44653e195b45 100644
> > --- a/include/monitor/monitor.h
> > +++ b/include/monitor/monitor.h
> > @@ -56,7 +56,6 @@ void monitor_register_hmp(const char *name, bool info=
,
> >  void monitor_register_hmp_info_hrt(const char *name,
> >                                     HumanReadableText *(*handler)(Error
> **errp));
> >
> > -int error_vprintf_unless_qmp(const char *fmt, va_list ap)
> G_GNUC_PRINTF(1, 0);
> >  int error_printf_unless_qmp(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
> >
> >  #endif /* MONITOR_H */
> > diff --git a/monitor/monitor.c b/monitor/monitor.c
> > index 86949024f643..ba4c1716a48a 100644
> > --- a/monitor/monitor.c
> > +++ b/monitor/monitor.c
> > @@ -273,7 +273,8 @@ int error_vprintf(const char *fmt, va_list ap)
> >      return vfprintf(stderr, fmt, ap);
> >  }
> >
> > -int error_vprintf_unless_qmp(const char *fmt, va_list ap)
> > +G_GNUC_PRINTF(1, 0)
> > +static int error_vprintf_unless_qmp(const char *fmt, va_list ap)
> >  {
> >      Monitor *cur_mon =3D monitor_cur();
> >
> > diff --git a/stubs/error-printf.c b/stubs/error-printf.c
> > index 0e326d801059..1afa0f62ca26 100644
> > --- a/stubs/error-printf.c
> > +++ b/stubs/error-printf.c
> > @@ -16,8 +16,3 @@ int error_vprintf(const char *fmt, va_list ap)
> >      }
> >      return vfprintf(stderr, fmt, ap);
> >  }
> > -
> > -int error_vprintf_unless_qmp(const char *fmt, va_list ap)
> > -{
> > -    return error_vprintf(fmt, ap);
> > -}
>
> When I write a printf-like utility function, I habitually throw in a
> vprintf-like function.
>
> Any particular reason for hiding this one?  To avoid misunderstandings:
> I'm fine with hiding it if it's causing you trouble.
>

I don't think I had an issue with it, only that I wrote tests for the
error-report.h API, and didn't see the need to cover a function that isn't
used outside the unit.


>
> Except I think we'd better delete than hide then: inline into
> error_printf_unless_qmp().  Makes sense?
>

It can't be easily inlined because of the surrounding va_start/va_end


--=20
Marc-Andr=C3=A9 Lureau

--00000000000043301405e33a8213
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jul 7, 2022 at 4:25 PM Markus Armbrus=
ter &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a href=3D"ma=
ilto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat=
.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Not needed outside monitor.c. Remove the needless stub.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 include/monitor/monitor.h | 1 -<br>
&gt;=C2=A0 monitor/monitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
&gt;=C2=A0 stubs/error-printf.c=C2=A0 =C2=A0 =C2=A0 | 5 -----<br>
&gt;=C2=A0 3 files changed, 2 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h<br>
&gt; index a4b40e8391db..44653e195b45 100644<br>
&gt; --- a/include/monitor/monitor.h<br>
&gt; +++ b/include/monitor/monitor.h<br>
&gt; @@ -56,7 +56,6 @@ void monitor_register_hmp(const char *name, bool inf=
o,<br>
&gt;=C2=A0 void monitor_register_hmp_info_hrt(const char *name,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HumanReadable=
Text *(*handler)(Error **errp));<br>
&gt;=C2=A0 <br>
&gt; -int error_vprintf_unless_qmp(const char *fmt, va_list ap) G_GNUC_PRIN=
TF(1, 0);<br>
&gt;=C2=A0 int error_printf_unless_qmp(const char *fmt, ...) G_GNUC_PRINTF(=
1, 2);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #endif /* MONITOR_H */<br>
&gt; diff --git a/monitor/monitor.c b/monitor/monitor.c<br>
&gt; index 86949024f643..ba4c1716a48a 100644<br>
&gt; --- a/monitor/monitor.c<br>
&gt; +++ b/monitor/monitor.c<br>
&gt; @@ -273,7 +273,8 @@ int error_vprintf(const char *fmt, va_list ap)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return vfprintf(stderr, fmt, ap);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -int error_vprintf_unless_qmp(const char *fmt, va_list ap)<br>
&gt; +G_GNUC_PRINTF(1, 0)<br>
&gt; +static int error_vprintf_unless_qmp(const char *fmt, va_list ap)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Monitor *cur_mon =3D monitor_cur();<br>
&gt;=C2=A0 <br>
&gt; diff --git a/stubs/error-printf.c b/stubs/error-printf.c<br>
&gt; index 0e326d801059..1afa0f62ca26 100644<br>
&gt; --- a/stubs/error-printf.c<br>
&gt; +++ b/stubs/error-printf.c<br>
&gt; @@ -16,8 +16,3 @@ int error_vprintf(const char *fmt, va_list ap)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return vfprintf(stderr, fmt, ap);<br>
&gt;=C2=A0 }<br>
&gt; -<br>
&gt; -int error_vprintf_unless_qmp(const char *fmt, va_list ap)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 return error_vprintf(fmt, ap);<br>
&gt; -}<br>
<br>
When I write a printf-like utility function, I habitually throw in a<br>
vprintf-like function.<br>
<br>
Any particular reason for hiding this one?=C2=A0 To avoid misunderstandings=
:<br>
I&#39;m fine with hiding it if it&#39;s causing you trouble.<br></blockquot=
e><div><br></div><div>I don&#39;t think I had an issue with it, only that I=
 wrote tests for the error-report.h API, and didn&#39;t see the need to cov=
er a function that isn&#39;t used outside the unit.</div><div>=C2=A0<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Except I think we&#39;d better delete than hide then: inline into<br>
error_printf_unless_qmp().=C2=A0 Makes sense?<br></blockquote><div><br></di=
v><div>It can&#39;t be easily inlined because of the surrounding va_start/v=
a_end<br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000043301405e33a8213--

