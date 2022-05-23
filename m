Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11133530E98
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 13:54:36 +0200 (CEST)
Received: from localhost ([::1]:54106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt6du-0004S6-Jb
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 07:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nt6b6-0003Xv-UZ
 for qemu-devel@nongnu.org; Mon, 23 May 2022 07:51:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nt6b3-0005mq-Tp
 for qemu-devel@nongnu.org; Mon, 23 May 2022 07:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653306694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bb+MtcQac3JEVv5fdPzKPxEg8ue5FbgO3Vg1fXNMn5E=;
 b=TD0JtTpJ7lzNYrHyGe/Hl6/1/cR0X4RyWj0cYU4Gex2Ps+GYQo8eg4lej7VLietzi+h9x2
 hlPQ6dqseCpvwp6g+rvuPlCglC4MeISrSsVWBDnrA8brYUE2VNK4Zd+02O0bRY08T3c5qt
 lJ7M4Zi3Wipgh5kzG6OCPayDhOdz27E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-9m3G_YS4MIKVmvtJCigXtA-1; Mon, 23 May 2022 07:51:30 -0400
X-MC-Unique: 9m3G_YS4MIKVmvtJCigXtA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 660721C0CE67;
 Mon, 23 May 2022 11:51:30 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98888407E1C0;
 Mon, 23 May 2022 11:51:29 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, david@redhat.com, richard.henderson@linaro.org,
 thuth@redhat.com
Subject: [PATCH] s390: Typo fix FLOATING_POINT_SUPPPORT_ENH
Date: Mon, 23 May 2022 12:51:23 +0100
Message-Id: <20220523115123.150340-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

One less P needed.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
2.36.1


