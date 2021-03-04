Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8699C32D5C4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:00:27 +0100 (CET)
Received: from localhost ([::1]:55838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpSk-0004Lq-Gw
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:00:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpHB-0001uY-Uk
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:29 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:44459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpHA-0007sK-3m
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614869307; x=1646405307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uu0IOz+KrX7q9amyloYasYSZRLJuL3ylHothmv9i5Xw=;
 b=BWBprF/ndmIXz80OlI96r8JyqxzajpAl+dUb6GzRTCC4L7uuolXcVTpB
 75KVyzcLeQ9BsC+oMv6bcnciGIS9CZ3DwhCjD3PW02LZxxbL9/EEfJHyV
 EYrl6WMQNgwqjG3tXDOkRcKRxgBQcsBMJdXKVUA3pPyLSpNLZWn5FlVEt
 U53MZh1gFNyduwL09eHHPeNzf+M8eFd6+AXGXdf7DVtKno12z59gj2NTn
 Jm1xddyqp+ErrfonkXwsePDwMZ6j5xG+4bW66KRm141EvnkfqSQRan9rI
 kRimhUCez4WKoXmlQGuZvfU5FP5p3ENytf2b6SqF5VBuHljq0NCDkKOEx A==;
IronPort-SDR: JWFF49A1guYh7Hogpr79ixF9N5h1IXl+4KmGdRb14WjfNDYZSBpO6fZtiZOFpTz7WYnj4fqx3Z
 O/GM/79z8DAjsDLNR5QukEf+KkWpVTSIDpX/e0Io82UCoHFynFgcmywHeWWYsxd67jwOX3CAZE
 l+j8smoR36vjgl02nWJcaIgjK7vkGk4rgoVNIhLmWGblDlj3TvgpuCCmIa+sO1YqMpHN9i6pLZ
 cE2rEmPzwFJETx0tlPOCyaexwMxXE3GmxEyVI4LACJhtGwJUli897JHZGiyaMBOJTNGLtGIZOX
 jJU=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="271984420"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 22:48:14 +0800
IronPort-SDR: 8TG9cd3dPJZa2S6iF2cJO/cz7YVX1SiDxC3YXxH2nQgB4sC/5qYSX5UlM7PU5pNZLTphFbKbYP
 lzItZOTCDWq++AYoJzEhGd/OfEysF/93dEpl/BJCQyFFQtNsxt0JdAXKWFQyE+ctYsg65eaxN8
 2bOreaNx7Ayl++PbNpqJQql4Xva6frssk/5dwlBWnl15nhkSgMk2N8O5Dp2ysmGKD4kVwnS4nB
 2ex9w3T4RLQqt/70KQVQzaTLD3T/jVxD42dtYUcET3kcUfOSufa9WKG6DsWy1wG8A0CJDrLU72
 T828/v1sbG5GXqimOiKFsts2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:29:27 -0800
IronPort-SDR: 4h4tAjQP4/9D+svFBsC1kUOb7u/5809ZkxYKTfBj62uITjD9VBuhKlxqniP6qjgFJfQA0ACzyi
 +P0ANi/OxB4Qxq8Qm8iS1S78Myizujgs2t6KAeb4rBfOglXGbvmXSmO89E3vM0o+Yi/L61vyh7
 iSLo9/kO3/jJ3wRTg+Q1YgGXNKfBkOtM0+WLFQRWh481Dty+pIkisJYo6F98Hyh/t1T3YrJ40Z
 9U8GthEG8/bYglxpGbft07oBe2W+jIbyWFfn0CJ+99BTT2Ilq4mE0grPU7VT1YIISaTFnyDPwK
 rhw=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:48:14 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 11/19] docs/system: Sort targets in alphabetical order
Date: Thu,  4 Mar 2021 09:46:43 -0500
Message-Id: <20210304144651.310037-12-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304144651.310037-1-alistair.francis@wdc.com>
References: <20210304144651.310037-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=690dc056c=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210126060007.12904-8-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/targets.rst | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/docs/system/targets.rst b/docs/system/targets.rst
index 560783644d..564cea9a9b 100644
--- a/docs/system/targets.rst
+++ b/docs/system/targets.rst
@@ -7,16 +7,21 @@ various targets are mentioned in the following sections.
 
 Contents:
 
+..
+   This table of contents should be kept sorted alphabetically
+   by the title text of each file, which isn't the same ordering
+   as an alphabetical sort by filename.
+
 .. toctree::
 
-   target-i386
+   target-arm
+   target-avr
+   target-m68k
+   target-mips
    target-ppc
+   target-rx
+   target-s390x
    target-sparc
    target-sparc64
-   target-mips
-   target-arm
-   target-m68k
+   target-i386
    target-xtensa
-   target-s390x
-   target-rx
-   target-avr
-- 
2.30.1


