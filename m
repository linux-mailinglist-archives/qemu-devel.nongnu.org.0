Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEA24845CD
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 17:09:24 +0100 (CET)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4mNH-0003o2-Au
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 11:09:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n4mLO-0002P3-HV
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 11:07:26 -0500
Received: from [2a01:111:f400:7e1b::622] (port=19969
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n4mLF-0007WD-6e
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 11:07:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLVlfMLYVpcQ3sGYg0ydtkTu+otgxjKzvjliRXHysSwQWWXcyP9Z7r4JXonbcBW0Ou4bXZuRCNe6fDadVA0KkeQYZcpSBDJv8ZCFFsmoXwgg0qTQd5oAUIft3JtOIbLvkhoeXDH5Q0DeQNHBxCTvoc0EpPKMkZg7WqXGSrjiuV+1jV0jyDDban6nDuuGFuW7JmPkCF5KECIbIcAO94EhAkKrotDaaWj9JPpQP6colwH0ktpOcfYhHtk+hMa/qF574+OOeAxRevkDLy9OssJPc15pyS3td7juMMrLyF3rOJbVrkkwk/7FtkX0rb6GmhjnmAhWnD9k1LXMn9x7Po7TQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+sJVZQGTBS+NDCnc3db/SEFgyKJFzn5uyewG9hMDiY=;
 b=Goeic7OQ3HWlfE/urumqkemfktWyl45STSUoH4TFRRjTI2eBl0R8QOnZsUglA1DqgQadiI0sC0gl33ewz/pRHv10rQaP6hT3PMU3VRypJpm3VycpABfoBhgw28hNMSDergrTat4gOFsWuOfDQfNJnjKAZkuQctcl2SwPI2IheCuwG12mtyRc7I0bMaZThIkdEjgWNGsnooTHthEN8LWpuOiwPzoj9S8Y9cHWn6J++MseacsppsfJBYk6J5/Lx7rZous6oo3RpfNG/Dl7fDAnM0cO2UmWRwdL4pvz1Ol0Aonj95jTdZk7c9dADSs2aB1vxHWKsRcesAXOFLuNC2GElg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=nongnu.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+sJVZQGTBS+NDCnc3db/SEFgyKJFzn5uyewG9hMDiY=;
 b=yZKk1ltt1OTuCiUXeGJnmw2xVXFPtlPsT0+h8nKQ8XgImwSv8GJL9cWpV8oCh6tZ6Jhrc38JzOgoy2Oi4ZqYMCO09MQlkMp7XO/dl0C1YLQ3d0d49XqGM6CaPxUvwwUwRCVmKOmGoHsv1v/GXxNiqa2IhYxzNUi5G3aXmPDBvcBNPAnx67OuBVH6VmkD2nywv82D+ep52prDSNhE94oFG0TF6C/v4Kj74ciHjLi1Cb74LbtwOZnoU4wHVqb/XkLl3raUStxwE4gNUzNJ4JYvhDtzOnHcj+/othLESWdiX01rG4IgfQ26sKKVqe4eyvFvwkSfx8vzc2HlHBwu4vaogA==
Received: from AS8PR04CA0138.eurprd04.prod.outlook.com (2603:10a6:20b:127::23)
 by PR3PR10MB4112.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:af::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 15:52:16 +0000
Received: from VE1EUR01FT054.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::82) by AS8PR04CA0138.outlook.office365.com
 (2603:10a6:20b:127::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14 via Frontend
 Transport; Tue, 4 Jan 2022 15:52:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 VE1EUR01FT054.mail.protection.outlook.com (10.152.2.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4844.14 via Frontend Transport; Tue, 4 Jan 2022 15:52:15 +0000
Received: from DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 4 Jan 2022 16:52:15 +0100
Received: from fedora.vmnet8.md1wgtfc (139.21.146.182) by
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 4 Jan 2022 16:52:14 +0100
From: Konrad Schwarz <konrad.schwarz@siemens.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 5/5] RISC-V: Add `v' (virtualization mode) bit to the
 `priv' virtual debug register
Date: Tue, 4 Jan 2022 16:51:20 +0100
Message-ID: <b9d0ff9403c1faa66968847fe6bd8ce1e886f5ac.1641309725.git.konrad.schwarz@siemens.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1641309725.git.konrad.schwarz@siemens.com>
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
 <cover.1641309725.git.konrad.schwarz@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.21.146.182]
