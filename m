Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1862DDE78
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:14:14 +0100 (CET)
Received: from localhost ([::1]:45104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq91p-0000ie-1I
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:14:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pd-00053T-IJ
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:37 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pW-0002GJ-5s
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271601; x=1639807601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+B8xm0IL03WorC983sZa9+1pfhqOUh8hDhtMhohfROY=;
 b=fpOgVYTAw43LJR3TzoiiAAKZBh174Hi+asCrYToKB81xRfX/K2FWBDtK
 jSeeArhDijXrZeT+cYYUDtgoFql0u9I4CVJeH6W3o578uD0bwMmsJv6VO
 Hx1tZEUB/72eYbsiqh6rV9R7acHOJKqvS/YISkK8MRBDIhP61gwResPgG
 jY84UCzAiDAhItSkddphIIBWIAP4fZ3MB4euLBRPOZkX9/0ObuUenKItI
 UWmTdIrG3u+JYvXTugNzZYlvd8lxVv7S5T2i9yAhc4kUHpKn1pVZIAQYj
 E+D8Bo9kjXG4sG3qP0m2yFFGS0oZr+wopyOzuJOL411aN8G8t5FFaA3BQ A==;
IronPort-SDR: RV34Vvq3echZH1bnrCjDb1oMXR8sSA0QdeGWEPet5Y4ks4Wj5VWcw+ywTj1DeYg6k/eqlB+kj/
 /Nt0FV8uqO4pyw2k2+OzCmWGtlOIFkXT6guKxyzll8V9lVUu4fMy7VQDMGMB56ylRZzBSWPKFC
 nkvtXe52FjMSo8OGHwrD8g9CJlqXcO+UEzSdZ/8jWPeNL0aD/tdLdqRhbKv6HmLk4FQznfdBWK
 tAzCHXnP0+q96xJhC/YMj5+u8wdoA3gPc5W+CXLYbb18tI3XfZQmqT813ZY9nyP888wgTzJHcz
 x5M=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237044"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:26 +0800
IronPort-SDR: RnN8uZ0INhAEKqxr0lDT3Ek5ZDDecCZqZimu+2ZYDThlAmiDpPjRbr2msYxa5ZpQ+/CG4mD86S
 136aCU2Kj6/WpJHSI9Y9+IJAOlYhI3La6Ube+be4I7nqo1y0XyJsE1l1Qgn3QhFYF5vgVy2i4m
 Larp6xvhclnKZ0qmp/FEaz0v3FmkChTIE/GPP6QW0JG4cUsncSlNNDDR6tQ19YIa3J66Yif2Zr
 eqUfJ4HwdySWUZR/HFNvKJGQ/6T5h0hMYAr6hVJpJ/pqLLomJkrJWYhUzgfK6vUcYLiGuwp3YH
 Iypt5BpVSrpeezfnvsgzGXUI
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:35 -0800
IronPort-SDR: 6JamgrPESHh/gAoBmPyYMI2w36809KA/A2g6h1AuNs1aeb/Lm9RU83nvxsOIrZfeaz7H987n4k
 BcDF1Y7ibPcF3GQe76jgZHjbNB40XPseH1xVHk/PdSXz6GJHFkGgZIdjqyOJz4j/u9cCv0lS10
 UQn4cNonA5OjvFBJcfk/4pMGY8wx2Tzh1CevYcjHlr2B5n8Kr0fhEFk6Fj9ma+ii2QybHx6t9+
 tXyRwrCkg7meqBhciQbURNNdoaYg/3EYLtG80PTseyMmgmfQTN9fGBHnGx5aY7k4nvu2QBW9My
 VSo=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:20 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 07/23] hw/riscv: Expand the is 32-bit check to support more CPUs
Date: Thu, 17 Dec 2020 22:00:58 -0800
Message-Id: <20201218060114.3591217-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the riscv_is_32_bit() function only supports the generic rv32
CPUs. Extend the function to support the SiFive and LowRISC CPUs as
well.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Message-id: 9a13764115ba78688ba61b56526c6de65fc3ef42.1608142916.git.alistair.francis@wdc.com
---
 hw/riscv/boot.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index d62f3dc758..3c70ac75d7 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -41,7 +41,17 @@
 
 bool riscv_is_32_bit(MachineState *machine)
 {
-    if (!strncmp(machine->cpu_type, "rv32", 4)) {
+    /*
+     * To determine if the CPU is 32-bit we need to check a few different CPUs.
+     *
+     * If the CPU starts with rv32
+     * If the CPU is a sifive 3 seriries CPU (E31, U34)
+     * If it's the Ibex CPU
+     */
+    if (!strncmp(machine->cpu_type, "rv32", 4) ||
+        (!strncmp(machine->cpu_type, "sifive", 6) &&
+            machine->cpu_type[8] == '3') ||
+        !strncmp(machine->cpu_type, "lowrisc-ibex", 12)) {
         return true;
     } else {
         return false;
-- 
2.29.2


