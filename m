Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F6150A1DF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:13:36 +0200 (CEST)
Received: from localhost ([::1]:45946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXYt-00055c-7F
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXDc-0004dj-4H
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:51:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXDa-0006Cn-KD
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wYm4U65bb3EFCPGKRJq93PeVgsxf2a9oSs6Q9uQqPPA=;
 b=BllQ743A7g1raoFG1f8Mtt/CPOOLfv3fW8KAtPoeIAab6DtB1wGePeUeopxXKXmM4p93Wy
 c3+QDnVouadXSoUH4/abAqJaII3pZe4w6td8kDqjFhX8WcdNzgxrARFKmppBCekTE+2BBl
 XgVDJDESrt9x7t/C7DPDGhZ7+M22Wvc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-_RavvkfUN_mFHjnghFMN-w-1; Thu, 21 Apr 2022 09:51:30 -0400
X-MC-Unique: _RavvkfUN_mFHjnghFMN-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92F721014A64;
 Thu, 21 Apr 2022 13:51:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C065F2024CB6;
 Thu, 21 Apr 2022 13:51:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 18/30] tests: remove block/qdict checks from check-qobject.c
Date: Thu, 21 Apr 2022 17:49:28 +0400
Message-Id: <20220421134940.2887768-19-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 richard.henderson@linaro.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The functions are already covered in check-block-qdict.c.
This will help moving QAPI-related tests in a common subproject.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220420132624.2439741-26-marcandre.lureau@redhat.com>
---
 tests/unit/check-qobject.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tests/unit/check-qobject.c b/tests/unit/check-qobject.c
index c5e850a10cb5..022b7c74fe57 100644
--- a/tests/unit/check-qobject.c
+++ b/tests/unit/check-qobject.c
@@ -15,7 +15,6 @@
 #include "qapi/qmp/qnull.h"
 #include "qapi/qmp/qnum.h"
 #include "qapi/qmp/qstring.h"
-#include "block/qdict.h"
 
 #include <math.h>
 
@@ -179,7 +178,6 @@ static void qobject_is_equal_list_test(void)
 static void qobject_is_equal_dict_test(void)
 {
     g_autoptr(QDict) dict_cloned = NULL;
-    g_autoptr(QDict) dict_crumpled = NULL;
     g_autoptr(QDict) dict_0 = qdict_new();
     g_autoptr(QDict) dict_1 = qdict_new();
     g_autoptr(QDict) dict_different_key = qdict_new();
@@ -237,12 +235,6 @@ static void qobject_is_equal_dict_test(void)
                   dict_different_null_key, dict_longer, dict_shorter,
                   dict_nested);
 
-    dict_crumpled = qobject_to(QDict, qdict_crumple(dict_1, &error_abort));
-    check_equal(dict_crumpled, dict_nested);
-
-    qdict_flatten(dict_nested);
-    check_equal(dict_0, dict_nested);
-
     /* Containing an NaN value will make this dict compare unequal to
      * itself */
     qdict_put(dict_0, "NaN", qnum_from_double(NAN));
-- 
2.36.0


