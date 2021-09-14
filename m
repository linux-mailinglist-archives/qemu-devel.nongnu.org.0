Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576A840AEDB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:24:25 +0200 (CEST)
Received: from localhost ([::1]:54832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8QC-0006zd-C4
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mQ84n-0006Tl-Eo
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:02:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mQ84l-00006s-NN
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631624535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r/UeUmJ8q3xbSNMWStUjpua4QQTduG8k986Qcpw7xNo=;
 b=O5k6nhu3zCpW/T2tcjPhT0F9UydRdndM4IM4DEfUxyvUGiPJCtH378fPD8+oSk3eBfgPlx
 /09YMnM3JSW6mqgjgQnly7c6/Ipy/opfbIQ9pyWWPYasVY9iHHQeZYvoawOhzh38GmteOD
 TlW2WzCZu3r6oJdLtUyub8eG1WpdhGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-zMrmwxrJPc6l6xvrhRvS0Q-1; Tue, 14 Sep 2021 09:02:13 -0400
X-MC-Unique: zMrmwxrJPc6l6xvrhRvS0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2416A802CBC;
 Tue, 14 Sep 2021 13:02:12 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5A986B55E;
 Tue, 14 Sep 2021 13:01:58 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] chardev: remove needless class method
Date: Tue, 14 Sep 2021 17:01:27 +0400
Message-Id: <20210914130128.298226-5-marcandre.lureau@redhat.com>
In-Reply-To: <20210914130128.298226-1-marcandre.lureau@redhat.com>
References: <20210914130128.298226-1-marcandre.lureau@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

"chr_option_parsed" is only implemented by the "mux" chardev, we can
specialize the code there to avoid the needless generic class method.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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
2.33.0.113.g6c40894d24


