Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43E568D045
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:12:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7b-0006cC-0W; Tue, 07 Feb 2023 02:10:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7Z-0006ai-7e
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:29 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7X-0000FD-6G
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753827; x=1707289827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i3jyVH42dWdZtSPx48n7LFjkwh5MUBQs17SstM1e2fY=;
 b=Cc6WEANPmY8PtBsRgqGrNrGUR54MzmB9GjJjR2wrd5BCO1vi/1pjL6YV
 G8Q6UpaCpHcg7lb6uSevUEQU+v0NAgDRvXTNlgHefwGI1GYC/Kp9HSK5q
 AFEg9beqy0NMqetNo9sAi4N/n0zUBv2o9ks/huAPmz9RMq3hOiZtApwpR
 vSvA3NdAsf7BPhf7+4RjRKr5wDAFNjYbvwhF+VB8rLtXJnWz4+PyRunZ/
 JTRi7tkHkKxADN2MIRy+0ldxluHuDwZD2cufLTuNId9AhjbGfHp5OyifV
 RW1p6qOxvPC3ktUUhpMYn4ryi2JduVKt5yyjUtNDHdFpEjg7fI2y2brTK g==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657494"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:12 +0800
IronPort-SDR: xS3kMRQvnKcGnbRE28QaCip6qEsGbEHblv7gbWDWjt6jPL/3mOATiri3A0Mbf4B0BELgLYn6tB
 UZgHcqv26ACvZy6wtzpaLios988HhwPdSO1babDAzKTTUJW+7urogWYBsFrHyLWzS1IwnB3D9V
 Uzap5+W4aQvVNLI3nIBXucfvwb/Od2g8rYchySQl1LiiI7Hw9EMbTSIM42sXyMs9TxPWwpPFBz
 eOH+O5YnmKiLibEFNCpFMCofvrMsGTkWJYY0p/G01mLUYQRAWtmMp3Gkjyzi0uxXxMw57wRFCG
 3QQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:29 -0800
IronPort-SDR: 0T2K9L4J5rkB5GFAiy890SdHC2l6nsqV06uKnGmlelDFUJ+l1AYUFq3O/58r4FhwwcJsrPs1f7
 sURacutALX2lu70IooettBq/YbFo9Hm2OhGRvACzh3OXQ7INkSPOGxSkkaoFNPiPFAhA17l8Qs
 X600WTHxlirLgvk6JoJ6aZMwla2JTjHFI9U2Sm+08QDcbZAqMsHW8/CizunJh3KVHoZ26ZZ3Bu
 w01vjIUslyYY3eBfO688y80KnrPcIfyMdvkwu9djB4+YMAcDBRVrGRH4BoIFMznkuofqkvqHKG
 /G4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:12 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vQr2hT7z1RvTp
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:12 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1675753812; x=1678345813; bh=i3jyVH42dWdZtSPx48
 n7LFjkwh5MUBQs17SstM1e2fY=; b=gaZ2VvFc6j7Bc5zbCI1EykDq4w8XjwRrIg
 koSmupJl9P5KShS1JuSarEwOk79kfXfNNA047BP2LmmGgi8b+w/MnJsSQlivLiah
 WxhjGTQRfEO0rcrUw6EPuy3tybV+NRxaaIbF6bLK/gfJ0UMPp9UvS2Iskv2oMgFw
 TR1pCkv5WYgcW3JDOMCa3dHpMRSHporq0XN0iazEHiPi/Ert7I6taWWbcQc1ZmI2
 8lm/K8gwn/jz/XUqsthjtfKBGL9DPA5MjLIlIbOttwKfPrhhRaxIemdZ8TscKSMa
 Zm4L2uTpjnYyrvWc5FPm8w0HZsesKGxLfwbM5hVHXCf3IZte1E7g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id dvGRTpoI0Mt1 for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:12 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vQp5Wn1z1RvTr;
 Mon,  6 Feb 2023 23:10:10 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 12/32] hw/riscv/boot.c: calculate fdt size after fdt_pack()
Date: Tue,  7 Feb 2023 17:09:23 +1000
Message-Id: <20230207070943.2558857-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

fdt_pack() can change the fdt size, meaning that fdt_totalsize() can
contain a now deprecated (bigger) value.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230201171212.1219375-2-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index cb27798a25..2d03a9a921 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -253,8 +253,13 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t m=
em_size, void *fdt)
 {
     uint64_t temp, fdt_addr;
     hwaddr dram_end =3D dram_base + mem_size;
-    int ret, fdtsize =3D fdt_totalsize(fdt);
+    int ret =3D fdt_pack(fdt);
+    int fdtsize;
=20
+    /* Should only fail if we've built a corrupted tree */
+    g_assert(ret =3D=3D 0);
+
+    fdtsize =3D fdt_totalsize(fdt);
     if (fdtsize <=3D 0) {
         error_report("invalid device-tree");
         exit(1);
@@ -269,9 +274,6 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t me=
m_size, void *fdt)
     temp =3D (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram=
_end;
     fdt_addr =3D QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
=20
-    ret =3D fdt_pack(fdt);
-    /* Should only fail if we've built a corrupted tree */
-    g_assert(ret =3D=3D 0);
     /* copy in the device tree */
     qemu_fdt_dumpdtb(fdt, fdtsize);
=20
--=20
2.39.1


