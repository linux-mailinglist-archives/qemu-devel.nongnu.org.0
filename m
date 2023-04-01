Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2B56D30F0
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 15:17:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pib5D-0008GN-KV; Sat, 01 Apr 2023 09:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pib55-0008FZ-Of
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 09:15:43 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pib53-0007zZ-Bz
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 09:15:43 -0400
Received: by mail-ed1-x534.google.com with SMTP id y4so100364419edo.2
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 06:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680354939;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yveBq8rqGhgx5kz+GiAVT8Kw8aYR5uUMqZ33D2DhE3s=;
 b=aeMoT/4ezpT9ZF3NzrFK3jIbv0c3dj+F/Ock2um+bAxSQB95wTaC5QtPIpMGIxjhf5
 S3TV1scqGPoWbVd1O5r2L86nw9AXUlfoLRn5XbkUW+Uj2uHe6m9OzFwTzk0RkD/BhL2N
 hBxjgDpk53T9/sn48h0Vk1029cRgUnKh2WqYPS3dcbjqTaa2LWVXDia3BwZXxPxwKlOY
 juKCBIG0bip2J6tWZ31e/eJVynr6Oz3/uFL6r2fqyP4mamlvUKk37WlQBl+BRUHlkF79
 WF0KNb02I8xA/CiGi9tZ6lUs1vjrDOqr7ilnFVp6cfKPoYnraLjnBhfmUfBV8pCaXdtd
 cQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680354939;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yveBq8rqGhgx5kz+GiAVT8Kw8aYR5uUMqZ33D2DhE3s=;
 b=2A7goNSjM8rDUzsM2WgAAHQTK0Oo+q/LBiMtgnc+ha8D5k4og7o6aWMQ7IvEPr1IZR
 RgjCrVrdr2frehkKoBHbQF7sUfCjTm6mFmEeKXeNnNVyB42ncQUFn5UXSNGtxwsTCSHa
 MjHLdzWm4KZmxFyX7U317EHGK1wANMjYGnQx65npKtKKMq7rVwNYcq9+BKF2gkxoM0pY
 117IijCfM8GWuI9N/QXXlG5cQ6c1E+5Ogu/TDGFo8AFUNhUg2upOh0+bGxFPgoORB7Zd
 uYwoNPkuVOEh4hbZ/gQaNnaWE5Py/TgC/v/3b5AnAL0lArz0wyBSYXgatXHcz95AqSXs
 P62A==
X-Gm-Message-State: AAQBX9fVBQpGZJq8cEvGUvlmtxQ4t1c5wHez3rNG3QFJJkvFDxFvxNuf
 EBibNV3Vxr8suP2ncYZgt+1wsxtphe96Beng63GcPw==
X-Google-Smtp-Source: AKy350ZBLL8sCWy0R9xcr+pZznCsRPl5qMpJSJ+SxlFyaNhv9LSZ3ynFlg6ekb+hPrX/zvsDg0xO72Sf6AQh7PM03Fw=
X-Received: by 2002:a50:9b5c:0:b0:4fa:e5e0:9466 with SMTP id
 a28-20020a509b5c000000b004fae5e09466mr15407224edj.7.1680354938679; Sat, 01
 Apr 2023 06:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230331141833.3647-1-imp@bsdimp.com>
 <ZCgq9Ll+QJoZDVl3@gorilla.13thmonkey.org>
In-Reply-To: <ZCgq9Ll+QJoZDVl3@gorilla.13thmonkey.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 1 Apr 2023 07:15:27 -0600
Message-ID: <CANCZdfqAfebzwm6vc1oHM+fNkT=FxveK9rPS=OvccbQFP2s4jQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] bsd-user: remove bitrotted NetBSD and OpenBSD
 bsd-user support
To: Reinoud Zandijk <reinoud@netbsd.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Ryo ONODERA <ryoon@netbsd.org>, 
 Brad Smith <brad@comstyle.com>, Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="0000000000003787cd05f8461f85"
Received-SPF: none client-ip=2a00:1450:4864:20::534;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000003787cd05f8461f85
Content-Type: text/plain; charset="UTF-8"

These haven't even compiled in years. Last time I polled the NetBSD and
OpenBSD communities they weren't using this and had no plans to fix.

I'd be happy to work with anybody that wanted to fix that state of affairs.

Warner

On Sat, Apr 1, 2023, 7:00 AM Reinoud Zandijk <reinoud@netbsd.org> wrote:

