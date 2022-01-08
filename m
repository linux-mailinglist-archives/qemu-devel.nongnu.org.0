Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4171A4881CA
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:11:32 +0100 (CET)
Received: from localhost ([::1]:47160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n64wt-0007X4-Bj
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:11:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dw-0008Bq-N2
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:56 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64du-0006qe-WA
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621114; x=1673157114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uZ8J1cO3Az3iXH/T039UJAZVIQ7XwHUiCe9a0g+ceHk=;
 b=qi5SAVeNrR6E2yIhvJLMOcIsscjd+dbI24BpTNHm2rndLRqK+RYxtOBW
 oJmdqlBSIKDh83PQxJT63FZPRGQHtxKYL+mmzxbD1lV/hqgPWtfxosp5W
 uW1oQlYHKox7aCDCiv/DfjFTCPZAP3Z9tS/LDwqaunJ6Q3TPlFzFuAsNH
 aZmf46+5NvBXjSAWIaqm5rpZyyU5g4puHTKKxYWWOQ0OTKcmIHEIZ0ie/
 3bYGfEoSXrUmZyHLr0aInH+bFNXIsku3eBisLXJELYQgwHNIfkaf5hhsh
 KlgvuoNtBv9YLAVrO+jC6x6Erxle2dx4A0FxjhWwm3TXUI8f76zo2ft/s Q==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984901"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:51:53 +0800
IronPort-SDR: y3Mtv5iTZ+/ckYbiiU1jJ5OJZW7xM1WLNJQ4GDIKd6XtWMjGEEzvdfcTn5RgwcdmaA+HaMlSDm
 tFaiIfzZ7F+2KXynTKf35pLKcNLucPhbDn2dwV0yNZzMUE3XPy3nfS8GlgVOYkYAki23G8X2O7
 NvM6DSTY24OY5dyFTVNLkz6O+pwElvE18Ag7LQ05wr6RYdP3DAaDEXZFXKv+gqYEJTi4yNqVAe
 vsaIjgtpuxwZeAUJJFeERl9PvTkOo/CdEFcJ5JH2Nn/7UkwJLTj32++gPipD+yRVRFuZxVbm9e
 KKGYDnNbpCyBxVb+kWQA0Cor
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:41 -0800
IronPort-SDR: isJ8sAGlN4htvz1VUosXxTPC0bhQpn1+fa5W0Jvtcyyv3cpJzEz2DPQdqWG+G/VctuM5zrGC5t
 C0/K9euHK9GIgmHLMJEFNBeNp5XmQLlfCo5msvuYAy647NtZUgRgC/qVpk4sKCZVEIi6o0EAio
 ABhi2mdrUnCz8Eh61Dg4ZR8XBtaRXfXT8UN/vkK4FkyoXNNWj0KzxGPZfDbr3D6Yx8rToHNvzx
 /MiSVUXgPQbyq7qFlBW2dnIAPEUdI9r1KB7gEHvwx/bk6Cv858RWV/yDrIgLs3Y7T78WrYhJtN
 4/E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:51:54 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Nn1rCSz1VSkY
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:51:53 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621112; x=1644213113; bh=uZ8J1cO
 3Az3iXH/T039UJAZVIQ7XwHUiCe9a0g+ceHk=; b=ugeuzrdKmJ2AlBbYHnF6FhQ
 XhS9tgXd2QmwFT2xICcent+1CaWspinTwsCuMlKLDajTRcYN5Vlc+Zt8dz9ovuY8
 IlDpKffelTfATqSevVFto74wJcguWA3h51EpC2wD2lg2N0YYMD890qfZEHhb+Nna
 JSHr9MyC6yqp1pSqeHRhngNi1J7ppXEhwtjOGnneb7+KoQcjnuAQuFmRWTIfw9sG
 AWXS/VTVYADXBA2BAZM9cg3NQ0wcE1LwE1wKKPL/2WdA+xFeO6YP0Dxw/V60LHz3
 NmR+7CQt/bCps+/A5MSM7tomoeHg2BJrTPfBLro+9BXTV1MITQjvuSc/MmY7ThQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id s2avn4P1FbUc for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:51:52 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Nh4j2Nz1VSkV;
 Fri,  7 Jan 2022 21:51:48 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 11/37] hw/riscv: virt: Allow support for 32 cores
Date: Sat,  8 Jan 2022 15:50:22 +1000
Message-Id: <20220108055048.3512645-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Linux supports up to 32 cores for both 32-bit and 64-bit RISC-V, so
let's set that as the maximum for the virt board.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/435
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220105213937.1113508-9-alistair.francis@opensource.wdc.com=
>
---
 include/hw/riscv/virt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index b8ef99f348..6e9f61ccd9 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -24,7 +24,7 @@
 #include "hw/block/flash.h"
 #include "qom/object.h"
=20
-#define VIRT_CPUS_MAX 8
+#define VIRT_CPUS_MAX 32
 #define VIRT_SOCKETS_MAX 8
=20
 #define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
--=20
2.31.1


