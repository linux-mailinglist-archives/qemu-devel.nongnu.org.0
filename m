Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7D34881BF
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:05:00 +0100 (CET)
Received: from localhost ([::1]:38670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n64qZ-0001hK-HE
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:04:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64do-0007vL-33
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:48 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:26409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dm-0006pu-J5
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621106; x=1673157106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uIhpWUihOSOfldMlG8nKeASNYhEq4rYSof/hZiJsdGI=;
 b=LO/nrHUG8wR1JFUugS9EfRuVebebY+JayvRdXLFtd8GZMkjMcID2rt/H
 /o2cwvAP+8vY8s4LbtYmZHT3u/ufoCMQzgIVfHLLblNBjptBpBJCR3J/2
 0COgHcMu2DbecHZ5z2q8jWlSRxjO7lBIeoNIqUZGfvXsv+GgdoiOJEI63
 PxrEnSg54+XmDdM6T6dpXIO/9wW5Ikm3ZHxSHUaUhFXIWb7n19zrj4oFt
 4NAAEYpRVH6a25YeTrAxgG8jfrLi4GSb3mCb6R6VijEAxIWywKEw58ADb
 rCM8eUBhtVgl3gVMDTA7dz0aFYkc+N+astTmKR7EBVnjhBtrKpvlLUkrL Q==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="294027352"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:51:43 +0800
IronPort-SDR: U5XuRcXeKb216SwjQ2rbWYEeeycMI+xajWm6nnIc15m8E5Dhi7W9JEHO2F8Ec6FP08I6EMhyQT
 CuFwOPwIv5ZsYeliLWKfOTy5mIPZF0CkwOfqi2k90P/7DAfgDteA/+/6DeH+0BJufClUrRM1bC
 NtiRoehiwBuBJFqWWAaJyB/+uX3Gy5qZ8X8+rgWbsOmXj9OAwwNTBZ8BztwqcaGO8QEY5Jj2Hq
 AZwE/DUHw7qq4bvMlg1dN92DCRIUkuEBDuhW6KvYWSE6njJyWBSvqSAo+kUtmY+4ashHEdghjZ
 rPA+ctYxOK6GL11/bZ8jqcvc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:31 -0800
IronPort-SDR: Debn/tciDyuTqievMNzO5+wlrgfqAS+VG3K60x/Ct3KaEIAHYgTr/gLBiXtqli8lPlFGTrYtlE
 wN1xlt1FK+oqghaowPEdg+mag5lEkcFtWw6LjquqRWYfsUvuokGXqI/fmcS/dQfF3jOQS+GluP
 7WxX409HOQJ1X3nf9YmM43CmIjpvDLH6ZCb49Fk/SneIfx7tcU76N/Ew7siNFxLdDZGYuKtsy+
 9OxxMvF+a2gnqRJ5osE3Yb0FKcQ6TIA4vZACPt7qpg9Bja584Qh7JZ6bI+MmVDnO3Gtz7xUPIf
 gVs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:51:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Nb30Jbz1VSkY
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:51:43 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641621103; x=1644213104; bh=uIhpWUihOSOfldMlG8
 nKeASNYhEq4rYSof/hZiJsdGI=; b=IR3WvQB/ASmRTRL2HprBVJCkcZ16D74axR
 P+rivU21q7wo1WVha9VmH5PYbBmZX+YP0OTaNi6ZFgyq6avSEkqcEJgMtYpiemi4
 ZMTV/+kK/rMasP6atTeYmqQB5ivKCV5k5YuknspVDXy1EcMLGP160jgCEUNFNwbA
 QVaJTgpbyhCB8HXle7IVSE+sla37KKwvlMA2ZqWpJme36l8QezVVmMH0Xd4uiu4u
 L/shFf/K6nPkjC2jdAux8BYmVLXorRZYIaR2Z16/olCI5gLYdP6balX5tgeVwvw8
 ZY50oumDOTeq+weOXcJoRT4kbWJE2d5xjyifSsMBySDVCv/eLYIQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2GCZLlIa2W4d for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:51:43 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8NW4c7Nz1VSkV;
 Fri,  7 Jan 2022 21:51:39 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 09/37] target/riscv: Enable the Hypervisor extension by default
Date: Sat,  8 Jan 2022 15:50:20 +1000
Message-Id: <20220108055048.3512645-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>

Let's enable the Hypervisor extension by default. This doesn't affect
named CPUs (such as lowrisc-ibex or sifive-u54) but does enable the
Hypervisor extensions by default for the virt machine.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220105213937.1113508-7-alistair.francis@opensource.wdc.com=
>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9ea67bedd3..29749e834f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -627,7 +627,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
--=20
2.31.1


