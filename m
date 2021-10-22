Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3EE437859
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:49:21 +0200 (CEST)
Received: from localhost ([::1]:44404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mduvA-00026U-Px
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdulM-00089M-9q
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:13 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdulJ-0000xx-Qk
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634909949; x=1666445949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XLkjPH1Pk1fNoGQSHYmS/4f1zxx0xDys1xNOCrOTxvs=;
 b=ltcbgyKs84euXIZixtNqVVunxEgMQVftu/qv1Pu+gaGL/bhbGaIp7i4i
 5B0rAge0hO3xOnDoeqx+Gp9HdH94aWVK5ZM24qLZPpb2i0nnlvBHIJeZK
 dbJx0QlfqUnZbpKXA30FDxn8glXP8cBcYWDDR7lvMKvU1K5ePDjSKkDGX
 uA0BM1hTR/vSpKuOThtUtGIBx9UI0GKdkyhIgoiSTqSQ4CmyRdm2NHD3z
 5oiEMN34OpTIpaNgZI21arNAPEcEXm3loKx7GrwKZfRbsW82mmgSI/fk3
 SH/M3400RHdsRq7CU+9U9bk/xrWosp9NjOU2pXzI5pp0ExRiEPylrE9/g g==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="287492680"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:39:07 +0800
IronPort-SDR: efzdi3cCYoMSV5tfA7ZAQJtkk4jor4u9ZHWDPlOXP1m6pEvK83D1Q6K3Vl8MWoOJwSm2Ws8bim
 Oc8vTXiDwikKkT5ils0pCnADcTW6mBtE5g9TCBoVlTW1QD0YlCELYLi3BRVHaCY0eQLX3jY2lS
 Q3i9NLuBQT7AXCiBkeQN74j2RUQloVFwrn+3WVZhoqcgPvEEXC8OzXtaIkltGOsKcOAc6rhFe6
 qtu7sBDUiLtP7VCzgtqIl7i0aGrElmAbx81rv8asxMW5P4pp0ZVd+JObxMWaGZeJz8uv76qp2o
 Hag8/twpssbfkDoLkD+tOVfB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:13:10 -0700
IronPort-SDR: xO2k4QPiN1TS5uxYil0uRbja3RT1uEwJhpOSgHGmuPTJNQmMiwh4whOducKSn8A6xll1iD2s7w
 k6JDQAj3jvDTnH1rscIkQLX3npMp29FfzVAb7uL6rIUud2nF3bBm5h1pNZG8oHIz1eej3GFJNT
 A/Pxc/D3/2fGIiwzIWgCWuN3b5GzMHu4649xrinI271qVXBVxSLl4XU+AVbx3I8/21hqPYg+TF
 +blAOO7QRu0RRfPOdc0J5lmuxOFUmsXzi3RoaqWm1b/BSHEy7SydBnH8aPSrTQXs5oC2Le98p+
 H1I=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:39:08 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQRv5Hs7z1RtVn
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:39:07 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1634909947; x=1637501948; bh=XLkjPH1
 Pk1fNoGQSHYmS/4f1zxx0xDys1xNOCrOTxvs=; b=SBTmyJ0zEzBQJ8U5bUrGhkr
 lKHYBFnWHkwh1a4RoqXlmm0ncAzsFEwEI5Z/hPzhtHFU3lY2CD1zTNH9SjcM62Ub
 Oriod7Q4A4QWshDv34bO6obUzL0jTp73BWr1a0ikyIGxzbbhJHLBWaqWLW7w803B
 FDIGkKAu0lINaYipkrpjV4nmY0jHChyRMUIrLnYQM8IHgG16uH8+NNlBkG6S7/Kc
 acqJX51M8XBimfHrophhX9/1hjlXnUWDzfarsrr36i0BiYSB/pPeJxmdp5nccj1H
 kmJJRxfpgS2a0ROpZMdmKlgo9sQS/dzfRG5OvOYO1O+4dCgeZR7f5al2JrSy/qw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id QhpWwc6LSYEb for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:39:07 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQRp5LQJz1RtVl;
 Fri, 22 Oct 2021 06:39:02 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 06/33] target/riscv: Remove some unused macros
Date: Fri, 22 Oct 2021 23:37:45 +1000
Message-Id: <20211022133812.3972903-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Since commit 1a9540d1f1a
("target/riscv: Drop support for ISA spec version 1.09.1")
these definitions are unused, remove them.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: f4d8a7a035f39c0a35d44c1e371c5c99cc2fa15a.1634531504.git.alist=
air.francis@wdc.com
---
 target/riscv/cpu_bits.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 999187a9ee..3aa2512d13 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -427,14 +427,6 @@
 #define SATP64_ASID         0x0FFFF00000000000ULL
 #define SATP64_PPN          0x00000FFFFFFFFFFFULL
=20
-/* VM modes (mstatus.vm) privileged ISA 1.9.1 */
-#define VM_1_09_MBARE       0
-#define VM_1_09_MBB         1
-#define VM_1_09_MBBID       2
-#define VM_1_09_SV32        8
-#define VM_1_09_SV39        9
-#define VM_1_09_SV48        10
-
 /* VM modes (satp.mode) privileged ISA 1.10 */
 #define VM_1_10_MBARE       0
 #define VM_1_10_SV32        1
--=20
2.31.1


