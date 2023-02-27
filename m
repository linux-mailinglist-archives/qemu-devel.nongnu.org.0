Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197DD6A40FE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:41:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbpN-0006zk-7X; Mon, 27 Feb 2023 06:37:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboV-0005sL-Mt
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboO-0005iO-Tj
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XxaFHRXWv/AgYuXGgqEIfr86HgQSO7TP/vFbYTzZrxk=;
 b=GzLHEvkeDRCc77KoQZtixVHl5shfJqDAZ6CqT8n2CUC0wPXfPmOXBA8Gnx5HbOEIdYIPOD
 POve7ScfG2c4Zq43jpGZf4Fd/mfXbbI7EjqJywe5aPQubo9WhafygARohP+vBqncvmwtle
 ex0sg7dkLXMcrxMy7H3y5SV++0Dobjo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-2crM0QX4PRW102txMW0IJA-1; Mon, 27 Feb 2023 06:36:53 -0500
X-MC-Unique: 2crM0QX4PRW102txMW0IJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BB0F85CBE2;
 Mon, 27 Feb 2023 11:36:52 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB9681121314;
 Mon, 27 Feb 2023 11:36:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Dinah Baum <dinahbaum123@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 24/33] configure: Add 'mkdir build' check
Date: Mon, 27 Feb 2023 12:36:12 +0100
Message-Id: <20230227113621.58468-25-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

From: Dinah Baum <dinahbaum123@gmail.com>

QEMU configure script goes into an infinite error printing loop
when in read only directory due to 'build' dir never being created.

Checking if 'mkdir dir' succeeds prevents this error.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/321
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
Message-Id: <20230221110631.4142-1-dinahbaum123@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
[thuth: Remove second "touch $MARKER"]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index cf6db3d551..dccb5d4f96 100755
--- a/configure
+++ b/configure
@@ -31,8 +31,12 @@ then
         fi
     fi
 
-    mkdir build
-    touch $MARKER
+    if ! mkdir build || ! touch $MARKER
+    then
+        echo "ERROR: Could not create ./build directory. Check the permissions on"
+        echo "your source directory, or try doing an out-of-tree build."
+        exit 1
+    fi
 
     cat > GNUmakefile <<'EOF'
 # This file is auto-generated by configure to support in-source tree
-- 
2.31.1


