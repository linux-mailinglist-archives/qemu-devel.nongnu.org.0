Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39C72B364F
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 17:39:40 +0100 (CET)
Received: from localhost ([::1]:40950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keL3z-0005zp-Qx
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 11:39:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1keKrT-0004WB-UN
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 11:26:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1keKrS-0005sw-0e
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 11:26:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605457601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=NEJQL+t/p8XPvuRbN3pZzUwHLj9UXatC3EJJA+uWMpg=;
 b=F886lLozqu83ahEIHh8DvYwclDTqdZ8CWbkabDl5EpPtSoz/h3mLmVRjNii7DyVt0pvE74
 Cq1t5b2oVEZyApRGBIZsO2+l83xln6DFuPCEYEorrbdH8d2R2IySKeF1J6+Aq0TJeZ3kYw
 vYZSJfi5OZyJKT3BPPjCBnBKYae8fcY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-gLAX4maxNbOee8cReAcDaw-1; Sun, 15 Nov 2020 11:26:39 -0500
X-MC-Unique: gLAX4maxNbOee8cReAcDaw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EBC01891E82;
 Sun, 15 Nov 2020 16:26:38 +0000 (UTC)
Received: from thuth.com (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4374B5B4BE;
 Sun, 15 Nov 2020 16:26:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/26] tpm: Fix Lesser GPL version number
Date: Sun, 15 Nov 2020 17:26:04 +0100
Message-Id: <20201115162613.74645-18-thuth@redhat.com>
In-Reply-To: <20201115162613.74645-1-thuth@redhat.com>
References: <20201115162613.74645-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
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
Message-Id: <20201023123516.19843-1-chetan4windows@gmail.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 backends/tpm/tpm_emulator.c    | 2 +-
 backends/tpm/tpm_passthrough.c | 2 +-
 backends/tpm/tpm_util.c        | 2 +-
 hw/tpm/tpm_prop.h              | 2 +-
 include/sysemu/tpm_util.h      | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 201cd38503..a012adc193 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -14,7 +14,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/backends/tpm/tpm_passthrough.c b/backends/tpm/tpm_passthrough.c
index 8f6f4998a5..21b7459183 100644
--- a/backends/tpm/tpm_passthrough.c
+++ b/backends/tpm/tpm_passthrough.c
@@ -11,7 +11,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/backends/tpm/tpm_util.c b/backends/tpm/tpm_util.c
index b58d298c1a..e6aeb63587 100644
--- a/backends/tpm/tpm_util.c
+++ b/backends/tpm/tpm_util.c
@@ -8,7 +8,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/tpm/tpm_prop.h b/hw/tpm/tpm_prop.h
index 85e1ae5718..d19e40c112 100644
--- a/hw/tpm/tpm_prop.h
+++ b/hw/tpm/tpm_prop.h
@@ -8,7 +8,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/sysemu/tpm_util.h b/include/sysemu/tpm_util.h
index 63e872c3b2..08f05172a7 100644
--- a/include/sysemu/tpm_util.h
+++ b/include/sysemu/tpm_util.h
@@ -8,7 +8,7 @@
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


