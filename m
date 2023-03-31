Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3ED6D2248
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 16:23:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piFdr-0003PK-IR; Fri, 31 Mar 2023 10:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1piFdo-0003PA-Q4
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:22:09 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1piFdm-0003bi-N7
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:22:08 -0400
Received: by mail-ed1-x534.google.com with SMTP id y4so90330787edo.2
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 07:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680272524;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bP/V2ZDBY/0fyyYWFud1XH7A1r53moBzmCMCi+IXFmg=;
 b=j1PXNKVBXNkTdbXxCj0xqwCrVGZHPYiRlhQXPCe+hMb/zZ+CeZXDFbCZuCkkhFcsg8
 cv/XehOZfUmTE1ZJZEq7eLvdJApISwtEgPSbn9xTs/Y7t4jJYkcxgYuo6okkcgmm2ydE
 SQF/Xu414pjU6ojpH+OeyvxGZN6kQ0jSZCFoQQ84GL0hlwL6IyUHPBWqQIeArJp7z9rF
 M7DprJoihTJch92urInKZFH5Gf6YMbtrEzS0R3B7NLhvmhXWOexUT1yyGC1kqE5JHxTB
 zSchGF17Ts0BvfMdcAaec/8Yw9yBaRRwh8FFIeN3NFC/pw8ZHyPXPR0yWOJhHz9AL/dB
 KKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680272524;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bP/V2ZDBY/0fyyYWFud1XH7A1r53moBzmCMCi+IXFmg=;
 b=jyLd6u5ctN+YtaCZMR+SAaRe++m4K0e1wrDwqGRUQOPlIU4gsstqkS3L9hL3UdEzcf
 POgEKYztQ008CUSA05SckuFX3ENibskowV73Z9eRP3xRSUeHgCXY2vUd0KLqzvaMOg7r
 j8wtDSDALs6gl2CpZEaH3G3TMlty4t1WAxkwqsGmQUrqjoFXoiWc2eVkfFtF7SSeirsv
 1y6jK3RGy6iSHFeDj2vTXnmPSivxfaaI56zdr+EssYu3DD5+T+VWfxAAW4DJtXjwwitX
 jPwCcEaDHoPT7fHo3uSRh/fA0XoEwdlUDNV7YEf3EKFWd1J5qxze+uTsE0SbDwk1APrm
 JuOw==
X-Gm-Message-State: AAQBX9cER4zdfj2uNnQGlfSqUusTLvo0fz8nERybTEjHy+EpZRmcEOMM
 g5bUVBaCzxRitUfgDLUmYCt29zA70ORkT+qbGpAIgIMMBxQNfDfH
X-Google-Smtp-Source: AKy350ZIrBg8CPNYHD2CGXLx8/L1ZGjNR9IK1+aKS9TTwZgKoHvA24gLVgZeZm0JkPy1l7CDbVHzT5ZK470fmqakvvA=
X-Received: by 2002:a17:906:9f0b:b0:8b1:38d6:9853 with SMTP id
 fy11-20020a1709069f0b00b008b138d69853mr12376438ejc.2.1680272524458; Fri, 31
 Mar 2023 07:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230331141833.3647-1-imp@bsdimp.com>
In-Reply-To: <20230331141833.3647-1-imp@bsdimp.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 31 Mar 2023 08:21:53 -0600
Message-ID: <CANCZdfrV5kObU7_G3bAkgmbna2ZmXG0SC9c-V-xUcOK88t2cpw@mail.gmail.com>
Subject: Re: [PATCH 0/7] bsd-user: remove bitrotted NetBSD and OpenBSD
 bsd-user support
To: qemu-devel@nongnu.org
Cc: Ryo ONODERA <ryoon@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000f2518505f832ee34"
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

--000000000000f2518505f832ee34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please note: This did come from me, from a new machine that's slightly
misconfigured, so it didn't go through Google's email server and so you may
get a spoofing warning. I'll fix that in v2, if there is one, or in the
pull request if there's no changes.

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

--000000000000f2518505f832ee34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please note: This did come from me, from a new machine tha=
t&#39;s slightly misconfigured, so it didn&#39;t go through Google&#39;s em=
ail server and so you may get a spoofing=C2=A0warning. I&#39;ll fix that in=
 v2, if there is one, or in the pull request if there&#39;s no changes.<div=
><br></div><div>Warner</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Mar 31, 2023 at 8:19=E2=80=AFAM Warne=
r Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">The NetBSD and O=
penBSD support in bsd-user hasn&#39;t built since before the meson<br>
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

--000000000000f2518505f832ee34--

