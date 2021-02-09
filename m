Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A888B314A6D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:37:43 +0100 (CET)
Received: from localhost ([::1]:49856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OWk-0007kp-L0
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NW2-0005YI-Vr; Tue, 09 Feb 2021 02:32:55 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:38045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVt-0005p7-SJ; Tue, 09 Feb 2021 02:32:54 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id DA7A0C5E;
 Tue,  9 Feb 2021 02:32:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=bhsi3zYelLifs
 JpMQZeO7ts7xRKlkR7EGK4bKUDiTH0=; b=QnJJK4w4UgObl6aFu13hcrkdmkIL+
 4XwHvcc7hEi9DJ6hpPkEUVfoNJWU/GTG70u1gcK1H4+G7Qg4lMM9VDz4mjXb5wxx
 DeKb1n8IGkZ1vld//nhimp6i3nGjOVha9rc0bgauYb+/aT+LOwv3bNJn5ThQpKzl
 /1JyUG+UyCFOMObbr3SKboLP/iugHe5N3yKpEqyWAitOHJhPOLvoGrp+zc7wb8mZ
 4ZLPnyGF5wYWH+fnL7HeW7Bkrs3sWITmaMTvofOIwlh7Z5SJh+diL4u60SV/PPd4
 3T4Z635/FG/PfYuwDnQ0n5LF276rxKYOThxry0BL2iODuEGjVQTku55pA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=bhsi3zYelLifsJpMQZeO7ts7xRKlkR7EGK4bKUDiTH0=; b=fCIDoxW/
 lvoka/YdYo6j/zQXU8gb2InjFOcAXsQSe6AYwGmjg71OS6yRgJaKr7QN7+JBk22Y
 sFYt3kHYd+ukmRQobOj8bYjKYpsYwHONQXcEwQWEVrm0Uc1Q2xg23vkJfE+r3Nky
 ObvWbaxtIN50x618gwwwX8rZJ3UuQOdYdaSpYo3rAMpgbA7NCKg5AIz77nnA98pj
 tp7eBPx6n3VylF+wH5bJ3feGAqAmFzdadCscAZI4mDvnwpddv/qTzl1mek5nGm4O
 DBIdIPf0ym3PsfqQUs7dP2ilkOeHWvQKOmxDnwuOgsbUJWMML2lBTmzWFgkqj8j4
 EfJDKLW6/PE6Jw==
X-ME-Sender: <xms:fDoiYDOGrFi2XQhzX0iWTaAsQKb8YNhzpp4lAGaDF3sXXH7zF_nR3w>
 <xme:fDoiYN8RAfswUv6IhDTpJuuVsHq6i4CKblA-9Ab05jV4o_2qCxiEPX5BgvVDTQjI8
 zKSwBBaHrYGTNuU5uU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeeine
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:fDoiYCROd6hRMjvqwXt4pFjDu5mWLgA6MC5Yu8zQvH1m7yznFLTBcA>
 <xmx:fDoiYHsJFHFEOImTNbk7AeMJzQl2nRiR3y6d8eLZXIWv3zbFDurbUA>
 <xmx:fDoiYLdPtMmUuVmc1pOXO3c1xDqGsuFY8xflIKuGD3IhuQqLq5suPA>
 <xmx:fDoiYKwH5tRkiB_gAQ7Wc_xgVMfQNcnSFSBL7oQyU99ZUdDUgz5mQVd90oM>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 114C3108005B;
 Tue,  9 Feb 2021 02:32:10 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 32/56] hw/block/nvme: split setup and register for namespace
Date: Tue,  9 Feb 2021 08:30:37 +0100
Message-Id: <20210209073101.548811-33-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

In NVMe, namespace is being attached to process I/O.  We register NVMe
namespace to a controller via nvme_register_namespace() during
nvme_ns_setup().  This is main reason of receiving NvmeCtrl object
instance to this function to map the namespace to a controller.

To make namespace instance more independent, it should be split into two
parts: setup and register.  This patch split them into two differnt
parts, and finally nvme_ns_setup() does not have nothing to do with
NvmeCtrl instance at all.

This patch is a former patch to introduce NVMe subsystem scheme to the
existing design especially for multi-path.  In that case, it should be
split into two to make namespace independent from a controller.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 17e876e6bc44..ce79ad4a5319 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -321,10 +321,6 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
         nvme_ns_init_zoned(ns, 0);
     }
 
-    if (nvme_register_namespace(n, ns, errp)) {
-        return -1;
-    }
-
     return 0;
 }
 
@@ -362,6 +358,13 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
                                 "could not setup namespace: ");
         return;
     }
+
+    if (nvme_register_namespace(n, ns, errp)) {
+        error_propagate_prepend(errp, local_err,
+                                "could not register namespace: ");
+        return;
+    }
+
 }
 
 static Property nvme_ns_props[] = {
-- 
2.30.0


