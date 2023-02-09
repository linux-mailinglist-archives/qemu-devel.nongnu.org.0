Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD93068FC02
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 01:35:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPusW-0005am-Ux; Wed, 08 Feb 2023 19:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=39791fc40=alistair.francis@opensource.wdc.com>)
 id 1pPusU-0005aa-2i
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 19:33:30 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=39791fc40=alistair.francis@opensource.wdc.com>)
 id 1pPusR-0004RT-CH
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 19:33:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675902807; x=1707438807;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x9zm4id/7DTPBj9wchI05bQ2BSMDgMDFS+3I1JxTBC4=;
 b=AHOD1aPYu9lFDT0Izp9B5yLQ2QXzXMt1qbXGopez1S+Nj25khnEhqKUR
 LHUU+CL2fmp1yjQovggS1ZheIOXRWEYN25uNVlVyZquaPOr9f0dsQozvC
 ZtkyhqkcTMiOx/MAhmdxWJ8JsYmv67xVuZGRX9SdJER6QcA6txnwDvo6y
 5ZneCOwFOl7te1YuPo4M0nmwiSq2WJ0Wl59CxNu2ofmpgOUiqIf3S06mU
 ZsFJdbOO0M4/1cb3vJRLVtA66sVAkKpnRmhlpuVbbiN9NBQu5NtK7PYad
 6RTzgZxtlz0wabrQQkWhecr2uGReyRKNAO3Wy3sd+HUsblzAtavOMnfyu g==;
X-IronPort-AV: E=Sophos;i="5.97,281,1669046400"; d="scan'208";a="222890195"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2023 08:33:14 +0800
IronPort-SDR: xmIkbIh8Q7RgobzYNWgW5px3SAILYJjBZjjeQQSbMut4FQJ0wx4/q8c/JsOtJw340lognXtlHh
 9hnPzYvYatkolAnOpABJlAXo16Hm9OC9qxrIQf2JUHM9tXAC1cCWPoDR2lQc2Rjg9Rmy4RkxCW
 aTAEkYPtgF7G2py1C8KVX9dZFTd2u/xMvXiQMgg0ytjwI8T+lBJeNIxyj3jrUBlbPkZ8OSAS3v
 i98y9ut09MjMT+R3RYcxW1M2hvZgFS6NAm2Y0Oz9TW6OwezZyV9N6DxXvOqjaZ+Udz9hddwrom
 zew=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Feb 2023 15:50:28 -0800
IronPort-SDR: c0yxcdcA3sFJfV5gPBG+QLekyL7d+dkZlPi2zgUhk5JjOI4nNp4LUHjsB8mngoP1TTjf0QKQY7
 3RZuwn0rvQcaHn180VvyUcM05v08lEQroD5nE/j1y4ZQys6fMFDmnWkkgCvdhzXWdXdUaAZSAR
 ImFzCFRf0V/haYRPSBNtE2uVdpkPY2yGjswa5uaYXis8ph+uFvWPkncYZuEjpN9Q3YpFG+j3vG
 2DktEvb7VqKfAsVjxQUutsDd6fYAT6eJTKrf9BgqMNPGprdWDLQrVN08ie0lzWrGehY04cxQpp
 upY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Feb 2023 16:33:13 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PByWs75J5z1Rwtl
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 16:33:13 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1675902793;
 x=1678494794; bh=x9zm4id/7DTPBj9wchI05bQ2BSMDgMDFS+3I1JxTBC4=; b=
 rkr93RadnDsiyrunNNbO8VarTEXnrmgYwpvSwFfmSOFGoF4Fvbn3mdJR7vlZl261
 hDpO0nm1R03GOMzleYvAa3fIAYPJWkg2F0OGfrl91h+9MAx4/W+88PN5KTOWhi7h
 P0ig1iNb4S6QM3p1qV0shie96VDpzEY/qTUWGYBO7JlziJMeHBoY68HDqEaegxBl
 x5j8agY+ZDB/7k2UBtAVksPA2MEuz35JyurYuiM1pxvfuSXnT+EfO6cdYKbMzYcB
 sbvM1EqAd87oVG9CgK4RRtxdMX0wMZcmXh8SY2+m6TFoPs5iDImUNp5oBdYzqYqW
 61rkRE/9H7gi9emKaWaAUg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nKWmkA85FRxe for <qemu-devel@nongnu.org>;
 Wed,  8 Feb 2023 16:33:13 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PByWq0FgPz1RvLy;
 Wed,  8 Feb 2023 16:33:10 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com, alistair23@gmail.com, dbarboza@ventanamicro.com,
 alistair.francis@wdc.com, palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com,
 liweiwei@iscas.ac.cn
Subject: [PATCH] MAINTAINERS: Add some RISC-V reviewers
Date: Thu,  9 Feb 2023 10:33:08 +1000
Message-Id: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=39791fc40=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>

This patch adds some active RISC-V members as reviewers to the
MAINTAINERS file.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96e25f62ac..847bc7f131 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -287,6 +287,9 @@ RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
 M: Alistair Francis <alistair.francis@wdc.com>
 M: Bin Meng <bin.meng@windriver.com>
+R: Weiwei Li <liweiwei@iscas.ac.cn>
+R: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
+R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
 L: qemu-riscv@nongnu.org
 S: Supported
 F: target/riscv/
--=20
2.39.1


