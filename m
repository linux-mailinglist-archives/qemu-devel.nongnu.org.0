Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD213BAA4D
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 23:13:30 +0200 (CEST)
Received: from localhost ([::1]:54700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzmx7-0008G6-Il
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 17:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1lzmw5-00074K-Gy
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 17:12:25 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:45738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1lzmw3-0006OB-Np
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 17:12:25 -0400
Received: by mail-vs1-xe35.google.com with SMTP id h5so6187521vsg.12
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 14:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=A5l24x0DsF6gU7gfTAmRSK6Od/iwEzK25LQ21I2EdZU=;
 b=rKX2STC9ddwI3dyFiOceoLgqTf4INGn9pK2Zu/ZGUoCAeCpWC+L+8T1g78GV4A3Q4n
 /a3rjTrOp73R4NzJwUIiX4EGqcQqq2E5jhSLu5oVboUKgzUv/96BJTfAv+EvfLk1LrQs
 bBLSWD/Zkx86B9uHgecf9SDlq+vztaFSF00yC2nFc+gz8YKd5IgFX6kZSx8lXJU5Qfbp
 4QT3QKtWOIm39XPHWe8MOHSVE36GN7g5MH6nk5dg6cD1P1IvQJTIGiRQh0w4V8gBtl9J
 ks+tLcM0rCNj3CJFUTy3BOVKhzw0PCeI/RL9wlnqAuUKt6iFRAGlHSIXESoRTSI30ZDz
 GpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=A5l24x0DsF6gU7gfTAmRSK6Od/iwEzK25LQ21I2EdZU=;
 b=s8PYGkA1izhn9LA1ZdsIAJ7lI3xKiRqPRE3PFhD7SdfM2Rv8jvBN1sD0OivvlC9Vg7
 DchzkXXMtLhPTm30rPkh4TPCzDIFHW46dB7M0wHnvQIgINpg7PYf9TVFA8k3zEHV5MTC
 J0ub8h7pOQmevcAwu1o+YAj2n0JmNWR+olEfx/P80hf49tuUTut9PKw+LAYSFADTdAVA
 4K08H7Ew63E3RJRfEB4Rof/JGCCnYqVvzRgpCZapWLr2IXZ/qjtqvKCcR9njzbue81Ao
 rlP4LRPaMkUoCVyoJaFH/xQMSLojC9k9rzUCG4R6JYQ0ECWsYo0aRGdEupBfujiTp7K0
 9CMQ==
X-Gm-Message-State: AOAM532b/qeSYd/ke10/R7JKw85X8z399tTiYp3asGAOh7vd/JFHpcyP
 q3ogj7mzY/dawUJ8Of959FdBhCGAz10mj4v29dvoC9khymI=
X-Google-Smtp-Source: ABdhPJyZqz5oREMxmgcxhfswVGM+AO+euXbLFZ1LnhIKMwXnUANKwMxA46hoqFCGI5VT3P1LZ9Q8dYoKsS6vVqDowOc=
X-Received: by 2002:a67:ebda:: with SMTP id y26mr5138020vso.25.1625346742876; 
 Sat, 03 Jul 2021 14:12:22 -0700 (PDT)
MIME-Version: 1.0
From: Richard Zak <richard.j.zak@gmail.com>
Date: Sat, 3 Jul 2021 17:12:12 -0400
Message-ID: <CAOakUfOz=89WuCyAQhrebNj_K_3_2ZYAJ_=aRR2bAuKT5=9uow@mail.gmail.com>
Subject: [PATCH 2/2] Fix for Haiku
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000003efdf405c63e87d9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=richard.j.zak@gmail.com; helo=mail-vs1-xe35.google.com
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

--0000000000003efdf405c63e87d9
Content-Type: text/plain; charset="UTF-8"

Fix for path to env

Signed-off-by: Richard Zak <richard.j.zak@gmail.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 30f19d33bb..ced9b97372 100644
--- a/Makefile
+++ b/Makefile
@@ -14,7 +14,11 @@ SRC_PATH=.
 # we have explicit rules for everything
 MAKEFLAGS += -rR

+ifneq ($(BE_HOST_CPU),)
+SHELL = /bin/env bash -o pipefail
+else
 SHELL = /usr/bin/env bash -o pipefail
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

--0000000000003efdf405c63e87d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Fix for path to env <br></div><div><br></div><div>Sig=
ned-off-by: Richard Zak &lt;<a href=3D"mailto:richard.j.zak@gmail.com">rich=
ard.j.zak@gmail.com</a>&gt;</div>---<br>=C2=A0Makefile | 4 ++++<br>=C2=A01 =
file changed, 4 insertions(+)<br><br>diff --git a/Makefile b/Makefile<br>in=
dex 30f19d33bb..ced9b97372 100644<br>--- a/Makefile<br>+++ b/Makefile<br>@@=
 -14,7 +14,11 @@ SRC_PATH=3D.<br>=C2=A0# we have explicit rules for everyth=
ing<br>=C2=A0MAKEFLAGS +=3D -rR<br>=C2=A0<br>+ifneq ($(BE_HOST_CPU),)<br>+S=
HELL =3D /bin/env bash -o pipefail<br>+else<br>=C2=A0SHELL =3D /usr/bin/env=
 bash -o pipefail<br>+endif<br>=C2=A0<br>=C2=A0# Usage: $(call quiet-comman=
d,command and args,&quot;NAME&quot;,&quot;args to print&quot;)<br>=C2=A0# T=
his will run &quot;command and args&quot;, and either:<br>-- <br>2.25.1<br =
clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-sm=
artmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><di=
v dir=3D"ltr"><div>Regards,<br><br>Richard J. Zak<br>Professional Genius</d=
iv><div>PGP Key:=C2=A0<a href=3D"https://keybase.io/rjzak/key.asc" target=
=3D"_blank">https://keybase.io/rjzak/key.asc</a></div></div></div></div></d=
iv></div></div></div>

--0000000000003efdf405c63e87d9--

