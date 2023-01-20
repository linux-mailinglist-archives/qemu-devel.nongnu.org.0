Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106B674E73
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:44:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm1i-0001wS-Bp; Fri, 20 Jan 2023 02:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1E-00011W-N4
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:01 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1B-0004pU-5j
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200457; x=1705736457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cZOtB0SAcjr9gDInv2W8vUbXkcQpeU+zEqfS8xQRDqk=;
 b=lJ8ECWf7xhRZxmQWlML4kTUkxInF3Y4Kz5ypg2lzIIA43xqt0rRhaJUX
 qAfBOQs2dEbA8CK0D+rdB+OIHvRk4AJwHYmWr9YZT9n7LIluGawVeKLO0
 E/OqPIhSrvQK4PRpQ8hRpolERncBUSdjsIAA54t7DfqktnpbNyWPLoYzb
 aLvNtLEfbyBoDgH6/x80t2h/Y/EyvEr1BbS7oQkxlrhLPNNHPy1kq9myu
 RM4UhLs2O5pYZbW1brgkWd4Wfs7y7k/prLIMHBrf6aQYbl4NU7u9I6w+3
 uifpW7eTkMCDONzdmJcQRM5jaZN7c4Fow+AsNdCoCsVnZ3wnRWZS5Iiz4 g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176751"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:16 +0800
IronPort-SDR: 3ADguHo/ZB27JDyx5m3qOxKHHeHN0i/RYZkOdKVYyJ+46TQuRPo+g10jhWVf3ViRaBZhnPRaV4
 ZiGT7malLrRy2Myf+KGrn1Re3kTsDG28HuXp6cc4O1dKtubBnuuRbG1gmFJ6iYyPHc8mrKfo/z
 2preSUl/VrM1DDw09ZFS1+MVsfe/paKz58UBur0jx2/svsJ718xKByWkm/kpue5TT9dvGDoN0/
 ztKrbOwMZWcxC1z/7rQ6kHi4RU11ati2Hk6WqDcaqVKFFzsUPqja3B0IrkJww9l61gUUrG41hq
 Iis=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:54 -0800
IronPort-SDR: 0eOnQe3ELbG/jhvrkltypNioTk2qzf04UtXhO5HskyTzIhyT9+8vkSTx1NTXnNZySt6ILnRv6b
 EM164/s0tSP+exkLAtQ038JUc/Wz5LXFDlc6VwxO5tcVo0ILmxj/Ok8vYndxdA8bCNTT/B29Gs
 3i/wOVOBp5GDjZfvZ+BQ8CjzMiFzExEfqgNMpZVWSHBPnX5zxR5gBwV2CeTlypYHlnE5a4Bh/1
 z+3uuTsBCKWD3swZJXC2tCmWClpeAHkxMeLYulqWpB2vL9GUsgpQCbqDGi5PpxNB1aOHADjtQ/
 qj8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:16 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrxr3TWGz1RvLy
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:16 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1674200416; x=1676792417; bh=cZOtB0S
 Acjr9gDInv2W8vUbXkcQpeU+zEqfS8xQRDqk=; b=iIpGNN7Q4KjmooPGb77xnZI
 TxYJi8U1AjAwgksDoV4N0EoPwPNOSgkCoK3pYCzzgtPU3QIQrPY01JGsGG/NVroU
 rz3vWx4E9bQIQkEzKC50NrM4qDPWfktlOH5zIewDZ3w7yQviLAeIi5DAHcmGjku6
 SPsrps6yjzt8EKF6cCe9Ajdvhb5AsM/Q1Fo2VidseONzh5a31Dir06Cl5Pqq5ts4
 n9wUaJD/LVWvABaX/+IltniiofMN8qdil8QINqVhDi4EbNcxT1/CXWkJsKRoc5Xv
 LZoooK6pZ0F8DLBSMYwIlMN2p27OcDkqLiGDjP8AJ6wC+esuKcJPiWiAiWJEflw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 7fzv2nEbZ9Iq for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:16 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrxn6h66z1RvTr;
 Thu, 19 Jan 2023 23:40:13 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 26/37] hw/riscv/spike.c: simplify create_fdt()
Date: Fri, 20 Jan 2023 17:39:02 +1000
Message-Id: <20230120073913.1028407-27-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

'mem_size' and 'cmdline' are unused.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230111170948.316276-2-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/spike.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index bff9475686..c7550abfc7 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -49,7 +49,6 @@ static const MemMapEntry spike_memmap[] =3D {
 };
=20
 static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
-                       uint64_t mem_size, const char *cmdline,
                        bool is_32_bit, bool htif_custom_base)
 {
     void *fdt;
@@ -299,8 +298,7 @@ static void spike_board_init(MachineState *machine)
     }
=20
     /* Create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]), htif_custom_base);
+    create_fdt(s, memmap, riscv_is_32bit(&s->soc[0]), htif_custom_base);
=20
     /* Load kernel */
     if (machine->kernel_filename) {
--=20
2.39.0


