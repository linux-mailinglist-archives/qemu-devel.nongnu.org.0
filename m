Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7574A38B292
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:07:47 +0200 (CEST)
Received: from localhost ([::1]:32964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkH4-00050N-EJ
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1ljk6d-0003qY-0i
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:56:59 -0400
Received: from forward1-smtp.messagingengine.com ([66.111.4.223]:57275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1ljk6Z-0000SW-KT
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:56:58 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailforward.nyi.internal (Postfix) with ESMTP id 0DC6319409D4;
 Thu, 20 May 2021 10:56:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 20 May 2021 10:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=poNg7U/mGTsC6AfH6IgGW4okeP0nr6H5S/5XCFk7138=; b=FzP7BDdQ
 8JwfAwM+bjjR216tK6QSk5usAjR0hQf6VmtqMMV2iu5S6U6fntKcF/yxPXCjnICb
 7Q/wacFePcP614s7NFHDaIMj7S+d0V7DEBiM+JpcrDTgW1ri94jaUdPnitWS6rOP
 Z99xJLf7Ck3Y9L1HEzPXtQaVhOj5imFk3D9mi2Ob6kQLMG7VyJqLKONAaRBLd8zo
 V/N6dzbfsOD+1ouN/Plu5xtSJ1g/KInF6VHn9HwlVP+iGPc/OgqR0ZZQSSC22JC1
 ycLShUyd67F4AnKStYKnNngrD9SrNbFCG9wmzmgCkvyff/tKsa5SnSs3PVXIWzAQ
 29fa2Oo5KI98QQ==
X-ME-Sender: <xms:tHimYLtFZbNvJNXt40q547HIws7WidfnyS8k6NQDwt1VKYKDYZV6ig>
 <xme:tHimYMfOHhnN1dVcqL2kKTEYiysrPnwKmxel1DnfYY6MOFymuoDezDnZzOwXnjmFA
 23EQ9lJyuYv0jpFzdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejuddgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrd
 gtohhmqeenucggtffrrghtthgvrhhnpedufeetjefgfefhtdejhfehtdfftefhteekhefg
 leehfffhiefhgeelgfejtdehkeenucfkphepkedurddukeejrddviedrvdefkeenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgurdgv
 ughmohhnughsohhnsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:tHimYOwsuYjBHvYo-VBU_STUczAec-WedbLs-Nng3RPlgoYitUDk1w>
 <xmx:tHimYKOUp-s1lAMSK8PgXe3zGjL8fnFOW4NGTyN-9gI2NoCgrOGwbg>
 <xmx:tHimYL9_bIK1pRh5Ik28Gj6Zvig7dfo9_fo8QLZQnWYpy3wmG1V2Yg>
 <xmx:tXimYBc24TujmhAj4dznKpNAYJMSBvppCYral-R8RbE13Yh0DY169A>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 10:56:51 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id d0ac2af4;
 Thu, 20 May 2021 14:56:47 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/7] target/i386: Clarify the padding requirements of
 X86XSaveArea
Date: Thu, 20 May 2021 15:56:43 +0100
Message-Id: <20210520145647.3483809-4-david.edmondson@oracle.com>
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

Replace the hard-coded size of offsets or structure elements with
defined constants or sizeof().

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 target/i386/cpu.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 1fb732f366..0bb365bddf 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1329,7 +1329,13 @@ typedef struct X86XSaveArea {
 
     /* AVX State: */
     XSaveAVX avx_state;
-    uint8_t padding[960 - 576 - sizeof(XSaveAVX)];
+
+    /* Ensure that XSaveBNDREG is properly aligned. */
+    uint8_t padding[XSAVE_BNDREG_OFFSET
+                    - sizeof(X86LegacyXSaveArea)
+                    - sizeof(X86XSaveHeader)
+                    - sizeof(XSaveAVX)];
+
     /* MPX State: */
     XSaveBNDREG bndreg_state;
     XSaveBNDCSR bndcsr_state;
-- 
2.30.2


