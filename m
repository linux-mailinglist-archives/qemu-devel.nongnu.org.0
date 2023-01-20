Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E4D674E41
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:41:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0f-0000CQ-G8; Fri, 20 Jan 2023 02:40:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0b-0008PG-N8
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:21 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0Z-0004pU-Js
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200419; x=1705736419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ck3adrgI9AADtz7/lYYVfG9ETFGWlDw3wpKpvxh73zo=;
 b=nn68xQsT0MjwDWVhZEYoIwzaH6q5ELOBcDi1SQ/x7VKuPyS1r+mTe6Jw
 at99ng+oQbBg+mmSl805oUbiMJW4owzjiugIQ0Q289GY202aBnWAbnxNR
 6toWE44SXOOWSzD7ooPHNIJW44jgnGBBRhkNsXAwHNnZch2vVWfzYhteX
 PKT0GN5QC6LIHlLkbaiPcTcg6cS4AumLW3oEg84QWtR8gOVoU9qXTSv5U
 8i8Ze2WC7uIjpzNtBDDPxgtvLbYvKUu1TuiM3FkYE9wQ0KBxR2LNqWmPx
 Y3gQyP+NAaCp5rJAKN72mjW63hvx3RrYdntokyHqdbhGo/gxyoHcoJSeo w==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176717"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:57 +0800
IronPort-SDR: 0edKP6bEI1yvRTeAq+OhtHBbnB5fLA1g3NvoD2ycxdfM5h6dCYsOvafW38gHQoHoHojKLM6lWE
 RQ5SJPFFyjSnQARhuKB+0CIdC7YZ+AeUVeyfItuIDmoaD4djbeNN83WFbmfzDQRc9Oaq552VpZ
 OrwsVbsvfbuEht2WglRHdTDqvio5ivZ4S79yK12qGnFflwFqjCXFdo4AMXFVtjUIt0NuWpjCpZ
 bl5gFOBO4IM1h16sFAKcgup4iPABnxvPM7+JtFmq1bwSlDPTDQIjG0EfCP318tAAz6/J36PrA6
 244=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:35 -0800
IronPort-SDR: wz/3L9Uper/ODwpPGAq86z/LZUUPnZs1dKSK6tUlTvRkmUZTHbUbAxdPu5GQTYwom1uq81run9
 8PGpA6mgLAbI/3CLNsgOOOifvmQaMWMOfPagach59OH2fMNVLu3mJRen1plu9HBRb8os5+TkKt
 e1v3vxlyMJy2E0kW988XFpmI0rfmi77H2YiUsL27Hkp5YgbSbUTobMolLlKEJuBM3ApgDeHMI9
 xJnZTvxBQZjEUZKQIH7thHiheVh8ZB1yvdADgXNgJASBd9MMs8Bgo5rA9csPDnNf2y7kZzQNdX
 Xbg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:57 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NyrxT1J32z1Rwtm
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:57 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1674200396; x=1676792397; bh=ck3adrg
 I9AADtz7/lYYVfG9ETFGWlDw3wpKpvxh73zo=; b=WlrAry3GKJhYtM+xqPahv0o
 KS2hLWLLZzLbJdY8uWJdapAoxEZV3nTlDgppLYR16CRbXK30QI5YNWbY6un4ir57
 g3bIL5z+B3kbHXoQZZoy1yTEkeEIc5HvMcmKQcemnBH/JjvoszxWavmJ56sp3Y0J
 xITo/G9/uIDIZ7x+6S/O+s5JUqaOukSoJkzwfWaoPBqtP7e+8n+2de4codsvKxSh
 LaT8+fmVHjxgHsMASOo0cFzCl+aEyjttJhv0ury1x3kyD1kajYQyfwOrX6K0MwYa
 6YIx93UQ6uro+gtk/U5ETiwUSFxXVFclQYZ8ZTjCvIdJ5UylZdePS+mWHYPNP7g=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 9JqW4sDyPt_p for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:56 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NyrxQ5yzjz1RvLy;
 Thu, 19 Jan 2023 23:39:54 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 17/37] hw/riscv/boot.c: exit early if filename is NULL in load
 functions
Date: Fri, 20 Jan 2023 17:38:53 +1000
Message-Id: <20230120073913.1028407-18-alistair.francis@opensource.wdc.com>
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

riscv_load_firmware(), riscv_load_initrd() and riscv_load_kernel() works
under the assumption that a 'filename' parameter is always not NULL.

This is currently the case since all callers of these functions are
checking for NULL before calling them. Add an g_assert() to make sure
that a NULL value in these cases are to be considered a bug.

Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230102115241.25733-5-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 98b80af51b..31aa3385a0 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -153,6 +153,8 @@ target_ulong riscv_load_firmware(const char *firmware=
_filename,
     uint64_t firmware_entry, firmware_end;
     ssize_t firmware_size;
=20
+    g_assert(firmware_filename !=3D NULL);
+
     if (load_elf_ram_sym(firmware_filename, NULL, NULL, NULL,
                          &firmware_entry, NULL, &firmware_end, NULL,
                          0, EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
@@ -177,6 +179,8 @@ target_ulong riscv_load_kernel(const char *kernel_fil=
ename,
 {
     uint64_t kernel_load_base, kernel_entry;
=20
+    g_assert(kernel_filename !=3D NULL);
+
     /*
      * NB: Use low address not ELF entry point to ensure that the fw_dyn=
amic
      * behaviour when loading an ELF matches the fw_payload, fw_jump and=
 BBL
@@ -209,6 +213,8 @@ hwaddr riscv_load_initrd(const char *filename, uint64=
_t mem_size,
 {
     ssize_t size;
=20
+    g_assert(filename !=3D NULL);
+
     /*
      * We want to put the initrd far enough into RAM that when the
      * kernel is uncompressed it will not clobber the initrd. However
--=20
2.39.0


