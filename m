Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C66D4845CC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 17:09:05 +0100 (CET)
Received: from localhost ([::1]:55798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4mMx-00037e-Kn
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 11:09:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n4mKt-00022O-1W
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 11:06:55 -0500
Received: from mail-eopbgr150042.outbound.protection.outlook.com
 ([40.107.15.42]:12597 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n4mKq-0007TG-0g
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 11:06:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpb3pBx1VxP+JCpzpYPIldtsd0VDsyH4l4puWaWa+sbyQqD+/JMzSeZ1i7KEFfq6Gxo3091VNhd1u1Ods/s0P/l1inJHS9IB2EsaHb8MXYPFC5iI9VMH9M2ci6KrIL3BucoVIMJssI1FCvaTf2b4nAzvBy5i9tOOtg/Obxo0RYE202qUBjAe2kFBYdheQaqF39Yv5gi1Zjqz8mU2baxDL1st1hqkGWf7y2pleuDGZvECwxmuMGPo6WtLtqHe/ECtN+g6Tpb/4ufX3iguwuCMDZlWFhbDJ6Vi1w1qOtf3Vgu8Mn8SjmlTHCck69sbKABDQdeukX5ZwtcWENF73dobAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPV3HhMW26hahtisca2elWvvoJTnvZP+z11XkraCNKY=;
 b=BelLoG18N9W2nukYFEiCbYFbmu77jLzB5enCsDi79TFkvknpVZNLXubrnGKcjAkUEbmjCkBU3Jm5AKorRSmy3RlOw74IQgMotCiMQny+tAmxuQV8JDRyqN3YU2Yr1Pkmi58Js+5bkTX4/Y/AagGc/ptafxCudmxLJ+ARdpZVg9y8G3xLo0iOd6vLUHJilzKMA6z2778phiQvCPxuA2nZ+wA//hlF5rguCA7BVWzdbINjxDKKixO3fvupqg5GkhD+Bbrx9EG3DQ7pzrWB8089GskMEO4G4IoX2ZxFeUjR5iqkemzsoC5r+GD+qVLfdPYsRvmwWr2JjiybqcqqS9rQHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=nongnu.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPV3HhMW26hahtisca2elWvvoJTnvZP+z11XkraCNKY=;
 b=iVKOzA0Mh2Rqj5QyQjvAVq3+4Gf8fDMINu3i9Io4qdcyvtsKLJxuWv89O5TNFJbnpALj1Uw/+PbJSvttl5WrwpNriK4E1Svw7PgefH6lIfNZY19OCrvAmGNyRarG/nwt64gmOKDW27ICEbCiwOfM88cO33ZDa+//KZDv8jpSX+m6QCBncvo7dBKsOhzlumEKH7JVPpyHTyTKqJ8s6HhQ3rtbXRY5/B26XumIom3rFsk3xKtzt/2w2jLVmNk+2pk2U2e0/WpO3hZZ4CbSEJxz9Eu8hOrDng/BFCr89t94uq7txdehkGLY2ITe3QGjWxyfeb1IGD97tWBywII6ipEtbQ==
Received: from AM6P193CA0042.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::19)
 by AM0PR10MB2289.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:dd::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 15:52:05 +0000
Received: from VE1EUR01FT016.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::ed) by AM6P193CA0042.outlook.office365.com
 (2603:10a6:209:8e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14 via Frontend
 Transport; Tue, 4 Jan 2022 15:52:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 VE1EUR01FT016.mail.protection.outlook.com (10.152.2.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4844.14 via Frontend Transport; Tue, 4 Jan 2022 15:52:04 +0000
Received: from DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 4 Jan 2022 16:52:03 +0100
Received: from fedora.vmnet8.md1wgtfc (139.21.146.182) by
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 4 Jan 2022 16:52:03 +0100
From: Konrad Schwarz <konrad.schwarz@siemens.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/5] Improve RISC-V debugging support.
Date: Tue, 4 Jan 2022 16:51:15 +0100
Message-ID: <cover.1641309725.git.konrad.schwarz@siemens.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.21.146.182]
X-ClientProxiedBy: DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) To
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5f62a87-6382-408f-46d2-08d9cf9a2774
X-MS-TrafficTypeDiagnostic: AM0PR10MB2289:EE_
X-Microsoft-Antispam-PRVS: <AM0PR10MB228932EE1C29FEA378F928848A4A9@AM0PR10MB2289.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mSeUTAszIDCtfcObGyKH1AFxueSLIcsPTJ+/D7YKxT+jRoa+6gRrXlMhSlR809bWEUFXj9wYfzK+HwLbx4HxiqKs1oeporp5ORjT3nzDK7SaCC80orV+a/iK2DUNEiPyKHGizS8h5IesFa0u55Md869kkRFGnpp/EuCldWq3k0Hm4fJn6APpWS0HBbSgfI3khNsnp0x9kCZAjmyda/ahFHag6MpjPPAaBSTYQPB3PFt0hzttL4xHgw1cmSWBe7tPx7SYU0RMy3Y4D6uLJLHSfhn/BnAo/laTeA+NWN2SdDqGUYM9xEfQmAHd/fRQ3NIjIFALSqEt4e5vYz0WrHd2ShIffk3BGsMcyJPgLV3wIu45wiR9AtDKcCfXZAQGKHcHKoqCimeFb9byhaZHratyenoSKccEiWL+F4WzLpWaWFBx56+T8Oykw31hKsW74mL0eXFsku9zrOK54J4lPZNjD6zwdGDRWetkRfAs63EcIIkiRyPNObR7juZcjTJ6z2ZDIDOwErpEXMq7BTlJUe0AIQjCqOREaEzcN6Dw2E+ePVrHvzs1ogvQs8nOj3h9qB8bMlu0gsYc+ZtSJlA6W08zKFrMKv2bE5xtIWyZA/BvljtA1gxb7R9XNITwrbux3XtES6YieoeX0BR+Rp9qPFldPPBCHLMFo8Ylfkzw/ASA2VoL3nlkaJ0t21W5X9Zi4sSbaNBIhqbH6Bx7jcBtqB9lv/bOQc/VP8lkMupuYHZGczV2QXBJF8JFbrQUTH5YJOR9exQjUaqCkhf7Uyw5QkXRzaDQvgnFFl6wpCfcLjONUvo=
X-Forefront-Antispam-Report: CIP:194.138.21.72; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:hybrid.siemens.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(40470700002)(36840700001)(5660300002)(82960400001)(47076005)(8676002)(356005)(86362001)(26005)(16526019)(83380400001)(36756003)(2616005)(81166007)(956004)(36860700001)(4326008)(2906002)(44832011)(6666004)(40460700001)(70206006)(8936002)(70586007)(336012)(82310400004)(54906003)(6916009)(508600001)(186003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 15:52:04.3012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f62a87-6382-408f-46d2-08d9cf9a2774
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a; Ip=[194.138.21.72];
 Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT016.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2289
Received-SPF: pass client-ip=40.107.15.42;
 envelope-from=konrad.schwarz@siemens.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Added the files missing in v1 of this patch.

-- >8 --
1) Make the QEMU monitor `info registers' command more informative
2) Implement the QEMU monitor `print $register'
3) Introduce a new command `info gmem' to the QEMU monitor, which displays
   a RISC-V hypervisor's guest's 2nd level paging tables similarly to the
   existing `info mem' command.
