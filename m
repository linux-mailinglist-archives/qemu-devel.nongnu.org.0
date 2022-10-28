Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28A16112AF
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:27:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPLM-0001vL-Qy; Fri, 28 Oct 2022 09:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKe-0001IZ-7E
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKZ-0005Je-1D
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PpGS5x9FOAIUACrPdv1wbO80lJPdiwA7Fim56HceA0M=;
 b=FOu6qglcJ3oLhzHvsWoaD434HcDxnnl0nnFkBAUPKj4JDXZ/8Hfnyb1xuEfPzwaRBr/VXa
 I8+atnDpiEWFEuwp22ONF7/Uc+TZvO+1Vyewkscx/SXVlEuQagoAU8qbYxcx0HnzgjJx1P
 FH78j7YPutx8XLTL1MqSSSCtnwtKFts=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-tE0LvzkKNRKp0jcrgIyP1w-1; Fri, 28 Oct 2022 09:23:25 -0400
X-MC-Unique: tE0LvzkKNRKp0jcrgIyP1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A33B12A59577;
 Fri, 28 Oct 2022 13:23:24 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B90AD112131B;
 Fri, 28 Oct 2022 13:23:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>
Subject: [PULL 11/21] tests/vm: update openbsd to release 7.2
Date: Fri, 28 Oct 2022 15:22:54 +0200
Message-Id: <20221028132304.829103-12-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Brad Smith <brad@comstyle.com>

tests/vm: update openbsd to release 7.2

Signed-off-by: Brad Smith <brad@comstyle.com>
Message-Id: <Y1TKVwNKvk+euT/s@humpty.home.comstyle.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/openbsd | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 6f1b6f5b98..eaeb201e91 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
     name = "openbsd"
     arch = "x86_64"
 
-    link = "https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/install71.iso"
-    csum = "d3a7c5b9bf890bc404304a1c96f9ee72e1d9bbcf9cc849c1133bdb0d67843396"
+    link = "https://cdn.openbsd.org/pub/OpenBSD/7.2/amd64/install72.iso"
+    csum = "0369ef40a3329efcb978c578c7fdc7bda71e502aecec930a74b44160928c91d3"
     size = "20G"
     pkgs = [
         # tools
@@ -56,6 +56,9 @@ class OpenBSDVM(basevm.BaseVM):
 
         # libs: migration
         "zstd",
+
+        # libs: networking
+        "libslirp",
     ]
 
     BUILD_SCRIPT = """
-- 
2.31.1


