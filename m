Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A04E4F7DE7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 13:22:13 +0200 (CEST)
Received: from localhost ([::1]:38516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncQDL-0001ry-Jf
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 07:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ncQB4-00013M-Il
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 07:19:50 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ncQB2-0002K5-Qi
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 07:19:50 -0400
Received: by mail-wm1-x329.google.com with SMTP id r64so3294999wmr.4
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 04:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=67+z+D9ryalJ10Z55qagjozorBQEXake7yUTIn2EtaU=;
 b=PehIMvIIVXVhaummo8+dyErhahNmlhTf9zn/mR/4vhTurktaulQmpKHqtiuSRa8eIQ
 +lffHI3WeULFuUUjaVgzBRVfAIW7BaOyiVKVB0tF4avSh3QTtk++aC3/rI3O5bgqsFe4
 fjCyQmykfZ8qMsCR5pv4u2RiFwW2OiBJmEaq5ZO7VKs9mXEPj7SszbASGl73U3SRqV2z
 fMVOEEcwiWPV4Li+db8yg11nO1t4lzZJzWcbOr0XTmKF2lBdMFjpoqyB2+WJ63k7qhYA
 NcUVqnNnLjOrfl88AvRFBzuD7UWpwIR+IUR0BhYc01147QGjKLUgPIZjnVSBNgG8flIo
 Z9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=67+z+D9ryalJ10Z55qagjozorBQEXake7yUTIn2EtaU=;
 b=vv4305lGVBkT10uSqTu3tXIK2CThI8G+DU/RvvLBOwY5j57QdTuTEZmyJDSAal3Cnr
 WBaVBK+LEeA0BqVQsyC/OkwMZw9jOdhVEeFpjnnYufIhtNpdrW8j12EO2mn8g4VucR9L
 typrCArOtU14jsO6w/NV/3PytQbYZkTdesnajridp2n90u8wQpvkxKV2Nzx/0Ysa2fUT
 LYmpZ69TZURcTVG93zq0tXurkCH7d+a3AdjbcggHzm6WDnkLEoWJQNcXBMuo2+WyrYew
 HuWlI2UlsIMeNB0Ay4Rxauq8ROgyB7S6uvi4elLlMEeBP06kQ+3dhLntwb1//Lj4lUeB
 CgIA==
X-Gm-Message-State: AOAM5337knWKXSJXjhxKyoSHuswJRmveuUdDyt7dfEhviOWLbpe2EIJl
 mxWj6RExKUlNwqUVjvMrQ2CYCtaONEnoBP8pAEg=
X-Google-Smtp-Source: ABdhPJxVBIje5JxoPeZXn08xbxv70BlQZX94nMs5h8EzdbWGUlHlAzKVL1+e5N7y1fB1z8oTz4hKNDt/Pwf1w8lU9Sw=
X-Received: by 2002:a7b:c7c3:0:b0:389:cbf1:fadf with SMTP id
 z3-20020a7bc7c3000000b00389cbf1fadfmr12060297wmk.147.1649330387043; Thu, 07
 Apr 2022 04:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-13-marcandre.lureau@redhat.com>
 <878rshla33.fsf@pond.sub.org>
In-Reply-To: <878rshla33.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 7 Apr 2022 15:19:35 +0400
Message-ID: <CAJ+F1CJHffP=Qa=7_=V37gaTnfw4S22h=Rkjmt9gLL5siVFDmA@mail.gmail.com>
Subject: Re: [PATCH 12/32] qga: replace deprecated g_get_current_time()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d646ed05dc0ea773"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: Michael Roth <michael.roth@amd.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d646ed05dc0ea773
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Apr 7, 2022 at 9:54 AM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > According to GLib API:
> > g_get_current_time has been deprecated since version 2.62 and should no=
t
> > be used in newly-written code. GTimeVal is not year-2038-safe. Use
> > g_get_real_time() instead.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  qga/main.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/qga/main.c b/qga/main.c
> > index b9dd19918e47..1deb0ee2fbfe 100644
> > --- a/qga/main.c
> > +++ b/qga/main.c
> > @@ -314,7 +314,6 @@ static void ga_log(const gchar *domain,
> GLogLevelFlags level,
> >                     const gchar *msg, gpointer opaque)
> >  {
> >      GAState *s =3D opaque;
> > -    GTimeVal time;
> >      const char *level_str =3D ga_log_level_str(level);
> >
> >      if (!ga_logging_enabled(s)) {
> > @@ -329,9 +328,11 @@ static void ga_log(const gchar *domain,
> GLogLevelFlags level,
> >  #else
> >      if (level & s->log_level) {
> >  #endif
> > -        g_get_current_time(&time);
> > +        gint64 t =3D g_get_real_time();
> >          fprintf(s->log_file,
> > -                "%lu.%lu: %s: %s\n", time.tv_sec, time.tv_usec,
> level_str, msg);
>
> The old code is kind of wrong.  Say it's 1649309843.000001 seconds past
> the epoch.  Prints "1649309843.1".  9us later, it prints
> "1649309843.10".  Should really use %06lu for the microseconds part.
>

good idea


> Whether you want to fix this in this patch, or just note it for later in
> the commit message, or ignore it alltogether is up to you.
>
> > +                "%" G_GINT64_FORMAT ".%" G_GINT64_FORMAT
>
> This gives me flashbacks to the 90s.  Please use PRId64 like we do
> everywhere else.
>
> I'd ditch gint64_t for int64_t, too.
>

ack, ack


>
> > +                ": %s: %s\n", t / G_USEC_PER_SEC, t % G_USEC_PER_SEC,
> > +                level_str, msg);
> >          fflush(s->log_file);
> >      }
> >  }
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d646ed05dc0ea773
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 7, 2022 at 9:54 AM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a =
href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lur=
eau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; According to GLib API:<br>
&gt; g_get_current_time has been deprecated since version 2.62 and should n=
ot<br>
&gt; be used in newly-written code. GTimeVal is not year-2038-safe. Use<br>
&gt; g_get_real_time() instead.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 qga/main.c | 7 ++++---<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/qga/main.c b/qga/main.c<br>
&gt; index b9dd19918e47..1deb0ee2fbfe 100644<br>
&gt; --- a/qga/main.c<br>
&gt; +++ b/qga/main.c<br>
&gt; @@ -314,7 +314,6 @@ static void ga_log(const gchar *domain, GLogLevelF=
lags level,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0const gchar *msg, gpointer opaque)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 GAState *s =3D opaque;<br>
&gt; -=C2=A0 =C2=A0 GTimeVal time;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const char *level_str =3D ga_log_level_str(level);=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!ga_logging_enabled(s)) {<br>
&gt; @@ -329,9 +328,11 @@ static void ga_log(const gchar *domain, GLogLevel=
Flags level,<br>
&gt;=C2=A0 #else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (level &amp; s-&gt;log_level) {<br>
&gt;=C2=A0 #endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_get_current_time(&amp;time);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gint64 t =3D g_get_real_time();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(s-&gt;log_file,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%lu.%lu=
: %s: %s\n&quot;, time.tv_sec, time.tv_usec, level_str, msg);<br>
<br>
The old code is kind of wrong.=C2=A0 Say it&#39;s 1649309843.000001 seconds=
 past<br>
the epoch.=C2=A0 Prints &quot;1649309843.1&quot;.=C2=A0 9us later, it print=
s<br>
&quot;1649309843.10&quot;.=C2=A0 Should really use %06lu for the microsecon=
ds part.<br></blockquote><div><br></div><div>good idea</div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Whether you want to fix this in this patch, or just note it for later in<br=
>
the commit message, or ignore it alltogether is up to you.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%&quot;=
 G_GINT64_FORMAT &quot;.%&quot; G_GINT64_FORMAT<br>
<br>
This gives me flashbacks to the 90s.=C2=A0 Please use PRId64 like we do<br>
everywhere else.<br>
<br>
I&#39;d ditch gint64_t for int64_t, too.<br></blockquote><div><br></div><di=
v>ack, ack</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;: %s: %=
s\n&quot;, t / G_USEC_PER_SEC, t % G_USEC_PER_SEC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 level_str, ms=
g);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fflush(s-&gt;log_file);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d646ed05dc0ea773--

