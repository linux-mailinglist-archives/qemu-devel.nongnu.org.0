Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0723BAD65
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 16:29:55 +0200 (CEST)
Received: from localhost ([::1]:35724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0386-0003mt-Eh
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 10:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m037N-000369-PM
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 10:29:09 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:45019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m037M-0006H7-3t
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 10:29:09 -0400
Received: by mail-vs1-xe32.google.com with SMTP id y21so8654502vsm.11
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1jYcIGZb1iXQHNOZC4STf858/BJfktl1CXTbiUO4wUQ=;
 b=FvTbA0cwUiK3Q1eJoSkHztBgvEMirQn+7Y+arGQRZrXV8C0HcKyRCCU/QllY5CqCAW
 L4QIbsycGevH0jxeHuUD0NeYcwU4NL544NR5agaPY/1zZRyKr4f4twd5mkggYNvuQN2T
 5UeDjmHrg9LMThHE1n30pvdtiA1+5c1XnTpFlJ/JZDuFT8+w58+XxD8v/XqrbTvqmyF8
 jPzovSf0XZNXC+flzeNO/2KdVCKKN9gCg86TMO2QJdp2Q8PcSRPAnKLs67hgb8YkJxU1
 kpf2SW8lkW92l38we61nB5ndFK1V5U4fF+kE1OqmKsOWZqrw/EOwZDhGKfTZJmIfNpWI
 8RKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1jYcIGZb1iXQHNOZC4STf858/BJfktl1CXTbiUO4wUQ=;
 b=tp8LCKdQTDbCwWiPrpmtBtl8QgmHDEVbM/RFG5JnsRSEECd36XkHdlu1C5d6yJkndS
 XADo88yhChkPAB9aWBslZh0lKvCQohGfI5NBw8Z+OWzKJK0xr1gCN1TavqUZpJl4J32K
 vb7TxOmU+X1iteYR4kH+sbkFbzoTRRPbB4iOpIyJgDkiXUuhRo/tUu5nSpYXX6C8tB2p
 k9F7p5SX4w2NNMtljiKLCdWTxlXWg+KTSqjefeH3NLIHtq3ipZEYZb8Oj9EC66SGsm+0
 EyvWg7PFWXNrm19JUYXgN3rcPHQKkF4yQMYA7H/l5YKHTp7+tyKYuUDGKhyJKXTaqJuK
 xtrA==
X-Gm-Message-State: AOAM531ADWpEriD8iA7r7grwMpKXRBBFGAWyROlZUwi6cwCwmYjm9JEO
 wZMIyBN1EoqQKAmwsD92doxcJHMmNRK8zoi3r+i48KNfX/4=
X-Google-Smtp-Source: ABdhPJxKRnonvE1Bdj0LYb2GJj+Or8LQCXSvTsSxscV9wLIPJsrm1rfXd/YsA1DaW2ZNOvbDR4jfOxnXWZygnbS/fb8=
X-Received: by 2002:a67:7d06:: with SMTP id y6mr6843223vsc.1.1625408946877;
 Sun, 04 Jul 2021 07:29:06 -0700 (PDT)
MIME-Version: 1.0
From: Richard Zak <richard.j.zak@gmail.com>
Date: Sun, 4 Jul 2021 10:28:56 -0400
Message-ID: <CAOakUfM6HED-01ntpHTGXuQVg8XX4QnwacE=+eho_NOdQsKfvw@mail.gmail.com>
Subject: [PATCH 2/2 v2] Fix SHELL variable in Makefile for Haiku
To: QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000e4bade05c64d0278"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=richard.j.zak@gmail.com; helo=mail-vs1-xe32.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e4bade05c64d0278
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Richard Zak <richard.j.zak@gmail.com>
---
 Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 30f19d33bb..37124410da 100644
--- a/Makefile
+++ b/Makefile
@@ -14,7 +14,13 @@ SRC_PATH=.
 # we have explicit rules for everything
 MAKEFLAGS += -rR

-SHELL = /usr/bin/env bash -o pipefail
+# Detect Haiku by checking BeOS variable for host CPU type
+ifneq ($(BE_HOST_CPU),)
+  # Haiku doesn't have the /usr directory
+  SHELL = /bin/env bash -o pipefail
+else
+  SHELL = /usr/bin/env bash -o pipefail
+endif

 # Usage: $(call quiet-command,command and args,"NAME","args to print")
 # This will run "command and args", and either:
-- 
2.25.1


-- 
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--000000000000e4bade05c64d0278
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Signed-off-by: Richard Zak &lt;<a href=3D"mailto:richard.j=
.zak@gmail.com">richard.j.zak@gmail.com</a>&gt;<br>---<br>=C2=A0Makefile | =
8 +++++++-<br>=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br><br>d=
iff --git a/Makefile b/Makefile<br>index 30f19d33bb..37124410da 100644<br>-=
-- a/Makefile<br>+++ b/Makefile<br>@@ -14,7 +14,13 @@ SRC_PATH=3D.<br>=C2=
=A0# we have explicit rules for everything<br>=C2=A0MAKEFLAGS +=3D -rR<br>=
=C2=A0<br>-SHELL =3D /usr/bin/env bash -o pipefail<br>+# Detect Haiku by ch=
ecking BeOS variable for host CPU type<br>+ifneq ($(BE_HOST_CPU),)<br>+ =C2=
=A0# Haiku doesn&#39;t have the /usr directory<br>+ =C2=A0SHELL =3D /bin/en=
v bash -o pipefail<br>+else<br>+ =C2=A0SHELL =3D /usr/bin/env bash -o pipef=
ail<br>+endif<br>=C2=A0<br>=C2=A0# Usage: $(call quiet-command,command and =
args,&quot;NAME&quot;,&quot;args to print&quot;)<br>=C2=A0# This will run &=
quot;command and args&quot;, and either:<br>-- <br>2.25.1<br><br clear=3D"a=
ll"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"l=
tr"><div>Regards,<br><br>Richard J. Zak<br>Professional Genius</div><div>PG=
P Key:=C2=A0<a href=3D"https://keybase.io/rjzak/key.asc" target=3D"_blank">=
https://keybase.io/rjzak/key.asc</a></div></div></div></div></div></div></d=
iv></div>

--000000000000e4bade05c64d0278--

