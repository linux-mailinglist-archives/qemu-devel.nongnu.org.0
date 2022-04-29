Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1CA514199
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:54:05 +0200 (CEST)
Received: from localhost ([::1]:46946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIdo-0003zC-5z
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJD-0008Mt-7S
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:47 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJB-0002Wg-DP
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206764; x=1682742764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mB/n7KTJPbvH6YcNF3qmWySZx/mQqAHotQ3wzD96ZAo=;
 b=PHmV5WGpkxmfVO/UOH+7yayLtm6TLyMP2p9PxoOR5YdM948sVKYQlhO6
 W7zSf1XksVOCGRzFGu6j1YDlQ7JBnCTpyuik/+Fn630eJXdvHFYrEElaF
 ST6PI824s6nUsnnOlH/jBZ1s9bFzm0a29FbkzBsL4Y33mFN4UpqKmXSzu
 6Z+tJQ1vOM+ebWw3ZuX0YdMxYvPr5213zmqCAQ9IPxp8f3umm/fqZ0r9R
 Eccw6MINXEuh/tl2ntaDj0mnWJwE7jh9qkxv0S1WvNyR5nLR0HWdbmopt
 Ox6Y3VfDHeTil9I3o1J2avLqZgSn9hTTFk7HTf3D8n9K8bujmzP6okJd/ g==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995977"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:33 +0800
IronPort-SDR: SnuWB3SSV2o0viHWNEFITY6EUKrspRVSO1cGC+Z/n7bK59gGyTZ9uPj2uvoJltIP2xes9pd/QV
 +CX0Pe0KTWbmWZsbpxiEgmit4lORHs4udds9BLu+TRYMIj/EIbY/E02SYkZe0CgqQoRCAy/F7R
 +HGnD4GCnJS0Nu0HW6VwLbefrdDJIyZ1RgwSmGr9QEdqDyLOI7GA1oJhnKx+xGVh1KWM7SU8H7
 JaokiUDhyTuF2Pz2HH7O2AmSam4srwMuC5r7OAlzqDhXmAirR5o/XudsCNgmBREhXoSJBMOgrZ
 m/5T64/oYYKv+wYyuo7fqKgg
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:42 -0700
IronPort-SDR: IMSJ80FyBZkI7AIw5RL6+9Krny7nbflCTJvec2Z5kIByK4XIhgqLEBVm/UXXn+X8K3CZPyCQoW
 F+EOArhhLs3++AGbXVqIm3Rm4+AWSePCwYrt8puszs2e6bNAikRcl+U4BNizxeY2kMMqOOvy1n
 mOw/C4vt/S/oPQgCAGZfHZpEFoh/DsAbMM7B3x2CQJX5ZItCAf8I2U+l7Igklpr/9pNY/yos5n
 jZfrOTMPZUwOnWeCMwGqHA3X8BTfQtZpCcv2SwlsKjRPo50XY4eT1TGBlZ8XR1ULiCBbLWoDh0
 8w0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKN15Dg1z1Rvlc
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206753; x=1653798754; bh=mB/n7KTJPbvH6YcNF3
 qmWySZx/mQqAHotQ3wzD96ZAo=; b=Uk2JpiSeUcwl0U/AcCs7v60mOmXpyvCKc/
 9DdYNDFzawRMR7zt4OjemTTyA7W4uuxQZdRj0r+rIsiIrovPTUXou/ZC77hmDwSS
 azWqb4UbDGg0lMQ7oWoJGdidWR03ku8E12GnwlWx4H9y5+pgEzDKS8hFxNHpCyTw
 nofq/QJ7WedVeyLrHC+33FswQ2IzxGC1dv/MR9isvPryvlgTk/EUI9gxlw64fRvo
 e3SSmnKE/6wW5VZDvH1+I+24pdZn3HxlTO9fowOg77UBfwHF7PLm3KMa/MIeFDPv
 VP2S1q+CyPqbD/FAz5brnwTlhhwlD4CpqqfllGKIq9OM52z3fMvQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Z2foZ3zwmG9K for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:33 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKMz1Sgxz1Rvlx;
 Thu, 28 Apr 2022 21:32:30 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 17/25] target/riscv: rvk: expose zbk* and zk* properties
Date: Fri, 29 Apr 2022 14:31:11 +1000
Message-Id: <20220429043119.1478881-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220423023510.30794-15-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 62a47c197b..dff4606585 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -849,7 +849,20 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
+    DEFINE_PROP_BOOL("zbkb", RISCVCPU, cfg.ext_zbkb, false),
+    DEFINE_PROP_BOOL("zbkc", RISCVCPU, cfg.ext_zbkc, false),
+    DEFINE_PROP_BOOL("zbkx", RISCVCPU, cfg.ext_zbkx, false),
     DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
+    DEFINE_PROP_BOOL("zk", RISCVCPU, cfg.ext_zk, false),
+    DEFINE_PROP_BOOL("zkn", RISCVCPU, cfg.ext_zkn, false),
+    DEFINE_PROP_BOOL("zknd", RISCVCPU, cfg.ext_zknd, false),
+    DEFINE_PROP_BOOL("zkne", RISCVCPU, cfg.ext_zkne, false),
+    DEFINE_PROP_BOOL("zknh", RISCVCPU, cfg.ext_zknh, false),
+    DEFINE_PROP_BOOL("zkr", RISCVCPU, cfg.ext_zkr, false),
+    DEFINE_PROP_BOOL("zks", RISCVCPU, cfg.ext_zks, false),
+    DEFINE_PROP_BOOL("zksed", RISCVCPU, cfg.ext_zksed, false),
+    DEFINE_PROP_BOOL("zksh", RISCVCPU, cfg.ext_zksh, false),
+    DEFINE_PROP_BOOL("zkt", RISCVCPU, cfg.ext_zkt, false),
=20
     DEFINE_PROP_BOOL("zdinx", RISCVCPU, cfg.ext_zdinx, false),
     DEFINE_PROP_BOOL("zfinx", RISCVCPU, cfg.ext_zfinx, false),
--=20
2.35.1


