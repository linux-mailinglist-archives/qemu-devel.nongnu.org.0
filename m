Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A712D32D623
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:12:07 +0100 (CET)
Received: from localhost ([::1]:60572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpe2-0001Ze-Jk
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpHV-0002Ey-6W
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:50 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:44460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpHN-0007uj-Ok
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614869321; x=1646405321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+154BI+nKxwdWxvefRwGYHoR3tya+Z2RYt9fUUzVPZQ=;
 b=ACPc/usVmQluVvrKB3QEvpXeTe8hCyvwZ2Ot60byF/44s2wmgowAMe8w
 hqH4fhNlBOtacV1z9EjUGUZ2HnRWUK8v83dho9WCuEVpicKHLOGYAXsha
 Km3BxeYoEtB/OoXPMoIFzzXRxhdSHxZQyK3oDFzi1Fn67Vft8CS6IJg0j
 esQCpXJVPX05EJkIPSKpvshD1O7YT2wPLO8rFjWrlCcivSZcga/uZtbVO
 Vbfrua5nrhGNxFgHcxLBGIy3Wcny/eP3qJOnvd9SQaVL3xEzRCvLL35bF
 cf3I2IepXAv02maq/dgtN9EQHYEv6pqGsPRLInZyOhhKfQzF+bQDEYca1 Q==;
IronPort-SDR: XbWFzDl7oMMtkJsaEzqny01XDzbkIbl064GOamVFkwwVqHnd81KC6jjDIFTf0mGRzY68sFoHUC
 Q6ZGNcug8zj53QBWiomqf5aSkbY5h92vf37z4ZCKa9/Rd5t4ezIj9AHR6VvfPa6vNTGi6rxkdq
 pAk2VdlVSOrr1IImf2S86sVgEpciFUzI7PHMOizEZodY9yp/b26ugVUaosA1RmfUwzMeaCsaEf
 sP91yWHs2DMkRzYg7PAxW2QCO0sNPhTY+hEQp6h1uoRCnCUipjsKxpRBHKnwI2EYq7HbnQyR0b
 45k=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="271984430"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 22:48:23 +0800
IronPort-SDR: aR/rZ5iKtxonV33w8VBVhqQGVk/VFpb9TEg+F/wvkjwGu2sV7D7OjT1+bjT/qCcp8UbS/7DGz9
 pUAGWjHcyGwGFgV9PH/COd8Nbshsy74OfigFK0QgN8WcMLj+plHbMJi6Gg3JSDnwPj2WR0AUts
 q/9diSJ59UqZ1UP7LkRkgipR+/psUtv4S9aPPwZrrjJStCex7v2t4KlsM019q4UcewFOxIc65H
 uFk1a7sJONosI6gBAsGU4C8dNOWq37xR8LMJcW17IXfX0fO5QnfCh23R3VveONYGllkBOHxSO5
 N/P9WzQfbXAGT7yM6ZEOYZmd
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:29:37 -0800
IronPort-SDR: gdjL3uD6yYgAYqCVGBbNPAzSZri2NB2xTGy3b8ahAqCLckt7nj8Q01gqgjhauG64gMiGRRNe/k
 bhk9sxxmBzCPFJAVUWLUgpFwdENMvOzy8pUQHV6XMbv+k3jO0P0lvtUOFJOgpC0tHkRb5rv0MM
 Jrl5CpaND3AAVueD4LQPoU5MTdhQk5j/kXkY/UV4E2hrksYI778I+W86/qgy8tpHo3pEJZEUte
 qW7PAilTNrEgTz/CLBOgbZyyjylq8kFPoSnybW92XZ9M9+5T2LXhTRYLlD8/4YAJRHKRPeMMYe
 U/8=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:48:23 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 15/19] MAINTAINERS: Add a SiFive machine section
Date: Thu,  4 Mar 2021 09:46:47 -0500
Message-Id: <20210304144651.310037-16-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304144651.310037-1-alistair.francis@wdc.com>
References: <20210304144651.310037-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=690dc056c=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Message-id: 6bc077e5ae4a9512c8adf81ae194718f2f17c402.1612836645.git.alistair.francis@wdc.com
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b2aa18e1f..26c9454823 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1373,6 +1373,15 @@ F: include/hw/misc/mchp_pfsoc_dmc.h
 F: include/hw/misc/mchp_pfsoc_ioscb.h
 F: include/hw/misc/mchp_pfsoc_sysreg.h
 
+SiFive Machines
+M: Alistair Francis <Alistair.Francis@wdc.com>
+M: Bin Meng <bin.meng@windriver.com>
+M: Palmer Dabbelt <palmer@dabbelt.com>
+L: qemu-riscv@nongnu.org
+S: Supported
+F: hw/*/*sifive*.c
+F: include/hw/*/*sifive*.h
+
 RX Machines
 -----------
 rx-gdbsim
-- 
2.30.1


