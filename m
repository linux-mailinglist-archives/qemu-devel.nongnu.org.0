Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A35F3BBB8E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:51:31 +0200 (CEST)
Received: from localhost ([::1]:48860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0MCI-0002xp-8O
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1m0M7i-0003RN-3n
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:46:46 -0400
Received: from forward1-smtp.messagingengine.com ([66.111.4.223]:55815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1m0M7g-0000EL-6H
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:46:45 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailforward.nyi.internal (Postfix) with ESMTP id AB9631940A1F;
 Mon,  5 Jul 2021 06:46:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Jul 2021 06:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=APn3koshsRsOL4WACDIqmSFbrCC2pqhcz0qRBSDXuLc=; b=ktxLoH54
 UwF6x58B8FsPNKSIx4pIttXdp7pvAzMzlQStTJhgC7jbC6JUvzyDhFMueHP0fAZJ
 23UPEJ+rvRbXL/9O2RvANBMBUDIke3Y/7wgujTTvrwiqDnAlzgSbSZEFk9H8Ck4b
 kdMRLUxytXY8c42kCNGuULGhpM0sBAjund5MfwQW6wY/eU8OK1yfPL0yX9G7HjzM
 DEEGjVwe1iylwTiJsfUEyw8HMD8/oXjKSSqA2DzV+OjeByHpaSkkIDlO/XwZd/tG
 17X8ChmbLdQXcK8oqkg0rFFVvOWVVso/Fll555YotPHCJk3tN/iAJ5MtZ1gLWQB1
 1dPJTHqBx+HSOQ==
X-ME-Sender: <xms:D-PiYDFpKqPYp99K6WekLTkns42nliT19irkJWV8wOUylFtLPH60Bg>
 <xme:D-PiYAXsslIIuhfHvmdkkq_seqJSD3SPOla6jLyAZtHioLfIOk3KYoAiV41ps8O2H
 Ct-erHApjZwrm7BOPA>
X-ME-Received: <xmr:D-PiYFJUN9iUZASFCmNjzhBnnqzpfx8tO8d3RatzRJwygN8ixDfh1fsyPf_aey4tyD4GlSsYNrrrvDpq4EQkVlCSMISHyyHp8b32tn_Bcmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejgedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrd
 gtohhmqeenucggtffrrghtthgvrhhnpedufeetjefgfefhtdejhfehtdfftefhteekhefg
 leehfffhiefhgeelgfejtdehkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegurghvihgurdgvughmohhnughsohhnsehorhgrtghlvgdrtgho
 mh
X-ME-Proxy: <xmx:D-PiYBH_y-HaUlaWa2926olwjgrkPyDObEwWdDV90iZs8IgQgANXkw>
 <xmx:D-PiYJWk9IiHptz-8AnPatD2Rs3rHyd5XQFsimWookxm1TLawhyz6w>
 <xmx:D-PiYMONSozaaG8DEFsnQeO7HnYSrWO_4o8JDKWV0nsPFlEZGO0YGQ>
 <xmx:E-PiYDaQsGm4vxsRX5Eodz3p7Ohosa9zvwGt60x1ize-eiFYPEt3DA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jul 2021 06:46:38 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id d504d057;
 Mon, 5 Jul 2021 10:46:32 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/8] target/i386: Consolidate the X86XSaveArea offset
 checks
Date: Mon,  5 Jul 2021 11:46:26 +0100
Message-Id: <20210705104632.2902400-3-david.edmondson@oracle.com>
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

Rather than having similar but different checks in cpu.h and kvm.c,
move them all to cpu.h.
---
 target/i386/cpu.h     | 22 +++++++++++++++-------
 target/i386/kvm/kvm.c | 39 ---------------------------------------
 2 files changed, 15 insertions(+), 46 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index aedb8f2e01..6590ad6391 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1341,21 +1341,29 @@ typedef struct X86XSaveArea {
     XSavePKRU pkru_state;
 } X86XSaveArea;
 
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) != XSAVE_AVX_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) != 0x100);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) != XSAVE_BNDREG_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) != 0x40);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) != XSAVE_BNDCSR_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) != 0x40);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) != XSAVE_OPMASK_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveOpmask) != 0x40);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) != XSAVE_ZMM_HI256_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveZMM_Hi256) != 0x200);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) != XSAVE_HI16_ZMM_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) != XSAVE_PKRU_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
 
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fcw) != XSAVE_FCW_FSW_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.ftw) != XSAVE_FTW_FOP_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpip) != XSAVE_CWD_RIP_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpdp) != XSAVE_CWD_RDP_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.mxcsr) != XSAVE_MXCSR_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpregs) != XSAVE_ST_SPACE_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.xmm_regs) != XSAVE_XMM_SPACE_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) != XSAVE_AVX_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) != XSAVE_BNDREG_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) != XSAVE_BNDCSR_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) != XSAVE_OPMASK_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) != XSAVE_ZMM_HI256_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) != XSAVE_HI16_ZMM_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) != XSAVE_PKRU_OFFSET);
+
 typedef enum TPRAccess {
     TPR_ACCESS_READ,
     TPR_ACCESS_WRITE,
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 04e4ec063f..3ab1d71775 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2466,45 +2466,6 @@ static int kvm_put_fpu(X86CPU *cpu)
     return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_FPU, &fpu);
 }
 
