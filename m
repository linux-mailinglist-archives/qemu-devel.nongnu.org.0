Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6CF2AD48D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:18:23 +0100 (CET)
Received: from localhost ([::1]:41464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRfK-0007Ct-9u
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZ2-0006xi-AC
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:11:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZ0-0004YL-HP
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605006709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mP9/ybiNm2ip2znXBqMXecObtAaS5XSjw7m5BzkccFI=;
 b=a8vPDducbd9V9Qxapv6AlRMqMytwLiFRSEB19b5pSIwjzrCoNVZEUdRHPCEgoyOQH9i5IC
 P9OoDA759xuRIUqk4IL0ib09LB54YTaCqB1efyvxFkEDhENLZFOlBPI7nu0hl7kVQWuxyA
 5Gyed+6d/BB+j/Bsxw/jg22khxv/SU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-D6MhyrGMM46FBxqYpPLjdA-1; Tue, 10 Nov 2020 06:11:47 -0500
X-MC-Unique: D6MhyrGMM46FBxqYpPLjdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 629EC801FD4;
 Tue, 10 Nov 2020 11:11:46 +0000 (UTC)
Received: from thuth.com (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2930F1002C11;
 Tue, 10 Nov 2020 11:11:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/19] tests/qtest/tpm: Remove redundant check in the
 tpm_test_swtpm_test()
Date: Tue, 10 Nov 2020 12:11:18 +0100
Message-Id: <20201110111132.559399-6-thuth@redhat.com>
In-Reply-To: <20201110111132.559399-1-thuth@redhat.com>
References: <20201110111132.559399-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: AlexChen <alex.chen@huawei.com>

The 'addr' would not be NULL after checking 'succ' is valid,
and it has been dereferenced in the previous code(args = g_strdup_printf()).
So the check on 'addr' in the tpm_test_swtpm_test() is redundant. Remove it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Message-Id: <5FA41448.4040404@huawei.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/tpm-tests.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/tpm-tests.c b/tests/qtest/tpm-tests.c
index 70c80f8379..0da3a8a4df 100644
--- a/tests/qtest/tpm-tests.c
+++ b/tests/qtest/tpm-tests.c
@@ -70,10 +70,8 @@ void tpm_test_swtpm_test(const char *src_tpm_path, tx_func *tx,
     qtest_end();
     tpm_util_swtpm_kill(swtpm_pid);
 
-    if (addr) {
-        g_unlink(addr->u.q_unix.path);
-        qapi_free_SocketAddress(addr);
-    }
+    g_unlink(addr->u.q_unix.path);
+    qapi_free_SocketAddress(addr);
 }
 
 void tpm_test_swtpm_migration_test(const char *src_tpm_path,
-- 
2.18.4


