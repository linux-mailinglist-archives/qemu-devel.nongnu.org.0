Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CF0427DA5
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:28:00 +0200 (CEST)
Received: from localhost ([::1]:60328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJst-0006KR-81
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJg1-0007Oa-Vp
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:14:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJg0-0000Pk-D8
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:14:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633814079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJFNsLpjy9wQdlDr1tGhOKnJwSWPeE6N57r1L7KLMQU=;
 b=ZYiQg5+fIdW9fywxB0zIlAm/YdvAh/pQ16U31TtLq9gW9oX9/xLBOdaXGvzZkfqYxD14gV
 AM5l9fb5OsIZBpohShge0UQLaLqMm4U2/Yu88MqIT1L/DjzdgChEdnjywdpG6+o1jwHrLS
 jPDVqQVSQAwsL6u4xHuTCAkNn4Db2ik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-Fy-ocET6M6eBzCi4uKNvAg-1; Sat, 09 Oct 2021 17:14:30 -0400
X-MC-Unique: Fy-ocET6M6eBzCi4uKNvAg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 284DA8042BD
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:14:29 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 142665D9D3;
 Sat,  9 Oct 2021 21:14:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/37] docs: add dbus-display documentation
Date: Sun, 10 Oct 2021 01:08:25 +0400
Message-Id: <20211009210838.2219430-25-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
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
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Wire up the dbus-display documentation. The interface and feature is
implemented next.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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
index 0000000000..8c6e8e0f5a
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
index be596d3f41..427debc9c5 100644
--- a/docs/interop/dbus.rst
+++ b/docs/interop/dbus.rst
@@ -108,3 +108,5 @@ QEMU Interfaces
 ===============
 
 :doc:`dbus-vmstate`
+
+:doc:`dbus-display`
diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index 47b9ed82bb..c59bac9834 100644
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
index 0000000000..e69de29bb2
-- 
2.33.0.721.g106298f7f9


