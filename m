Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B66B1986
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 10:23:23 +0200 (CEST)
Received: from localhost ([::1]:41158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8grS-0004qg-JJ
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 04:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43480)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Paul.Durrant@citrix.com>) id 1i8gp2-0003R0-7i
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 04:20:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Paul.Durrant@citrix.com>) id 1i8gp0-0001fh-Jj
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 04:20:52 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:19379)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Paul.Durrant@citrix.com>)
 id 1i8gp0-0001eN-Bc
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 04:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568362851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eLGcxY10AzEoEcFv4IR8/MmpdTtjmJMTD2W3sUX56d4=;
 b=QzwOjYufP0uZAHnn3q4ZeP/j4qBuJMfwA4rpwugFAUNA4VdaPR+VwUa6
 qf5Ar54jLoxV8VX3tSe8si1SPTIu8kbsa3sgHKAQxyYIQq4B71Z8rvGPO
 MnWI9KrfU4KZS/B8Gttd9KpV/F+2CA5yiRdaDBg9lU1UJ6JvpdWOWgop6 8=;
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
IronPort-SDR: iTssoMWwfzwfJCPCQQhiM1gbBN5dm10624MLZYPExfnkujNOVfwSzYoACFkX1ds443dKioSI/f
 pd7LuqTn7KAkcFIo6BqFV1OLk5LfnPejs8zocA+TJpu6bJm7jkXHWLoR3Sn0YF2fZ++V94x7LE
 iARkSM1GrTIOTvnCOOPNhridekMArF0u57U/ZHv4BmBMn/ZYGlcq6DkNN2iPATPPCDKKawfFob
 KMXAYbD0Z1fRijRG0GIq+HPdhxH57Mex5R8vIlzPLndWzgVez0Ei9taFKuwCJkM+mkM7eaBRBA
 JZE=
X-SBRS: 2.7
X-MesageID: 5522406
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,500,1559534400"; 
   d="scan'208";a="5522406"
From: Paul Durrant <paul.durrant@citrix.com>
To: <qemu-devel@nongnu.org>, <xen-devrel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 09:20:43 +0100
Message-ID: <20190913082043.31288-4-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb6
In-Reply-To: <20190913082043.31288-1-paul.durrant@citrix.com>
References: <20190913082043.31288-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.145.153
Subject: [Qemu-devel] [PATCH v3 3/3] xen: perform XenDevice clean-up in
 XenBus watch handler
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

Cleaning up offline XenDevice objects directly in
xen_device_backend_changed() is dangerous as xen_device_unrealize() will
modify the watch list that is being walked. Even the QLIST_FOREACH_SAFE()
used in notifier_list_notify() is insufficient as *two* notifiers (for
the frontend and backend watches) are removed, thus potentially rendering
the 'next' pointer unsafe.

The solution is to use the XenBus backend_watch handler to do the clean-up
instead, as it is invoked whilst walking a separate watch list.

This patch therefore adds a new 'inactive_devices' list to XenBus, to which
offline devices are added by xen_device_backend_changed(). The XenBus
backend_watch registration is also changed to not only invoke
xen_bus_enumerate() but also a new xen_bus_cleanup() function, which will
walk 'inactive_devices' and perform the necessary actions.
For safety an extra 'online' check is also added to xen_bus_type_enumerate()
to make sure that no attempt is made to create a new XenDevice object for a
backend that is offline.

NOTE: This patch also includes some cosmetic changes:
      - substitute the local variable name 'backend_state'
        in xen_bus_type_enumerate() with 'state', since there
        is no ambiguity with any other state in that context.
      - change xen_device_state_is_active() to
        xen_device_frontend_is_active() (and pass a XenDevice directly)
        since the state tests contained therein only apply to a frontend.
      - use 'state' rather then 'xendev->backend_state' in
        xen_device_backend_changed() to shorten the code.

Signed-off-by: Paul Durrant <paul.durrant@citrix.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>

