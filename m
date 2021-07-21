Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5793D0A36
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:02:42 +0200 (CEST)
Received: from localhost ([::1]:47052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67Bh-00007O-N3
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m66yP-0006vt-Ha; Wed, 21 Jul 2021 03:48:57 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:40175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m66yN-0002Ts-Jx; Wed, 21 Jul 2021 03:48:57 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id D1CFA5816CF;
 Wed, 21 Jul 2021 03:48:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 21 Jul 2021 03:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=UpwXF+l7PVdDF
 I199VbEa9H5egyyWOLIXp+Scgp7TlU=; b=F58ozIdptELyrC4lQljMLPlbcCTY4
 s9rkCY868UlpzUQGZYC2m9VOucNOkxLXY/VYEpb8ZgGjD6P5w8wkwb2RYkRgzmZK
 uIzulfZkjC6IKzCpmWhBOdqo809AqsFYPcY82/bGw0TRPaaFPlTSLb2FZF6Ey2p/
 QPYEuaG/yvyd3dGCYixxB0X6uEbFwl97/1QisfXw/T4tNNoMuHWT9WYEIybXQjfC
 GITUfcelC7aV48s4kTqwdmvYXv2H/bgbVShggFfXCvoGxJiRUC/d3C4ncGd/FZ8b
 8uPPWUA8/tHDVEE/eohftTNKxmh2BVVsRTFvt4fdMk1mWGESfGQ3Uxe5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=UpwXF+l7PVdDFI199VbEa9H5egyyWOLIXp+Scgp7TlU=; b=F6QaGT/1
 LzoiavEvLLmPY7Z+OlOdiJP9AtinAM0TIcZ34e6jdMIAhWSPZRznuOep0cYPooPC
 vpLU0lzHfqsnbcsFxARyDy+U1SJYeK0eTinFqG+X7A3ae+oaXtz0cNSpBVrbzc75
 oucF7G/DLkCyBYK82ZX/WYZZ1gfJwy84cxYChseTugavnYnUODgpvKcsodMLsnyP
 RjbfxsCgT/YHjTSUhfejAL89DKSYi3V73y/iatFFLE/fbkQE53hDwPxGLSgrYo9y
 +VgM5p7kiCBl0uyKnJXPFkq8/cXmsAjzxD7Mzhvs6vfKhcD6Ovg+65z9ltg6i2Ow
 bg1DXmwAyqwnwQ==
X-ME-Sender: <xms:ZtH3YO8chU0WeAzZ-mD6e7KEMPhCAfpIDnfw9dBvvqf6X9oATvku0w>
 <xme:ZtH3YOsn9s9u2LC0Go0oZyBnk7EAYsL6wQ-qquD82WRnMIKviIOjq1BdTA6sR60nF
 ky5gkKG2Kk0EAC74Qo>
X-ME-Received: <xmr:ZtH3YEB5sEHk2r6rbQYoktTlTesggVnPJAZatnHeA8udxwm3u9jbn0vi7GUU3M91JNDlOUnWCfGKhxnJ7O3_LdSQ9ocNH72gaSRgxufUrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeefgdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ZtH3YGeM9hBh7DQipnDHi3im-sKl0buVrWNQXwkWFwKBIutrRrDn-Q>
 <xmx:ZtH3YDMWVrh0guF6JAZUWhoxm14UwzmOanrzhaEM5iqHN3krOB5DBA>
 <xmx:ZtH3YAnigwYKoE0yUKgLN7zbn9Vuf18mg8-i7Xfmk7W4ahOWgTZhkA>
 <xmx:ZtH3YBtv_S-hlWHdXHjzWeeUAIcbvX8L0rUYTAIwKnhkOMkXXZW50Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 03:48:52 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/5] hw/nvme: fix out-of-bounds reads
Date: Wed, 21 Jul 2021 09:48:34 +0200
Message-Id: <20210721074836.110232-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210721074836.110232-1-its@irrelevant.dk>
References: <20210721074836.110232-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Peter noticed that mmio access may read into the NvmeParams member in
the NvmeCtrl struct.

Fix the bounds check.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/nvme/ctrl.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 23ff71f65c0e..10c2363c1d4d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5969,23 +5969,26 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
         /* should RAZ, fall through for now */
     }
 
-    if (addr < sizeof(n->bar)) {
-        /*
-         * When PMRWBM bit 1 is set then read from
-         * from PMRSTS should ensure prior writes
-         * made it to persistent media
-         */
-        if (addr == NVME_REG_PMRSTS &&
-            (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
-            memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
-        }
-        memcpy(&val, ptr + addr, size);
-    } else {
+    if (addr > sizeof(n->bar) - size) {
         NVME_GUEST_ERR(pci_nvme_ub_mmiord_invalid_ofs,
                        "MMIO read beyond last register,"
                        " offset=0x%"PRIx64", returning 0", addr);
+
+        return 0;
     }
 
+    /*
+     * When PMRWBM bit 1 is set then read from
+     * from PMRSTS should ensure prior writes
+     * made it to persistent media
+     */
+    if (addr == NVME_REG_PMRSTS &&
+        (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
+        memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
+    }
+
+    memcpy(&val, ptr + addr, size);
+
     return val;
 }
 
-- 
2.32.0


