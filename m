Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DBD40AEFC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:34:05 +0200 (CEST)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8ZY-0000Td-88
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mQ859-0006rt-3J
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:02:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mQ856-0000HZ-Uq
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631624556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+z9TupSNpWCsdn1hJ+/WP446zFtWwksDqkjq6KR1lhQ=;
 b=HVUmqdY907xC0MMIjdDJ/slFzvW4eMeozxDAHkplbe02yMIRYg2UWFYb2aYKzfj6BQnRni
 gul8ljhWG66j07PGMZzkIMf7712Hnn6wy2O+4etmxYI2REVhiYNvYp/3pDxm6zdx5KCFo1
 wkBOo5sEoqXZd5euXX4fA4Y3znU72zY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-CKH8NtmIPMmhvFBFh0Hk6w-1; Tue, 14 Sep 2021 09:02:34 -0400
X-MC-Unique: CKH8NtmIPMmhvFBFh0Hk6w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D860B80415A;
 Tue, 14 Sep 2021 13:02:20 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A553819739;
 Tue, 14 Sep 2021 13:02:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] chardev: add some comments about the class methods
Date: Tue, 14 Sep 2021 17:01:28 +0400
Message-Id: <20210914130128.298226-6-marcandre.lureau@redhat.com>
In-Reply-To: <20210914130128.298226-1-marcandre.lureau@redhat.com>
References: <20210914130128.298226-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210804154848.557328-5-marcandre.lureau@redhat.com>
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
2.33.0.113.g6c40894d24


