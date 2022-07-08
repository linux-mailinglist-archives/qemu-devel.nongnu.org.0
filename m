Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A6656BE18
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:21:18 +0200 (CEST)
Received: from localhost ([::1]:36344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qjF-0005XS-5c
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9q0j-0006ov-VI
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:35:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9q0f-0007Mp-7t
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657294510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MCxiLXVDAQ4RvrwfowDdHWd8d3bmgStGi1J4qUBeBT0=;
 b=hC2cQOzTvo/OVxNMSjIH/Osrp6t3M2KTZxjDPh3uDHLl4xRXYlRhnBrLMiupj8yhTODgGs
 bAzF42ySTxspETPThyJJ0yP2svIjUg5oW4qOtuGeesKrh3ev0HPGH6f/8z5Izp9Yos4bIT
 atPSubgOPiIw/aE9tzNUGTpoS3pfEjM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-3MY9CoNQNJKoVCQMWcUALw-1; Fri, 08 Jul 2022 11:35:07 -0400
X-MC-Unique: 3MY9CoNQNJKoVCQMWcUALw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5F9380390C;
 Fri,  8 Jul 2022 15:35:06 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3988B2EFA1;
 Fri,  8 Jul 2022 15:35:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Berrange <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v4 03/12] tests/vm: switch CentOS 8 to CentOS 8 Stream
Date: Fri,  8 Jul 2022 11:34:54 -0400
Message-Id: <20220708153503.18864-4-jsnow@redhat.com>
In-Reply-To: <20220708153503.18864-1-jsnow@redhat.com>
References: <20220708153503.18864-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The old CentOS image didn't work anymore because it was already EOL at
the beginning of 2022.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/vm/centos | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/vm/centos b/tests/vm/centos
index be4f6ff2f14..3a527c47b3d 100755
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
2.34.3


