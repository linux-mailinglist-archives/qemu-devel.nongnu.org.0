Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA925190C2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:55:19 +0200 (CEST)
Received: from localhost ([::1]:43370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0UI-0000Zb-S7
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlyyo-0007o2-TJ
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:18:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlyyn-0003wu-1x
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651609120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+ff3zhC/GfxIJDkyOFSY+KkTq2ShUF4jTiBhEYkeus=;
 b=ZEv7TkC5F7F+igfNsZRJKigA/Mn+VrvGdSEiWkMo48nBr1bx0YjxrZWildMUc/uDmKv+OR
 wvAEvnmJHo4Em0G3PY36obuyKzVVm+tFpVkGpqDz7OXcPNEEKfuIRLf2tR2waRo56XkfCd
 SPb+UgtzlKmunl+Mi0lUTyXiNQDENCE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-IEBB405MOD6F15QR3hYc3Q-1; Tue, 03 May 2022 11:42:16 -0400
X-MC-Unique: IEBB405MOD6F15QR3hYc3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49810140EB89;
 Tue,  3 May 2022 13:14:17 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7067740CFD19;
 Tue,  3 May 2022 13:14:16 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 15/23] io: make qio_channel_command_new_pid() static
Date: Tue,  3 May 2022 17:12:48 +0400
Message-Id: <20220503131256.187238-16-marcandre.lureau@redhat.com>
In-Reply-To: <20220503131256.187238-1-marcandre.lureau@redhat.com>
References: <20220503131256.187238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The function isn't used outside of qio_channel_command_new_spawn(),
which is !win32-specific.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/io/channel-command.h | 25 -------------------------
 io/channel-command.c         | 26 ++++++++++++++++++++++----
 2 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/include/io/channel-command.h b/include/io/channel-command.h
index 27e42bdadc71..305ac1d28066 100644
--- a/include/io/channel-command.h
+++ b/include/io/channel-command.h
@@ -45,31 +45,6 @@ struct QIOChannelCommand {
 };
 
 
-/**
- * qio_channel_command_new_pid:
- * @writefd: the FD connected to the command's stdin
- * @readfd: the FD connected to the command's stdout
- * @pid: the PID of the running child command
- * @errp: pointer to a NULL-initialized error object
- *
- * Create a channel for performing I/O with the
- * previously spawned command identified by @pid.
- * The two file descriptors provide the connection
- * to command's stdio streams, either one or which
- * may be -1 to indicate that stream is not open.
- *
- * The channel will take ownership of the process
- * @pid and will kill it when closing the channel.
- * Similarly it will take responsibility for
- * closing the file descriptors @writefd and @readfd.
- *
- * Returns: the command channel object, or NULL on error
- */
-QIOChannelCommand *
-qio_channel_command_new_pid(int writefd,
-                            int readfd,
-                            pid_t pid);
-
 /**
  * qio_channel_command_new_spawn:
  * @argv: the NULL terminated list of command arguments
diff --git a/io/channel-command.c b/io/channel-command.c
index 539685ea8340..0790ac7895c0 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -26,8 +26,28 @@
 #include "qemu/sockets.h"
 #include "trace.h"
 
-
-QIOChannelCommand *
+#ifndef WIN32
+/**
+ * qio_channel_command_new_pid:
+ * @writefd: the FD connected to the command's stdin
+ * @readfd: the FD connected to the command's stdout
+ * @pid: the PID of the running child command
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Create a channel for performing I/O with the
+ * previously spawned command identified by @pid.
+ * The two file descriptors provide the connection
+ * to command's stdio streams, either one or which
+ * may be -1 to indicate that stream is not open.
+ *
+ * The channel will take ownership of the process
+ * @pid and will kill it when closing the channel.
+ * Similarly it will take responsibility for
+ * closing the file descriptors @writefd and @readfd.
+ *
+ * Returns: the command channel object, or NULL on error
+ */
+static QIOChannelCommand *
 qio_channel_command_new_pid(int writefd,
                             int readfd,
                             pid_t pid)
@@ -44,8 +64,6 @@ qio_channel_command_new_pid(int writefd,
     return ioc;
 }
 
-
-#ifndef WIN32
 QIOChannelCommand *
 qio_channel_command_new_spawn(const char *const argv[],
                               int flags,
-- 
2.36.0.44.g0f828332d5ac


