Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDDD3CC009
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 02:18:05 +0200 (CEST)
Received: from localhost ([::1]:58006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Y1r-0001SJ-KW
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 20:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m4Y0M-0000lS-6p
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:16:30 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:37769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m4Y0K-0003Pb-8a
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:16:29 -0400
Received: by mail-vs1-xe36.google.com with SMTP id r18so6035312vsa.4
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 17:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ou1rmrpalrWP8MrGAL2HBFq3hs6JhaVzWJXLDIuVi50=;
 b=IBOc4xgCFPDRJeW4NAiQJq+QaYTOHXi+b5khkTntyw5M848Ou/Xji+3KwMmkfmyN+F
 tAD+YTwqyg7LhuPlXM8n74halM5YSILOhjCH9RBazG2fiewlBYNsMxQy6FrY978bNUL8
 62R7HDAiUr6fUCIAidR3rpCV4Dc6eagHkawXeGVOnACXXh9GfgnTlFrlMNKF23W5NvVn
 HpXsHt7+qY1Mw12v1X/jI7r6TV4XYHXQdulgai0y+3cF1P8PRVpPIZeYYekvwaxnxgp9
 MYWiuI2uhWxcJCY/JzRrzRX64lDtsJ/ea1V46ajc2b463ItzStdFFBZPN6ak3l8A7pCC
 hWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ou1rmrpalrWP8MrGAL2HBFq3hs6JhaVzWJXLDIuVi50=;
 b=m62Oq+QSAwZbSgJar4cMIjNW4pKqRChZqHbEJgpW2bCzMpXIsstD1ZMdCK5dgDdfbF
 6N9zoskNM/qdEpiDyHsqq4/4VOcUnmUWE5ycVoAc4UXJYuBWuqAKj0eaK9irvTNW5mH6
 +eeWQZNVzOmz9IwBRnlpa7vMm5KVt2juH9sBIczhEP46CzRwbmtTW0mUuJzyrkBGF6R+
 Ogvw2iGNU+s0h9JjIY4khshJ+fCjHAlGJRiscR+ok266OWK0SF3gMWhJTotzQif4ofzW
 prCvCMV4fL58EVka3rG2TbnmJ2ZB3YYlFbg8Epol/lBURLMfMqCeN0SoatV2ldfG7tRV
 Bb8w==
X-Gm-Message-State: AOAM532PMWeCzfvx4vsbICIwqQRZCNUpRGjXOMuLycEQmvsbgwu/vPv/
 72+VpJecxtOIFXToI9TexqnU0tgmHo8UbVwPhss3vS89cfE=
X-Google-Smtp-Source: ABdhPJz3TKd6MWQ3jayElwaQXuBU+sqnuqxubDmOYoZ0/hB9lBq5jf7Pt5AGuufjdfmHjFFmLaP0bWKFe6K/Fy2PyaI=
X-Received: by 2002:a67:7d06:: with SMTP id y6mr15979613vsc.1.1626480986497;
 Fri, 16 Jul 2021 17:16:26 -0700 (PDT)
MIME-Version: 1.0
From: Richard Zak <richard.j.zak@gmail.com>
Date: Fri, 16 Jul 2021 20:16:15 -0400
Message-ID: <CAOakUfPntwU6z+2kUCCf9Ub8xF3t460z-jzGv1-PYWQq0hQdvg@mail.gmail.com>
Subject: [PATCH 1/2 v4] Configure script for Haiku
To: QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006f25c605c7469dfd"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=richard.j.zak@gmail.com; helo=mail-vs1-xe36.google.com
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

--0000000000006f25c605c7469dfd
Content-Type: text/plain; charset="UTF-8"

This refers to the email from a few weeks ago, regarding TPM & Haiku. It
seems the assertion failure isn't really about the TPM, but about disabling
PIE and adding -fPIC. There's discussion on the Haiku forum[1] about the
incompatibility with PIE, and this fixes the assertion failure without
altering the TPM configuration variable.
[1] https://discuss.haiku-os.org/t/qemu-on-haiku-sdl-issue/10961/6?u=rjzak

Previously, the TPM option was causing an assertion error at
util/async.c:669 qemu_set_current_aio_context() !my_aiocontext. I suspect
it was because the TPM option may have implied PIE. This patch ensures PIE
doesn't get used, but -fPIC is used instead.

diff --git a/configure b/configure
index 650d9c0735..df834367b6 100755
--- a/configure
+++ b/configure
@@ -766,7 +766,8 @@ SunOS)
 ;;
 Haiku)
   haiku="yes"
-  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE $QEMU_CFLAGS"
+  pie="no"
+  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC
$QEMU_CFLAGS"
 ;;
 Linux)
   audio_drv_list="try-pa oss"


-- 
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--0000000000006f25c605c7469dfd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This refers to the email from a few weeks ago, regard=
ing TPM &amp; Haiku. It seems the assertion failure isn&#39;t really about =
the TPM, but about disabling PIE and adding -fPIC. There&#39;s discussion o=
n the Haiku forum[1] about the incompatibility with PIE, and this fixes the=
 assertion failure without altering the TPM configuration variable.</div><d=
iv>[1] <a href=3D"https://discuss.haiku-os.org/t/qemu-on-haiku-sdl-issue/10=
961/6?u=3Drjzak">https://discuss.haiku-os.org/t/qemu-on-haiku-sdl-issue/109=
61/6?u=3Drjzak</a></div><div><br></div><div>Previously, the TPM option was =
causing an assertion error at util/async.c:669 qemu_set_current_aio_context=
() !my_aiocontext. I suspect it was because the TPM option may have implied=
 PIE. This patch ensures PIE doesn&#39;t get used, but -fPIC is used instea=
d.<br></div><div><br></div><div>diff --git a/configure b/configure<br>index=
 650d9c0735..df834367b6 100755<br>--- a/configure<br>+++ b/configure<br>@@ =
-766,7 +766,8 @@ SunOS)<br>=C2=A0;;<br>=C2=A0Haiku)<br>=C2=A0 =C2=A0haiku=
=3D&quot;yes&quot;<br>- =C2=A0QEMU_CFLAGS=3D&quot;-DB_USE_POSITIVE_POSIX_ER=
RORS -D_BSD_SOURCE $QEMU_CFLAGS&quot;<br>+ =C2=A0pie=3D&quot;no&quot;<br>+ =
=C2=A0QEMU_CFLAGS=3D&quot;-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC=
 $QEMU_CFLAGS&quot;<br>=C2=A0;;<br>=C2=A0Linux)<br>=C2=A0 =C2=A0audio_drv_l=
ist=3D&quot;try-pa oss&quot;</div><br clear=3D"all"><br>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Regards,<br><br>R=
ichard J. Zak<br>Professional Genius</div><div>PGP Key:=C2=A0<a href=3D"htt=
ps://keybase.io/rjzak/key.asc" target=3D"_blank">https://keybase.io/rjzak/k=
ey.asc</a></div></div></div></div></div></div></div></div>

--0000000000006f25c605c7469dfd--

