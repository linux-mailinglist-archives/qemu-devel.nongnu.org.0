Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4973815B1F4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 21:38:00 +0100 (CET)
Received: from localhost ([::1]:43078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1ylj-0004wE-Bl
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 15:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42353)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1ykL-0003H5-Qm
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 15:36:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1ykK-0007CQ-M8
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 15:36:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54093
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1ykK-0007AW-Ic
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 15:36:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581539792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T3ylHUH4ZoFjUTnyfUiMekT5X2Pd1nXmD9oE7o/4Elk=;
 b=V0K8+r3oA758YunzhwvHIjaG/XTAHdZTjifG4WKVyFiKjzadVcG6phDxJKuLwnPX/xwKDm
 5b8Pq2Yi4Q6ljYqTFLQ+INkxeFODKHEiW+E1C54N5GgEIYGTNc5DlvJ6SjJA0J79cbdAqn
 0wJj4B4IuOrqPxsul1tD0K5fCbdXWmg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-FTucVd5DOyKd_A69X99GQQ-1; Wed, 12 Feb 2020 15:36:30 -0500
Received: by mail-wm1-f72.google.com with SMTP id 7so1201790wmf.9
 for <qemu-devel@nongnu.org>; Wed, 12 Feb 2020 12:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z3rfLLywh1BohS0upHcyh0haLkZZAmJBOAw7ZMtEqQs=;
 b=YXrf8dRR4kdFN64xbw3snK/GGe+WkPItmRMLZbKnshUhLKNuFH3oIXSuKYK0lBV4Ff
 G28j31zqS6+J2ysTE1jpNfpJ2AfbdetQuvhZkCsQBwIyofNL35uxqz8uRoR6GZLLmlAX
 3p/Pnx/3LwrhSHW4aqnPb+e4dn8M0RzV022NEFgmu/t44rDJ1OLTclTBWvkZnkcvy/bs
 znv2XPlXbTDBPCWT7qetB+1xJWR8AIvO2/JqUu8B3WCT/KqqDWdh29ZM0hXQmtHpWIFl
 FiGUFPC5hLVDqj/9tOohBRWnH1/0Ojj7YAyGw1p74+mtiJFxrD/wqhCHAPxFWj3emSpI
 c6Lg==
X-Gm-Message-State: APjAAAXQlQ4c7j6HMFUTcZIGf0LuElBe5No9Jo+0iQXlT9KV4OiomCd+
 wMbjqrpDXGWZQMlSaycFb2azZhrtknx+or/g8qX3vuYHuGo0IjZ9oO/moSf6HgGDAY/WTygXFvk
 jv2nti5nE/jX1vzU=
X-Received: by 2002:a5d:6b03:: with SMTP id v3mr16165556wrw.289.1581539788719; 
 Wed, 12 Feb 2020 12:36:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqyaQ9A8EpHQ5Q0Tppb+wagHGk27YGHBBvx95vQ0AU99gCrKMT9bLrj8fE6pr7sNvBX1PN7W6w==
X-Received: by 2002:a5d:6b03:: with SMTP id v3mr16165544wrw.289.1581539788544; 
 Wed, 12 Feb 2020 12:36:28 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id y139sm2265308wmd.24.2020.02.12.12.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 12:36:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] tests/acceptance/machine_sparc_leon3: Do not run HelenOS
 test by default
Date: Wed, 12 Feb 2020 21:36:27 +0100
Message-Id: <20200212203627.16592-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-MC-Unique: FTucVd5DOyKd_A69X99GQQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
v2: Add missing staged hunk...
---
 tests/acceptance/machine_sparc_leon3.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/acceptance/machine_sparc_leon3.py b/tests/acceptance/mac=
hine_sparc_leon3.py
index f77e210ccb..27e4717a51 100644
--- a/tests/acceptance/machine_sparc_leon3.py
+++ b/tests/acceptance/machine_sparc_leon3.py
@@ -5,6 +5,9 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later. See the COPYING file in the top-level directory.
=20
+import os
+
+from avocado import skipUnless
 from avocado_qemu import Test
 from avocado_qemu import wait_for_console_pattern
=20
@@ -13,6 +16,7 @@ class Leon3Machine(Test):
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


