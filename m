Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73133725DD
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:34:42 +0200 (CEST)
Received: from localhost ([::1]:60874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldodl-0003ar-RA
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0W-000690-MI; Tue, 04 May 2021 01:54:08 -0400
Received: from ozlabs.org ([203.11.71.1]:55857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0U-0004so-Vv; Tue, 04 May 2021 01:54:08 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CM0GnFz9sjB; Tue,  4 May 2021 15:53:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107599;
 bh=CdNzPgX1E1MQGbEspxa9vwUoiQIUOXrms6BJeQ7RFHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kQmLMl5TUsCbOnnNkH21p3LVB4bHOiJKQzdH5aS2n0OIEZPj6upr9dR7Fa1RIuaE9
 qeMqz1ZlwaXz36RdopiBVR1GmkRZOZ45G9ZNHDlbKMXsOohtDJThk5Ib58vV0x/jHH
 36HUNFjVY72K0atqFNVBGurfDUFYEVkhYH77ps9w=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 28/46] roms/Makefile: Update ppce500 u-boot build directory name
Date: Tue,  4 May 2021 15:52:54 +1000
Message-Id: <20210504055312.306823-29-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

Currently building ppce500 u-boot image results in

  modified:   roms/u-boot (untracked content)

As roms/u-boot/.gitignore indicates, update the build directory
name to build-e500 to eliminate this message.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 roms/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/roms/Makefile b/roms/Makefile
index 5ffe3317ac..eeb5970348 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -154,10 +154,10 @@ slof:
 	cp SLOF/boot_rom.bin ../pc-bios/slof.bin
 
 u-boot.e500:
-	$(MAKE) -C u-boot O=build.e500 qemu-ppce500_config
+	$(MAKE) -C u-boot O=build-e500 qemu-ppce500_config
 	$(MAKE) -C u-boot CROSS_COMPILE=$(powerpc_cross_prefix) \
-		O=build.e500
-	$(powerpc_cross_prefix)strip u-boot/build.e500/u-boot -o \
+		O=build-e500
+	$(powerpc_cross_prefix)strip u-boot/build-e500/u-boot -o \
 		../pc-bios/u-boot.e500
 
 u-boot.sam460:
@@ -205,7 +205,7 @@ clean:
 	$(MAKE) -C ipxe/src veryclean
 	$(MAKE) -C edk2/BaseTools clean
 	$(MAKE) -C SLOF clean
-	rm -rf u-boot/build.e500
+	rm -rf u-boot/build-e500
 	$(MAKE) -C u-boot-sam460ex distclean
 	$(MAKE) -C skiboot clean
 	$(MAKE) -f Makefile.edk2 clean
-- 
2.31.1


