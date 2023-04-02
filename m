Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFC76D3A5E
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 23:02:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj4pP-0004A1-6R; Sun, 02 Apr 2023 17:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pj4pM-00049Q-U4
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 17:01:28 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pj4pK-0001Sy-EC
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 17:01:28 -0400
Received: by mail-ed1-x52c.google.com with SMTP id y4so109867698edo.2
 for <qemu-devel@nongnu.org>; Sun, 02 Apr 2023 14:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680469283;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rUSz1vgQ1lAvTNjerK9GNCSAwixNCRsjFPjwFDoT8SQ=;
 b=6ReD7w6HAgXP3EFoQZ6WxM+WCMOEme42n4+jHyqashLK8CmbtpNv5P5gryU/dqiVhe
 EmKkhtQW2YJKgZ/+BNzdgxpjzlmm4yb58JjR3j90KdPpOXNjYvfURfLlQ4X4c2MRzmQT
 lNORfKLxI/F/XIbJAtWFc9HUhHllQXnKvu58Ks2jXhGtMpKd8PWncuI2lLS5lf7eji9g
 rQSt3/Z5WF1FTw50mWE7/Abj1L71ZsA0lVD6WruzoUp2cHo/5+3v9+v8uKWxtFpZQ5ev
 YOzKlqmtdy7mUX5XwRr9WYkMbHspp3J1q8Ql0Vqs2XgefMxcL7EooWLyzaow5M6gIdFe
 goOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680469283;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rUSz1vgQ1lAvTNjerK9GNCSAwixNCRsjFPjwFDoT8SQ=;
 b=N8ZyyGwqmewZ614SfiQO0mkcBeIghDlZGlhfaJk4BkbJ07grfAUmC4ntJO9/jHlHUX
 /yRM/tqKUmDSdzOamkFyeRQHQ2GzVqto2CT/jFCRQ8J8kXwx8Lc7WJiMj7X/7dQfBNAC
 Tt9hHfSO1XymoL9s5Sp5uP8bwnyyVjWJDxDbozRmAtdNsDwlPo9v3cbQVKUrMBbnWghJ
 B8E6svu0f4ozWEKZd4WtMyC29+Omkzp5d1tcyzZin8U/6cYWqa0GWEyy+aDAdaFLztLy
 IykEtlli/XIy8gC/2Ru1Q2UGTrA1FFqipVX8+o+Bs+ShtrNRLgFkSbOKYBUIHRPpSp/O
 Yu2w==
X-Gm-Message-State: AAQBX9dYU0ru5YHVYfeS4XYLj0awC/kWzSUVPyXW+quchWn8n/XEH8iu
 LGqx1b92cSHTC8d9ZZmwZPNlm8v3Z3Ri5n2znTAlEsYOEQX4nyzX
X-Google-Smtp-Source: AKy350bhGF5lp6sos5OCgz2qBwH1m5/ei/bAE/OW8FYaZ/A8Xd+HFbtpVod5sWDztR1BBQHI4YubLWxn/CIGVGMwJCs=
X-Received: by 2002:a17:906:3505:b0:931:faf0:3db1 with SMTP id
 r5-20020a170906350500b00931faf03db1mr7799728eja.4.1680469283510; Sun, 02 Apr
 2023 14:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230331141833.3647-1-imp@bsdimp.com>
In-Reply-To: <20230331141833.3647-1-imp@bsdimp.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 2 Apr 2023 15:01:21 -0600
Message-ID: <CANCZdfpOazKjB5+irfgTT8TPbQbHhN5PuqAS6-DE=PiyHmb3WA@mail.gmail.com>
Subject: Re: [PATCH 0/7] bsd-user: remove bitrotted NetBSD and OpenBSD
 bsd-user support
To: qemu-devel@nongnu.org
Cc: Ryo ONODERA <ryoon@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Brad Smith <brad@comstyle.com>, 
 Kyle Evans <kevans@freebsd.org>, Taylor R Campbell <riastradh@netbsd.org>
Content-Type: multipart/alternative; boundary="000000000000b32cdb05f860bedc"
Received-SPF: none client-ip=2a00:1450:4864:20::52c;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x52c.google.com
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

--000000000000b32cdb05f860bedc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After consulting with Taylor Campbell, I'm going to hold off on this for
now. He had some code to start to fix things, which I hope he can find time
and energy to port over to the (more complete) qemu-bsd-user upstream so
that there's one target for people working on the area that will eventually
become what's in qemu-project's master branch.

I'll replace this series with some other changes that try to accomplish the
same base goals.

Warner

On Fri, Mar 31, 2023 at 8:19=E2=80=AFAM Warner Losh <imp@bsdimp.com> wrote:

