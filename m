Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 745AF500C5F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 13:48:35 +0200 (CEST)
Received: from localhost ([::1]:45356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nexxi-000319-8R
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 07:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nexwF-0002Ma-7w
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 07:47:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nexwC-0007Na-JF
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 07:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649936819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sxRJcjT+IoKFLNBCrxq27kqQgY4IjVxW854KI0pzkA4=;
 b=GL7IYrBuhpe/HJNMQTRrWtOP7DMyYV/RgmCmSqaYEAL+cFhU/fPyMS/g6DpF6GwDNBbBvr
 OD6GRKZIUGuqSyK2Ms2zCsMrwPl7ihmh1LCS8hSKJHJgYNyLLdmtsgc8C5MlsUrOj7fP9W
 LoODPd+u3h93Z0x1DDvT34jxbM4Ylog=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-FzjhRXctMSyhfy62LKa1-Q-1; Thu, 14 Apr 2022 07:46:58 -0400
X-MC-Unique: FzjhRXctMSyhfy62LKa1-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9E5E866DF1;
 Thu, 14 Apr 2022 11:46:57 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15C03145830A;
 Thu, 14 Apr 2022 11:46:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] tests/qtest: Enable more tests for the "mipsel" target
Date: Thu, 14 Apr 2022 13:46:55 +0200
Message-Id: <20220414114655.604391-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow the same set of tests for all MIPS targets, so that "mipsel"
now gets some additional test coverage, too. While we're at it,
simplify the definitions for qtests_mips64 and qtests_mips64el.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/endianness-test.c |  1 +
 tests/qtest/meson.build       | 14 +++-----------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/endianness-test.c b/tests/qtest/endianness-test.c
index 9c03b72dc9..2f5a88bf4c 100644
--- a/tests/qtest/endianness-test.c
+++ b/tests/qtest/endianness-test.c
@@ -28,6 +28,7 @@ struct TestCase {
 static const TestCase test_cases[] = {
     { "i386", "pc", -1 },
     { "mips", "malta", 0x10000000, .bswap = true },
+    { "mipsel", "malta", 0x10000000 },
     { "mips64", "magnum", 0x90000000, .bswap = true },
     { "mips64", "pica61", 0x90000000, .bswap = true },
     { "mips64", "malta", 0x10000000, .bswap = true },
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index d25f82bb5a..1709fc6ccb 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -143,17 +143,9 @@ qtests_mips = \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
-qtests_mips64 = \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
-  (slirp.found() ? ['test-netfilter'] : []) + \
-  (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
-  (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
-
-qtests_mips64el = \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
-  (slirp.found() ? ['test-netfilter'] : []) + \
-  (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
-  (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
+qtests_mipsel = qtests_mips
+qtests_mips64 = qtests_mips
+qtests_mips64el = qtests_mips
 
 qtests_ppc = \
   ['test-filter-mirror', 'test-filter-redirector'] + \
-- 
2.27.0


