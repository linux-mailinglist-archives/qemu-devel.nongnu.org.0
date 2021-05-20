Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1B538B273
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:03:45 +0200 (CEST)
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkDA-00053X-4h
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1ljk6d-0003qe-1G
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:56:59 -0400
Received: from forward1-smtp.messagingengine.com ([66.111.4.223]:56177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1ljk6Z-0000S1-EX
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:56:58 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailforward.nyi.internal (Postfix) with ESMTP id 65AE119409FB;
 Thu, 20 May 2021 10:56:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 20 May 2021 10:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=DDI408hEzIsKkkLSrWxdgVh7cxIzItBOhihRC+7ELzw=; b=mI09N+Uq
 0NeWaQRtDFdPgYpD1WJvHI/QLeHD/rdMw3J/Z1qdr3SY8sy7QfMI4S4tLcHPlFkf
 vbJl7mpT3z/rK2UXoMWyIdoykc1V15GGQb91MMsDa5hNuFUeCy0Qj+RidSGztanj
 YXhyi5U6cXxHSge51ECE6WcUvDmEUhofiQ3A4+dCBHl9xgW4Ya75taqhXZAJ0sKy
 eypTF1q/CrwDhr3VBCG4/F0Vtk/3s7q69po3tVAN0Fx4hYyYreFdst7inN4OYsWZ
 b9SrhCNFJrbEqW3iJCYtXVJHdZtrFO54LRBL2H03nNW3lL4EcnTUT4Y7SioyzP72
 OKnmc78/m5E8Jw==
X-ME-Sender: <xms:tHimYI2pD7K0I2geEIRd9ujc4Cv5fDvvpT2D-d1vu6S69rpHTVF5VQ>
 <xme:tHimYDH78b5cdlu2dCpxdGDAMmEkinacBbvxFYV4nn-b-DeCVM3Ciev9AgSB1DQzU
 GbbH5p9wzreSWTVrn8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejuddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrd
 gtohhmqeenucggtffrrghtthgvrhhnpedufeetjefgfefhtdejhfehtdfftefhteekhefg
 leehfffhiefhgeelgfejtdehkeenucfkphepkedurddukeejrddviedrvdefkeenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgurdgv
 ughmohhnughsohhnsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:tHimYA5SQrsPmqFvhfPrAS61E_hXyvKhxElNA4NGTOx2lYTtDP9giw>
 <xmx:tHimYB3wwF5oZO3M1eQixdO-SC4qpberzWqf8VDZzqS_VMgVj0cPtw>
 <xmx:tHimYLEO4GxrAA9K4flF-j1Gzd2tttCtF4Av_pZcVZfiE1FmOhjOyg>
 <xmx:tHimYLEJSzGWh7NdW3ZeGaRKwRvpfJixUUMs_DFReWc7MvSkf0-zJQ>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 10:56:51 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 03d9d232;
 Thu, 20 May 2021 14:56:47 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/7] target/i386: Use constants for XSAVE offsets
Date: Thu, 20 May 2021 15:56:42 +0100
Message-Id: <20210520145647.3483809-3-david.edmondson@oracle.com>
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
 SPF_SOFTFAIL=0.665, UNPARSEABLE_RELAY=0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

Where existing constants for XSAVE offsets exists, use them.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 target/i386/kvm/kvm.c | 56 ++++++++++++++-----------------------------
 1 file changed, 18 insertions(+), 38 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index d972eb4705..aff0774fef 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2397,44 +2397,24 @@ static int kvm_put_fpu(X86CPU *cpu)
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
+#define ASSERT_OFFSET(offset, field) \
+    QEMU_BUILD_BUG_ON(offset != offsetof(X86XSaveArea, field))
+
+ASSERT_OFFSET(XSAVE_FCW_FSW_OFFSET, legacy.fcw);
+ASSERT_OFFSET(XSAVE_FTW_FOP_OFFSET, legacy.ftw);
+ASSERT_OFFSET(XSAVE_CWD_RIP_OFFSET, legacy.fpip);
+ASSERT_OFFSET(XSAVE_CWD_RDP_OFFSET, legacy.fpdp);
+ASSERT_OFFSET(XSAVE_MXCSR_OFFSET, legacy.mxcsr);
+ASSERT_OFFSET(XSAVE_ST_SPACE_OFFSET, legacy.fpregs);
+ASSERT_OFFSET(XSAVE_XMM_SPACE_OFFSET, legacy.xmm_regs);
+ASSERT_OFFSET(XSAVE_XSTATE_BV_OFFSET, header.xstate_bv);
+ASSERT_OFFSET(XSAVE_AVX_OFFSET, avx_state);
+ASSERT_OFFSET(XSAVE_BNDREG_OFFSET, bndreg_state);
+ASSERT_OFFSET(XSAVE_BNDCSR_OFFSET, bndcsr_state);
+ASSERT_OFFSET(XSAVE_OPMASK_OFFSET, opmask_state);
+ASSERT_OFFSET(XSAVE_ZMM_HI256_OFFSET, zmm_hi256_state);
+ASSERT_OFFSET(XSAVE_HI16_ZMM_OFFSET, hi16_zmm_state);
+ASSERT_OFFSET(XSAVE_PKRU_OFFSET, pkru_state);
 
 static int kvm_put_xsave(X86CPU *cpu)
 {
-- 
2.30.2


