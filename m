Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BBE56BB81
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 16:12:28 +0200 (CEST)
Received: from localhost ([::1]:39792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9oiZ-0007Bo-5z
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 10:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o9oh0-0005dV-VV; Fri, 08 Jul 2022 10:10:51 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:33598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o9ogz-0007YP-2W; Fri, 08 Jul 2022 10:10:50 -0400
Received: by mail-lf1-x132.google.com with SMTP id bu42so16699056lfb.0;
 Fri, 08 Jul 2022 07:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BuTn/2CXhDMRRhsGxOqXCvTdzHIE+jTlXS114iOSRn0=;
 b=BQFz7Jkcpe4BsLtXtV/cmUkE9a/O1R2n6dkdueqjh5hPVVrvgVn+6RAXQC+ytLM/MM
 PxBlpPzLfWHU7cdoC7R75qQTtfJLW5SnOj0Q0j2+1RFnwMQGsxjsatl0d6URSs/5Ehdt
 JH1Tj0g/uN6phHAxFphgvYQbrvt0PozCHwnrY5iKqe9y/9qN65DV7QmX8PkDZP5mjWHc
 lphN8OGIpmksCt2CRBSWv1yAbB1eQMWRGUlL1mgDbN8eeTBWLOVZ27ERL4O3EwDD1GHK
 WdoJrACVfZObDNlhB/43dioUKdGg2+zx1slRC02T95cuhPoYryFWCyVtUDo3H6iFDlkW
 NwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BuTn/2CXhDMRRhsGxOqXCvTdzHIE+jTlXS114iOSRn0=;
 b=T7jTEqZNIEz8b3/3awGB+1c8VYc3OOTwyMpcylzxBfms0ox4lPx+S+EjW5G5PuDEzc
 /YdEuPZBSCMsDRVvGDueZbg+792Fk0kMmhKdh0kxFNIOlyy/XNqfAapqo4h8nXGuhloK
 2hWNF7mCRaBXLFDibHWB9pkvVynTni1mrbF5q7rfyY+Sp2eDlpuVbZoKgkUykr+e8kFg
 wD+5YASpOOy2SAwUtNw4QXbXRRCmitZOkQWHYdO2UnggTeG7Cxxb41/DMlX66FAcx8mP
 INYXqYKxT0APdv8gkU0Xg/SE8QCBbhYKHZgioA2RKoZ6rLVEa9KUAwI11aisDOLPZNDf
 1v0w==
X-Gm-Message-State: AJIora8L20XZgzlC+glE9HTaILJqSJ37E5mHsuQNYWnSQPAICN7XEuQf
 E4lxd0w5nVesNtQdP9Em4UlJOJU5PW8hgvayDJs=
X-Google-Smtp-Source: AGRyM1vcTKJZn2dbK2O4jv4vZRm2lQx1bWvTEvc5x9+Kwd4Gx4HCbFHKrIyEKyMAbAnYq8RJMTRGrTEyIuB8Di4l0kU=
X-Received: by 2002:a05:6512:3f27:b0:47f:77d9:f23b with SMTP id
 y39-20020a0565123f2700b0047f77d9f23bmr2454078lfa.94.1657289445039; Fri, 08
 Jul 2022 07:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-2-marcandre.lureau@redhat.com>
 <87edyxdscx.fsf@pond.sub.org>
 <CAJ+F1CLtkoHZWwyBDJH6ZNek=McM3k8OQhKsVfcidXvRToqY3Q@mail.gmail.com>
 <87fsjb6749.fsf@pond.sub.org>
In-Reply-To: <87fsjb6749.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Jul 2022 18:10:33 +0400
Message-ID: <CAJ+F1CLOw-Vq+p72hRRY+hWRUupN-tPXHwyqutuFGhfQXw=wzw@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000a960e705e34bc4bd"
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

--000000000000a960e705e34bc4bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Jul 8, 2022 at 5:56 PM Markus Armbruster <armbru@redhat.com> wrote:

> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>
> > Hi
> >
> > On Thu, Jul 7, 2022 at 4:25 PM Markus Armbruster <armbru@redhat.com>
> wrote:
> >
> >> marcandre.lureau@redhat.com writes:
> >>
> >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> >
> >> > Not needed outside monitor.c. Remove the needless stub.
> >> >
> >> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> > ---
> >> >  include/monitor/monitor.h | 1 -
> >> >  monitor/monitor.c         | 3 ++-
> >> >  stubs/error-printf.c      | 5 -----
> >> >  3 files changed, 2 insertions(+), 7 deletions(-)
> >> >
> >> > diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> >> > index a4b40e8391db..44653e195b45 100644
> >> > --- a/include/monitor/monitor.h
> >> > +++ b/include/monitor/monitor.h
> >> > @@ -56,7 +56,6 @@ void monitor_register_hmp(const char *name, bool
> info,
> >> >  void monitor_register_hmp_info_hrt(const char *name,
> >> >                                     HumanReadableText
> *(*handler)(Error **errp));
> >> >
> >> > -int error_vprintf_unless_qmp(const char *fmt, va_list ap)
> G_GNUC_PRINTF(1, 0);
> >> >  int error_printf_unless_qmp(const char *fmt, ...) G_GNUC_PRINTF(1,
> 2);
> >> >
> >> >  #endif /* MONITOR_H */
> >> > diff --git a/monitor/monitor.c b/monitor/monitor.c
> >> > index 86949024f643..ba4c1716a48a 100644
> >> > --- a/monitor/monitor.c
> >> > +++ b/monitor/monitor.c
> >> > @@ -273,7 +273,8 @@ int error_vprintf(const char *fmt, va_list ap)
> >> >      return vfprintf(stderr, fmt, ap);
> >> >  }
> >> >
> >> > -int error_vprintf_unless_qmp(const char *fmt, va_list ap)
> >> > +G_GNUC_PRINTF(1, 0)
> >> > +static int error_vprintf_unless_qmp(const char *fmt, va_list ap)
> >> >  {
> >> >      Monitor *cur_mon =3D monitor_cur();
> >> >
> >> > diff --git a/stubs/error-printf.c b/stubs/error-printf.c
> >> > index 0e326d801059..1afa0f62ca26 100644
> >> > --- a/stubs/error-printf.c
> >> > +++ b/stubs/error-printf.c
> >> > @@ -16,8 +16,3 @@ int error_vprintf(const char *fmt, va_list ap)
> >> >      }
> >> >      return vfprintf(stderr, fmt, ap);
> >> >  }
> >> > -
> >> > -int error_vprintf_unless_qmp(const char *fmt, va_list ap)
> >> > -{
> >> > -    return error_vprintf(fmt, ap);
> >> > -}
> >>
> >> When I write a printf-like utility function, I habitually throw in a
> >> vprintf-like function.
> >>
> >> Any particular reason for hiding this one?  To avoid misunderstandings=
:
> >> I'm fine with hiding it if it's causing you trouble.
> >
> > I don't think I had an issue with it, only that I wrote tests for the
> > error-report.h API, and didn't see the need to cover a function that
> isn't
> > used outside the unit.
>
> I'd keep it and not worry about missing tests; the tests of
> error_printf_unless_qmp() exercise it fine.
>

