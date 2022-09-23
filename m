Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB785E72D8
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:23:22 +0200 (CEST)
Received: from localhost ([::1]:41320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obaDh-00060f-DQ
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyy-0002cA-BP
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:08:08 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:63969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyj-0005ek-1J
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663906072; x=1695442072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QyBVGcd6Cwcjc0ADM0uVkz/DPsRMQf9EmyGrDa37jrI=;
 b=rHSWSmKsQ9yL9gLLICNxsty+si9+Txr9YHjkGO8vtSu5PZsXejcSgoq0
 tRagRHargMjfa83VTnUQHjWH2EP0lu1xoDo+KiWwfCqwChhF14l7htwEO
 XxDblPgpz2789Vi6UdYnyQPK6pMFc5o0+AFV97MlrTE2lZwnGT750G+3y
 auWEWQ9PIiuTnQi1gdFuYNHIWO7FKjMyQsPFhho0VO0tXDulJFrsrDSLz
 HnYsLlYyzfgU6T2KSVY7OrSKf58OZuHoQvAH6UCVMwQCg2t+upU6gwLhK
 a0WvG8c4F0nNXV59PZtMkCoxCN74T5plOOj97BBPVaZz/pWf1bkFDJRSR Q==;
X-IronPort-AV: E=Sophos;i="5.93,337,1654531200"; d="scan'208";a="212510490"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Sep 2022 12:07:42 +0800
IronPort-SDR: LgfEjtvico6VRXnixxMuIDIqsHbbgBFyxd3ZitkAnfIniErtF9VTbttIm4bMr57FXVvffRfmoX
 CVXagxu/bM0DS0L4jOalil1DCGDTLk/J/+zKu7e1fIvaxfQQtvb4hV7Ive4DWir6uu78lqY7nC
 ugMJg6Pq1sgkeUMwWiIXtyQaHPvsIpLLmx5t0GA920gGsJtFe+O7UDhrnQ8t+qEWxbLhVdbM41
 Vr7t9eYBo6AEYzloXrMo+4DI+UxpRDx7zYtNp4+gWNLorWwYmmtS1zxSWhHoPAxBP5J4nVAWVc
 DNkX85f7y7J/4nShYHQ8xxxM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 20:27:44 -0700
IronPort-SDR: VZIVSIkI/SWDioTwdmJeUgB7dL5EF/UnHPJgrT2EL25a3JaOrmzJiFANOngHHWtckcS1NnVFwo
 KxWfBUxfxqKVVjBKSCeA7BV6Zj6Kg5Asj403RBr5MtA9YFHHiEAZQkL2rkOrt0EskehbaP0+EM
 SyJfFTz9ejVBSvPb0Sc9PayfNCifTarWeyuLaKKK1JL4zC9DQeCgr88PDWGayQSY5g1SkEjjr/
 E/PIAIdHv+Rt60njom3eE4NeaFUcy8FHrn5RxLHDlxwrOTQiP9OKwKPNma083Df5t7xrfingTq
 kmM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 21:07:42 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MYdsT6fR6z1RwqL
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 21:07:41 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1663906061; x=1666498062; bh=QyBVGcd
 6Cwcjc0ADM0uVkz/DPsRMQf9EmyGrDa37jrI=; b=c8DJN2FX7U/f5RTtegxb6JV
 z6aktqCgkkeExveFOZvNaMXbP8RC4BRznFfWdDby9oc//IZ+asylVKTjrQK6u10c
 xOMvVj5N7yB3z6vektqYd0+b8aG4wiM9kuojd7fSJtfJSha641R1QC6VIWOyMlMn
 8n2XNXk+Odd223smukWH949/Dz/fYicLh7CPH0bwyHNqhbWsI991m6El3jtQWdP/
 thDIjdoGR+3YxbsSnI37J07krY6ssyPU3KqBSgCFR47FDyOuWUUzYsKkRJy0j8/+
 OfIDJMK9pTcdoH7YMAYul6WQHRMY38P4x57Zr6QhhBqyRIYQ8eytbHORb1UDvbA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6Ug38rLdCNMj for <qemu-devel@nongnu.org>;
 Thu, 22 Sep 2022 21:07:41 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MYdsR5My2z1RvLy;
 Thu, 22 Sep 2022 21:07:39 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bernhard Beschow <shentey@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 12/12] hw/riscv/sifive_e: Fix inheritance of SiFiveEState
Date: Fri, 23 Sep 2022 14:07:04 +1000
Message-Id: <20220923040704.428285-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
References: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2580c328f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

SiFiveEState inherits from SysBusDevice while it's TypeInfo claims it to
inherit from TYPE_MACHINE. This is an inconsistency which can cause
undefined behavior such as memory corruption.

Change SiFiveEState to inherit from MachineState since it is registered
as a machine.

Fixes: 0869490b1c ("riscv: sifive_e: Manually define the machine")

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20220922075232.33653-1-shentey@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/sifive_e.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 83604da805..d738745925 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -22,6 +22,7 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_cpu.h"
 #include "hw/gpio/sifive_gpio.h"
+#include "hw/boards.h"
=20
 #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
 #define RISCV_E_SOC(obj) \
@@ -41,7 +42,7 @@ typedef struct SiFiveESoCState {
=20
 typedef struct SiFiveEState {
     /*< private >*/
-    SysBusDevice parent_obj;
+    MachineState parent_obj;
=20
     /*< public >*/
     SiFiveESoCState soc;
--=20
2.37.3


