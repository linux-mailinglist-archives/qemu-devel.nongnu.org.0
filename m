Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC3A3FD11C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:14:29 +0200 (CEST)
Received: from localhost ([::1]:52228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFlf-0008IV-3L
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFiL-0005NI-Ho
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:57 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:34213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFiC-0007r2-BI
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462249; x=1661998249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YR30PYrF3PGlyIcK6BYY0SsyqtN0OiW/JPVt8EMrx+g=;
 b=jBjoKS1TIHREb3SnL7wVr343A+H7aaonQv5ASmlhXJymaYZnCsUIwQeN
 MZS9xULve8hO4BPhtTUbHbj1e5MFUF7hXSxwWhjBoPGit/oVv1c2XLSeN
 TCYlkua2kLfHTx23pc9f08rXJm7cx/XWQSPa3SBLnmSFJERw8PhmiuaQ8
 aWlHSG3bPZRqi6CpUlmv1kN/2SqBnGEpzE05yxsSynsdNuV2a7RJfQfpA
 qcor3fPnVhJD3XbcHSbGJYIm12foZfrbr+edUP0spfsVxgttZozZY+TKF
 zHhj2WXbyWqsKgrQv02iiLn8KGdPEv5LhPTE44UdhRK3hzcRtTkSDdv2Y g==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="179452348"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:10:46 +0800
IronPort-SDR: 0E41vbyG7Z+xZKDFGUeJxz9k3y+/kegJ9y4UF2USvTRp+VtFOLoK5Age6Jkw7Sx763472h/f47
 0YwSBYJbVyIBdav8deAnx0WGvPrZlJ4fpBmkPF8jjwpGHFiMgQTX19/3ghFvOkH6lr2NlifJbo
 FYbbOFoW0ex9hn8GEhHPlOYTX7HZ6xy4DmYrxLPVXClsXYOiIL8mXLSRCLPKJyz0aVul817rWT
 oT75qfMqSkjtZNiPLxfz+5GduGoOKnjqvSzCigdhSBNUFbKacia55cbH0dVJ87DCRyk8PxMkUM
 8Wb5CHDVfMTC2UyO0EgVZQBT
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:47:33 -0700
IronPort-SDR: T/H0/gBCri9XDtoqdAxomP7Z+SOYoiGwdtQVA4dRda8Re5Cw9Hn2Ci6xqg8xAv6CMaMVaPpO3g
 JMehklw8iBPZya9jvmBI9Fv+E+0BHMUpUBycJzF4+8F9N1gKd6EVDDRk1Z9k70KSIB5TuTGu9X
 IlLENGvqbQxyNFjTSy5zMQ68KAQQSlZe6LGgf4vQdQwparpcmfmdMhLaFICTFHHEWUJbnVvA87
 135LJU2U0E45gr+fiWaQvBfiqM4TfHqWW3+CcOG9SQCwLB1qPtUOtQ4bpxRp3fG5Ln49eihXrc
 Y64=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:10:45 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gznb92V3xz1Rvm0
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:10:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1630462244; x=1633054245; bh=YR30PYr
 F3PGlyIcK6BYY0SsyqtN0OiW/JPVt8EMrx+g=; b=W1daSPbj5SW8LiW37kazue8
 kaNWMATycann1O4koLonnC3s6tPNHw+FXL57+b+1nagQgjt9UjM5SsMFUazyGI2D
 0ZICuWK3A07LoydpMP+3EYd6S6soVfUDAeLAysMOJMTgSCHuZlANeCUWrcakQdgj
 kg+LOiAPBq8nWzj8qmrtoBmM4tS8DEflo8fH+zNTM8528DFGbg85j+oat4IiZn/A
 pSZ+Q+XdGSzLSzFr1itAZm0w9vSO7N8Ik1i4JIO1AkInox3AwjlOfiVJq36dhhKl
 RAE/75hLzPdGxZMuueVPFZisp181m91Cle80ICHA1SpR7bVDpCp9pkItuaIIvug=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id mWtJuKNPlZkZ for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:10:44 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gznb44T3Jz1Rvl9;
 Tue, 31 Aug 2021 19:10:40 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 06/33] hw/riscv/virt.c: Assemble plic_hart_config string with
 g_strjoinv()