4) Improve QEMU RISC-V target descriptions for GDB. In particular, add
   type information for many control and status registers.
5) Extend the virtual `priv' register with hypervisor virtualization status.

Konrad Schwarz (5):
  RISC-V: larger and more consistent register set for 'info registers'
  RISC-V: monitor's print register functionality
  RISC-V: 'info gmem' to show hypervisor guest -> physical address
    translations
  RISC-V: Typed CSRs in gdbserver
  RISC-V: Add `v' (virtualization mode) bit to the `priv' virtual debug
    register

 gdb-xml/riscv-32bit-virtual.xml   |  30 ++-
 gdb-xml/riscv-64bit-virtual.xml   |  30 ++-
 hmp-commands-info.hx              |  16 ++
 include/monitor/hmp-target.h      |   2 +
 target/riscv/cpu.c                | 327 ++++++++++++++++++++++++++---
 target/riscv/csr.c                |   2 +
 target/riscv/csr32-op-gdbserver.h | 109 ++++++++++
 target/riscv/csr64-op-gdbserver.h |  76 +++++++
 target/riscv/gdb_csr_type_group.c |  16 ++
 target/riscv/gdb_csr_type_group.h |   3 +
 target/riscv/gdb_csr_types.c      | 333 ++++++++++++++++++++++++++++++
 target/riscv/gdb_csr_types.h      |   3 +
 target/riscv/gdbstub.c            |  31 ++-
 target/riscv/meson.build          |   4 +-
 target/riscv/monitor.c            | 204 ++++++++++++++----
 15 files changed, 1115 insertions(+), 71 deletions(-)
 create mode 100644 target/riscv/csr32-op-gdbserver.h
 create mode 100644 target/riscv/csr64-op-gdbserver.h
 create mode 100644 target/riscv/gdb_csr_type_group.c
 create mode 100644 target/riscv/gdb_csr_type_group.h
 create mode 100644 target/riscv/gdb_csr_types.c
 create mode 100644 target/riscv/gdb_csr_types.h


base-commit: 8627edfb3f1fca24a96a0954148885c3241c10f8
-- 
Konrad Schwarz


