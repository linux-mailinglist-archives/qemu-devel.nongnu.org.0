Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9732318BCD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:17:38 +0100 (CET)
Received: from localhost ([::1]:56158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABqj-0002tw-O9
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lABSJ-0001ms-7q; Thu, 11 Feb 2021 07:52:23 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:39901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lABSH-0005K3-4H; Thu, 11 Feb 2021 07:52:22 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 61D035C0159;
 Thu, 11 Feb 2021 07:52:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 11 Feb 2021 07:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=jz9vKnW6xcIkE
 otVS8cqLKVxPFE29fdtqoOOvRMbArk=; b=mkxCoJ9lQuchD95wfddAfHbylIwcV
 BefsTn1PCwG5l6Nb2T4i5oRcYF9kV2fjs1W7HHmbMFBf66mGjt3Dn0UzXrs6ldfu
 BvqOsRknlUMSvLO8qL/uh6GiVdKU9hGqpGIP5hGMz6eX/QNXCSwLS1BIa2p9kBvi
 pWTkXXUs4DmyIC+vqNcmVuVSyQ7SapNdEhXiFJwUN23HqT24QKnlfKSwvSUuC8eX
 Y6Y6D4d48pxaCpSpO6m3YdHnQk2oVZp8YP76fNqIM0l2uyIuENovxxKiyLS7Owii
 UCafuHd3pGmkO+PQAiGwpcjF2v6i1efV4su5y03ILl4DEf5cmw7u3C7Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=jz9vKnW6xcIkEotVS8cqLKVxPFE29fdtqoOOvRMbArk=; b=d4qqg81F
 A0Ee/aODnkAizPPjSmOTOQmncg/Ij7Ow2GnuT6aQilz3reFit1KU/GZK1YqNSCuW
 RMNcdZS83I2RMm6ZbyaqA31Wja9Ek5hbhFr/mdqQtHvsLDaBDXj/XbJ6duWHKEe+
 dxgpuzqHu8elV1mmIJbsQYQqMb2tPPbqzreQWvY1fLLjrwSaUKdQS3I9YvFoZqWp
 f/zTU+0S+gB0BvScd/6Bq6G3Ifsambi70zeoVN1jGtU461cgUmb74Tfc+cATBYgZ
 N+SQU+e/rw1A7lncQRvsM6evB/zYVcpIX44hFIHCcwYml7cz5abU4hvT6LKhPOLy
 LrFgJTPUydeL6A==
X-ME-Sender: <xms:gyglYDvqWfmP9aFo6L-6rrf0DlD58FI0RUf-5SnVdNOsgNkC4GxkKA>
 <xme:gyglYEY-k3QZpPKUpOCcQqYTpH0Hd3XkqgtS83Mq_rwE8ISo-bhySI7Yx05SgPVQg
 iab-OU6ahn2Ay5KuLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheelgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:gyglYDpdUap-B5wEFhjB82edObJUkvyq5YauabWNLeSFjnLlwY0yuw>
 <xmx:gyglYJ-6iZ1F9yMRMTtQu1xFgHCw6heD_5FPsX_zoRd8K8nDL1rN_A>
 <xmx:gyglYC9Z4sxFUE77GrtkabRmOS9sE0kUWYMkDlMcSA2O-ndKDq6mCQ>
 <xmx:hCglYDiri5mwg1xLycnRF35ChfJC1wLDYuax-rkgOVXq-wCocSnp9A>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id A81D0108005B;
 Thu, 11 Feb 2021 07:52:18 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/2] hw/block/nvme: fix legacy namespace registration
Date: Thu, 11 Feb 2021 13:52:14 +0100
Message-Id: <20210211125215.985593-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210211125215.985593-1-its@irrelevant.dk>
References: <20210211125215.985593-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Keith Busch <kbusch@kernel.org>, Alexander Graf <agraf@csgraf.de>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Moving namespace registration to the nvme-ns realization function had
the unintended side-effect of breaking legacy namespace registration.
Fix this.

Fixes: 15d024d4aa9b ("hw/block/nvme: split setup and register for namespace")
Reported-by: Alexander Graf <agraf@csgraf.de>
Cc: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Alexander Graf <agraf@csgraf.de>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 5ce21b7100b3..d36e14fe13e2 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4507,6 +4507,12 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         if (nvme_ns_setup(ns, errp)) {
             return;
         }
+
+        if (nvme_register_namespace(n, ns, errp)) {
+            error_propagate_prepend(errp, local_err,
+                                    "could not register namespace: ");
+            return;
+        }
     }
 }
 
-- 
2.30.0


