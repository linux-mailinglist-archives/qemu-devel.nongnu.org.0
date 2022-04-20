Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48F550861B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 12:39:41 +0200 (CEST)
Received: from localhost ([::1]:36966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh7kK-0005Rh-OW
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 06:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh7eE-0001Mz-Qk
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:33:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh7eD-0006po-8j
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650450800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5YdsMj8LS20vkgFU9Yq52eJpZm+S2czngKTqoq9TmzE=;
 b=OatlWq2+8lwllqc6Xcu4n5lqest5hA7LZHuKWWoeaWHZnMTKOQUdBw/Eo1ERQxbose9DjM
 g+j5t1NHeITY2DIzNOIcV2T/fbapngpqq/EizQ3zSASSwh1+dx721KRtgjoo8TsLsGWl3T
 lb3yuIdb1BKbB4ZcfvXhWQQ8Ir9a904=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-lYpcBEk8OUWdfJQkAs2U4w-1; Wed, 20 Apr 2022 06:33:19 -0400
X-MC-Unique: lYpcBEk8OUWdfJQkAs2U4w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F32380B71C;
 Wed, 20 Apr 2022 10:33:19 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD7BCC44AE1;
 Wed, 20 Apr 2022 10:33:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/7] tests/qtest: Enable more tests for the "mipsel" target
Date: Wed, 20 Apr 2022 12:33:04 +0200
Message-Id: <20220420103309.264479-3-thuth@redhat.com>
In-Reply-To: <20220420103309.264479-1-thuth@redhat.com>
References: <20220420103309.264479-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow the same set of tests for all MIPS targets, so that "mipsel"
now gets some additional test coverage, too. While we're at it,
simplify the definitions for qtests_mips64 and qtests_mips64el.

Message-Id: <20220414114655.604391-1-thuth@redhat.com>
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