v3:
 - s/offline_devices/inactive_devices/g
 - Also add an 'inactive' boolean to XenDevice which is set when the
   device is added to the inactive list so we really can make sure that it
   doesn't happen more than once

v2:
 - Make sure we don't try to add a XenDevice to 'offline_devices' more than
   once
---
 hw/xen/trace-events      |  2 +
 hw/xen/xen-bus.c         | 94 +++++++++++++++++++++++++++++-----------
 include/hw/xen/xen-bus.h |  3 ++
 3 files changed, 74 insertions(+), 25 deletions(-)

diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index 80ce3dafad..e6885bc751 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -17,8 +17,10 @@ xen_domid_restrict(int err) "err: %u"
 xen_bus_realize(void) ""
 xen_bus_unrealize(void) ""
 xen_bus_enumerate(void) ""
+xen_bus_cleanup(void) ""
 xen_bus_type_enumerate(const char *type) "type: %s"
 xen_bus_backend_create(const char *type, const char *path) "type: %s path: %s"
+xen_bus_device_cleanup(const char *type, char *name) "type: %s name: %s"
 xen_bus_add_watch(const char *node, const char *key) "node: %s key: %s"
 xen_bus_remove_watch(const char *node, const char *key) "node: %s key: %s"
 xen_device_realize(const char *type, char *name) "type: %s name: %s"
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 810a4e2df3..55c157393d 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -340,13 +340,18 @@ static void xen_bus_type_enumerate(XenBus *xenbus, const char *type)
     for (i = 0; i < n; i++) {
         char *backend_path = g_strdup_printf("%s/%s", domain_path,
                                              backend[i]);
-        enum xenbus_state backend_state;
+        enum xenbus_state state;
+        unsigned int online;
 
         if (xs_node_scanf(xenbus->xsh, XBT_NULL, backend_path, "state",
-                          NULL, "%u", &backend_state) != 1)
-            backend_state = XenbusStateUnknown;
+                          NULL, "%u", &state) != 1)
+            state = XenbusStateUnknown;
 
