Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8CA3096E2
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 17:49:02 +0100 (CET)
Received: from localhost ([::1]:43542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5tQi-0007jl-Vn
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 11:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l5tOf-0007BG-6e
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 11:46:54 -0500
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:37488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l5tOc-000526-2w
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 11:46:52 -0500
Received: by mail-qk1-x733.google.com with SMTP id n7so11972281qkc.4
 for <qemu-devel@nongnu.org>; Sat, 30 Jan 2021 08:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=yorm0WoB1wHqTvy0vDkemN4oya7bJMkQbGbpn8/8nps=;
 b=mW2+nNlLnmFJnxJa0OZQAH5IP/ciyy23StzOjjP7GX5dHuSV7bkSwOweRPXU3jmxCH
 rHp0l45Vks9JusawRL4AGOJ0CNABjxfyvQgU0FnBpTefiYtOW4uFjZEuvVN4pfe0+8XR
 N99q1BlTG9yNpf1x9GwhTSAgZzoR9TJ9+H4YIQxU7wFdU23NB+GErSq2wsl5zI3N1ht/
 /G5MKieugmY2t05Flm6nPGzys4axmEKgo538WAxd7ddvGqa3MBhmjRhgE5jniT7QTpQ7
 9B2Q8pVBpgclmUEevvMxIq6gF+aALC44u3QECD/8GFoAFRL+/J7BqPbAsgLQ17Q949m1
 /dbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yorm0WoB1wHqTvy0vDkemN4oya7bJMkQbGbpn8/8nps=;
 b=AS10odauyzGsmL3UYMCiUx05JYZOfPXVpNlWc8Ts9OfP+ZcTha1/JjGy8opTMzAbjA
 Fg5/wvnJLjtmvgqZOpG8ZhQKXUJhKb/ZXTsunJonN+AA3B8LZD4de10LwJa1X2JOY81x
 Vec1C64W9nkeNRaYDFoJ5aab+xRcx351vqvfNCfPDM+QwoAxNtNPkk7crtHfqPUK9xOM
 JCcLhUIDAKsBbOSLnkLBMpLqyfaDih056zbE65VHzKsa4PS2dd/t7ogduAiACpS8+IFn
 pbMYiHIe1n//+RbPytNsbFSwjmedxfrQrCIByfBoyz8966irUOFNXV7lp5cNcf9rH2gb
 etOg==
X-Gm-Message-State: AOAM532Y1r2CD8016w/XCEzqJAMcM9+93pvYspfHPcfSfWkURHa/e72r
 rJ6VId+IIcrpJUGEI0a5/mDMeQRTWdDdxJREpWWJ+yGEpBiVaQ1L
X-Google-Smtp-Source: ABdhPJx6WDfYg4lN+C++iPbq4EVp+ZtqmAJf+S8yXgLswkiYO7aB90enZan6peo9dI7+GQcRwPYp2WgprQVpEB7MEJ0=
X-Received: by 2002:ae9:f813:: with SMTP id x19mr9079710qkh.359.1612025207337; 
 Sat, 30 Jan 2021 08:46:47 -0800 (PST)
MIME-Version: 1.0
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 30 Jan 2021 09:46:36 -0700
Message-ID: <CANCZdfp7VDodG_-Po6r9t+-4YNWOMVQUOeoL1hTm4-C989qa0A@mail.gmail.com>
Subject: [PATCH] MAINTAINERS: update bsd-user maintainers
To: QEMU Developers <qemu-devel@nongnu.org>, Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000da476505ba20dde2"
Received-SPF: none client-ip=2607:f8b0:4864:20::733;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x733.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000da476505ba20dde2
Content-Type: text/plain; charset="UTF-8"

bsd-user: Add new mainatiners

The FreeBSD project has a number of enhancements to bsd-user. Add myself
as maintainer and Kyle Evans as a reviewer. Also add our github repo.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bcd88668bc..1b2c276eca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2845,9 +2845,12 @@ F: thunk.c
 F: accel/tcg/user-exec*.c

 BSD user
-S: Orphan
+M: Warner Losh <imp@bsdimp.com>
+R: Kyle Evans <kevans@freebsd.org>
+S: Maintained
 F: bsd-user/
 F: default-configs/*-bsd-user.mak
+T: git https://github.com/qemu-bsd-user/qemu-bse-user bsd-user-rebase-3.1

 Linux user
 M: Laurent Vivier <laurent@vivier.eu>
--
2.22.0

--000000000000da476505ba20dde2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">bsd-user: Add new mainatiners<br><br><div>The FreeBSD proj=
ect has a number of enhancements to bsd-user. Add myself<br>as maintainer a=
nd Kyle Evans as a reviewer. Also add our github repo.<br><br>Signed-off-by=
: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt;<=
br></div><div>---</div><div>=C2=A0MAINTAINERS | 5 ++++-<br>=C2=A01 file cha=
nged, 4 insertions(+), 1 deletion(-)<br></div><div><br></div><div>diff --gi=
t a/MAINTAINERS b/MAINTAINERS<br>index bcd88668bc..1b2c276eca 100644<br>---=
 a/MAINTAINERS<br>+++ b/MAINTAINERS<br>@@ -2845,9 +2845,12 @@ F: thunk.c<br=
>=C2=A0F: accel/tcg/user-exec*.c<br><br>=C2=A0BSD user<br>-S: Orphan<br>+M:=
 Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt;<b=
r>+R: Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org">kevans@freebsd.o=
rg</a>&gt;<br>+S: Maintained<br>=C2=A0F: bsd-user/<br>=C2=A0F: default-conf=
igs/*-bsd-user.mak<br>+T: git <a href=3D"https://github.com/qemu-bsd-user/q=
emu-bse-user">https://github.com/qemu-bsd-user/qemu-bse-user</a> bsd-user-r=
ebase-3.1<br><br>=C2=A0Linux user<br>=C2=A0M: Laurent Vivier &lt;<a href=3D=
"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&gt;<br></div><div>--</div>=
<div>2.22.0</div><div><br></div><div><br></div></div>

--000000000000da476505ba20dde2--

