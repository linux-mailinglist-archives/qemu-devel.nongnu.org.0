Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A9C47BB0E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:31:50 +0100 (CET)
Received: from localhost ([::1]:33456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZcj-0002Nn-TO
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:31:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZD8-0008Ck-Fp
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:05:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZD6-0002Dx-Sn
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4i695WYQfKfo7JWS1MpuRVcRVmXZfC3kjxOk40FWxpY=;
 b=Sccd9dCETL+aiMsPKALch4wlNFUzITpzLVTowbWFizT2xLKKF1Z4PHuVayyGdjVNcp+tqH
 lFucOt/gWsXr2vYP71LDiN2tvS5S/6s6ayavf7TguxW8Zj50Ebx4Cp0TOyWlk+oJVNaifE
 XE9vemmpKCCleDicenoEsQQLqqv91hA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-_dBvqSn0POaZiGLkLStm_A-1; Tue, 21 Dec 2021 02:05:16 -0500
X-MC-Unique: _dBvqSn0POaZiGLkLStm_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EB061853020;
 Tue, 21 Dec 2021 07:05:15 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8C5E7A426;
 Tue, 21 Dec 2021 07:05:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 23/36] docs: add dbus-display documentation
Date: Tue, 21 Dec 2021 10:58:42 +0400
Message-Id: <20211221065855.142578-24-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
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


