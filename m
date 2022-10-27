Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B64D6101DD
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:40:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7i3-0005AO-Ge; Thu, 27 Oct 2022 14:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gW-0001so-5T
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gP-0002Ws-3p
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Mv62RAWPlYsKAGJ5TM53zn5XrmnL6s0KIU8hAUQa6g=;
 b=ezBc8adukbU/+32gNfjqvEzJOlUv8u0LseKztxJDuuUF990OcVaHtt57Ef8tDC3mOXu5lq
 1JfhT6y2zbXEIDEgOtq9mxTiXJuoZr94lyXKALPIZlY2J6hPSxzdoFCFK3M/7XC1tkonW0
 QLNhE+ZL2cHmhxh588Sz9yIUZ+Gl004=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-9FCDQMKBM0aNLOeLJIRspw-1; Thu, 27 Oct 2022 14:32:46 -0400
X-MC-Unique: 9FCDQMKBM0aNLOeLJIRspw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 975B23802B8D;
 Thu, 27 Oct 2022 18:32:46 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4D071121320;
 Thu, 27 Oct 2022 18:32:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 36/58] monitor: add missing coroutine_fn annotation
Date: Thu, 27 Oct 2022 20:31:24 +0200
Message-Id: <20221027183146.463129-37-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alberto Faria <afaria@redhat.com>

hmp_block_resize and hmp_screendump are defined as a ".coroutine = true" command,
so they must be coroutine_fn.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221013123711.620631-4-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-hmp-cmds.h | 2 +-
 include/monitor/hmp.h          | 3 ++-
 block/monitor/block-hmp-cmds.c | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/block/block-hmp-cmds.h b/include/block/block-hmp-cmds.h
index 50ce0247c3..ba0593c440 100644
--- a/include/block/block-hmp-cmds.h
+++ b/include/block/block-hmp-cmds.h
@@ -38,7 +38,7 @@ void hmp_nbd_server_add(Monitor *mon, const QDict *qdict);
 void hmp_nbd_server_remove(Monitor *mon, const QDict *qdict);
 void hmp_nbd_server_stop(Monitor *mon, const QDict *qdict);
 
-void hmp_block_resize(Monitor *mon, const QDict *qdict);
+void coroutine_fn hmp_block_resize(Monitor *mon, const QDict *qdict);
 void hmp_block_stream(Monitor *mon, const QDict *qdict);
 void hmp_block_passwd(Monitor *mon, const QDict *qdict);
 void hmp_block_set_io_throttle(Monitor *mon, const QDict *qdict);
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index a9cf064ee8..dfbc0c9a2f 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -15,6 +15,7 @@
 #define HMP_H
 
 #include "qemu/readline.h"
+#include "qemu/coroutine.h"
 #include "qapi/qapi-types-common.h"
 
 bool hmp_handle_error(Monitor *mon, Error *err);
@@ -81,7 +82,7 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict);
 void hmp_getfd(Monitor *mon, const QDict *qdict);
 void hmp_closefd(Monitor *mon, const QDict *qdict);
 void hmp_sendkey(Monitor *mon, const QDict *qdict);
-void hmp_screendump(Monitor *mon, const QDict *qdict);
+void coroutine_fn hmp_screendump(Monitor *mon, const QDict *qdict);
 void hmp_chardev_add(Monitor *mon, const QDict *qdict);
 void hmp_chardev_change(Monitor *mon, const QDict *qdict);
 void hmp_chardev_remove(Monitor *mon, const QDict *qdict);
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 939a520d17..b6135e9bfe 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -489,7 +489,7 @@ void hmp_nbd_server_stop(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
-void hmp_block_resize(Monitor *mon, const QDict *qdict)
+void coroutine_fn hmp_block_resize(Monitor *mon, const QDict *qdict)
 {
     const char *device = qdict_get_str(qdict, "device");
     int64_t size = qdict_get_int(qdict, "size");
-- 
2.37.3


