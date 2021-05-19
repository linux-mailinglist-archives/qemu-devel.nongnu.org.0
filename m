Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F863886D9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 07:42:32 +0200 (CEST)
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljEyV-0002g8-PB
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 01:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ljEwB-0000Cv-L8
 for qemu-devel@nongnu.org; Wed, 19 May 2021 01:40:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ljEw8-0001im-Fe
 for qemu-devel@nongnu.org; Wed, 19 May 2021 01:40:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621402803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wiCETXVCuMYJVkRzKBIdII4ftgIXftaZPUA1JVYM84Y=;
 b=D3YSyRIqMOpgqvB+7s6mGsFGQkZTknGMRz+YEumr++sPJUDZvIUGhibikNMkTND5VQhvj0
 S1pFSsvXsbm10J+NVpfBxiOuVNB2p/Veo4Z51O1xF/1g/+sFlKvg3JcGLvnu3zd7Dgi9zc
 m7wAJz23EdKKQ6oFcFn+fYT9Ky8vFQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-ajGQhuKhMa2gtJdNz5lkLQ-1; Wed, 19 May 2021 01:40:01 -0400
X-MC-Unique: ajGQhuKhMa2gtJdNz5lkLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC6C510082E0
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 05:40:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A94C2ED6B;
 Wed, 19 May 2021 05:39:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8364318007B8; Wed, 19 May 2021 07:39:40 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/9] ui: add clipboard documentation
Date: Wed, 19 May 2021 07:39:34 +0200
Message-Id: <20210519053940.1888907-4-kraxel@redhat.com>
In-Reply-To: <20210519053940.1888907-1-kraxel@redhat.com>
References: <20210519053940.1888907-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document clipboard infrastructure in qemu.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/clipboard.h | 133 ++++++++++++++++++++++++++++++++++++++++-
 docs/devel/index.rst   |   1 +
 docs/devel/ui.rst      |   8 +++
 3 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 docs/devel/ui.rst

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
index 876de7621911..e5bcb365ed62 100644
--- a/include/ui/clipboard.h
+++ b/include/ui/clipboard.h
@@ -3,17 +3,47 @@
 
 #include "qemu/notify.h"
 
+/**
+ * DOC: Introduction
+ *
+ * The header ``ui/clipboard.h`` declares the qemu clipboard interface.
+ *
+ * All qemu elements which want use the clipboard can register as
+ * clipboard peer.  Subsequently they can set the clipboard content
+ * and get notifications for clipboard updates.
+ *
+ * Typical users are user interfaces (gtk), remote access protocols
+ * (vnc) and devices talking to the guest (vdagent).
+ *
+ * Even though the design allows different data types only plain text
+ * is supported for now.
+ */
+
 typedef enum QemuClipboardType QemuClipboardType;
 typedef enum QemuClipboardSelection QemuClipboardSelection;
 typedef struct QemuClipboardPeer QemuClipboardPeer;
 typedef struct QemuClipboardInfo QemuClipboardInfo;
 
+/**
+ * enum QemuClipboardType
+ *
+ * @QEMU_CLIPBOARD_TYPE_TEXT: text/plain; charset=utf-8
+ * @QEMU_CLIPBOARD_TYPE__COUNT: type count.
+ */
 enum QemuClipboardType {
-    QEMU_CLIPBOARD_TYPE_TEXT,  /* text/plain; charset=utf-8 */
+    QEMU_CLIPBOARD_TYPE_TEXT,
     QEMU_CLIPBOARD_TYPE__COUNT,
 };
 
 /* same as VD_AGENT_CLIPBOARD_SELECTION_* */
