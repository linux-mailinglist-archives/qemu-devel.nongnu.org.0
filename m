Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13C553D296
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 22:03:21 +0200 (CEST)
Received: from localhost ([::1]:45422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxDVw-0006kG-QF
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 16:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNH-0005xs-OJ; Fri, 03 Jun 2022 15:54:25 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:52501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNG-000895-5t; Fri, 03 Jun 2022 15:54:23 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 58E3A3200958;
 Fri,  3 Jun 2022 15:54:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 03 Jun 2022 15:54:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654286058; x=
 1654372458; bh=wW5gFL/gfJnFS2/hmfyGz4hsdcQqlSYQJ7WqS1ZhXxU=; b=a
 iqLFS0xFi6PuJtz8wgOd1Aac8AIlp9Q0xtylN+te8IlFxnOHutQhS4O4D7SdgLsa
 zvo6NywFV4p/scDrLqhLF5gRw3CcVHQWIXMDTnkKvdGv6uo3v9lpPYsqaAOlCdWC
 ppGuc6s8YKS5Ld8oFUYhTMeYjmREb/6CIkavkfBLRfO6yXSCUZ7ov8/fhvo/j2wv
 ff+hz/RAZozl+CMsv+m9pytFD5iIu645hQS/7opMBQ4erCk2xgU82zcfU0zVMXvz
 iaFuGliHMThwas1AeOl9Tir5KfzJFwjgkDEpD82xKCbko33VZUBakHbVFn8L71oB
 V8ws0z50Vu8zAHCTMxjjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654286058; x=1654372458; bh=wW5gFL/gfJnFS
 2/hmfyGz4hsdcQqlSYQJ7WqS1ZhXxU=; b=L9SVCH9mIZz9th7cm5qQsZUdSRzLO
 1NLiGoURZAtewodSJiihBKgn8Ey1MfaNUERevcJ5TmLsvr0cPeuBRB+FQ6SUJ4xF
 rG2dbdho9zSj2aBaNMOpmITi/s2RIzkmAH9ktL1n5L4cDScDPUsZxpe9N9WI4Oj0
 favddstrKtbT2YNFRadvg3508FHkdHltff2z1LkePul8gyfGJWocMWueuUBaBm6n
 P8OpxNXvxxKoC6KCv7mep8xkKVJ5EhZyX3p9bWLhZEZNMC7YfJCdzFOcSgkW6aF2
 lrZAqmVylD8q6xr3PUIm0ylxWioJQy+zRs22FT+ybrAgd8bjBS3xL89RA==
X-ME-Sender: <xms:6maaYjP7lrzXznZmanbGg8oF0qybrUYGrVizvx-kKyrzobQgr4rkLA>
 <xme:6maaYt_i8gZGs9ojNnWP7FTZ6fD0uvk639ftwNtzDlmGAaxopM4q8eY5zNh_UoEiw
 sAst0r_0-6JBc1JAhw>
X-ME-Received: <xmr:6maaYiRLM6xhLvozQQfNFt0gILE_WHXLLI1spQGr8Q--Usbu66Cx19XzbYQ-6W_hLoAMTy82JRJQVqaY9Ek7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddugedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:6maaYnvCbCmTmYeCcG4ocMj3ZBbkZoVuJ0reaX4b2rwoy5N9vUZTKg>
 <xmx:6maaYrcUsYkWhIWoCNZYhsp_WIJSB5ayKG5DfqJgmnFU-ymTwKChnQ>
 <xmx:6maaYj3YnASIwMkxJQsjdOCJ8IpmdbBXXWgt1fYavv4UMbUuDsjclw>
 <xmx:6maaYm0tbPD5V7rwN7Z-SQr41nt1IrZurGYkxCSfMg2VNZlo1TOKTg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 15:54:16 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Yanan Wang <wangyanan55@huawei.com>, Hanna Reitz <hreitz@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PULL 04/11] hw/nvme: fix smart aen
Date: Fri,  3 Jun 2022 21:53:47 +0200
Message-Id: <20220603195354.705516-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603195354.705516-1-its@irrelevant.dk>
References: <20220603195354.705516-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Pass the right constant to nvme_smart_event(). The NVME_AER* values hold
the bit position in the SMART byte, not the shifted value that we expect
it to be in nvme_smart_event().

Fixes: c62720f137df ("hw/block/nvme: trigger async event during injecting smart warning")
Acked-by: zhenwei pi <pizhenwei@bytedance.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 08574c4dcbc8..a2f6069f7fe1 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5325,7 +5325,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
 
         if ((n->temperature >= n->features.temp_thresh_hi) ||
             (n->temperature <= n->features.temp_thresh_low)) {
-            nvme_smart_event(n, NVME_AER_INFO_SMART_TEMP_THRESH);
+            nvme_smart_event(n, NVME_SMART_TEMPERATURE);
         }
 
         break;
-- 
2.36.1