Date: Wed,  1 Sep 2021 12:09:31 +1000
Message-Id: <20210901020958.458454-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Peter Maydell <peter.maydell@linaro.org>

In the riscv virt machine init function, We assemble a string
plic_hart_config which is a comma-separated list of N copies of the
VIRT_PLIC_HART_CONFIG string.  The code that does this has a
misunderstanding of the strncat() length argument.  If the source
string is too large strncat() will write a maximum of length+1 bytes
(length bytes from the source string plus a trailing NUL), but the
code here assumes that it will write only length bytes at most.

This isn't an actual bug because the code has correctly precalculated
the amount of memory it needs to allocate so that it will never be
too small (i.e.  we could have used plain old strcat()), but it does
mean that the code looks like it has a guard against accidental
overrun when it doesn't.

Rewrite the string handling here to use the glib g_strjoinv()
function, which means we don't need to do careful accountancy of
string lengths, and makes it clearer that what we're doing is
"create a comma-separated string".

Fixes: Coverity 1460752
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210812144647.10516-1-peter.maydell@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index aa279c1bb6..5624adda58 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -540,6 +540,24 @@ static FWCfgState *create_fw_cfg(const MachineState =
*mc)
     return fw_cfg;
 }
=20
+/*
+ * Return the per-socket PLIC hart topology configuration string
+ * (caller must free with g_free())
+ */
+static char *plic_hart_config_string(int hart_count)
+{
+    g_autofree const char **vals =3D g_new(const char *, hart_count + 1)=
;
+    int i;
+
+    for (i =3D 0; i < hart_count; i++) {
+        vals[i] =3D VIRT_PLIC_HART_CONFIG;
+    }
+    vals[i] =3D NULL;
+
+    /* g_strjoinv() obliges us to cast away const here */
+    return g_strjoinv(",", (char **)vals);
+}
+
 static void virt_machine_init(MachineState *machine)
 {
     const MemMapEntry *memmap =3D virt_memmap;
@@ -548,13 +566,12 @@ static void virt_machine_init(MachineState *machine=
)
     MemoryRegion *main_mem =3D g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
     char *plic_hart_config, *soc_name;
-    size_t plic_hart_config_len;
     target_ulong start_addr =3D memmap[VIRT_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
     DeviceState *mmio_plic, *virtio_plic, *pcie_plic;
-    int i, j, base_hartid, hart_count;
+    int i, base_hartid, hart_count;
=20
     /* Check socket count limit */
     if (VIRT_SOCKETS_MAX < riscv_socket_count(machine)) {
@@ -603,17 +620,7 @@ static void virt_machine_init(MachineState *machine)
             SIFIVE_CLINT_TIMEBASE_FREQ, true);
=20
         /* Per-socket PLIC hart topology configuration string */
-        plic_hart_config_len =3D
-            (strlen(VIRT_PLIC_HART_CONFIG) + 1) * hart_count;
-        plic_hart_config =3D g_malloc0(plic_hart_config_len);
-        for (j =3D 0; j < hart_count; j++) {
-            if (j !=3D 0) {
-                strncat(plic_hart_config, ",", plic_hart_config_len);
-            }
-            strncat(plic_hart_config, VIRT_PLIC_HART_CONFIG,
-                plic_hart_config_len);
-            plic_hart_config_len -=3D (strlen(VIRT_PLIC_HART_CONFIG) + 1=
);
-        }
+        plic_hart_config =3D plic_hart_config_string(hart_count);
=20
         /* Per-socket PLIC */
         s->plic[i] =3D sifive_plic_create(
--=20
2.31.1


