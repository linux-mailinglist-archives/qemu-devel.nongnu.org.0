Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC404E3EBD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:47:14 +0100 (CET)
Received: from localhost ([::1]:47524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdur-000589-CN
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:47:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdbE-0005Ow-L5
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:26:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdb2-0002do-Tq
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:26:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647952003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDh6JsDuK0kiKhMm5ABwV+LCpJsydFeyo715bL8jMEA=;
 b=T0Y718NmybjFupuBaL8jcTfCrm0Mqlr6cQl9vHeblDEW6k6ydy4aL1Qd8/mjgsCx3RkDXQ
 tI3PTK9cWvbwsz8KuEYLX5ns5Th4hQw9rhnYi17FhuPmco/F/ED8+/2serrPVrX+m+cwJA
 ksDEJPXk3oCQIBOkPpbs9f1b6NpolZE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-7OqTM8xRPf6h2CoE9oiKRQ-1; Tue, 22 Mar 2022 08:26:40 -0400
X-MC-Unique: 7OqTM8xRPf6h2CoE9oiKRQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F4F1803B22;
 Tue, 22 Mar 2022 12:26:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DA8D441983;
 Tue, 22 Mar 2022 12:26:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 06/21] compiler.h: replace QEMU_WARN_UNUSED_RESULT with
 G_GNUC_WARN_UNUSED_RESULT
Date: Tue, 22 Mar 2022 16:25:46 +0400
Message-Id: <20220322122601.927238-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220322122601.927238-1-marcandre.lureau@redhat.com>
References: <20220322122601.927238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

One less qemu-specific macro. It also helps to make some headers/units
only depend on glib, and thus moved in standalone projects eventually.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu-common.h      |  2 +-
 include/qemu/compiler.h    |  2 --
 include/qemu/range.h       |  4 ++--
 scripts/cocci-macro-file.h |  2 +-
 block/qcow2-refcount.c     | 20 +++++++++++---------
 scripts/checkpatch.pl      |  2 +-
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 9c04fa94e89a..19e254dbe53e 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -27,7 +27,7 @@ int qemu_main(int argc, char **argv, char **envp);
 #endif
 
 ssize_t qemu_write_full(int fd, const void *buf, size_t count)
-    QEMU_WARN_UNUSED_RESULT;
+    G_GNUC_WARN_UNUSED_RESULT;
 
 #ifndef _WIN32
 int qemu_pipe(int pipefd[2]);
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index f2bd050e3b9a..8385e477c18e 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -19,8 +19,6 @@
 
 #define QEMU_NORETURN __attribute__ ((__noreturn__))
 
-#define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
-
 #define QEMU_SENTINEL __attribute__((sentinel))
 
 #if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
diff --git a/include/qemu/range.h b/include/qemu/range.h
index f62b363e0d12..7e2b1cc447af 100644
--- a/include/qemu/range.h
+++ b/include/qemu/range.h
@@ -114,8 +114,8 @@ static inline uint64_t range_upb(Range *range)
  * @size may be 0. If the range would overflow, returns -ERANGE, otherwise
  * 0.
  */
-static inline int QEMU_WARN_UNUSED_RESULT range_init(Range *range, uint64_t lob,
-                                                     uint64_t size)
+G_GNUC_WARN_UNUSED_RESULT
+static inline int range_init(Range *range, uint64_t lob, uint64_t size)
 {
     if (lob + size < lob) {
         return -ERANGE;
diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
index c2fcea8e77a2..9daec24d7825 100644
--- a/scripts/cocci-macro-file.h
+++ b/scripts/cocci-macro-file.h
@@ -20,7 +20,7 @@
 
 /* From qemu/compiler.h */
 #define QEMU_NORETURN __attribute__ ((__noreturn__))
-#define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
+#define G_GNUC_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
 #define QEMU_SENTINEL __attribute__((sentinel))
 
 #if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 94033972bedc..b91499410c0c 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -33,9 +33,11 @@
 
 static int64_t alloc_clusters_noref(BlockDriverState *bs, uint64_t size,
                                     uint64_t max);
-static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
-                            int64_t offset, int64_t length, uint64_t addend,
-                            bool decrease, enum qcow2_discard_type type);
+
+G_GNUC_WARN_UNUSED_RESULT
+static int update_refcount(BlockDriverState *bs,
+                           int64_t offset, int64_t length, uint64_t addend,
+                           bool decrease, enum qcow2_discard_type type);
 
 static uint64_t get_refcount_ro0(const void *refcount_array, uint64_t index);
 static uint64_t get_refcount_ro1(const void *refcount_array, uint64_t index);
@@ -803,12 +805,12 @@ found:
 /* XXX: cache several refcount block clusters ? */
 /* @addend is the absolute value of the addend; if @decrease is set, @addend
  * will be subtracted from the current refcount, otherwise it will be added */
-static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
-                                                   int64_t offset,
-                                                   int64_t length,
-                                                   uint64_t addend,
-                                                   bool decrease,
-                                                   enum qcow2_discard_type type)
+static int update_refcount(BlockDriverState *bs,
+                           int64_t offset,
+                           int64_t length,
+                           uint64_t addend,
+                           bool decrease,
+                           enum qcow2_discard_type type)
 {
     BDRVQcow2State *s = bs->opaque;
     int64_t start, last, cluster_offset;
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index a07f0effb540..797738a8e839 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -224,7 +224,7 @@ our $Attribute	= qr{
 			const|
 			volatile|
 			QEMU_NORETURN|
-			QEMU_WARN_UNUSED_RESULT|
+			G_GNUC_WARN_UNUSED_RESULT|
 			QEMU_SENTINEL|
 			QEMU_PACKED|
 			G_GNUC_PRINTF
-- 
2.35.1.273.ge6ebfd0e8cbb


