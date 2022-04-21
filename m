Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E1A509A04
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:59:05 +0200 (CEST)
Received: from localhost ([::1]:35246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhRiS-0006VP-57
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSn-0006GL-P5
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:49 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSl-0007zd-U9
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523127; x=1682059127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cCYAGxJFqppmK8zI89wVAdS5sE6lTAbaaFWAXrir5wU=;
 b=hgStYdUoM5G5DUFyisrhwT2+JoBmi6ems5UTjl6jWwJeNKwB74vo0WYH
 OpvddK7BY+TYidDM0jVL0kGOfPnJIfPRG4PU/NRs4l09p7Vg5XS5aAwsI
 6NJuLiPsGiaRnVy/BLcpOti7TRLbXPSCkMWX0A+YoTAQ+cO2KKNF1zASd
 tkb2y6zcwoOTIeS7g7J3mAEfIZQzbXGNY4iRuew1Kw7IrLRbn5et3RejB
 uNQqOKb9y901olp8UGOiwP4nIcYT1asG9e7FjfO7QL4wHcYFQRC8tKSmR
 cNwgObsiRdjITNWg9+CZCPrMapcAVvRDqmiMc6rNQG2gJ7fG6bWAecqBr w==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302640039"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:38:18 +0800
IronPort-SDR: NozpPdcQc+QYy8yrUk2lzVWNRhSYjm0Kta8JF5yXoEiwd+bksQ68DeOhR+hholm7t5UXcmSxSC
 hncJneHL39gr5MYjRgNAWQWAJ9v4TJ0/i8HhmAGtXvNVnRzXrb4Y8eo3Bg/yhWKo/T7BeJYVeT
 OWFIhiYRZ0k+nYDSSVkVssA/RymhgIxjI4gHyBFkRH/hKPujEz9yrf54fZmwXu29KFQnf9Vg62
 TvXyCnkd6zpQhuguKGtSyJiWFmikDN2YwZrTDQCR7HYjXKTfMkKlhEqDJMvK3i6ZWZRcKf60N4
 Oww4iGZ216AEHhWxWruswYAz
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:09:21 -0700
IronPort-SDR: MUzLh4NKc+QJ5J8DVUsaqXi2z54IuezxVd05a0DY6J98S+AbPBlZBrs5hP0QFXjesFey+CDX7i
 ixysO4nJ9Xj2Hi/AZzYWZ5sCsFpdhyTzZobWCL72FoJd4k9op1kvM+4W1HFaMMF9tTAGrXaWcL
 /i4mAdzUKeZIPmXP9WvhcbEVjEjdUO0iNkjwI4BE3XjvwyxKTXh3v3bY8zF9VjIdh5h4mt9Eic
 F1uVAokpniXjfOfcdP9kSLNszjljIirP4z2FBlvQiybbj7/Ahv6XgIpb9NZH6bVSB27FJFRO+X
 7LU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:38:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSXp4rw4z1SHwl
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:38:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523098; x=1653115099; bh=cCYAGxJFqppmK8zI89
 wVAdS5sE6lTAbaaFWAXrir5wU=; b=Ro5R5MOL1Q+NAYwRtXIfI68GwmiXzDF5uM
 v7M5rcjzxfxovfosMuTEY4CpBYBmNNtJ7jeSd6v6GjA1KF7yipEIy2N/T8h4YVU+
 Y1Rzf/g/GtxLr8nyxoP+3e2sb8bXheSdGEEezyyb3e0MloXz35nivVoO6U2eFPGl
 WdPv9Jsb8bo2pQ4QMomQPKr8V78FgmY+jdE1UW2eTn5z1Wif3ffWFU0roaT+NQmL
 3hbQVlc5wCwzVqX48ITyKct8CGnaZWJ+lWHOJbbQwQEE/ETrAmyUuc2cIkFACphu
 LvmzCHrTXvesy7pbvKgIBRN8I8i7inQJtIlU1t9mvzLPHKKOEK6w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DFjMYOXCGbyl for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:38:18 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSXl6FXTz1Rvlx;
 Wed, 20 Apr 2022 23:38:15 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 30/31] hw/core: tcg-cpu-ops.h: Update comments of
 debug_check_watchpoint()
Date: Thu, 21 Apr 2022 16:36:29 +1000
Message-Id: <20220421063630.1033608-31-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

This is now used by RISC-V as well. Update the comments.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220421003324.1134983-7-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/core/tcg-cpu-ops.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.=
h
index e13898553a..f98671ff32 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -90,6 +90,7 @@ struct TCGCPUOps {
     /**
      * @debug_check_watchpoint: return true if the architectural
      * watchpoint whose address has matched should really fire, used by =
ARM
+     * and RISC-V
      */
     bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
=20
--=20
2.35.1


