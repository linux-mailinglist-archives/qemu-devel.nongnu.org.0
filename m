Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3186FAFEFA
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 16:41:42 +0200 (CEST)
Received: from localhost ([::1]:51780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i83oS-00057t-Ke
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 10:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43799)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Paul.Durrant@citrix.com>) id 1i83jN-0008SW-NA
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 10:36:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Paul.Durrant@citrix.com>) id 1i83jM-0000nX-0g
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 10:36:25 -0400
Received: from esa1.hc3370-68.iphmx.com ([216.71.145.142]:4361)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Paul.Durrant@citrix.com>)
 id 1i83jL-0000mX-Mn
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 10:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568212583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=auGXKVKysMN9D3b+964ysE2DbM/GhqmoifMLLl18yEQ=;
 b=OTiqfQZ6TYjBwIDBIl0B2kt63+4eX5ADEsYWeP9Bdh+mzsMks7BD87Fh
 h6L/hETuIzfYhQJzTw6KN7dG1H/2FipZzZVfPN/bGx2kqKbfm1iicDv3P
 SND1itIfNzZFWUzMjKcaV2dX36cZpfvZFFfBKSNfLy/9JpZqTrM/LXamQ o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YysbEq4yCHilxs2NYypFRclOn+2W+VXz1lQV2gDsOVTFJKoiJmnrX41oyHDgTN9/YrEjQiE3vL
 2Hg8Bvyf9qloqqt5WkzojKs7zmn13F4ECgyRxRHlQp5PQEym2TggwNCQIlkATbYjPUyhtneClf
 ErR/ig/ogRV4LNS8iGJu8lMnxL4hVudEZuzVSOsq6LlPgYsrj7jtUBh05L9KkNhdbae6Cglzjq
 QNRgP9gF4A/Up0hcgDsSrpbGxk64EAKNxSOtdVoo58sIbNgHHTLdytleLk7xCwGjT/4S5G1+uQ
 dhc=
X-SBRS: 2.7
X-MesageID: 5488460
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,493,1559534400"; 
   d="scan'208";a="5488460"
From: Paul Durrant <paul.durrant@citrix.com>
To: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
Date: Wed, 11 Sep 2019 15:36:16 +0100
Message-ID: <20190911143618.23477-2-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb6
In-Reply-To: <20190911143618.23477-1-paul.durrant@citrix.com>
References: <20190911143618.23477-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.145.142
Subject: [Qemu-devel] [PATCH 1/3] xen / notify: introduce a new XenWatchList
 abstraction
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Xenstore watch call-backs are already abstracted away from XenBus using
the XenWatch data structure but the associated NotifierList manipulation
and file handle registation is still open coded in various xen_bus_...()
functions.
This patch creates a new XenWatchList data structure to allow these
interactions to be abstracted away from XenBus as well. This is in
preparation for a subsequent patch which will introduce separate watch lists
for XenBus and XenDevice objects.

NOTE: This patch also introduces a new NotifierListEmpty() helper function
      for the purposes of adding an assertion that a XenWatchList is not
      freed whilst its associated NotifierList is still occupied.

Signed-off-by: Paul Durrant <paul.durrant@citrix.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
---
 hw/xen/trace-events      |   5 +-
 hw/xen/xen-bus.c         | 117 +++++++++++++++++++++++++--------------
 include/hw/xen/xen-bus.h |   3 +-
 include/qemu/notify.h    |   2 +
 util/notify.c            |   5 ++
 5 files changed, 87 insertions(+), 45 deletions(-)

diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index bc82ecb1a5..ac8d9c20d2 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -19,9 +19,8 @@ xen_bus_unrealize(void) ""
 xen_bus_enumerate(void) ""
 xen_bus_type_enumerate(const char *type) "type: %s"
 xen_bus_backend_create(const char *type, const char *path) "type: %s path: %s"
