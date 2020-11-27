Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E32A2C6082
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 08:33:14 +0100 (CET)
Received: from localhost ([::1]:53876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiYFl-0005eA-5Z
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 02:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kiY3S-0003V9-0f
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 02:20:30 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:40846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kiY3P-0008IN-59
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 02:20:29 -0500
Received: by mail-ej1-x634.google.com with SMTP id oq3so6158995ejb.7
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 23:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=La0GBYqtFx9q6o+rbG28P0euk+2woNikPLGzum0b1ps=;
 b=KJDtnVpgqlE9tGjY82OUmd6fCIJUFAJvqXSszSOlz9w7w98M+wwsKTQGtCxLNZhPqv
 BH77X9TY93XIIcOLFnTN6o8OpUiEQd8BUSwXGjXzUWIFSsUFdMLqDWQtsLNoVB4jkZFz
 XSAgHL3UgHFJvFcF5Brsnfx4LgjfjtLbrVAfv53jcKIa58NnSJgvOZ2ohaS21HlVixuz
 6Qnj71nVWBfy95WDBAALolWEOTsU5XC8QoN3vJPooKK+biWJb68obnzyj/sVLEdoKE/O
 Pbi0Ooaj+qWgSFnGrRfETzbufN3WR4nuL0hDTq6A7Lndh0ei31TZ+/vBoFQsojWgzLAP
 iTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=La0GBYqtFx9q6o+rbG28P0euk+2woNikPLGzum0b1ps=;
 b=Ge3p8QzlUTJNDudnO0r5yjiI/TNamR6g102iQqN1Lpay1++7692GJMfSl9sFUXA89d
 2zZBlFL5OEDYIKqyut6oM2bBXI2ncVnd6bHKEzCjG5L4l1syqPZewr3FtLYiXv9IzsGt
 3YlIjPVcgTbHkElSH5Tf1ymjNzALAg3owI0MP5zfqGGjibYTVNhMIPkrZlOo7f+ixuQ8
 7Levy+q0lVTYT2t7arCtjxtgAwqlNh2jktHL+iU+0M5U/A7q7S/d1XDE77ws1SwyLPxR
 QdZZBi3d5U/lOvq2icXPBdi14y2LCnexFa0IjOcG/WODC/QByQev9MxcJmBZSHI9wLHj
 LdpA==
X-Gm-Message-State: AOAM533WFIc0UESpdOOwerU9Xns9wl6yXGFtIdsfBdI9BngVJn2lq6t7
 LwD2rOM3J6esOwaBgiParQAM1kg++5OwgB2wJEI=
X-Google-Smtp-Source: ABdhPJzYPGqQGcgjn2Boyr8S38q6n6Mwu1bYkDsGOw2aM97lDFmhMAE9pKJjRC8JRctDiZmJAJxWO5Op/ZVzwioHsGU=
X-Received: by 2002:a17:906:8587:: with SMTP id
 v7mr160078ejx.381.1606461625081; 
 Thu, 26 Nov 2020 23:20:25 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-10-marcandre.lureau@redhat.com>
 <CAFEAcA9tcduAw1vEjWoOvmiJGS-S6zUx3t_nmssSNxbgPXpyOQ@mail.gmail.com>
 <20201127071514.su5s4jmbtp2u6jrv@sirius.home.kraxel.org>
In-Reply-To: <20201127071514.su5s4jmbtp2u6jrv@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 27 Nov 2020 11:20:13 +0400
Message-ID: <CAJ+F1CLmw7qD7Pf3uGDcG1QEMdnPb1LRaLW6G4Dc_KcFpEa3vA@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] audio: remove GNUC & MSVC check
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000082237c05b5117e3a"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x634.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000082237c05b5117e3a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 11:15 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > >  #if defined AUDIO_BREAKPOINT_ON_BUG
> > >  #  if defined HOST_I386
> > > +      __asm__ ("int3");
> > >  #  else
> > >          abort ();
> > >  #  endif
> > > --
> > > 2.29.0
> >
> > I would prefer to just drop this attempt to emit an inline
> > breakpoint insn (which won't work on non-x86 hosts and seems
> > to me to have no benefit over just calling abort(), which will
> > also drop you into the debugger) and simply make it abort() if
> > AUDIO_BREAKPOINT_ON_BUG is defined. Gerd, do you have an
> > opinion ?
>
>    kraxel@sirius ~/projects/qemu# git grep AUDIO_BREAKPOINT_ON_BUG
>    audio/audio.c:#if defined AUDIO_BREAKPOINT_ON_BUG
>
> Seems this is unused, so just remove it?
>
>
I think the original intention was to build with CFLAGS set manually for
debugging this limited case. (Iirc, we have other such #ifdef lurking
around)

--=20
Marc-Andr=C3=A9 Lureau

--00000000000082237c05b5117e3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 27, 2020 at 11:15 AM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =
Hi,<br>
<br>
&gt; &gt;=C2=A0 #if defined AUDIO_BREAKPOINT_ON_BUG<br>
&gt; &gt;=C2=A0 #=C2=A0 if defined HOST_I386<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 __asm__ (&quot;int3&quot;);<br>
&gt; &gt;=C2=A0 #=C2=A0 else<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort ();<br>
&gt; &gt;=C2=A0 #=C2=A0 endif<br>
&gt; &gt; --<br>
&gt; &gt; 2.29.0<br>
&gt; <br>
&gt; I would prefer to just drop this attempt to emit an inline<br>
&gt; breakpoint insn (which won&#39;t work on non-x86 hosts and seems<br>
&gt; to me to have no benefit over just calling abort(), which will<br>
&gt; also drop you into the debugger) and simply make it abort() if<br>
&gt; AUDIO_BREAKPOINT_ON_BUG is defined. Gerd, do you have an<br>
&gt; opinion ?<br>
<br>
=C2=A0 =C2=A0kraxel@sirius ~/projects/qemu# git grep AUDIO_BREAKPOINT_ON_BU=
G<br>
=C2=A0 =C2=A0audio/audio.c:#if defined AUDIO_BREAKPOINT_ON_BUG<br>
<br>
Seems this is unused, so just remove it?<br><br></blockquote><div><br></div=
><div>I think the original intention was to build with CFLAGS set manually =
for debugging this limited case. (Iirc, we have other such #ifdef lurking a=
round) <br></div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000082237c05b5117e3a--

