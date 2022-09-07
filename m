Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3138D5AFFBA
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:58:29 +0200 (CEST)
Received: from localhost ([::1]:54576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqtA-0003no-4E
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3X-00043m-9t
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:07 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3Q-0004UV-Sb
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537900; x=1694073900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E7wIdymJ0Tx0SvJyiujvNFVdeTweN//3tUTr7BM+g5I=;
 b=R+IDdB5ZWxhOxadKTAxD8QuY8voEivwVWaAGRIvDJq/2gCZADpE6nm2u
 ba9mvDM8V2YB//ASjQzRx/i87zhE0Iv+sx7hv98TX0j8sUyj2Va3RtuRs
 u2V2hBkBD1n4DvTmBM8e0vDFIFhBUp7xXMlR1uP/uzwEMcFwO2dwED37C
 2ojp73FN1s1iGh0krFhgAwpOjmmPfVH2VnxJW8KMbKw3ulLDTdkzO5hCh
 6hTrl+75Sr2k54Y1kyjQuBpMElHGll2bIEfRde5W3N3BSVKxHojq94KeN
 cNXHNb+vsmR0RioK6Daeq7Y4Hrlwm3sqelXqTWmzaM1f2oTORL3i/8Jq9 Q==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210714990"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:38 +0800
IronPort-SDR: sjPUunXIofhiT+8k3GlyfCEMS7ZNhK1vOAI/zL8gnMnRCxPzju1W7sahPl89EuV+JNccYv30wv
 vNbxArbRRmw6KpLitUCmzDfG0B3hI2BLdtzGMv4Zh7gMt2agujxJvIiILZlZha4TRH2fdVFSdH
 mllHCC+869mP7zS/qSVXeBceQWn+9YZsUapg8DD8XFJY+bkKnkpDSxlzNiBWIjsf0qG8hS7Pxh
 wzwp9n0vpg0fNF6LeeoR78GmdrO1xRxjyse6e7r6N/nexcYVTkmk6Il7d2RG/Ch37RpSpM5g5A
 8TNuh/oPjmNCAx7MXVS73Fk1
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:36 -0700
IronPort-SDR: Ro2TTz7B7t7/FdXYx7f4I/huj5C48X51fWGwsw1tA8U+O78Fbhp6cKlNn7PLVsRo/VOjtqENou
 6kO8AG+SHvY38HFW2yG/BDAoQs8Z3nhbWoqeEkBXv+tAENsOAOMdEYNg/J9syp95IikXqkPawS
 qbt/jgnNg43yODD9aLC6BTz2/1uztSmGjIb9/A7U7gbFThxeA8LpbkSsBQqwqWlvdX6RkEJOGh
 SVgmw0o7Kt6X8BldhsK6BJtv4wsnqsZpYYGEakf6dKwRZd90qRCHfWlDoc0K++SD0qa7t/BHCq
 whI=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:38 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 14/44] docs: List kvm as a supported accelerator on RISC-V
Date: Wed,  7 Sep 2022 10:03:23 +0200
Message-Id: <20220907080353.111926-15-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Since commit fbf43c7dbf18 ("target/riscv: enable riscv kvm accel"),
KVM accelerator is supported on RISC-V. Let's document it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220719082635.3741878-1-bin.meng@windriver.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/about/build-platforms.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 26028756d0..a2fee53248 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -46,7 +46,7 @@ Those hosts are officially supported, with various accelerators:
    * - PPC
      - kvm, tcg
    * - RISC-V
-     - tcg
+     - kvm, tcg
    * - s390x
      - kvm, tcg
    * - SPARC
-- 
2.37.2


