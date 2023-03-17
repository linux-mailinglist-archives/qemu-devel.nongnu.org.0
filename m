Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000B16BEF2F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 18:07:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdDWp-0001ee-Ka; Fri, 17 Mar 2023 13:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pdDWn-0001eG-3g
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:06:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pdDWj-00050X-9i
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679072758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gIHLRGiH+n88EMlBlWE7ynugjDw+ijdsx+svBeObhdg=;
 b=CNN7zGBq3t8dTvD7s+zyT1690KdSpB0P9ZnUjbjR0O4gppJ8CVwNZBfYmYuJzRTXBjhOds
 HFxNuOT+BCIjU/u7vsaLK3kgHhq4gThSq3kb5NTrvBtdmtw2bv1jnL3gcwikA7AmnnPd85
 Dg24+V+a/0Wn8HK4fm2N8xm2YP0qKew=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-AzBE6LcoNmiYJMEcXxaYCw-1; Fri, 17 Mar 2023 13:05:56 -0400
X-MC-Unique: AzBE6LcoNmiYJMEcXxaYCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73A8F3C10151
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 17:05:56 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 174E72027046;
 Fri, 17 Mar 2023 17:05:54 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] qtests: avoid printing comments before g_test_init()
Date: Fri, 17 Mar 2023 17:05:53 +0000
Message-Id: <20230317170553.592707-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

The TAP protocol version line must be the first thing printed on
stdout. The migration test failed that requirement in certain
scenarios:

  # Skipping test: Userfault not available (builtdtime)
  TAP version 13
  # random seed: R02Sc120c807f11053eb90bfea845ba1e368
  1..32
  # Start of x86_64 tests
  # Start of migration tests
  ....

The TAP version is printed by g_test_init(), so we need to make
sure that any methods which print are run after that.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 75d4f1d4a9..3b615b0da9 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2462,14 +2462,18 @@ static bool kvm_dirty_ring_supported(void)
 
 int main(int argc, char **argv)
 {
-    const bool has_kvm = qtest_has_accel("kvm");
-    const bool has_uffd = ufd_version_check();
-    const char *arch = qtest_get_arch();
+    bool has_kvm;
+    bool has_uffd;
+    const char *arch;
     g_autoptr(GError) err = NULL;
     int ret;
 
     g_test_init(&argc, &argv, NULL);
 
+    has_kvm = qtest_has_accel("kvm");
+    has_uffd = ufd_version_check();
+    arch = qtest_get_arch();
+
     /*
      * On ppc64, the test only works with kvm-hv, but not with kvm-pr and TCG
      * is touchy due to race conditions on dirty bits (especially on PPC for
-- 
2.39.2


