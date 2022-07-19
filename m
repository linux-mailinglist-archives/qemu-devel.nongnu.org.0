Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97295793E3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:10:43 +0200 (CEST)
Received: from localhost ([::1]:37264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhNT-0005JG-1Q
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHa-0002oz-Ey
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHY-00030Y-Py
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658214276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eqJhDeJ2CjcW2U1DPOhP20A1Cfj8V8usWwKs8mmbKOs=;
 b=Mnmji99rggzp4dCXKVcwy6mYZCMZnMtcshNJeWOerxp30ERxQE0QKC8qSx8Y67cP+TwhC9
 c7jO2l1NtlTAQTx7WBfHs+ieFN4sk0sUpr2GtU8AMJYPcgcss1FxA2wcxp3ZZ/eckIce6I
 b/eW6U1Spm78WFLbIlb3xYFne7JYzRo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-a9pdntg-Nae1JRfedywspw-1; Tue, 19 Jul 2022 03:04:17 -0400
X-MC-Unique: a9pdntg-Nae1JRfedywspw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27F9A101A54E;
 Tue, 19 Jul 2022 07:04:17 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AFE640CFD0A;
 Tue, 19 Jul 2022 07:04:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 03/14] tests/vm: switch CentOS 8 to CentOS 8 Stream
Date: Tue, 19 Jul 2022 09:04:01 +0200
Message-Id: <20220719070412.16757-4-thuth@redhat.com>
In-Reply-To: <20220719070412.16757-1-thuth@redhat.com>
References: <20220719070412.16757-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: John Snow <jsnow@redhat.com>

The old CentOS image didn't work anymore because it was already EOL at
the beginning of 2022.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220708153503.18864-4-jsnow@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/centos | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/vm/centos b/tests/vm/centos
index be4f6ff2f1..3a527c47b3 100755
--- a/tests/vm/centos
+++ b/tests/vm/centos
@@ -1,8 +1,8 @@
 #!/usr/bin/env python3
 #
-# CentOS image
+# CentOS 8 Stream image
 #
-# Copyright 2018 Red Hat Inc.
+# Copyright 2018, 2022 Red Hat Inc.
 #
 # Authors:
 #  Fam Zheng <famz@redhat.com>
@@ -32,7 +32,7 @@ class CentosVM(basevm.BaseVM):
     """
 
     def build_image(self, img):
-        cimg = self._download_with_cache("https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.x86_64.qcow2")
+        cimg = self._download_with_cache("https://cloud.centos.org/centos/8-stream/x86_64/images/CentOS-Stream-GenericCloud-8-20220125.1.x86_64.qcow2")
         img_tmp = img + ".tmp"
         subprocess.check_call(['cp', '-f', cimg, img_tmp])
         self.exec_qemu_img("resize", img_tmp, "50G")
-- 
2.31.1


