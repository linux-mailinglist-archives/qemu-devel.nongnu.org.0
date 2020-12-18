Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBD12DE37A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:50:28 +0100 (CET)
Received: from localhost ([::1]:60802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqG9L-0007mC-DM
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kqFtd-0005XL-9E
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:34:13 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kqFtb-0004es-Eq
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:34:13 -0500
Received: by mail-ej1-x632.google.com with SMTP id lt17so3238497ejb.3
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 05:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bq0tHY4ZqnQ14SQSytNmNpVx0uxQejQO14hzAqt8ACM=;
 b=qgW/kzB/5XtDlbVB8r8N/JZ5XL3We5ezAYK0SD5WBzxJLT/Vu8oqWtJsE89gp5b2zl
 xc2zh5eLgxhRC5ffMVHK5irccFTWiFJqJCH89x2JzLYt83Iu3thZg3oO5QEvaFsrbN0w
 /EyWnBG/pRkBKYBnz6WTbseTSYTmQDmUoPeqjL7Lqr6PllVQyRH9ArVD1rRN0jzORj0m
 r2dFvh+0votXw7axApbg9Vx8X/e20GGw23aZDZD/rXEbIKoQideDfcnWoq0wiI7nWjJv
 /WRNlA496dx0V7aC2VRkF/oGFTYKBaMxmOdxDtfXWF/f6cJ1BhC7EQVKiL2FPCTUfse0
 CArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bq0tHY4ZqnQ14SQSytNmNpVx0uxQejQO14hzAqt8ACM=;
 b=happb39mA08EfJG1olObrfDAVicWrYc5aAEK1Gxvqylv3B4Tfm+n+nZ1co8K+GS1WM
 xJemJWfaD2GAr21XFy/RafQLEmbZ+rny0i/bWAF3uqkm+xzlSiNPW++puWvTGEMiQIVw
 LD3oBoGpMmuMl1vVr5K/JeotV1t8MGzSa2fj3gKx9bEOGWbvojDJR9ajAr2EPQCCsppZ
 fnUQsKsORCbDrFml5SW8c0iFhOOw/Wvcb46N7IaBaEyNBoPHyWQoYiLWvTPwsTwYaanr
 L4PECnt6XYT+LtHDd9RG4Le3ptfIx+QzBBt9hkxS7tKvKKmow6ohRJwVkXs8Y8Oi2inl
 EVUw==
X-Gm-Message-State: AOAM533Sb5bLeOnTb1uozh+7HM8/CBTB5BuWreWU+7+lRgKzxMMSsun7
 6YdL2T3p8vRm6I81YA0eU5wZAria77UfA0PGflY=
X-Google-Smtp-Source: ABdhPJwF+G3eajW/szlMle95/4pp7NUqXAADogP/HGsPC5RzzRgZ8/1uUcV7Hmz6fmHocE5u4S30RXhU1Sryj1MDzWU=
X-Received: by 2002:a17:906:98d4:: with SMTP id
 zd20mr4022378ejb.532.1608298448510; 
 Fri, 18 Dec 2020 05:34:08 -0800 (PST)
MIME-Version: 1.0
References: <20201217104417.436508-1-marcandre.lureau@redhat.com>
 <5c6d244b-1ed3-f065-88b6-7a007a224cc4@suse.de>
 <7fc16ac5-d0c2-9475-abc8-bd415c6b2a73@redhat.com>
 <CAMxuvawOQc7sHoVV+eaAChwDb5RVRBHWPqzZ85xoovp+_nqtdg@mail.gmail.com>
 <4287c327-0e3e-5f35-b078-0360796e6103@redhat.com>
In-Reply-To: <4287c327-0e3e-5f35-b078-0360796e6103@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 18 Dec 2020 17:33:56 +0400
Message-ID: <CAJ+F1CLh2pbdTrGG5+aMxjdMAZRfbip4L1gjowCfNiY-F2AcyQ@mail.gmail.com>
Subject: Re: [PATCH] build-sys: fix win32 compilation with --target-list=''
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b8f3f405b6bd296b"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x632.google.com
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
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b8f3f405b6bd296b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Dec 18, 2020 at 5:24 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 18/12/20 14:01, Marc-Andr=C3=A9 Lureau wrote:
> >> in aio_set_fd_handler.  I think we can remove the call to
> >> qemu_fd_register from qemu_try_set_nonblock, and that should fix the
> >> issue as well.
> >
> > That's tricky to say whether this won't introduce regression. For most
> > fds from qemu, if they use aio_set_fd_handler, that should be ok.
> >
> > But what about other fds? For examples, the ones from slirp?
>
> slirp already calls qemu_fd_register, see net_slirp_register_poll_fd
>
> > In fact, I
> > don't understand how it could work today. We are passing socket() fd
> > directly to g_poll(). But according to the documentation:
> >
> >   * On Win32, the fd in a GPollFD should be Win32 HANDLE (*not* a file
> >   * descriptor as provided by the C runtime) that can be used by
> >   * MsgWaitForMultipleObjects. This does *not* include file handles
> >   * from CreateFile, SOCKETs, nor pipe handles. (But you can use
> >   * WSAEventSelect to signal events when a SOCKET is readable).
> >
> > And MsgWaitForMultipleObjects doesn't mention SOCKET as being valid
> > handles to wait for.
>
> No, it's more complicated.  On Win32, gpollfds is only used for sockets
> (despite the name!), while poll_fds is used for prepare/query/g_poll/chec=
k.
>
> What we do is basically the same that QIOChannel and aio-win32.c already
> do, just with more indirection to fit the SLIRP callback API:
>
> - main_loop_wait calls net_slirp_poll_notify, which asks SLIRP to send
> back the list of file descriptors through the net_slirp_add_poll callback=
.
>
> - the file descriptors are stored in the gpollfds global.
>
> - os_host_main_loop_wait does a select on the sockets with 0 timeout
>
> - if no socket is ready, g_poll is done with the original timeout
> (otherwise the timeout is zeroed)
>
>
- the sockets were registered with WSAEventSelect in
> net_slirp_register_poll_fd, so they interrupt the subsequent g_poll if
> data comes in.
>
>
Ah thanks, I mixed the unix and the win32 versions.


> I don't see any other use of MainLoopPoll, so all non-SLIRP sockets
> should be going through {qemu,aio}_set_fd_handler.  In particular this
> is the case for all of chardev/ (which uses QIOChannel), io/ and net/.
> These are all the other users of qemu_set_nonblock and
> qemu_try_set_nonblock.
>
>
Ok, I guess we can simply register fd to be a win32-specific call for slirp
then.


> Paolo
>
> > But when I run qemu with slirp, with or without qemu_fd_register, I
> > don't see any error or regression.
> >
> > Am I missing something?
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b8f3f405b6bd296b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 18, 2020 at 5:24 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 18/12/20 14:01, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt;&gt; in aio_set_fd_handler.=C2=A0 I think we can remove the call to<br>
&gt;&gt; qemu_fd_register from qemu_try_set_nonblock, and that should fix t=
he<br>
&gt;&gt; issue as well.<br>
&gt;<br>
&gt; That&#39;s tricky to say whether this won&#39;t introduce regression. =
For most <br>
&gt; fds from qemu, if they use aio_set_fd_handler, that should be ok.<br>
&gt; <br>
&gt; But what about other fds? For examples, the ones from slirp?<br>
<br>
slirp already calls qemu_fd_register, see net_slirp_register_poll_fd<br>
<br>
&gt; In fact, I <br>
&gt; don&#39;t understand how it could work today. We are passing socket() =
fd <br>
&gt; directly to g_poll(). But according to the documentation:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* On Win32, the fd in a GPollFD should be Win32 HANDLE (*n=
ot* a file<br>
&gt;=C2=A0 =C2=A0* descriptor as provided by the C runtime) that can be use=
d by<br>
&gt;=C2=A0 =C2=A0* MsgWaitForMultipleObjects. This does *not* include file =
handles<br>
&gt;=C2=A0 =C2=A0* from CreateFile, SOCKETs, nor pipe handles. (But you can=
 use<br>
&gt;=C2=A0 =C2=A0* WSAEventSelect to signal events when a SOCKET is readabl=
e).<br>
&gt; <br>
&gt; And MsgWaitForMultipleObjects doesn&#39;t mention SOCKET as being vali=
d <br>
&gt; handles to wait for.<br>
<br>
No, it&#39;s more complicated.=C2=A0 On Win32, gpollfds is only used for so=
ckets <br>
(despite the name!), while poll_fds is used for prepare/query/g_poll/check.=
<br>
<br>
What we do is basically the same that QIOChannel and aio-win32.c already <b=
r>
do, just with more indirection to fit the SLIRP callback API:<br>
<br>
- main_loop_wait calls net_slirp_poll_notify, which asks SLIRP to send <br>
back the list of file descriptors through the net_slirp_add_poll callback.<=
br>
<br>
- the file descriptors are stored in the gpollfds global.<br>
<br>
- os_host_main_loop_wait does a select on the sockets with 0 timeout<br>
<br>
- if no socket is ready, g_poll is done with the original timeout <br>
(otherwise the timeout is zeroed)<br>=C2=A0 <br></blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
- the sockets were registered with WSAEventSelect in <br>
net_slirp_register_poll_fd, so they interrupt the subsequent g_poll if <br>
data comes in.<br>
<br></blockquote><div><br></div><div>Ah thanks, I mixed the unix and the wi=
n32 versions.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
I don&#39;t see any other use of MainLoopPoll, so all non-SLIRP sockets <br=
>
should be going through {qemu,aio}_set_fd_handler.=C2=A0 In particular this=
 <br>
is the case for all of chardev/ (which uses QIOChannel), io/ and net/. <br>
These are all the other users of qemu_set_nonblock and <br>
qemu_try_set_nonblock.<br>
<br></blockquote><div><br></div><div>Ok, I guess we can simply register fd =
to be a win32-specific call for slirp then.<br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
Paolo<br>
<br>
&gt; But when I run qemu with slirp, with or without qemu_fd_register, I <b=
r>
&gt; don&#39;t see any error or regression.<br>
&gt; <br>
&gt; Am I missing something?<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b8f3f405b6bd296b--

