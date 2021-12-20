Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4B047A4DC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:11:13 +0100 (CET)
Received: from localhost ([::1]:38486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBtA-0001s6-RH
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:11:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmQ-0004BO-3T
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:12 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmM-0008HP-3m
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976407; x=1671512407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qnHwE4G6zuykByKbANfOIfZS8yFjOwpYtiya7Q+ljuo=;
 b=jre1/QW/7CLfnKCwhKSqjPVpP2A6RRuxtQthVCHzvpEG8wxxfdU5vlcu
 JVDj64B5XDb5vfJfowpgRS3A0KA6VDY50RqTGnZqYd5mB5gIXOnkqDaKQ
 MYdyScv7E/tj4NL2Z69Yj5Cp/L4Z7kqbH3G3YDo8ZwCl++FUasRaD82+N
 1g2lCYW8atBuGzNqwaDGMwMNLOXkkzJ5nr4ctHUkizfUOglNkfcGlgdey
 UdEjTK4w5RDe8z9DLq5XcmDVM69EkauA2KYKkMVLT9fTHBDij/FR8COqj
 dsyY1nQm9ZMPUPcigFY5wElYyvgG+41rHjCbxS6GIp4sBr3S/7XV7ThFQ g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680078"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:00:05 +0800
IronPort-SDR: bzF/yF2wnffNuHOCmkWIrKglsUWXKedjs5ZsvzipI2qMP3i+eZJ2naq6xxcUxJ+TVv4tYktESd
 RUlKzbiqqbXqmnOP6WOJ1UktOHsdUbcgURjf+EEqQ/CSGXRkd+rrHSWQ3Hq0Kkj38hdLpSe0Fg
 BWshutB1gKerGpM0MQyU/tboRdoPceS2z7qwW/QbLRxnwJb8r2+dJRz4rQh29iGInSKnaQhs4R
 GfaGYap9xXD2RuxZ2EDsLu0uEsE++1OgIrPYvE3fZxnJIyirGNWMPqbuOXzEwLVu3b0dO1micM
 W1pwK1BpmYcrz6yM/gu6FcRY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:32:53 -0800
IronPort-SDR: y3Pg8bSNwL8TErhmzUuktvCHfDRpOKNwjOd8Q+XBCBZ+pC8ChLlhi/kuVOmu5sf+xk2Ul4PlVz
 1CWN48RHl4ZnX/uN1oHbsx4yAjXF87cv8fHWpxV6JND8rJrtWh1OQ1EAKmeH3Bi3BMoA/4rjnr
 TGhA8d+bojSblFE/Waw9rv09Gn5g0TOyqZT6cYAoL7nj/frbzOchM/SYfM2EieADiqi5AQbtSG
 V+DizHrbTPC851WXUCic0GK4S0Zo2JvZ/CD/hCdmRMuqyh1+1xi957t4iUFQutfH4uSl/uzQBk
 K/Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:00:05 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS7l6dMVz1Rvlf
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:00:03 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976403; x=1642568404; bh=qnHwE4G6zuykByKbAN
 fOIfZS8yFjOwpYtiya7Q+ljuo=; b=uEC4ZH4YXPHSjbaLnN/FujRJuwofdUfmuS
 Xd/hDCfNHzh/QuEvAbDtI0VIMOQoqasztlJeRZcduswro+JFWKxRn2s6jEr6JOIr
 NR7U6D8kiw6Qw3HOy6bNY0DTsA3Olc6Pe8AXxe+cYcLNRz4GpqUcEFi0z0nZJb5N
 I9PEAmTVP4H1qikSzyzrd0FuEb4LjManiVvdhXwUToGd4FNPY49cfO3qR/sh1Hcn
 mQvN9/HdWC6gzsRJ/GVikNIh01VvkalH+wNuOoCPT3JHuzOeoyQLVA8XuDW3n9MV
 0pL3Xf9nfiHigC8qXzJKuZ5u6RMWldHj3k9wYlNzTHcJCVeU7TtQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3lnuzFWyeUs6 for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:00:03 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS7h3rqRz1RtVG;
 Sun, 19 Dec 2021 21:00:00 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 40/88] target/riscv: rvv-1.0: iota instruction
Date: Mon, 20 Dec 2021 14:56:17 +1000
Message-Id: <20211220045705.62174-41-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-33-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d139c0aade..3ac5162aeb 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -632,7 +632,7 @@ vfirst_m        010000 . ..... 10001 010 ..... 101011=
1 @r2_vm
 vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
-viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
+viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 9206e6f06c..80cbf0cadb 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2757,12 +2757,18 @@ GEN_M_TRANS(vmsbf_m)
 GEN_M_TRANS(vmsif_m)
 GEN_M_TRANS(vmsof_m)
=20
-/* Vector Iota Instruction */
+/*
+ * Vector Iota Instruction
+ *
+ * 1. The destination register cannot overlap the source register.
+ * 2. If masked, cannot overlap the mask register ('v0').
+ * 3. An illegal instruction exception is raised if vstart is non-zero.
+ */
 static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s) &&
-        require_noover(a->rd, s->lmul, a->rs2, 0) &&
+        !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
         require_vm(a->vm, a->rd) &&
         require_align(a->rd, s->lmul)) {
         uint32_t data =3D 0;
--=20
2.31.1


