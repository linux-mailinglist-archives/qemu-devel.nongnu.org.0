Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C300600D27
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:58:49 +0200 (CEST)
Received: from localhost ([::1]:48310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okNpY-0008IL-1J
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1okNmH-0006ai-RN
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:55:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1okNmD-00083o-V4
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:55:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666004118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hSH4fqNhQ/VLQKfFgArWmXI3WmNksLKbby+lFIcBHUI=;
 b=Oncy054f7knXFzqxz/NbeDDuVp9hcLPe6zX08Gy/L00aD06wCUhTQiIdHyG0lR27gqTaxT
 gbRpNFPC2dNPPW+vW+p53uEHAEm+Dv01c/JCU1rW2dckURc2kBCq9JTUwaSRnkbRw5Eu8w
 fXYXqJBTi6dIO/OQSN+4s589fFcZ/Fo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-td1jqVpxMIaBr2zJ_K24aw-1; Mon, 17 Oct 2022 06:55:13 -0400
X-MC-Unique: td1jqVpxMIaBr2zJ_K24aw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEB8B882822;
 Mon, 17 Oct 2022 10:55:12 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B764409AE9;
 Mon, 17 Oct 2022 10:55:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	bin.meng@windriver.com
Cc: qemu-trivial@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH] tests/qtest/migration-test: Do not try to print NULL pointer
 string
Date: Mon, 17 Oct 2022 12:55:06 +0200
Message-Id: <20221017105506.69149-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

If tmpfs is NULL, we should not try to print it as a string.

Reported-by: shengjiangwuqq on github.com
Fixes: e5553c1b8d ("tests/qtest: migration-test: Avoid using hardcoded /tmp")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-test.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index ef4427ff4d..de70611f50 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2481,8 +2481,7 @@ int main(int argc, char **argv)
 
     tmpfs = g_dir_make_tmp("migration-test-XXXXXX", &err);
     if (!tmpfs) {
-        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
-                       err->message);
+        g_test_message("g_dir_make_tmp failed: %s", err->message);
     }
     g_assert(tmpfs);
 
-- 
2.31.1


