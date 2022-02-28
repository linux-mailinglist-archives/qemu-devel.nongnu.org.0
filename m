Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D0A4C6E4E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:36:01 +0100 (CET)
Received: from localhost ([::1]:55848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgC0-0002TL-2I
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:36:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOg6D-0007lY-IR
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:30:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOg68-00036b-AV
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646054995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWlRJLL3lMOkxbsyDtUI111C2wFn150AeQWVOPy7+vc=;
 b=dqDWqbak66L+pauRmRBsCQQuq7L/IfTq/dtgq8H8UJwUTumpYHTI1zUKGZ0YvIISl5uZDb
 9zp9LzJZXVaLq4i4boH5sVqV2578XwudfU01Erl97f98Bb6zG83FZdBV0yzHLU/+eU6Op+
 UC6ygmyDoqU6q8DiRNQMDg5iX047EZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-AR7433WPPu6IExhkDHnnKw-1; Mon, 28 Feb 2022 08:29:52 -0500
X-MC-Unique: AR7433WPPu6IExhkDHnnKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B1CD824FA8;
 Mon, 28 Feb 2022 13:29:51 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32BD07B61E;
 Mon, 28 Feb 2022 13:29:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] s390x/cpumodel: Bump up QEMU model to a stripped-down IBM
 z15 GA1
Date: Mon, 28 Feb 2022 14:29:35 +0100
Message-Id: <20220228132936.1411176-6-thuth@redhat.com>
In-Reply-To: <20220228132936.1411176-1-thuth@redhat.com>
References: <20220228132936.1411176-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>, David Miller <dmiller423@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Miller <dmiller423@gmail.com>

TCG implements everything we need to run basic z15 OS+software

Signed-off-by: David Miller <dmiller423@gmail.com>
Message-Id: <20220223223117.66660-3-dmiller423@gmail.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/s390-virtio-ccw.c  | 3 +++
 target/s390x/cpu_models.c   | 6 +++---
 target/s390x/gen-features.c | 7 +++++--
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 84e3e63c43..90480e7cf9 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -802,7 +802,10 @@ DEFINE_CCW_MACHINE(7_0, "7.0", true);
 
 static void ccw_machine_6_2_instance_options(MachineState *machine)
 {
+    static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V6_2 };
+
     ccw_machine_7_0_instance_options(machine);
+    s390_set_qemu_cpu_model(0x3906, 14, 2, qemu_cpu_feat);
 }
 
 static void ccw_machine_6_2_class_options(MachineClass *mc)
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 17ae771939..6d71428056 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -86,9 +86,9 @@ static S390CPUDef s390_cpu_defs[] = {
     CPUDEF_INIT(0x3932, 16, 1, 47, 0x08000000U, "gen16b", "IBM 3932 GA1"),
 };
 
-#define QEMU_MAX_CPU_TYPE 0x3906
-#define QEMU_MAX_CPU_GEN 14
-#define QEMU_MAX_CPU_EC_GA 2
+#define QEMU_MAX_CPU_TYPE 0x8561
+#define QEMU_MAX_CPU_GEN 15
+#define QEMU_MAX_CPU_EC_GA 1
 static const S390FeatInit qemu_max_cpu_feat_init = { S390_FEAT_LIST_QEMU_MAX };
 static S390FeatBitmap qemu_max_cpu_feat;
 
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index a3f30f69d9..22846121c4 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -731,16 +731,18 @@ static uint16_t qemu_V6_0[] = {
     S390_FEAT_ESOP,
 };
 
-static uint16_t qemu_LATEST[] = {
+static uint16_t qemu_V6_2[] = {
     S390_FEAT_INSTRUCTION_EXEC_PROT,
     S390_FEAT_MISC_INSTRUCTION_EXT2,
     S390_FEAT_MSA_EXT_8,
     S390_FEAT_VECTOR_ENH,
 };
 
+static uint16_t qemu_LATEST[] = {
+    S390_FEAT_MISC_INSTRUCTION_EXT3,
+};
 /* add all new definitions before this point */
 static uint16_t qemu_MAX[] = {
-    S390_FEAT_MISC_INSTRUCTION_EXT3,
     /* generates a dependency warning, leave it out for now */
     S390_FEAT_MSA_EXT_5,
 };
@@ -863,6 +865,7 @@ static FeatGroupDefSpec QemuFeatDef[] = {
     QEMU_FEAT_INITIALIZER(V4_0),
     QEMU_FEAT_INITIALIZER(V4_1),
     QEMU_FEAT_INITIALIZER(V6_0),
+    QEMU_FEAT_INITIALIZER(V6_2),
     QEMU_FEAT_INITIALIZER(LATEST),
     QEMU_FEAT_INITIALIZER(MAX),
 };
-- 
2.27.0


