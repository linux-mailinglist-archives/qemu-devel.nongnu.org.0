Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24962FF983
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 01:35:40 +0100 (CET)
Received: from localhost ([::1]:36094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2kQN-0007ik-UZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 19:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1l2kOs-0006pb-6M
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 19:34:06 -0500
Received: from mail-mw2nam12on2075.outbound.protection.outlook.com
 ([40.107.244.75]:39488 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1l2kOp-0007oO-9P
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 19:34:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEzV4QMl4gXTEVEmYVekYIFAbTLza5jE6Y9ptu3XhBlgaPUGpgUG4+mGUe8Snggnr1UUv4f9cbOykhUY7dR2gAjfvcJEdlqB+LGrwvd/VO2608h7J65imdIkRHi79Zang5u3OGKgOmnB7nH57eB0gqslonMrjlJF4d6fkhu7p2GjNWNz/rxGQriSEzUGFToxmMPk2idi0vncu3YPKiyu9ha05udZ7RSXUK0W6ysKqE0WGDOHcAPOz+uy17msflo/Kqgc/EBLPKDUnDDgXucA+Lwr4pm7f/SYyII7WCT/TQNRgspZbS8j+8wMVGXTdMKeaHfxVDqISsvf6+kITWGpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBk+4u7QNRo+XKfEL4VEtXOozOvTrVZrWBBtiJSR2WA=;
 b=nsH7T+vYVn8F5qs35owRxNZHzGRrpujrPdiq85zb6bl98ltoNqbHZCQ+8hkDLvY9YPD5mw6YfTfoykVDJqghWuthJaYhVpdvrPN7pEj/61OrzoYiExwSdDCH1hdx1WUtuxqo0pfaDEtbHTW/m6Vsz0Yola7x23vcVceicCLc5i+7ljfJpsZj3W1j6nZDKwf0TGnmSUlIXJ6u/jqLJ5wBQL76hiQxla3NA3l+l+zFDQeLHBjfalOZpTyk0UaJbEBGah9odL91hiQzFwSTSWh3G7fSHG8vGGKQuBqXaQgnTWDEyAi1DmxjhNkpR2coaOnksWlMQAg8YKw6lhMr9qSoYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBk+4u7QNRo+XKfEL4VEtXOozOvTrVZrWBBtiJSR2WA=;
 b=swkRRLZVGCCqk1UpUayBAxz3gEeGBNtSXD8dxMnPQONcXR8ho1urx2NJOswLKbh2autketO8FLMTqiNpDhIvcIw3fyfi1mZF0wHni7+79/oZWCSVCAT0g1mvJyCzRyU8HFDZPDgpDCwcP5xk96JvuJBSuP0elFCNs/HZmWAmcLg=
Received: from BL1PR13CA0157.namprd13.prod.outlook.com (2603:10b6:208:2bd::12)
 by PH0PR02MB7463.namprd02.prod.outlook.com (2603:10b6:510:15::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 22 Jan
 2021 00:18:58 +0000
Received: from BL2NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2bd:cafe::6a) by BL1PR13CA0157.outlook.office365.com
 (2603:10b6:208:2bd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.6 via Frontend
 Transport; Fri, 22 Jan 2021 00:18:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT024.mail.protection.outlook.com (10.152.77.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Fri, 22 Jan 2021 00:18:58 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 21 Jan 2021 16:18:55 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 21 Jan 2021 16:18:55 -0800
Received: from [172.19.2.32] (port=58488 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1l2kAB-0001Bj-JC; Thu, 21 Jan 2021 16:18:55 -0800
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 3/3] target/microblaze: Add security attributes on memory
 transactions
Date: Thu, 21 Jan 2021 16:18:55 -0800
Message-ID: <1611274735-303873-4-git-send-email-komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611274735-303873-1-git-send-email-komlodi@xilinx.com>
References: <1611274735-303873-1-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a9bb3a2-458d-4505-75eb-08d8be6b5009
X-MS-TrafficTypeDiagnostic: PH0PR02MB7463:
X-Microsoft-Antispam-PRVS: <PH0PR02MB746324ECB58579F6F9B15707D0A00@PH0PR02MB7463.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qe1m6P5vGwNFg8el9wCMlfXmvVzPf61YmPSGOIa59cVHA8JgeJ90l+tkoEtFmoJWjcMD+a9VrOlbYPsCC+kjO7kC8jCOUfJzreROtas9KN3sMs8dDJBxfQlLM1GNUlscafLwI764LVOGdEAcCocgqypDviQy1v4KAY9TlTusH+dsSExI8mhaFu2hh8zWV+rwbJ3DAgDTnU4jumTUN14uwvGhyWADUKDvux/YXoSsaEzaDMljtMPKYhmk+efrQ2q75uqqiyFi5jmt1j5voaur6Ok1Van3IK4/zadHxkDLVdFd+ToWtBOOp/1V2LKevEw0kJM6e9Fp7pk4jeq+5hnWL0vzabfARx7bhTFzSwSGJjYxoZ5inO0odPSWPGjeef0w4hR4jwHoyjid+rHzPuaFDYH5rWLpb3w/33fBTEMA46ZPdZ4R4wnUps7PhDWdrLsOofESm1CXPhDmbxhSM2YR8CLS5Zbq0Hq/xvsgv/deszWdsw+GYBMOE07DtR8DQoTi
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(46966006)(316002)(44832011)(186003)(478600001)(4326008)(356005)(86362001)(7696005)(5660300002)(6916009)(2616005)(36906005)(2906002)(8676002)(82740400003)(83380400001)(7636003)(26005)(336012)(70586007)(82310400003)(8936002)(70206006)(107886003)(9786002)(36756003)(47076005)(426003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 00:18:58.5091 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9bb3a2-458d-4505-75eb-08d8be6b5009
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7463
Received-SPF: pass client-ip=40.107.244.75; envelope-from=komlodi@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgari@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using the cfg.use_non_secure bitfield and the MMU access type, we can determine
if the access should be secure or not.

Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
---
 target/microblaze/cpu.c    |  2 +-
 target/microblaze/cpu.h    |  3 ++-
 target/microblaze/helper.c | 26 +++++++++++++++++++++++---
 3 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index accfb23..d5e8bfe 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -375,7 +375,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->tlb_fill = mb_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->do_transaction_failed = mb_cpu_transaction_failed;
-    cc->get_phys_page_debug = mb_cpu_get_phys_page_debug;
+    cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
     dc->vmsd = &vmstate_mb_cpu;
 #endif
     device_class_set_props(dc, mb_properties);
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 199cfb0..e4bba8a 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -361,7 +361,8 @@ void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr);
 void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr mb_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                        MemTxAttrs *attrs);
 int mb_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int mb_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index cda14a1..20dbd67 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -46,6 +46,16 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #else /* !CONFIG_USER_ONLY */
 
+static bool mb_cpu_access_is_secure(MicroBlazeCPU *cpu,
+                                    MMUAccessType access_type)
+{
+    if (access_type == MMU_INST_FETCH) {
+        return !cpu->ns_axi_ip;
+    } else {
+        return !cpu->ns_axi_dp;
+    }
+}
+
 bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                      MMUAccessType access_type, int mmu_idx,
                      bool probe, uintptr_t retaddr)
@@ -55,12 +65,16 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     MicroBlazeMMULookup lu;
     unsigned int hit;
     int prot;
+    MemTxAttrs attrs = {};
+
+    attrs.secure = mb_cpu_access_is_secure(cpu, access_type);
 
     if (mmu_idx == MMU_NOMMU_IDX) {
         /* MMU disabled or not available.  */
         address &= TARGET_PAGE_MASK;
         prot = PAGE_BITS;
-        tlb_set_page(cs, address, address, prot, mmu_idx, TARGET_PAGE_SIZE);
+        tlb_set_page_with_attrs(cs, address, address, attrs, prot, mmu_idx,
+                                TARGET_PAGE_SIZE);
         return true;
     }
 
@@ -71,7 +85,8 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
         qemu_log_mask(CPU_LOG_MMU, "MMU map mmu=%d v=%x p=%x prot=%x\n",
                       mmu_idx, vaddr, paddr, lu.prot);
-        tlb_set_page(cs, vaddr, paddr, lu.prot, mmu_idx, TARGET_PAGE_SIZE);
+        tlb_set_page_with_attrs(cs, vaddr, paddr, attrs, lu.prot, mmu_idx,
+                                TARGET_PAGE_SIZE);
         return true;
     }
 
@@ -230,7 +245,8 @@ void mb_cpu_do_interrupt(CPUState *cs)
     }
 }
 
-hwaddr mb_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
+                                        MemTxAttrs *attrs)
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
     CPUMBState *env = &cpu->env;
@@ -239,6 +255,10 @@ hwaddr mb_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     int mmu_idx = cpu_mmu_index(env, false);
     unsigned int hit;
 
+    /* Caller doesn't initialize */
+    *attrs = (MemTxAttrs) {};
+    attrs->secure = mb_cpu_access_is_secure(cpu, MMU_DATA_LOAD);
+
     if (mmu_idx != MMU_NOMMU_IDX) {
         hit = mmu_translate(cpu, &lu, addr, 0, 0);
         if (hit) {
-- 
2.7.4


