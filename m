Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29DD561064
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 06:54:38 +0200 (CEST)
Received: from localhost ([::1]:38784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6mCL-0005UD-GE
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 00:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9g-0002VR-Ia; Thu, 30 Jun 2022 00:51:52 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:34231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9b-0006y9-TH; Thu, 30 Jun 2022 00:51:52 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 8EBF42B058DA;
 Thu, 30 Jun 2022 00:51:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 30 Jun 2022 00:51:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656564705; x=1656568305; bh=Af
 GWXA+snDeGMV7gfmpXaFv0cU8DECQw1HIHV0zfRgU=; b=5K9SToyrtycNrB9LZ4
 PcLAq/m7JPfDlyIr7C2VCNRSms7HVCHLOmaYr1MCA2I2LDZ4rLkimEuFj61y5CIz
 eHO+40Fnz/Ocs9BfY3aFyKnu3HrWrg7omjzFv1isr+WZ7b1XA40EpPgn4BoVjPxn
 5k4X7K1qBVEtFZ81cbNQixB+gmYXaOhPP9PMj6LVxhg+3NKNGFjWyUotuztSU44A
 6FFxguEPteU6iPifMeqW6DmCjtswboGC2sbhrKhcGy9lIV9Akzy2O1L6gtrrCEG1
 Typ8MgXOd1GrfNlDXWHllvKcLj5oBJ5/D4hh2wmoHaU6Bym64Inq+65GpH1s429U
 fzxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656564705; x=1656568305; bh=AfG
 WXA+snDeGMV7gfmpXaFv0cU8DECQw1HIHV0zfRgU=; b=XRPLwx71TA6FXx6taxL
 9WZlhUmJjc5SPMq/RA66iIxMe0nmkMmZm/en2NRRU8NPSj13e98KLgA3C2gBT8Z2
 8MeY/ZsRFPpaTf6TWHJeiF6ZVb1jmtIofmKyR2lFyubV7mQNQ1Pn1KB32ZW9zjon
 wYKbP7Nt/ZxfpisT25wnDGL/e/Dcg54BPHkFOtWHssab8Wgzes+jyyOf3hfWl0k9
 o5L+P1dWiTVUjJ4xajh6kG4cfwh3RRJfhukHYkLNA6z6cZ9twDMT6NQbLe5GQm8t
 DFobtwwxKBnq+MupMmTIssPrZW+Ttm7QJcilqg8NSBAuLvmpFrHWT96hHO6tCR0p
 7BQ==
X-ME-Sender: <xms:4Cu9YvLNldwAiMwLhEmG9jf0OchxvBeW7V8crFqV6xT5jftzxGghvg>
 <xme:4Cu9YjI43oHiuUDJyEzTHmisgzm_vil1yb_CDuWINHpHN9C3lRU81SWalHZL4Rfos
 vGakU9izNaJTZyKG9A>
X-ME-Received: <xmr:4Cu9YnsxkxOgGX0LXn0TzrMn6KU3HktNJEMUtk2o9oehxZu5k-xmhLJfuPDsYcwjnWfqSclhE4upkmQGBbALar-4Rhrol1p4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpeektefhieevgfduvdeiueetteegtdeuueevieelffevueevveehhedukeejtdek
 teenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvg
 esphhjugdruggvvh
X-ME-Proxy: <xmx:4Cu9Yob_ZyDfvbPZDIDzQl3_1IFXRnXyw6QePtQY7djyD9qz29LYsQ>
 <xmx:4Cu9Ymb0pTuXp_yXgu-zESweZoXlQpDAV20pk4K84U7mXQX5ZpKV1A>
 <xmx:4Cu9YsBPK8Lh206tKaWv8KddPnFbtCjlx37kMvLwpa5Q2c7aYRhaqw>
 <xmx:4Su9YsNuLeL3M51Pl_q8jXw4-lj9l4Ni7Nr_9gflxciEUdJT24EDEucLP8w>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 00:51:44 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v3 03/14] hw/i2c/aspeed: Fix MASTER_EN missing error message
Date: Wed, 29 Jun 2022 21:51:22 -0700
Message-Id: <20220630045133.32251-4-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220630045133.32251-1-me@pjd.dev>
References: <20220630045133.32251-1-me@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=me@pjd.dev;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Peter Delevoryas <pdel@fb.com>

aspeed_i2c_bus_is_master is checking if master mode is enabled in the I2C
bus controller's function-control register, not that slave mode is enabled
or something.  The error here is that the guest is trying to trigger an I2C
master mode command while master mode is not enabled.

Fixes: ba2cccd64e90f342 ("aspeed: i2c: Add new mode support")
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/aspeed_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index cbaa7c96fc..c153a1a942 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -601,7 +601,7 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
         }
 
         if (!aspeed_i2c_bus_is_master(bus)) {
-            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Master mode is not enabled\n",
                           __func__);
             break;
         }
@@ -744,7 +744,7 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *bus, hwaddr offset,
         }
 
         if (!aspeed_i2c_bus_is_master(bus)) {
-            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Master mode is not enabled\n",
                           __func__);
             break;
         }
-- 
2.37.0


