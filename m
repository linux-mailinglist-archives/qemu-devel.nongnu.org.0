Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2192C53C8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:16:12 +0100 (CET)
Received: from localhost ([::1]:51860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiGC3-0005al-JM
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:16:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kiG6D-0003bA-D9
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:10:12 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:40666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kiG6A-000311-Dx
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:10:08 -0500
Received: by mail-ed1-x543.google.com with SMTP id d18so2023867edt.7
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bJWEwcHzDJsmIqdsR211TyYuWdMsuG+VxsgkvcX/MLM=;
 b=cowRtGtJ1ydNwXJQUqN2ZjED7NSp0iOPZ/Ibkzl+jx/Fk1w22JDJ4z//yBxoPsZCkU
 BiUEEvyFQlZwILbr1SycKJiMkKKuhQMuNQDr5Tmu6dfxVS1YHvf846BE0nPUwyDXxBey
 4x9rz4V8umfLV8Sg/e9IavKmoA/gvHHWsa6zpku8tJJCc1IfhFDZVmPt6ZwUGeAv5VIC
 K31XOU8f30zyDCBaIV9YfqrPaBrqNUklUAds5xuuomAqKtFmhbt4yC/n/hTQ7nC4WTjj
 FUjXs5pzFGEVSsovHM5iHmUanBbpiS9lLZav/3FZmpNcHPc7u7x6ktoRbT2Hmr6ssT6O
 TJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bJWEwcHzDJsmIqdsR211TyYuWdMsuG+VxsgkvcX/MLM=;
 b=tcqPnMaD9wl3ViW4xV1ds7Bt+ygUwuE+hb6sO4DEEZAhBZmhizhNG7/4hZiW1Nnibj
 2p1ah1VRC5AfWt6Xl4doRoHRdmUq2Df863Hi9vT/0rc6lmzsDiHok/7oJ+jRYcJ7yc+I
 /sy7di934aIf9+5yHFA98gjT4nvvyvnioLUOYxa3ohncrUh04ploUe7sSunfa7Jw425O
 w5NCtTL1wWniJ+ZvdgVwmAJ1a0LjvqfIQpjVEuxXaQTgnJwitwS9vgrMT9H1kvCqJ1Or
 5rsPf1UpjisbyPkYC/54hfuq1rLnCGsBWFBYgPoOE4AalcZjUxUKjxRiUfFMrJlkfBQm
 4Xmg==
X-Gm-Message-State: AOAM532ZEQZlVgiho78U/r6xlmCKkgbfWINexwCHsrgWtQiWqwSpXxre
 +lYuxa491N0XNVpWJIIwUgAfEzGL2cGQn0VUOVY=
X-Google-Smtp-Source: ABdhPJzp/viCks9+jU34tqmMT8bFioq41GP1x0FFC3jx3yNy8hwum7MaSO0EJ/Yisi/SI/q1iwvc0d7RQ1vfmK4Y6jk=
X-Received: by 2002:a05:6402:1155:: with SMTP id
 g21mr2291128edw.53.1606392603168; 
 Thu, 26 Nov 2020 04:10:03 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-10-marcandre.lureau@redhat.com>
 <CAFEAcA9tcduAw1vEjWoOvmiJGS-S6zUx3t_nmssSNxbgPXpyOQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9tcduAw1vEjWoOvmiJGS-S6zUx3t_nmssSNxbgPXpyOQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 26 Nov 2020 16:09:51 +0400
Message-ID: <CAJ+F1C+dGWamoruzkJspCdPXZ_K7F4v_nhS7PKhJJWzGm5_M5Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] audio: remove GNUC & MSVC check
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007b551605b5016cb9"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x543.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007b551605b5016cb9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Nov 26, 2020 at 4:08 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 26 Nov 2020 at 11:30, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > QEMU requires either GCC or Clang, which both advertize __GNUC__.
> > Drop MSVC fallback path.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  audio/audio.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > diff --git a/audio/audio.c b/audio/audio.c
> > index 46578e4a58..d7a00294de 100644
> > --- a/audio/audio.c
> > +++ b/audio/audio.c
> > @@ -122,13 +122,7 @@ int audio_bug (const char *funcname, int cond)
> >
> >  #if defined AUDIO_BREAKPOINT_ON_BUG
> >  #  if defined HOST_I386
> > -#    if defined __GNUC__
> > -        __asm__ ("int3");
> > -#    elif defined _MSC_VER
> > -        _asm _emit 0xcc;
> > -#    else
> > -        abort ();
> > -#    endif
> > +      __asm__ ("int3");
> >  #  else
> >          abort ();
> >  #  endif
> > --
> > 2.29.0
>
> I would prefer to just drop this attempt to emit an inline
> breakpoint insn (which won't work on non-x86 hosts and seems
> to me to have no benefit over just calling abort(), which will
> also drop you into the debugger) and simply make it abort() if
> AUDIO_BREAKPOINT_ON_BUG is defined. Gerd, do you have an
> opinion ?
>
>
Oh yeah.. But audio/ is a rabbit hole, so I had to refrain myself doing
more cleanups.

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007b551605b5016cb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 26, 2020 at 4:08 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Thu, 26 Nov 2020 at 11:30, &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; QEMU requires either GCC or Clang, which both advertize __GNUC__.<br>
&gt; Drop MSVC fallback path.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 audio/audio.c | 8 +-------<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/audio/audio.c b/audio/audio.c<br>
&gt; index 46578e4a58..d7a00294de 100644<br>
&gt; --- a/audio/audio.c<br>
&gt; +++ b/audio/audio.c<br>
&gt; @@ -122,13 +122,7 @@ int audio_bug (const char *funcname, int cond)<br=
>
&gt;<br>
&gt;=C2=A0 #if defined AUDIO_BREAKPOINT_ON_BUG<br>
&gt;=C2=A0 #=C2=A0 if defined HOST_I386<br>
&gt; -#=C2=A0 =C2=A0 if defined __GNUC__<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 __asm__ (&quot;int3&quot;);<br>
&gt; -#=C2=A0 =C2=A0 elif defined _MSC_VER<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 _asm _emit 0xcc;<br>
&gt; -#=C2=A0 =C2=A0 else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort ();<br>
&gt; -#=C2=A0 =C2=A0 endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 __asm__ (&quot;int3&quot;);<br>
&gt;=C2=A0 #=C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort ();<br>
&gt;=C2=A0 #=C2=A0 endif<br>
&gt; --<br>
&gt; 2.29.0<br>
<br>
I would prefer to just drop this attempt to emit an inline<br>
breakpoint insn (which won&#39;t work on non-x86 hosts and seems<br>
to me to have no benefit over just calling abort(), which will<br>
also drop you into the debugger) and simply make it abort() if<br>
AUDIO_BREAKPOINT_ON_BUG is defined. Gerd, do you have an<br>
opinion ?<br><br></blockquote><div><br></div><div>Oh yeah.. But audio/ is a=
 rabbit hole, so I had to refrain myself doing more cleanups.</div><div> <b=
r></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000007b551605b5016cb9--

