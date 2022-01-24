Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBBD4976DA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 02:07:54 +0100 (CET)
Received: from localhost ([::1]:46622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBnpp-0008Lk-JK
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 20:07:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=01678aa48=alistair.francis@opensource.wdc.com>)
 id 1nBnjf-0003BV-6S
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 20:01:32 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:30799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=01678aa48=alistair.francis@opensource.wdc.com>)
 id 1nBnj1-0003mp-HR
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 20:01:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642986051; x=1674522051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Sz4azhhBCyD9TZ8hRYrMVr2zFhqdk59LkcBrCN+QZg=;
 b=VEodUdRdQOmbGWqW72pajLL7hsQTwFaemw7iMAN7ocBTZWsiFD7G3hvv
 wMuo/S8bJo+xrOUBoVcK1+UnboMtztuKJq/Ot2oEtmpXMGEvza6QV/wvc
 MAEJXvbHTQCDMivzu3x8whO/DWmlhTlmLvbl7fxSleOPB2yE5xqfYVgM6
 OP0LeQC8S971VOpx0sqySOW/QNDRVK0ETVC1PShnAga/4LK6zQ5YShxxQ
 /ZXgClS5olbMxREIHN3bQnnueV8j3u5J1pXqgD5C4A47z1jOxh4VBBxu1
 lf/Gf2dq6quYBwuAXlCiPwdgHVJR3zut3wRCIak/hAY3SHetGmsM5bqTU w==;
X-IronPort-AV: E=Sophos;i="5.88,311,1635177600"; d="scan'208";a="190132206"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jan 2022 09:00:18 +0800
IronPort-SDR: YBpbeeCzaxu1YkgibPlQxZl1XK7WCti6EFlXXueDZgFPwj2mKFGHAqppQoFQtH41OppvfYRPMt
 4H6nF927rVsst6sK8O5IAg0jFP81CsxVaqVpH8SOlbQ5FgpnuEeDrm7IThhuvAHrunBSYaGVip
 lfCVK4/aYf9M3Phs8io/PTbFwv+ugzL/DEJn6AVFfNUw/jRQmPDcgL4+DSW14NI5BYRm1x8snK
 FXbkQZ7mMCuhGUmIwvpRnilVFlULqVx3MydlcMXuYaNqMFm5WztLfesr03Bhwskj1VZ+EhwnBu
 3GuwX0dr7oH/JLpOfqCEhAtJ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 16:32:26 -0800
IronPort-SDR: osptGQ81L3oDbnxmUWImOcFEGcZzkfxKjK4RSK+dRoxsdYauLlyEzqkiBwyvXuqOGEokzsJ7cv
 1XawlMpYQhLXp25Ua1XZei2Z7oxFJK0XJob65wVWwHNw7ZLRVjV1RVVdzrGFdCUHmKNbvBd6HX
 e/8FcUnWYDKLdK0x+WcFIClgtOT/jmk6N4KAy/uce1Qp6X91iVS0jiNC1o/q3tPynXFYZNQg/z
 wvoiA+h6dBnCJcZbPlfhV4NSyTJecDbnvhssuGYNVtViMIexnTIt2IA1C8qVWbKFyizq4RqGFE
 38k=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 17:00:18 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jhs8y2Fxhz1RvlN
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 17:00:18 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642986017; x=1645578018; bh=2Sz4azhhBCyD9TZ8hR
 YrMVr2zFhqdk59LkcBrCN+QZg=; b=XWJNGLy4lxy4nJ1akquWRLe74h2ANLp6EL
 mpyKNRjsaLCJjXzgnko8F2BAf36XkGCIAOamy1YIUc828aMnMWPffcmBDH3woRs2
 3IHxvhHkU5YkAJD1e+ovxqVc18Y1vkR4vsX0l2N9VxgRYpPDFDttt+mpLCyKMA33
 NRNidA/DOdeQyHPkS0QJ4N9oH6ym1A1zTZDI3e1hXqFQtcyxC2Ukm2odyHB5l/Oj
 KKIPKY+Be3ob40S3mayYAG0ENin7eZ+ZYInlsuA7J6UM4BQVS3DEsPjtCdGKM3HE
 NTU1dXkmpFvTVvV3xq1UiiBI3qiCbe2V/7WOQi8hYBfAaMyicHVQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 83oB6tPJmtPt for <qemu-devel@nongnu.org>;
 Sun, 23 Jan 2022 17:00:17 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.84])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jhs8q3RyWz1SVp3;
 Sun, 23 Jan 2022 17:00:11 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 bmeng.cn@gmail.com
Subject: [PATCH 1/2] accel: tcg: Allow forcing a store fault on read ops
Date: Mon, 24 Jan 2022 10:59:57 +1000
Message-Id: <20220124005958.38848-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220124005958.38848-1-alistair.francis@opensource.wdc.com>
References: <20220124005958.38848-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=01678aa48=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>

When performing atomic operations TCG will do a read operation then a
write operation. This results in a MMU_DATA_LOAD fault if the address is
invalid.

For some platforms (such as RISC-V) we should produce a store fault if
an atomic operation fails. This patch adds a new MemOp (MO_WRITE_FAULT)
that allows us to indicate that the operation should produce a
MMU_DATA_STORE access type if the operation faults.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/exec/memop.h |  2 ++
 accel/tcg/cputlb.c   | 11 +++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 2a885f3917..93ae1b6a2e 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -81,6 +81,8 @@ typedef enum MemOp {
     MO_ALIGN_32 =3D 5 << MO_ASHIFT,
     MO_ALIGN_64 =3D 6 << MO_ASHIFT,
=20
+    MO_WRITE_FAULT =3D 0x100,
+
     /* Combinations of the above, for ease of use.  */
     MO_UB    =3D MO_8,
     MO_UW    =3D MO_16,
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 5e0d0eebc3..320555d5e9 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1362,8 +1362,15 @@ static uint64_t io_readx(CPUArchState *env, CPUIOT=
LBEntry *iotlbentry,
             section->offset_within_address_space -
             section->offset_within_region;
=20
-        cpu_transaction_failed(cpu, physaddr, addr, memop_size(op), acce=
ss_type,
-                               mmu_idx, iotlbentry->attrs, r, retaddr);
+        if (op & MO_WRITE_FAULT) {
+            cpu_transaction_failed(cpu, physaddr, addr, memop_size(op),
+                                   MMU_DATA_STORE, mmu_idx, iotlbentry->=
attrs,
+                                   r, retaddr);
+        } else {
+            cpu_transaction_failed(cpu, physaddr, addr, memop_size(op),
+                                   access_type, mmu_idx, iotlbentry->att=
rs,
+                                   r, retaddr);
+        }
     }
     if (locked) {
         qemu_mutex_unlock_iothread();
--=20
2.31.1


