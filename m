Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AD73C16B3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:58:05 +0200 (CEST)
Received: from localhost ([::1]:60718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WPc-0007I4-IR
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m1VoL-0004JD-Dc
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:19:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m1VoJ-0000D0-EA
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:19:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625757570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/qtHK4qcOMg63ma4EbC4yv8yjQy7qhleKPRnhHDOGE=;
 b=KV8pxhPCuz0UlKrZCdvYiru8L9gg2yaxpIyaYVIP+iVqU2ClDuP+kNQKnTtG7xUfMLacVR
 8NRU+hMqkWPnzNMjbfaYimF4tul4WN8DQpRNBJUU4y5urm12MI6rlLJLlqQWoUy0v+XzHM
 JZmRXE/+wOIZj1TlXS9MubDg4Z+ZhR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-eROLMWp1Ml2d_gzggNrdrw-1; Thu, 08 Jul 2021 11:19:29 -0400
X-MC-Unique: eROLMWp1Ml2d_gzggNrdrw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 578B38042FE;
 Thu,  8 Jul 2021 15:19:28 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-112-175.ams2.redhat.com
 [10.36.112.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7211DE2F7;
 Thu,  8 Jul 2021 15:19:15 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/17] s390x/cpumodel: add 3931 and 3932
Date: Thu,  8 Jul 2021 17:18:53 +0200
Message-Id: <20210708151909.907124-2-cohuck@redhat.com>
In-Reply-To: <20210708151909.907124-1-cohuck@redhat.com>
References: <20210708151909.907124-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christian Borntraeger <borntraeger@de.ibm.com>

This defines 5 new facilities and the new 3931 and 3932 machines.
As before the name is not yet known and we do use gen16a and gen16b.
The new features are part of the full model.

The default model is still empty (same as z15) and will be added
in a separate patch at a later point in time.

Also add the dependencies of new facilities and as a fix for z15 add
a dependency from S390_FEAT_VECTOR_PACKED_DECIMAL_ENH to
S390_VECTOR_PACKED_DECIMAL.

[merged <20210701084348.26556-1-borntraeger@de.ibm.com>]
Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
Message-Id: <20210622201923.150205-2-borntraeger@de.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/cpu_features_def.h.inc |  5 +++++
 target/s390x/cpu_models.c           |  6 ++++++
 target/s390x/gen-features.c         | 14 ++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
index 7db3449e0434..e86662bb3b8a 100644
--- a/target/s390x/cpu_features_def.h.inc
+++ b/target/s390x/cpu_features_def.h.inc
@@ -109,6 +109,11 @@ DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH, "vxpdeh", STFL, 152, "Vector-Packed-Decimal-
 DEF_FEAT(MSA_EXT_9, "msa9-base", STFL, 155, "Message-security-assist-extension-9 facility (excluding subfunctions)")
 DEF_FEAT(ETOKEN, "etoken", STFL, 156, "Etoken facility")
 DEF_FEAT(UNPACK, "unpack", STFL, 161, "Unpack facility")
+DEF_FEAT(NNPA, "nnpa", STFL, 165, "NNPA facility")
+DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH2, "vxpdeh2", STFL, 192, "Vector-Packed-Decimal-Enhancement facility 2")
+DEF_FEAT(BEAR_ENH, "beareh", STFL, 193, "BEAR-enhancement facility")
+DEF_FEAT(RDP, "rdp", STFL, 194, "Reset-DAT-protection facility")
+DEF_FEAT(PAI, "pai", STFL, 196, "Processor-Activity-Instrumentation facility")
 
 /* Features exposed via SCLP SCCB Byte 80 - 98  (bit numbers relative to byte-80) */
 DEF_FEAT(SIE_GSLS, "gsls", SCLP_CONF_CHAR, 40, "SIE: Guest-storage-limit-suppression facility")
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 94090a6e223d..9699823b2074 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -88,6 +88,8 @@ static S390CPUDef s390_cpu_defs[] = {
     CPUDEF_INIT(0x3907, 14, 1, 47, 0x08000000U, "z14ZR1", "IBM z14 Model ZR1 GA1"),
     CPUDEF_INIT(0x8561, 15, 1, 47, 0x08000000U, "gen15a", "IBM z15 T01 GA1"),
     CPUDEF_INIT(0x8562, 15, 1, 47, 0x08000000U, "gen15b", "IBM z15 T02 GA1"),
+    CPUDEF_INIT(0x3931, 16, 1, 47, 0x08000000U, "gen16a", "IBM 3931 GA1"),
+    CPUDEF_INIT(0x3932, 16, 1, 47, 0x08000000U, "gen16b", "IBM 3932 GA1"),
 };
 
 #define QEMU_MAX_CPU_TYPE 0x3906
