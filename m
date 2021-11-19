Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D80D456B93
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 09:23:39 +0100 (CET)
Received: from localhost ([::1]:36706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnzBK-0008GO-3E
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 03:23:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mnyyL-0006yy-EM; Fri, 19 Nov 2021 03:10:14 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:50345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mnyyG-00059l-7p; Fri, 19 Nov 2021 03:10:13 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0DCE758084F;
 Fri, 19 Nov 2021 03:10:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 19 Nov 2021 03:10:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 TwOfWohAdwfzhbzIUDcE5yVVFa/bT0grKQNbK8jSv34=; b=GGkEQkh/wbYmjfaM
 pYh2z70Jmd5s4wfFyKzAKc85D0udV1ThbRSRS2iswfVy/NPzxMVLPRiGPSlinzq1
 bpcTIfVAxP0b7h3eqhFBASnguC1gv4gsOjk4rLlQu/l1uI4fAtR1zuSUT8HEtiBN
 sp8SCKSWAfPTq06fe6I3APUxXkG8Qh8xecpLx5cClajAf9ecFFkEgvx7e/tw+zfa
 FmrXGQEdxOZ/v9KoR7NnG9dUlgy+y2VKHYFBAq+zuBXv+AJlSCFW2dMg/VUqXqDP
 b+cPikc9Zj1VgDUN93ZRwH9OEtecXGOz1AdgWCbYC2N9yA7CsVwS0UomdXveAQVV
 l/xryA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=TwOfWohAdwfzhbzIUDcE5yVVFa/bT0grKQNbK8jSv
 34=; b=gB/ThoayvMkuqinBUiBAHAd00HsKgrsOPScG4plAX8jAlKFHeuBbaME33
 xaJVacYL6EeDBow6a8utpcn27UZT5VjPVHGUORreAU95LXiqbWCWzDXVDigPw4ZE
 fCoYxaEFJgxvuQOeDjZp2n3hJUkCBjFveZVngJ2LxKMwWwsE5OV6ntzyYW02Ba9h
 SHE0R0qkiWS9CjiR4XLSW1xsJeA4fJAbvNaOvfYEK8ZgNfNHGA5V5Frc93lN55E4
 NhMjGP+imEpDvk1VFe+kQL2y0crQfZa0EZNv0OpZfA2asAc5ePFP0AyyHVIB7YC+
 b6X7O7+UTgXJkblQcZnW4UooFfcHw==
X-ME-Sender: <xms:3FuXYefyK3f3MUUQgC4OLHsQguASRxJ2cfKQgEbep5ULn8FYC9GBsw>
 <xme:3FuXYYMS3MB3xdEn5aNIMVXv3f5EfaL1bRKb76w649bz9qkUCqONjlat-h2NCjtRr
 NL_akMZodwy0TeKPqk>
X-ME-Received: <xmr:3FuXYfjreXixyM55s0qRkg9xJzTYKCYkKDivJ9hbqqjJ5YWrgAtB9IcGKfjDEVRuO0EIWSG46OyaRRhBXtIaxls8V-3CE5-NaBSMcobzwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteevuedugeevieehgeeileeufeetvddtkeetfeelgeehudfhjeeuledvhfff
 tdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:3FuXYb-0bbNLEyq2SNs-6DANGLwOvuynH3kq0a6nHfwqKdxXAw5IQw>
 <xmx:3FuXYatTcXQLkzYu2J1MxZisg7POzLl6qQAxIKMYM9HvltRECn5f7g>
 <xmx:3FuXYSHe9lGrRP_d0gybxnWlskgi64psJjbkjeP36TKDGS5opke3pg>
 <xmx:3VuXYUKD5Q0quVo9kyDeM0uzVdGyZ6e_B9sPhpYkANgizRQA39dieg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Nov 2021 03:10:03 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.2 3/3] hw/nvme: fix buffer overrun in nvme_changed_nslist
 (CVE-2021-3947)
Date: Fri, 19 Nov 2021 09:09:54 +0100
Message-Id: <20211119080954.211927-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211119080954.211927-1-its@irrelevant.dk>
References: <20211119080954.211927-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-stable@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Fix missing offset verification.

Cc: qemu-stable@nongnu.org
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Fixes: f432fdfa121 ("support changed namespace asynchronous event")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
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


