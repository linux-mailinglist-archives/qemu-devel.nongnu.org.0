Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B8645D5D0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 08:55:59 +0100 (CET)
Received: from localhost ([::1]:33190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq9bq-00043A-4w
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 02:55:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mq9KD-0007nS-PX; Thu, 25 Nov 2021 02:37:45 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:55243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mq9KC-0000W5-1m; Thu, 25 Nov 2021 02:37:45 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 57B735C01B4;
 Thu, 25 Nov 2021 02:37:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 25 Nov 2021 02:37:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=dubePG3IYWBn5
 PpSnm2cVUSzv0Simk3Rk9Oi/pWAjGg=; b=B3fIcLWIdoLjpKbYJa3kM6osG0vYk
 H0AU/UEMC4AoHcuw5D0HY21KIHwQtucFApMip68gDdIqJtlbmAAL7TzYzusMAD0f
 k2IFYv1OnbWJWArLwvopiMHKc2go4uS7p5CfJPoinbipkrfknE/Uer8oG61lYMY2
 s0FbikUOAfLizHY/okFZti9HZlwMj0555LcvudFSUvzRZhg6mXhLWi4gg4KrTP/J
 TroRBWFcFam3Omc+1kwyxZ/I2viKw/2JU+1BZIqrv0+OGBpcxeg7JOmibnTJGGBq
 h3wqtvSlPfQ2zRuumvLDVflgtbobY1Audf8qUNEMynj3BBq4nlWYIVztA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=dubePG3IYWBn5PpSnm2cVUSzv0Simk3Rk9Oi/pWAjGg=; b=E1DysK9T
 ZH5YIKPci62rEbTtuSVbMgdwjyFmmaydJNWoy35WmMZGoMyp+GrQl9tQHNRIUoBk
 LJqnsvEKcttO3XOi0/UXRQ3k5RYMVEWQBjlvvhlHzu7jAWceH0mcUknv0ITNXJJf
 eucPSxooxsxC4SDtCOx2XmK1qwtgAN2VTk9NI8r+3CS1ODdJDwvF9GnpCQoUjBy2
 Huu463X+pVxqZLGVQpeYma62/6wz94fQGN+buesKzMTGiE/lAuoFfF3pSrzhjB1w
 Zm0+CYOtP3gakZUm8Fw61j3EzrOjH9AacJj3isqhgX2iVdVxy+MJ8JXxmNQRXdaF
 IZGpW9MEXXjeCw==
X-ME-Sender: <xms:Rj2fYVTLMkL-VYXX74-3hjYcWNHLdjUpS2-4E8MvO0B0lW3cezhX7g>
 <xme:Rj2fYewmtGOo3xDjNwS1R_OX8qcmfVZrmr_VtmjFjodc5CeQGkTjvuC5eHKdFB0sH
 2tju9lwZMv1_B6DZ_Y>
X-ME-Received: <xmr:Rj2fYa3ynM8u2pE8eD4DfnKUZS0xtnWEOpM2wiTA-u0JGlVTGfrZZj-_EW8UzFAWB2ZXsOWhUNgkLVG-Ks8LL4zsshssKrPuGRQp5k1exg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeelgddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Rj2fYdAtOmp5b83wd4-fV4JoJ1V-AXeqBLPIRA1sIyk99fKZ1zqzzg>
 <xmx:Rj2fYegl8le1GytkjZE9AhNgcXgiyRnac3F8t0WcOLo5qG3-9KxKEg>
 <xmx:Rj2fYRow76Ivk7I_vCOARBlJn1FoLD8ElmirH6oDtqB8hdFTR7TuHw>
 <xmx:Rz2fYXXg0f7Rv-hHHq8p6tquaOJDOY3lHQvCZziuJPEc6zu2Jhmu4A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Nov 2021 02:37:41 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH for-7.0 2/4] hw/nvme: add zone attribute get/set helpers
Date: Thu, 25 Nov 2021 08:37:33 +0100
Message-Id: <20211125073735.248403-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125073735.248403-1-its@irrelevant.dk>
References: <20211125073735.248403-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Klaus Jensen <k.jensen@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add some get/set helpers for zone attributes.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 4 ++--
 include/block/nvme.h | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 489d586ab9d7..7ac6ec50a0d1 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -295,7 +295,7 @@ static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
     case NVME_ZONE_STATE_READ_ONLY:
         break;
     default:
-        zone->d.za = 0;
+        NVME_ZA_CLEAR_ALL(zone->d.za);
     }
 }
 
@@ -3356,7 +3356,7 @@ static uint16_t nvme_set_zd_ext(NvmeNamespace *ns, NvmeZone *zone)
             return status;
         }
         nvme_aor_inc_active(ns);
-        zone->d.za |= NVME_ZA_ZD_EXT_VALID;
+        NVME_ZA_SET(zone->d.za, NVME_ZA_ZD_EXT_VALID);
         nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
         return NVME_SUCCESS;
     }
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 2ee227760265..2b8b906466ab 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1407,6 +1407,10 @@ enum NvmeZoneAttr {
     NVME_ZA_ZD_EXT_VALID             = 1 << 7,
 };
 
+#define NVME_ZA_SET(za, attrs)   ((za) |= (attrs))
+#define NVME_ZA_CLEAR(za, attrs) ((za) &= ~(attrs))
+#define NVME_ZA_CLEAR_ALL(za)    ((za) = 0x0)
+
 typedef struct QEMU_PACKED NvmeZoneReportHeader {
     uint64_t    nr_zones;
     uint8_t     rsvd[56];
-- 
2.34.0


