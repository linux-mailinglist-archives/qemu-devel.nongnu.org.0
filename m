Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88E8B1997
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 10:25:55 +0200 (CEST)
Received: from localhost ([::1]:41188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8gtu-0007iL-Gp
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 04:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43481)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Paul.Durrant@citrix.com>) id 1i8gp2-0003R1-8D
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 04:20:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Paul.Durrant@citrix.com>) id 1i8gp0-0001fp-NX
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 04:20:52 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:19385)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Paul.Durrant@citrix.com>)
 id 1i8gp0-0001fH-FI
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 04:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568362851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r+osEBdPznGGeg1etSR3kY7dFaqjFIK0TjR7gU3VY6M=;
 b=McBYXWIUkaTFOPeEh9UpM7aWfzra4fGs8S0K19A4uIG1OYsWo6shDVlE
 8PBJOlb4T2quZahNgLH2VI6XIV6Fr/jeNELxiMbh2G152l6blA42UdqaR
 FqFVVKXFa9N+FkrumXdEFUCB6KFhGXNGPK30bLV0YjXCrk/LJvs0KXXoZ g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kzI2M3RltwuAuq1PaIi+j7B2GjE6Viiqil/0AlhgaAI/PDU7bA2+Mmnz6dRyPaTwv9L0a2h4qb
 +Geqg4hvU0rGcxsD2zlmw61Q0WcRF7FOZ4lxrSTUg+Z7us3hIExh5TzUkIStpmeIdnkJ7N4a7c
 WEUhAL4rJcSkH/8R9p9L0bsYxkWqidKnleVRjXuDc0+thN0iThAhXAIL1xB8KOWPj3dThzXNZ4
 3wpNLXyDns28YXtDqFzMG/6bLjuA79KmSP3N31Aut4QRiFEbswHQs3oque+aWXtvSuapsvF39C
 ocI=
X-SBRS: 2.7
X-MesageID: 5522407
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,500,1559534400"; 
   d="scan'208";a="5522407"
From: Paul Durrant <paul.durrant@citrix.com>
To: <qemu-devel@nongnu.org>, <xen-devrel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 09:20:42 +0100
Message-ID: <20190913082043.31288-3-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb6
In-Reply-To: <20190913082043.31288-1-paul.durrant@citrix.com>
References: <20190913082043.31288-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.145.153
Subject: [Qemu-devel] [PATCH v3 2/3] xen: introduce separate XenWatchList
 for XenDevice objects
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

This patch uses the XenWatchList abstraction to add a separate watch list
for each device. This is more scalable than walking a single notifier
list for all watches and is also necessary to implement a bug-fix in a
subsequent patch.

Signed-off-by: Paul Durrant <paul.durrant@citrix.com>
Reviewed-by: Anthony Perard <anthony.perard@citrix.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/xen/trace-events      |  2 ++
 hw/xen/xen-bus.c         | 72 ++++++++++++++++++++++++++++++++--------
 include/hw/xen/xen-bus.h |  2 ++
 3 files changed, 62 insertions(+), 14 deletions(-)

diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index ac8d9c20d2..80ce3dafad 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -29,6 +29,8 @@ xen_device_backend_changed(const char *type, char *name) "type: %s name: %s"
 xen_device_frontend_state(const char *type, char *name, const char *state) "type: %s name: %s -> %s"
 xen_device_frontend_changed(const char *type, char *name) "type: %s name: %s"
 xen_device_unplug(const char *type, char *name) "type: %s name: %s"
+xen_device_add_watch(const char *type, char *name, const char *node, const char *key) "type: %s name: %s node: %s key: %s"
+xen_device_remove_watch(const char *type, char *name, const char *node, const char *key) "type: %s name: %s node: %s key: %s"
 
 # xen-bus-helper.c
 xs_node_create(const char *node) "%s"
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 28efaccff2..810a4e2df3 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -235,11 +235,11 @@ static void watch_list_remove(XenWatchList *watch_list, XenWatch *watch,
 
 static XenWatch *xen_bus_add_watch(XenBus *xenbus, const char *node,
                                    const char *key, XenWatchHandler handler,
-                                   void *opaque, Error **errp)
+                                   Error **errp)
 {
     trace_xen_bus_add_watch(node, key);
 
-    return watch_list_add(xenbus->watch_list, node, key, handler, opaque,
+    return watch_list_add(xenbus->watch_list, node, key, handler, xenbus,
                           errp);
 }
 
@@ -433,7 +433,7 @@ static void xen_bus_realize(BusState *bus, Error **errp)
 
     xenbus->backend_watch =
         xen_bus_add_watch(xenbus, "", /* domain root node */
-                          "backend", xen_bus_enumerate, xenbus, &local_err);
+                          "backend", xen_bus_enumerate, &local_err);
     if (local_err) {
         /* This need not be treated as a hard error so don't propagate */
         error_reportf_err(local_err,
@@ -621,6 +621,31 @@ static void xen_device_backend_changed(void *opaque)
     }
 }
 
