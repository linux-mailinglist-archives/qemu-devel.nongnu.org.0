Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7580E69AB08
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 13:09:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSzWt-0005EN-Di; Fri, 17 Feb 2023 07:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pSzWr-0005Cg-Hh; Fri, 17 Feb 2023 07:07:53 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pSzWp-0003QK-WD; Fri, 17 Feb 2023 07:07:53 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 23AA75C0144;
 Fri, 17 Feb 2023 07:07:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 17 Feb 2023 07:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defmacro.it; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1676635671; x=1676722071; bh=iQ
 mmOMBy+KS4Zz3L8LjzaW5Hwx6eOgsGRv9zmGVknD0=; b=fLjNwXU1frB19pxNVH
 Eh94s++wV9jWMjIJ0rRM9zHuwYAONZLeYEv0Wd5zoWlBy1CzUJ0+YBgqskSV6hSC
 pYjanOTpaaZkHGiaAJH91ZbJJzzXeQvDtDf7OQqcRax3upvkoqgajd7EyoSZs1PJ
 7+1bny8YHVZVhAObbKlI5iVjJU5MQCjRe/e04YunQeaJArcTW4zj3NQ7OWVO0H6Q
 8qyo6EAYdxqYQQYbG/Yl42EwHQOY4jpd6531iO71zWH5qave4C7XV/W2yxsepbEg
 0U0VM1uuYNRfvRCQ3PTZmcLBEXPjiNZ8jpXds1Wf/aKwTpTqeO+XdLP57eXXQ5eI
 fLxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1676635671; x=1676722071; bh=iQmmOMBy+KS4Z
 z3L8LjzaW5Hwx6eOgsGRv9zmGVknD0=; b=Y6/VFFnHaKtTbCxTbjNrVvGMVyN71
 0uANNp1O6Sht/I/ahzO1dWC2j2y5aKpkeeD7k5wpij1VMLukzgw+Acg8j5+770Tc
 Za2YJmP9LOn0ZagVakzKAcQvAu8sRDzRvY697P0nMCWUUDLrst6hp8u8Oq0yCUTO
 zUcjqAPriUZLO+oOK4EdTAUoc2d9SGMb10dVNjwMn0bbH/ZrLhzZcgbpC5FBzdT9
 VTB8h4cYSbrke56lV0Uct3NrjWtDAxXIyEYbv2/qTbSBxedz8KIdX9x19JuDFwbc
 4P/rD7fVspt7NOOGR2QZAxovpPFhmidJr3qmtRImxPK7dzQsq+mF44GgA==
X-ME-Sender: <xms:Fm7vY2lT7xGSzzltHoYAUuf6NzYSjYd0DCze6uJdR5mO5ljf0OXtWg>
 <xme:Fm7vY931mOJzMAyrGbf-HkuJmvtJUgoNCRnrZ8fqcCwztYUc0YpITLnUyOytOAt3x
 1jDa-JMrLgPjsW2_9k>
X-ME-Received: <xmr:Fm7vY0qVIS10_WRfUrg6yNcZSpb3YhPeF5PStBb3Zt-_sVcMG6On4CGvU2HQ9WDwMyPvnDDHPAtQvIPt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeiledgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfgvshhp
 vghrucffvghvrghnthhivghruceojhifugesuggvfhhmrggtrhhordhitheqnecuggftrf
 grthhtvghrnhepvddvtefhtdeugfetfeeukedtfeeitddugfffleehkeelveektdevteef
 leduueevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epjhifugesuggvfhhmrggtrhhordhith
X-ME-Proxy: <xmx:F27vY6l4iHRFR32g3s3F3n-DkXx_opaJKY-R2nKX4iFDWLbP3RzNhg>
 <xmx:F27vY036kkAp7GRwY7uwHwbuLFy3evpJztlW-G1Vam7_zPVcDYgxsg>
 <xmx:F27vYxtdWJHqmjnYNdH3fqs5tbQqE_fR_74RI85KXvgIjeLuS9mmEg>
 <xmx:F27vY9u5kGZ8jGZTGZOHdFfKCOKKeYm_woHl1LijzBANqIsDAns6uA>
Feedback-ID: i0f41475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Feb 2023 07:07:49 -0500 (EST)
From: Jesper Devantier <jwd@defmacro.it>
To: qemu-devel@nongnu.org,
	jwd@defmacro.it
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Fam Zheng <fam@euphon.net>,
 Niklas Cassel <niklas.cassel@wdc.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v2 2/5] hw/nvme: store a pointer to the NvmeSubsystem in the
 NvmeNamespace
Date: Fri, 17 Feb 2023 13:07:40 +0100
Message-Id: <20230217120743.308632-3-jwd@defmacro.it>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217120743.308632-1-jwd@defmacro.it>
References: <20230217120743.308632-1-jwd@defmacro.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=jwd@defmacro.it;
 helo=out5-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Niklas Cassel <niklas.cassel@wdc.com>

Each NvmeNamespace can be used by serveral controllers,
but a NvmeNamespace can at most belong to a single NvmeSubsystem.
Store a pointer to the NvmeSubsystem, if the namespace was realized
with a NvmeSubsystem.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ns.c   | 1 +
 hw/nvme/nvme.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 62a1f97be0..8ebab4fbce 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -561,6 +561,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
         if (!qdev_set_parent_bus(dev, &subsys->bus.parent_bus, errp)) {
             return;
         }
+        ns->subsys = subsys;
     }
 
     if (nvme_ns_setup(ns, errp)) {
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 16da27a69b..5d221073ac 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -167,6 +167,7 @@ typedef struct NvmeNamespace {
     int32_t         nr_active_zones;
 
     NvmeNamespaceParams params;
+    NvmeSubsystem *subsys;
 
     struct {
         uint32_t err_rec;
-- 
2.39.1