-#define XSAVE_FCW_FSW     0
-#define XSAVE_FTW_FOP     1
-#define XSAVE_CWD_RIP     2
-#define XSAVE_CWD_RDP     4
-#define XSAVE_MXCSR       6
-#define XSAVE_ST_SPACE    8
-#define XSAVE_XMM_SPACE   40
-#define XSAVE_XSTATE_BV   128
-#define XSAVE_YMMH_SPACE  144
-#define XSAVE_BNDREGS     240
-#define XSAVE_BNDCSR      256
-#define XSAVE_OPMASK      272
-#define XSAVE_ZMM_Hi256   288
-#define XSAVE_Hi16_ZMM    416
-#define XSAVE_PKRU        672
-
-#define XSAVE_BYTE_OFFSET(word_offset) \
-    ((word_offset) * sizeof_field(struct kvm_xsave, region[0]))
-
-#define ASSERT_OFFSET(word_offset, field) \
-    QEMU_BUILD_BUG_ON(XSAVE_BYTE_OFFSET(word_offset) != \
-                      offsetof(X86XSaveArea, field))
-
-ASSERT_OFFSET(XSAVE_FCW_FSW, legacy.fcw);
-ASSERT_OFFSET(XSAVE_FTW_FOP, legacy.ftw);
-ASSERT_OFFSET(XSAVE_CWD_RIP, legacy.fpip);
-ASSERT_OFFSET(XSAVE_CWD_RDP, legacy.fpdp);
-ASSERT_OFFSET(XSAVE_MXCSR, legacy.mxcsr);
-ASSERT_OFFSET(XSAVE_ST_SPACE, legacy.fpregs);
-ASSERT_OFFSET(XSAVE_XMM_SPACE, legacy.xmm_regs);
-ASSERT_OFFSET(XSAVE_XSTATE_BV, header.xstate_bv);
-ASSERT_OFFSET(XSAVE_YMMH_SPACE, avx_state);
-ASSERT_OFFSET(XSAVE_BNDREGS, bndreg_state);
-ASSERT_OFFSET(XSAVE_BNDCSR, bndcsr_state);
-ASSERT_OFFSET(XSAVE_OPMASK, opmask_state);
-ASSERT_OFFSET(XSAVE_ZMM_Hi256, zmm_hi256_state);
-ASSERT_OFFSET(XSAVE_Hi16_ZMM, hi16_zmm_state);
-ASSERT_OFFSET(XSAVE_PKRU, pkru_state);
-
 static int kvm_put_xsave(X86CPU *cpu)
 {
     CPUX86State *env = &cpu->env;
-- 
2.30.2