+static XenWatch *xen_device_add_watch(XenDevice *xendev, const char *node,
+                                      const char *key,
+                                      XenWatchHandler handler,
+                                      Error **errp)
+{
+    const char *type = object_get_typename(OBJECT(xendev));
+
+    trace_xen_device_add_watch(type, xendev->name, node, key);
+
+    return watch_list_add(xendev->watch_list, node, key, handler, xendev,
+                          errp);
+}
+
+static void xen_device_remove_watch(XenDevice *xendev, XenWatch *watch,
+                                    Error **errp)
+{
+    const char *type = object_get_typename(OBJECT(xendev));
+
+    trace_xen_device_remove_watch(type, xendev->name, watch->node,
+                                  watch->key);
+
+    watch_list_remove(xendev->watch_list, watch, errp);
+}
+
+
 static void xen_device_backend_create(XenDevice *xendev, Error **errp)
 {
     XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
@@ -645,9 +670,9 @@ static void xen_device_backend_create(XenDevice *xendev, Error **errp)
     }
 
     xendev->backend_state_watch =
-        xen_bus_add_watch(xenbus, xendev->backend_path,
-                          "state", xen_device_backend_changed,
-                          xendev, &local_err);
+        xen_device_add_watch(xendev, xendev->backend_path,
+                             "state", xen_device_backend_changed,
+                             &local_err);
     if (local_err) {
         error_propagate_prepend(errp, local_err,
                                 "failed to watch backend state: ");
@@ -655,9 +680,9 @@ static void xen_device_backend_create(XenDevice *xendev, Error **errp)
     }
 
     xendev->backend_online_watch =
-        xen_bus_add_watch(xenbus, xendev->backend_path,
-                          "online", xen_device_backend_changed,
-                          xendev, &local_err);
+        xen_device_add_watch(xendev, xendev->backend_path,
+                             "online", xen_device_backend_changed,
+                             &local_err);
     if (local_err) {
         error_propagate_prepend(errp, local_err,
                                 "failed to watch backend online: ");
@@ -671,12 +696,12 @@ static void xen_device_backend_destroy(XenDevice *xendev)
     Error *local_err = NULL;
 
     if (xendev->backend_online_watch) {
-        xen_bus_remove_watch(xenbus, xendev->backend_online_watch, NULL);
+        xen_device_remove_watch(xendev, xendev->backend_online_watch, NULL);
         xendev->backend_online_watch = NULL;
     }
 
     if (xendev->backend_state_watch) {
-        xen_bus_remove_watch(xenbus, xendev->backend_state_watch, NULL);
+        xen_device_remove_watch(xendev, xendev->backend_state_watch, NULL);
         xendev->backend_state_watch = NULL;
     }
 
@@ -812,8 +837,8 @@ static void xen_device_frontend_create(XenDevice *xendev, Error **errp)
     }
 
     xendev->frontend_state_watch =
-        xen_bus_add_watch(xenbus, xendev->frontend_path, "state",
-                          xen_device_frontend_changed, xendev, &local_err);
+        xen_device_add_watch(xendev, xendev->frontend_path, "state",
+                             xen_device_frontend_changed, &local_err);
     if (local_err) {
         error_propagate_prepend(errp, local_err,
                                 "failed to watch frontend state: ");
@@ -826,7 +851,8 @@ static void xen_device_frontend_destroy(XenDevice *xendev)
     Error *local_err = NULL;
 
     if (xendev->frontend_state_watch) {
-        xen_bus_remove_watch(xenbus, xendev->frontend_state_watch, NULL);
+        xen_device_remove_watch(xendev, xendev->frontend_state_watch,
+                                NULL);
         xendev->frontend_state_watch = NULL;
     }
 
@@ -1122,6 +1148,16 @@ static void xen_device_unrealize(DeviceState *dev, Error **errp)
         xendev->xgth = NULL;
     }
 
+    if (xendev->watch_list) {
+        watch_list_destroy(xendev->watch_list);
+        xendev->watch_list = NULL;
+    }
+
+    if (xendev->xsh) {
+        xs_close(xendev->xsh);
+        xendev->xsh = NULL;
+    }
+
     g_free(xendev->name);
     xendev->name = NULL;
 }
@@ -1164,6 +1200,14 @@ static void xen_device_realize(DeviceState *dev, Error **errp)
 
     trace_xen_device_realize(type, xendev->name);
 
+    xendev->xsh = xs_open(0);
+    if (!xendev->xsh) {
+        error_setg_errno(errp, errno, "failed xs_open");
+        goto unrealize;
+    }
+
+    xendev->watch_list = watch_list_create(xendev->xsh);
+
     xendev->xgth = xengnttab_open(NULL, 0);
     if (!xendev->xgth) {
         error_setg_errno(errp, errno, "failed xengnttab_open");
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 88b84e29bb..0d198148f6 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -22,6 +22,8 @@ typedef struct XenDevice {
     DeviceState qdev;
     domid_t frontend_id;
     char *name;
+    struct xs_handle *xsh;
+    XenWatchList *watch_list;
     char *backend_path, *frontend_path;
     enum xenbus_state backend_state, frontend_state;
     Notifier exit;
-- 
2.20.1.2.gb21ebb6


