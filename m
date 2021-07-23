Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7905C3D38C9
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 12:34:24 +0200 (CEST)
Received: from localhost ([::1]:49090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6sVb-0001EA-Hh
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 06:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m6sQx-0002tc-Jr
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:29:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m6sQw-0002Ed-6m
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627036173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpiiY2I+ar37EO38yRUmKsmA84YcnppA3VPIzdoBF/s=;
 b=ewZWAKSWX6dglwTsJI76zHCHYJQtv8yeodr9AFtJVLlbP0YAUHELVuib1L2MkR8B9OYgok
 I5eRkP9YYgjVOLsnJsBYaEYXA78CTMAYcp33lz6gOR/OhZ475xknfR51DqrCgeLI+BP091
 GNq1jGZ9mNDO5xjpe/6PG1knHqQYn5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-ggcA2bpFO-22bLHnHF7Zsg-1; Fri, 23 Jul 2021 06:29:30 -0400
X-MC-Unique: ggcA2bpFO-22bLHnHF7Zsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8831AC7424
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:29:17 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D0BD60C5F;
 Fri, 23 Jul 2021 10:29:16 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] chardev: remove needless class method
Date: Fri, 23 Jul 2021 14:28:24 +0400
Message-Id: <20210723102825.1790112-4-marcandre.lureau@redhat.com>
In-Reply-To: <20210723102825.1790112-1-marcandre.lureau@redhat.com>
References: <20210723102825.1790112-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 berrange@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

"chr_option_parsed" is only implemented by the "mux" chardev, we can
specialize the code there to avoid the needless generic class method.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


