Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CAD495C5B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 09:52:51 +0100 (CET)
Received: from localhost ([::1]:42894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nApf8-0007Pn-AM
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 03:52:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn1C-0000Di-R7
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:33 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn18-0004KU-VI
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642745002; x=1674281002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kPpIa6xaQN7cp8WeCK4LvOeUCCQyxx8+e4FeLvMkpo8=;
 b=aEQ6bM8GDPn07HFQgj4HiSoQadTflVB6Z3vxYkkYAqydZ14bgB3eCCbg
 pSos+rd0iiF756eXzcyj9gRhJ4u72bjxxkuA7LX2CFjJYoFBGXUUbjqNo
 VERHAMYU2BctEiuVUb0rMAU0ODQXdrgA+0J9vXMI1J8zmVV8B9KcH4K3W
 eqEqEwghitPrP4WKF6x5IhSeaRlp6KjYa4RHNWHTfdo1L6dfYwXWSVVtE
 1OhhW7WJXckuyx28p/HY1YDP3P5zpQrTAGkczC+iB1R78qwUZPd8DaZbO
 ISazM5yLLhamMWbW4Yojin2k6RQjaTelk3E8mNCAXVl4XA0KTovtlMuwa g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083157"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:02:32 +0800
IronPort-SDR: rVHDWP4W/rCeRdWIHxVG89UpdXVevOIZPky4VeEWr6PKkTWcAd4yxEU9fdUPdqtVUfhyHCs3ZB
 GBG0cRi8r71mZm9EZySUjtrVCILUo00udbwUEf8pWPF38+Kae7ulnW+GWDIuzEt9W96bUAZ60S
 zU6KGjiMrW6ocMTP9cZMzZJGfcffrtLPOzyg+xRyualmZLGlA59ACCpms4pgjnDBKf/q9CNvzq
 26c1pZy4T1o4NnSkrRiCMLZG16RzyVOD6CkxPF3rkIfQ3wtt3kbNdqh9joUNO5CMCywbubWNsl
 062OPWpaXbhwX8wN0VdUBFws
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:36:00 -0800
IronPort-SDR: EHWhxL1DTXhEJI6igIyTk8wcVkWZU3kPOd8Koe1+nGKz/oKyVSYVrrrG5TpemUpccwSlYReGbx
 cusI4OYtjJLBTOcfZEy57f6TNGhyfX/fRvc6sRpu+z7uUYHZR0x6T/Xu4qeKLnulo85X5Kkr6c
 L10Jfpcy6ko/MElMrR/nomMj+up9lZtFVDJIWlHCfrKm7wxIeVyZxxnQvzA9bG0niHltZ5K7lT
 eeImu+CeMJMn5bD99hrMCkoOk5hPK13h8s9OPcWIZoZiCF0HPJhFKzJbZlLpUPEaf6G1HOX7IP
 BM8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:02:32 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg8142sMQz1SVp6
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:02:32 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744952; x=1645336953; bh=kPpIa6xaQN7cp8WeCK
 4LvOeUCCQyxx8+e4FeLvMkpo8=; b=pYuFJx64NXbUkElBhxLm+YaoqS1anGPSDD
 ELHDOHyOmRd0GauWdRAz/g6eXBo9YEU7Oi7+p4YEa21VG67mlXPeDwtGW9nUkmib
 jNCNRFWU9rQT9o5qSHdxLDbyvqoGBFLaZCLfF8Hm1IsHAV6hglLAXCDClDneKrpP
 daw8TGkDM2c/kVpzrqrKLM9YDUE0mrSv3kIlx+kgfrH9TvnxXK4f1dlGzpc4bBq5
 YzESAQQJ/19tUvI7IPPMK364L53d/PK+g21KUjk4G4i4A7v5fj46SAX6RPKKqXI+
 5wTE4y9N7qjOPqyfozpT9d4lHNvLdoXjv6NfXtF8VB8pjPnu/Vfw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 1BqeuKXoN6cz for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:02:32 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg8104L2bz1RvlN;
 Thu, 20 Jan 2022 22:02:28 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 55/61] target/riscv: Remove VILL field in VTYPE
Date: Fri, 21 Jan 2022 15:58:24 +1000
Message-Id: <20220121055830.3164408-56-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-18-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fe58ccaeae..55635d68d5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -111,7 +111,6 @@ FIELD(VTYPE, VTA, 6, 1)
 FIELD(VTYPE, VMA, 7, 1)
 FIELD(VTYPE, VEDIV, 8, 2)
 FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
-FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
=20
 struct CPURISCVState {
     target_ulong gpr[32];
--=20
2.31.1