X-ClientProxiedBy: DEMCHDC89YA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b34c809-2f19-434c-a89e-08d9cf9a2e63
X-MS-TrafficTypeDiagnostic: PR3PR10MB4112:EE_
X-Microsoft-Antispam-PRVS: <PR3PR10MB41126A47CD3B8D344ACBDD3F8A4A9@PR3PR10MB4112.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1pwFWNarnzTzlAm8Lx57rW14iRD60J9NF4pE+3dbjUg6QDWC+90CNZaEJ3fu9CBvNhwDXt7pQ6TSL3GFOIwkjA45GCx+ltl0qxzvbYzkhUA57mj8V3DYF5sf76VLgt2b9eTmI3wz25PG2IkPI81jvtjfsLhbpZ0Bu+QijP/cbQUoSoDYcrNAWc7W0WWhOMY+y1nJMxiWAqy4k/MiYjalWjdymyc6hDBm8zk8ozzONFfFgIZQsdoY2rVEkUpMNAgHEJejH49A2jYbPmkWTM5mk2fQD9QArmC/FffhyX+rF0XdCgQ5awLqCblqHJpYTcqnYDa3CKngfBvFgKGj38BscGyHUONreZsyl6pbfu1S6DW9JvjJ6haTzftSvs5jDd37/Q8JfKxBq47AVBVli1e8jhqRXD+AJ3+9zfSfQAmi9kOAjR8GstMw86fxCZ1F5AHJ9sJP0NuMYubO+NIaShDl1TgcYTIPRwDrwuvsd5ZUWv1TIb7og8mQ+IiCITWvio1MsQ95+CGD6ttcP3/c3lpoZz4/lL+TpSNRaGoGpKMUuTuRg51vjoxG/NNuk1sNahxMObxVWPX0aDy2NbBpjbyY9tDkQ7j+wK8ZGVmkmD8F1o8HAMOx5S80ohlLDJmhp40C2AjXQC7h4UdE4snZEkhmo4QOHnTQPBZPevo1mSOCt4+v9pT8lHkFy/wBYPpdEcvYfjjKq7QRkcTaPHxUH2WfLFY7QCA5bsPRQz/6ihKDzw0/ofcj0Acrwp/mhIntvWzz6Diu+8bxk8iW4FucdM+ADIjRjV2rM5ZqjjikTlJOdz3ydlIO8kRWLXckpjFWTCdSkS3M3cpG0zE/RsQP4unEwQ==
X-Forefront-Antispam-Report: CIP:194.138.21.71; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:hybrid.siemens.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(44832011)(36756003)(16526019)(956004)(186003)(26005)(2616005)(54906003)(6666004)(47076005)(70206006)(356005)(4326008)(36860700001)(82310400004)(86362001)(508600001)(8936002)(81166007)(8676002)(70586007)(5660300002)(2906002)(6916009)(316002)(40460700001)(83380400001)(82960400001)(336012)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 15:52:15.9363 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b34c809-2f19-434c-a89e-08d9cf9a2e63
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a; Ip=[194.138.21.71];
 Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT054.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4112
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::622
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::622;
 envelope-from=konrad.schwarz@siemens.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Konrad Schwarz <konrad.schwarz@siemens.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The RISC-V Debug Support specification suggests debuggers provide
"virtual debug registers" to show state not directly visible in the ISA,
and defines one such register, `priv', which encodes the processor's
current operating mode in the two least significant bits.

GDB represents virtual debug registers in the `org.gnu.gdb.riscv.virtual'
feature of RISC-V target descriptions.

