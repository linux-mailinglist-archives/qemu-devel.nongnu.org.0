Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8966C2B3624
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 17:28:23 +0100 (CET)
Received: from localhost ([::1]:56920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keKt4-00063S-KY
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 11:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1keKrC-0004GS-U9
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 11:26:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1keKr9-0005lr-74
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 11:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605457582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WaV4NZJqCXyrQDs0y+DZOlcsPxq8iT+NTufCmBvTPEs=;
 b=aiItRWImFW4L+Pjwumr1aBzMi5f9E08WjAtoO39twu9pF39mJRwQt9JEGWIV12cVZfHje7
 wNVrjzOkk98WhU4nAcZMQQZcWYw9nIpacK2KdgHOb6ayBzAZLFD1jrnTOg7dmREZCZuksF
 MrpcTYkNStzi6aZA/Dk+s4rkwTSyBG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-qRsTvzuOMcOuR8Fs2iKOew-1; Sun, 15 Nov 2020 11:26:20 -0500
X-MC-Unique: qRsTvzuOMcOuR8Fs2iKOew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7481510866A5;
 Sun, 15 Nov 2020 16:26:19 +0000 (UTC)
Received: from thuth.com (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DCD65B4D6;
 Sun, 15 Nov 2020 16:26:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/26] non-virt: Fix Lesser GPL version number
Date: Sun, 15 Nov 2020 17:25:49 +0100
Message-Id: <20201115162613.74645-3-thuth@redhat.com>
In-Reply-To: <20201115162613.74645-1-thuth@redhat.com>
References: <20201115162613.74645-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 10:03:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chetan Pant <chetan4windows@gmail.com>

There is no "version 2" of the "Lesser" General Public License.
It is either "GPL version 2.0" or "Lesser GPL version 2.1".
This patch replaces all occurrences of "Lesser GPL version 2" with
"Lesser GPL version 2.1" in comment section.

Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
Message-Id: <20201016145346.27167-1-chetan4windows@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/intc/xics_pnv.c         | 2 +-
 hw/ppc/pnv.c               | 2 +-
 hw/ppc/pnv_core.c          | 2 +-
 hw/ppc/pnv_lpc.c           | 2 +-
 hw/ppc/pnv_psi.c           | 2 +-
 hw/ppc/pnv_xscom.c         | 2 +-
 include/hw/ppc/pnv.h       | 2 +-
 include/hw/ppc/pnv_core.h  | 2 +-
 include/hw/ppc/pnv_homer.h | 2 +-
 include/hw/ppc/pnv_lpc.h   | 2 +-
 include/hw/ppc/pnv_occ.h   | 2 +-
 include/hw/ppc/pnv_psi.h   | 2 +-
 include/hw/ppc/pnv_xscom.h | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/intc/xics_pnv.c b/hw/intc/xics_pnv.c
index 35f3811264..753c067f17 100644
--- a/hw/intc/xics_pnv.c
+++ b/hw/intc/xics_pnv.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public License
- * as published by the Free Software Foundation; either version 2 of
+ * as published by the Free Software Foundation; either version 2.1 of
  * the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful, but
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index d9e52873ea..50ebd4a484 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index 4724ddf96c..bd2bf2e044 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public License
- * as published by the Free Software Foundation; either version 2 of
+ * as published by the Free Software Foundation; either version 2.1 of
  * the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful, but
diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
index 23f1e09492..5903590220 100644
--- a/hw/ppc/pnv_lpc.c
+++ b/hw/ppc/pnv_lpc.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 6a479cac53..3e868c8c8d 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
index b681c72575..e9ae1569ff 100644
--- a/hw/ppc/pnv_xscom.c
+++ b/hw/ppc/pnv_xscom.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index dd2535ab96..ee7eda3e01 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
index f15829dfae..6ecee98a76 100644
--- a/include/hw/ppc/pnv_core.h
+++ b/include/hw/ppc/pnv_core.h
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public License
- * as published by the Free Software Foundation; either version 2 of
+ * as published by the Free Software Foundation; either version 2.1 of
  * the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful, but
diff --git a/include/hw/ppc/pnv_homer.h b/include/hw/ppc/pnv_homer.h
index 7d29db8b47..1889e3083c 100644
--- a/include/hw/ppc/pnv_homer.h
+++ b/include/hw/ppc/pnv_homer.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/ppc/pnv_lpc.h b/include/hw/ppc/pnv_lpc.h
index cd3c13c2a8..e893e763dd 100644
--- a/include/hw/ppc/pnv_lpc.h
+++ b/include/hw/ppc/pnv_lpc.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/ppc/pnv_occ.h b/include/hw/ppc/pnv_occ.h
index 6219f588fd..b78185aeca 100644
--- a/include/hw/ppc/pnv_occ.h
+++ b/include/hw/ppc/pnv_occ.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/ppc/pnv_psi.h b/include/hw/ppc/pnv_psi.h
index 682b09f874..eb841b34a1 100644
--- a/include/hw/ppc/pnv_psi.h
+++ b/include/hw/ppc/pnv_psi.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index 7e3b189c07..8578f5a207 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- 
2.18.4


