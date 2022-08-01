Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C955586E67
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 18:17:04 +0200 (CEST)
Received: from localhost ([::1]:59716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIY6J-0007u5-5X
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 12:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIXla-0003BP-PF
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:55:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIXlW-0001Q8-Pz
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659369334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YqtL5idx9O8wtaCStTAgJzeXvr9HS1bLyblEOL4w+AI=;
 b=aL1xyw2KvJ6j0HFeOTLCjuPkt1MOXN6vIJ/GKeO6pxBJc9Q+Vz+JBYcBfP9O2rzUHtIfWM
 HqEQlR2MeG/JR2jJz760C3fQh+OrbxFqyEFMZF/DsOnC5gP9q2gAPl1ojzS8jAnFmeXFcQ
 1rRP0KBL9W/l8Vu5arOYRRJ0Febdu+Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-X_zyQDpePrG6X5qitZrPAQ-1; Mon, 01 Aug 2022 11:55:31 -0400
X-MC-Unique: X_zyQDpePrG6X5qitZrPAQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E71A53C10230;
 Mon,  1 Aug 2022 15:55:22 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C7B018EA8;
 Mon,  1 Aug 2022 15:55:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 berrange@redhat.com
Subject: [PULL 4/7] tests/unit/test-qga: Replace the word 'blacklist' in the
 guest agent unit test
Date: Mon,  1 Aug 2022 17:55:03 +0200
Message-Id: <20220801155506.254316-5-thuth@redhat.com>
In-Reply-To: <20220801155506.254316-1-thuth@redhat.com>
References: <20220801155506.254316-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

Let's use better, more inclusive wording here.

Message-Id: <20220727092135.302915-4-thuth@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/unit/test-qga.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index 530317044b..b27c77a695 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -629,7 +629,7 @@ static void test_qga_get_time(gconstpointer fix)
     g_assert_cmpint(time, >, 0);
 }
 
-static void test_qga_blacklist(gconstpointer data)
+static void test_qga_blockedrpcs(gconstpointer data)
 {
     TestFixture fix;
     QDict *ret, *error;
@@ -637,7 +637,7 @@ static void test_qga_blacklist(gconstpointer data)
 
     fixture_setup(&fix, "-b guest-ping,guest-get-time", NULL);
 
-    /* check blacklist */
+    /* check blocked RPCs */
     ret = qmp_fd(fix.fd, "{'execute': 'guest-ping'}");
     g_assert_nonnull(ret);
     error = qdict_get_qdict(ret, "error");
@@ -968,7 +968,7 @@ int main(int argc, char **argv)
     g_test_add_data_func("/qga/fsfreeze-status", &fix,
                          test_qga_fsfreeze_status);
 
-    g_test_add_data_func("/qga/blacklist", NULL, test_qga_blacklist);
+    g_test_add_data_func("/qga/blockedrpcs", NULL, test_qga_blockedrpcs);
     g_test_add_data_func("/qga/config", NULL, test_qga_config);
     g_test_add_data_func("/qga/guest-exec", &fix, test_qga_guest_exec);
     g_test_add_data_func("/qga/guest-exec-invalid", &fix,
-- 
2.31.1


