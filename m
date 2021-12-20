Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74E047A541
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 08:04:44 +0100 (CET)
Received: from localhost ([::1]:60878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzCix-00068n-1p
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 02:04:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzApK-0004iL-Ay
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:10 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzApI-0000Me-Ac
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976588; x=1671512588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=47/5D/u72Cpr/I+MmfhbvHAo/+I5O+BJYXrIQKh98b0=;
 b=IScXs1XSw/F7cO15YbDqbqNCRKKGHVyp4LvDx9GJeft+gLckOyWxJD69
 fj5Ym9hxWmtUuMnl3oaksf5CEixZPdk/68Kx0QYicpGz9sRIhFYH1FDUW
 yGlf19CRBXuwMxNAcVhTvBwYqFC1tXneaw+UIg3AreR4t0nUVnCVn8gry
 jl8YKJwpHCAnuZYJ29egOT4kvrTK6tEefd6KBK4Jb06O5vgZI7Yy9+n1A
 BXylJgE/X3S97DBTrgVLk1YDbdQ+5KxqWV4Crhz0MQuFJo8r9pViJj4UR
 evbzp8jU0Acad/WpLiLb5giv3Zfd19GHYvi2DItfbdxi3HENOBnpYbO5k A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292662385"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:03:07 +0800
IronPort-SDR: yMZ/0JnMuh/y+e0s3Jdpe6M4fOOYmPKQTnYjHsK9GzZgxlldeeG0MDqLP7HDUnXXHNOKPP1n+S
 8BGPVEeEBYNjRwoOktC5z4s4GfftFLt1yfqNtkP1Cd97IUxqH9t/3kdg8J8sbeE3TNqNK/R/YU
 8hKBKJyv0vb5nltJYEaTI0YFkdAW87rftogrX7k06KGRNcjbdnDac//vXb/knSWIATmib+LN4F
 YjRPbbnWQRohhZmAr0uBKSO8ZXxOvvgtkvqGbcpaJdAGkX5je3kJmGHZdpMsMc3Iv7U5IFtD4M
 0NRDz5yKssYvwNZ1q2OStRVF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:35:57 -0800
IronPort-SDR: UwCtf43KhRkrAPfiWdNQ9jb4NcqWQxaJcE4phidhgSFELrl3hGK0AxCGBHSfxmHCTJ6ctIILil
 wAjPZ3UrZqAUk+e6kYv2i6ZCvrAWRVNXl6Zy+NFTpl91R/2VQXCxHoTfXiXWjwpMMqkVB3U1dm
 zdu0lWefxLRZ7CPtaxh4kAy9MRbTgp/IEzAJ/ZDi4YYuh1YDdar5sPT4UHn0TjKHfatndEcv3/
 6WSXXuB+fMTJm2Z9ks9ozu/Yh+/f7L/Cq/0QTP4JlOv6AnEy8LeE+ZrOZrDBH6MALPQ1IfIBTs
 7vs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:03:07 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHSCG4wlRz1RvTg
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:03:06 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976586; x=1642568587; bh=47/5D/u72Cpr/I+Mmf
 hbvHAo/+I5O+BJYXrIQKh98b0=; b=SDY1Xmi3/M02dltfS+6hEIk8T1I0pNIXFx
 naWClOPxF7brA7/Qk8L/ZsrvO2ud4sKTXFSJ1gix2yU1w6Iz7Wi04Vc6KWgSRyyx
 43JJNzBJPV0GT3lYrACsTbuRjlattYOHX+lbTIlck/evY/zBoEZOSf6P48B0t9ko
 z94XThYtjgcfBEzWolJCPwHYT32BWOHU7AU0NHRIZiXrx4wuvUJomBFe6KPKXdfn
 izo91rU4vsc2SurxM/g+k53IqyytUxSWoEws9Gy41s4Kj4Bcnsa/Y6Q5T2J3aZLy
 e4+9bwkaCKHtIKN9vHhrU8k9Bu1gknc/upB/xVWrnHI7mOyDBP5A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id oDXn5ZHVxH5c for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:03:06 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHSCC3nxlz1RtVG;
 Sun, 19 Dec 2021 21:03:03 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jessica Clarke <jrtc27@jrtc27.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 88/88] hw/riscv: Use load address rather than entry point for
 fw_dynamic next_addr
Date: Mon, 20 Dec 2021 14:57:05 +1000
Message-Id: <20211220045705.62174-89-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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

From: Jessica Clarke <jrtc27@jrtc27.com>

The original BBL boot method had the kernel embedded as an opaque blob
that was blindly jumped to, which OpenSBI implemented as fw_payload.
OpenSBI then implemented fw_jump, which allows the payload to be loaded
elsewhere, but still blindly jumps to a fixed address at which the
kernel is to be loaded. Finally, OpenSBI introduced fw_dynamic, which
allows the previous stage to inform it where to jump to, rather than
having to blindly guess like fw_jump, or embed the payload as part of
the build like fw_payload. When used with an opaque binary (i.e. the
output of objcopy -O binary), it matches the behaviour of the previous
methods. However, when used with an ELF, QEMU currently passes on the
ELF's entry point address, which causes a discrepancy compared with all
the other boot methods if that entry point is not the first instruction
in the binary.

This difference specific to fw_dynamic with an ELF is not apparent when
booting Linux, since its entry point is the first instruction in the
binary. However, FreeBSD has a separate ELF entry point, following the
calling convention used by its bootloader, that differs from the first
instruction in the binary, used for the legacy SBI entry point, and so
the specific combination of QEMU's default fw_dynamic firmware with
booting FreeBSD as an ELF rather than a raw binary does not work.

Thus, align the behaviour when loading an ELF with the behaviour when
loading a raw binary; namely, use the base address of the loaded kernel
in place of the entry point.

The uImage code is left as-is in using the U-Boot header's entry point,
since the calling convention for that entry point is the same as the SBI
one and it mirrors what U-Boot will do.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211214032456.70203-1-jrtc27@jrtc27.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 519fa455a1..f67264374e 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -151,12 +151,19 @@ target_ulong riscv_load_kernel(const char *kernel_f=
ilename,
                                target_ulong kernel_start_addr,
                                symbol_fn_t sym_cb)
 {
-    uint64_t kernel_entry;
+    uint64_t kernel_load_base, kernel_entry;
=20
+    /*
+     * NB: Use low address not ELF entry point to ensure that the fw_dyn=
amic
+     * behaviour when loading an ELF matches the fw_payload, fw_jump and=
 BBL
+     * behaviour, as well as fw_dynamic with a raw binary, all of which =
jump to
+     * the (expected) load address load address. This allows kernels to =
have
+     * separate SBI and ELF entry points (used by FreeBSD, for example).
+     */
     if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
-                         &kernel_entry, NULL, NULL, NULL, 0,
+                         NULL, &kernel_load_base, NULL, NULL, 0,
                          EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
-        return kernel_entry;
+        return kernel_load_base;
     }
=20
     if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
--=20
2.31.1