-        if (backend_state == XenbusStateInitialising) {
+        if (xs_node_scanf(xenbus->xsh, XBT_NULL, backend_path, "online",
+                          NULL, "%u", &online) != 1)
+            online = 0;
+
+        if (online && state == XenbusStateInitialising) {
             Error *local_err = NULL;
 
             xen_bus_backend_create(xenbus, type, backend[i], backend_path,
@@ -365,9 +370,8 @@ out:
     g_free(domain_path);
 }
 
-static void xen_bus_enumerate(void *opaque)
+static void xen_bus_enumerate(XenBus *xenbus)
 {
-    XenBus *xenbus = opaque;
     char **type;
     unsigned int i, n;
 
@@ -385,6 +389,45 @@ static void xen_bus_enumerate(void *opaque)
     free(type);
 }
 
+static void xen_bus_device_cleanup(XenDevice *xendev)
+{
+    const char *type = object_get_typename(OBJECT(xendev));
+    Error *local_err = NULL;
+
+    trace_xen_bus_device_cleanup(type, xendev->name);
+
+    g_assert(!xendev->backend_online);
+
+    if (!xen_backend_try_device_destroy(xendev, &local_err)) {
+        object_unparent(OBJECT(xendev));
+    }
+
+    if (local_err) {
+        error_report_err(local_err);
+    }
+}
+
+static void xen_bus_cleanup(XenBus *xenbus)
+{
+    XenDevice *xendev, *next;
+
+    trace_xen_bus_cleanup();
+
+    QLIST_FOREACH_SAFE(xendev, &xenbus->inactive_devices, list, next) {
+        g_assert(xendev->inactive);
+        QLIST_REMOVE(xendev, list);
+        xen_bus_device_cleanup(xendev);
+    }
+}
+
+static void xen_bus_backend_changed(void *opaque)
+{
+    XenBus *xenbus = opaque;
+
+    xen_bus_enumerate(xenbus);
+    xen_bus_cleanup(xenbus);
+}
+
 static void xen_bus_unrealize(BusState *bus, Error **errp)
 {
     XenBus *xenbus = XEN_BUS(bus);
@@ -433,7 +476,7 @@ static void xen_bus_realize(BusState *bus, Error **errp)
 
     xenbus->backend_watch =
         xen_bus_add_watch(xenbus, "", /* domain root node */
-                          "backend", xen_bus_enumerate, &local_err);
+                          "backend", xen_bus_backend_changed, &local_err);
     if (local_err) {
         /* This need not be treated as a hard error so don't propagate */
         error_reportf_err(local_err,
@@ -555,9 +598,9 @@ static void xen_device_backend_set_online(XenDevice *xendev, bool online)
  * Tell from the state whether the frontend is likely alive,
  * i.e. it will react to a change of state of the backend.
  */
-static bool xen_device_state_is_active(enum xenbus_state state)
+static bool xen_device_frontend_is_active(XenDevice *xendev)
 {
-    switch (state) {
+    switch (xendev->frontend_state) {
     case XenbusStateInitWait:
     case XenbusStateInitialised:
     case XenbusStateConnected:
@@ -594,30 +637,31 @@ static void xen_device_backend_changed(void *opaque)
      * state to Closing, but there is no active frontend then set the
      * backend state to Closed.
      */
-    if (xendev->backend_state == XenbusStateClosing &&
-        !xen_device_state_is_active(xendev->frontend_state)) {
+    if (state == XenbusStateClosing &&
+        !xen_device_frontend_is_active(xendev)) {
         xen_device_backend_set_state(xendev, XenbusStateClosed);
     }
 
     /*
      * If a backend is still 'online' then we should leave it alone but,
-     * if a backend is not 'online', then the device should be destroyed
-     * once the state is Closed.
+     * if a backend is not 'online', then the device is a candidate
+     * for destruction. Hence add it to the 'inactive' list to be cleaned
+     * by xen_bus_cleanup().
      */
-    if (!xendev->backend_online &&
-        (xendev->backend_state == XenbusStateClosed ||
-         xendev->backend_state == XenbusStateInitialising ||
-         xendev->backend_state == XenbusStateInitWait ||
-         xendev->backend_state == XenbusStateUnknown)) {
-        Error *local_err = NULL;
+    if (!online &&
+        (state == XenbusStateClosed ||  state == XenbusStateInitialising ||
+         state == XenbusStateInitWait || state == XenbusStateUnknown) &&
+        !xendev->inactive) {
+        XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
 
-        if (!xen_backend_try_device_destroy(xendev, &local_err)) {
-            object_unparent(OBJECT(xendev));
-        }
+        xendev->inactive = true;
+        QLIST_INSERT_HEAD(&xenbus->inactive_devices, xendev, list);
 
-        if (local_err) {
-            error_report_err(local_err);
-        }
+        /*
+         * Re-write the state to cause a XenBus backend_watch notification,
+         * resulting in a call to xen_bus_cleanup().
+         */
+        xen_device_backend_printf(xendev, "state", "%u", state);
     }
 }
 
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 0d198148f6..3d5532258d 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -32,7 +32,9 @@ typedef struct XenDevice {
     XenWatch *backend_online_watch;
     xengnttab_handle *xgth;
     bool feature_grant_copy;
+    bool inactive;
     QLIST_HEAD(, XenEventChannel) event_channels;
+    QLIST_ENTRY(XenDevice) list;
 } XenDevice;
 
 typedef char *(*XenDeviceGetName)(XenDevice *xendev, Error **errp);
@@ -68,6 +70,7 @@ typedef struct XenBus {
     struct xs_handle *xsh;
     XenWatchList *watch_list;
     XenWatch *backend_watch;
+    QLIST_HEAD(, XenDevice) inactive_devices;
 } XenBus;
 
 typedef struct XenBusClass {
-- 
2.20.1.2.gb21ebb6