> Dear Qemu folks,
>
> I'll throw it in the NetBSD group for feedback.
>
> With regards,
> Reinoud
>
> On Fri, Mar 31, 2023 at 08:18:26AM -0600, Warner Losh wrote:
> > The NetBSD and OpenBSD support in bsd-user hasn't built since before the
> meson
> > conversion. It's also out of sync with many of the recent changes in the
> > bsd-user fork and has just been removed there. Remove it from master for
> the
> > same reasons: it generates a number of false positives with grep and has
> > increasingly gotten in the way. The bsd-user fork code is much more
> advanced,
> > and even it doesn't compile and is out of date. Remove this from both
> > branches. If others wish to bring it up to speed, I'm happy to help them.
> >
> > Warner Losh (7):
> >   bsd-user: Remove obsolete prototypes
> >   bsd-user: Remove netbsd system call inclusion and defines
> >   bsd-user: Remove netbsd system call tracing
> >   bsd-user: Remove openbsd system call inclusion and defines
> >   bsd-user: Remove openbsd system call tracing
> >   bsd-user: Remove netbsd directory
> >   bsd-user: Remove openbsd directory
> >
> >  bsd-user/netbsd/host-os.h            |  25 --
> >  bsd-user/netbsd/os-strace.h          |   1 -
> >  bsd-user/netbsd/strace.list          | 145 -----------
> >  bsd-user/netbsd/syscall_nr.h         | 373 ---------------------------
> >  bsd-user/netbsd/target_os_elf.h      | 147 -----------
> >  bsd-user/netbsd/target_os_siginfo.h  |  82 ------
> >  bsd-user/netbsd/target_os_signal.h   |  69 -----
> >  bsd-user/netbsd/target_os_stack.h    |  56 ----
> >  bsd-user/netbsd/target_os_thread.h   |  25 --
> >  bsd-user/openbsd/host-os.h           |  25 --
> >  bsd-user/openbsd/os-strace.h         |   1 -
> >  bsd-user/openbsd/strace.list         | 187 --------------
> >  bsd-user/openbsd/syscall_nr.h        | 225 ----------------
> >  bsd-user/openbsd/target_os_elf.h     | 147 -----------
> >  bsd-user/openbsd/target_os_siginfo.h |  82 ------
> >  bsd-user/openbsd/target_os_signal.h  |  69 -----
> >  bsd-user/openbsd/target_os_stack.h   |  56 ----
> >  bsd-user/openbsd/target_os_thread.h  |  25 --
> >  bsd-user/qemu.h                      |  16 --
> >  bsd-user/strace.c                    |  34 ---
> >  bsd-user/syscall_defs.h              |  29 +--
> >  21 files changed, 1 insertion(+), 1818 deletions(-)
> >  delete mode 100644 bsd-user/netbsd/host-os.h
> >  delete mode 100644 bsd-user/netbsd/os-strace.h
> >  delete mode 100644 bsd-user/netbsd/strace.list
> >  delete mode 100644 bsd-user/netbsd/syscall_nr.h
> >  delete mode 100644 bsd-user/netbsd/target_os_elf.h
> >  delete mode 100644 bsd-user/netbsd/target_os_siginfo.h
> >  delete mode 100644 bsd-user/netbsd/target_os_signal.h
> >  delete mode 100644 bsd-user/netbsd/target_os_stack.h
> >  delete mode 100644 bsd-user/netbsd/target_os_thread.h
> >  delete mode 100644 bsd-user/openbsd/host-os.h
> >  delete mode 100644 bsd-user/openbsd/os-strace.h
> >  delete mode 100644 bsd-user/openbsd/strace.list
> >  delete mode 100644 bsd-user/openbsd/syscall_nr.h
> >  delete mode 100644 bsd-user/openbsd/target_os_elf.h
> >  delete mode 100644 bsd-user/openbsd/target_os_siginfo.h
> >  delete mode 100644 bsd-user/openbsd/target_os_signal.h
> >  delete mode 100644 bsd-user/openbsd/target_os_stack.h
> >  delete mode 100644 bsd-user/openbsd/target_os_thread.h
> >
> > --
> > 2.39.2
> >
>

