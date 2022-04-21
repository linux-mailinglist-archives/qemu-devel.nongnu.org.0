Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ED75097FF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 08:49:05 +0200 (CEST)
Received: from localhost ([::1]:47264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQci-0005mz-Ug
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 02:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQR2-0004r3-DR
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:00 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQR0-0007vC-Pu
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523018; x=1682059018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UFx0II7r+/IMMvsE44IscHFSDYBmBDBN4/jnXYV89rU=;
 b=HeZpHEnZcGp0qRUCtGIQpPei0qbG7FAQ2LpM3eVCsRJVDzvskx9Kl1W/
 +XDQUiKbBU8Tia42nHHjmPMgCQxfX0oZWeePFQyDMeGDkdATnF4TE9I9w
 MM1S+VE3CUhzKEA14EaGermPoTXj7bmxaRoVomWJEaasQoiM1lceDQjxr
 smScXXMqlklzHgivRYDH3zdr/k+4TWt39UH4JrGJHWlRaYjk96MWe7yNU
 YH+5tKyBufNNSrx/woo0FpDDpdFKIKoeBTB/cnGjQTH/3gDBBebiEmWu8
 fZnrulEBB/fTJOy8y96YXR3kfQ+9YiYphPaUscRNij7SaC2rphKR7U3ls g==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302639933"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:36:58 +0800
IronPort-SDR: 3/6jhgZ1iZzQvYE4VbKnkngwC1aDpOxNfrjDUwvXbBq2GGb1LCLjyVm7ACVsSbjNhXFyX2WehD
 aKU9s1IdRqIW4NfBlYIEtHXgSzE37iHuP6QS1eQVdFWykYnYJvmjuf17PgNlUBXq23CHids4dx
 gWCeOTmx1IIDSaxMuKMwqEAUcyr8xphX0dpVG7rfSgZ9rL9otoxhowGUkJOLJBriK2oqgOSTNl
 lz9g7OZ2rqlWb9EjqeD8U5r4WK+tiF0FxkO1TJHMkWDlrf4jNddISZEUdTnyjmk6OMCouYuZI2
 1YGIdOqZA4ek8RaReV/Why4k
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:00 -0700
IronPort-SDR: vj2ntjoAHUu59NLGFold9oAdeNDPdMt24+x4IcjgPtZ9WHrQxzNJkSWr33WcbTW8Xev1KlrS9H
 xsvuWz7uG2zPYGDuWRUKiqg0JeR3nCEAoLMpv5s6sMjVD89FsuDpab+QZRXldtVdur+hp3OiMT
 OV53bKAeBMJiqSXHSdyH41s43uepFrH7QAeBATRFkQ+Q7B122QKuVnWgP7IBC0aXtXLqqu4gV1
 W5V79Dllb7aknbMC3/Pc8aRjjdqyCN0TDHPW2QpKR3FUyY8yd1tsBCoG/sVcIKnD534iEnzAWJ
 KcM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:36:58 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSWF5bs4z1SVnx
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:36:57 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523017; x=1653115018; bh=UFx0II7r+/IMMvsE44
 IscHFSDYBmBDBN4/jnXYV89rU=; b=ZLAwDijsjeV3jKNgsCjrVmssL/cU+UkPld
 PPIdVhWz5RMhXvpyVtFjbJ3WBM7/1fDrEIeeCend6D3GczdjchOd8fIvjSkjGBAS
 uWNa9ZdaDBtl2p/yvH5H02/eJrV+je++Pl8A2pf5yvrvpmuk/aMHiULZLOcA5EXa
 ExlyWKHjNBhYkZvmte3h2FdRMQH/OIY1uqM01JdzwWw21wv2pUcxwotUzTaOIJQX
 AUVbE+mouCdja6Xo7QX2HfeD7aXmG46F+kYaIWO8OWIvgOr8B/X+FijLadAhaUJP
 jQX5WQ/IPwUqTqUR7RkOpz3xGSjJp+eHx8AmLPFPmiQcq4XfMoww==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id racnkTBpioUt for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:36:57 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSWB6zF0z1Rvlx;
 Wed, 20 Apr 2022 23:36:54 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 03/31] target/riscv: Define simpler privileged spec version
 numbering
Date: Thu, 21 Apr 2022 16:36:02 +1000
Message-Id: <20220421063630.1033608-4-alistair.francis@opensource.wdc.com>
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

Currently, the privileged specification version are defined in
a complex manner for no benefit.

Simplify it by changing it to a simple enum based on.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220303185440.512391-2-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e1d976bdef..0d63786ece 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -82,8 +82,11 @@ enum {
     RISCV_FEATURE_AIA
 };
=20
-#define PRIV_VERSION_1_10_0 0x00011000
-#define PRIV_VERSION_1_11_0 0x00011100
+/* Privileged specification version */
+enum {
+    PRIV_VERSION_1_10_0 =3D 0,
+    PRIV_VERSION_1_11_0,
+};
=20
 #define VEXT_VERSION_1_00_0 0x00010000
=20
--=20
2.35.1


