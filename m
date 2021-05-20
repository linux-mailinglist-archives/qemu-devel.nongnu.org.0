Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4F838B2A0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:09:42 +0200 (CEST)
Received: from localhost ([::1]:38790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkIv-0000e5-GL
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1ljk6i-0003tS-Gi
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:57:06 -0400
Received: from forward1-smtp.messagingengine.com ([66.111.4.223]:53355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1ljk6b-0000V6-TG
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:57:00 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailforward.nyi.internal (Postfix) with ESMTP id E3C0C1940A04;
 Thu, 20 May 2021 10:56:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 20 May 2021 10:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=2b+Iav3ZgZxI2yn9eMrphy8hZPx+8/wDXUh3tEu8dIo=; b=rnweCNcw
 clSGmKilZ/lGxJvwfzYD8vz382vYdisb8iwHNEKdU/P2lRPHm+IPEhji0MrGd7VL
 rQ+VtoDVldRvsXpvkHpNXJA99pgOEh7SHwKCtVeMCxDhyb5EmPaRqPH9oIs9gaA9
 6f5Umt7N1hKROwdPZQ6G4t79l5yC0s/h8hWRmwDx4RrTO1QOSow3mWLi/y3s6Q0O
 HjbBDUrhDmXKvpmTxnXl+clLAAla3QoESqgRmTTIGF+70dXBG7uw0wVf2l3hJIoY
 FEZAOqjyrdNfMQMgOWmmxNb0ClwCj+SvbQ0e34gLc9LD4xGBK2xATrX6+i9yOS7g
 xLsGVrRs2TWRIA==
X-ME-Sender: <xms:tXimYDFWTF3oykGfYboJ2SeA8-nqJM3HCoFRs9Ai6gi3wgcvEI2b0w>
 <xme:tXimYAXVEopPAzeeCieH9fTjCz7avH4OzelWj_k29pBGBiCopDmmIzBT8ihGMhAB6
 ArB-E1-qHYoRp9y2-k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejuddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrd
 gtohhmqeenucggtffrrghtthgvrhhnpedufeetjefgfefhtdejhfehtdfftefhteekhefg
 leehfffhiefhgeelgfejtdehkeenucfkphepkedurddukeejrddviedrvdefkeenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgurdgv
 ughmohhnughsohhnsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:tXimYFKJY2P6m2DWnzA-2j2iDc5MOVkFSKmALZIhHZtpzxzS4qIRjQ>
 <xmx:tXimYBGQPLcO9ZNNl8YvzTaruIy-oSJ7ZlZLKaisMr8PJE8Yp6oIow>
 <xmx:tXimYJVhKDge1ZuxYopDt-E6MnO3ln44Wyg2AHWomOt4PTAN_nItmA>
 <xmx:tXimYOVp_ZEj_aI4pwSUn82tfTwr-CEOr_1PsjA7SMIcO4tM4x5qxQ>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 10:56:52 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 0c7b4072;
 Thu, 20 May 2021 14:56:48 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/7] target/i386: Introduce AMD X86XSaveArea sub-union
Date: Thu, 20 May 2021 15:56:45 +0100
Message-Id: <20210520145647.3483809-6-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520145647.3483809-1-david.edmondson@oracle.com>
References: <20210520145647.3483809-1-david.edmondson@oracle.com>
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
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Edmondson <david.edmondson@oracle.com>, Babu Moger <babu.moger@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AMD stores the pkru_state at a different offset to Intel.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 target/i386/cpu.h     | 17 +++++++++++++++--
 target/i386/kvm/kvm.c |  3 ++-
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index f1ce4e3008..99f0d5d851 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1319,7 +1319,8 @@ typedef struct XSavePKRU {
 #define XSAVE_OPMASK_OFFSET     0x440
 #define XSAVE_ZMM_HI256_OFFSET  0x480
 #define XSAVE_HI16_ZMM_OFFSET   0x680
-#define XSAVE_PKRU_OFFSET       0xa80
+#define XSAVE_INTEL_PKRU_OFFSET 0xa80
+#define XSAVE_AMD_PKRU_OFFSET   0x980
 
 typedef struct X86XSaveArea {
     X86LegacyXSaveArea legacy;
@@ -1348,6 +1349,16 @@ typedef struct X86XSaveArea {
             /* PKRU State: */
             XSavePKRU pkru_state;
         } intel;
+        struct {
+            /* Ensure that XSavePKRU is properly aligned. */
+            uint8_t padding[XSAVE_AMD_PKRU_OFFSET
+                            - sizeof(X86LegacyXSaveArea)
+                            - sizeof(X86XSaveHeader)
+                            - sizeof(XSaveAVX)];
+
+            /* PKRU State: */
+            XSavePKRU pkru_state;
+        } amd;
     };
 } X86XSaveArea;
 
@@ -1370,7 +1381,9 @@ QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, intel.hi16_zmm_state)
                   != XSAVE_HI16_ZMM_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
 QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, intel.pkru_state)
-                  != XSAVE_PKRU_OFFSET);
+                  != XSAVE_INTEL_PKRU_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, amd.pkru_state)
+                  != XSAVE_AMD_PKRU_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
 
 typedef enum TPRAccess {
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 417776a635..9dd7db060d 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2414,7 +2414,8 @@ ASSERT_OFFSET(XSAVE_BNDCSR_OFFSET, intel.bndcsr_state);
 ASSERT_OFFSET(XSAVE_OPMASK_OFFSET, intel.opmask_state);
 ASSERT_OFFSET(XSAVE_ZMM_HI256_OFFSET, intel.zmm_hi256_state);
 ASSERT_OFFSET(XSAVE_HI16_ZMM_OFFSET, intel.hi16_zmm_state);
-ASSERT_OFFSET(XSAVE_PKRU_OFFSET, intel.pkru_state);
+ASSERT_OFFSET(XSAVE_INTEL_PKRU_OFFSET, intel.pkru_state);
+ASSERT_OFFSET(XSAVE_AMD_PKRU_OFFSET, amd.pkru_state);
 
 static int kvm_put_xsave(X86CPU *cpu)
 {
-- 
2.30.2


