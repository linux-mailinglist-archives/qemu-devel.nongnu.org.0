Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC9F3BBB84
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:48:40 +0200 (CEST)
Received: from localhost ([::1]:40858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0M9X-000623-6p
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1m0M7h-0003RF-O9
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:46:45 -0400
Received: from forward1-smtp.messagingengine.com ([66.111.4.223]:36073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1m0M7f-0000C7-JM
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:46:45 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailforward.nyi.internal (Postfix) with ESMTP id 8ABEA1940A07;
 Mon,  5 Jul 2021 06:46:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 05 Jul 2021 06:46:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=xjQzsrjvikRqRv3L5KeF76tdYlXtfvFF4dDp5D0t5u0=; b=AEMRMrBH
 YLPAmjlM9hOULoQ4VetZA1PRdU6KEWjR/i08RAHHYfR4rv0yE5nS/KRPxsTglR7u
 t3jX21kfw0Xe19hsbljsbxmtwJCJqYUi1u7/GusYFcEBVWaH/Aq9q1RMDD/kJMRZ
 PYQzmbsIXOim5BRkUdcQmGdvEHU3uiVwk7UhPY1FoqUk1WcE6Gvc8eCwS5RQwajx
 j5yzp3Vprds7HeI5xGtTreuWsVn6EO1yLZ1CumlsVPKnv4Op1inWh3x7usdPcoBw
 aQiybmK1XCUcqukm5LGx4uLSd/ySDdH5njLOHmAX2+CvyIJwoDeXUQiMNcJBvc+I
 +ZySDESf4zgiPg==
X-ME-Sender: <xms:DOPiYFmv0Kn7qkq4iiq-68E2JSXyRBFc24iaVGDIc_13vzq5B-ulHg>
 <xme:DOPiYA27Zudi1f_v1ysUFFqVOxGjS_guFU-oDWDpbLzVUwtoDoFyueTe1fflK87dk
 I-VczHTtuKwVpnXvD0>
X-ME-Received: <xmr:DOPiYLqqJ4DiqwpamfKMUz2bCcpRSwoWyBixcuOl4wFlpm0BLxIbrCnFQTqiDNGHpJVT9ZvVVMxluHwY-_c2AgE57v90Vtp-U6zU9RyXUc8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejgedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrd
 gtohhmqeenucggtffrrghtthgvrhhnpedufeetjefgfefhtdejhfehtdfftefhteekhefg
 leehfffhiefhgeelgfejtdehkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegurghvihgurdgvughmohhnughsohhnsehorhgrtghlvgdrtgho
 mh
X-ME-Proxy: <xmx:DOPiYFk5oigzWlHkjfV9f6ngOA7cFHWDBeNLzz4z7940Oj2QITD7NQ>
 <xmx:DOPiYD0l6FSDqDugwlO-0ifKckA_5Zyquw_l3xcAuy7xC5zopFNZ9Q>
 <xmx:DOPiYEtFb3MTz14tHYmHMQ94s-5JSKRljZr8zcnm8z6jqLH8pLwANg>
 <xmx:EePiYH4tDhnMizejRdAMjkp23I-LC0v4FOhBybwJ9WJI1bzs6JoZdw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jul 2021 06:46:35 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 04371dc7;
 Mon, 5 Jul 2021 10:46:32 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/8] target/i386: Declare constants for XSAVE offsets
Date: Mon,  5 Jul 2021 11:46:25 +0100
Message-Id: <20210705104632.2902400-2-david.edmondson@oracle.com>
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

Declare and use manifest constants for the XSAVE state component
offsets.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 target/i386/cpu.h | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index f7fa5870b1..aedb8f2e01 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1305,6 +1305,22 @@ typedef struct XSavePKRU {
     uint32_t padding;
 } XSavePKRU;
 
+#define XSAVE_FCW_FSW_OFFSET    0x000
+#define XSAVE_FTW_FOP_OFFSET    0x004
+#define XSAVE_CWD_RIP_OFFSET    0x008
+#define XSAVE_CWD_RDP_OFFSET    0x010
+#define XSAVE_MXCSR_OFFSET      0x018
+#define XSAVE_ST_SPACE_OFFSET   0x020
+#define XSAVE_XMM_SPACE_OFFSET  0x0a0
+#define XSAVE_XSTATE_BV_OFFSET  0x200
+#define XSAVE_AVX_OFFSET        0x240
+#define XSAVE_BNDREG_OFFSET     0x3c0
+#define XSAVE_BNDCSR_OFFSET     0x400
+#define XSAVE_OPMASK_OFFSET     0x440
+#define XSAVE_ZMM_HI256_OFFSET  0x480
+#define XSAVE_HI16_ZMM_OFFSET   0x680
+#define XSAVE_PKRU_OFFSET       0xa80
+
 typedef struct X86XSaveArea {
     X86LegacyXSaveArea legacy;
     X86XSaveHeader header;
@@ -1325,19 +1341,19 @@ typedef struct X86XSaveArea {
     XSavePKRU pkru_state;
 } X86XSaveArea;
 
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) != 0x240);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) != XSAVE_AVX_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) != 0x100);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) != 0x3c0);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) != XSAVE_BNDREG_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) != 0x40);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) != 0x400);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) != XSAVE_BNDCSR_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) != 0x40);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) != 0x440);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) != XSAVE_OPMASK_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveOpmask) != 0x40);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) != 0x480);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) != XSAVE_ZMM_HI256_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveZMM_Hi256) != 0x200);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) != 0x680);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) != XSAVE_HI16_ZMM_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) != 0xA80);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) != XSAVE_PKRU_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
 
 typedef enum TPRAccess {
-- 
2.30.2


