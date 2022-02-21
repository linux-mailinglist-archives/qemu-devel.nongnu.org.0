Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB1C4BD90B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 11:22:35 +0100 (CET)
Received: from localhost ([::1]:40886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5py-0008Cu-DB
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 05:22:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM5nT-0006le-DL
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 05:19:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM5nO-0000ku-PG
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 05:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645438792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1fxyb/c6X1H5VH7vtC60Zz2loMRKS64U8uCNEMDaeqI=;
 b=W1scHQ6cVOP8ituDPs2oqkTbmiGHMuO0pl3Z5/JOqx2ano1+XBpD9DPj0d4e9YEFs5W8mD
 2aGKUG1qqCNRh6SBfLwA0AUNXogq6xoTMGcduQGxl6wz9Q8ASUBPwo3/bvOwORTh4qxIDQ
 1wafN2UPxVirD7IK3xFj829j8TmY+Bs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-9UVDamryMNKt2kXSZA2nWA-1; Mon, 21 Feb 2022 05:19:49 -0500
X-MC-Unique: 9UVDamryMNKt2kXSZA2nWA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B085B1898290;
 Mon, 21 Feb 2022 10:19:47 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEFE45DB84;
 Mon, 21 Feb 2022 10:19:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] tests/avocado/machine_s390_ccw_virtio: Adapt test to new
 default resolution
Date: Mon, 21 Feb 2022 11:19:33 +0100
Message-Id: <20220221101933.307525-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Cc: Eric Farman <farman@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU's default screen resolution recently changed to 1280x800, so the
resolution in the screen shot header changed of course, too.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: de72c4b7cd ("edid: set default resolution to 1280x800 (WXGA)")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/machine_s390_ccw_virtio.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/machine_s390_ccw_virtio.py b/tests/avocado/machine_s390_ccw_virtio.py
index bd03d7160b..438a6f4321 100644
--- a/tests/avocado/machine_s390_ccw_virtio.py
+++ b/tests/avocado/machine_s390_ccw_virtio.py
@@ -248,7 +248,7 @@ def test_s390x_fedora(self):
             line = ppmfile.readline()
             self.assertEqual(line, b"P6\n")
             line = ppmfile.readline()
-            self.assertEqual(line, b"1024 768\n")
+            self.assertEqual(line, b"1280 800\n")
             line = ppmfile.readline()
             self.assertEqual(line, b"255\n")
             line = ppmfile.readline(256)
-- 
2.27.0


