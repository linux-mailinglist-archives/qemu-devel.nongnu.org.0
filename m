Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB53C53C5B5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 09:07:13 +0200 (CEST)
Received: from localhost ([::1]:37092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx1Oq-0000bI-ET
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 03:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1HC-0005dS-SL
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1H9-0003Ha-5B
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654239553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Po38TlkhPSei0IEAV6dTh8v15AE2DMIhUgzmC4QekMY=;
 b=IVCz4X5pLzy+usun2TrO9IDyTY10wrCIsOjIrNRqmocNwWpKqimkpB+fF2UA/bIVUxtde8
 kOv+QylvCS+YKzdiHbgdkzwwwD1DTypTFZJ0lmr+EwiyINTPJjd9Jaz5tN/zeqD6UOMmmL
 rUsL6sVGGgggiiHXTy9D4z+qdX6hTzA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-1uIp_tq_N1qEjz9Qose34A-1; Fri, 03 Jun 2022 02:59:11 -0400
X-MC-Unique: 1uIp_tq_N1qEjz9Qose34A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EC76802809;
 Fri,  3 Jun 2022 06:59:11 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 075E02166B26;
 Fri,  3 Jun 2022 06:59:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 01/12] s390: Typo fix FLOATING_POINT_SUPPPORT_ENH
Date: Fri,  3 Jun 2022 08:58:54 +0200
Message-Id: <20220603065905.23805-2-thuth@redhat.com>
In-Reply-To: <20220603065905.23805-1-thuth@redhat.com>
References: <20220603065905.23805-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

One less P needed.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20220523115123.150340-1-dgilbert@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/cpu_features_def.h.inc | 2 +-
 target/s390x/gen-features.c         | 6 +++---
 target/s390x/tcg/translate.c        | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
index e86662bb3b..3603e5fb12 100644
--- a/target/s390x/cpu_features_def.h.inc
+++ b/target/s390x/cpu_features_def.h.inc
@@ -58,7 +58,7 @@ DEF_FEAT(ENHANCED_MONITOR, "emon", STFL, 36, "Enhanced-monitor facility")
 DEF_FEAT(FLOATING_POINT_EXT, "fpe", STFL, 37, "Floating-point extension facility")
 DEF_FEAT(ORDER_PRESERVING_COMPRESSION, "opc", STFL, 38, "Order Preserving Compression facility")
 DEF_FEAT(SET_PROGRAM_PARAMETERS, "sprogp", STFL, 40, "Set-program-parameters facility")
-DEF_FEAT(FLOATING_POINT_SUPPPORT_ENH, "fpseh", STFL, 41, "Floating-point-support-enhancement facilities")
+DEF_FEAT(FLOATING_POINT_SUPPORT_ENH, "fpseh", STFL, 41, "Floating-point-support-enhancement facilities")
 DEF_FEAT(DFP, "dfp", STFL, 42, "DFP (decimal-floating-point) facility")
 DEF_FEAT(DFP_FAST, "dfphp", STFL, 43, "DFP (decimal-floating-point) facility has high performance")
 DEF_FEAT(PFPO, "pfpo", STFL, 44, "PFPO instruction")
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index c03ec2c9a9..ad140184b9 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -374,7 +374,7 @@ static uint16_t base_GEN10_GA1[] = {
     S390_FEAT_COMPARE_AND_SWAP_AND_STORE_2,
     S390_FEAT_GENERAL_INSTRUCTIONS_EXT,
     S390_FEAT_EXECUTE_EXT,
-    S390_FEAT_FLOATING_POINT_SUPPPORT_ENH,
+    S390_FEAT_FLOATING_POINT_SUPPORT_ENH,
     S390_FEAT_DFP,
     S390_FEAT_DFP_FAST,
     S390_FEAT_PFPO,
@@ -476,7 +476,7 @@ static uint16_t full_GEN9_GA2[] = {
     S390_FEAT_MOVE_WITH_OPTIONAL_SPEC,
     S390_FEAT_EXTRACT_CPU_TIME,
     S390_FEAT_COMPARE_AND_SWAP_AND_STORE,
-    S390_FEAT_FLOATING_POINT_SUPPPORT_ENH,
+    S390_FEAT_FLOATING_POINT_SUPPORT_ENH,
     S390_FEAT_DFP,
 };
 
@@ -700,7 +700,7 @@ static uint16_t qemu_V3_1[] = {
     S390_FEAT_GENERAL_INSTRUCTIONS_EXT,
     S390_FEAT_EXECUTE_EXT,
     S390_FEAT_SET_PROGRAM_PARAMETERS,
-    S390_FEAT_FLOATING_POINT_SUPPPORT_ENH,
+    S390_FEAT_FLOATING_POINT_SUPPORT_ENH,
     S390_FEAT_STFLE_45,
     S390_FEAT_STFLE_49,
     S390_FEAT_LOCAL_TLB_CLEARING,
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index b40cb84bae..fd2433d625 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6185,17 +6185,17 @@ enum DisasInsnEnum {
 #define FAC_Z           S390_FEAT_ZARCH
 #define FAC_CASS        S390_FEAT_COMPARE_AND_SWAP_AND_STORE
 #define FAC_DFP         S390_FEAT_DFP
-#define FAC_DFPR        S390_FEAT_FLOATING_POINT_SUPPPORT_ENH /* DFP-rounding */
+#define FAC_DFPR        S390_FEAT_FLOATING_POINT_SUPPORT_ENH /* DFP-rounding */
 #define FAC_DO          S390_FEAT_STFLE_45 /* distinct-operands */
 #define FAC_EE          S390_FEAT_EXECUTE_EXT
 #define FAC_EI          S390_FEAT_EXTENDED_IMMEDIATE
 #define FAC_FPE         S390_FEAT_FLOATING_POINT_EXT
-#define FAC_FPSSH       S390_FEAT_FLOATING_POINT_SUPPPORT_ENH /* FPS-sign-handling */
-#define FAC_FPRGR       S390_FEAT_FLOATING_POINT_SUPPPORT_ENH /* FPR-GR-transfer */
+#define FAC_FPSSH       S390_FEAT_FLOATING_POINT_SUPPORT_ENH /* FPS-sign-handling */
+#define FAC_FPRGR       S390_FEAT_FLOATING_POINT_SUPPORT_ENH /* FPR-GR-transfer */
 #define FAC_GIE         S390_FEAT_GENERAL_INSTRUCTIONS_EXT
 #define FAC_HFP_MA      S390_FEAT_HFP_MADDSUB
 #define FAC_HW          S390_FEAT_STFLE_45 /* high-word */
-#define FAC_IEEEE_SIM   S390_FEAT_FLOATING_POINT_SUPPPORT_ENH /* IEEE-exception-simulation */
+#define FAC_IEEEE_SIM   S390_FEAT_FLOATING_POINT_SUPPORT_ENH /* IEEE-exception-simulation */
 #define FAC_MIE         S390_FEAT_STFLE_49 /* misc-instruction-extensions */
 #define FAC_LAT         S390_FEAT_STFLE_49 /* load-and-trap */
 #define FAC_LOC         S390_FEAT_STFLE_45 /* load/store on condition 1 */
-- 
2.31.1


