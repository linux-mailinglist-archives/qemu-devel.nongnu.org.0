Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0FE15B1EE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 21:35:08 +0100 (CET)
Received: from localhost ([::1]:43044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1yix-0002W3-JA
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 15:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42048)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1yiB-00024P-Ia
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 15:34:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1yiA-0005CG-An
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 15:34:19 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55329
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1yiA-0005C3-7U
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 15:34:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581539657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1K44pwUiu8+Lt6ysKik91DAUVjLFEyH051mbxuTUuPU=;
 b=Cu42S3C1wzILTWnCYN7i7LPQUufJwNSeOaNJDOtGqTs6Q1lgHxcn6ZFtDQz1Q0ogSgDdot
 dy1tzXPP15iB8Hpjk/BE9hio/6xtcaIdAR8jGy+TVkmnHJ7TmtV5iu4lEJZJ5WikL1y1Dn
 KMjypXmxcA/+RMr6MCuXWhTlP1J7LIw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-H8SeDgk1OYSeYync1f8fYQ-1; Wed, 12 Feb 2020 15:34:12 -0500
Received: by mail-wr1-f70.google.com with SMTP id m15so1286759wrs.22
 for <qemu-devel@nongnu.org>; Wed, 12 Feb 2020 12:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eqwom1vG0T6fxOCyRmjcBP3acBHjKDG3q8lvY7K6ZbQ=;
 b=Qs6gdHlKDtqRhjAH+CSGDIVpoDDzEhMwmGNszYAQFXOsvzY2ucLFYY0f9CcMqtJvvp
 twaAjPwT+1NG34z6wPo57gcey1mYE8tp3TIVtHmZ0q9mu91dhE07nEuiwh+vN+qob3jb
 uDFMWotjUUW2zoPkyVthXsAxiFR1R1aTjKH+rtUxWZe4z+utWMJy2jArnwtEd+0bsuCt
 jEH4DJp/AAVO94Jd7B68UNUc74YTzNiwaWIJJC6TcyvOacgcQjHz5OjarkjpRBxmzSy2
 x/SGbBHSl9A6McYalQk1YY9/8RQhUK4I5JZMAwlrsQ0pwJZn9P3s2j1uSHR+y0WuPg75
 6s7Q==
X-Gm-Message-State: APjAAAVv18U4DHPWXhX7T0oQUuhWsmc/LHb7PdzAz9J0op5z11OnsOEC
 2aBbYewuLHhFm1hA/6X82mcq7lYAm/L6vxZ7f+qbHv8hM7l322RznJWMFdPFBcu8xFUYhxuYtOv
 6ooJxNin5IdZ51kE=
X-Received: by 2002:adf:9c8c:: with SMTP id d12mr16679028wre.404.1581539650622; 
 Wed, 12 Feb 2020 12:34:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqygqVG2SCm9aRP6kVfPRUy/XtLSoeUla58mw924VuACerAmthuWp8GjY2Noj8EeDnw/iHTEzg==
X-Received: by 2002:adf:9c8c:: with SMTP id d12mr16679005wre.404.1581539650395; 
 Wed, 12 Feb 2020 12:34:10 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id s8sm2100487wrt.57.2020.02.12.12.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 12:34:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/acceptance/machine_sparc_leon3: Do not run HelenOS test
 by default
Date: Wed, 12 Feb 2020 21:34:08 +0100
Message-Id: <20200212203408.15650-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-MC-Unique: H8SeDgk1OYSeYync1f8fYQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The www.helenos.org server is slow and downloading the Leon3 binary
takes too long [*]. Do not include this test in the default suite.

Similarly to commit 471c97a69b:

  Currently the Avocado framework does not distinct the time spent
  downloading assets vs. the time spent running a test. With big
  assets (like a full VM image) the tests likely fail.

  This is a limitation known by the Avocado team.
  Until this issue get fixed, do not run this tests automatically.

  Tests can still be run setting the AVOCADO_TIMEOUT_EXPECTED
  environment variable.

[*] https://travis-ci.org/stsquad/qemu/jobs/649599880#L4198

Reported-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/acceptance/machine_sparc_leon3.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/acceptance/machine_sparc_leon3.py b/tests/acceptance/mac=
hine_sparc_leon3.py
index f77e210ccb..8dba5998a1 100644
--- a/tests/acceptance/machine_sparc_leon3.py
+++ b/tests/acceptance/machine_sparc_leon3.py
@@ -5,6 +5,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later. See the COPYING file in the top-level directory.
=20
+from avocado import skipUnless
 from avocado_qemu import Test
 from avocado_qemu import wait_for_console_pattern
=20
@@ -13,6 +14,7 @@ class Leon3Machine(Test):
=20
     timeout =3D 60
=20
+    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout=
')
     def test_leon3_helenos_uimage(self):
         """
         :avocado: tags=3Darch:sparc
--=20
2.21.1


