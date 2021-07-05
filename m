Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898CF3BBB95
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:53:54 +0200 (CEST)
Received: from localhost ([::1]:56808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0MEb-0008HQ-L8
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1m0M7j-0003Rj-Dl
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:46:47 -0400
Received: from forward1-smtp.messagingengine.com ([66.111.4.223]:44407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1m0M7h-0000Cn-1W
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:46:47 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailforward.nyi.internal (Postfix) with ESMTP id 618C119409BD;
 Mon,  5 Jul 2021 06:46:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Jul 2021 06:46:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=WSyFBvKjNTyRy9dxJZwN/t3hhKqHdrXbYEIv5+h4b8M=; b=hrIsB282
 XiARxhjwun9tx2bBkj9b1k5YYlQSaQhe7TaRRBxHxlB6677AIItSaD14No6XJTTf
 Z+tYJHxuLB9jq43owkmMLrjC6POjdI4NGRohej9gxfxQ9TXX678cbNzb855TieLg
 U0AZOjwCZwQlFbZ3CNF4OmEyy1JM2ebjiKnILFIffRLR58cCYZ3uwPSCoueesWWG
 T8Syqh5BDjDwitVZQYsYIAkOcQs4BQ31vHmhxqGsPkQhItKLnjNx+t+NfKDr2D0s
 B9p6Exn+kkVHOVuPpxY1oeUEvp6rbDm/B24CkNTb+gyAvvEZH6HXlFnDWuUkze2x
 gA1ojdCSIiGlKg==
X-ME-Sender: <xms:EuPiYGGOKWb1djUmBbwlBuasaR3qutW_olFDmutu8FV-MZHkdMLARw>
 <xme:EuPiYHXh_nx4ez561zGwP27UmUJRb4yuvO9PQsiPw5XksJpKR5-O2Dy8mSCxnEXCA
 zvrt9bFZ36csXbJexA>
X-ME-Received: <xmr:EuPiYAJ1UXyXHYGf3eYq5zY5pviNHMM6XyM17qhec7YH-WaUkt7WmQCQ8e5GQvHDAoprXgt1aJBVtU-BHuEb9v4has2ZGk1y3bdDAxudDbo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejgedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrd
 gtohhmqeenucggtffrrghtthgvrhhnpedufeetjefgfefhtdejhfehtdfftefhteekhefg
 leehfffhiefhgeelgfejtdehkeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegurghvihgurdgvughmohhnughsohhnsehorhgrtghlvgdrtgho
 mh
X-ME-Proxy: <xmx:EuPiYAEKivy34pn2KXWiG3H379lEzVfHrCOBKNGJCcTWS66BmCwiGQ>
 <xmx:EuPiYMXs8t6EUMdiJd0f8o8BEiBLbVlwruI5HVf-M01Rt1cKpIV9hg>
 <xmx:EuPiYDNqqsrlerJHrHACOCogHSC7WggaMQmoeveVrrcLnq7gMBU7Xg>
 <xmx:EuPiYCYl-0m2QtHyJatav1Nn3og4mK95-Ny7AHefoH2ehY3gZjCCww>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jul 2021 06:46:41 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 9b149bf5;
 Mon, 5 Jul 2021 10:46:32 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/8] target/i386: Clarify the padding requirements of
 X86XSaveArea
Date: Mon,  5 Jul 2021 11:46:27 +0100
Message-Id: <20210705104632.2902400-4-david.edmondson@oracle.com>
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

Replace the hard-coded size of offsets or structure elements with
defined constants or sizeof().

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 target/i386/cpu.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6590ad6391..92f9ca264c 100644
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