ok


>
> >> Except I think we'd better delete than hide then: inline into
> >> error_printf_unless_qmp().  Makes sense?
> >
> > It can't be easily inlined because of the surrounding va_start/va_end
>
> Easily enough, I think:
>

ah yes indeed! :)


>
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index 86949024f6..201a672ac6 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -273,27 +273,22 @@ int error_vprintf(const char *fmt, va_list ap)
>      return vfprintf(stderr, fmt, ap);
>  }
>
> -int error_vprintf_unless_qmp(const char *fmt, va_list ap)
> -{
> -    Monitor *cur_mon =3D monitor_cur();
> -
> -    if (!cur_mon) {
> -        return vfprintf(stderr, fmt, ap);
> -    }
> -    if (!monitor_cur_is_qmp()) {
> -        return monitor_vprintf(cur_mon, fmt, ap);
> -    }
> -    return -1;
> -}
> -
>  int error_printf_unless_qmp(const char *fmt, ...)
>  {
> +    Monitor *cur_mon =3D monitor_cur();
>      va_list ap;
>      int ret;
>
>      va_start(ap, fmt);
> -    ret =3D error_vprintf_unless_qmp(fmt, ap);
> +    if (!cur_mon) {
> +        ret =3D vfprintf(stderr, fmt, ap);
> +    } else if (!monitor_cur_is_qmp()) {
> +        ret =3D monitor_vprintf(cur_mon, fmt, ap);
> +    } else {
> +        ret =3D -1;
> +    }
>      va_end(ap);
> +
>      return ret;
>  }
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a960e705e34bc4bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 8, 2022 at 5:56 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Mar=
c-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" targe=
t=3D"_blank">marcandre.lureau@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hi<br>
&gt;<br>
&gt; On Thu, Jul 7, 2022 at 4:25 PM Markus Armbruster &lt;<a href=3D"mailto=
:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">m=
arcandre.lureau@redhat.com</a> writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Not needed outside monitor.c. Remove the needless stub.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:m=
arcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</=
a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 include/monitor/monitor.h | 1 -<br>
&gt;&gt; &gt;=C2=A0 monitor/monitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 =
++-<br>
&gt;&gt; &gt;=C2=A0 stubs/error-printf.c=C2=A0 =C2=A0 =C2=A0 | 5 -----<br>
&gt;&gt; &gt;=C2=A0 3 files changed, 2 insertions(+), 7 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/include/monitor/monitor.h b/include/monitor/moni=
tor.h<br>
&gt;&gt; &gt; index a4b40e8391db..44653e195b45 100644<br>
&gt;&gt; &gt; --- a/include/monitor/monitor.h<br>
&gt;&gt; &gt; +++ b/include/monitor/monitor.h<br>
&gt;&gt; &gt; @@ -56,7 +56,6 @@ void monitor_register_hmp(const char *name,=
 bool info,<br>
&gt;&gt; &gt;=C2=A0 void monitor_register_hmp_info_hrt(const char *name,<br=
>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Human=
ReadableText *(*handler)(Error **errp));<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -int error_vprintf_unless_qmp(const char *fmt, va_list ap) G_=
GNUC_PRINTF(1, 0);<br>
&gt;&gt; &gt;=C2=A0 int error_printf_unless_qmp(const char *fmt, ...) G_GNU=
C_PRINTF(1, 2);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 #endif /* MONITOR_H */<br>
&gt;&gt; &gt; diff --git a/monitor/monitor.c b/monitor/monitor.c<br>
&gt;&gt; &gt; index 86949024f643..ba4c1716a48a 100644<br>
&gt;&gt; &gt; --- a/monitor/monitor.c<br>
&gt;&gt; &gt; +++ b/monitor/monitor.c<br>
&gt;&gt; &gt; @@ -273,7 +273,8 @@ int error_vprintf(const char *fmt, va_lis=
t ap)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return vfprintf(stderr, fmt, ap);<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -int error_vprintf_unless_qmp(const char *fmt, va_list ap)<br=
>
&gt;&gt; &gt; +G_GNUC_PRINTF(1, 0)<br>
&gt;&gt; &gt; +static int error_vprintf_unless_qmp(const char *fmt, va_list=
 ap)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Monitor *cur_mon =3D monitor_cur();<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/stubs/error-printf.c b/stubs/error-printf.c<br>
&gt;&gt; &gt; index 0e326d801059..1afa0f62ca26 100644<br>
&gt;&gt; &gt; --- a/stubs/error-printf.c<br>
&gt;&gt; &gt; +++ b/stubs/error-printf.c<br>
&gt;&gt; &gt; @@ -16,8 +16,3 @@ int error_vprintf(const char *fmt, va_list =
ap)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return vfprintf(stderr, fmt, ap);<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -int error_vprintf_unless_qmp(const char *fmt, va_list ap)<br=
>
&gt;&gt; &gt; -{<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 return error_vprintf(fmt, ap);<br>
&gt;&gt; &gt; -}<br>
&gt;&gt;<br>
&gt;&gt; When I write a printf-like utility function, I habitually throw in=
 a<br>
&gt;&gt; vprintf-like function.<br>
&gt;&gt;<br>
&gt;&gt; Any particular reason for hiding this one?=C2=A0 To avoid misunder=
standings:<br>
&gt;&gt; I&#39;m fine with hiding it if it&#39;s causing you trouble.<br>
&gt;<br>
&gt; I don&#39;t think I had an issue with it, only that I wrote tests for =
the<br>
&gt; error-report.h API, and didn&#39;t see the need to cover a function th=
at isn&#39;t<br>
&gt; used outside the unit.<br>
<br>
I&#39;d keep it and not worry about missing tests; the tests of<br>
error_printf_unless_qmp() exercise it fine.<br></blockquote><div><br></div>=
<div>ok</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt;&gt; Except I think we&#39;d better delete than hide then: inline into<=
br>
&gt;&gt; error_printf_unless_qmp().=C2=A0 Makes sense?<br>
&gt;<br>
&gt; It can&#39;t be easily inlined because of the surrounding va_start/va_=
end<br>
<br>
Easily enough, I think:<br></blockquote><div><br></div><div>ah yes indeed! =
:)</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
diff --git a/monitor/monitor.c b/monitor/monitor.c<br>
index 86949024f6..201a672ac6 100644<br>
--- a/monitor/monitor.c<br>
+++ b/monitor/monitor.c<br>
@@ -273,27 +273,22 @@ int error_vprintf(const char *fmt, va_list ap)<br>
=C2=A0 =C2=A0 =C2=A0return vfprintf(stderr, fmt, ap);<br>
=C2=A0}<br>
<br>
-int error_vprintf_unless_qmp(const char *fmt, va_list ap)<br>
-{<br>
-=C2=A0 =C2=A0 Monitor *cur_mon =3D monitor_cur();<br>
-<br>
-=C2=A0 =C2=A0 if (!cur_mon) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return vfprintf(stderr, fmt, ap);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (!monitor_cur_is_qmp()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return monitor_vprintf(cur_mon, fmt, ap);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return -1;<br>
-}<br>
-<br>
=C2=A0int error_printf_unless_qmp(const char *fmt, ...)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 Monitor *cur_mon =3D monitor_cur();<br>
=C2=A0 =C2=A0 =C2=A0va_list ap;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0va_start(ap, fmt);<br>
-=C2=A0 =C2=A0 ret =3D error_vprintf_unless_qmp(fmt, ap);<br>
+=C2=A0 =C2=A0 if (!cur_mon) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D vfprintf(stderr, fmt, ap);<br>
+=C2=A0 =C2=A0 } else if (!monitor_cur_is_qmp()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D monitor_vprintf(cur_mon, fmt, ap);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -1;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0va_end(ap);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a960e705e34bc4bd--

