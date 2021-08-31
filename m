Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA473FC8E2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:54:22 +0200 (CEST)
Received: from localhost ([::1]:60532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL4DV-0001lz-AW
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mL3uV-0001s5-CO
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:34:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mL3uT-00011o-OG
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630416881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zESMyLr3hPv0wQdyq+SZg6Zh+sHkBkNauAqq0Fco8+I=;
 b=TDw+/I7qTdSZmreTt/mQQ9/OAdCgdiN1iXcmNuaQIWcVTxT+YtOljgpsUwO/MhjTrdno4D
 VRaQaxIWGIvFlgRg2QjWLPvXqbZlqtQnGBwvH/pSAYARw1NE1xrbvvo5J7lAGsK77TzoRQ
 z7rloZ03iMRLpRHnxp5OVXVob3wXW0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-_xr4zDdkM_CtM2rfjeN9Xw-1; Tue, 31 Aug 2021 09:34:39 -0400
X-MC-Unique: _xr4zDdkM_CtM2rfjeN9Xw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D502101C8A0;
 Tue, 31 Aug 2021 13:34:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96C342AF99;
 Tue, 31 Aug 2021 13:34:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 14/18] ui/vdagent: send empty clipboard when unhandled
Date: Tue, 31 Aug 2021 17:31:28 +0400
Message-Id: <20210831133132.1697228-15-marcandre.lureau@redhat.com>
In-Reply-To: <20210831133132.1697228-1-marcandre.lureau@redhat.com>
References: <20210831133132.1697228-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Rather than leaving the agent timing out or hanging, reply to it with an
empty result.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210805135715.857938-15-marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vdagent.c    | 12 ++++++++++++
 ui/trace-events |  1 +
 2 files changed, 13 insertions(+)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index cd07937a4b..cd49da1ffa 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -375,6 +375,16 @@ static void vdagent_send_clipboard_data(VDAgentChardev *vd,
     vdagent_send_msg(vd, msg);
 }
 
+static void vdagent_send_empty_clipboard_data(VDAgentChardev *vd,
+                                              QemuClipboardSelection selection,
+                                              QemuClipboardType type)
+{
+    g_autoptr(QemuClipboardInfo) info = qemu_clipboard_info_new(&vd->cbpeer, selection);
+
+    trace_vdagent_send_empty_clipboard();
+    vdagent_send_clipboard_data(vd, info, type);
+}
+
 static void vdagent_clipboard_notify(Notifier *notifier, void *data)
 {
     VDAgentChardev *vd = container_of(notifier, VDAgentChardev, cbpeer.update);
@@ -482,6 +492,8 @@ static void vdagent_clipboard_recv_request(VDAgentChardev *vd, uint8_t s, uint32
             vd->cbpending[s] |= (1 << type);
             qemu_clipboard_request(info, type);
         }
+    } else {
+        vdagent_send_empty_clipboard_data(vd, s, type);
     }
 }
 
diff --git a/ui/trace-events b/ui/trace-events
index 1b5f87bc09..b9c0dd0fa1 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -129,6 +129,7 @@ xkeymap_keymap(const char *name) "keymap '%s'"
 vdagent_open(void) ""
 vdagent_close(void) ""
 vdagent_send(const char *name) "msg %s"
+vdagent_send_empty_clipboard(void) ""
 vdagent_recv_chunk(uint32_t size) "size %d"
 vdagent_recv_msg(const char *name, uint32_t size) "msg %s, size %d"
 vdagent_peer_cap(const char *name) "cap %s"
-- 
2.33.0.rc2


