Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDD83E070E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:00:14 +0200 (CEST)
Received: from localhost ([::1]:41570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLBc-0005nS-TY
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBJ9A-0000t7-9w
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:49:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBJ96-0006Et-8p
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:49:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628092167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ks+men1F8JpscTEpSWu1efz4WDuDDwCIgdjOTVhmbRA=;
 b=Jms0Fjsy2uFiYRvAJc2nBZYADgQSGUYPPR/3OTm0o4WTDlYdjETvzRtHUjBTqlvVBF1YEL
 pZAM1eiI0AeV5NgvvCfwWFw9bzCKHzaE12fpW0yX9vTca5i7W6uHHhNIdL4QOUat8zXZ1m
 4d/axRjDdgK9m0xCnT4LssWT1iaZmK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-42MgXMdEMWOIBG6uBL6YcA-1; Wed, 04 Aug 2021 11:49:26 -0400
X-MC-Unique: 42MgXMdEMWOIBG6uBL6YcA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1E6EEC1A0
 for <qemu-devel@nongnu.org>; Wed,  4 Aug 2021 15:49:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 296AE6B54C;
 Wed,  4 Aug 2021 15:49:20 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/11] chardev: remove needless class method
Date: Wed,  4 Aug 2021 19:48:40 +0400
Message-Id: <20210804154848.557328-4-marcandre.lureau@redhat.com>
In-Reply-To: <20210804154848.557328-1-marcandre.lureau@redhat.com>
References: <20210804154848.557328-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

"chr_option_parsed" is only implemented by the "mux" chardev, we can
specialize the code there to avoid the needless generic class method.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/chardev/char.h | 1 -
 chardev/char-mux.c     | 6 ++----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/chardev/char.h b/include/chardev/char.h
index 7c0444f90d..589e7fe46d 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -273,7 +273,6 @@ struct ChardevClass {
     void (*chr_set_echo)(Chardev *chr, bool echo);
     void (*chr_set_fe_open)(Chardev *chr, int fe_open);
     void (*chr_be_event)(Chardev *s, QEMUChrEvent event);
-    void (*chr_options_parsed)(Chardev *chr);
 };
 
 Chardev *qemu_chardev_new(const char *id, const char *typename,
diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index 5baf419010..ada0c6866f 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -386,10 +386,9 @@ void suspend_mux_open(void)
 static int chardev_options_parsed_cb(Object *child, void *opaque)
 {
     Chardev *chr = (Chardev *)child;
-    ChardevClass *class = CHARDEV_GET_CLASS(chr);
 
-    if (!chr->be_open && class->chr_options_parsed) {
-        class->chr_options_parsed(chr);
+    if (!chr->be_open && CHARDEV_IS_MUX(chr)) {
+        open_muxes(chr);
     }
 
     return 0;
@@ -412,7 +411,6 @@ static void char_mux_class_init(ObjectClass *oc, void *data)
     cc->chr_accept_input = mux_chr_accept_input;
     cc->chr_add_watch = mux_chr_add_watch;
     cc->chr_be_event = mux_chr_be_event;
-    cc->chr_options_parsed = open_muxes;
     cc->chr_update_read_handler = mux_chr_update_read_handlers;
 }
 
-- 
2.32.0.264.g75ae10bc75


