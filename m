Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588CF65FA56
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:33:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdEX-0003Ov-Cz; Thu, 05 Jan 2023 22:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdD3-0002Xw-Oh
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:58 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdD2-000892-65
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974955; x=1704510955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Pl3W6bKPgwU5oUjfWGbvyUWT8Zs6CnR+I1dROUGhXg=;
 b=NsIxQqdb8IM60rWyXJ23cyAOhwmLEbQoQEMGuVKrVlL26tRr44MUSTse
 u21qO4wtzc8HOUnnBghjdD5MMjfhwmS0jyNrXHXKHJETElXhYBiQcCe19
 m1qZRyDiHblQ2PNmKBucM9d44fIe16S/bGw+mk7pXS+JRhkKRbOQKjcRt
 utfLU2XiFTxtui+Mvm4VZ6f7EoYzGsimj7HB0lG4EsartFVCENwB+M0UQ
 Cit8rHl97ln7j9L9/5cHIxAiVquRoTvToUnNX02evViawW7JXXgjW03VU
 8xtUm0cVx/p6u/M3kqQonvrwuWgzY2ftrEpUJXa4NAGihJaLB+ZLesVRe Q==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254825"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:15:01 +0800
IronPort-SDR: iANq2Gauw39R/4e+KYU2V1C3AFMk2K4Aj4hYnOuM+o3Go8JcbhaKxAcm0h/ENN915yDw52ei8A
 ZFkFdTClS8aQArEREbrEoFoeBQg26VJMQt9fTBZXHceWisX43Rc9r9g4JAAZSlGCalm7CrQtdz
 pqPSyHILu7fCS0LGk2XKpFJUqwCcGXbkgWP2vqP6TQQS0fjQ3UV+zkLISB63DynfhNP84qpL9c
 sl++15r3oDlisKGc9FY5uN0mLDOrlW9CBUvQFnu0XtIXREAZLztao7EjWruT+gJu5h8MZ07HBv
 PSI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:27:12 -0800
IronPort-SDR: LE23M337MuJB5KtJ3P9iO2+KHpBXb3u0jvXlIgoxF2yt57t1HyweeI2syYNz8R9cEo7TrRxzkl
 5ClAdmUrm524wNGC3YinWgWeCmt/XXdysg36Nv+l0BTXG0v2fxuoQ9s228B7mRaUCve+MhnztQ
 sawPgatjzPHEU306cEOrkFx1LEjl52rKtQn3nokGxGn2uKX3mKCNZVqShkEbNUqq7suRvTqqTR
 4sT+2QlVoIqm3txu9/B6VrnQh+nObAMHqaiRVHqLVgjcZIcX1Lq3VtYuG8b2gT9Y6qLy9Bc7aC
 kRM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:15:02 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7kF0Q55z1Rwt8
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:15:01 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974900; x=1675566901; bh=/Pl3W6bKPgwU5oUjfW
 GbvyUWT8Zs6CnR+I1dROUGhXg=; b=j8syWgVZWqEOzzf4S69XF5kjuBlVoDV5EA
 8YJ9a1S7paWNai/5Ebd7Bpw69l0qg1mG0TPuQ/FWatrIh2q2xGYB+U7EWyvNQG9v
 MPRmpqJC8t/QNZtzOR9rTQuuQ1t1T8BpfQvKy4FhnBJoq64V6WL28RKKh731tC6K
 UMpPk2C68zs73vcpG54Bl29F0X0RAkwhHUov7IQr7u+KhKUDrev9ljGPa0rA08Rh
 usXnGdGrgCl5hFXwz24PQlnmF5/Jh/Xbpc4qaFKCYIZ2q3cGDcirL55dqNgrzzsL
 V6EWnZRhAaeugD6uVnSpByBjLeRr4xdICOlbkiLYNX3fLpSGBBww==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id QL9XMoWNv7dm for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:15:00 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7kC1PzNz1RvTp;
 Thu,  5 Jan 2023 19:14:59 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 32/43] hw/riscv: spike: Remove misleading comments
Date: Fri,  6 Jan 2023 13:13:46 +1000
Message-Id: <20230106031357.777790-33-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
2.39.0


