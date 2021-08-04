Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07D53E0701
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 19:56:52 +0200 (CEST)
Received: from localhost ([::1]:59498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBL8N-0007CV-Rx
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 13:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBJ9J-0000tM-59
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:49:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBJ9H-0006KM-7h
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628092177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INJYigyCVoW4cR/1pTHEXIGDHM8nSJFMX+ymiWt53pg=;
 b=EpDd7U/RoLc5y0m7Sr9pYXSlIi3FVa1yQmHFS7ND1HLNHHXy3+E+PZTGhPVU7BTS+CM67u
 x97T4AUd3C2nQMz7YOK0SLWe0Pw0F3R2Ci2YzJMUN5WNX/ewqQqXO7vkGQhhQvLHOJmKiT
 KtsUd/f6zZWiZ6q6M/BV79fhTSSLKvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-8fx8lUfZPSyj4xc3GGqAGg-1; Wed, 04 Aug 2021 11:49:35 -0400
X-MC-Unique: 8fx8lUfZPSyj4xc3GGqAGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC5C2EC1A7
 for <qemu-devel@nongnu.org>; Wed,  4 Aug 2021 15:49:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5F7360C0F;
 Wed,  4 Aug 2021 15:49:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/11] chardev: add some comments about the class methods
Date: Wed,  4 Aug 2021 19:48:41 +0400
Message-Id: <20210804154848.557328-5-marcandre.lureau@redhat.com>
In-Reply-To: <20210804154848.557328-1-marcandre.lureau@redhat.com>
References: <20210804154848.557328-1-marcandre.lureau@redhat.com>
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/chardev/char.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/include/chardev/char.h b/include/chardev/char.h
index 589e7fe46d..a319b5fdff 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -254,24 +254,57 @@ struct ChardevClass {
 
     bool internal; /* TODO: eventually use TYPE_USER_CREATABLE */
     bool supports_yank;
+
+    /* parse command line options and populate QAPI @backend */
     void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 
+    /* called after construction, open/starts the backend */
     void (*open)(Chardev *chr, ChardevBackend *backend,
                  bool *be_opened, Error **errp);
 
+    /* write buf to the backend */
     int (*chr_write)(Chardev *s, const uint8_t *buf, int len);
+
+    /*
+     * Read from the backend (blocking). A typical front-end will instead rely
+     * on chr_can_read/chr_read being called when polling/looping.
+     */
     int (*chr_sync_read)(Chardev *s, const uint8_t *buf, int len);
+
+    /* create a watch on the backend */
     GSource *(*chr_add_watch)(Chardev *s, GIOCondition cond);
+
+    /* update the backend internal sources */
     void (*chr_update_read_handler)(Chardev *s);
+
+    /* send an ioctl to the backend */
     int (*chr_ioctl)(Chardev *s, int cmd, void *arg);
+
+    /* get ancillary-received fds during last read */
     int (*get_msgfds)(Chardev *s, int* fds, int num);
+
+    /* set ancillary fds to be sent with next write */
     int (*set_msgfds)(Chardev *s, int *fds, int num);
+
+    /* accept the given fd */
     int (*chr_add_client)(Chardev *chr, int fd);
+
+    /* wait for a connection */
     int (*chr_wait_connected)(Chardev *chr, Error **errp);
+
+    /* disconnect a connection */
     void (*chr_disconnect)(Chardev *chr);
+
+    /* called by frontend when it can read */
     void (*chr_accept_input)(Chardev *chr);
+
+    /* set terminal echo */
     void (*chr_set_echo)(Chardev *chr, bool echo);
+
+    /* notify the backend of frontend open state */
     void (*chr_set_fe_open)(Chardev *chr, int fe_open);
+
+    /* handle various events */
     void (*chr_be_event)(Chardev *s, QEMUChrEvent event);
 };
 
-- 
2.32.0.264.g75ae10bc75


