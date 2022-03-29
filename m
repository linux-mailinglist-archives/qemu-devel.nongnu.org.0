Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AD64EA810
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 08:44:57 +0200 (CEST)
Received: from localhost ([::1]:46354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ5b5-0001Dh-Vi
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 02:44:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZ5WR-0008Ai-SG
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 02:40:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZ5WP-0005nS-1f
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 02:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648536004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A4wI6u49rU+xekncod0T0RL32HwdKB80Z7mfslR+rJ8=;
 b=S3AvUB6JoQN0ivNdKRtzKju8LOIsr2PA3hA2AO9A9rhOQHaq5JOuuW6wL1SeBD+1iu9XAr
 hnJueG3D+L8gmKkm0u3rP7Axu+wcggwpsgCKDCt4Sy6XcMslEir2T8E3JFf61nMkGzbDRa
 M7raTarkQnjPJQ8YfhEs8I70HldKWWs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-S-qTiFa-OvWMvSzVaBltfw-1; Tue, 29 Mar 2022 02:40:01 -0400
X-MC-Unique: S-qTiFa-OvWMvSzVaBltfw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A54BF8FD0A4;
 Tue, 29 Mar 2022 06:40:00 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A751FC15D61;
 Tue, 29 Mar 2022 06:39:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/lcitool: Do not use a hard-coded /usr/bin/python3 as
 python interpreter
Date: Tue, 29 Mar 2022 08:39:58 +0200
Message-Id: <20220329063958.262669-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running "make lcitool-refresh", this currently uses the hard-coded
/usr/bin/python3 from the script's shebang line for running Python.
That's bad, since neither /usr/bin/python3 is guaranteed to exist, nor
does it honor the python interpreter that the user might have chosen
while running the "configure" script. Thus let's rather use $(PYTHON)
in the Makefile, and improve the shebang line in the script in case
someone runs this directly.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/lcitool/Makefile.include | 2 +-
 tests/lcitool/refresh          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/lcitool/Makefile.include b/tests/lcitool/Makefile.include
index 6b215adcd1..3780185c7c 100644
--- a/tests/lcitool/Makefile.include
+++ b/tests/lcitool/Makefile.include
@@ -14,4 +14,4 @@ lcitool-help: lcitool
 
 lcitool-refresh:
 	$(call quiet-command, cd $(SRC_PATH) && git submodule update --init tests/lcitool/libvirt-ci)
-	$(call quiet-command, $(LCITOOL_REFRESH))
+	$(call quiet-command, $(PYTHON) $(LCITOOL_REFRESH))
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 1f00281b44..2d198ad281 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 #
 # Re-generate container recipes
 #
-- 
2.27.0


