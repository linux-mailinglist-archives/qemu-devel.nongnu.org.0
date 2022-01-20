Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE86494A5D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 10:09:17 +0100 (CET)
Received: from localhost ([::1]:59504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nATRU-0007NJ-3W
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 04:09:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nASOS-0006u0-Uc; Thu, 20 Jan 2022 03:02:05 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:50551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nASOQ-0005yi-4j; Thu, 20 Jan 2022 03:02:04 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 072775C01A2;
 Thu, 20 Jan 2022 03:01:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 20 Jan 2022 03:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=jmxXWMkosC9fPeNhqid7040e3vc4JvyB6UTFYo
 1/DS4=; b=NI4ybHl8h5NYXuehypRCYWV+kIsGNhowcYsPW7pW3LcSsY8F7aFsRx
 YdcsveI5bpYn6EnWdHL5G8qaJJBw/7e2SFoX9W/NecU1/NR1o9T/ECexEewIzBjn
 sIw62UK4Jta4CKS/aRLLuPrhOZhc1uVplGSopyNipR7eEGnkV6jg2kU0zj3Cv08Q
 5Z8U5Jvz26ZHH/eI9iKzCiU9UWEZjPuU1qBESP72itJInE4ViSj1HX1NPk8sxtPA
 1Yj6Vo5HZ4cfqPoCfkBHBwBbM4wLml/mtpzdQcraLAtJ4zhZ2hhjxhvlCtiH5qks
 ss7lqQBfeImS/3CZwjJrGgCAnw2AAIlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=jmxXWMkosC9fPeNhqid7040e3vc4J
 vyB6UTFYo1/DS4=; b=KVBXMpv+AiPKvFk/kL4j/T1+hvF5gbgDKu/JOFNcSTAZ8
 //aVHroHzOcNC9bXVEe+PvpefBHPfpC6BhFJ2bFXhYSfJp1nqcwxLeIRqy86Bgoz
 ZPvPVa6wvT/GfzjRgs40yF1TpitAEP79Th+MwgPhC1XKXiyyxZtt68aBVqp7lOo0
 xCeHPd/MGn46lNePxw7F9ert8A8jCpjh54757Q9Afv1UXB3NBnG5eDbohMgWQS9/
 v1DUdPfhCIAXGEmu/DWVjQk7V2O8+7BhIEPUMD+dvR50vXCTZzVi8CgF4wNrZ9mZ
 aS9j6py9sSVBEmlIpVsTktpJiZtk71AYopP6JVuAw==
X-ME-Sender: <xms:9hbpYV555h3qo8etT6oUco5F4w7doaMI3NwustTzubztfwGggjQm1g>
 <xme:9hbpYS49ynpIjyWjJNCbbc3RhAdC8RAmZC7UL2Dj2tvQau3N_odp2YxZ7MBprL7t-
 7bfol7vyw2ryObxZCs>
X-ME-Received: <xmr:9hbpYce42zy5UEMUU14mcgirrP5Kb75jUERDelTbkJa1HLZ8WdrsZxku79rAscOc6MDf7LT6OQAH0WJaBcD4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejgdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpeefveelvdeikeduueffteeggeefhedvffffjeeuueeludehvdegjeevjefhtdetheen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
 hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:9hbpYeLi539ULIDPvD8dkI5aZkHW60SbKQxxpFG9FdfDx2YS1gCECQ>
 <xmx:9hbpYZJqLiz3XfhGRbAEDJqbfwlwc1EV-rcl1nC8KUcRj76XmAKZPg>
 <xmx:9hbpYXwoAd9ovaBZ8SlfAcE9Kk0is2z6nK0ZX5JumjNSvuXHO-TsfQ>
 <xmx:9xbpYXh-we6bw3fcyNIXyl15zIOLfVasvMV0aFaQ7cZGiHxmsM42xw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 03:01:57 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/nvme: fix CVE-2021-3929
Date: Thu, 20 Jan 2022 09:01:55 +0100
Message-Id: <20220120080155.227246-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

This fixes CVE-2021-3929 "locally" by denying DMA to the iomem of the
device itself. This still allows DMA to MMIO regions of other devices
(e.g. doing P2P DMA to the controller memory buffer of another NVMe
device).

Fixes: CVE-2021-3929
Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 5f573c417b3d..9a79f6728867 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -357,6 +357,16 @@ static inline void *nvme_addr_to_pmr(NvmeCtrl *n, hwaddr addr)
     return memory_region_get_ram_ptr(&n->pmr.dev->mr) + (addr - n->pmr.cba);
 }
 
+static inline bool nvme_addr_is_iomem(NvmeCtrl *n, hwaddr addr)
+{
+    hwaddr hi, lo;
+
+    lo = n->bar0.addr;
+    hi = lo + int128_get64(n->bar0.size);
+
+    return addr >= lo && addr < hi;
+}
+
 static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
 {
     hwaddr hi = addr + size - 1;
@@ -614,6 +624,10 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, NvmeSg *sg, hwaddr addr, size_t len)
 
     trace_pci_nvme_map_addr(addr, len);
 
+    if (nvme_addr_is_iomem(n, addr)) {
+        return NVME_DATA_TRAS_ERROR;
+    }
+
     if (nvme_addr_is_cmb(n, addr)) {
         cmb = true;
     } else if (nvme_addr_is_pmr(n, addr)) {
-- 
2.34.1


