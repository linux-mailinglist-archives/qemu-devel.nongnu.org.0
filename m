Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2FD50996E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:43:20 +0200 (CEST)
Received: from localhost ([::1]:36060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhRTD-0004EJ-ED
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQS0-0005dZ-D0
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:00 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRy-0007zd-Mc
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523078; x=1682059078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Asrx2POXRJ0pZuD/WMHlGXXuWvs40U2nwecwTv2Oge4=;
 b=N1VViHK3ZNkyNCSWIuThPqL4yl2Nj5brnpJP3JZ4ZB2JRnjUB8jvSAwR
 tpkA+DqqbELNwgNgBKT7IQ3mG5vvvDX7fJppE5bFBstIsIgh3emPGkybA
 CFsBw+qV5LA11GV1X7Isn+woxF4sq4814b7wOADARSwKCE3fPVqtkLVDz
 auxjdhM4XgESp7GUbgIQ8pVs2KKDfy+2OJSZBmmUJye/jxgVES78Qa+6k
 WwK1d8+qCwZ6l9hur7MCrHvbkx8VyWgBohYVXkJJHHlbaSw8AKTjfwEtY
 AFMna1v+KajnV0rxSLNl8ek2BTf5waQihFvMx6MKXlL5eKeSPEkJ2fNS2 A==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302640000"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:42 +0800
IronPort-SDR: Bquj1N532X7u/Z5BmO8r21s5aqzHG4I9dufA4zXD3cXEZnRCMDAUlambW9FPXUmqxHYzuO+4yV
 cvPnA5y7BLHPWybbpsE3ADbaFKXrOBuLAYYzz2vOKZt9/ZTSbxi7zCRMl8md0poYDXrX0nlrLZ
 XlLrpr6V6637fijBYBgGNy4ae0bUSG1ghWimBBVA+XtZXRcy9OtYKaTrtgmjSuIiOwJ7IasPFk
 R3XDN57j0aRgRWRID2VCY0QM9nKCvmvagmCgUv2nQF1LKIjXLucH4tIutIEI3E9uD9P2z2PM11
 9BQI/Foyn+RNWY6ng/UOn1A5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:45 -0700
IronPort-SDR: HivXSFM8/4X2JpxacdOqkwbskhsmeOPoqe4xn9e1NS5cqFKtnEzbl4ZcGQAfoAJprnfXDoVCcY
 firDAq2XHtGC6IewcVeWJ4vGpdVNESB+oTYfblkZREVlWVKNnu2uHSiR6uU9jsTjnJGouCXgn7
 zOqyda7Ff6x+oz0bMZeXQbScYUjv73z6S8pQ41RqluUFI6yu8M3H7nJAUYcSUqhPIA7EW9/NnE
 6qt9XGIPUsJc3e9w3i1H/21G+HDR5Ld8CbLoG4xiFkVX7Fl+ODhOQCqLPTWumjDltoShl83LaZ
 4oQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSX62DK2z1SVp0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:42 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523061; x=1653115062; bh=Asrx2POXRJ0pZuD/WM
 HlGXXuWvs40U2nwecwTv2Oge4=; b=dDx73NYWhZR8t0U2XAKFFyL3FWrTe4uUlQ
 BoEGXav/rWPbuRReQrNvYE0iA9vvhMcSJKCBhiHIyf8M0X4PORyN/wetW9pOmGVV
 WpnHl6YAu0mm052nuG44DdU8h0KGng2xdNP8lTpkUKot15lAk/8tUQHiUfo1XKyv
 lC/P12kmpIYwRtlpOhJXyDvjdX1sW+LmHCPtkqG7FdxwW8qIjhjoAvK5qEFG6179
 9HPygeN7eieYQ/GlehA/dl1cVhJRW93UOaWJP3hLAQ6DREPOS0i2agE3N3ARPosM
 SnXMlCQawYSpaS/fcxipFG9jwbP0ILFV57PQTVLA9TmOjcP88Z6g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id IsZJ3ZYKRorH for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:41 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSX32LcRz1Rvlx;
 Wed, 20 Apr 2022 23:37:39 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Anup Patel <anup@brainfault.org>
Subject: [PULL 18/31] hw/riscv: virt: Exit if the user provided -bios in
 combination with KVM
Date: Thu, 21 Apr 2022 16:36:17 +1000
Message-Id: <20220421063630.1033608-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

The -bios option is silently ignored if used in combination with -enable-=
kvm.
The reason is that the machine starts in S-Mode, and the bios typically r=
uns in
M-Mode.

Better exit in that case to not confuse the user.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Message-Id: <20220401121842.2791796-1-ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index da50cbed43..09609c96e8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1308,12 +1308,18 @@ static void virt_machine_init(MachineState *machi=
ne)
=20
     /*
      * Only direct boot kernel is currently supported for KVM VM,
-     * so the "-bios" parameter is ignored and treated like "-bios none"
-     * when KVM is enabled.
+     * so the "-bios" parameter is not supported when KVM is enabled.
      */
     if (kvm_enabled()) {
-        g_free(machine->firmware);
-        machine->firmware =3D g_strdup("none");
+        if (machine->firmware) {
+            if (strcmp(machine->firmware, "none")) {
+                error_report("Machine mode firmware is not supported in =
"
+                             "combination with KVM.");
+                exit(1);
+            }
+        } else {
+            machine->firmware =3D g_strdup("none");
+        }
     }
=20
     if (riscv_is_32bit(&s->soc[0])) {
--=20
2.35.1


