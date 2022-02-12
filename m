Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDFD4B325B
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 02:15:32 +0100 (CET)
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIh0d-00025r-HO
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 20:15:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfte-0000XS-Ka
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:04:17 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIftc-0000Wi-F0
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:04:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624252; x=1676160252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WjghksA9AaM8fmkeuc6B4EowKv9CI+SG17KSr3ovYlo=;
 b=iZyDKoTyEShP1CGM8HzphfeE+I7brahOKb225vzhhRLjgK3pTD6slAnH
 yzM0IUeRD3cxBj1h+mu9Io4Ba7GLwV5DU5/0YKBgyCtDPA+047vNh+50n
 VuENIwet5+9ILnIUem6Hzp7noPqnzeDZzt/H7LVqhbgDDZOO6ecOGGvhb
 XxlJ7uRcVK2Z1y+ievGc3jXS+2d4vAZCDSNdDifrn6KL40QvnGxIosLP2
 08TFmohKaBnwX+bGZIpM/+wiEwDnxNRr/tYrDev89t73Hm4EFP4flpJdT
 NuiYhkwBLPES3N6iGd+a3COpfkUBrwd32molcS4Jt5eGcalTyg+zwVsPh A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="304636557"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:04:11 +0800
IronPort-SDR: t056egN0YusDtASrlJ1eauTR05PaxXQJv42x6/mOPLq7iQOMrKIEh9MUvTHJafW//CICi+Vd+6
 TGzqjqEijEKr2KFZArk9+Ro9l041umTaZf9uP4YzoRVOCiaAAGyui85zHkOU/jE12qFM5LXa63
 dnADP3pnIgrg8Pxqjs0nl2F+qWpD4Tjo9YFwsb3KyGVkicXX4WBKHzWdRty2aJf62iNO2bYwAF
 eeeoSHqNiwoJmeHFTkkJInZjhqcOMl4B5Q5963Vp6v9ZffdmDbNg00CpEkNTjAkEOdWQPugBGN
 ob5rGeOZDBAhyE1N0gu5f901
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:35:56 -0800
IronPort-SDR: IRckRvVNbUAntaaqDWkak9buN/OgHtx5PWouae4+/tzkaH1OEG/2KLeITey+ZuSjvj9SgvyIgt
 4IGYKq5ki62jF6ETQHySkGdOQoFgAwOJGnOeEgKeIQKfHyrAtnBVoOyRGrdi/mCbqIx/Jucem7
 ZrEK7lT9qOMirOiZXmV9M25glapndRz/5f8Ut4DkWbMcz/cDVJlZiLCZxARFYxpMZxnNuqYeky
 E2NYfRgIpKHY7Ry+A6HUW4Icvtz9fS9QX1NrFLA3WFZxbbHHDFS6fkwuYoK/o4HkuVfgZ/h1VZ
 GYs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:04:11 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwW1R38sBz1SVp0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:04:11 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624251; x=1647216252; bh=WjghksA9AaM8fmkeuc
 6B4EowKv9CI+SG17KSr3ovYlo=; b=Jdr7bE4WiOigVQbxJBwlw2igX3nOpeX+wh
 yVtPnvQMwoLqNfi18wNMcHCuI8HQryPvp2R3satVqi3v3VIPSnE05ztXUhaRXhJO
 Oj+r2E6t2MUk4diZ1g5G3AmX9pmF6Co4Uvvv66I7CxGA4ApQsgLQ7nXWxBGpM+QY
 LObQS1ZY7bmKH+3en4GzhAehGtG2aIczYcdzpVuF74inNzBRo7OWYfr4RsKdnzhW
 GtWhqbnuQDGL0+6AWqcRd/vrBSLMoyRwSwhaUBOy+6y7/e05yqysykfvGl3cJ2kg
 sN1kBdvEJow966H8uSECTmykjAubPFUHLS3PtinxBP4F6tXWefjQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2FwI8gxSppmJ for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:04:11 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwW1N0zQWz1SHwl;
 Fri, 11 Feb 2022 16:04:07 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yu Li <liyu.yukiteru@bytedance.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 40/40] docs/system: riscv: Update description of CPU
Date: Sat, 12 Feb 2022 10:00:31 +1000
Message-Id: <20220212000031.3946524-41-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Yu Li <liyu.yukiteru@bytedance.com>

Since the hypervisor extension been non experimental and enabled for
default CPU, the previous command is no longer available and the
option `x-h=3Dtrue` or `h=3Dtrue` is also no longer required.

Signed-off-by: Yu Li <liyu.yukiteru@bytedance.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <9040401e-8f87-ef4a-d840-6703f08d068c@bytedance.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/virt.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index 373645513a..1272b6659e 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -23,9 +23,9 @@ The ``virt`` machine supports the following devices:
 * 1 generic PCIe host bridge
 * The fw_cfg device that allows a guest to obtain data from QEMU
=20
-Note that the default CPU is a generic RV32GC/RV64GC. Optional extension=
s
-can be enabled via command line parameters, e.g.: ``-cpu rv64,x-h=3Dtrue=
``
-enables the hypervisor extension for RV64.
+The hypervisor extension has been enabled for the default CPU, so virtua=
l
+machines with hypervisor extension can simply be used without explicitly
+declaring.
=20
 Hardware configuration information
 ----------------------------------
--=20
2.34.1