-xen_bus_add_watch(const char *node, const char *key, char *token) "node: %s key: %s token: %s"
-xen_bus_remove_watch(const char *node, const char *key, char *token) "node: %s key: %s token: %s"
-xen_bus_watch(const char *token) "token: %s"
+xen_bus_add_watch(const char *node, const char *key) "node: %s key: %s"
+xen_bus_remove_watch(const char *node, const char *key) "node: %s key: %s"
 xen_device_realize(const char *type, char *name) "type: %s name: %s"
 xen_device_unrealize(const char *type, char *name) "type: %s name: %s"
 xen_device_backend_state(const char *type, char *name, const char *state) "type: %s name: %s -> %s"
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 025df5e59f..28efaccff2 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -157,18 +157,60 @@ static void free_watch(XenWatch *watch)
     g_free(watch);
 }
 
-static XenWatch *xen_bus_add_watch(XenBus *xenbus, const char *node,
-                                   const char *key, XenWatchHandler handler,
-                                   void *opaque, Error **errp)
+struct XenWatchList {
+    struct xs_handle *xsh;
+    NotifierList notifiers;
+};
+
+static void watch_list_event(void *opaque)
+{
+    XenWatchList *watch_list = opaque;
+    char **v;
+    const char *token;
+
+    v = xs_check_watch(watch_list->xsh);
+    if (!v) {
+        return;
+    }
+
+    token = v[XS_WATCH_TOKEN];
+
+    notifier_list_notify(&watch_list->notifiers, (void *)token);
+
+    free(v);
+}
+
+static XenWatchList *watch_list_create(struct xs_handle *xsh)
+{
+    XenWatchList *watch_list = g_new0(XenWatchList, 1);
+
+    g_assert(xsh);
+
+    watch_list->xsh = xsh;
+    notifier_list_init(&watch_list->notifiers);
+    qemu_set_fd_handler(xs_fileno(watch_list->xsh), watch_list_event, NULL,
+                        watch_list);
+
+    return watch_list;
+}
+
+static void watch_list_destroy(XenWatchList *watch_list)
+{
+    g_assert(notifier_list_empty(&watch_list->notifiers));
+    qemu_set_fd_handler(xs_fileno(watch_list->xsh), NULL, NULL, NULL);
+    g_free(watch_list);
+}
+
+static XenWatch *watch_list_add(XenWatchList *watch_list, const char *node,
+                                const char *key, XenWatchHandler handler,
+                                void *opaque, Error **errp)
 {
     XenWatch *watch = new_watch(node, key, handler, opaque);
     Error *local_err = NULL;
 
-    trace_xen_bus_add_watch(watch->node, watch->key, watch->token);
-
-    notifier_list_add(&xenbus->watch_notifiers, &watch->notifier);
+    notifier_list_add(&watch_list->notifiers, &watch->notifier);
 
-    xs_node_watch(xenbus->xsh, node, key, watch->token, &local_err);
+    xs_node_watch(watch_list->xsh, node, key, watch->token, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
 
@@ -181,18 +223,34 @@ static XenWatch *xen_bus_add_watch(XenBus *xenbus, const char *node,
     return watch;
 }
 
-static void xen_bus_remove_watch(XenBus *xenbus, XenWatch *watch,
-                                 Error **errp)
+static void watch_list_remove(XenWatchList *watch_list, XenWatch *watch,
+                              Error **errp)
 {
-    trace_xen_bus_remove_watch(watch->node, watch->key, watch->token);
-
-    xs_node_unwatch(xenbus->xsh, watch->node, watch->key, watch->token,
+    xs_node_unwatch(watch_list->xsh, watch->node, watch->key, watch->token,
                     errp);
 
     notifier_remove(&watch->notifier);
     free_watch(watch);
 }
 
+static XenWatch *xen_bus_add_watch(XenBus *xenbus, const char *node,
+                                   const char *key, XenWatchHandler handler,
+                                   void *opaque, Error **errp)
+{
+    trace_xen_bus_add_watch(node, key);
+
+    return watch_list_add(xenbus->watch_list, node, key, handler, opaque,
+                          errp);
+}
+
+static void xen_bus_remove_watch(XenBus *xenbus, XenWatch *watch,
+                                 Error **errp)
+{
+    trace_xen_bus_remove_watch(watch->node, watch->key);
+
+    watch_list_remove(xenbus->watch_list, watch, errp);
+}
+
 static void xen_bus_backend_create(XenBus *xenbus, const char *type,
                                    const char *name, char *path,
                                    Error **errp)
@@ -338,35 +396,14 @@ static void xen_bus_unrealize(BusState *bus, Error **errp)
         xenbus->backend_watch = NULL;
     }
 
-    if (!xenbus->xsh) {
-        return;
+    if (xenbus->watch_list) {
+        watch_list_destroy(xenbus->watch_list);
+        xenbus->watch_list = NULL;
     }
 
-    qemu_set_fd_handler(xs_fileno(xenbus->xsh), NULL, NULL, NULL);
-
-    xs_close(xenbus->xsh);
-}
-
-static void xen_bus_watch(void *opaque)
-{
-    XenBus *xenbus = opaque;
-    char **v;
-    const char *token;
-
-    g_assert(xenbus->xsh);
-
-    v = xs_check_watch(xenbus->xsh);
-    if (!v) {
-        return;
+    if (xenbus->xsh) {
+        xs_close(xenbus->xsh);
     }
-
-    token = v[XS_WATCH_TOKEN];
-
-    trace_xen_bus_watch(token);
-
-    notifier_list_notify(&xenbus->watch_notifiers, (void *)token);
-
-    free(v);
 }
 
 static void xen_bus_realize(BusState *bus, Error **errp)
@@ -390,9 +427,7 @@ static void xen_bus_realize(BusState *bus, Error **errp)
         xenbus->backend_id = 0; /* Assume lack of node means dom0 */
     }
 
-    notifier_list_init(&xenbus->watch_notifiers);
-    qemu_set_fd_handler(xs_fileno(xenbus->xsh), xen_bus_watch, NULL,
-                        xenbus);
+    xenbus->watch_list = watch_list_create(xenbus->xsh);
 
     module_call_init(MODULE_INIT_XEN_BACKEND);
 
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 1c2d9dfdb8..88b84e29bb 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -14,6 +14,7 @@
 
 typedef void (*XenWatchHandler)(void *opaque);
 
+typedef struct XenWatchList XenWatchList;
 typedef struct XenWatch XenWatch;
 typedef struct XenEventChannel XenEventChannel;
 
@@ -63,7 +64,7 @@ typedef struct XenBus {
     BusState qbus;
     domid_t backend_id;
     struct xs_handle *xsh;
-    NotifierList watch_notifiers;
+    XenWatchList *watch_list;
     XenWatch *backend_watch;
 } XenBus;
 
diff --git a/include/qemu/notify.h b/include/qemu/notify.h
index a3d73e4bc7..bcfa70fb2e 100644
--- a/include/qemu/notify.h
+++ b/include/qemu/notify.h
@@ -40,6 +40,8 @@ void notifier_remove(Notifier *notifier);
 
 void notifier_list_notify(NotifierList *list, void *data);
 
+bool notifier_list_empty(NotifierList *list);
+
 /* Same as Notifier but allows .notify() to return errors */
 typedef struct NotifierWithReturn NotifierWithReturn;
 
diff --git a/util/notify.c b/util/notify.c
index aee8d93cb0..76bab212ae 100644
--- a/util/notify.c
+++ b/util/notify.c
@@ -40,6 +40,11 @@ void notifier_list_notify(NotifierList *list, void *data)
     }
 }
 
+bool notifier_list_empty(NotifierList *list)
+{
+    return QLIST_EMPTY(&list->notifiers);
+}
+
 void notifier_with_return_list_init(NotifierWithReturnList *list)
 {
     QLIST_INIT(&list->notifiers);
-- 
2.20.1.2.gb21ebb6


