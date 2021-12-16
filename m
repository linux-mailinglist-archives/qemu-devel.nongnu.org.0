Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E810476C4C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 09:57:47 +0100 (CET)
Received: from localhost ([::1]:37908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmaA-0001Lk-C6
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 03:57:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUV-0000gM-FG
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUS-0004CR-Id
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639644712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I73YxAkK7/a5dq5AEd6M8maBVnGUGHReNTrmVO11LMU=;
 b=G9NSMv4GcsarfxaGmG+Ka0WBSt+MExDxW9yVnmrcWj4oDaN/EDTURtSO3GV8YMPE02yTcH
 nFycoQ0OstIcwdQy/tAhjfKkPCMGqld10k+ccbawepV/UYtmdch0WFqZII0Icj7xIUfYJ9
 ypL/v2ta8Ls0G41ARdHDU0APogS1+VE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-cZtEp9EmPZyf2xzdBU7row-1; Thu, 16 Dec 2021 03:51:50 -0500
X-MC-Unique: cZtEp9EmPZyf2xzdBU7row-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E82AA100D680
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:49 +0000 (UTC)
Received: from avogadro.mxp.redhat.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 696442BE77
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:49 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/10] configure: remove unnecessary symlinks
Date: Thu, 16 Dec 2021 09:51:39 +0100
Message-Id: <20211216085139.99682-11-pbonzini@redhat.com>
In-Reply-To: <20211216085139.99682-1-pbonzini@redhat.com>
References: <20211216085139.99682-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make pc-bios/meson.build use the files in the source tree as inputs
to bzip2.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure           | 1 -
 pc-bios/meson.build | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/configure b/configure
index 2cecbd4c66..7751cc31b8 100755
--- a/configure
+++ b/configure
@@ -3817,7 +3817,6 @@ for bios_file in \
     $source_path/pc-bios/*.img \
     $source_path/pc-bios/openbios-* \
     $source_path/pc-bios/u-boot.* \
-    $source_path/pc-bios/edk2-*.fd.bz2 \
     $source_path/pc-bios/palcode-* \
     $source_path/pc-bios/qemu_vga.ndrv
 
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index b40ff3f2bd..1812a4084f 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -15,7 +15,7 @@ if unpack_edk2_blobs
     roms += custom_target(f,
                   build_by_default: have_system,
                   output: f,
-                  input: '@0@.bz2'.format(f),
+                  input: files('@0@.bz2'.format(f)),
                   capture: true,
                   install: get_option('install_blobs'),
                   install_dir: qemu_datadir,
-- 
2.33.1


