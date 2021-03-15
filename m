Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEAA33B1C2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:52:46 +0100 (CET)
Received: from localhost ([::1]:59464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlm9-0002Oz-De
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@knazarov.com>) id 1lLli7-0008I6-Cc
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:48:35 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@knazarov.com>) id 1lLli5-0007SN-S1
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:48:35 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 697D85C005D;
 Mon, 15 Mar 2021 07:48:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 15 Mar 2021 07:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=knazarov.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=F/7NXYbcEkbnA
 3ipv0ISVLK0kJzssqpVk5C6aUHjDCE=; b=H3DDsQik9/yBPtDlYHe/ptufVVxIg
 FwgXLxK9we+vvBdH6qmYZIpBVpukCe/qKB+xTgLd8+1KTW0bywMtpifbotY9NY0/
 bDXBtlgLqsbY1UPSLuGqLmKDC4gzCDBOQQVHSOkQfDAVI7pYOEfQqQWsUcjMGzKY
 oIFSZWdxXjQlPhQk4tpNbOl+IDhumD/SXsjP2rZEgq0hS6cg7uGFi+l8xT3LsG0p
 xXAT8fvzJ+qbAZ3vkWyums+6A/aWYj8UrkpVo/IY3HKAuB2eveijWyUcNWw6MBcS
 XY9+HgkyFagHuQegISLSmzcEmQDLnRUGlNn4gg0k+WGY8/jgtg6wlFlJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=F/7NXYbcEkbnA3ipv0ISVLK0kJzssqpVk5C6aUHjDCE=; b=PKMK5BEU
 4CJinnjnhAN40zu3UnwJlm2r/8FAZ6uChOCXCqHEIEspNhK+b474kfacAaCmTdd+
 q4i60+lO9ZlcJfYyZVzeax4SNWFm4B+oBcwcL3NlkWii9HBzTXC9Zb2x9Q7I4+lT
 HjX02OwxRBU+2NrFocIWV+PHUejebk7aGe/jcBHKW5wztf1yWHH4MRAwJiO5YL9K
 jaZwp6bEyYFJv7xmWOZ4PSIV8loHhwbfJ3xLIQMfTdww0Th3xVARtad44yQy6HMN
 I10XX8kTkkWCkdpNuRiaA0AGI//fUxjvkCPMd5p/z6w0RS0LIbHevsmquGn8RUoO
 K5s89aTiJ/NVOQ==
X-ME-Sender: <xms:kUlPYFqpfe-fvsSulDmcwpVZbR-NuiHF8M6oUVw4VF-bg4EMOfN1sA>
 <xme:kUlPYHoTllFg2KKK_gyDh_ULcODPJFVBDxYE-AYbHvwxaMIMXzu3hHNsuGIX2nFxk
 KnpyaDr6Evz2v83-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvledgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmohhnshht
 rghnthhinhcupfgriigrrhhovhcuoehmrghilheskhhnrgiirghrohhvrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeffhfefgedukeetffeftdfgvdfhkedvhfelfedufefhleeugfek
 gfejledttdejgfenucfkphepuddtledrvdehvddruddtjedrleenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghilheskhhnrgiirghrohhv
 rdgtohhm
X-ME-Proxy: <xmx:kUlPYCM_PkrVytxZiZvBZPtZKYSfYECuVQN3yX4CEIvoMDDXDXTpPA>
 <xmx:kUlPYA7AYVylVAes_EBPWVZdNQQU4P4rd0O_ZMosQFE8y_YLG2pqIg>
 <xmx:kUlPYE4eV5XUP18X7V6x_oyLtCLZVrxFsB3pNrv5eBag6-hhizRtgA>
 <xmx:kUlPYCR_Py5DlU1MrcmkgVfXGZsv9Q3zyf91N4QxQ0UhNPY2ww4V5Q>
Received: from pin.lan (unknown [109.252.107.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 84D5424005C;
 Mon, 15 Mar 2021 07:48:32 -0400 (EDT)
From: Konstantin Nazarov <mail@knazarov.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] edid: allow arbitrary-length checksums
Date: Mon, 15 Mar 2021 14:46:38 +0300
Message-Id: <20210315114639.91953-2-mail@knazarov.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210315114639.91953-1-mail@knazarov.com>
References: <20210315114639.91953-1-mail@knazarov.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=mail@knazarov.com;
 helo=out4-smtp.messagingengine.com
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
Cc: Konstantin Nazarov <mail@knazarov.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some of the EDID extensions like DisplayID do checksums of their
subsections. Currently checksums can be only applied to the whole
extension blocks which are 128 bytes.

This patch allows to checksum arbitrary parts of EDID, and not only
whole extension blocks.

Based-on: <20210303152948.59943-2-akihiko.odaki@gmail.com>
Signed-off-by: Konstantin Nazarov <mail@knazarov.com>
---
 hw/display/edid-generate.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index 1e1d89b9a78..530bdbdf06e 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -158,17 +158,17 @@ static void edid_fill_modes(uint8_t *edid, uint8_t *xtra3, uint8_t *dta,
     }
 }
 
-static void edid_checksum(uint8_t *edid)
+static void edid_checksum(uint8_t *edid, size_t len)
 {
     uint32_t sum = 0;
     int i;
 
-    for (i = 0; i < 127; i++) {
+    for (i = 0; i < len; i++) {
         sum += edid[i];
     }
     sum &= 0xff;
     if (sum) {
-        edid[127] = 0x100 - sum;
+        edid[len] = 0x100 - sum;
     }
 }
 
@@ -452,9 +452,9 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
     /* =============== finish up =============== */
 
     edid_fill_modes(edid, xtra3, dta, info->maxx, info->maxy);
-    edid_checksum(edid);
+    edid_checksum(edid, 127);
     if (dta) {
-        edid_checksum(dta);
+        edid_checksum(dta, 127);
     }
 }
 
-- 
2.24.3 (Apple Git-128)


