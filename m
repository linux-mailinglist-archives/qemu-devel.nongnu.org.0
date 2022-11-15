Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4590F62A41E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 22:29:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov3Tb-0003XH-72; Tue, 15 Nov 2022 16:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ov3TY-0003X6-5Z
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 16:28:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ov3TW-0000sV-A9
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 16:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668547685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ICxglQun5+3M6+RhBS2aQ8UJIohaCK8pYlKLF5ceosI=;
 b=blg+hepIoWsupNWEHaweF/DvwMan4e1Jkk00Wxpcl9O3oZXe7J132+tT4i9PWhhm4dYmLz
 ErOFZgX6wVk/8EI6sr9Ymgk9Z/cvhdsoxLjL0O0StCuk5WrzMWPATSsqhJQaJVDD9lwech
 fYo8AYKV3MQF7lsAdWIsWbpVWfjpK0Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-EQU7cT93PzOTRhN67CJX9Q-1; Tue, 15 Nov 2022 16:28:02 -0500
X-MC-Unique: EQU7cT93PzOTRhN67CJX9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02C7D833A0E;
 Tue, 15 Nov 2022 21:28:02 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E3C92028DC1;
 Tue, 15 Nov 2022 21:28:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH] tests/avocado: configure acpi-bits to use avocado timeout
Date: Tue, 15 Nov 2022 16:27:59 -0500
Message-Id: <20221115212759.3095751-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Instead of using a hardcoded timeout, just rely on Avocado's built-in
test case timeout. This helps avoid timeout issues on machines where 60
seconds is not sufficient.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/avocado/acpi-bits.py | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
index 8745a58a766..ac13e22dc93 100644
--- a/tests/avocado/acpi-bits.py
+++ b/tests/avocado/acpi-bits.py
@@ -385,12 +385,6 @@ def test_acpi_smbios_bits(self):
         self._vm.launch()
         # biosbits has been configured to run all the specified test suites
         # in batch mode and then automatically initiate a vm shutdown.
-        # sleep for maximum of one minute
-        max_sleep_time = time.monotonic() + 60
-        while self._vm.is_running() and time.monotonic() < max_sleep_time:
-            time.sleep(1)
-
-        self.assertFalse(time.monotonic() > max_sleep_time,
-                         'The VM seems to have failed to shutdown in time')
-
+        # Rely on avocado's unit test timeout.
+        self._vm.wait(timeout=None)
         self.parse_log()
-- 
2.37.3


