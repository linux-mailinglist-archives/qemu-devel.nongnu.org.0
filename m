Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E2B5144F9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 11:00:19 +0200 (CEST)
Received: from localhost ([::1]:46618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkMU3-00039P-Q9
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 05:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkM4R-0000OO-VW; Fri, 29 Apr 2022 04:33:48 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:59237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkM4Q-00059D-Bq; Fri, 29 Apr 2022 04:33:47 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 988E55C00DE;
 Fri, 29 Apr 2022 04:33:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 29 Apr 2022 04:33:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1651221225; x=
 1651307625; bh=njni0pQiwuI+g5bCW/VY6uyl1JMUaWLcuvk6fSnC+B8=; b=f
 LQKQVARPukDmMV8NGB3Eo0iG8Tyk0mIGyAdDqfbMn1z9ZkaQu/3t8qD2LSLYS3wC
 B3B4Q2QVZiL0V8wv4lOJnBPxsqlb1RnXMgzx9EgvlHSlEaHTivqNN4p6sAkz6m5M
 Q7V/n05CzKUSwOFkiGArMxgf9/kFiMbLj4Dr+b3nNTK5n+1vS0Ig9cZrsMeliJke
 HjWi5avJXuW+HfPbOjg9Anm04A4VZj0w3hYVqd1MNiTaHTl5OYptuekaKRikYhkB
 WBTWhgTIVdlhJbKHEECV8VH6UjU8qFKs2vHFNvpw77LBTt5d+32ziVHzGb+A3eE/
 oN1BkLS2q4g/7D/rqmtXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651221225; x=1651307625; bh=njni0pQiwuI+g5bCW/VY6uyl1JMUaWLcuvk
 6fSnC+B8=; b=MaebmFURnLUufprRWm5vtN/dqCPXnFytR4GMNrMssL7KeK8e2je
 4yUbiZZ+Bp0ynmh2b41XBwRSF2cpaAI1iXYmwFWnTTj9GC0hVT/E17bZq5TYyf8n
 UgepQhCc6AqyF57qn+w1q4uF3YbHn4hrqicFs5CXdkRWWKTSiSl0z7OTH5YRUI90
 sXbD2P8a0BxcwC7U016TwvvK4pUarMJblnFtv70DXaJLWvPasRqMh1ZIk7/Mr9PU
 QBhNBsad9nBsLUTfaAhfL2z8wLdUP+LIc9J30eBOM+pWsA3Kl/V7HDHE1El5mrrW
 L5bRZk+iDsPBiVYHBav1mZOoZkJ/sLF1QEQ==
X-ME-Sender: <xms:6aJrYuYQwm7VoV9ih3uiFsqXHXveIhO1juEqPDDVq6oS2Mmk3G8kcg>
 <xme:6aJrYhbyzdOraLaHnw6FjEQF12A2FykSkbvgjpSO3ZpXJmodABr71ZnCtPvawKHp7
 f0F9wfVc2GzjJJBc2c>
X-ME-Received: <xmr:6aJrYo8v2G2OljGKPsh8V46PZhW8wiwX5o5UaeJRtAC-i9OR3q5VtLVVjIeJpOY10-8sCB1LnQj5C7QbtPbn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:6aJrYgomfh6IfMBuLLMXO0AR6ogh8TaS78RnMjpw45L3KcnPTFG_ow>
 <xmx:6aJrYpryXkuUnjkkbCSWVV9AN6pZM9g-2gXAHR6pUlDDu5ODoRh-Ew>
 <xmx:6aJrYuRDQhiOhN_uSQAsu_7HhmHbwc19xVYhRl25Tzjxov3g4htqIA>
 <xmx:6aJrYmhfLx_f31zqgoQhW8rBuXYc3UxvtDNYg1CdgsV5KtS5KMn_Zw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Apr 2022 04:33:43 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] hw/nvme: do not auto-generate eui64
Date: Fri, 29 Apr 2022 10:33:33 +0200
Message-Id: <20220429083336.2201286-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429083336.2201286-1-its@irrelevant.dk>
References: <20220429083336.2201286-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 libvir-list@redhat.com, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Keith Busch <kbusch@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

We cannot provide auto-generated unique or persistent namespace
identifiers (EUI64, NGUID, UUID) easily. Since 6.1, namespaces have been
assigned a generated EUI64 of the form "52:54:00:<namespace counter>".
This is will be unique within a QEMU instance, but not globally.

Revert that this is assigned automatically and immediately deprecate the
compatibility parameter. Users can opt-in to this with the
`eui64-default=on` device parameter or set it explicitly with
`eui64=UINT64`.

Cc: libvir-list@redhat.com
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/about/deprecated.rst | 7 +++++++
 hw/core/machine.c         | 4 +++-
 hw/nvme/ns.c              | 2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 896e5a97abbd..c65faa5ab4ad 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -356,6 +356,13 @@ contains native support for this feature and thus use of the option
 ROM approach is obsolete. The native SeaBIOS support can be activated
 by using ``-machine graphics=off``.
 
+``-device nvme-ns,eui64-default=on|off`` (since 7.1)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+In QEMU versions 6.1, 6.2 and 7.0, the ``nvme-ns`` generates an EUI-64
+identifer that is not globally unique. If an EUI-64 identifer is required, the
+user must set it explicitly using the ``nvme-ns`` device parameter ``eui64``.
+
 
 Block device options
 ''''''''''''''''''''
diff --git a/hw/core/machine.c b/hw/core/machine.c
index cb9bbc844d24..1e2108d95f11 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_7_0[] = {};
+GlobalProperty hw_compat_7_0[] = {
+    { "nvme-ns", "eui64-default", "on"},
+};
 const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
 
 GlobalProperty hw_compat_6_2[] = {
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index af6504fad2d8..06a04131f192 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -641,7 +641,7 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_SIZE("zoned.zrwas", NvmeNamespace, params.zrwas, 0),
     DEFINE_PROP_SIZE("zoned.zrwafg", NvmeNamespace, params.zrwafg, -1),
     DEFINE_PROP_BOOL("eui64-default", NvmeNamespace, params.eui64_default,
-                     true),
+                     false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.35.1


