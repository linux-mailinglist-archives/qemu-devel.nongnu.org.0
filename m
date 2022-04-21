Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A515509807
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 08:54:06 +0200 (CEST)
Received: from localhost ([::1]:55820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQhZ-0003ST-FC
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 02:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQR5-0004ti-0j
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:03 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQR3-0007vC-9n
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523021; x=1682059021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fhDY4ISUrE/lXX0U0FSMThvCPL/bGsVI5kG8GJaiJVw=;
 b=I4LwoSBrpBe1FdaSyYnc6jFsboLF3pPxSjV7lhxfycVAcKDx12bUkaKz
 UDMbGERSYyOfHVNeVg7sw4lUuk5m50ttVCkQedTM0OqBZ8CxqSFN3ptDi
 n7R9Uawg3wSy6FGeydgBST4Z6xA5wWL+dls7dGUCP6uuJZ+okaEA5i09D
 xgXjP60vuOXXzOCB15NhDSVlzep/vooEIyZSH4+OuTs21vUyC0mnik8ED
 jxH4k97afcglpIGuO8cTCAkD9iNX1JETscSNwWfSm4ipANQbCix58FjvT
 5sbBnskwY58u9K6cV2UXXPGfHLl7yffNe0xBPOZcccU0boyLunfycB0G8 Q==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302639936"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:00 +0800
IronPort-SDR: dPwsPvIZul9nrfzoXyC03eGY2tlljoN7aFMw6QeHa+VKqIjO/Ina3u93/Gx3VUtFQlKVz8xoFJ
 +8WwKx8ySSaJK0YfzZs4N+p6GdKh9d2yUieVLHEEKyMp6iIRkr/9V3dOythZdvBPVvEez3dR8M
 o/BWe1C+2FVau43RCIa4Ceh6JdNPmlQ/g7h3bHhyRyglUdsZi9mJn20RiMvsaLNfCDOp67NfFr
 /jp+hQ43UcZnD34P16+RX9h7QlIAIw14ZYBFT5n9hWKtkZTmt4KSfiuGsWA4CZsxZzWiN167mP
 JizMSkjJMEVUYW5txNQZKE+1
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:03 -0700
IronPort-SDR: mh+BQhfHH+eXZIJYcuREsrjfFxq0wht9JdGn8D59MfJ+3FCDriIIxtXVMEPFEeKtD/M0Grwtdl
 Lr/kA+2zHgAViCIBf5/1aXASxAEG6Bap2AEIcKy3PXo4Bcz+C78GCtcTeQZ6QE55J8FYNozqfx
 BfXFzHceiZLu+L/e3ohkWd7q+6ryleO68w/C7RBuDcRj/feN+LRpGF2YZGIKJVqtw58/Et0xF2
 aIQ7omhAGW7QdHlzTIKzla6jyNyR/LK3jfkAkKNEPdFr2eH/z/f/ZFfo3dg4wyX1VTnhzjKSoj
 aaQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:01 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSWJ2Rvfz1SVnx
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:00 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523020; x=1653115021; bh=fhDY4ISUrE/lXX0U0F
 SMThvCPL/bGsVI5kG8GJaiJVw=; b=BbzqKskniAnYP7TfDlRy1GIIN7RFAxu13M
 3IN4ISHBHhubgp++kQCbFfDl92beepX0j/hiUfCutogkzbvpFkWpv+9Y9Pu1U+3f
 NL2sPIUzxfEQ1EG1ktYrXKzc2mrk8kG0Jr8k5qwjENuK8lvvb+a7tmdIczSYKDa8
 fJkB/kSe/jO5Jb0JEXm9U8AxAuFEcJe1/C+UeOY3Tq/iYcHi3/SAfw/Y3zAMI9Al
 aYprYjcLexyy+OjsziT6/Wzi6pgr6YmgwqlR0iY5Ts9X721owJ18h3MlteIkNkjg
 4hNkTcbvslJvROGa821ybyT6lynKBTfTR7kfQzBNl9h3gyKPeR2A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id rTS58kmjRLPy for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:00 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSWG0JlDz1Rvlx;
 Wed, 20 Apr 2022 23:36:57 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 04/31] target/riscv: Add the privileged spec version 1.12.0
Date: Thu, 21 Apr 2022 16:36:03 +1000
Message-Id: <20220421063630.1033608-5-alistair.francis@opensource.wdc.com>
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

From: Atish Patra <atishp@rivosinc.com>

Add the definition for ratified privileged specification version v1.12

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220303185440.512391-3-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0d63786ece..0f3ed88f04 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -86,6 +86,7 @@ enum {
 enum {
     PRIV_VERSION_1_10_0 =3D 0,
     PRIV_VERSION_1_11_0,
+    PRIV_VERSION_1_12_0,
 };
=20
 #define VEXT_VERSION_1_00_0 0x00010000
--=20
2.35.1


