Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E234C37A4AC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:36:25 +0200 (CEST)
Received: from localhost ([::1]:40928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPkW-0001kF-Uw
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVj-0000Jm-Lc
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:11 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVf-0006X1-G6
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728462; x=1652264462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YgQJw7SjjqySGEU0p7K3VL1nspJ4011lufPoQdJ7iF0=;
 b=mljbZxKRh+/93BSZ0CmEsI9mf6ZCv5xjXRI5riP+mltvSYsii2E7rCg1
 vJSkHM7CKUQJHLHF3xZ/d+DycToE+f0HgNsAs9ZS/Xlk//SmSsFRlHkHk
 iprW4+wOGd0MWAcGx74d7us3QARPxIfgBMY1cLXhpn/ESMjYJSgYZBqH/
 vryw2ORhEj40PoDyeGa/JFZxhsBI/lmckm1NBBBsiCKFconWeUGcXYBSf
 0DDq1T06lFzluuzPZ4DSDMtZTMHLLqKqp/CSpxhjm08mzRUO9ZAVRs2Xe
 pwBI0ZaJ+FKK7kCK60Umd2cDa217qFvgLaKbHjFeXymhgwiRZVrwR/23u w==;
IronPort-SDR: HF9grLUzryuz3n5lz8Zuor6rjL6Wei0ZJk0ppm+0DtzFXLZxW8UPI/sFtB0Z/dSkLAi7i0yYHd
 RdCClAul+0MMbr+M1wb5NoOSJD25MFiDCdVVVcUXLJ7jmwjR5tMGaAoT/aWu8VNLlCA3SyV6C/
 AubSmAMeLSOZqDBzaBxnI+KL36bupmgCOInORcIm3KT9KSNHU+f3ompfEBM46+zJ6Q9IsljWWx
 J4Szmofg0bJ3NUC0TZs7g1keqDmcoE5WPzfYSZ3+4FoAtHxtk6RMfM/YM95rD0idmXOJRjbuMm
 HIA=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735389"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:20:47 +0800
IronPort-SDR: XAnVxEF5C3+pUudpYDgPj7q/enVmp6bc71mc0VX2vomzZ40vpzAZZpPXHdWIzkleTg55v7F50s
 Zo76C3lG/Y3/BvuRiNYFG0EyUKc2Ilobw6EA6qk3wUv8DIUeEBlezzInX5kwx1G6tgwe+QktMS
 OZa/WOLcwtrTfbDHxDSlpVErjggNF7Lf5zVVBrdry8bP98fkqPv3Jj1IO8zTKbCc1+wdR2iRjp
 zsFp5wnHe3NfT5P4N1Ik0JMUdbtT4IYJo8oS/fpWaSDT8ij1SiOthYSphvZOB9tpAYR/e+PsnV
 ZQIlq4gVo7pwjdATxuF5TMTV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:00:47 -0700
IronPort-SDR: g46sVhfQqGDgqq+vPEBe2vTi9r3tKoAxNh6VODK9qsIiFX/9rhiMFucJSx1uvQEWomdeOuBB3z
 01t0vSgyDOmJeI1+Vyj+IyOJ5m5Bsa7Y8Pck1lKjDADdpVE4vJM/s2kauKK3fCRLWDYv13pZF7
 cnxg5+nosmytC5Haybrsfsfyp9JfmBgSR0QhniV9R9B6a0j9MhsE9qNkW+xyrLDwRoEs5xvLAO
 6KV1Kdwg3keYWliBxIbkeo/13MgijzXfG+9avKUcYktJRqpKw72D2QahNu3XbgIDgF36a0Pid6
 +Bg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:20:46 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 14/42] MAINTAINERS: Update the RISC-V CPU Maintainers
Date: Tue, 11 May 2021 20:19:23 +1000
Message-Id: <20210511101951.165287-15-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the RISC-V maintainers by removing Sagar and Bastian who haven't
been involved recently.

Also add Bin who has been helping with reviews.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 6564ba829c40ad9aa7d28f43be69d8eb5cf4b56b.1617749142.git.alistair.francis@wdc.com
---
 MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7aaa304b1e..3ace764d29 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -295,9 +295,8 @@ F: tests/acceptance/machine_ppc.py
 
 RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
-M: Alistair Francis <Alistair.Francis@wdc.com>
-M: Sagar Karandikar <sagark@eecs.berkeley.edu>
-M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
+M: Alistair Francis <alistair.francis@wdc.com>
+M: Bin Meng <bin.meng@windriver.com>
 L: qemu-riscv@nongnu.org
 S: Supported
 F: target/riscv/
-- 
2.31.1


