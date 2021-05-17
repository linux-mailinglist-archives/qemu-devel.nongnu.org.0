Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E8F383167
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:37:40 +0200 (CEST)
Received: from localhost ([::1]:51906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lieNH-00057d-5F
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieHc-0000fZ-Ek
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:31:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieHU-0000nw-Jm
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621261900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bx9VQMW6MZM4BMeoasvA3w6Ft805UMYNT7NsWuiKnlo=;
 b=dlnNclXDv0xIStxgnMe6cMrdGZhTOXUI5Kj8Rh48+mEKOwZX8bcOvJfUcH/sZGNcZ6+G72
 TVThos4ymVi548B+vAFwkzby841h8fp1sBNNjXPZvjLc2UA1zVDxLO4GDQOt25RDehkJ7K
 VVUIxlXY0UcgROArzytQLvuALX1Ykkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-Ltw3QHvONaupxuyvEszNWA-1; Mon, 17 May 2021 10:31:23 -0400
X-MC-Unique: Ltw3QHvONaupxuyvEszNWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75DED107ACE3;
 Mon, 17 May 2021 14:31:21 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-101.ams2.redhat.com [10.36.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 907305E7D8;
 Mon, 17 May 2021 14:31:18 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/26] s390x/cpumodel: Bump up QEMU model to a
 stripped-down IBM z14 GA2
Date: Mon, 17 May 2021 16:27:39 +0200
Message-Id: <20210517142739.38597-27-david@redhat.com>
In-Reply-To: <20210517142739.38597-1-david@redhat.com>
References: <20210517142739.38597-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TCG implements everything we need to run basic z14 OS+software.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/s390x/s390-virtio-ccw.c  |  3 +++
 target/s390x/cpu_models.c   |  4 ++--
 target/s390x/gen-features.c | 15 +++++++++------
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 7af27ca305..e4b18aef49 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -802,7 +802,10 @@ DEFINE_CCW_MACHINE(6_1, "6.1", true);
 
 static void ccw_machine_6_0_instance_options(MachineState *machine)
 {
+    static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V6_0 };
+
     ccw_machine_6_1_instance_options(machine);
+    s390_set_qemu_cpu_model(0x2964, 13, 2, qemu_cpu_feat);
 }
 
 static void ccw_machine_6_0_class_options(MachineClass *mc)
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 050dcf2d42..94090a6e22 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -90,8 +90,8 @@ static S390CPUDef s390_cpu_defs[] = {
     CPUDEF_INIT(0x8562, 15, 1, 47, 0x08000000U, "gen15b", "IBM z15 T02 GA1"),
 };
 
-#define QEMU_MAX_CPU_TYPE 0x2964
-#define QEMU_MAX_CPU_GEN 13
+#define QEMU_MAX_CPU_TYPE 0x3906
+#define QEMU_MAX_CPU_GEN 14
 #define QEMU_MAX_CPU_EC_GA 2
 static const S390FeatInit qemu_max_cpu_feat_init = { S390_FEAT_LIST_QEMU_MAX };
 static S390FeatBitmap qemu_max_cpu_feat;
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 219b1f9420..242c95ede4 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -706,23 +706,25 @@ static uint16_t qemu_V4_1[] = {
     S390_FEAT_VECTOR,
 };
 
-static uint16_t qemu_LATEST[] = {
+static uint16_t qemu_V6_0[] = {
     S390_FEAT_ACCESS_EXCEPTION_FS_INDICATION,
     S390_FEAT_SIDE_EFFECT_ACCESS_ESOP2,
     S390_FEAT_ESOP,
 };
 
-/* add all new definitions before this point */
-static uint16_t qemu_MAX[] = {
-    /* generates a dependency warning, leave it out for now */
-    S390_FEAT_MSA_EXT_5,
-    /* features introduced after the z13 */
+static uint16_t qemu_LATEST[] = {
     S390_FEAT_INSTRUCTION_EXEC_PROT,
     S390_FEAT_MISC_INSTRUCTION_EXT2,
     S390_FEAT_MSA_EXT_8,
     S390_FEAT_VECTOR_ENH,
 };
 
+/* add all new definitions before this point */
+static uint16_t qemu_MAX[] = {
+    /* generates a dependency warning, leave it out for now */
+    S390_FEAT_MSA_EXT_5,
+};
+
 /****** END FEATURE DEFS ******/
 
 #define _YEARS  "2016"
@@ -839,6 +841,7 @@ static FeatGroupDefSpec QemuFeatDef[] = {
     QEMU_FEAT_INITIALIZER(V3_1),
     QEMU_FEAT_INITIALIZER(V4_0),
     QEMU_FEAT_INITIALIZER(V4_1),
+    QEMU_FEAT_INITIALIZER(V6_0),
     QEMU_FEAT_INITIALIZER(LATEST),
     QEMU_FEAT_INITIALIZER(MAX),
 };
-- 
2.31.1