+/**
+ * enum QemuClipboardSelection
+ *
+ * @QEMU_CLIPBOARD_SELECTION_CLIPBOARD: clipboard (explitcit cut+paste).
+ * @QEMU_CLIPBOARD_SELECTION_PRIMARY: primary selection (select + middle mouse button).
+ * @QEMU_CLIPBOARD_SELECTION_SECONDARY: secondary selection (dunno).
+ * @QEMU_CLIPBOARD_SELECTION__COUNT: selection count.
+ */
 enum QemuClipboardSelection {
     QEMU_CLIPBOARD_SELECTION_CLIPBOARD,
     QEMU_CLIPBOARD_SELECTION_PRIMARY,
@@ -21,6 +51,15 @@ enum QemuClipboardSelection {
     QEMU_CLIPBOARD_SELECTION__COUNT,
 };
 
+/**
+ * struct QemuClipboardPeer
+ *
+ * @name: peer name.
+ * @update: notifier for clipboard updates.
+ * @request: callback for clipboard data requests.
+ *
+ * Clipboard peer description.
+ */
 struct QemuClipboardPeer {
     const char *name;
     Notifier update;
@@ -28,6 +67,16 @@ struct QemuClipboardPeer {
                     QemuClipboardType type);
 };
 
+/**
+ * struct QemuClipboardInfo
+ *
+ * @refcount: reference counter.
+ * @owner: clipboard owner.
+ * @selection: clipboard selection.
+ * @types: clipboard data array (one entry per type).
+ *
+ * Clipboard content data and metadata.
+ */
 struct QemuClipboardInfo {
     uint32_t refcount;
     QemuClipboardPeer *owner;
@@ -40,18 +89,100 @@ struct QemuClipboardInfo {
     } types[QEMU_CLIPBOARD_TYPE__COUNT];
 };
 
+/**
+ * qemu_clipboard_peer_register
+ *
+ * @peer: peer information.
+ *
+ * Register clipboard peer.  Registering is needed for both active
+ * (set+grab clipboard) and passive (watch clipboard for updates)
+ * interaction with the qemu clipboard.
+ */
 void qemu_clipboard_peer_register(QemuClipboardPeer *peer);
+
+/**
+ * qemu_clipboard_peer_unregister
+ *
+ * @peer: peer information.
+ *
+ * Unregister clipboard peer.
+ */
 void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer);
 
+/**
+ * qemu_clipboard_info_new
+ *
+ * @owner: clipboard owner.
+ * @selection: clipboard selection.
+ *
+ * Allocate a new QemuClipboardInfo and initialize it with the given
+ * @owner and @selection.
+ *
+ * QemuClipboardInfo is a reference-counted struct.  The new struct is
+ * returned with a reference already taken (i.e. reference count is
+ * one).
+ */
 QemuClipboardInfo *qemu_clipboard_info_new(QemuClipboardPeer *owner,
                                            QemuClipboardSelection selection);
+/**
+ * qemu_clipboard_info_ref
+ *
+ * @info: clipboard info.
+ *
+ * Increase @info reference count.
+ */
 QemuClipboardInfo *qemu_clipboard_info_ref(QemuClipboardInfo *info);
+
+/**
+ * qemu_clipboard_info_unref
+ *
+ * @info: clipboard info.
+ *
+ * Decrease @info reference count.  When the count goes down to zero
+ * free the @info struct itself and all clipboard data.
+ */
 void qemu_clipboard_info_unref(QemuClipboardInfo *info);
 
+/**
+ * qemu_clipboard_update
+ *
+ * @info: clipboard info.
+ *
+ * Update the qemu clipboard.  Notify all registered peers (including
+ * the clipboard owner) that the qemu clipboard has been updated.
+ *
+ * This is used for both new completely clipboard content and for
+ * clipboard data updates in response to qemu_clipboard_request()
+ * calls.
+ */
 void qemu_clipboard_update(QemuClipboardInfo *info);
+
+/**
+ * qemu_clipboard_request
+ *
+ * @info: clipboard info.
+ * @type: clipboard data type.
+ *
+ * Request clipboard content.  Typically the clipboard owner only
+ * advertises the available data types and provides the actual data
+ * only on request.
+ */
 void qemu_clipboard_request(QemuClipboardInfo *info,
                             QemuClipboardType type);
 
+/**
+ * qemu_clipboard_set_data
+ *
+ * @peer: clipboard peer.
+ * @info: clipboard info.
+ * @type: clipboard data type.
+ * @size: data size.
+ * @data: data blob.
+ * @update: notify peers about the update.
+ *
+ * Set clipboard content for the given @type.  This function will make
+ * a copy of the content data and store that.
+ */
 void qemu_clipboard_set_data(QemuClipboardPeer *peer,
                              QemuClipboardInfo *info,
                              QemuClipboardType type,
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 6cf7e2d2330c..cbdbb9049182 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -36,6 +36,7 @@ Contents:
    multi-thread-tcg
    tcg-plugins
    bitops
+   ui
    reset
    s390-dasd-ipl
    clocks
diff --git a/docs/devel/ui.rst b/docs/devel/ui.rst
new file mode 100644
index 000000000000..06c7d622ce74
--- /dev/null
+++ b/docs/devel/ui.rst
@@ -0,0 +1,8 @@
+=================
+Qemu UI subsystem
+=================
+
+Qemu Clipboard
+--------------
+
+.. kernel-doc:: include/ui/clipboard.h
-- 
2.31.1


