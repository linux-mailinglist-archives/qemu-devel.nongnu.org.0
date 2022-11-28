Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B5963A4ED
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 10:27:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozaPD-0004kk-P1; Mon, 28 Nov 2022 04:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ozaP2-0004gs-Jw
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:26:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ozaP0-0004oO-Sg
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669627574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wUlb39gOYycRIyvstUwgyf9lylM61sSQcpHetS7fANA=;
 b=Yt4byN+7Yay8Wf7CHmSPYAHGLFAlp8MmGtNhS6Qq919707ha8AbNcF6HdMxLUA3GutXBj7
 g8lOFpDisQNPVI1cGkxSwc1Xx5lFSy4PdUqzvXaY7cyINYBvnrYsFgSVJVv008E8xlDCeI
 k45aBusI7pOGVFNwNGY7Fx+ssy90x4c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-p8ZqIq4EPfW9paHgeIEn_w-1; Mon, 28 Nov 2022 04:26:10 -0500
X-MC-Unique: p8ZqIq4EPfW9paHgeIEn_w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D0C1185A792;
 Mon, 28 Nov 2022 09:26:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C64B649BB61;
 Mon, 28 Nov 2022 09:26:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 for-8.0 4/5] roms: Add a README file with some basic
 information
Date: Mon, 28 Nov 2022 10:25:54 +0100
Message-Id: <20221128092555.37102-5-thuth@redhat.com>
In-Reply-To: <20221128092555.37102-1-thuth@redhat.com>
References: <20221128092555.37102-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We're going to ship the contents of the "roms" folder as a separate
tarball, so we should have at least a short README in this folder
for this.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 roms/README.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 roms/README.rst

diff --git a/roms/README.rst b/roms/README.rst
new file mode 100644
index 0000000000..0a80d780e9
--- /dev/null
+++ b/roms/README.rst
@@ -0,0 +1,24 @@
+====================
+QEMU firmware images
+====================
+
+This folder contains the collection of sources for firmware (ROM / BIOS)
+images which are used for the various machines that are emulated by QEMU.
+See the individual sub-folders for more information like requirements for
+building and license statements.
+
+Pre-built binaries of these firmwares can be found in the "pc-bios" folder
+of the main QEMU source tree. It can be browsed online here:
+
+ https://gitlab.com/qemu-project/qemu/-/tree/master/pc-bios
+
+
+Building
+========
+
+The main Makefile provides some targets for building the various firmware
+images in an easy way. Run "make help" in this directory to get a list of
+available build targets.
+
+Note that you might need to install an appropriate cross-compiler for
+compiling certain targets first.
-- 
2.31.1


