Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEB05F2ED4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:32:49 +0200 (CEST)
Received: from localhost ([::1]:53744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofIki-0006pm-6g
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofIfY-0002TO-DN
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:27:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofIfV-0001H3-RC
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664792845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fpSUZbksCW6EQjdoXztd45/o2mS9GsG5oWqvRNljks=;
 b=TtABExDhBeYz3c8UQvFTwWpGjkZlIXJ3NAMI9/Vhxw6HMJtTCpOJDi0EnGgDTuq3D4Ce9t
 M5OCsgmlJfKCuAN/lOMeZUD1W5Lem/b/lx1hXWFKAEov8Dsmi/5CXP4JSOM6uDH9BFHZEM
 64hAuMQ0nXZDkjkIbSEeJsPbJycuzHU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-bdoLJ5rRMHC71m_4jWZFLQ-1; Mon, 03 Oct 2022 06:27:23 -0400
X-MC-Unique: bdoLJ5rRMHC71m_4jWZFLQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F77B3C138A0;
 Mon,  3 Oct 2022 10:27:23 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1B4E492B06;
 Mon,  3 Oct 2022 10:27:22 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/2] tests: avoid DOS line endings in PSK file
Date: Mon,  3 Oct 2022 11:27:18 +0100
Message-Id: <20221003102718.600058-3-berrange@redhat.com>
In-Reply-To: <20221003102718.600058-1-berrange@redhat.com>
References: <20221003102718.600058-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using FILE * APIs for writing the PSK file results in translation from
UNIX to DOS line endings on Windows. When the crypto PSK code later
loads the credentials the stray \r will result in failure to load the
PSK credentials into GNUTLS.

Rather than switching the FILE* APIs to open in binary format, just
switch to the more concise g_file_set_contents API.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/unit/crypto-tls-psk-helpers.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/unit/crypto-tls-psk-helpers.c b/tests/unit/crypto-tls-psk-helpers.c
index 511e08cc9c..c6cc740772 100644
--- a/tests/unit/crypto-tls-psk-helpers.c
+++ b/tests/unit/crypto-tls-psk-helpers.c
@@ -27,15 +27,14 @@
 static void
 test_tls_psk_init_common(const char *pskfile, const char *user, const char *key)
 {
-    FILE *fp;
+    g_autoptr(GError) gerr = NULL;
+    g_autofree char *line = g_strdup_printf("%s:%s\n", user, key);
 
-    fp = fopen(pskfile, "w");
-    if (fp == NULL) {
-        g_critical("Failed to create pskfile %s: %s", pskfile, strerror(errno));
+    g_file_set_contents(pskfile, line, strlen(line), &gerr);
+    if (gerr != NULL) {
+        g_critical("Failed to create pskfile %s: %s", pskfile, gerr->message);
         abort();
     }
-    fprintf(fp, "%s:%s\n", user, key);
-    fclose(fp);
 }
 
 void test_tls_psk_init(const char *pskfile)
-- 
2.37.3


