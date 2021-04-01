Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49F53514A1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:57:46 +0200 (CEST)
Received: from localhost ([::1]:47882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvxK-0006Fu-0h
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lRvvm-0004Zi-HL
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lRvvk-0002DD-M1
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617278167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TDgXfIDCvb0dC3eYEQfAL7PIi0M4c4+FxvnilNeC6b8=;
 b=QCat26IbQwUHxHnU0hYLfRqarDi5MCiUoo9iHEV/qpxaeieoyoTa/n+KxpWIXAMTwbJzKx
 MW+syeLxWUMBH1a90vkfpNvdEzZbPVUK8F1/6fYaXh8XOaGgk+YmLvF92hJaR/D/LA74I1
 Xz5a5NcPiEIkcBRp0QHfXvI4iIW1NIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-Wl_0vfBGMnW-uAiK4-BbCw-1; Thu, 01 Apr 2021 07:56:06 -0400
X-MC-Unique: Wl_0vfBGMnW-uAiK4-BbCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2593108BD07;
 Thu,  1 Apr 2021 11:56:04 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4089F5C1BB;
 Thu,  1 Apr 2021 11:55:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 3/9] docs: simplify each section title
Date: Thu,  1 Apr 2021 15:55:26 +0400
Message-Id: <20210401115532.430961-4-marcandre.lureau@redhat.com>
In-Reply-To: <20210401115532.430961-1-marcandre.lureau@redhat.com>
References: <20210401115532.430961-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Now that we merged into one doc, it makes the nav looks nicer.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210323074704.4078381-1-marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
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


