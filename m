Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7CF65FA1B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:23:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdDU-0002bv-Si; Thu, 05 Jan 2023 22:16:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdD2-0002Wa-8n
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:56 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdD0-0008VI-Iy
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974954; x=1704510954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Akt+fHBBG03s5d1Vt7caiACociOGNcNQuZJjqnQjCg=;
 b=OK0JMqhQtPu62HRk/VWkwMIOhmG8Y+ayJIPwkFxWoS7Y/5KiaTjyKAXE
 +x8YZbVVPh9MUsxYUFdEtMaIv0zlco7DXwusjbP3IxHXo0EkLdxuHT+vh
 rkLkZxCWSVDeZGJPGjtyB6uaNMdDV7+bHgYWLJfeJGBuOhbRTts5RA0GU
 R8M9mJmdbz3q2PPmsp3x0J7Z5+DxWFF4GSaEYMrUNeBPpdZerabQM3dNX
 fm3InOdb7pdDpe0ueCz6OwNghb3b1GKxcadOvnQ61xnWjv2adqXzVdUKf
 F+maNHiGvjGU7C0I9AsPfVlcJtCAeQNe+oq4h/ekB/zvX98xuTdmgMq0D w==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254820"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:56 +0800
IronPort-SDR: DZMEz1kObZiUUy2l0l8gmpsEmNyiMONN3GEwsP+ozUFHEt0in+S/tixaGDQadsFOoq7Rb7yJim
 SO/vxe+Udb7PGF/heZRAeluBiPAB4GMUUg+GCE3Anv8Ds5Wt2iobnm4K41ZDHiZQo8VY+ZNR/g
 035/2IiAUO87jBD7+DEhcRIbtaHoJgFA5Hl5+ePZl+JDBCm/HL01IMUJ2XncSTjF8IF3muLAQ/
 muHdz/KCimrQ7sbLRKcy6r2k1gLDjkko/ExAbEv3x2fDUoXG7/18/Q2uOs7x8IJWCbkLGn6GA/
 fQo=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:27:08 -0800
IronPort-SDR: 8rO4BkLNtpOvA6zLAlPw5eJS11BfNEe8gpcY+oizj4oTeYnvZekL2YoXLqztDUQ/4ZUUIgIN82
 CNrIdCE0EOumHPi77rnJJ406jL/hLndHkC6XaC8iWxCFnJ65PISZiDhgI/FkHh+TPeuCd3Ul2r
 nM1XXtwc+3E947ULcUjgUCKyPeJyZlMkfFCUfd4sEms/amlVLuHQFN7zJacrVngaXDKfwW897B
 6o+j7oUsspbwju1O6jI8MA9On1Vt0xZAmUYJrIocWeXwDf89G10cF7ZgoCGDFpkQ94K4GAxx3y
 5Eg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:58 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7k86ZGlz1RvTr
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:56 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974896; x=1675566897; bh=1Akt+fHBBG03s5d1Vt
 7caiACociOGNcNQuZJjqnQjCg=; b=o3c+1EXIHSqKyJzD/sVPAbe1XMeD6+iBq8
 4ZiX1qobReS6hPjm7+AlO+AyyUvhwUafSfK1ggh4T0Th4kLyi3mxXdn/jClgemaP
 LMSegXX9MgmLqKCfnJYhhRK/GK3M5TKuKWBaoPYqzRfgKPzPgMqYa+I8VAQosmiA
 Ek8+JywlKQABR0NUoz9Z4guyH6VSk0OvNR281g/97BpI6pjvv8ZRGvNa5rHAIiCY
 svWxiIEGt/5zYPs8SZ52WVl/xOn+TMZKjnGxMt4rygOav2S90SLrKH07xulSl0MC
 wvGi8wKM8IKDT9eRjBRLaqhJPFg1kwIZwWYkZTSMPnjTWnEWQUSw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id AwyV6izmJbWX for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:56 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7k70xphz1RwtC;
 Thu,  5 Jan 2023 19:14:54 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 30/43] hw/riscv: Fix opentitan dependency to SIFIVE_PLIC
Date: Fri,  6 Jan 2023 13:13:44 +1000
Message-Id: <20230106031357.777790-31-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

Since commit ef6310064820 ("hw/riscv: opentitan: Update to the latest bui=
ld")
the IBEX PLIC model was replaced with the SiFive PLIC model in the
'opentitan' machine but we forgot the add the dependency there.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-3-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 167dc4cca6..1e4b58024f 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -19,6 +19,7 @@ config MICROCHIP_PFSOC
 config OPENTITAN
     bool
     select IBEX
+    select SIFIVE_PLIC
     select UNIMP
=20
 config SHAKTI_C
--=20
2.39.0


