Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C37454773
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 14:35:56 +0100 (CET)
Received: from localhost ([::1]:45934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnL6L-0001wZ-8v
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 08:35:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mnKuc-00063Z-Ds; Wed, 17 Nov 2021 08:23:44 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:46681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mnKuZ-0002xl-LO; Wed, 17 Nov 2021 08:23:41 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C44085C0180;
 Wed, 17 Nov 2021 08:23:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 17 Nov 2021 08:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm1; bh=nkiuqszGgJsMzEQCWWDaSIsiha
 CyQaKhHN2sGp/IaMw=; b=HCCRxe69V1oH7UVMSC9+AteAAUzseQ0ckcykP0R04b
 SufH3gPRcZdXWaGt6MO94T6s+w3Bfs2t9FCcqdV/AZTCjKZB8pI6RBFevz2sQAQ2
 JvG7Kjudl4DsABP8yO4QM2+OMys9VIFER+nEn1GFUAhvn1S/kMeDJj/Z12W51YoC
 TW3JgR6yXP5g8RFTn2DoH+8ta4728xH3SdEJRaZGmAQzvokXy0qu/2HLXO464kNF
 fqXi9f1N3KOPht0oAp5qiwDuvewPgM0+1PmKSQkUBhSNyLguwvzt2FF+rsahCZbu
 U+Dj7hIVF4In288sLXPXCib43yNVK4s2FGhHzwbPLgEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nkiuqs
 zGgJsMzEQCWWDaSIsihaCyQaKhHN2sGp/IaMw=; b=Zr1y1cv00rTxHaaVYm3+So
 NyAgklT6yluVnIrV/9Q0xo87wPVLv8CKMElCaXGlOBTIYIFvYr38Pp1tZHpzyJfH
 ox5GVHHwj+kn36Htb2hijEF6plRfh2Tjele8eXnNcgkc43nG7Fh5dvezY7+WCMKP
 9v1ufszVEjnlmogEv1lm7pzYlE/s5hMJnAQRyVZWubj04qlg/tzWj454MwRsMa3w
 jcwB169ehCsk+DOwklHbgINKq9yGvCQPPqri6Nq/oOKPWhXBY8i3F8w8QgSmsFr3
 CMQKkmXzsaqHod8copAMf8dp3dDhoLQoNFoH2s8MtOafLK+QUWya09eIsaaWL0Ow
 ==
X-ME-Sender: <xms:WQKVYYWp32Snyb4HHb_eVpHsusbQfAkDruGg0i0QxB_1vBdjRImJlQ>
 <xme:WQKVYcnHGsrZcpXR4t0BzVG5PlIcWUiXzIroxMbsXXJWM2cOzOPHbW7kGcjkSK8ZK
 LTBJXSPEESN6S955K8>
X-ME-Received: <xmr:WQKVYcb-kY9zDTafD8OoHXRi6AOXpCNwdCYMc4xOy1UByFp-IHkEku_3AQT_tW6wfrP-WZMe9uFE9MTK69WWYC0fWqjwj4a6Mq-B8Bfdkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpefhgfdvtdetgffffefgveetgfeifefhvdejhfdvtdegffdvudfgledtudelueelhfen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
 hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:WQKVYXXKeiPgBslYxLkigGNFB5_CSRUhYN1-xwagdhVuTF1gjadR9A>
 <xmx:WQKVYSkWTcOTbKyQoQ5mXrWaMxiKcxS4yFE44aXcnED10fS3DR4W3A>
 <xmx:WQKVYcfhbeZ6HOnUtwqb8OdwSi1JNlG76bbDR06ojqzLGGeLuSAmcQ>
 <xmx:WQKVYQZ6zrdFXl95k69G4_jF9vr8FS0vJtIr5IttdEBplyrWsVm96A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 08:23:36 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2] hw/nvme: fix buffer overrun in nvme_changed_nslist
 (CVE-2021-3947)
Date: Wed, 17 Nov 2021 14:23:35 +0100
Message-Id: <20211117132335.41850-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-stable@nongnu.org, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Fix missing offset verification.

Cc: qemu-stable@nongnu.org
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Fixes: f432fdfa121 ("support changed namespace asynchronous event")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---

Note: Since its so easy to mess this fix up, the log pages code could
probably use a refactor - there is a lot of duplicated code as well and
it's easy to miss a check like this. However, defer that for 7.0.

 hw/nvme/ctrl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 6a571d18cfae..5f573c417b3d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4168,6 +4168,11 @@ static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     int i = 0;
     uint32_t nsid;
 
+    if (off >= sizeof(nslist)) {
+        trace_pci_nvme_err_invalid_log_page_offset(off, sizeof(nslist));
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
     memset(nslist, 0x0, sizeof(nslist));
     trans_len = MIN(sizeof(nslist) - off, buf_len);
 
-- 
2.34.0


