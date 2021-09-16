Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FA940ECF0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 23:54:30 +0200 (CEST)
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzKv-0003yM-RL
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 17:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzG3-000471-3B
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:49:27 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:30118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzG1-0001yu-59
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631828964; x=1663364964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/By8hcMfszR6aj98qjgmS+3rf+WKkLvhUWvMd941eg4=;
 b=HPAdcLl6zsAJxF59rNeUex1Ejdf/wTAVOejOTHuFzRnYs9Lc9SrgpgEi
 7EmfVV//Jya2nDt9Zm72lj8pBqomlXpeXnXwdNu3oumsB5TrMzxlZqoLH
 eCoTk+uPvz5drkkLTGeYMAq0lVnJZluasxSXQxW5eqFl6XfGW+1nCvb6C
 zTY7Ow8+EEjnLdWf+3iqm4QhEjKb31A3sDa0OP4BBTTsvABcmCNFkamNO
 MrnP4t2ikl7DALvb3rBqxSGPaZCilOvQwJNpGv1i+C3j0GN5Z4IJe0SEr
 vo4qQd6hKFZ9Z6jYE4h4QAZN/g8uR/t+Vr3Lalh8azxxdAidlsLHsbe68 Q==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="291828377"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:49:19 +0800
IronPort-SDR: lOFPYApH4yp3faicxeSC/tFX/sGrGtIatuDvl18+oJBrlB/GZqB94CW5YzWE73SGgKURtJp+Bz
 ZwaJ4P9UdcM1Ta5bdda6J+8a2hk4cPEHXkUYobjMFgpYKp1OyWCSVxnw6E+TwRUmxn3J0bId+Q
 PTKes75fKyksNFmdDaf3NAL4ZF13D+e+lS6CDyR1T5Wld0fMiyh8JNeCzJn7LTBceX7jQhni6m
 yjqcqaufjEjIvgnRhGf5/MaF1fkKSAJi9rkql04htc98Z51iWVfru2la7EsZmHLfkVuf4wSpzt
 Z5NAXdg0coEOGy0lmTnJmFEK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:24:06 -0700
IronPort-SDR: SOYPgOmXaNNnvqG8YkuQft6H8SONlDlO9NcZEgBLgFy80nmnVW4N20eN8YwhxocY/Vdi/NA5yZ
 axyjnecGOTWZJwGnx9nt0vSUAuoujvHsI8XL/y52OOSb0gQ9+v5zrF3BeU303LLxziRG3XDu0H
 X4WkFUjTMxqrUxpOg2q6U1Nz3kN7uPA5XnUy97o/Usc6tuOLPyUTzcXNkQng+45bZjQ5BOulIU
 nhRk8K8k5MpCd1EpMOd43gQxXe6F9V+zlw9eur9F3UU/FxkzWtxGDZLXG+XvC1JxTULN/PteK2
 y10=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:49:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W270j4Jz1Rws0
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:49:19 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631828958; x=1634420959; bh=/By8hcMfszR6aj98qj
 gmS+3rf+WKkLvhUWvMd941eg4=; b=DmiLVcxsKs2AF4zmX77dECZgRWjHMNTcQA
 WvLfXIQ6/hKJhw0laUn0JCh88/mRh9XzQqAIyMDX+ab8N0c8zcqFX0ekm8D5WAC8
 URgEjoWhlonVHnFtJSn1RTzcjp1DoF45D68WDU0biWsTSw34XbzqePLnf0L5gdB+
 6X6Rfe/Ev38l7vZuerxl/FjZVOTRvpyPe4KWzj2XW077DwqdfE3zKURlodwf6njh
 nj11b6ZacbpvY4QJITN6ad2Rxdp6rGYImjSjqqc9B000foZeaMMgy6wwbKlzRI0J
 5O5I3RImmEe6XNUMl5ArTzw7GkXToFBbI2zITDD4BV77SnqoZAew==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id gWWbz0N1pDdS for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:49:18 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W230q46z1RvlX;
 Thu, 16 Sep 2021 14:49:14 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 01/21] target/riscv: Update the ePMP CSR address
Date: Fri, 17 Sep 2021 07:48:44 +1000
Message-Id: <20210916214904.734206-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

Update the ePMP CSRs to match the 0.9.3 ePMP spec
https://github.com/riscv/riscv-tee/blob/61455747230a26002d741f64879dd78cc=
9689323/Smepmp/Smepmp.pdf

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 28c908de60b9b04fa20e63d113885c98586053f3.1630543194.git.alist=
air.francis@wdc.com
---
 target/riscv/cpu_bits.h | 4 ++--
 target/riscv/cpu.c      | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7330ff5a19..ce9dcc030c 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -210,8 +210,8 @@
 #define CSR_MTVAL2          0x34b
=20
 /* Enhanced Physical Memory Protection (ePMP) */
-#define CSR_MSECCFG         0x390
-#define CSR_MSECCFGH        0x391
+#define CSR_MSECCFG         0x747
+#define CSR_MSECCFGH        0x757
 /* Physical Memory Protection */
 #define CSR_PMPCFG0         0x3a0
 #define CSR_PMPCFG1         0x3a1
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 13575c1408..d4d5961807 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -599,6 +599,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
=20
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVE=
C),
--=20
2.31.1