> The NetBSD and OpenBSD support in bsd-user hasn't built since before the
> meson
> conversion. It's also out of sync with many of the recent changes in the
> bsd-user fork and has just been removed there. Remove it from master for
> the
> same reasons: it generates a number of false positives with grep and has
> increasingly gotten in the way. The bsd-user fork code is much more
> advanced,
> and even it doesn't compile and is out of date. Remove this from both
> branches. If others wish to bring it up to speed, I'm happy to help them.
>
> Warner Losh (7):
>   bsd-user: Remove obsolete prototypes
>   bsd-user: Remove netbsd system call inclusion and defines
>   bsd-user: Remove netbsd system call tracing
>   bsd-user: Remove openbsd system call inclusion and defines
>   bsd-user: Remove openbsd system call tracing
>   bsd-user: Remove netbsd directory
>   bsd-user: Remove openbsd directory
>
>  bsd-user/netbsd/host-os.h            |  25 --
>  bsd-user/netbsd/os-strace.h          |   1 -
>  bsd-user/netbsd/strace.list          | 145 -----------
>  bsd-user/netbsd/syscall_nr.h         | 373 ---------------------------
>  bsd-user/netbsd/target_os_elf.h      | 147 -----------
>  bsd-user/netbsd/target_os_siginfo.h  |  82 ------
>  bsd-user/netbsd/target_os_signal.h   |  69 -----
>  bsd-user/netbsd/target_os_stack.h    |  56 ----
>  bsd-user/netbsd/target_os_thread.h   |  25 --
>  bsd-user/openbsd/host-os.h           |  25 --
>  bsd-user/openbsd/os-strace.h         |   1 -
>  bsd-user/openbsd/strace.list         | 187 --------------
>  bsd-user/openbsd/syscall_nr.h        | 225 ----------------
>  bsd-user/openbsd/target_os_elf.h     | 147 -----------
>  bsd-user/openbsd/target_os_siginfo.h |  82 ------
>  bsd-user/openbsd/target_os_signal.h  |  69 -----
>  bsd-user/openbsd/target_os_stack.h   |  56 ----
>  bsd-user/openbsd/target_os_thread.h  |  25 --
>  bsd-user/qemu.h                      |  16 --
>  bsd-user/strace.c                    |  34 ---
>  bsd-user/syscall_defs.h              |  29 +--
>  21 files changed, 1 insertion(+), 1818 deletions(-)
>  delete mode 100644 bsd-user/netbsd/host-os.h
>  delete mode 100644 bsd-user/netbsd/os-strace.h
>  delete mode 100644 bsd-user/netbsd/strace.list
>  delete mode 100644 bsd-user/netbsd/syscall_nr.h
>  delete mode 100644 bsd-user/netbsd/target_os_elf.h
>  delete mode 100644 bsd-user/netbsd/target_os_siginfo.h
>  delete mode 100644 bsd-user/netbsd/target_os_signal.h
>  delete mode 100644 bsd-user/netbsd/target_os_stack.h
>  delete mode 100644 bsd-user/netbsd/target_os_thread.h
>  delete mode 100644 bsd-user/openbsd/host-os.h
>  delete mode 100644 bsd-user/openbsd/os-strace.h
>  delete mode 100644 bsd-user/openbsd/strace.list
>  delete mode 100644 bsd-user/openbsd/syscall_nr.h
>  delete mode 100644 bsd-user/openbsd/target_os_elf.h
>  delete mode 100644 bsd-user/openbsd/target_os_siginfo.h
>  delete mode 100644 bsd-user/openbsd/target_os_signal.h
>  delete mode 100644 bsd-user/openbsd/target_os_stack.h
>  delete mode 100644 bsd-user/openbsd/target_os_thread.h
>
> --
> 2.39.2
>
>

--000000000000b32cdb05f860bedc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>After consulting with Taylor Campbell, I&#39;m going =
to hold off on this for now. He had some code to start to fix things, which=
 I hope he can find time and energy to port over to the (more complete) qem=
