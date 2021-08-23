Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CB43F4A9D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 14:26:10 +0200 (CEST)
Received: from localhost ([::1]:53702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI91l-0002JI-A3
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 08:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mI8wJ-00012C-1W; Mon, 23 Aug 2021 08:20:31 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:45137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mI8wH-00088v-17; Mon, 23 Aug 2021 08:20:30 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 95FA6320092A;
 Mon, 23 Aug 2021 08:20:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 23 Aug 2021 08:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=zFZmNn1Z30rcDFFjvl4htTn1Xj
 uML2c/vDEChT/PP/o=; b=MCWqRgQaKQ5Rhi79xt6DWknnXlUDpm5KP6bLr4uo3f
 0gKwD33pSs/qtg0JiUutHycPpob+V1rZv+FpGwcidR18lty9vQsH9C/AT5uSL2jx
 cM411viSsu7NBKvzZ/mrAoHGOCb1fgsiOUxKatyjIXxIWzLXt+yv7U8VyTIgeJwU
 vumpPywoXGs5J0prsjO7LkdAEHVuSYSAPCgiRO4bc39pLBlne54mMp18dCLCshqM
 GXF8uzkQDOlVUUUtcVDB0OAGABWcr0gVqHtvi7x6gkAKEmGtCps6nYIoWvB6fy81
 AHNfJaBINcL/kHODDXGmCS/Fn55Y9n6KS1BQua1rPcyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zFZmNn1Z30rcDFFjv
 l4htTn1XjuML2c/vDEChT/PP/o=; b=KAqsgNkRyNI+VoPK/noWExYxT1/dDMt0I
 KNa69B3Oa/lnkGc3CBYCuyVSLrMdwPhbRKswHR9x9+RAUSpo7PkGDGKEpNEc7be5
 5o8VApGrv8N37lVvrjy8O2NyVzppB3in+FRyKFJLheVxFO9srwXzRHuP6ApE+Kx8
 hnPLNt1Cl9AmNA0ftmbL10yovnNJwUpt73NEP7opI/bYyRsBV4jOE0vJGwVeS3PY
 lX4gFxRIIEEuixcAxKe9jfp7Urvx/kDiC0vjpe1Uufeus0zq9AglUlRz16TJI/+W
 YBDx5iYoySFZZQnyjotHcFXxBd0ahD8GaAlb+Wuw2OjYbIIzJjpOg==
X-ME-Sender: <xms:hZIjYUH0QzbDiWhfH6NmQYd9K-7fZtiLy0I4vUvQxmQnwtEJqxxuFg>
 <xme:hZIjYdWBQ_qbogJiV-hA2woUUMtdGXjAhj1Ue6TLTY0ju9UjhVz3wKGui5deM0CK9
 u2qBvi5jdnNbeuLeCU>
X-ME-Received: <xmr:hZIjYeL9H5O45yvYTTskSLdhSA56-Rok2OB2chkl98YWHR4Hb6p6lPWNPdgECLs8zJrOuth8k66WD1n_Q5WpL2fWQOcl9f4V8rO5_ZA4mQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpeefveelvdeikeduueffteeggeefhedvffffjeeuueeludehvdegjeevjefhtdetheen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
 hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:hZIjYWGR86_N2EIZTb5E1Rbx8tb_HEKaLq3APD2ZUzFaHstA3yLmbg>
 <xmx:hZIjYaXQAR-Zq-yrtOgNBvx2U9WMt2BQMXlnXTvnlMnF-E6boPyq3Q>
 <xmx:hZIjYZOwPMSBaW1ar8qnvrHXtmz4uIpNjWd_dpYgVO1DKNKob0fNQg>
 <xmx:h5IjYZR1ZbWC_oWc3pIt1MoxJV_gdoHfugyc6xLdyM8--go299kbRg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Aug 2021 08:20:20 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/nvme: fix validation of ASQ and ACQ
Date: Mon, 23 Aug 2021 14:20:18 +0200
Message-Id: <20210823122018.401370-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Address 0x0 is a valid address. Fix the admin submission and completion
queue address validation to not error out on this.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 8 --------
 hw/nvme/trace-events | 2 --
 2 files changed, 10 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 6baf9e0420d5..ff784851137e 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5623,14 +5623,6 @@ static int nvme_start_ctrl(NvmeCtrl *n)
         trace_pci_nvme_err_startfail_sq();
         return -1;
     }
-    if (unlikely(!asq)) {
-        trace_pci_nvme_err_startfail_nbarasq();
-        return -1;
-    }
-    if (unlikely(!acq)) {
-        trace_pci_nvme_err_startfail_nbaracq();
-        return -1;
-    }
     if (unlikely(asq & (page_size - 1))) {
         trace_pci_nvme_err_startfail_asq_misaligned(asq);
         return -1;
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index 430eeb395b24..ff6cafd520df 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -159,8 +159,6 @@ pci_nvme_err_invalid_setfeat(uint32_t dw10) "invalid set features, dw10=0x%"PRIx
 pci_nvme_err_invalid_log_page(uint16_t cid, uint16_t lid) "cid %"PRIu16" lid 0x%"PRIx16""
 pci_nvme_err_startfail_cq(void) "nvme_start_ctrl failed because there are non-admin completion queues"
 pci_nvme_err_startfail_sq(void) "nvme_start_ctrl failed because there are non-admin submission queues"
-pci_nvme_err_startfail_nbarasq(void) "nvme_start_ctrl failed because the admin submission queue address is null"
-pci_nvme_err_startfail_nbaracq(void) "nvme_start_ctrl failed because the admin completion queue address is null"
 pci_nvme_err_startfail_asq_misaligned(uint64_t addr) "nvme_start_ctrl failed because the admin submission queue address is misaligned: 0x%"PRIx64""
 pci_nvme_err_startfail_acq_misaligned(uint64_t addr) "nvme_start_ctrl failed because the admin completion queue address is misaligned: 0x%"PRIx64""
 pci_nvme_err_startfail_page_too_small(uint8_t log2ps, uint8_t maxlog2ps) "nvme_start_ctrl failed because the page size is too small: log2size=%u, min=%u"
-- 
2.32.0


