Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4223B4A4D44
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 18:31:39 +0100 (CET)
Received: from localhost ([::1]:36170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEaWe-0006qF-S2
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 12:31:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEa6e-0001Nw-UD
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:04:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEa6a-0007Qe-5s
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:04:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643648679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AjRoL5UfHDemeFhbzG7hZg3xYEjOqguiS98C3iU897g=;
 b=T9OlSj2vLzDsaW51deq0U/9exK++KMhGiydM3rh0awydRNkxVKP3NCs82DIlPu4C5pNb/o
 KfTIY466vqsMlw6ENq5O8it1PLIhrajGVN56zZLT75iYhwOQ8uelZMo18DeiAjPAOFU+fY
 u0CTujUvd8dlxDBpSj1myB2E6WRDXaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-vV0ItUzdOSiwwhZNKgdHmA-1; Mon, 31 Jan 2022 12:04:38 -0500
X-MC-Unique: vV0ItUzdOSiwwhZNKgdHmA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3649F1124C64;
 Mon, 31 Jan 2022 17:04:22 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17EBE10A48D5;
 Mon, 31 Jan 2022 17:04:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/5] docs: Only mention iscsi in the man page when available
Date: Mon, 31 Jan 2022 18:04:08 +0100
Message-Id: <20220131170411.125198-3-kwolf@redhat.com>
In-Reply-To: <20220131170411.125198-1-kwolf@redhat.com>
References: <20220131170411.125198-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 timao@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If libiscsi is disabled in the build, the man page shouldn't contain
information on how to construct iscsi URLs etc.

This patch is best viewed with whitespace changes ignored.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/system/device-url-syntax.rst.inc | 60 ++++++++++++++-------------
 qemu-options.hx                       |  9 ++--
 2 files changed, 37 insertions(+), 32 deletions(-)

diff --git a/docs/system/device-url-syntax.rst.inc b/docs/system/device-url-syntax.rst.inc
index 7dbc525fa8..c882bce418 100644
--- a/docs/system/device-url-syntax.rst.inc
+++ b/docs/system/device-url-syntax.rst.inc
@@ -1,47 +1,49 @@
 
 In addition to using normal file images for the emulated storage
-devices, QEMU can also use networked resources such as iSCSI devices.
-These are specified using a special URL syntax.
+devices, QEMU can also use networked resources. These are specified using a
+special URL syntax.
 
-``iSCSI``
-   iSCSI support allows QEMU to access iSCSI resources directly and use
-   as images for the guest storage. Both disk and cdrom images are
-   supported.
+.. only:: not DISABLE_LIBISCSI
 
-   Syntax for specifying iSCSI LUNs is
-   "iscsi://<target-ip>[:<port>]/<target-iqn>/<lun>"
+    ``iSCSI``
+       iSCSI support allows QEMU to access iSCSI resources directly and use
+       as images for the guest storage. Both disk and cdrom images are
+       supported.
 
-   By default qemu will use the iSCSI initiator-name
-   'iqn.2008-11.org.linux-kvm[:<name>]' but this can also be set from
-   the command line or a configuration file.
+       Syntax for specifying iSCSI LUNs is
+       "iscsi://<target-ip>[:<port>]/<target-iqn>/<lun>"
 
-   Since version QEMU 2.4 it is possible to specify a iSCSI request
-   timeout to detect stalled requests and force a reestablishment of the
-   session. The timeout is specified in seconds. The default is 0 which
-   means no timeout. Libiscsi 1.15.0 or greater is required for this
-   feature.
+       By default qemu will use the iSCSI initiator-name
+       'iqn.2008-11.org.linux-kvm[:<name>]' but this can also be set from
+       the command line or a configuration file.
 
-   Example (without authentication):
+       Since version QEMU 2.4 it is possible to specify a iSCSI request
+       timeout to detect stalled requests and force a reestablishment of the
+       session. The timeout is specified in seconds. The default is 0 which
+       means no timeout. Libiscsi 1.15.0 or greater is required for this
+       feature.
 
-   .. parsed-literal::
+       Example (without authentication):
 
-      |qemu_system| -iscsi initiator-name=iqn.2001-04.com.example:my-initiator \\
-                       -cdrom iscsi://192.0.2.1/iqn.2001-04.com.example/2 \\
-                       -drive file=iscsi://192.0.2.1/iqn.2001-04.com.example/1
+       .. parsed-literal::
 
-   Example (CHAP username/password via URL):
+          |qemu_system| -iscsi initiator-name=iqn.2001-04.com.example:my-initiator \\
+                           -cdrom iscsi://192.0.2.1/iqn.2001-04.com.example/2 \\
+                           -drive file=iscsi://192.0.2.1/iqn.2001-04.com.example/1
 
-   .. parsed-literal::
+       Example (CHAP username/password via URL):
 
-      |qemu_system| -drive file=iscsi://user%password@192.0.2.1/iqn.2001-04.com.example/1
+       .. parsed-literal::
 
-   Example (CHAP username/password via environment variables):
+          |qemu_system| -drive file=iscsi://user%password@192.0.2.1/iqn.2001-04.com.example/1
 
-   .. parsed-literal::
+       Example (CHAP username/password via environment variables):
+
+       .. parsed-literal::
 
-      LIBISCSI_CHAP_USERNAME="user" \\
-      LIBISCSI_CHAP_PASSWORD="password" \\
-      |qemu_system| -drive file=iscsi://192.0.2.1/iqn.2001-04.com.example/1
+          LIBISCSI_CHAP_USERNAME="user" \\
+          LIBISCSI_CHAP_PASSWORD="password" \\
+          |qemu_system| -drive file=iscsi://192.0.2.1/iqn.2001-04.com.example/1
 
 ``NBD``
    QEMU supports NBD (Network Block Devices) both using TCP protocol as
diff --git a/qemu-options.hx b/qemu-options.hx
index ba3ae6a42a..4d3721f1ea 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1363,7 +1363,7 @@ SRST
         If the filename contains comma, you must double it (for instance,
         "file=my,,file" to use file "my,file").
 
-        Special files such as iSCSI devices can be specified using
+        Special files such as for network protocols can be specified using
         protocol specific URLs. See the section for "Device URL Syntax"
         for more information.
 
@@ -1831,8 +1831,11 @@ DEF("iscsi", HAS_ARG, QEMU_OPTION_iscsi,
     "                iSCSI session parameters\n", QEMU_ARCH_ALL)
 
 SRST
-``-iscsi``
-    Configure iSCSI session parameters.
+
+.. only:: not DISABLE_LIBISCSI
+
+    ``-iscsi``
+        Configure iSCSI session parameters.
 ERST
 
 DEFHEADING()
-- 
2.31.1


