Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E391FABD4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 11:04:38 +0200 (CEST)
Received: from localhost ([::1]:43138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl7WH-0004qa-Uh
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 05:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jl7QN-0006kP-E0
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 04:58:31 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35396
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jl7QK-0002B5-GS
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 04:58:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592297907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=nnAhcYgPY7BwvyxLGEd32QwqaCWI+0MlCYqgsdU1dNY=;
 b=eh4WnIQoHx4LJWpY6qFNr3XXpGaSqaqn3vcYOCVW5x5r+xhV9cOFRHPiYzuCTmZJcImsrS
 vBM/LHFK2y6vtC9SkItvjTQyEbPCU2JTtS+4u1dDHFQ1inkHhj3YsJXa+F0DQQSU+IuDQh
 RKnbhehcb8Z3Z8D8upCbipnaXFj6yio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-VBP3n7TDMo6tUIMpVnI_3g-1; Tue, 16 Jun 2020 04:58:25 -0400
X-MC-Unique: VBP3n7TDMo6tUIMpVnI_3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E35E10AB645;
 Tue, 16 Jun 2020 08:58:24 +0000 (UTC)
Received: from thuth.com (ovpn-114-128.ams2.redhat.com [10.36.114.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29D6F6ED96;
 Tue, 16 Jun 2020 08:58:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 5/7] tests/qtest: Fix LGPL information in the file headers
Date: Tue, 16 Jun 2020 10:58:11 +0200
Message-Id: <20200616085813.29296-6-thuth@redhat.com>
In-Reply-To: <20200616085813.29296-1-thuth@redhat.com>
References: <20200616085813.29296-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:45:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's either "GNU *Library* General Public License version 2" or "GNU
Lesser General Public License version *2.1*", but there was no "version
2.0" of the "Lesser" license. So assume that version 2.1 is meant here.

Message-Id: <20200605100645.6506-1-thuth@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/e1000e-test.c                        | 2 +-
 tests/qtest/fuzz/qos_fuzz.c                      | 2 +-
 tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c | 2 +-
 tests/qtest/libqos/arm-imx25-pdk-machine.c       | 2 +-
 tests/qtest/libqos/arm-n800-machine.c            | 2 +-
 tests/qtest/libqos/arm-raspi2-machine.c          | 2 +-
 tests/qtest/libqos/arm-sabrelite-machine.c       | 2 +-
 tests/qtest/libqos/arm-smdkc210-machine.c        | 2 +-
 tests/qtest/libqos/arm-virt-machine.c            | 2 +-
 tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c  | 2 +-
 tests/qtest/libqos/e1000e.c                      | 2 +-
 tests/qtest/libqos/e1000e.h                      | 2 +-
 tests/qtest/libqos/ppc64_pseries-machine.c       | 2 +-
 tests/qtest/libqos/qgraph.c                      | 2 +-
 tests/qtest/libqos/qgraph.h                      | 2 +-
 tests/qtest/libqos/qgraph_internal.h             | 2 +-
 tests/qtest/libqos/qos_external.c                | 2 +-
 tests/qtest/libqos/qos_external.h                | 2 +-
 tests/qtest/libqos/sdhci.c                       | 2 +-
 tests/qtest/libqos/sdhci.h                       | 2 +-
 tests/qtest/libqos/virtio-9p.c                   | 2 +-
 tests/qtest/libqos/virtio-9p.h                   | 2 +-
 tests/qtest/libqos/virtio-balloon.c              | 2 +-
 tests/qtest/libqos/virtio-balloon.h              | 2 +-
 tests/qtest/libqos/virtio-blk.c                  | 2 +-
 tests/qtest/libqos/virtio-blk.h                  | 2 +-
 tests/qtest/libqos/virtio-net.c                  | 2 +-
 tests/qtest/libqos/virtio-net.h                  | 2 +-
 tests/qtest/libqos/virtio-rng.c                  | 2 +-
 tests/qtest/libqos/virtio-rng.h                  | 2 +-
 tests/qtest/libqos/virtio-scsi.c                 | 2 +-
 tests/qtest/libqos/virtio-scsi.h                 | 2 +-
 tests/qtest/libqos/virtio-serial.c               | 2 +-
 tests/qtest/libqos/virtio-serial.h               | 2 +-
 tests/qtest/libqos/x86_64_pc-machine.c           | 2 +-
 tests/qtest/qos-test.c                           | 2 +-
 36 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index 1a232a663a..fc226fdfeb 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -12,7 +12,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
index 87eadb0889..0c68f5361f 100644
--- a/tests/qtest/fuzz/qos_fuzz.c
+++ b/tests/qtest/fuzz/qos_fuzz.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c b/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c
index 1d5de5af00..8f827aeb52 100644
--- a/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c
+++ b/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/arm-imx25-pdk-machine.c b/tests/qtest/libqos/arm-imx25-pdk-machine.c
index 25066fb8a9..0da3f19c0e 100644
--- a/tests/qtest/libqos/arm-imx25-pdk-machine.c
+++ b/tests/qtest/libqos/arm-imx25-pdk-machine.c
@@ -7,7 +7,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/arm-n800-machine.c b/tests/qtest/libqos/arm-n800-machine.c
index 87279bdb26..35f82070fa 100644
--- a/tests/qtest/libqos/arm-n800-machine.c
+++ b/tests/qtest/libqos/arm-n800-machine.c
@@ -7,7 +7,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/arm-raspi2-machine.c b/tests/qtest/libqos/arm-raspi2-machine.c
index 12a7cb7e4b..8480d80669 100644
--- a/tests/qtest/libqos/arm-raspi2-machine.c
+++ b/tests/qtest/libqos/arm-raspi2-machine.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/arm-sabrelite-machine.c b/tests/qtest/libqos/arm-sabrelite-machine.c
index e6df43795a..f6e403b538 100644
--- a/tests/qtest/libqos/arm-sabrelite-machine.c
+++ b/tests/qtest/libqos/arm-sabrelite-machine.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/arm-smdkc210-machine.c b/tests/qtest/libqos/arm-smdkc210-machine.c
index 215b628a7d..eebac7feeb 100644
--- a/tests/qtest/libqos/arm-smdkc210-machine.c
+++ b/tests/qtest/libqos/arm-smdkc210-machine.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/arm-virt-machine.c b/tests/qtest/libqos/arm-virt-machine.c
index 96ffe3ee5c..9316598f9e 100644
--- a/tests/qtest/libqos/arm-virt-machine.c
+++ b/tests/qtest/libqos/arm-virt-machine.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c b/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c
index 5bc95f2e73..473acce993 100644
--- a/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c
+++ b/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index 560e7a2bb2..e2927ed2da 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/e1000e.h b/tests/qtest/libqos/e1000e.h
index dc4ab10f58..35183b2875 100644
--- a/tests/qtest/libqos/e1000e.h
+++ b/tests/qtest/libqos/e1000e.h
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/ppc64_pseries-machine.c b/tests/qtest/libqos/ppc64_pseries-machine.c
index 867f27a3c8..5d7bd88f2f 100644
--- a/tests/qtest/libqos/ppc64_pseries-machine.c
+++ b/tests/qtest/libqos/ppc64_pseries-machine.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
index ca01de0743..eb0af8ab4a 100644
--- a/tests/qtest/libqos/qgraph.c
+++ b/tests/qtest/libqos/qgraph.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
index 3a25dda4b2..db1244eb59 100644
--- a/tests/qtest/libqos/qgraph.h
+++ b/tests/qtest/libqos/qgraph.h
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/qgraph_internal.h b/tests/qtest/libqos/qgraph_internal.h
index f4734c8681..aa3123f0f2 100644
--- a/tests/qtest/libqos/qgraph_internal.h
+++ b/tests/qtest/libqos/qgraph_internal.h
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/qos_external.c b/tests/qtest/libqos/qos_external.c
index 9f5180e18d..0dfc05cfb6 100644
--- a/tests/qtest/libqos/qos_external.c
+++ b/tests/qtest/libqos/qos_external.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/qos_external.h b/tests/qtest/libqos/qos_external.h
index 72d7f91707..56a2f37fde 100644
--- a/tests/qtest/libqos/qos_external.h
+++ b/tests/qtest/libqos/qos_external.h
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/sdhci.c b/tests/qtest/libqos/sdhci.c
index 309794bc52..fbf2e36aec 100644
--- a/tests/qtest/libqos/sdhci.c
+++ b/tests/qtest/libqos/sdhci.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/sdhci.h b/tests/qtest/libqos/sdhci.h
index a88b45ae9d..1acd3096e2 100644
--- a/tests/qtest/libqos/sdhci.h
+++ b/tests/qtest/libqos/sdhci.h
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index 77dbfb62ad..c87b56132a 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/virtio-9p.h b/tests/qtest/libqos/virtio-9p.h
index b54e89b3a1..be9621a5e3 100644
--- a/tests/qtest/libqos/virtio-9p.h
+++ b/tests/qtest/libqos/virtio-9p.h
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/virtio-balloon.c b/tests/qtest/libqos/virtio-balloon.c
index 42a4c5831e..9745f4a83c 100644
--- a/tests/qtest/libqos/virtio-balloon.c
+++ b/tests/qtest/libqos/virtio-balloon.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/virtio-balloon.h b/tests/qtest/libqos/virtio-balloon.h
index 52661cc87d..5b919303a6 100644
--- a/tests/qtest/libqos/virtio-balloon.h
+++ b/tests/qtest/libqos/virtio-balloon.h
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/virtio-blk.c b/tests/qtest/libqos/virtio-blk.c
index 726e93c5c1..5fc69401be 100644
--- a/tests/qtest/libqos/virtio-blk.c
+++ b/tests/qtest/libqos/virtio-blk.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/virtio-blk.h b/tests/qtest/libqos/virtio-blk.h
index c05adc659d..5170f13cfe 100644
--- a/tests/qtest/libqos/virtio-blk.h
+++ b/tests/qtest/libqos/virtio-blk.h
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/virtio-net.c b/tests/qtest/libqos/virtio-net.c
index 710d440c3d..a9e253afe4 100644
--- a/tests/qtest/libqos/virtio-net.c
+++ b/tests/qtest/libqos/virtio-net.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/virtio-net.h b/tests/qtest/libqos/virtio-net.h
index 855c67d00f..b8cbec04af 100644
--- a/tests/qtest/libqos/virtio-net.h
+++ b/tests/qtest/libqos/virtio-net.h
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/virtio-rng.c b/tests/qtest/libqos/virtio-rng.c
index b86349e2fd..46f8d95b1f 100644
--- a/tests/qtest/libqos/virtio-rng.c
+++ b/tests/qtest/libqos/virtio-rng.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/virtio-rng.h b/tests/qtest/libqos/virtio-rng.h
index 9e192f11f7..9342372efa 100644
--- a/tests/qtest/libqos/virtio-rng.h
+++ b/tests/qtest/libqos/virtio-rng.h
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/virtio-scsi.c b/tests/qtest/libqos/virtio-scsi.c
index de739bec5f..c8c3598428 100644
--- a/tests/qtest/libqos/virtio-scsi.c
+++ b/tests/qtest/libqos/virtio-scsi.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/virtio-scsi.h b/tests/qtest/libqos/virtio-scsi.h
index 4ca19a6a7a..9e3774d99a 100644
--- a/tests/qtest/libqos/virtio-scsi.h
+++ b/tests/qtest/libqos/virtio-scsi.h
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/virtio-serial.c b/tests/qtest/libqos/virtio-serial.c
index 3e5b8b82c7..b95654085d 100644
--- a/tests/qtest/libqos/virtio-serial.c
+++ b/tests/qtest/libqos/virtio-serial.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/virtio-serial.h b/tests/qtest/libqos/virtio-serial.h
index 080fa8428d..3328c6cf19 100644
--- a/tests/qtest/libqos/virtio-serial.h
+++ b/tests/qtest/libqos/virtio-serial.h
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/libqos/x86_64_pc-machine.c b/tests/qtest/libqos/x86_64_pc-machine.c
index 6dfa705217..0edb1c9144 100644
--- a/tests/qtest/libqos/x86_64_pc-machine.c
+++ b/tests/qtest/libqos/x86_64_pc-machine.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index 3062a13557..8fdf87b183 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- 
2.18.1


