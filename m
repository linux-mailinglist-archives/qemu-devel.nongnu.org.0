Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78C15333D2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 01:16:50 +0200 (CEST)
Received: from localhost ([::1]:46030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdlh-00047y-Oq
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 19:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHw-00012A-HR
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:46:04 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHu-0002Yx-SR
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:46:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432362; x=1684968362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z5mvFJDO7RctCYzvCTnX4xr/5unVBTXp2SdqigfVvZs=;
 b=AL3smv68uKJv3ToaXTqd89Lg5jWyqQBhDpD4F1c+3NQulpxexNIRiDTt
 ux3KgFKqIJprXLH75QZhGX9FrfLn4BKtsFooyxVs1nT8Bliwky7L3bDgN
 13Iod9fUfSzBArov0LiZye9Mdk8//SBUIg9TKTEqr40pjaRqyfRoDi70l
 Y9BuSZQ1UTvuDmSch99JTMRm6mpnsTNCnsioN1tiat5hOH8+cdHMMO8Lt
 RZrmQ3jCTb+z11+B0GhwIAXMmKVUN7u2aPHgsWQY24v6y42rFFCJzsejZ
 iHJRHaicK1ajprBXGlZdxAFwltkbM2/2NbqVuiIndWTOYZn7xqFDUUwVe w==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566725"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:45:36 +0800
IronPort-SDR: K2jVX0PO+bEg5hRQQRfX42x0MNIh58yZhAsmFF38XW4I6wM8mTX3kVPRcMUEt0II19xSHK+j5S
 q1V7o0RdZQP1KHZmLtP1ojnLIiVQ2b8bxTkEFK4uxbJRngk2vxjnc0zDczBeCSZ70BSFSecC40
 1sDOoLCj5EwYEls5A0KVfd7U7Lm7iH8PqPyzwxjN7AZNOIbokavuazxQpSJSdqlQ2TK/Bm+I1B
 xKCZGn7I3rCKYsv4r74BKfcc0vha+poN9N/gS8dDySEVHu+RxIQNbp/BocMbYBP7HG5O+u+pJM
 mWDVoDCqiMsMiUCt1vKN0WDX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:05:08 -0700
IronPort-SDR: Ddz66a+Y65rfYsAgs0LKUruFcEZ0UUFAum/Jf4ZbKNt0IMf9JHqaQ9/eMLcp4W8kpwHpS+Slk9
 0EqBN/RTEqvir3M67fBgGc+agax9EhMu6fx+EALr1PGGGraa0BWfY1qOZFP0z5QO4Pyf+78kLp
 yzJ94Qm29Pg2UGVHch3JNTeFg7k5nmpTTjTIgzLNRV1upqM0vCzaoDZWu7SaEq04qrKLmb7PD1
 wImXnhz7PcWsoGB9hePH7ytRMhBU/RoTrWTdWD1mn8AjJRTVGiYhE/kxON2Z+sCqO2RmS8Ga/U
 izQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:45:37 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78Rh1kp2z1SVny
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:45:36 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1653432335; x=1656024336; bh=z5mvFJD
 O7RctCYzvCTnX4xr/5unVBTXp2SdqigfVvZs=; b=odDXu+hGONGAPjK1DFGM5p4
 PFMyNGjwrwIbJHdwiGQFPjbjhwyBgT/bwzwI9uR1vSZe0ve52nOESex6PxG5cOon
 X1f0dn6MzNsVa2/x+LiSjiLk7I6AsVKEAD7JdL1W0WCqB5qDdxywenMV/05nHkgn
 HRRCdMfaHnykHNoSoQOp+ve+FQc9RfE8dkZ1fPWwUFesb/Cd9Pt/iHUsJlLzXk/Z
 PUAPmsL13MSm3IkkGHEllyrrgAuBr80sllUeKhT9ZpiPzysGvQHpBH0coq0omm2T
 qr1aDw6VQCL+NzFBGPBNR9ZW/5Mq2rl5iat7IfjjR6TOSfRdaQ+SaZlk/97UfIQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2VlSQvtiyRQh for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:45:35 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78Rd55sLz1Rvlx;
 Tue, 24 May 2022 15:45:33 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 23/23] hw/core: loader: Set is_linux to true for VxWorks uImage
Date: Wed, 25 May 2022 08:44:28 +1000
Message-Id: <20220524224428.552334-24-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Bin Meng <bin.meng@windriver.com>

VxWorks 7 uses the same boot interface as the Linux kernel on Arm
(64-bit only), PowerPC and RISC-V architectures. Add logic to set
is_linux to true for VxWorks uImage for these architectures in
load_uboot_image().

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220324134812.541274-2-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/core/loader.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 8167301f04..edde657ac3 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -696,6 +696,21 @@ static int load_uboot_image(const char *filename, hw=
addr *ep, hwaddr *loadaddr,
         if (is_linux) {
             if (hdr->ih_os =3D=3D IH_OS_LINUX) {
                 *is_linux =3D 1;
+            } else if (hdr->ih_os =3D=3D IH_OS_VXWORKS) {
+                /*
+                 * VxWorks 7 uses the same boot interface as the Linux k=
ernel
+                 * on Arm (64-bit only), PowerPC and RISC-V architecture=
s.
+                 */
+                switch (hdr->ih_arch) {
+                case IH_ARCH_ARM64:
+                case IH_ARCH_PPC:
+                case IH_ARCH_RISCV:
+                    *is_linux =3D 1;
+                    break;
+                default:
+                    *is_linux =3D 0;
+                    break;
+                }
             } else {
                 *is_linux =3D 0;
             }
--=20
2.35.3


