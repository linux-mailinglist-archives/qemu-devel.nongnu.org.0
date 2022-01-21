Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCF5495A02
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:35:51 +0100 (CET)
Received: from localhost ([::1]:39224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnWY-0000zA-NG
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:35:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmzB-0007D2-Sz
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:01:25 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyY-0004B6-KG
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744842; x=1674280842;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DrhOrJW4QfQO9qERTwhcBVkHdyWoi6iLY0zGY+r5t0A=;
 b=T6tcIMR1cyhnTXaR9E4io2/EY1+gc2JbgLuDFdwc565ACMCzazvvlcOQ
 d3IncYhWHQarUpVmV0KUnJz46+kqwio7PTy7hd1aFMEHgz3qfgIs+B0Ef
 nP4wexWA4aYz5XjVeoNBdtKsquJYcapTRKY8kEMZ7Lm6b74cIFcgVj5YY
 Tu8GbKk2CcsC30+M0qi1I7sOEs/JX0A4vL5Ug/pNEIB4IQlDXsZxbY5le
 PSfzOkrvb4sYWuovi3JX+2DEokW/hJbzSZk56f/aG6YS1h6GzH9r8JxOf
 WFZJGNPRRWeNjPpWhgKhlV99iPoXCkHVEeQn8HHDL5XKH8wxcKvjAdj0b g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295082965"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:00:41 +0800
IronPort-SDR: CqRlNPjYZZGpOJvFsMKfHn/o+sk9DQfYfhk+nINu6rY+S1+2dyIypVjGQSHiT8K1i2qLRqRAHl
 8+dkUkEUrZaPBLU5MlbnMmGGEbfnneSYXkfj1/W533dNTuBrb2eyX7v7NcBBMMl+HuxV4fJ3c9
 MHa2jVgV6XvduajkR9szobuHG8Y+WE1v3OjlT8hoK7oTH/vKwD9ky/oKpGrkXsUkdGeYdbmOli
 BCYQQrOk/rX4N+9HXFRqm8uugPejp+ElFCLa2FKSF76Gr0dYYlaFBaRrqnDKcf9MwPVLuOg1Ga
 tnw3aDeglp0xmrtIJnMXHp6L
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:34:08 -0800
IronPort-SDR: WmmJuca+rSiKYFvIPUz4MxQXW0RK4IaTG2cQdWg88i9FI4Op1VcVPDbYQ+slCQy3w6AaT2HO1f
 ybZfGWv1h3ACoRZU7yJ2SIp/LSxTqAsPwrz7Do/rm3WePQ7vAE0BvqEiVvdwErgcWAGIYej8rP
 tKrtO/Vd7v9+6Z3Me/r7WgoZVTOBMwjLGDFA0bs3Da+aKW8/i8pYgWU5AnaWMkh0oMKncUJhPU
 cVHsIMhLd1zy9295MFBX/EoYMogGj+7Edvo0BTWwOaEdOHCMfbLzMvHM2rpFzcvbtGtZqPzjkA
 m2w=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:00:41 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7yx0pJ5z1SVnx
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:00:41 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744840; x=1645336841; bh=DrhOrJW4QfQO9qERTw
 hcBVkHdyWoi6iLY0zGY+r5t0A=; b=NrdsyKYG3pYs4ZyLLeVM3lJ0VeqtZLW9Y8
 AEBonR5HTfhtU4Dr8fe0gX8E/JFR1upI0IHXN4RUZkUtSK3LiEa90TCvRUKj0pEA
 ZO2vxasKLYbhPYrraUshdIq2EE35fwdoKVFIMHS7rwgDr+LK9Ud+KhAslppMgI7h
 YOaCv0/j7JSF7a70+UVLWOfT4e1/lHZBH7OHwTNtHuAK6DpBOVYNIeiZnKedUkcW
 TDVvHqCwdvbpwpnJVsUc9HXqd9baSEqxqHN3dlOn0Fbp5hbTYap2Z4gVt3m3chgC
 XXDfgsKEXhnzGEwe8PGAl4ncfMzIZHGVxXHQFPVnlFA9a/NmzzTw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Y9jD3cSrT2HI for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:00:40 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7yt1dTlz1RvlN;
 Thu, 20 Jan 2022 22:00:37 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 28/61] target/riscv: rvv-1.0: Allow Zve64f extension to be
 turned on
Date: Fri, 21 Jan 2022 15:57:57 +1000
Message-Id: <20220121055830.3164408-29-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220118014522.13613-11-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cdb893d601..4f3d733db4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -688,6 +688,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
+    DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
=20
--=20
2.31.1


