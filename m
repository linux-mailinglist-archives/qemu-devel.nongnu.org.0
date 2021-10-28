Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D1D43DA96
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:54:21 +0200 (CEST)
Received: from localhost ([::1]:35748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxQi-0003KZ-TG
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxH4-0007xy-Bj
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:22 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:41722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxH0-0002ce-TM
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396259; x=1666932259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Af7wKlpUvnUSPSXLQm3DK7gy4CQ7wIfbpuX3QPuLXE=;
 b=Q1vYVciyIEOxTpK2L6vLJEBMBFbGT/ZX06HH9I4t1lzpSZ5Xugt6bQ8Q
 hVdNGf+1yKCkSZMYkscbmzaHmcLGyG8M1efrUskhADJ9xj4KUbRFpo+6F
 ItCyp/Mz61skrPLomxeatLsLyZq9sKJGkUTWhIKCt4kjZYmUKeddNQ6jR
 e+D3LygNCKcBHecPvDG14qEmL7eToBKbB+Db6MGvFn8erLSN/hJoiBwtC
 9yNqG6qKXi1yW5qEHEQrpzKRbJHBdtVjfId5kSfLzW3BhOi4Z+iguRAuy
 YJAINNuvnTDMq28EybOMZt3VY8UzhwxfJo2XOPn1UzGVBPo5saJoZz3b/ A==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="184975497"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:44:18 +0800
IronPort-SDR: BEPfRaPgr5mTov+zF86NkBY4Rz7PCvXSeIRlwpZj2TPPBww1M+uvVthkUL1IyuMPo49QvVruT9
 r4BlYjWIpaV9AgqhAo8uDqW6XXx+Vt7gRQEOlYiiQom9Jr7pfKAjxDUycuiux4r7DBtrpfJMRA
 2NX3G+ckj9OSwr5bzGnqpL3Usep3cmUJxAVR4Q8UzQpKe2zAISnyE0JPH73EvsxWZrT9tNOuIu
 NKbQAIsJ1roN3zQ9uk0cVZl7A7qZumZc4c6PainN0ftlBDOHUDDZr5Jfy46w39igtjE2vg8IJq
 vJg+iDc6tjUC/8AQODJKMXkC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:18:13 -0700
IronPort-SDR: lQryMSlC+jn3XT4WOWpVuHPigZL+R8o7L383IdzVCmlBlhyc1dK2PaQVCPpNEUALN9mSOIKj1X
 fNbvW0G+E2HptRYFOAV6WO0qJGfcbzXR7d67VPS+usYjpQCElzttymjOo8CigiZMqgs0ZXoWTJ
 uYGEGAlmjWgIUbhaTjo3Mang4r63kKJaBKWEbL+8x4rs7D3Ip51mlX5/tOEb262DaXl75zVy70
 uzkpe8f4a4LwJDgTt28oT4ubOBV8XFq5E09mXqYftpXVYd56vd0BZXSXpFZykgmTdves042cOG
 OuY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:44:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftJ15cMmz1RtVn
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:44:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1635396257; x=1637988258; bh=+Af7wKl
 pUvnUSPSXLQm3DK7gy4CQ7wIfbpuX3QPuLXE=; b=lNy7Te/0WWHm2OnNbKrzIbr
 oKfr5Rt2LxE0fo/UFhCsKVALdjWwOm0Lepy9miXyXtdAgJv6Ks+Co9RmjorU2SfV
 11BemrL9jaAzzNFJR6AnVZpagm+Q55kQPd2iOBBSqLKqvyInFS5QkO7CI3KH3UKD
 y4tzine4VHHMYIxcs6CR5kiRB+IpvY+8SnntCzd1FajpVt6K8vibJPBGVqoTWpHO
 r8yy2pJdGRwgJSO9TUX2kD0bjoMhy82IG8DMT8TxT9AssMtu5/Tg1AvfkXMKgPLi
 jOJo3DBGOdv5QNCUodYr7djSeD9ezg85gm/sMZqwCb8fkd/VZyT2rbh/Opwqh4g=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id T8dOE_BZ5Pcv for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:44:17 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftHx37Qwz1RtVl;
 Wed, 27 Oct 2021 21:44:12 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 05/18] hw/riscv: virt: Use the PLIC config helper function
Date: Thu, 28 Oct 2021 14:43:29 +1000
Message-Id: <20211028044342.3070385-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
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


