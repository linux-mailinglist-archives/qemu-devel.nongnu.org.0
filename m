Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11FF4E3EB0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:42:54 +0100 (CET)
Received: from localhost ([::1]:39170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdqg-0007uH-23
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:42:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdbG-0005Pt-0i
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:26:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdb9-0002eU-6J
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:26:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647952005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MMKCXvyK5NC3rpXWziXyJv/uS6tZJ1wbns/7ecsA8/Y=;
 b=UEBHJ+bEi7p8MF7eaEsvsCi6/TicS+D7iH7Twx3yepSFGjJT6hitIK+wVGJ6H+KFmE1C8r
 27PRcdZ6S15meTYN+RC60oU7VOR750SAumVo4iG/T5jMBNOLjCZZcGdTbmvqG+rf52cu84
 3XyP3gh/YApX+OpfwzQXpch8vyKNCc8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-WlHybi60P5Gz5J9Pjn_CFg-1; Tue, 22 Mar 2022 08:26:44 -0400
X-MC-Unique: WlHybi60P5Gz5J9Pjn_CFg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02D9185A5BC;
 Tue, 22 Mar 2022 12:26:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 496A6401E86;
 Tue, 22 Mar 2022 12:26:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 07/21] compiler.h: replace QEMU_SENTINEL with
 G_GNUC_NULL_TERMINATED
Date: Tue, 22 Mar 2022 16:25:47 +0400
Message-Id: <20220322122601.927238-8-marcandre.lureau@redhat.com>
In-Reply-To: <20220322122601.927238-1-marcandre.lureau@redhat.com>
References: <20220322122601.927238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
 include/qemu/compiler.h    | 2 --
 include/qom/object.h       | 6 +++---
 scripts/cocci-macro-file.h | 2 +-
 scripts/checkpatch.pl      | 2 +-
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 8385e477c18e..0a5e67fb970e 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -19,8 +19,6 @@
 
 #define QEMU_NORETURN __attribute__ ((__noreturn__))
 
-#define QEMU_SENTINEL __attribute__((sentinel))
-
 #if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
 # define QEMU_PACKED __attribute__((gcc_struct, packed))
 #else
diff --git a/include/qom/object.h b/include/qom/object.h
index fae096f51cce..5f3d5b5bf532 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -616,7 +616,7 @@ Object *object_new_with_props(const char *typename,
                               Object *parent,
                               const char *id,
                               Error **errp,
-                              ...) QEMU_SENTINEL;
+                              ...) G_GNUC_NULL_TERMINATED;
 
 /**
  * object_new_with_propv:
@@ -676,7 +676,7 @@ void object_apply_compat_props(Object *obj);
  *
  * Returns: %true on success, %false on error.
  */
-bool object_set_props(Object *obj, Error **errp, ...) QEMU_SENTINEL;
+bool object_set_props(Object *obj, Error **errp, ...) G_GNUC_NULL_TERMINATED;
 
 /**
  * object_set_propv:
@@ -728,7 +728,7 @@ void object_initialize(void *obj, size_t size, const char *typename);
 bool object_initialize_child_with_props(Object *parentobj,
                              const char *propname,
                              void *childobj, size_t size, const char *type,
-                             Error **errp, ...) QEMU_SENTINEL;
+                             Error **errp, ...) G_GNUC_NULL_TERMINATED;
 
 /**
  * object_initialize_child_with_propsv:
diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
index 9daec24d7825..3d1e9b50919a 100644
--- a/scripts/cocci-macro-file.h
+++ b/scripts/cocci-macro-file.h
@@ -21,7 +21,7 @@
 /* From qemu/compiler.h */
 #define QEMU_NORETURN __attribute__ ((__noreturn__))
 #define G_GNUC_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
-#define QEMU_SENTINEL __attribute__((sentinel))
+#define G_GNUC_NULL_TERMINATED __attribute__((sentinel))
 
 #if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
 # define QEMU_PACKED __attribute__((gcc_struct, packed))
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 797738a8e839..ddc6003de280 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -225,7 +225,7 @@ our $Attribute	= qr{
 			volatile|
 			QEMU_NORETURN|
 			G_GNUC_WARN_UNUSED_RESULT|
-			QEMU_SENTINEL|
+			G_GNUC_NULL_TERMINATED|
 			QEMU_PACKED|
 			G_GNUC_PRINTF
 		  }x;
-- 
2.35.1.273.ge6ebfd0e8cbb


