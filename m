Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5438478EE0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 16:04:02 +0100 (CET)
Received: from localhost ([::1]:51982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEm9-0002Xk-4M
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 10:04:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myERu-00047K-Fp
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:43:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myERs-0001of-NB
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639752184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSG78TuWGCC1NmuFibw5NVJmoaUqphOLxLa+Ev+PXQA=;
 b=f1Dg9+fcoXTzyy6bPkfyEYBXYkbBKAC7XeE4w/9yKgrAVyOSjJ12hihDmyRfmu9NffCnzR
 rK4IPdXe37VYaxwSQXIFsw2aZZ05NXSf3V0u6yhlRe5S/Kjvk3upAA4Rss1TUsfipCVLZy
 VPGPfN3iTtWgLMMKvsFu+Wn+aA1ij/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-TMzHGwkSOi-33iPbdCrv_Q-1; Fri, 17 Dec 2021 09:42:58 -0500
X-MC-Unique: TMzHGwkSOi-33iPbdCrv_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0FD7801AAB;
 Fri, 17 Dec 2021 14:42:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C25D178C3E;
 Fri, 17 Dec 2021 14:42:55 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 22/36] docs: move D-Bus VMState documentation to source XML
Date: Fri, 17 Dec 2021 18:37:42 +0400
Message-Id: <20211217143756.1831099-23-marcandre.lureau@redhat.com>
In-Reply-To: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
References: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Use the source XML document as single reference, importing its
documentation via the dbus-doc directive.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/interop/dbus-vmstate.rst | 52 ++++++-----------------------------
 backends/dbus-vmstate1.xml    | 42 +++++++++++++++++++++++++++-
 2 files changed, 49 insertions(+), 45 deletions(-)

diff --git a/docs/interop/dbus-vmstate.rst b/docs/interop/dbus-vmstate.rst
index 1d719c1c604f..5fb3f279e280 100644
--- a/docs/interop/dbus-vmstate.rst
+++ b/docs/interop/dbus-vmstate.rst
@@ -2,9 +2,6 @@
 D-Bus VMState
 =============
 
-Introduction
-============
-
 The QEMU dbus-vmstate object's aim is to migrate helpers' data running
 on a QEMU D-Bus bus. (refer to the :doc:`dbus` document for
 some recommendations on D-Bus usage)
@@ -26,49 +23,16 @@ dbus-vmstate object can be configured with the expected list of
 helpers by setting its ``id-list`` property, with a comma-separated
 ``Id`` list.
 
-Interface
-=========
-
-On object path ``/org/qemu/VMState1``, the following
-``org.qemu.VMState1`` interface should be implemented:
-
-.. code:: xml
-
-  <interface name="org.qemu.VMState1">
-    <property name="Id" type="s" access="read"/>
-    <method name="Load">
-      <arg type="ay" name="data" direction="in"/>
-    </method>
-    <method name="Save">
-      <arg type="ay" name="data" direction="out"/>
-    </method>
-  </interface>
-
-"Id" property
--------------
-
-A string that identifies the helper uniquely. (maximum 256 bytes
-including terminating NUL byte)
-
-.. note::
-
-   The helper ID namespace is a separate namespace. In particular, it is not
-   related to QEMU "id" used in -object/-device objects.
-
-Load(in u8[] bytes) method
---------------------------
-
-The method called on destination with the state to restore.
+.. only:: sphinx4
 
-The helper may be initially started in a waiting state (with
-an --incoming argument for example), and it may resume on success.
+   .. dbus-doc:: backends/dbus-vmstate1.xml
 
-An error may be returned to the caller.
+.. only:: not sphinx4
 
-Save(out u8[] bytes) method
----------------------------
+   .. warning::
+      Sphinx 4 is required to build D-Bus documentation.
 
-The method called on the source to get the current state to be
-migrated. The helper should continue to run normally.
+      This is the content of ``backends/dbus-vmstate1.xml``:
 
-An error may be returned to the caller.
+   .. literalinclude:: ../../backends/dbus-vmstate1.xml
+      :language: xml
diff --git a/backends/dbus-vmstate1.xml b/backends/dbus-vmstate1.xml
index cc8563be4c92..601ee8dc7e4d 100644
--- a/backends/dbus-vmstate1.xml
+++ b/backends/dbus-vmstate1.xml
@@ -1,10 +1,50 @@
-<?xml version="1.0"?>
+<?xml version="1.0" encoding="utf-8"?>
 <node name="/" xmlns:doc="http://www.freedesktop.org/dbus/1.0/doc.dtd">
+  <!--
+      org.qemu.VMState1:
+
+      This interface must be implemented at the object path
+      ``/org/qemu/VMState1`` to support helper migration.
+  -->
   <interface name="org.qemu.VMState1">
+
+    <!--
+        Id:
+
+        A string that identifies the helper uniquely. (maximum 256 bytes
+        including terminating NUL byte)
+
+        .. note::
+
+           The VMState helper ID namespace is its own namespace. In particular,
+           it is not related to QEMU "id" used in -object/-device objects.
+    -->
     <property name="Id" type="s" access="read"/>
+
+    <!--
+        Load:
+        @data: data to restore the state.
+
+        The method called on destination with the state to restore.
+
+        The helper may be initially started in a waiting state (with an
+        ``-incoming`` argument for example), and it may resume on success.
+
+        An error may be returned to the caller.
+    -->
     <method name="Load">
       <arg type="ay" name="data" direction="in"/>
     </method>
+
+    <!--
+        Save:
+        @data: state data to save for later resume.
+
+        The method called on the source to get the current state to be
+        migrated. The helper should continue to run normally.
+
+        An error may be returned to the caller.
+    -->
     <method name="Save">
       <arg type="ay" name="data" direction="out"/>
     </method>
-- 
2.34.1.8.g35151cf07204