@@ -812,6 +814,8 @@ static void check_consistency(const S390CPUModel *model)
         { S390_FEAT_MSA_EXT_9, S390_FEAT_MSA_EXT_4 },
         { S390_FEAT_MULTIPLE_EPOCH, S390_FEAT_TOD_CLOCK_STEERING },
         { S390_FEAT_VECTOR_PACKED_DECIMAL, S390_FEAT_VECTOR },
+        { S390_FEAT_VECTOR_PACKED_DECIMAL_ENH, S390_FEAT_VECTOR_PACKED_DECIMAL },
+        { S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2, S390_FEAT_VECTOR_PACKED_DECIMAL_ENH },
         { S390_FEAT_VECTOR_ENH, S390_FEAT_VECTOR },
         { S390_FEAT_INSTRUCTION_EXEC_PROT, S390_FEAT_SIDE_EFFECT_ACCESS_ESOP2 },
         { S390_FEAT_SIDE_EFFECT_ACCESS_ESOP2, S390_FEAT_ESOP },
@@ -843,6 +847,8 @@ static void check_consistency(const S390CPUModel *model)
         { S390_FEAT_PTFF_STOUE, S390_FEAT_MULTIPLE_EPOCH },
         { S390_FEAT_AP_QUEUE_INTERRUPT_CONTROL, S390_FEAT_AP },
         { S390_FEAT_DIAG_318, S390_FEAT_EXTENDED_LENGTH_SCCB },
+        { S390_FEAT_NNPA, S390_FEAT_VECTOR },
+        { S390_FEAT_RDP, S390_FEAT_LOCAL_TLB_CLEARING },
     };
     int i;
 
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 242c95ede48a..7d85322d6814 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -424,6 +424,8 @@ static uint16_t base_GEN15_GA1[] = {
     S390_FEAT_MISC_INSTRUCTION_EXT3,
 };
 
+#define base_GEN16_GA1 EmptyFeat
+
 /* Full features (in order of release)
  * Automatically includes corresponding base features.
  * Full features are all features this hardware supports even if kvm/QEMU do not
@@ -567,6 +569,15 @@ static uint16_t full_GEN15_GA1[] = {
     S390_FEAT_UNPACK,
 };
 
+static uint16_t full_GEN16_GA1[] = {
+    S390_FEAT_NNPA,
+    S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2,
+    S390_FEAT_BEAR_ENH,
+    S390_FEAT_RDP,
+    S390_FEAT_PAI,
+};
+
+
 /* Default features (in order of release)
  * Automatically includes corresponding base features.
  * Default features are all features this version of QEMU supports for this
@@ -652,6 +663,8 @@ static uint16_t default_GEN15_GA1[] = {
     S390_FEAT_ETOKEN,
 };
 
+#define default_GEN16_GA1 EmptyFeat
+
 /* QEMU (CPU model) features */
 
 static uint16_t qemu_V2_11[] = {
@@ -785,6 +798,7 @@ static CpuFeatDefSpec CpuFeatDef[] = {
     CPU_FEAT_INITIALIZER(GEN14_GA1),
     CPU_FEAT_INITIALIZER(GEN14_GA2),
     CPU_FEAT_INITIALIZER(GEN15_GA1),
+    CPU_FEAT_INITIALIZER(GEN16_GA1),
 };
 
 #define FEAT_GROUP_INITIALIZER(_name)                  \
-- 
2.31.1


