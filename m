Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4689418EBA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 07:44:10 +0200 (CEST)
Received: from localhost ([::1]:34946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUjQu-0004kG-C3
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 01:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj2Y-0003nL-Li; Mon, 27 Sep 2021 01:18:58 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:58103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj2X-0000Rq-6E; Mon, 27 Sep 2021 01:18:58 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id AC32A2B01216;
 Mon, 27 Sep 2021 01:18:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 27 Sep 2021 01:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=38nnrBM97XPIY
 VmHe5MfH0sS2KBUeMhYG5oVjJyrNKc=; b=ZaqDo+fislbzLHpRaZuubEQxX4744
 lHwTVS2LND+Vu6q31g8mQuLXAdbzDd91lc1xITWvhGW0w06PNJMu4VKYQACHWHgG
 +YiACGr3RxZ5yD+f4q9UYA7IavVpBUdQaKyxNBGJu+TGPREZF8i3+dF8NxP9Gdsi
 9PBUgiNdgZidAQ6kaIe0rUMx5nPBa2SCVB67SQx7MEEkioPBYMbc8a/CL9wwzCHB
 6Qd7BC6yw9alxAroDQzdC0ZsYoNR0ZbJH/Q7VwmbNiHxOiBE8HSQLx/AeOtf7xjm
 Oe1n1wdcTPe0KpVGPb4Jdr0fu517FdiW69B44NS1VwHRnjCUdohtfn1Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=38nnrBM97XPIYVmHe5MfH0sS2KBUeMhYG5oVjJyrNKc=; b=dCLbfQ7B
 halFzTcuQLcV2h+VVjf0sxAp2nZ9Fnz0MypmDpk7ll1Nczwc+CeZ2rsk7XMbnQNq
 h0sW01k0gOLlIwbP7wvu/XNdCM/VnDJubSGbv5HDE6kZUNn75dgrWpfSVhpzjo5m
 CoXq1ePJjNMpKNAkFFTA5zRA8KkMdGybZ1Z9qq8FqD1WIaXHiEwBrFLoFrVd5CDn
 0SCf1zyns7VCtRi4n0Of9YONWn7IAR/N+MVjtLLexrEbzlL4wd+0l4Efr/lKaA+Q
 IcA5jFCW+iPMqLNmt7oDXREu9E5ME70UkdYncX0I8VTjl6xWYPSQgObdROQIaTwq
 HWaGH8eTwV8Wng==
X-ME-Sender: <xms:PVRRYQ6z-w1DpdaOVSsDmOG1pVdnvBwjfRW07njOANx3NwM9Zqt0aA>
 <xme:PVRRYR7t55Oc4MUihIiNwWQ8sH1hMJzlvBnYI46C5GlIX_m5qAMcc4OCkB37HbsZB
 N14yz0pLdgTX-J_IlI>
X-ME-Received: <xmr:PVRRYfdB0euoXxdPqsiKCnWynka2Y8_ehu6xs7MKbEtjoP4D_Mg2w8plABOzl_GBF1VHnKXvHXlACdnGyxpX8G79IH9YWyuKGZgtmj4MOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejjedgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:PVRRYVJs9K_4sxtXoQBrALWVKbnqeMGLkKXxUpc2Kr5ygXPIL8-ZlA>
 <xmx:PVRRYUKPP7hVP8pcuChSbQQ_4Ewhr_31eU0Cs2XaULccxOs4JkEn2w>
 <xmx:PVRRYWzng1sOY4zJN7P47ZVdO1ShAGx0NawSWr_9KzQDlq37tzPPjA>
 <xmx:PVRRYR7Iy4aUC2vUazih9d-PT8bi5h9PgfMckzMvyydvqPCnPWkPh3yd6u0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 01:18:51 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 12/16] nvme: add structured type for nguid
Date: Mon, 27 Sep 2021 07:17:55 +0200
Message-Id: <20210927051759.447305-13-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927051759.447305-1-its@irrelevant.dk>
References: <20210927051759.447305-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.17; envelope-from=its@irrelevant.dk;
 helo=wnew3-smtp.messagingengine.com
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Hanna Reitz <hreitz@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add a structured type for NGUID.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 2bcabe561589..f41464ee19bd 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1269,6 +1269,11 @@ typedef struct QEMU_PACKED NvmeLBAFE {
 
 #define NVME_NSID_BROADCAST 0xffffffff
 
+typedef struct QEMU_PACKED NvmeNGUID {
+    uint8_t     vspexid[8];
+    uint64_t    eui;
+} NvmeNGUID;
+
 typedef struct QEMU_PACKED NvmeIdNs {
     uint64_t    nsze;
     uint64_t    ncap;
@@ -1300,7 +1305,7 @@ typedef struct QEMU_PACKED NvmeIdNs {
     uint32_t    mcl;
     uint8_t     msrc;
     uint8_t     rsvd81[23];
-    uint8_t     nguid[16];
+    NvmeNGUID   nguid;
     uint64_t    eui64;
     NvmeLBAF    lbaf[16];
     uint8_t     rsvd192[192];
-- 
2.33.0


