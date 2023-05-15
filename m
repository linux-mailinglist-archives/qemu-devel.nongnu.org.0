Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E722A702E0B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:26:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyYDE-0001t0-Un; Mon, 15 May 2023 09:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pyYCu-0001ke-8L
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:25:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pyYCs-00064c-R9
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684157142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S9o0QNevMqpddJMHQq11zj9p18/ClEXY/7rpkbkNk9w=;
 b=JDau+jaBdX14LcL8d98AosJnea8XSRhcTxaQYr6XBH52nutf3Z+21mvg7oSPu4VLD36GMm
 BjZJMeiTkYm+GSsY+92IH9NZNaAnUbr5wQ2hA6dCTfJDB8Dr48gyOIRVfIOvexYMjAe2nx
 T8ybhQayYuGqLNkwsTZgTcEj5AVFCoA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-foTUavDfPgaeH9kcUqgFiw-1; Mon, 15 May 2023 09:25:40 -0400
X-MC-Unique: foTUavDfPgaeH9kcUqgFiw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9070E3823A02
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 13:25:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A068140C6EC4;
 Mon, 15 May 2023 13:25:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] ui/dbus: add a FIXME about texture/dmabuf scanout handling
Date: Mon, 15 May 2023 17:25:36 +0400
Message-Id: <20230515132537.1026310-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Except SDL, display backends seem to fail at handing full scanout
geometry correctly. It would need some test/reproducer to actually check
it. In the meantime, fill some missing fields, and leave a FIXME.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/dbus-listener.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
index defe2220c0..23034eebf9 100644
--- a/ui/dbus-listener.c
+++ b/ui/dbus-listener.c
@@ -102,6 +102,7 @@ static void dbus_scanout_dmabuf(DisplayChangeListener *dcl,
         return;
     }
 
+    /* FIXME: add missing x/y/w/h support */
     qemu_dbus_display1_listener_call_scanout_dmabuf(
         ddl->proxy,
         g_variant_new_handle(0),
@@ -129,6 +130,10 @@ static void dbus_scanout_texture(DisplayChangeListener *dcl,
         .width = backing_width,
         .height = backing_height,
         .y0_top = backing_y_0_top,
+        .x = x,
+        .y = y,
+        .scanout_width = w,
+        .scanout_height = h,
     };
 
     assert(tex_id);
-- 
2.40.1


