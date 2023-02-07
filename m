Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF2868D06D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:17:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI9Z-0001fZ-Vv; Tue, 07 Feb 2023 02:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8x-0000vj-HI
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:12:08 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8v-0000FD-Tv
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753913; x=1707289913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=US6AOZxZc/Tz5zXl8mndWgNM8kZmZs66TcvQR2IB3O4=;
 b=DMBJxpRF6Dn1bG/M7W6TLFzauMhuqaE2afuy9Ukz95Q7YBART4VjbwZ3
 FRYOSAOBqukq9eA8bUoIQmNzQT8EKGEhTsLHjEJ4zquvhtFL+l34HYN1W
 lfk1126t1K39rm2LyZqJx+G5886tKt6VirQpqzGvlv901273e6g1picGl
 UvcOAvkLFvFs15NqC3UrhmWMEGa9vWgjC+yOom/NkGXIsPeGUYOWc/Zrd
 0CzQim7pR1hAffUw3TRyqq/Uok/67xqDtetK9Ab6trLwLY+Xqy9a8x3+6
 CtqJP3I1TbnNSbIW1W5AYB1vKgc1Yr25VYv8WhsD0O3DbiFI2t3hFWQy6 A==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657588"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:52 +0800
IronPort-SDR: jYSLXLEr+7TYC0z871P8FqgthfMgkwVJEV7o3GEHqLG5bt9sSJs+5/4e8W9EnaPy210JzItgay
 7JIyD4OPwb5BWu5H/ZduhQZWP4rQ/A0gQJggO6hYQjyVvlOBRMjUwROmY8trH+72YxNtZ/ODHy
 FXuMbAyMA+JtV4kPyASV0baIrzrOdfqAf9Zccqyt+KKDwQuAviAbjA09OUEztdee/n0HG1mmN5
 cFjtdkACEbkM1WG04/tgaD0bhRevByA2zjA+8tC38Oh+u5qNj8qeAMOUu1G9VbsFZU5LEuAN6p
 4E8=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:28:09 -0800
IronPort-SDR: Fh7CudacfgtpXvPJGzIBPWBBOyZWATa4rSTPtGsONnkdKaI/5eVdLXdgjPy5MwPBXxAdTjcfB9
 H84wK+WVZA2BlFh4GdIIwB+EGD93iiU9evH6+2iARInLt3xlnqXDQq3AHuG21TQg3Jbp2/4BaN
 CB4iUaCqvfHcu422HyhvVgQhdVMVs1bAZYwXjc63qkH4weq7bLAjcwfoYww8WPckwgLoWGc8xj
 WyI6MenVtkCajmedn2UwN7uilo16Yi1fPx07RmP9mS0mxhOX4eQ6pWBhI3t+mkgcIJ9ZelZgHN
 E3Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:52 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vRc2GGSz1RvLy
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:52 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753851; x=1678345852; bh=US6AOZx
 Zc/Tz5zXl8mndWgNM8kZmZs66TcvQR2IB3O4=; b=H6BufcZ5NPNH541ZFYXlq9Y
 9DzqzHlw5D5R6Sayj6M8J0/I07MdlBzeIQl5dC6+a+jct4GfPTzO+S1OleBih7yK
 1jvXKIYN+muAzH1rSI6fhQigS6MGsRDSxZt4rHahS/nb3bGtWbU144z7nM//fFR7
 8LIsL+0QyxIZsGPYnGQRE+S6khM9xLAJ5YgXRGwWQG+HFhq+ibwFISMzJgyiIxnL
 uSXTwwU70eevDAM/g9+2s/2B2K2WMTNC74+YFPFJWWGkbJpNtbAe4+7f3A8W7MhU
 qEqpV0vUw+b6COfhDvhxMBg/TgMtrb4yvGljgZV8zCH16EjLXGi8NAGOpnH53kA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id bHRhbhmZeX9j for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:51 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vRZ3bJ0z1Rwrq;
 Mon,  6 Feb 2023 23:10:50 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 32/32] hw/riscv: virt: Simplify virt_{get,set}_aclint()
Date: Tue,  7 Feb 2023 17:09:43 +1000
Message-Id: <20230207070943.2558857-33-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Bin Meng <bmeng@tinylab.org>

There is no need to declare an intermediate "MachineState *ms".

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230206085007.3618715-1-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a061151a6f..b81081c70b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1583,16 +1583,14 @@ static void virt_set_aia(Object *obj, const char =
*val, Error **errp)
=20
 static bool virt_get_aclint(Object *obj, Error **errp)
 {
-    MachineState *ms =3D MACHINE(obj);
-    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(ms);
+    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
=20
     return s->have_aclint;
 }
=20
 static void virt_set_aclint(Object *obj, bool value, Error **errp)
 {
-    MachineState *ms =3D MACHINE(obj);
-    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(ms);
+    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
=20
     s->have_aclint =3D value;
 }
--=20
2.39.1


