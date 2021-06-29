Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E283B7873
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:16:34 +0200 (CEST)
Received: from localhost ([::1]:59236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJDl-00029J-7v
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyInn-0002KJ-NC; Tue, 29 Jun 2021 14:49:43 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:39317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyInc-0005qq-7u; Tue, 29 Jun 2021 14:49:43 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id E7D0E2B00AC0;
 Tue, 29 Jun 2021 14:49:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 29 Jun 2021 14:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=wF4h7jglbyMs3
 eA1vmZ/L4EsKB0KZtq2c/rbA6JCSjE=; b=dR1vbQLXrUMDXWQWDjhAPmkaHp60a
 YUHPIcbaMN+8ZAZsNQOOTalQjuJzwWk/CjFtq/Coc6C2fMDqmoAQG15gf1OsEiN3
 dMGicYr954yg93xgE1d1RlFADw0bVsJz/ufFmbPPGJJ8Ds66jPtP5bVV1QuFh8vA
 n9r5GH0vX9MS4qyFImGFu2MliVmiJT/cp+13gG2X6OzyIS+UrpUk3fmqIE7EmGh8
 9Wm/x/nwtuBGIbtais8VAHTjci7KZ0CcrqC/YFt+siPIOeMhO6RkxvXi5VKA2sHZ
 x+c5XzzzChqhVfHDeeYWXB+d6CuamNK6LCTfuhkejC3QCGMgiUAwgXYpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=wF4h7jglbyMs3eA1vmZ/L4EsKB0KZtq2c/rbA6JCSjE=; b=Rkw1UAnd
 NJmT3wQjQbCoKAWAAAUgsq2W/s6tjIIE+ei2fIAjolRsqFrVMAtOUDlcEJBKSBOC
 ZYbCRVkIXDpR7XeQ+oHXo63eIHW56wbLjdkzNwcBdT8GJuVhkKzExtkAeiskylXf
 rlcHhbkOqDoH615EuqAQpb1Tx/MHkZaK6yqmfj9BsVB2m4a6CQRzWWv1OAyz/EKL
 QS7KdDQGEb4IRMlbgfkCousNrz06+RRN4AvkQaM6nHG1o55gaK5Ise8DzQjE3KzY
 Ft3bsnZ4vbpx18bmFS4r/fsiFE6W/QTJGIuCT4Sw8NXm0MqmyrteIurg7aK7cYKd
 dGEOkupAR+IyEg==
X-ME-Sender: <xms:JWvbYL0O8f0s4EdAnl3t4QzEiwpq8JSlBkbvzQyOevAu6e1PXwz5Wg>
 <xme:JWvbYKEwE3fxj1_-ssw0eBQB0yuJ5VSkqBC9B-4_7UeIdUWteTTXwn1OQSxJhpsWS
 e4iI1Y5T4k3RGfctSQ>
X-ME-Received: <xmr:JWvbYL6yqFokY4VWHleTrh9kGuPyhAZXxiXpqafoWAo67ckBMX95kIrU623B-AXik_rL51muB_PF5fddU4sEwJUB3jFnGd47ORzT3vF5CA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:JWvbYA07dvoJDcyxbzGwZW9PFw-JFpmzEqKGC8I6XbNpHG-7QWQ49w>
 <xmx:JWvbYOGWpM_ySZDGlZbNkhf6MSlo6V-UxaEs0aOYNpdL9pcGuIurjw>
 <xmx:JWvbYB8A9f51T4aDLZXvupWf-xl6sD-XEdgf9w1RV7NUT8703ak4pQ>
 <xmx:JWvbYG-jUlDbMvR_lZvTn7t8XSDAy-qcjui_tWsLVuchQeQy60kHPYg1W_M>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:49:07 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 23/23] hw/nvme: add 'zoned.zasl' to documentation
Date: Tue, 29 Jun 2021 20:47:43 +0200
Message-Id: <20210629184743.230173-24-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
References: <20210629184743.230173-1-its@irrelevant.dk>
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keith Busch <kbusch@kernel.org>

Signed-off-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/system/nvme.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
index 33a15c7dbc78..bff72d1c24d0 100644
--- a/docs/system/nvme.rst
+++ b/docs/system/nvme.rst
@@ -202,6 +202,12 @@ The namespace may be configured with additional parameters
   allows all zones to be open. If ``zoned.max_active`` is specified, this value
   must be less than or equal to that.
 
+``zoned.zasl=UINT8`` (default: ``0``)
+  Set the maximum data transfer size for the Zone Append command. Like
+  ``mdts``, the value is specified as a power of two (2^n) and is in units of
+  the minimum memory page size (CAP.MPSMIN). The default value (``0``)
+  has this property inherit the ``mdts`` value.
+
 Metadata
 --------
 
-- 
2.32.0


