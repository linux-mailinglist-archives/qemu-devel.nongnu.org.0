Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389764CB669
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 06:31:29 +0100 (CET)
Received: from localhost ([::1]:43568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPe3k-0004Fn-Ag
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 00:31:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe0r-0001TL-5r
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:28:29 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:31987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe0p-0000Fb-93
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:28:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646285307; x=1677821307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MUZz+LwRynMTgIS3CJSCWRQFEAgiKHT458bfHMZIv8k=;
 b=DNyDvJET0TU9gB1Ft9/2Ao4QeBQyZh2CijECwLedQbGRUoII+/WiGSJy
 pE6DpZOH1YRRXjuF1Z0wpXKXbZvTYrTlOBJA03e9REgaAgnTZ2mx2XPZc
 hzsfZyUlnaxzqbT6UhpdQ45Y0lyC7oGbmx+47dHAyoknYacfCeVLvbT3G
 g/+hd9P2fWeX0vIUAN8nS+MyhRpMYY9T9m1w2vJocIQGsMLZCNYUkrf0N
 xeIDbrT8lpwJkmJi+fxryd4WQ8LxO7rfFuKsAIaaVwaVqbBW17DEGv8yH
 pCYo+Ndg+OqZ8vAiSvWcRWZsvZ4e+alRH0iMpZleVkRRILCYbW8F18lvw g==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="195320526"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 13:28:26 +0800
IronPort-SDR: EbCDpNREjgNcusxSax55jsMCHHu8sTd2I6ylCzvbFhK3NHpPsJelp1z4jRGZ6eTn2GAtNMZtOd
 TD5DymNYtIHPrkIYgCz9x2c/kS/CLqrqqjrtdC4bzc+QvRRIhT00OpgHcEcePg1u6qJt5bMAtw
 D5C5lkkRLsiq7T+ko6is8JZCZyq2JXWXOe/mQlXYIftHWSHtF5tNQqylk1U1sn+Tye8dSK8q10
 MuC7oIVZtJuMMxxXEngfSKnXYpCUYWbgw4AHctxNToH8bJkb6i6uIEfqEgxK/U9a1X1aqMxkDx
 RjaVAK1MTijJ/B84tvijZCEh
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:00:50 -0800
IronPort-SDR: YirlgHfhpIRmOmDOmgIC8lWEctLxGZDE6uUkxW7VJI24yURPVnyMe+NNjNTaQRprv12CEkfTub
 LGeLw4jBp5x/m9DNYdbETUcWEAM8bC9GevVBcaaucappYRAur7LkS4DIfo0R2wElRr9FoV1AcA
 NHw8LgGf3ZydAwLF6ZUahENV2MEuR6Ns1MOGJz9PFFMxFtkq6IZZ5crhgsLIIFDvXyS6cTN+wf
 eUPJtdfolM5ynU4UqJM7X5XsgvkyFWGJuNiBakXbc2sxXDVbC+iPsVGgaqN52mpAeQsoJRT9uc
 Scs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:28:26 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K8KJn3Fl5z1SHwl
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 21:28:25 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1646285304; x=1648877305; bh=MUZz+LwRynMTgIS3CJ
 SCWRQFEAgiKHT458bfHMZIv8k=; b=SrXsJDqoS+mwvbdqrFMedGNMA1d6KPpkXN
 /a5OzhwlCn+J4GwrYpvCszQytvseJN3J0wx+Iz0VhaPv3artTncOUlhrNTiI2jpu
 fol7TTmy82DE04LSO0FMMF+yT1mbZQ9OosDQesxGeQUjvrtwfPSCaHrnhIY0hZR2
 rZdf1X8gyzRVxEW2ZEpZKeN2fV/rv/FE509QAXQ4Bieo1pZtCwxoS7t1d07dLCIv
 7E9Xqa1Pc8dsUuJIGk9nJw6W+ckfXSP1Px5NODQ4m9hZejDSsTv5W9oyBwtY17yc
 eLhLqR5DKSxxN+ferOahcFZGwZISLFhBSyWt4YadNM3Tfqpm9JPw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id LwhRFHddpKBj for <qemu-devel@nongnu.org>;
 Wed,  2 Mar 2022 21:28:24 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.101])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K8KJj698qz1Rvlx;
 Wed,  2 Mar 2022 21:28:21 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 01/13] target/riscv: fix inverted checks for ext_zb[abcs]
Date: Thu,  3 Mar 2022 15:27:52 +1000
Message-Id: <20220303052804.529967-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
References: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=05403f1d5=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

While changing to the use of cfg_ptr, the conditions for REQUIRE_ZB[ABCS]
inadvertently became inverted and slipped through the initial testing (wh=
ich
used RV64GC_XVentanaCondOps as a target).
This fixes the regression.

Tested against SPEC2017 w/ GCC 12 (prerelease) for RV64GC_zba_zbb_zbc_zbs=
.

Fixes: f2a32bec8f0da99 ("target/riscv: access cfg structure through Disas=
Context")
Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220203153946.2676353-1-philipp.tomsich@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index f9bd3b7ec4..e8519a6d69 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -19,25 +19,25 @@
  */
=20
 #define REQUIRE_ZBA(ctx) do {                    \
-    if (ctx->cfg_ptr->ext_zba) {                 \
+    if (!ctx->cfg_ptr->ext_zba) {                \
         return false;                            \
     }                                            \
 } while (0)
=20
 #define REQUIRE_ZBB(ctx) do {                    \
-    if (ctx->cfg_ptr->ext_zbb) {                 \
+    if (!ctx->cfg_ptr->ext_zbb) {                \
         return false;                            \
     }                                            \
 } while (0)
=20
 #define REQUIRE_ZBC(ctx) do {                    \
-    if (ctx->cfg_ptr->ext_zbc) {                 \
+    if (!ctx->cfg_ptr->ext_zbc) {                \
         return false;                            \
     }                                            \
 } while (0)
=20
 #define REQUIRE_ZBS(ctx) do {                    \
-    if (ctx->cfg_ptr->ext_zbs) {                 \
+    if (!ctx->cfg_ptr->ext_zbs) {                \
         return false;                            \
     }                                            \
 } while (0)
--=20
2.35.1


