Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FA465065D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:27:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75jm-0001G9-Fl; Sun, 18 Dec 2022 21:18:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jh-00016f-L5
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:37 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jf-0001BQ-Ui
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416315; x=1702952315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WRx6Vvid93Q1T1mtyE/QThVhuj/pNvv5e8rHnvs+X88=;
 b=M5ewo9Tlz8xu4K4T0pzYBKgPiQvugIC4Cf88Y2+CbuR/n7Qh5rULHtYl
 YhczEjVNGZ4VIGrQY+b+hlifZLGSQf0gdMu4hi3+eu9fYU3eA9oWX21t4
 W5RJDxMVVakc5gwp39QAOSa6+m7vlt/EGTvz+eB8EtiT3gk1Qz+SnDaUV
 2dc9Oo5tnKeQ1pymEW88eaBN+1X+AjpM8GC+Bl7Mh4HcioljMm6bxyUW8
 6fxHVLeWlpvEu6zfZHwPMPRzTnmb5ZN+K48+7vC3MpbC3YxkCn24Me3kn
 DuX78CkruWBmm+q13jg2UwWm4QsRIvUCIEv5Z4zq70l6sJbx8dNHS9MRW g==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056810"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:34 +0800
IronPort-SDR: 7rNUoEBH8yZBCVsq0ymuZuUvVv0Q9Rzix67rnrx7N9lIyWEslgA6ufyDlOyzWZgU8oHpI5LoMX
 whsdzDLVDTa+n7wl34q758wc2r4s7hzWLoln5hbd/ZZx/nsC3kcAjfmozkQ7oV9DJrZfbgMPIC
 pBssQ722FKmPBsFqBW03bGWekrLc+vK1QtXK+U7aJEQQBmtgDiciNNnptqJV3h5CCTI9FNEHik
 tcxVm1UCfo2cMWfvIi5cz68SK6ompavEBUwQfZN4yIn4v8nR9TNcY0Gz2v4Q8Zrz2zvecVOsNL
 eY8=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:36:51 -0800
IronPort-SDR: GqWpCtM1wSvb+AGJ7RX4OEv6bSqJ7LXQOu3BLKUbpFJX+vVm3KL/I84ths/mKvQ9Fa8mK+0gko
 UsOPLrbCZ3MPYwU2t+2foFT69KXQo7kdsdQRf1rgm6e1ZeZXxCrR38DGgPPsLsPUhgxmCsnv2g
 2dc6desWbcCr4kXmoxGlZ4A8xl/nFCN8/tBuXg08+LCrIxq1SjSgFLzXtNV0RSuX91+bPh/Jfc
 V7lHs1/qTMyXFFa1/VpzyPikE3xmw0/Bq1KjAaEvy3/gShnoKJoSWTHAEZYfM+zpP47+RLvc59
 VpA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:35 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3KQ6xsxz1RwqL
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:34 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416314; x=1674008315; bh=WRx6Vvid93Q1T1mtyE
 /QThVhuj/pNvv5e8rHnvs+X88=; b=dgo/YE+dMPTG3Yl2DHKai08c+VpT0vY3ER
 myvp3pVJqNxgu/R42U8M1MiXcLX7UlOoAR5+QkC4rcvgO/zSgqKkkENjWykB7uKm
 7+d3mQqnFYPD5eltpwLruVfP8V772pE46oELmvIgaDGoh066zjEXxQh+Z4AQG+t2
 Elxtb7x/srV9fKU2+A1foF/v3Fzrnn+W3U5AHtN9DKdh1ZvOya5XPIjyo9xVHS9J
 8+pNfH6qwIew5r/3gAghlnqXhj0OfPNKWdx9LIYU5RoYPSJORJSIqvV451fGvwU5
 vAQ4BgDr4Xsq14vXgQC6M8oR4npUdYTdUU+2MSqSCD4RO0odWibw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iTIbZNXOGgSg for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:34 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3KN3CHlz1Rwtl;
 Sun, 18 Dec 2022 18:18:32 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 34/45] hw/riscv: spike: Remove misleading comments
Date: Mon, 19 Dec 2022 12:16:52 +1000
Message-Id: <20221219021703.20473-35-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

PLIC is not included in the 'spike' machine.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-5-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/spike.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 1e1d752c00..13946acf0d 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -8,7 +8,6 @@
  *
  * 0) HTIF Console and Poweroff
  * 1) CLINT (Timer and IPI)
- * 2) PLIC (Platform Level Interrupt Controller)
  *
  * This program is free software; you can redistribute it and/or modify =
it
  * under the terms and conditions of the GNU General Public License,
--=20
2.38.1


