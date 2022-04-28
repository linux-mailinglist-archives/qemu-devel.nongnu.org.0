Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D40513122
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:17:24 +0200 (CEST)
Received: from localhost ([::1]:49066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1D9-00058k-A0
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nk0kW-0003Em-Sw
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:47:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nk0kV-0008L0-BP
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:47:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651139266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qZfj6SsxtJdjkiT39FOmcvJo6o5N0CpY4n8X54b+2C0=;
 b=Vi6osn0OD/6IH593JWEF+COv/c6Cdl7B9thepCl8zY/uD4mhqRIH/VkxccWK+rkkXwE5TK
 J7xEq8zIEokv6Bv+zTZB08scN8RmIrRUbLP0PjP0tvItlD3Nhcii/0ksD2ygxdOqDxQv+a
 ZZ7N4EuBnqNfcgw4f/hzCY61tzxD0D4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-pSiqh-dqMNa9nmjhoQKVxA-1; Thu, 28 Apr 2022 05:47:42 -0400
X-MC-Unique: pSiqh-dqMNa9nmjhoQKVxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F88C19705A7;
 Thu, 28 Apr 2022 09:47:42 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EFB440CFD16;
 Thu, 28 Apr 2022 09:47:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 12/13] target/s390x: add S390_FEAT_VECTOR_ENH2 to qemu CPU
 model
Date: Thu, 28 Apr 2022 11:47:07 +0200
Message-Id: <20220428094708.84835-13-david@redhat.com>
In-Reply-To: <20220428094708.84835-1-david@redhat.com>
References: <20220428094708.84835-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, David Miller <dmiller423@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Miller <dmiller423@gmail.com>

Signed-off-by: David Miller <dmiller423@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[ dh: take care of compat machines ]
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/s390x/s390-virtio-ccw.c  | 3 +++
 target/s390x/gen-features.c | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 8fa488d13a..047cca0487 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -803,7 +803,10 @@ DEFINE_CCW_MACHINE(7_1, "7.1", true);
 
 static void ccw_machine_7_0_instance_options(MachineState *machine)
 {
+    static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V7_0 };
+
     ccw_machine_7_1_instance_options(machine);
+    s390_set_qemu_cpu_model(0x8561, 15, 1, qemu_cpu_feat);
 }
 
 static void ccw_machine_7_0_class_options(MachineClass *mc)
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index ec7d8ceab5..c03ec2c9a9 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -738,13 +738,17 @@ static uint16_t qemu_V6_2[] = {
     S390_FEAT_VECTOR_ENH,
 };
 
+static uint16_t qemu_V7_0[] = {
+    S390_FEAT_MISC_INSTRUCTION_EXT3,
+};
+
 /*
  * Features for the "qemu" CPU model of the latest QEMU machine and the "max"
  * CPU model under TCG. Don't include features that are not part of the full
  * feature set of the current "max" CPU model generation.
  */
 static uint16_t qemu_MAX[] = {
-    S390_FEAT_MISC_INSTRUCTION_EXT3,
+    S390_FEAT_VECTOR_ENH2,
 };
 
 /****** END FEATURE DEFS ******/
@@ -866,6 +870,7 @@ static FeatGroupDefSpec QemuFeatDef[] = {
     QEMU_FEAT_INITIALIZER(V4_1),
     QEMU_FEAT_INITIALIZER(V6_0),
     QEMU_FEAT_INITIALIZER(V6_2),
+    QEMU_FEAT_INITIALIZER(V7_0),
     QEMU_FEAT_INITIALIZER(MAX),
 };
 
-- 
2.35.1


