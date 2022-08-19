Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD4C5994DE
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 07:53:03 +0200 (CEST)
Received: from localhost ([::1]:49178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOuwI-0004rD-No
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 01:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oOuiC-0003Ox-6t
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 01:38:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oOui0-0002oN-Vt
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 01:38:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660887494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZI4KBX4KW/sjd2R7SfuowE15LMfO8KNu1anSRmZ9pqQ=;
 b=MKEgKSTIeVL1OCGOgVdgyVo6GKg8ciJN4y6U7OZsq+6Gc7vYvwhOy1qN+OtRijlvnK8EkU
 lFA73lgRXQjZz3rNBgjN4f/aAlvhXZbVk7VdNKHRC99CDO1ajipqyszI1n7k6nwT11+g6u
 psMlBtC41atFugMupKGnKaF2ymRrNuI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-Qe0ir1V5NSqe6uO63l69IA-1; Fri, 19 Aug 2022 01:38:13 -0400
X-MC-Unique: Qe0ir1V5NSqe6uO63l69IA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E08CC185A79C;
 Fri, 19 Aug 2022 05:38:12 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84E4F4010E3C;
 Fri, 19 Aug 2022 05:38:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH 4/4] tests/qtest/migration-test: Remove duplicated
 test_postcopy from the test plan
Date: Fri, 19 Aug 2022 07:38:02 +0200
Message-Id: <20220819053802.296584-5-thuth@redhat.com>
In-Reply-To: <20220819053802.296584-1-thuth@redhat.com>
References: <20220819053802.296584-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

test_postcopy() is currently run twice - which is just a waste of resources
and time. The commit d1a27b169b2d that introduced the duplicate talked about
renaming the "postcopy/unix" test, but apparently it forgot to remove the
old entry. Let's do that now.

Fixes: d1a27b169b ("tests: Add postcopy tls migration test")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 7be321b62d..f63edd0bc8 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2461,7 +2461,6 @@ int main(int argc, char **argv)
     module_call_init(MODULE_INIT_QOM);
 
     if (has_uffd) {
-        qtest_add_func("/migration/postcopy/unix", test_postcopy);
         qtest_add_func("/migration/postcopy/plain", test_postcopy);
         qtest_add_func("/migration/postcopy/recovery/plain",
                        test_postcopy_recovery);
-- 
2.31.1


