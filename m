Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05822509964
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:41:19 +0200 (CEST)
Received: from localhost ([::1]:33934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhRRF-0002VI-Ig
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSn-0006E8-2E
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:49 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSl-0007yk-DN
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523127; x=1682059127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AC2dXbVlpogSRQbvLzTUXk+TjhjSi6pCJLR3L19S/+0=;
 b=WSCNk2OCv1aYC34+M8CZmUKFDru587jigk8LMXm7CqqkWLI3Kj987KEq
 aR3UVHq7P6ha6CPr+5q48a76EqsqHhCXe5EX8xnhw2nej0T5bCRZtyKt+
 iapORXGF1/gb93ww2xvJyuny+zVlu8fSHXezwYDRP5dT92B3y/KYXGa0U
 0V0Ug70q+2VKllNJ37LDmQNpmV2zq1MudQQ+ulB+ghEGgCySAJKuyoCv/
 Px/zjlGgrfjpJbpzfpD2rPd/M7FtADkLN0zt/0XcdrBEQlCpbrbcCRmvS
 O42SzYQ8NOTBwHKF4usIBst2tNubl5Ag6H5Op3IlbF0obUkEB9bpqiQwR w==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302640036"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:38:15 +0800
IronPort-SDR: nr8rgC0kb/12YhOlAp+vpRxnZf7mwbDOd7A6TOJgOjhY7m+vlcQF5w/RD72up9cxCxuyAXmSwM
 8HpF2LMT5lq24BmUnI1RtgXUNfOKo/oe8h+nEIpJXXc5dpFNv7ePxJhpiijxNywDgp5CWOjmaD
 edwkoIJAp0/a9IGQHLOrItAZcoXXL9cSuKn9dkujl9nwQg+KLm0mzazuhYwbG3N/1aa0hLljtE
 wwtOUMlvCjCB4POGSBt/i5Si1fG6VtA6bRJRYVy68/ImtdwDf9GHWWPl9Kfz9/x333vxI8hW98
 B+IuhfcxQqpjug6p119BjWbQ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:09:18 -0700
IronPort-SDR: 4B2ro0wslMez5TNyhSwria44bCM3h2ikr1mE0l3e3WOSnLhDjsw+ZGn1AL/3GJO+RIbdjibB2j
 hsdrEpCE8s9bC4Yc4hNXSI5qwPiOIj4F8mE0McTYavjR4TlEi/bDkkYl48qNIYz+/nITSACgEP
 atuM11HHsE5Wp0bMYuAZuurVL0cs5D5oBLt1pgufhEnl1PL46FZ+C9rFGxlCirmddHhTDvmcsh
 /UrqWCbwEsEASkraHiv3nb28oOZcJqmuGDzdhDl5W4JLMjogi2HLFgQyoJ6CUURjdFdop0LdVq
 ow4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:38:16 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSXl4D66z1SVnx
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:38:15 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523095; x=1653115096; bh=AC2dXbVlpogSRQbvLz
 TUXk+TjhjSi6pCJLR3L19S/+0=; b=OBcgkrZ3g0e1Ql2adoGwgTk6imgooLQ94G
 2xKgd0jrBX3JAgfs0xLPYqgrrQVRNqAmu0ygUprF1hSHoGQChe2BkOX65DAc/zKA
 bicP3/UxenqmyfvUMfYm3Ac6hWSXXZwOr3NZx9q0hPUXD/bEQVhtdlFQejLSv5BR
 FID3SIQv+aAknCPA8ca+HiATJhsXMACpb70ry4QkPHfiFaGxGrrovF2mZPxNmbcJ
 7E08bGGSx437EaUfOq5IBn/wUgaTXr7nLFyJzwbYdljjWbP1inuZaCVy1yOvZeFU
 Nd6fSuhSiPfuOZHcIZpmRNfS9w9771udwNhPrLnhkGtFFFaXq78w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id SFocMzxWuBpA for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:38:15 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSXj1Y36z1Rvlx;
 Wed, 20 Apr 2022 23:38:12 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 29/31] target/riscv: cpu: Enable native debug feature
Date: Thu, 21 Apr 2022 16:36:28 +1000
Message-Id: <20220421063630.1033608-30-alistair.francis@opensource.wdc.com>
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

Turn on native debug feature by default for all CPUs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220421003324.1134983-6-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 85656cdcc3..0c774056c5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -803,7 +803,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
-    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, false),
+    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
=20
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
--=20
2.35.1


