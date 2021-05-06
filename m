Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA860375603
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:57:48 +0200 (CEST)
Received: from localhost ([::1]:55228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefRj-0006fe-TT
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lefQ8-0004sh-OT
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:56:08 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:44636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lefQ6-000461-Np
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:56:08 -0400
Received: by mail-qk1-x72e.google.com with SMTP id a2so5143349qkh.11
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 07:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EV0Y8S1mUkWQ6V7LjcC6oMXN3eTe6R5+o1AdjAac2Lc=;
 b=hA9rGTm754OgexHhLlSqqeGLntCgUy7sCtDh1Kr0gnVITpDwn3s6O706AmkbxJsIPf
 9EG1tOIeYpV3qQ2DC97gy+y36QHkaNPpXFX4I5kfN/EYiqTfh8VhoisYu9oOWOs8dqtG
 JTtkMXHQQBG4h0lfKLp5idPnkL3VtjSR4Wpwc7UTTgo7QYUDaunE52ipEWb4OhCOYPBn
 b903ssyM5f4WA97ulaXPkCOvhbZrE6/w/DWO/LxJVBTAOarLQT9Bhc+RgvWh3tS+Xq+h
 dzhOshwBKyeFIC9FqoisU+BYccbd6qetlv79E+TTOXlCrBgctZ9Hct9lBBgZsvracCYZ
 iDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EV0Y8S1mUkWQ6V7LjcC6oMXN3eTe6R5+o1AdjAac2Lc=;
 b=N5krdrpsnVFnjPhxHvwD05YB94rkVOnwwF79aBdA2v4t7NkbYypv5ekFt6z4FQog0S
 XLsNUAVd5rSc+irzmkDzwb22Ktr6h99zItnq+A4qN1PlZqksLEOpPNZoUKP4bnmd4C2z
 OPzN6x/JB1Ii7rAXsDL5S5hCSOnRuz3Gdj2eOOE20xPaA70JDSwGGfYfBdNeUohq3la/
 lSjR6dCBCznshyP8g1OCBmA0Z+2El5HQEwusGthQwRmFyGk0Ytn5G8LuWeKguoz72hjh
 FvGFyY9ArXR8QjhE9MuXUsCdig1Z0VQyM2CNsyh1jk5dX1QBF7IhtJo9C9Kaj0V4EHMr
 z5qg==
X-Gm-Message-State: AOAM533e7KE7/pw2M6h3VW5CDqKFyb/+//7g4b2rm1Y5U9dgvC5wwvyw
 aHsDwbpRaoc6RjTecP1l/I3W3vpON3UwRriE2IW3tw==
X-Google-Smtp-Source: ABdhPJwvmExSmfaqShxTz5sCbgagBglQkXsFwLqHrFtsT/0JM7KG6Sdwi70g7cyinzqbfzmnc6Nh+T+7SYz7VIOA5n0=
X-Received: by 2002:a05:620a:2081:: with SMTP id
 e1mr4286903qka.44.1620312965534; 
 Thu, 06 May 2021 07:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
 <39f12704-af5c-2e4f-d872-a860d9a870d7@redhat.com>
In-Reply-To: <39f12704-af5c-2e4f-d872-a860d9a870d7@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 08:55:54 -0600
Message-ID: <CANCZdfqW0XTa18F+JxuSnhpictWxVJUsu87c=yAwMp6YT60FMg@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bc740305c1aa82d6"
Received-SPF: none client-ip=2607:f8b0:4864:20::72e;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kvm-devel <kvm@vger.kernel.org>, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bc740305c1aa82d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2021 at 8:26 AM Eric Blake <eblake@redhat.com> wrote:

> On 5/6/21 9:16 AM, Warner Losh wrote:
> > On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
> > wrote:
> >
> >> The ALLOCA(3) man-page mentions its "use is discouraged".
> >>
> >> Replace it by a g_new() call.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  bsd-user/syscall.c | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> >> index 4abff796c76..dbee0385ceb 100644
> >> --- a/bsd-user/syscall.c
> >> +++ b/bsd-user/syscall.c
> >> @@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int num=
,
> >> abi_long arg1,
> >>      case TARGET_FREEBSD_NR_writev:
> >>          {
> >>              int count =3D arg3;
> >> -            struct iovec *vec;
> >> +            g_autofree struct iovec *vec =3D g_new(struct iovec, coun=
t);
> >>
> >
> > Where is this freed? Also, alloca just moves a stack pointer, where
> malloc
> > has complex interactions. Are you sure that's a safe change here?
>
> It's freed any time the g_autofree variable goes out of scope (that's
> what the g_autofree macro is for).  Yes, the change is safe, although
> you are right that switching to malloc is going to be a bit more
> heavyweight than what alloca used.  What's more, it adds safety: if
> count was under user control, a user could pass a value that could cause
> alloca to allocate more than 4k and accidentally mess up stack guard
> pages, while malloc() uses the heap and therefore cannot cause stack bugs=
.
>

I'm not sure I understand that argument, since we're not compiling bsd-user
with the stack-smash-protection stuff enabled, so there's no guard pages
involved. The stack can grow quite large and the unmapped page at
the end of the stack would catch any overflows. Since these allocations
are on the top of the stack, they won't overflow into any other frames
and subsequent calls are made with them already in place.

malloc, on the other hand, involves taking out a number of mutexes
and similar things to obtain the memory, which may not necessarily
be safe in all the contexts system calls can be called from. System
calls are, typically, async safe and can be called from signal handlers.
alloca() is async safe, while malloc() is not. So changing the calls
from alloca to malloc makes calls to system calls in signal handlers
unsafe and potentially introducing buggy behavior as a result.

Warner

--000000000000bc740305c1aa82d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 8:26 AM Eric B=
lake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 5/6/21 9:=
16 AM, Warner Losh wrote:<br>
&gt; On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<b=
r>
&gt; wrote:<br>
&gt; <br>
&gt;&gt; The ALLOCA(3) man-page mentions its &quot;use is discouraged&quot;=
.<br>
&gt;&gt;<br>
&gt;&gt; Replace it by a g_new() call.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:p=
hilmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 bsd-user/syscall.c | 3 +--<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c<br>
&gt;&gt; index 4abff796c76..dbee0385ceb 100644<br>
&gt;&gt; --- a/bsd-user/syscall.c<br>
&gt;&gt; +++ b/bsd-user/syscall.c<br>
&gt;&gt; @@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int=
 num,<br>
&gt;&gt; abi_long arg1,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 case TARGET_FREEBSD_NR_writev:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int count =3D arg3=
;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct iovec *vec;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree struct iovec=
 *vec =3D g_new(struct iovec, count);<br>
&gt;&gt;<br>
&gt; <br>
&gt; Where is this freed? Also, alloca just moves a stack pointer, where ma=
lloc<br>
&gt; has complex interactions. Are you sure that&#39;s a safe change here?<=
br>
<br>
It&#39;s freed any time the g_autofree variable goes out of scope (that&#39=
;s<br>
what the g_autofree macro is for).=C2=A0 Yes, the change is safe, although<=
br>
you are right that switching to malloc is going to be a bit more<br>
heavyweight than what alloca used.=C2=A0 What&#39;s more, it adds safety: i=
f<br>
count was under user control, a user could pass a value that could cause<br=
>
alloca to allocate more than 4k and accidentally mess up stack guard<br>
pages, while malloc() uses the heap and therefore cannot cause stack bugs.<=
br></blockquote><div><br></div><div>I&#39;m not sure I understand that argu=
ment, since we&#39;re not compiling bsd-user</div><div>with the stack-smash=
-protection stuff enabled,=C2=A0so there&#39;s no guard pages</div><div>inv=
olved. The stack can grow quite large and the unmapped page at</div><div>th=
e end of the stack would catch any overflows. Since these allocations</div>=
<div>are on the top of the stack, they won&#39;t overflow into any other fr=
ames</div><div>and subsequent calls are made with them already in place.</d=
iv><div><br></div><div>malloc, on the other hand, involves taking out a num=
ber of mutexes</div><div>and similar things to obtain the memory, which may=
 not necessarily</div><div>be safe in all the contexts system calls can be =
called from. System</div><div>calls are, typically, async safe and can be c=
alled from signal handlers.</div><div>alloca() is async safe, while malloc(=
) is not. So changing the calls</div><div>from alloca to malloc makes calls=
 to system calls in signal handlers</div><div>unsafe and potentially introd=
ucing buggy behavior as a result.</div><div><br></div><div>Warner</div></di=
v></div>

--000000000000bc740305c1aa82d6--

