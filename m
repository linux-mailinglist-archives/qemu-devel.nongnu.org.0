Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78BA628EC4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:57:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijP-0003KZ-4o; Mon, 14 Nov 2022 18:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marmarek@invisiblethingslab.com>)
 id 1ouieP-0001yn-MJ
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:02 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marmarek@invisiblethingslab.com>)
 id 1ouf0g-0005g9-4p
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 14:20:47 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 4306932009F4;
 Mon, 14 Nov 2022 14:20:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 14 Nov 2022 14:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1668453641; x=1668540041; bh=GH/JWXPsdg09JGNt1E/t/7yRp8zml7s1JpL
 dNsT07i0=; b=l4ek2n98KvwRy1A3BfKCbpoIuRMQ0ZayIbq81LVAUPwAr0MegJW
 TFH2EcLlPSnEMPlP2HRVPD7w+h6P0vBlcAM/z9FzsXYtd9majPOdJVNgxKnCWlDh
 iu+Zrl5/UVL85jX3sczJ34YxLFzVAZmt4+r7/zQiQC9zktk9+o8NJomoAbLWzGRy
 O6VcqIrrOTJXKD1R0wweQw/S4nTQBcHh0ejQ3kZbtDG+Wh0QVVYyZPB2x2PobGut
 s58+3nDJ3ikrMxmAyvZ5SdvhI7X/gfE8af4ikVm9qahUq0qbS5YtVUIghTwtmu5S
 lmwU4Jnd0eG5igv5DNVcj7EuWRyIBpvOPLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668453641; x=1668540041; bh=GH/JWXPsdg09J
 GNt1E/t/7yRp8zml7s1JpLdNsT07i0=; b=aNJtZykfI6WDSLw5FBqPaNH98ubt1
 rixjr8H23RxZCqUmrGIqsBbs7MazMfVCno2aJBtHpKbTK8QWh9qtQdogTyZ2s1yw
 Gqo+mh7IC9gf1vzPysozfO5J6n5AB+zGgPekKxcJtZl264l9kSfozpo1NpNm7BbB
 c6yL9bqHtp47UViJ8Z+n1VeHijQx6pyjCnJMafWd4/Emx/LOZoOUHF2kbEbVC++e
 mSOqcBXTF0QQEImPD+CYKa9tNXaz8VGrlTgWxFqCjPU1Qjpix0DTEMiBc9KquA8B
 zhMrgVSD+AK9kOzjkW3MbZQwjrbNmIhnLv2sf5NjTDCFpQfHGV5iGL9yA==
X-ME-Sender: <xms:CZVyYwZ6zYu3Ht7dBCNg9wqW2mPU8TDlf4R1tRd77SHftWEuSowGcg>
 <xme:CZVyY7Z0nBuk5ZNUpC75H_Ne4Tc0RO9aspYO7ihZCGkyrr5rpQsKcKRd7iVeaeALz
 GaOedPZE1b8WA>
X-ME-Received: <xmr:CZVyY6-NobWIjbCiOn-S0VX34xKK2I0DWQi1HzflvquXOM0jn9RnvEBQ7-B-MY_1cqS9tb3OT5SFCMjAW6W7xrakfyjEWH4g5vdMJF4y6S1DWfdbU00>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfdu
 leetleelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
 nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:CZVyY6r5Sx_xhFJ8jWwXl59tvAhMZ67BPWuY2Ce7rOyUJHY9YP4Vxw>
 <xmx:CZVyY7rNo2anSImkl6e8qHuxF-q63oVbVCx4bRWmU-Tt7ehoCfSOPg>
 <xmx:CZVyY4RQ8lIjrIhrgxAiwo8-tqDdDDBkapr0aXLJNZssDRq2_eI3gA>
 <xmx:CZVyY6XC-rWdTgtThSco2mExldV2Sk75OqN5-X4vjADy4Er7n8MJaA>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 14:20:40 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH 1/2] hw/xen/xen_pt: Call default handler only if no custom one
 is set
Date: Mon, 14 Nov 2022 20:20:10 +0100
Message-Id: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=64.147.123.25;
 envelope-from=marmarek@invisiblethingslab.com;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Call pci_default_write_config() in xen_pt_pci_write_config() only for
registers that do not have custom handler, and do that only after
resolving them. This is important for two reasons:
1. XenPTRegInfo has ro_mask which needs to be enforced - Xen-specific
   hooks do that on their own (especially xen_pt_*_reg_write()).
2. Not setting value early allows the hooks to see the old value too.

If it would be only about the first point, setting PCIDevice.wmask would
probably be sufficient, but given the second point, restructure those
writes.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 hw/xen/xen_pt.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 0ec7e52183..269bd26109 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -255,6 +255,7 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
     uint32_t find_addr = addr;
     XenPTRegInfo *reg = NULL;
     bool wp_flag = false;
+    uint32_t emul_mask = 0, write_val;
 
     if (xen_pt_pci_config_access_check(d, addr, len)) {
         return;
@@ -310,7 +311,6 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
     }
 
     memory_region_transaction_begin();
-    pci_default_write_config(d, addr, val, len);
 
     /* adjust the read and write value to appropriate CFC-CFF window */
     read_val <<= (addr & 3) << 3;
@@ -370,6 +370,8 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
                 return;
             }
 
+            emul_mask |= ( (1 << (reg->size * 8) ) - 1 ) << ((find_addr & 3) * 8);
+
             /* calculate next address to find */
             emul_len -= reg->size;
             if (emul_len > 0) {
@@ -396,6 +398,24 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
     /* need to shift back before passing them to xen_host_pci_set_block. */
     val >>= (addr & 3) << 3;
 
+    /* store emulated registers that didn't have specific hooks */
+    write_val = val;
+    for (index = 0; emul_mask; index += emul_len) {
+        emul_len = 0;
+        while (emul_mask & 0xff) {
+            emul_len++;
+            emul_mask >>= 8;
+        }
+        if (emul_len) {
+            uint32_t mask = ((1 << (emul_len * 8)) - 1);
+            pci_default_write_config(d, addr, write_val & mask, emul_len);
+            write_val >>= emul_len * 8;
+        } else {
+            emul_mask >>= 8;
+            write_val >>= 8;
+        }
+    }
+
     memory_region_transaction_commit();
 
 out:
-- 
2.37.3


