Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E627364B25
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:29:43 +0200 (CEST)
Received: from localhost ([::1]:60912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaWc-0002dw-E5
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZJ-0000Np-G8; Mon, 19 Apr 2021 15:28:26 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:59609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZ9-0005Hs-IX; Mon, 19 Apr 2021 15:28:24 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A158621D7;
 Mon, 19 Apr 2021 15:28:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 19 Apr 2021 15:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=k9kgx5G/FyrHr
 BTaHtoMhGCRq5YLR5FPNBFk1KFWtVE=; b=mV4gVWxFM4mzabImJR2Q/azwm69Zg
 3v1XY5G9ioy+Q65VW//fHM5IJTk4vCYFqyuzDofcCJx8/1hVMxKcWdUPYECwFBjJ
 LCKw9VHimf4wseoOV9gUfk73VsKlbug5faZ6vTmg/ybFJPZCKS2PoJ/SPxQSB4f0
 iL0BxNefU8FtaR3tkXgdeH/6ba0kC0bckYvhx+twxalebKELhE8xlFln8+xTpiTk
 uL1/JljAXRpRq2pvx4bse6+ztQ8ysu2uWGcexOcHHeMycQAJRMsE5381PAwWUgN4
 lDNUATPJEfpGPMPr3iX4w1l5oUOkX6zS9P3iik44GGIAQJM1ZeG/r+5IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=k9kgx5G/FyrHrBTaHtoMhGCRq5YLR5FPNBFk1KFWtVE=; b=MGPiw/dT
 SRrScTVCRo5E2Xf4nzZplWSUm9XcujGqW1MiwoTzA2TjlPUG8siJbuK0HI83MBub
 2+fIxEWLWdHkhv7NQKNk1onGT5yB0BVvUOnzSKWcSBD+mGH1GPdr4EmikkLanpNz
 ami4VNtWG40n106RpThYlqIQo8Gt+poe0wz4oae2UcOLblAKxqfNze7lBHFoSK39
 p1R4n6MJqRazSm8IbLIRl/NPi3GGeQsXQPV/bJOytKNPH7ZY8ZC68H9fP/pH0oVz
 7GRTPb6uSH4tKce50UVwaUo3FE7jd8c3yo4QibIkgO0atAtnoKBU8ZCZ7Wl/b4xf
 /9+5Y+UNU/kESw==
X-ME-Sender: <xms:zNl9YLiMsOB6jjTFzkjJP3x78iwMoapq6FNHvpbXuAhhqCjsXn6O2Q>
 <xme:zNl9YIBWL9swlGI6ft_-Rx4Pj_RJcaSHO2ChXufad3rOF21sfgpga4bfYLGCcqoqY
 tA2icMAiZnTZIktQTk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:zNl9YLEsP5BOo7G8xYwsTEX3sum7vsGMaYG8NJFaxyFWyyUQz01yrw>
 <xmx:zNl9YIR5HCPy6DFbgMWfLFSiCGUXGaUGvBQFMXYBGi0oEtSZwf9xlw>
 <xmx:zNl9YIwZQEK4W1d7ZH5ROu2qfbMUWfaxdnTk3Vijb9gNK2UMk8deqA>
 <xmx:zNl9YCvNIUfG-UE_wSjidbiwAL4OB1d_k6lgP1LYwxvoBC4RJTE4sA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3B85E108005C;
 Mon, 19 Apr 2021 15:28:11 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/14] hw/block/nvme: remove non-shared defines from header
 file
Date: Mon, 19 Apr 2021 21:27:53 +0200
Message-Id: <20210419192801.62255-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192801.62255-1-its@irrelevant.dk>
References: <20210419192801.62255-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Remove non-shared defines from the shared header.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h    | 2 --
 hw/block/nvme-ns.c | 1 +
 hw/block/nvme.c    | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index d9374d3e33e0..2c4e7b90fa54 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -24,8 +24,6 @@
 
 #include "block/nvme.h"
 
-#define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
-#define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
 #define NVME_MAX_CONTROLLERS 32
 #define NVME_MAX_NAMESPACES  256
 
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index aae06987e49a..35c146633223 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -23,6 +23,7 @@
 #include "trace.h"
 
 #define MIN_DISCARD_GRANULARITY (4 * KiB)
+#define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
 
 void nvme_ns_init_format(NvmeNamespace *ns)
 {
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f7c5e83e6800..2c0af579e7a8 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -159,6 +159,7 @@
 #define NVME_TEMPERATURE_WARNING 0x157
 #define NVME_TEMPERATURE_CRITICAL 0x175
 #define NVME_NUM_FW_SLOTS 1
+#define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
 
 #define NVME_GUEST_ERR(trace, fmt, ...) \
     do { \
-- 
2.31.1


