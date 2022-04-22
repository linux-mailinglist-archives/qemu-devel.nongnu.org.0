Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B62150ACE7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:44:04 +0200 (CEST)
Received: from localhost ([::1]:59312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhP1-0006qP-Eb
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIh-0006SO-AE
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:31 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:40381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIf-0005IK-O0
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587849; x=1682123849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JWxmFNSau1VM255ovVus2v4OCjvr7aukkRZmesszPmU=;
 b=N5S88OCISBbuNpcMT8J14TXh6nV2Yn60NfPKElI3Wx2frLbx/RCy/KnO
 UIQi7QErghcJY7hoOI36t+gChByb9nH8JZ9jI3we8qiYaI/j9ko9rWWI5
 eMd13JmgRc64nBaxv0S9BdcutosQNE4AN3Ak150lweUxmpJuWmMi38pNN
 cilevGm1bD8JTZj2xOvzaYonllVAYntKGnl+dO7gpMiPMtAXgELOcltbR
 IsHHhpTOzThO6/PWiYqzZg7ffIEK6u3mcOpYROysfPC3RhcuAaOBfLmZH
 KURs2VolPlNoMVi3tWcSquox/F2f7n/vyN2ZvPn5/6sIkUQwjo8AUCi7e Q==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="302715721"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:37:19 +0800
IronPort-SDR: zFuYBWpYCxo2C3NKWoeGdGeTssakK8bpP1cNWMHeIUQFee8k8kVG3YbYS2XbX0379J6RbV4jD3
 vjGprFjt1Ngn8sZF4KfO2M9vZD9nJB/fs+Y2MyFa5QirhDGv+iVlD+Io2uS1Zxs7LKKegAH6/B
 bXncsyySs1XTUm+j39a0Qvrp9adwzti5zeTWKqPpcHX86nj67oVZTA6np1PbmPa7leuplAXh93
 EQ48p7MmdYWVgMUncW/HoOF5fiDxnd+lMOqDhg16sjBgUnDThBLoghrVwHBNJXLjzPL4IUAcn1
 jmDyBvvXyZ52QjORFUPlF+T6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:07:35 -0700
IronPort-SDR: Q/hVoxUir1bNEoZ2WbSK1YTZbJ6kKXF1JeulSQn9W1UGT1ooPDXdEeqHtLKnFFLwP7sj6e5Z6y
 L3X9kMMfYAqyOWhBzQGdWVvKUON0lRe7flk3O8fyg+TeRj5sfw2a5y6aYZYQhOsV8fM271utcp
 iJLY5p/mi8AQxlelw7CtHF15exNBY/gfMaiOXd7Si3YTRNBOw6syEuXirIj5MftySQXBDS62bT
 4yw9jqlTcRxBc3RK6ijywxMe7sZ0s4/MwmPrmNWqW8QOq3mSgJnHXTrKcC0/wGF/HaaRZAer3r
 D4s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:37:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwTp5vXRz1Rvlx
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:37:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587838; x=1653179839; bh=JWxmFNSau1VM255ovV
 us2v4OCjvr7aukkRZmesszPmU=; b=YLJsxA2V2KOcPOzDf6ePOdUy32hi8tul98
 WXXHpN2YkKF+IylTH0wlyCYWnvoJbQb+owAsUHxkyJ/GSzbVUIyw1kERy7cgjFS3
 Gtr/aOl28KeHEyJlXK6yLBIyJoXq5CNqSGhy1o03Yw8U5DYn3AQQWVkAw5g7FRu5
 yLhe6rT60kbQior8EC+dlD+OeivqyorZO43IKCoVGxhsi0Yhc6vpfh5N8UjSgAmm
 7BNNC8MOzy9Z3DUQHPLqTtK3GBOzT0wmgcmf48qZ7VfTNmclIPWvuTX1F9IB4ic+
 5KVPe01z9qPBMAmBz1OFQNaQ0zFL5XI2MY8ZgohV+I3IpLD/wDbQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DaEoa-7ono93 for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:37:18 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwTl2Tzrz1SVp2;
 Thu, 21 Apr 2022 17:37:15 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 03/31] target/riscv: Define simpler privileged spec version
 numbering
Date: Fri, 22 Apr 2022 10:36:28 +1000
Message-Id: <20220422003656.1648121-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
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
index 72f1c9451e..345ec2c773 100644
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


