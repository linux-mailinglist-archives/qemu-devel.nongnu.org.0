Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D17543F7DE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:31:36 +0200 (CEST)
Received: from localhost ([::1]:60316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMMQ-0000GV-PL
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM38-0001Bc-H4
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:11:38 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:31542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM35-0005Io-0U
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491494; x=1667027494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jp9UVWaLwVNIzQpBAwcwf23Ysj/NKdZvzmtw/yFvBeM=;
 b=ORXG+qCxdN/Ix88mSiqjH1p8rtk+enbbDlfeBUOcq4PHniqRV2HC8ARc
 Ji0jqbpiOuedbcOy2Lcygqg/wj7enAw42AE3VcgnhGoOQIt/T4Ze3fkFh
 0RUznZg2m+BUWrGqtGc29GSEUCv2GtAfHtpMPqOYq6kbgsyrCP3Zg39VE
 rsiTFiG1HWAasyvdEwCk4vTTPODytyknMM+02iTlQ1D0fi/Sa2M3VN23q
 9nyLq6FyDGrVfIKvuPzYawP/+4Ft/GzSMt2Y4f7YdQVrwAuqiZ0ViNahw
 mm4eVMjsg9rozAtAheDrcw6SUARqGyB2/tosk6y6kpbkmGckYcMFx1ldX A==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="183153606"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:11:33 +0800
IronPort-SDR: U+kkTMLQWLJxOjamX2Q/JUPtyMVZhNXnJzw4XzUuboKXQwUNmF8i0y4XmCKzr8GjxOyjOWFiVr
 Rk4QLfxqme8F2yGeHVt7BvJhPEca+2R4uGqOnm9qz4JahWNNnjWPGgPLO6e9P9HiHDE3D+I6WG
 zPDcscTT1Ye4k6FOJYfZjI9MLULnZ47bfKHhEbhAUR/d0WQtc3Z6ABKElvbkyW4jC79B2X1ouD
 owwdm6pmKaqF7WSZy8AlB+q5EDBGcBn4FdvkvnJPGKtHkcmIend0Wod0HFh8SobmxyfoObYmWn
 olfo54epUwrdi5eMVN/IgdUr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:45:26 -0700
IronPort-SDR: 82zngo+l5zgsZIos5KRz9XICk8y6RgxOyj3l1ZpcVI71NkQdDum5EfxZVbQzwGKsbM/B0RQjO2
 GCG48xC3Es86wNUFE8UZk3P8ZICLd6IphffFBz4forHVyAuO3PbKDEAI/NAjDSD1IjIFPQF8rZ
 ml7brwDlpoDGfGgubCigs8EyLw3vXy1vadlxSCSvq0vNBtGqKhLd57xr9UqhpdT9JQaCIDN7Et
 mgC7h1aCrwT7wnCst72LuTkmHuSM4AqrLW/GSYOzV2kRnRzY7XWgZLm3TxHskEFC8lZxe05ptS
 7mk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:11:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYWT23mqz1RtVv
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:11:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635491492; x=1638083493; bh=Jp9UVWaLwVNIzQpBAw
 cwf23Ysj/NKdZvzmtw/yFvBeM=; b=bXx/Pp2IorbXsPAENG6aod5Qti2SHiD+sy
 2KC7bVZUDbIP2QKUcSaMhSAqJj3Tbn+/qS0klBMeN8otim4sOTfH5xTsapYuxIGm
 nDbIyrJOUbkPva+62H7JlqXfVjAJOmAh8OJG3Id99t6tZQKM2E3NM5DXhyoNnWIh
 FA14xBDihIQJotfSm6thtB8lwpm182jF2kMjBPnrrbb+t6sqv8y9i4WdZ8ZIKvGO
 yN6Rm3Ml4yZxHLxL+LYwXbJvRHEqyEriNTK2/3xX7RUmBVeDqt7xhxuIboeKKwHy
 vNP5HW6wmlyVAWTq85OrVPZTxbYdM+yDWoV5d+EyOzCo2n4DdlwQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id pMFaRL5AuAby for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:11:32 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYWM3DFmz1RtVl;
 Fri, 29 Oct 2021 00:11:26 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alexey Baturo <baturo.alexey@gmail.com>,
 Alexey Baturo <space.monkey.delivers@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 07/18] target/riscv: Add J-extension into RISC-V
Date: Fri, 29 Oct 2021 17:08:06 +1000
Message-Id: <20211029070817.100529-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20211025173609.2724490-2-space.monkey.delivers@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a33dc30be8..1cfc6a53a0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -65,6 +65,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVJ RV('J')
=20
 /* S extension denotes that Supervisor mode exists, however it is possib=
le
    to have a core that support S mode but does not have an MMU and there
@@ -291,6 +292,7 @@ struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_h;
+        bool ext_j;
         bool ext_v;
         bool ext_zba;
         bool ext_zbb;
--=20
2.31.1


