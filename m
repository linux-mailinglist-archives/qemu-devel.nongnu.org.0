Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD45734590E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 08:48:46 +0100 (CET)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lObmP-0007hE-88
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 03:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lObl4-0007FV-Kg
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 03:47:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lObl1-0001mA-1f
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 03:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616485635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9v6yLiH2f+jNOIJmBClA34a+uCIPkO+wKMQkruOCW9g=;
 b=aZ+fYHBIWlru4kYv+C373mJ9lIQQi5Y3DViDg92EPu41vPhle5fwOhXg8KyNS8HYuqxI6Y
 PzZJYZC58quIixF6w/SqAzSgtqiyRFyXokLOwAUY83T319YMutsVb9f8aeC/DyGhAebi0o
 cvynV3YMQyEqnVilDcKaDnx9ElEKdfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-MJ9cWjGQMqWucsTR1-FJ-A-1; Tue, 23 Mar 2021 03:47:13 -0400
X-MC-Unique: MJ9cWjGQMqWucsTR1-FJ-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FF635B36B;
 Tue, 23 Mar 2021 07:47:12 +0000 (UTC)
Received: from localhost (unknown [10.36.110.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CE2460BE5;
 Tue, 23 Mar 2021 07:47:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2] docs: simplify each section title
Date: Tue, 23 Mar 2021 11:47:04 +0400
Message-Id: <20210323074704.4078381-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: jsnow@redhat.com, berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Now that we merged into one doc, it makes the nav looks nicer.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
v2:
 - Developers -> Developer Information (suggested by Peter)

 docs/devel/index.rst   | 4 ++--
 docs/interop/index.rst | 4 ++--
 docs/specs/index.rst   | 4 ++--
 docs/system/index.rst  | 4 ++--
 docs/tools/index.rst   | 4 ++--
 docs/user/index.rst    | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 7c424ea6d7..60039faa68 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -1,8 +1,8 @@
 .. This is the top level page for the 'devel' manual.
 
 
-QEMU Developer's Guide
-======================
+Developer Information
+=====================
 
 This manual documents various parts of the internals of QEMU.
 You only need to read it if you are interested in reading or
diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index 95d56495f6..219a5e5fc5 100644
--- a/docs/interop/index.rst
+++ b/docs/interop/index.rst
@@ -1,8 +1,8 @@
 .. This is the top level page for the 'interop' manual.
 
 
-QEMU System Emulation Management and Interoperability Guide
-===========================================================
+System Emulation Management and Interoperability
+================================================
 
 This manual contains documents and specifications that are useful
 for making QEMU interoperate with other software.
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index 1b0eb979d5..7b08314d33 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -1,8 +1,8 @@
 .. This is the top level page for the 'specs' manual
 
 
-QEMU System Emulation Guest Hardware Specifications
-===================================================
+System Emulation Guest Hardware Specifications
+==============================================
 
 
 Contents:
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 6ad9c93806..02d0707181 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -1,8 +1,8 @@
 .. This is the top level page for the 'system' manual.
 
 
-QEMU System Emulation User's Guide
-==================================
+System Emulation
+================
 
 This manual is the overall guide for users using QEMU
 for full system emulation (as opposed to user-mode emulation).
diff --git a/docs/tools/index.rst b/docs/tools/index.rst
index 3a5829c17a..d923834a73 100644
--- a/docs/tools/index.rst
+++ b/docs/tools/index.rst
@@ -1,8 +1,8 @@
 .. This is the top level page for the 'tools' manual
 
 
-QEMU Tools Guide
-================
+Tools
+=====
 
 
 Contents:
diff --git a/docs/user/index.rst b/docs/user/index.rst
index e030dadf65..a5b47459ec 100644
--- a/docs/user/index.rst
+++ b/docs/user/index.rst
@@ -1,8 +1,8 @@
 .. This is the top level page for the 'user' manual.
 
 
-QEMU User Mode Emulation User's Guide
-=====================================
+User Mode Emulation
+===================
 
 This manual is the overall guide for users using QEMU
 for user-mode emulation.  In this mode, QEMU can launch
-- 
2.29.0


