Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD1058231B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:28:37 +0200 (CEST)
Received: from localhost ([::1]:52182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGdLI-0003sL-Kc
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGdEs-00057R-VV
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:21:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGdEo-0002LK-52
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658913711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PpVecOWIK7EPtinVFSnYW1ad9CIw7kruWyv0MiDo6Qo=;
 b=OrDGiqGCGV15sjyZVXm3L3pXqURhpzJuHCB/iNu3dYbS/RTMOES0A5RO9OJsIp/+TDw9fg
 3RS2QttjJAalSng8ZZ7T7V1XbPV8ZXU566rEtGABn06NT0hs8Bn0m40LYOXEvo4Umgk+hJ
 rhXClDkbZNFctWUbACUvT50ZLxURElw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-xXtXs-G-M5KwMLzbubVdNQ-1; Wed, 27 Jul 2022 05:21:47 -0400
X-MC-Unique: xXtXs-G-M5KwMLzbubVdNQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F59E2804076;
 Wed, 27 Jul 2022 09:21:47 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D912F492C3B;
 Wed, 27 Jul 2022 09:21:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/3] tests/unit/test-qga: Replace the word 'blacklist' in the
 guest agent unit test
Date: Wed, 27 Jul 2022 11:21:35 +0200
Message-Id: <20220727092135.302915-4-thuth@redhat.com>
In-Reply-To: <20220727092135.302915-1-thuth@redhat.com>
References: <20220727092135.302915-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/unit/test-qga.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index c398866f46..80bb6b0866 100644
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


