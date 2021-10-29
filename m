Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A827D43F7D8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:27:14 +0200 (CEST)
Received: from localhost ([::1]:52702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMID-0003TV-N8
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM2w-0000rQ-Ha
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:11:26 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:21725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM2t-0004tB-FY
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491483; x=1667027483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Af7wKlpUvnUSPSXLQm3DK7gy4CQ7wIfbpuX3QPuLXE=;
 b=kotCn8uJCLR6IgBp8/9TBpjc0l5WlUznCHn5Coqm3F4qf8a/kbLAjHx/
 rCt9o4fxzaviyQ8PxXzN5NLegEEqig9jdFL3tk9siyckfPQdj4SWVSHhl
 bT4tYZD8xT2zkHfwXCTD8utNlY1I6VKiaUq3XBJbBT8NH94xuoYfWOXOf
 KelJMIL9+ptguf5cvffKWw8+U72JI3WybtK5fRoWwdLEgJNbMHdThWmRB
 ypF1akuX4D3Iv7PEjC1uASKHCPqVOGEH8adWFV8V0n0it1Kki+4M+GtKK
 5IUlMOVpYUiNNxRdsZP4o9robeA3PzfrnmkQkWoHKxu+awTEC4YE8mGmt Q==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="185100400"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:11:23 +0800
IronPort-SDR: 2Ic2GFn03uoMp3RyzXJF6p6ZCFjPyjXdrs7BX7cM/xbiEh+5gqrxfIM8xCGkZVGVlnLMJsj3aD
 0O4V3JnPABgvYF1zBuBMS4uu+MUSFY90hEGSLeE204CU0WUZKXfmHoIMifZ8wKB7VoTY5PTgyS
 ydp8bBKYNNt4aslNhmoux55FkBCxS5v1nhwi9WuaHt4/Msvg53+R8qX047Xo+ZUmhb0cQPuKNn
 zVLtkWtTrS9IcBkC0G4TEhaGzqLfcNEW21WkORFjJG52Fo4K0XzmfusXRm7E/4ZaAlpGMVWvcM
 78rEv8Zsr5I07RVH6K+Q5+3V
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:45:16 -0700
IronPort-SDR: IpvgN95aYua5VJzyEUEWZbADGgnEdUv2GO3VI36Aa4iO+qdxOcHrWx7ursROGhMz1ZRmDphXuf
 FXQPMwMx1DzAdkPv4CH/7dwtUkRHNV25Ba0QhyzOeZTSMOc9HmbdoxbmebnqQEfSO7QJ0C4GeL
 W0v/4Wb14aNCJltUrcjJa7C5eoqKPpGTPN3K6nZbS26XNdpCWu/5wyjd0fC0bhhiFLUNuHdFqv
 kCkF/SJFTXAz2kSTF7pvhnq8y1zxC6cmHJj/zHfcD+YwhEOkEO0LKbywJmH2A3bbGYljkMopOn
 pEg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:11:23 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYWG3hbHz1RtVn
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:11:22 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1635491482; x=1638083483; bh=+Af7wKl
 pUvnUSPSXLQm3DK7gy4CQ7wIfbpuX3QPuLXE=; b=Ar+XycbD5YpThXbxmaikfjr
 p+fjiQc22xvVXPxMCqCnlbC2SJG/02qqQssCGJ3HfBkoGWOIAtEA8BpBWndVMBLm
 6boPcXKvzsdEsOBR+4ydQh9ux7KcanowRSsXcFQfar6khpeEwbbtzcPvq6TQeVYV
 /DT5HeFVCgL+V2LbQuTrxbVPGP1PqZTOgKFNBEV9/IZc8ZO9F7HbG38s2QkUUiMr
 D91FwSq/O88TAOgEELo3Y27MEsW7EuIPlHdUjOh+Q+xHETWOyYOBC63kmHcOIzuU
 nGXJtH1oTKm62ITkQKBkkXnaDy2L7xJQpVGvcN9dq3f8vNM/SkONMUwyGeUL0JQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id TpEc52IU9-xr for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:11:22 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYWB5Shwz1RtVl;
 Fri, 29 Oct 2021 00:11:18 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 05/18] hw/riscv: virt: Use the PLIC config helper function
Date: Fri, 29 Oct 2021 17:08:04 +1000
Message-Id: <20211029070817.100529-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20211022060133.3045020-5-alistair.francis@opensource.wdc.com
---
 hw/riscv/virt.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 28a5909a3b..3af074148e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -748,24 +748,6 @@ static FWCfgState *create_fw_cfg(const MachineState =
*mc)
     return fw_cfg;
 }
=20
-/*
- * Return the per-socket PLIC hart topology configuration string
- * (caller must free with g_free())
- */
-static char *plic_hart_config_string(int hart_count)
-{
-    g_autofree const char **vals =3D g_new(const char *, hart_count + 1)=
;
-    int i;
-
-    for (i =3D 0; i < hart_count; i++) {
-        vals[i] =3D "MS";
-    }
-    vals[i] =3D NULL;
-
-    /* g_strjoinv() obliges us to cast away const here */
-    return g_strjoinv(",", (char **)vals);
-}
-
 static void virt_machine_init(MachineState *machine)
 {
     const MemMapEntry *memmap =3D virt_memmap;
@@ -839,7 +821,7 @@ static void virt_machine_init(MachineState *machine)
         }
=20
         /* Per-socket PLIC hart topology configuration string */
-        plic_hart_config =3D plic_hart_config_string(hart_count);
+        plic_hart_config =3D riscv_plic_hart_config_string(hart_count);
=20
         /* Per-socket PLIC */
         s->plic[i] =3D sifive_plic_create(
--=20
2.31.1


