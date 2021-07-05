Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758EF3BBB86
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:48:41 +0200 (CEST)
Received: from localhost ([::1]:40956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0M9Y-00066I-G2
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1m0M7j-0003SY-QG
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:46:47 -0400
Received: from forward1-smtp.messagingengine.com ([66.111.4.223]:36947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1m0M7i-0000Fh-4o
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:46:47 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailforward.nyi.internal (Postfix) with ESMTP id 01C2719409D5;
 Mon,  5 Jul 2021 06:46:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 05 Jul 2021 06:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=uHtzc5hD5n2kpYfDdA4+xmzSapD2LfwWyUZ1ufnaLg4=; b=Hx9D4/IF
 IAxJNCW8R6Ewi2C7ssRf/JdN1kYEpb4nNkbRtKVjYt8RuzVwEjkFR5P8kxbx26w2
 CnfDKtOdmUmlz9DZ21WThY5gNDxjUF415Y0+0nleZZ5yLAff2ORijnvqZys8ndot
 Y/sq2zpKWz4kxYuplYn5eOITGD0C3HijEuXvmanOFaKJApoXQGlADyuViu+i5ys7
 d4rpbSLaxxm5cVc++uh0jrEmnTghDrF/E+CJBnzBVqOiLOImKTv39zM2No+jWuO0
 7OcF5hgKIteNgTPq5Iy/HxGbYTImXQ4NW4P3M5qdfNeogqDK2NwekQXw1O8ENguB
 zqHnH08y5GfLBg==
X-ME-Sender: <xms:E-PiYLt-B8vm6eQQtOmk34bNzpsrlRpqFfm1_wuirGDjTfUTEZYwog>
 <xme:E-PiYMcTZ3T0ARmtTOD0DpynSv_dzj1EON807sxrCszo86LnDXkplcPnPM30uWiO6
 9mw9eMjfRxnv79feBg>
X-ME-Received: <xmr:E-PiYOyNfPCu-DgJdvl4LPSrcHE24_6eY-dp87dv8Id5ckGjafCN4RLNIP4tcB9Th5vQlTR5fgI73wYJBsk2aW6D4Sraqj0byj2R8LnsFIE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejgedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrd
 gtohhmqeenucggtffrrghtthgvrhhnpedufeetjefgfefhtdejhfehtdfftefhteekhefg
 leehfffhiefhgeelgfejtdehkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegurghvihgurdgvughmohhnughsohhnsehorhgrtghlvgdrtgho
 mh
X-ME-Proxy: <xmx:E-PiYKPh_Q4VT-GA3wf8i9bj0-IImma2_iZqjRuFxg_SkrC7JWJ14Q>
 <xmx:E-PiYL9IWRMnxOqegXF0OYgZd2VJkUZRj08_5ZYw0pOVJvr6XFw0oQ>
 <xmx:E-PiYKUvWqcg84GMlhZpSS8lyJg28JrFJWm73sdUV77mP_MeOuzBKA>
 <xmx:E-PiYIjLF7-VFoU7tpyvL-ZIJ7nEs9YXKsHDVSISLzrcfPJJ42gy3g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jul 2021 06:46:42 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id f3fd2bd6;
 Mon, 5 Jul 2021 10:46:32 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/8] target/i386: Make x86_ext_save_areas visible outside
 cpu.c
Date: Mon,  5 Jul 2021 11:46:29 +0100
Message-Id: <20210705104632.2902400-6-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705104632.2902400-1-david.edmondson@oracle.com>
References: <20210705104632.2902400-1-david.edmondson@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=66.111.4.223;
 envelope-from=david.edmondson@oracle.com;
 helo=forward1-smtp.messagingengine.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Michael Roth <michael.roth@amd.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>,
 David Edmondson <david.edmondson@oracle.com>, babu.moger@amd.com,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide visibility of the x86_ext_save_areas array and associated type
outside of cpu.c.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 target/i386/cpu.c | 7 +------
 target/i386/cpu.h | 9 +++++++++
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index d8f3ab3192..13caa0de50 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1304,12 +1304,7 @@ static const X86RegisterInfo32 x86_reg_info_32[CPU_NB_REGS32] = {
 };
 #undef REGISTER
 
-typedef struct ExtSaveArea {
-    uint32_t feature, bits;
-    uint32_t offset, size;
-} ExtSaveArea;
-
-static const ExtSaveArea x86_ext_save_areas[] = {
+const ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
     [XSTATE_FP_BIT] = {
         /* x87 FP state component is always enabled if XSAVE is supported */
         .feature = FEAT_1_ECX, .bits = CPUID_EXT_XSAVE,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index ada2941c6e..c9c0a34330 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1370,6 +1370,15 @@ QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) != XSAVE_ZMM_HI256_OFF
 QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) != XSAVE_HI16_ZMM_OFFSET);
 QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) != XSAVE_PKRU_OFFSET);
 
+typedef struct ExtSaveArea {
+    uint32_t feature, bits;
+    uint32_t offset, size;
+} ExtSaveArea;
+
+#define XSAVE_STATE_AREA_COUNT (XSTATE_PKRU_BIT + 1)
+
+extern const ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT];
+
 typedef enum TPRAccess {
     TPR_ACCESS_READ,
     TPR_ACCESS_WRITE,
-- 
2.30.2


