Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03991476950
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 06:00:05 +0100 (CET)
Received: from localhost ([::1]:54500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxis8-0003z3-3q
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 00:00:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxini-0004BF-Li
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:55:30 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:38482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinf-0003z2-AN
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630526; x=1671166526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uBcLXAbG1yKoczNut+L+D8darkQ7DNCwu/vsbiKvvKk=;
 b=oV7HIM9fIB3cqGPbyKkUPptgIyUkiqf5FOfbU9WnB9SZI+9SxkcpwWL8
 vSGjqbTYe+36kujQDHQWQGWUw7OYntvPnq5hlz2tOINAdTggfQwQzxOjO
 L3xOgVvTiYC4z5iCsMrdBdxw9mPUi/LwW+AGddJ4MT65D0lcOe18+oBKv
 FHI4C5mFQ5S6sdop2JYTPW3S/AA/UEZfF/3rRTw2J4SfenigOCwOYArtk
 ZLh3LUCjJwbL6PMoiqC3TmQwYoloNph/wcFmvrZJnsDey7jEFwetVp2+e
 PBo//SMXN4Wujew4fj3u6DMkTVE/jm1zBOOB9mrsnDsbhKvoxH2FDUrFB Q==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="188374236"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:55:23 +0800
IronPort-SDR: +1cU+R3ySSzBO9gnHYrgCmA0VXLWmdyDkrTzEiyAov1wtW8Kk/cTAUHfEBxy49WIPK8Y1uhcGF
 VOEB9MRsUXplI+dwoeDr5JLgpMhZXVOMkSMewkt9TMQyd8OdwlcKxIdGMoloLv2JXs1URL6mtb
 kUv8vh1YaafgyAL0n4x8dRcPqJGdlPs1Sdc2kyc1hftWQBcq6NX5WhGRHGUaNYpnV/ycO9YL3X
 2hj58dpdlZG2iWX1GASJHL324SMzdTVEO8NatTT93p+CoyZ1ol+fOyn+uSkVNT8sM3m/HBMUt3
 2naaAvwacGzKaZwa5/G8J0IY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:29:46 -0800
IronPort-SDR: z20upkGqUWxMHYALIoD7QqjsD6tMYaGJ01MMrv8QebkypPHNFQC6YWYOgjcpFiPWvhRKbvAtr8
 dwAgfRDeTxA09dwQVABcyLNINOly0knc3dUO0wmgzS8tfUCGdMfRepgbpA4B0b2Qc3Ehqg8ivz
 2aOoE5MN67Ttr+OKYEsF3I7B1VsLAjS5EIQEf3VpmIZgH8gWORDNvZSqdcnV2LLWjcKYT6hs/L
 L+2KTLHRjg8Lu4mpBUJMWFYVgOUqeTKO+Z4q76YKmWw7m81rGerLdh/Slp1YTkD99FBbLsVGSJ
 Qtk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:55:24 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0DC2wZCz1RwFN
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 20:55:23 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639630522; x=1642222523; bh=uBcLXAbG1yKoczNut+
 L+D8darkQ7DNCwu/vsbiKvvKk=; b=bwJWt5oPndFm2xmYJythkPjEhpcjb31Rhd
 ijcBcNO6XSDsKqRpVH44xB3c9amsZ/sFp9WlEVslLluX3xc/L7NLM1jzif2EPHZm
 9A0us7smKX8ylumIYTe1skmM29OckHB+K5JlwuiOmiCakH+7MVwtEOw8kTwRnnYO
 2TpedwPfhrShuo1pynxwsdhQpFyhds8S3Q88mrCGP1kp2roKcehUNHNwVu63WIK3
 k32P55ZHUtJZX8NvYE3RDOjt+uelSWXQh0vte+c36bsGddb/C1upwvdSkYw47Q+b
 cwQipe8xn2A7ftDsZZKgTYK53FWduQHnace8cnL5BSKrowmqWgzQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Fook4lKghiYM for <qemu-devel@nongnu.org>;
 Wed, 15 Dec 2021 20:55:22 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0D55pMjz1Rwvf;
 Wed, 15 Dec 2021 20:55:17 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v2 8/9] hw/riscv: virt: Allow support for 32 cores
Date: Thu, 16 Dec 2021 14:54:26 +1000
Message-Id: <20211216045427.757779-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=977d27bfe=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Linux supports up to 32 cores for both 32-bit and 64-bit RISC-V, so
let's set that as the maximum for the virt board.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/435
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/virt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index b8ef99f348..6e9f61ccd9 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -24,7 +24,7 @@
 #include "hw/block/flash.h"
 #include "qom/object.h"
=20
-#define VIRT_CPUS_MAX 8
+#define VIRT_CPUS_MAX 32
 #define VIRT_SOCKETS_MAX 8
=20
 #define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
--=20
2.31.1