--0000000000003787cd05f8461f85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">These haven&#39;t even compiled in years. Last time I pol=
led the NetBSD and OpenBSD communities they weren&#39;t using this and had =
no plans to fix.<div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;d be ha=
ppy to work with anybody that wanted to fix that state of affairs.<br><div =
dir=3D"auto"><br></div><div dir=3D"auto">Warner</div></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 1, 2=
023, 7:00 AM Reinoud Zandijk &lt;<a href=3D"mailto:reinoud@netbsd.org">rein=
oud@netbsd.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Dear =
Qemu folks,<br>
<br>
I&#39;ll throw it in the NetBSD group for feedback.<br>
<br>
With regards,<br>
Reinoud<br>
<br>
On Fri, Mar 31, 2023 at 08:18:26AM -0600, Warner Losh wrote:<br>
&gt; The NetBSD and OpenBSD support in bsd-user hasn&#39;t built since befo=
re the meson<br>
&gt; conversion. It&#39;s also out of sync with many of the recent changes =
in the<br>
&gt; bsd-user fork and has just been removed there. Remove it from master f=
or the<br>
&gt; same reasons: it generates a number of false positives with grep and h=
as<br>
&gt; increasingly gotten in the way. The bsd-user fork code is much more ad=
vanced,<br>
&gt; and even it doesn&#39;t compile and is out of date. Remove this from b=
oth<br>
&gt; branches. If others wish to bring it up to speed, I&#39;m happy to hel=
p them.<br>
&gt; <br>
&gt; Warner Losh (7):<br>
&gt;=C2=A0 =C2=A0bsd-user: Remove obsolete prototypes<br>
&gt;=C2=A0 =C2=A0bsd-user: Remove netbsd system call inclusion and defines<=
br>
&gt;=C2=A0 =C2=A0bsd-user: Remove netbsd system call tracing<br>
&gt;=C2=A0 =C2=A0bsd-user: Remove openbsd system call inclusion and defines=
<br>
&gt;=C2=A0 =C2=A0bsd-user: Remove openbsd system call tracing<br>
&gt;=C2=A0 =C2=A0bsd-user: Remove netbsd directory<br>
&gt;=C2=A0 =C2=A0bsd-user: Remove openbsd directory<br>
&gt; <br>
&gt;=C2=A0 bsd-user/netbsd/host-os.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 25 --<br>
&gt;=C2=A0 bsd-user/netbsd/os-strace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 -<br>
&gt;=C2=A0 bsd-user/netbsd/strace.list=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
145 -----------<br>
&gt;=C2=A0 bsd-user/netbsd/syscall_nr.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
373 ---------------------------<br>
&gt;=C2=A0 bsd-user/netbsd/target_os_elf.h=C2=A0 =C2=A0 =C2=A0 | 147 ------=
-----<br>
&gt;=C2=A0 bsd-user/netbsd/target_os_siginfo.h=C2=A0 |=C2=A0 82 ------<br>
&gt;=C2=A0 bsd-user/netbsd/target_os_signal.h=C2=A0 =C2=A0|=C2=A0 69 -----<=
br>
&gt;=C2=A0 bsd-user/netbsd/target_os_stack.h=C2=A0 =C2=A0 |=C2=A0 56 ----<b=
r>
&gt;=C2=A0 bsd-user/netbsd/target_os_thread.h=C2=A0 =C2=A0|=C2=A0 25 --<br>
&gt;=C2=A0 bsd-user/openbsd/host-os.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 25 --<br>
&gt;=C2=A0 bsd-user/openbsd/os-strace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 -<br>
&gt;=C2=A0 bsd-user/openbsd/strace.list=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
187 --------------<br>
&gt;=C2=A0 bsd-user/openbsd/syscall_nr.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 225 -=
---------------<br>
&gt;=C2=A0 bsd-user/openbsd/target_os_elf.h=C2=A0 =C2=A0 =C2=A0| 147 ------=
-----<br>
&gt;=C2=A0 bsd-user/openbsd/target_os_siginfo.h |=C2=A0 82 ------<br>
&gt;=C2=A0 bsd-user/openbsd/target_os_signal.h=C2=A0 |=C2=A0 69 -----<br>
&gt;=C2=A0 bsd-user/openbsd/target_os_stack.h=C2=A0 =C2=A0|=C2=A0 56 ----<b=
r>
&gt;=C2=A0 bsd-user/openbsd/target_os_thread.h=C2=A0 |=C2=A0 25 --<br>
&gt;=C2=A0 bsd-user/qemu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 --<br>
&gt;=C2=A0 bsd-user/strace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 34 ---<br>
&gt;=C2=A0 bsd-user/syscall_defs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 29 +--<br>
&gt;=C2=A0 21 files changed, 1 insertion(+), 1818 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 bsd-user/netbsd/host-os.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/netbsd/os-strace.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/netbsd/strace.list<br>
&gt;=C2=A0 delete mode 100644 bsd-user/netbsd/syscall_nr.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/netbsd/target_os_elf.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/netbsd/target_os_siginfo.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/netbsd/target_os_signal.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/netbsd/target_os_stack.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/netbsd/target_os_thread.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/openbsd/host-os.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/openbsd/os-strace.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/openbsd/strace.list<br>
&gt;=C2=A0 delete mode 100644 bsd-user/openbsd/syscall_nr.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/openbsd/target_os_elf.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/openbsd/target_os_siginfo.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/openbsd/target_os_signal.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/openbsd/target_os_stack.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/openbsd/target_os_thread.h<br>
&gt; <br>
&gt; -- <br>
&gt; 2.39.2<br>
&gt; <br>
</blockquote></div>

--0000000000003787cd05f8461f85--

