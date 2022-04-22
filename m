Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EEB50AD02
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 03:01:16 +0200 (CEST)
Received: from localhost ([::1]:44762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhfe-0002De-UJ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 21:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJN-0007be-LP
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:13 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJL-0005V8-Pn
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587891; x=1682123891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Asrx2POXRJ0pZuD/WMHlGXXuWvs40U2nwecwTv2Oge4=;
 b=Bv2sX0s/wka0IIcmCZuXNEYY+FlEdpi1x6jaxy+MavC7szA4nB+cm8Ry
 2T/9h2VhzUVkzSm0+QtxZFyJZD8dMmP8a5AysaRG3O+Ihnm6x1iimynCb
 C0X/HWbLVPa7ChpumYY3ebO9EEb2VRSWLP+i8cBYnQamFJTjfRBHw3sPP
 lJFUVYPphujuOREHLsDAU/xsVMlMRewqcNArpyh9WPvplmfum97ttdgZh
 M0EJu9AHTVQEexNG8F3IMl/Lg/bwXDZq2Zw8B+TR3bfozcuPHE0Pj0ggh
 5+tkAkY4NOmsqdg5Nl6lku6APic/xjzvO0n1qI/5+vKBiuqWEPZKUWWeK A==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483406"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:38:10 +0800
IronPort-SDR: iZax/IDCHehZs3Fnk61hISLHfXwa/BWc4gl3VE8jkSRbKxJQK1iTbyFbYmMrTcFFNlvWzCJKAg
 mMJQjBdWgkYF4v3UX3zo6WAMNsae9/AJ2jSnarkOsLci++fbuyAhdh9zItKkJ5XHBKIoicDtIB
 3YZxU/eqauJH8XBokXslPuRNyYgVrEJGOYYbCO9Nz+w85wJt4bLXtFiutv3H6IOWXuPBAAieV1
 XXR4s0qTXINKfHT5Ar802xzouCbmQ1eGEYsiDTMJjT1TKChztF2A57dF9rZEeofGmEMmfE2ZbY
 XwVzbz3FMkSD8dNh35UvhyhB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:27 -0700
IronPort-SDR: ETwuLJigMTR+gYYV+6LEPHmzjt+rA2mtlsPMnjA+tK6b11yGGWy6hRFQNmr2xSrs3GDo6nG9ze
 JVBmyRpMWjeS6eGK9XdCR2+dOscc7VFuokc2tXrtb4XUnda0NEQ1m6YDiZfE3cJp3APXkaaRZh
 bxnCjon5ylu3HuJ/AJUtmTVm2dENUqi5KEUngRB0kzbKE8N7rSu8T4PohPE/k4cMu09GcZltup
 MikEjd+47IxhMUMCOpp0pqygCSoZyAemUngRHzupE4z8JGs/0NIgHrrcHiWUBrbTLveCNwMrnq
 YV0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:38:11 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwVp54CQz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:38:10 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587890; x=1653179891; bh=Asrx2POXRJ0pZuD/WM
 HlGXXuWvs40U2nwecwTv2Oge4=; b=FAB8PfCmUi09fnTFpd0LFNgm0dbZT1Higo
 vkaVs9EKCEib1Bab/XbsNz3hQbdF0hY0nOB+/OToPi+2kp4DE1TUVzl9BnD+X1V1
 FZ9URAibEh+KQDrREAcn4IYiNoT5Q7Txpvu0dQtIvfch0eY0CgYCdNS8Ob3xA4on
 MsKhbcMBSMHCnPvQI953uwqS08bItrAj79uRb3uGNl8BXK3yqFscx1ykRi74mkuD
 AIRzkZiLP3dVAOOsqY8rGJgfmo3LBQxbrJERdWkZQWN9Uw5tcCLgThG4PLZzHN85
 TYgxVGVwlZoZgWsRyRLqlzr/FXBDXxgaLjEZwbMSCRXSsRFdBcRQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UBX3SFdKFZZq for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:38:10 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwVl3v56z1Rvlx;
 Thu, 21 Apr 2022 17:38:07 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Anup Patel <anup@brainfault.org>
Subject: [PULL v2 18/31] hw/riscv: virt: Exit if the user provided -bios in
 combination with KVM
Date: Fri, 22 Apr 2022 10:36:43 +1000
Message-Id: <20220422003656.1648121-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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


