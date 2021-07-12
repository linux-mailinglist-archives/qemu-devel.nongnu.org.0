Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0293C6692
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:58:09 +0200 (CEST)
Received: from localhost ([::1]:51174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m34sK-0004tg-EB
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oJ-0005Bn-87
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:53:59 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:47857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oH-0006u9-NJ
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626130438; x=1657666438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cmebsk2YrhvouJOpHNJ/nTGaasT8su7IGqhbza6bBr8=;
 b=MmKEl07HXiL0KyQ1Y0QLyciRepb0tDgBHc7Ajvxl3OL7ngRGj1+pyfiG
 /jLS8nl5p9AoIP5y8OzuFND51wFjJQxC5pSHCKpnZ6Y1KueFhgHPjdK/k
 vbsPesZwtHhidM8DSoYQQPXeoSsoci9nXaWPjCuJ9jiEgqvu7K13DPDmE
 ZidzfInrpHpf6BsPdjlIRGIi6kRof4b+8KK5+MiYVO0bDToUfrI245GQG
 skbQTAWamgMOtEP3PIEnqY0B0+xKbkziIe9KdqOYOrZ2JWJfQMcJ55Op9
 hiUHi96iS08DI9szBvLmkfdynAgTi/+LdFU1KqeOoAIDu0+z0AiONNwHU g==;
IronPort-SDR: X59gFoHw3BwkVLq+uZ6OsnJOmaRD9sjoqm5ZMU35/tqEPlHWhx/2iWE0H4VsLmocPpUGxIth2g
 To66zncaRgOSFhtzlc2inzEaaU2yK+aqWWqbFFexNeox8rFRIwCyKXqiCcGG21XMK3apiTsIv+
 KNql+U7tF2SDGd/q6FSdbBjFOTEol9CK3DwdoNFCB6Mf0UXmkvkacZDwSZ0yHZ3MnJzp+/6kXR
 747OvPf1lu1NVeJ1vtQqFtahQXKfxPITJgn6Rd4kgQmY4/silBVZPBCMQw2e3FIIuSX+OKb/3j
 490=
X-IronPort-AV: E=Sophos;i="5.84,235,1620662400"; d="scan'208";a="174973302"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2021 06:53:52 +0800
IronPort-SDR: U5UtB+wKwvtQYGWvD1AGXbtBoHDP+Sx1zV+XLON90PXonyGHfqtV4v5V1YZKfAaHZjn529vvc2
 RzuF/eGRTfm1sd6qW+qT407l+Q79DN0nNXXnkeRh9amwo2J+A+C62DrQLkpI1xG0NoQXfuPiRM
 WnRjzOVBCqjBGmCOzMYJEdTJZf64Vn8j5nS9mk9VCSwoss/VXFSkzG0yFq6JwfZN4HbG9PTFy2
 O/imK/RWMfbjLW2R+qRgEHKrSqlXio4+DrXe/XUgFLfYNm2blEY0bWgBi3LzQ5csKEGHaiRPwD
 N4Sko6JVaWephWUK6qgNTgkB
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:31:58 -0700
IronPort-SDR: C2ypqy5akEdX009i+GXJHG+MXmIeEjU0Liz0qndzoOZkRvlSF3f/NqyGgH23AqGqZxugyitcbL
 LUw2JmWl3c9mxCSFUiq6o+GfZzPrIhA2D10MzrCUPm0+a2BYQfybEX5GdkZC08JJmvmcYk4d+e
 SgJj9rRn+RmdjhhTIQ1q/DF844jMf1NtNT/A6tolKsK7M9oZSZzAsvdjYr3bzXt/70zztBxwEo
 RisQ448p/gn4avd1u/iC0kgmakNGyqc5tRiOdY6gWXyOPR/H8uDS1RNG7CCj/XHaG6eqIFIOK+
 E3A=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Jul 2021 15:53:52 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 03/11] docs/system: riscv: Fix CLINT name in the sifive_u doc
Date: Mon, 12 Jul 2021 15:53:40 -0700
Message-Id: <20210712225348.213819-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712225348.213819-1-alistair.francis@wdc.com>
References: <20210712225348.213819-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=820a0e1fd=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

It's Core *Local* Interruptor, not 'Level'.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210627142816.19789-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/sifive_u.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.rst
index 32d0a1b85d..01108b5ecc 100644
--- a/docs/system/riscv/sifive_u.rst
+++ b/docs/system/riscv/sifive_u.rst
@@ -11,7 +11,7 @@ The ``sifive_u`` machine supports the following devices:
 
 * 1 E51 / E31 core
 * Up to 4 U54 / U34 cores
-* Core Level Interruptor (CLINT)
+* Core Local Interruptor (CLINT)
 * Platform-Level Interrupt Controller (PLIC)
 * Power, Reset, Clock, Interrupt (PRCI)
 * L2 Loosely Integrated Memory (L2-LIM)
-- 
2.31.1