This patch adds the `v' (hypervisor virtualization mode) bit
to `priv' as specified by section 4.9.1 of version 1.0 of the
RISC-V Debug Support specification.

Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
---
 gdb-xml/riscv-32bit-virtual.xml | 30 ++++++++++++++++++++++++++++--
 gdb-xml/riscv-64bit-virtual.xml | 30 ++++++++++++++++++++++++++++--
 target/riscv/gdbstub.c          |  5 ++++-
 3 files changed, 60 insertions(+), 5 deletions(-)

diff --git a/gdb-xml/riscv-32bit-virtual.xml b/gdb-xml/riscv-32bit-virtual.xml
index 905f1c555d..7dad42cd67 100644
--- a/gdb-xml/riscv-32bit-virtual.xml
+++ b/gdb-xml/riscv-32bit-virtual.xml
@@ -5,7 +5,33 @@
      are permitted in any medium without royalty provided the copyright
      notice and this notice are preserved.  -->
 
+<!-- Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com -->
+
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
-<feature name="org.gnu.gdb.riscv.virtual">
-  <reg name="priv" bitsize="32"/>
+
+<feature	name="org.gnu.gdb.riscv.virtual" >
+
+<enum id="priv-current_priv-type" size="4" >
+	<evalue	name="user"	value="0" />
+	<evalue	name="supervisor"	value="1" />
+	<evalue	name="machine"	value="3" />
+</enum>
+
+
+<flags id="priv-fields"	size="4" >
+	<field	name="current_priv"	start="0"	end="1"
+		type="priv-current_priv-type" />
+	<field	name="v"	start="2"	end="2" />
+</flags>
+
+
+<reg	name="priv"
+		bitsize="32"
+		regnum="69"
+		save-restore="no"
+		type="priv-fields"
+		group="gdb-virtual"
+/>
+
+
 </feature>
diff --git a/gdb-xml/riscv-64bit-virtual.xml b/gdb-xml/riscv-64bit-virtual.xml
index 62d86c237b..02c234670d 100644
--- a/gdb-xml/riscv-64bit-virtual.xml
+++ b/gdb-xml/riscv-64bit-virtual.xml
@@ -5,7 +5,33 @@
      are permitted in any medium without royalty provided the copyright
      notice and this notice are preserved.  -->
 
+<!-- Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com -->
+
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
-<feature name="org.gnu.gdb.riscv.virtual">
-  <reg name="priv" bitsize="64"/>
+
+<feature	name="org.gnu.gdb.riscv.virtual" >
+
+<enum id="priv-current_priv-type" size="8" >
+	<evalue	name="user"	value="0" />
+	<evalue	name="supervisor"	value="1" />
+	<evalue	name="machine"	value="3" />
+</enum>
+
+
+<flags id="priv-fields"	size="8" >
+	<field	name="current_priv"	start="0"	end="1"
+		type="priv-current_priv-type" />
+	<field	name="v"	start="2"	end="2" />
+</flags>
+
+
+<reg	name="priv"
+		bitsize="64"
+		regnum="69"
+		save-restore="no"
+		type="priv-fields"
+		group="gdb-virtual"
+/>
+
+
 </feature>
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 9c3f68eeaf..b3fa9f864e 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -136,7 +136,10 @@ static int riscv_gdb_get_virtual(CPURISCVState *cs, GByteArray *buf, int n)
 #ifdef CONFIG_USER_ONLY
         return gdb_get_regl(buf, 0);
 #else
-        return gdb_get_regl(buf, cs->priv);
+	RISCVCPU *const cpu = RISCV_CPU(cs);
+	CPURISCVState *const env = &cpu->env;
+        return gdb_get_regl(buf, riscv_cpu_virt_enabled(env) << 2 | cs->priv);
+		/* per RISCV Debug Spec 1.0, 4.9.1 */
 #endif
     }
     return 0;
-- 
Konrad Schwarz


