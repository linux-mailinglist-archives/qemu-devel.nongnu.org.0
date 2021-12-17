Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0016478F19
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 16:08:31 +0100 (CET)
Received: from localhost ([::1]:34790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEqU-0001xP-0r
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 10:08:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myERx-000492-7c
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:43:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myERv-0001pO-KG
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:43:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639752187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4i695WYQfKfo7JWS1MpuRVcRVmXZfC3kjxOk40FWxpY=;
 b=Gesq+V7D3JdkH19dQX5rc49svdUp1p6kkapa3SH6Wxeb+emkUNsJPl2Sa7TOlvJY64wCFz
 C6RS02rfnCi6stiXuRVUj+mh/vSFUBjoMO80NGMEzVt9ULAx5aAocKlQlOoeWCXwg35hds
 O+Kfk6TMmCFf6TbaQG1bEJ/9UyvATgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-7Almv1sGNXaDoPOdjFQk9w-1; Fri, 17 Dec 2021 09:43:03 -0500
X-MC-Unique: 7Almv1sGNXaDoPOdjFQk9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AC84100CCC0;
 Fri, 17 Dec 2021 14:43:02 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F67F5E26D;
 Fri, 17 Dec 2021 14:43:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 23/36] docs: add dbus-display documentation
Date: Fri, 17 Dec 2021 18:37:43 +0400
Message-Id: <20211217143756.1831099-24-marcandre.lureau@redhat.com>
In-Reply-To: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
References: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Wire up the dbus-display documentation. The interface and feature is
implemented next.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/interop/dbus-display.rst | 31 +++++++++++++++++++++++++++++++
 docs/interop/dbus.rst         |  2 ++
 docs/interop/index.rst        |  1 +
 ui/dbus-display1.xml          |  0
 4 files changed, 34 insertions(+)
 create mode 100644 docs/interop/dbus-display.rst
 create mode 100644 ui/dbus-display1.xml

diff --git a/docs/interop/dbus-display.rst b/docs/interop/dbus-display.rst
new file mode 100644
index 000000000000..8c6e8e0f5a82
--- /dev/null
+++ b/docs/interop/dbus-display.rst
@@ -0,0 +1,31 @@
+D-Bus display
+=============
+
+QEMU can export the VM display through D-Bus (when started with ``-display
+dbus``), to allow out-of-process UIs, remote protocol servers or other
+interactive display usages.
+
+Various specialized D-Bus interfaces are available on different object paths
+under ``/org/qemu/Display1/``, depending on the VM configuration.
+
+QEMU also implements the standard interfaces, such as
+`org.freedesktop.DBus.Introspectable
+<https://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces>`_.
+
+.. contents::
+   :local:
+   :depth: 1
+
+.. only:: sphinx4
+
+   .. dbus-doc:: ui/dbus-display1.xml
+
+.. only:: not sphinx4
+
+   .. warning::
+      Sphinx 4 is required to build D-Bus documentation.
+
+      This is the content of ``ui/dbus-display1.xml``:
+
+   .. literalinclude:: ../../ui/dbus-display1.xml
+      :language: xml
diff --git a/docs/interop/dbus.rst b/docs/interop/dbus.rst
index be596d3f418c..427debc9c504 100644
--- a/docs/interop/dbus.rst
+++ b/docs/interop/dbus.rst
@@ -108,3 +108,5 @@ QEMU Interfaces
 ===============
 
 :doc:`dbus-vmstate`
+
+:doc:`dbus-display`
diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index 47b9ed82bbc0..c59bac983407 100644
--- a/docs/interop/index.rst
+++ b/docs/interop/index.rst
@@ -12,6 +12,7 @@ are useful for making QEMU interoperate with other software.
    bitmaps
    dbus
    dbus-vmstate
+   dbus-display
    live-block-operations
    pr-helper
    qemu-ga
diff --git a/ui/dbus-display1.xml b/ui/dbus-display1.xml
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.34.1.8.g35151cf07204