u-bsd-user upstream so that there&#39;s one target for people working on th=
e area that will eventually become what&#39;s in qemu-project&#39;s master =
branch.</div><div><br></div><div>I&#39;ll replace this series with some oth=
er changes that try to accomplish the same base goals.</div><div><br></div>=
<div>Warner<br> </div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Fri, Mar 31, 2023 at 8:19=E2=80=AFAM Warner Losh &=
lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">The NetBSD and OpenBSD s=
upport in bsd-user hasn&#39;t built since before the meson<br>
conversion. It&#39;s also out of sync with many of the recent changes in th=
e<br>
bsd-user fork and has just been removed there. Remove it from master for th=
e<br>
same reasons: it generates a number of false positives with grep and has<br=
>
increasingly gotten in the way. The bsd-user fork code is much more advance=
d,<br>
and even it doesn&#39;t compile and is out of date. Remove this from both<b=
r>
branches. If others wish to bring it up to speed, I&#39;m happy to help the=
m.<br>
<br>
Warner Losh (7):<br>
=C2=A0 bsd-user: Remove obsolete prototypes<br>
=C2=A0 bsd-user: Remove netbsd system call inclusion and defines<br>
=C2=A0 bsd-user: Remove netbsd system call tracing<br>
=C2=A0 bsd-user: Remove openbsd system call inclusion and defines<br>
=C2=A0 bsd-user: Remove openbsd system call tracing<br>
=C2=A0 bsd-user: Remove netbsd directory<br>
=C2=A0 bsd-user: Remove openbsd directory<br>
<br>
=C2=A0bsd-user/netbsd/host-os.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 25 --<br>
=C2=A0bsd-user/netbsd/os-strace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A01 -<br>
=C2=A0bsd-user/netbsd/strace.list=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 145 -=
----------<br>
=C2=A0bsd-user/netbsd/syscall_nr.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 373 -=
--------------------------<br>
=C2=A0bsd-user/netbsd/target_os_elf.h=C2=A0 =C2=A0 =C2=A0 | 147 -----------=
<br>
=C2=A0bsd-user/netbsd/target_os_siginfo.h=C2=A0 |=C2=A0 82 ------<br>
=C2=A0bsd-user/netbsd/target_os_signal.h=C2=A0 =C2=A0|=C2=A0 69 -----<br>
=C2=A0bsd-user/netbsd/target_os_stack.h=C2=A0 =C2=A0 |=C2=A0 56 ----<br>
=C2=A0bsd-user/netbsd/target_os_thread.h=C2=A0 =C2=A0|=C2=A0 25 --<br>
=C2=A0bsd-user/openbsd/host-os.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 25 --<br>
=C2=A0bsd-user/openbsd/os-strace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A01 -<br>
=C2=A0bsd-user/openbsd/strace.list=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 187 -=
-------------<br>
=C2=A0bsd-user/openbsd/syscall_nr.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 225 ------=
----------<br>
=C2=A0bsd-user/openbsd/target_os_elf.h=C2=A0 =C2=A0 =C2=A0| 147 -----------=
<br>
=C2=A0bsd-user/openbsd/target_os_siginfo.h |=C2=A0 82 ------<br>
=C2=A0bsd-user/openbsd/target_os_signal.h=C2=A0 |=C2=A0 69 -----<br>
=C2=A0bsd-user/openbsd/target_os_stack.h=C2=A0 =C2=A0|=C2=A0 56 ----<br>
=C2=A0bsd-user/openbsd/target_os_thread.h=C2=A0 |=C2=A0 25 --<br>
=C2=A0bsd-user/qemu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 --<br>
=C2=A0bsd-user/strace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 34 ---<br>
=C2=A0bsd-user/syscall_defs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 29 +--<br>
=C2=A021 files changed, 1 insertion(+), 1818 deletions(-)<br>
=C2=A0delete mode 100644 bsd-user/netbsd/host-os.h<br>
=C2=A0delete mode 100644 bsd-user/netbsd/os-strace.h<br>
=C2=A0delete mode 100644 bsd-user/netbsd/strace.list<br>
=C2=A0delete mode 100644 bsd-user/netbsd/syscall_nr.h<br>
=C2=A0delete mode 100644 bsd-user/netbsd/target_os_elf.h<br>
=C2=A0delete mode 100644 bsd-user/netbsd/target_os_siginfo.h<br>
=C2=A0delete mode 100644 bsd-user/netbsd/target_os_signal.h<br>
=C2=A0delete mode 100644 bsd-user/netbsd/target_os_stack.h<br>
=C2=A0delete mode 100644 bsd-user/netbsd/target_os_thread.h<br>
=C2=A0delete mode 100644 bsd-user/openbsd/host-os.h<br>
=C2=A0delete mode 100644 bsd-user/openbsd/os-strace.h<br>
=C2=A0delete mode 100644 bsd-user/openbsd/strace.list<br>
=C2=A0delete mode 100644 bsd-user/openbsd/syscall_nr.h<br>
=C2=A0delete mode 100644 bsd-user/openbsd/target_os_elf.h<br>
=C2=A0delete mode 100644 bsd-user/openbsd/target_os_siginfo.h<br>
=C2=A0delete mode 100644 bsd-user/openbsd/target_os_signal.h<br>
=C2=A0delete mode 100644 bsd-user/openbsd/target_os_stack.h<br>
=C2=A0delete mode 100644 bsd-user/openbsd/target_os_thread.h<br>
<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div>

--000000000000b32cdb05f860bedc--

