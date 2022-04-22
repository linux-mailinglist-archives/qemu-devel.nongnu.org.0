Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB8150AD1A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 03:14:53 +0200 (CEST)
Received: from localhost ([::1]:39800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhsq-0002V1-Gt
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 21:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhKL-0000oW-7i
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:39:13 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhKJ-0005Vz-8L
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587951; x=1682123951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JChTp5WLrQh5MDNlZmiFAsGs1azbblg/tthHl/2b8yY=;
 b=ZpZmOTBgQlaLtk9JVJH5ibZyOj6DiZ6iI7Ieqv1yUtuLljxvQ6vY1GfB
 +pwjza77ds/zkL50wn4UXPRyLpjlvvcmFHUK2KUUJsyxmO4RevlFAw1cs
 y99g9zMLWfLq55j7pXywpv79gbHKf9bx3yM4rJ+t+dwEnt4+s6Bbhpr+C
 IfvMD0in2JDa5NDcYFkRwmfQ3H/uqkHc2rz1qUNDdTsZ3/Ak03/HwQSOH
 995u3ZPaV+wxS5CcOY0FC9NnnhiRsH2NSEvadgKOsId/ERawlT96wB2xK
 HQhmOJRcRpMSdqqVrzKRles+2XcBsFcHoRR1Z9kXM34Jo7BiNNBsyX6M9 g==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483456"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:38:46 +0800
IronPort-SDR: SOsU6SVNQIuV7vPK0eeAezLgxfNORMEIF6jBjc4Y6PYYjsyL7qdjOfIXp1z8AjUqzk5pTxzBhT
 /9sX/fASFQSDZ/W0Gz2eyCrLCjSMW40avMqCkVwNs3KrbWhEPsNKO7WB4M0EVLl4QKmAgqWiim
 YkI5x4uVJEs9P9WW33922xpjZT99ahlY7F1SQBhIEhfq3SI+vkCXOsWx8fjKSd9nsbI0MpjW1W
 h28d6DeTfX1XaJSh7s2S22GJ3ei6E++tRO59kHyFHSZJVT7Sec99t9ZS4KJHJ6gjM+9i4D7I44
 3y50u6eHXLwbZpLuOB+9ft9Q
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:09:03 -0700
IronPort-SDR: TNmA1eWM8ZZCRRHtVafpB2hq0YGSIPt8uW2MZzQXRkEmMPr4yLP0dMNu7v00GevUK7NtOD+ocd
 u658ZFQYwVD7XgISoVdjNMDT/si165dVIfAfgfNWwgvq3VjrpvIrg8At7jrNzcAvTirF1jmMf6
 eIZ2v94TLBiLn6ebiXj+7u7JktAgbJWLWqcB2+ca5lDT59ouellVDUwmQUnyMtmyYTol+CDAyY
 8zuWzukf4TnAV77ASx5sNTR5kARx/2QkyWx2uBGFN3JF6l4VDaArqCt9QpnJ75DAPxtzYYZZpt
 JD0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:38:47 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwWV2QDdz1SVp1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:38:46 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587925; x=1653179926; bh=JChTp5WLrQh5MDNlZm
 iFAsGs1azbblg/tthHl/2b8yY=; b=p/LG+g74rFOVCCm5Q/JeFOQ3iLIPVnNJgj
 LHSWFSxfJ54tSBEJXZJIVjRXEfLPda0SeztVZQVz+OVwBxVpsTlsYtIak7sPYp1+
 v9w6dZco7cR/45RVe6ZnafsFL2chUVoNd3QNoIQADqte0i/K5MJz4dOVKXRghYpC
 WR4EYj/HWlXXJTC63vMpxG/bGNfaohrLB/GaOkA93ibdsgdIK1qPSoPiELT7tZfd
 RmvCssschcNmchjCn6Fk/VFk5C2Paod7TE8nlUoM1uubYwah1hrnYE3iHnXrtszI
 4DDFeBhb3RYO5n9wAMOfyiCDh6H7nxZ9NB3P2EEaC3e8NN40UZ1Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jqmKljNuuiBM for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:38:45 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwWR51NTz1Rvlx;
 Thu, 21 Apr 2022 17:38:43 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 30/31] hw/core: tcg-cpu-ops.h: Update comments of
 debug_check_watchpoint()
Date: Fri, 22 Apr 2022 10:36:55 +1000
Message-Id: <20220422003656.1648121-31-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
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
index fbe6b76764..78c6c6635d 100644
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


