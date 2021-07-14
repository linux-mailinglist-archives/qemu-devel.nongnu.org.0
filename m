Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53F63C7F6B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 09:33:53 +0200 (CEST)
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ZOy-0000He-NQ
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 03:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3ZKS-0002aG-B3
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 03:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3ZKO-000224-Fh
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 03:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626247744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3uTMgvxRZpE2AT7BjBx5T6fQsp8UGlCE7g+4QQOkKKU=;
 b=J+KkQguZ0WmDFnTsb6W9nS61Yd/r9apIpQt2nPa6O3f+lOlbqEVBG3ar1Yo47j8168MIR7
 P12/aOfiL3GjVcp98eh2Zu3xr2+xRYWYYdGKvmN9470y64jmWNQ3e0aS5RPbeANaIxE7y6
 y8wBf8shVIH8M7sopIaEJrIClQZGWZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-H-MvPMiTOKq-Ngga0WnIhg-1; Wed, 14 Jul 2021 03:29:01 -0400
X-MC-Unique: H-MvPMiTOKq-Ngga0WnIhg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91F8E80414D;
 Wed, 14 Jul 2021 07:29:00 +0000 (UTC)
Received: from thuth.com (ovpn-113-199.ams2.redhat.com [10.36.113.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E6BB5D6D1;
 Wed, 14 Jul 2021 07:28:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] configure: Drop obsolete check for the alloc_size attribute
Date: Wed, 14 Jul 2021 09:28:55 +0200
Message-Id: <20210714072855.785566-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We recently bumped our requirement for Clang to at least version 6.0.
And according to:

 https://releases.llvm.org/6.0.0/tools/clang/docs/AttributeReference.html

Clang v6.0 supports the alloc_size attribute. Thus we can drop this
check in the configure script now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/configure b/configure
index a0a32c427c..eee1356814 100755
--- a/configure
+++ b/configure
@@ -3184,18 +3184,6 @@ if ! compile_prog "$glib_cflags" "$glib_libs" ; then
 	       "build target"
 fi
 
-# Silence clang 3.5.0 warnings about glib attribute __alloc_size__ usage
-cat > $TMPC << EOF
-#include <glib.h>
-int main(void) { return 0; }
-EOF
-if ! compile_prog "$glib_cflags -Werror" "$glib_libs" ; then
-    if cc_has_warning_flag "-Wno-unknown-attributes"; then
-        glib_cflags="-Wno-unknown-attributes $glib_cflags"
-        CONFIGURE_CFLAGS="-Wno-unknown-attributes $CONFIGURE_CFLAGS"
-    fi
-fi
-
 # Silence clang warnings triggered by glib < 2.57.2
 cat > $TMPC << EOF
 #include <glib.h>
-- 
2.27.0


