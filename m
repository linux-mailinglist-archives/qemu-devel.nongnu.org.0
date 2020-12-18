Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDEA2DDE7F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:17:11 +0100 (CET)
Received: from localhost ([::1]:51376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq94g-0003WP-3d
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pe-00054h-5k
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:40 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pY-0002GA-0p
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271604; x=1639807604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0I5QDXodoctSiNVavdDdo45LiqD/vnYUvoeRAtxGVUY=;
 b=GziCbSYhGqb9CYNsKdMU1X4e6PTAnAvrZojH1ECphiQXwXxeWD1dAv57
 bxHCoQK0hptCAnzYp4OxAUHKjSch8vgxpjzDIvJZiBpNbP/405LC4MmIL
 GpD2v0Bk+WLIlZ64mCqoq1OzLFD1CxGZ1xS+ahYosgYA0bAxpnlhnMGiB
 lMxVzBcT9GpuwdoQYkZqPVzmg80Q0cy89cOhjzpUz9hFflAO7Tb6hGard
 t3u+kTsePlUkWxyKTa2fA62sB5/oUSuT1PBHPF9NaTUVa0nITRHAqy85C
 R/brGy0Bg6add13Tf06hPOe2tFm/+4NiHFBVWgB6bdkTr8/I09H3CHKWM A==;
IronPort-SDR: HMxncmmxCGQ8SdT8H6NbL+tG1VjL8QZeVi+vL+OZ7hW/VfvD+USo5bOyox0BPUjARDxGRnkT07
 JH8cC2K3ZCPNQcjISeyUKylXJzlTvFAxidWv5zyvwv6T4l7AdBj8PatNbWOzwrTGGmyRIIUZIY
 T2/4ydX4dDNDy/YTkiErWCP5mNd5oD0B3asnwLifnyYw/v6ddGeSPvLQL+d96tzwfFfgZ/UD4H
 xlMb/dRm8goOxqa8MyhKv7zYFeCAfkuzbNfL07QKKMFXqYNj9TjzKDWAUQG1zX8bhvT/rK9rLv
 J9s=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237048"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:28 +0800
IronPort-SDR: d+eEHCWay/fYheKCKxtba0Tc13n2X3M/o/FTMcMpigHfqUE0TKO3r0Ga/kdvcHiPkkE5/Cq4u2
 x01DXq204ZtLp/GQrSAHFl5Fka0EpgDA/5jn8qL0q8kmedd1pjS46a4Qf28KCd3LcnXWKPcBTx
 tKRdrFLnorp0F+DMcvpM5NFFt2foZx6cvqQ4M/ZJfLwmkWhk+yVH3wKWgnXd+a0zOw6aQ7VKgy
 +P5EJW24H6T7iingsMvsRTquLdkamqTVD6Nvpj9Y2U1khgIQ9QTqLL9XuEXhtXQwlfKePUzl0W
 NGm+NE/QHjUHU8q6/gFmg4vk
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:37 -0800
IronPort-SDR: 8zSAi6fSEjxGSn2+BAfdlHEUqqolX7YBcamNzAmWZq7zh9RpNlqRjpo9GIRrQcPvWXy2cL3/hD
 7DYV7nS2T6xgySXkCf6lFMIIt57HyGG2JtzIZz2MnbARST5UcUSPjPatV04u5O1TGu7Flu2Srh
 ZHhKHh+EuR1WbI3ksvDeG5Dpl8AVk0HX2A3lZ2cJeJhIrNSNqu5tKpm6OEyJytjJPUVxXaBOUa
 K2Op5BbVKRi7iJjocsIe8b9F179G4cF+6B8j9xjg9wbp3Q2aQemVjpzOySb+tcGV2rSRkO3SCs
 HYQ=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:20 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 08/23] target/riscv: Add a TYPE_RISCV_CPU_BASE CPU
Date: Thu, 17 Dec 2020 22:00:59 -0800
Message-Id: <20201218060114.3591217-9-alistair.francis@wdc.com>
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Message-id: 86e5ccd9eae2f5d8c2257679c6ccf6078a5d51af.1608142916.git.alistair.francis@wdc.com
---
 target/riscv/cpu.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c0a326c843..9c064f3094 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -44,6 +44,12 @@
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
 #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
 
+#if defined(TARGET_RISCV32)
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
+#elif defined(TARGET_RISCV64)
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
+#endif
+
 #define RV32 ((target_ulong)1 << (TARGET_LONG_BITS - 2))
 #define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
 
-- 
2.29.2


