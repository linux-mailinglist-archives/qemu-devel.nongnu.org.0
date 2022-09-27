Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5315EBB6A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:22:40 +0200 (CEST)
Received: from localhost ([::1]:43998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4vP-00056J-E6
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od488-0005WG-FT
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:44 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od486-0001I9-PI
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260302; x=1695796302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QyBVGcd6Cwcjc0ADM0uVkz/DPsRMQf9EmyGrDa37jrI=;
 b=n2PTQzcjxyqBypi7hbYUZtp2W/vgCaJc3UPN0P8h0kuQMqBHrB+WITrH
 DUV+DOB1PKKe8wDEJIihJ/l0Zt0bjIttushPb9hVA/2SYXWZN1CUKuOY8
 R1tYAHpoFKkK8cuJn++oQ17woi8tquEWr9QdxlfOLdlNi2wjfBrE9ZyV7
 qTh8td/33UVhIjQj8mcK/XTNUBYG414Dztc0AYOg/8ZLGwXoeCaUw9Crf
 VLJLzXUmyp2npPwEix6qk4if7AIR69/bsGw8Hz9GCovKUPz4GoUnKgbyd
 67TDKIrfyiYJ12nmTgVH9YK6zs1gqcxW/OcsbjXW0UbsM/CQuqrGyRzva w==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530894"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:31 +0800
IronPort-SDR: RPTHwMQdslSMwZCK6pvJV4PFmAcAHyjB1s3gPYsPEeUb7xFe2oajGIG3bMh/cSy/D6KyzvPQS1
 l/ZCvWhDeIxWQD3CezK8BrGBcbSofYWl98s3NoksN4CjcCWcZ4peRzqRMSjFBzv1gGgG5TOQUg
 NMxyUyeYk0Y/iPJIXH5tkjDRxuk7KV42lxx7qja7XoFO5rXNPKTLKsOZcs0L70dV1iuhfhs1FK
 hptCcwCf2t2BgPKBMRPfTjvQvw/RJYK541e+AnxOmNS2rdXIXAab5nQ22cTTKAOwSH/nQTXAie
 sfuqQzPVIhfwqACSJ5gFsq1t
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:28 -0700
IronPort-SDR: AfW1mcIJaCukd8KdHq7z7xhdJalzVpGHzODaVGZUVZbUrxWGZ2k8jTG0kC0OfHXxJy3luaBbro
 F36aierHJlcBuQTtU/RemfEGN4SPvmjnHxRN6/iXLUAdE9iqrcQhsTAJBA/bCfMU75eD8nCP7r
 DAhH9fz1VPKZH01HNYk1yfMG3sLP5jAFEKf4TYFpEUCOC67kxgjUsrBk6yC9bPdJM2ZGEN073V
 5eNMbHMNDiQYzIaYpDPVZji//5jIEHOqlIvl+Zs1czGKqFnogd07pioenoHAPenTMlomEoGzgb
 qCA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:29 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sY3LfHz1RwqL
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:29 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1664260289; x=1666852290; bh=QyBVGcd
 6Cwcjc0ADM0uVkz/DPsRMQf9EmyGrDa37jrI=; b=hWYAUtVSO44Ty+KY7Av1Gzq
 XVo8sKbwyFjd7g8Cc9ubFUbBjaEt/pPggWc8Jafoc5PMn+Ikg2V1GfszBtDescks
 +QIogl7XpBBB/YDpXUJqyg7q+zCnWIciW84lR8ogiyueKoMz9Xfz7U2W3f+xR9e0
 7390GPfL04ZyDGMBURNQ2PKUmKE+NkzKRZgB4FX8HBWqglspKpotmNTYcy5h9HKQ
 S1yiiS7Ud/9EgQGZuhVbyVhRMSzh41rakVjQI2w1lb61pIocpRFv04VF6U3vyqBo
 VdvpVUFObdLRE+hjgvZ2rVWyQFm2mbIBGF/szYbUSgDQ9r6bLIzgSPW4sgT8dMw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id QHr8etx1G4v0 for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:29 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sW4vrZz1RvLy;
 Mon, 26 Sep 2022 23:31:27 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bernhard Beschow <shentey@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL v2 12/22] hw/riscv/sifive_e: Fix inheritance of SiFiveEState
Date: Tue, 27 Sep 2022 16:30:54 +1000
Message-Id: <20220927063104.2846825-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Bernhard Beschow <shentey@gmail.com>

SiFiveEState inherits from SysBusDevice while it's TypeInfo claims it to
inherit from TYPE_MACHINE. This is an inconsistency which can cause
undefined behavior such as memory corruption.

Change SiFiveEState to inherit from MachineState since it is registered
as a machine.

Fixes: 0869490b1c ("riscv: sifive_e: Manually define the machine")

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20220922075232.33653-1-shentey@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/sifive_e.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 83604da805..d738745925 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -22,6 +22,7 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_cpu.h"
 #include "hw/gpio/sifive_gpio.h"
+#include "hw/boards.h"
=20
 #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
 #define RISCV_E_SOC(obj) \
@@ -41,7 +42,7 @@ typedef struct SiFiveESoCState {
=20
 typedef struct SiFiveEState {
     /*< private >*/
-    SysBusDevice parent_obj;
+    MachineState parent_obj;
=20
     /*< public >*/
     SiFiveESoCState soc;
--=20
2.37.3


