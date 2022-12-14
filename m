Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F12664C72E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:32:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5OiD-0007jz-Jj; Wed, 14 Dec 2022 05:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohy-0007e2-6b
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohr-0001Ar-Ht
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671012582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ibPDNC+0uswTwDdm+Dx+xTEDng2WIscZU1LHkNv3XVM=;
 b=hEUYMzjbeBOErsL1pS5ziOIazGBQeEWdZ3XEnZ3gBqfg9qm7RHO4gKJ38mbQ1zjrjV43Zk
 2mTfoty7vkK4iqPC3D8+cIfHJDdQilEF3W2Gsavu/0/PIBNeb51NMR8u1WcQNSGuXcYKHP
 tbxIbk8Ak1WKpkaHggZNIx8Ip3njKTU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-UJWpcrnUN0S65tUxqGRgQw-1; Wed, 14 Dec 2022 05:09:39 -0500
X-MC-Unique: UJWpcrnUN0S65tUxqGRgQw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15220185A78B;
 Wed, 14 Dec 2022 10:09:39 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DF91492C14;
 Wed, 14 Dec 2022 10:09:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 16/23] .gitlab-ci.d/windows.yml: Unify the prerequisite packages
Date: Wed, 14 Dec 2022 11:09:04 +0100
Message-Id: <20221214100911.165291-17-thuth@redhat.com>
In-Reply-To: <20221214100911.165291-1-thuth@redhat.com>
References: <20221214100911.165291-1-thuth@redhat.com>
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

From: Bin Meng <bin.meng@windriver.com>

At present the prerequisite packages for 64-bit and 32-bit builds
are slightly different. Let's use the same packages for both for
easier maintenance in the future.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20221125114100.3184790-1-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/windows.yml | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index a3e7a37022..99d78c2213 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -41,11 +41,15 @@ msys2-64bit:
       mingw-w64-x86_64-gcc
       mingw-w64-x86_64-glib2
       mingw-w64-x86_64-gnutls
+      mingw-w64-x86_64-gtk3
+      mingw-w64-x86_64-libgcrypt
+      mingw-w64-x86_64-libjpeg-turbo
       mingw-w64-x86_64-libnfs
       mingw-w64-x86_64-libpng
       mingw-w64-x86_64-libssh
       mingw-w64-x86_64-libtasn1
       mingw-w64-x86_64-libusb
+      mingw-w64-x86_64-lzo2
       mingw-w64-x86_64-nettle
       mingw-w64-x86_64-ninja
       mingw-w64-x86_64-pixman
@@ -79,16 +83,22 @@ msys2-32bit:
       mingw-w64-i686-gtk3
       mingw-w64-i686-libgcrypt
       mingw-w64-i686-libjpeg-turbo
+      mingw-w64-i686-libnfs
+      mingw-w64-i686-libpng
       mingw-w64-i686-libssh
       mingw-w64-i686-libtasn1
       mingw-w64-i686-libusb
       mingw-w64-i686-lzo2
+      mingw-w64-i686-nettle
       mingw-w64-i686-ninja
       mingw-w64-i686-pixman
       mingw-w64-i686-pkgconf
       mingw-w64-i686-python
+      mingw-w64-i686-SDL2
+      mingw-w64-i686-SDL2_image
       mingw-w64-i686-snappy
-      mingw-w64-i686-usbredir "
+      mingw-w64-i686-usbredir
+      mingw-w64-i686-zstd "
   - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
   - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinG environment
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
-- 
2.31.1


