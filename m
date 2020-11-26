Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713A62C5329
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:42:05 +0100 (CET)
Received: from localhost ([::1]:53564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFf2-0006HB-GR
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kiFTT-000366-Ne
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:30:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kiFTQ-0006Iw-7V
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:30:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606390203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eVWbpz/51ynGh1k4+ZtIc1itvsguFX9OWEYfbfcFaI0=;
 b=EbY+e+7xt7rrcahfYHT79EOJ+xYHf7O1elshxMPMnw9+iU99wtCWUloJVQVEIBtsxsrm6P
 HudPiIMB3RD2HCK3+kO9msK1jySsfyQO9IZ7JFAtPtIxS7xBuqFPswr3Jb2jpufe98Troj
 RTY0GfadZsOcdgenys+F9lDP+SdjSmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-sKUy671INfWUwHLtgh69Xw-1; Thu, 26 Nov 2020 06:30:01 -0500
X-MC-Unique: sKUy671INfWUwHLtgh69Xw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 756C09CC17;
 Thu, 26 Nov 2020 11:29:59 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D4555D9C6;
 Thu, 26 Nov 2020 11:29:54 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/13] qemu-plugin.h: remove GCC < 4
Date: Thu, 26 Nov 2020 15:29:07 +0400
Message-Id: <20201126112915.525285-6-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-1-marcandre.lureau@redhat.com>
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, philmd@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit efc6c07 ("configure: Add a test for the minimum compiler
version"), QEMU explicitely depends on GCC >= 4.8.

(clang >= 3.8 advertizes itself as GCC >= 4.2 compatible)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/qemu-plugin.h | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index bab8b0d4b3..5775e82c4e 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -28,13 +28,8 @@
   #endif
   #define QEMU_PLUGIN_LOCAL
 #else
-  #if __GNUC__ >= 4
-    #define QEMU_PLUGIN_EXPORT __attribute__((visibility("default")))
-    #define QEMU_PLUGIN_LOCAL  __attribute__((visibility("hidden")))
-  #else
-    #define QEMU_PLUGIN_EXPORT
-    #define QEMU_PLUGIN_LOCAL
-  #endif
+  #define QEMU_PLUGIN_EXPORT __attribute__((visibility("default")))
+  #define QEMU_PLUGIN_LOCAL  __attribute__((visibility("hidden")))
 #endif
 
 typedef uint64_t qemu_plugin_id_t;
-- 
2.29.0


