Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A8668D04B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:12:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI8g-0000OH-Tm; Tue, 07 Feb 2023 02:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8O-0008Q3-O1
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:20 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8M-0000FW-Km
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753878; x=1707289878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/mQ7fSOpP/1XpIdSd2rKgvKxmJpP9uHIv7XsRQTCE7Q=;
 b=IQz3BS0OOrdFmSR29wb64x4K5FwvLKbsIdR/DIi1o35PaJoqE5RxDQGS
 QfyeXodGzVsGmixdkdQGVHC0mQTwq1+VMVpCtuyqxWdDnyiYJ+nqnHhP8
 BNWec/YwafMcnvcly+sZatgVx5A5vzx+gZ3YeDF1E02j1YKYFBehYzB22
 fRlFpfSAiscrqSY03QwyTxQo3AOhWj5hFMPBTBFtSZr/1d3hA+PrV0yNx
 z7MrKMZQwYM0O9QlmsPgZlR+/ivpVoYY4412utiMRso+l37xuP4zshjJH
 bGcAaj/JFH3XEeVHhflv4NmxwPJ6uP3Bmfc8zau9pxvOs8EHINOUp+efi w==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657561"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:39 +0800
IronPort-SDR: jMz8TSycu3qin/ec2aPMgf59j1oaH1EKB2cSPO+HsyHgjyP5qibXYmPRvgZOvUAkZmqggnAyoL
 BchySrxr8UGA0KVaa+mX392tjT0gxBvAc9YhQRpM9tFk6Udm/lzheBODmI1hHx+LooVs9FtEGG
 XGVa/2iiG7fUD45rNSVSToFRyTm5ownMHIWWLd1Eb/7X7OVzp/7toVkbT8F+cXLFyYNDeGxbj9
 Ewvodo3bSe1WKyb2x+MxI4msyYYoAzZmSCeue1n+/ZLH4dd+2KdGg3Xep0YvW2WOMoO+a7cppG
 OXU=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:56 -0800
IronPort-SDR: OtBMcyexcVqoUyVCL0S4QKUwJlxizGF8uQM5cgKMqhlMNIwRieHMH4btlb3dnGkig5mpFlch7W
 zW+gsBKgJtl+WSwW0dJderO6Der/f7dQl/lV8rNx/g16oo0VVPVz8KhXZe0UuT3GnYCMNKj9Bx
 6/ApSqhFF0dvfZhRQF+JlC2vWseaVY3lrIezRqbFa2UQmMHg+d+GkhtGKudMoZiKgBWCezZEPC
 mILQYJ/JOta2ylp9hfU7tlTh9XySxdUZ0mQaRTR0VDBQmxW9GzMxGWn4VIbjWUQbFg80ETVwsa
 f1g=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:39 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vRM2h52z1RvTr
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:39 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753839; x=1678345840; bh=/mQ7fSO
 pP/1XpIdSd2rKgvKxmJpP9uHIv7XsRQTCE7Q=; b=oxmdMEoDBRPutQNMbgF1F3y
 tThIHBXYLHzfOO7C5w3/UG3428KVTpDByl+4wo6YQlmlzkSmt3yNFPnOLquK2JHM
 94Zpv0O+DMn8kAXDXYOxrSKiQQ7wlWvvjtopVnFbm9NEJGNCe5aknEnXpkFNKdIF
 ByuemEk0fYSN0b6fTEikiQoeIiiUDBNd+g7yZCtWOe2/x3wV469cZ/nETdjKf39l
 HgrtJHoMCoD50WqC1nqGHR3URJHrfOerGc0tEcq/1cZ4PFswI9lVFgztGABMGkAb
 TfOPfeReFeB4Cmsljel77B2iaeWS9i4gclJJqPreni1j9PFxD+Y9ZmEjMSVzYVg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jhdinyTD2zRc for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:39 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vRK4yDKz1RvTp;
 Mon,  6 Feb 2023 23:10:37 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 25/32] RISC-V: Set minimum priv version for Zfh to 1.11
Date: Tue,  7 Feb 2023 17:09:36 +1000
Message-Id: <20230207070943.2558857-26-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

There are no differences for floating point instructions in priv version =
1.11
and 1.12. There is also no dependency for Zfh to priv version 1.12.
Therefore allow Zfh to be enabled for priv version 1.11.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
Message-Id: <20230131202013.2541053-12-christoph.muellner@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5679e2cb83..3078556f1b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -77,7 +77,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D {
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei)=
,
     ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihin=
tpause),
     ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
-    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_12_0, ext_zfh),
+    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_11_0, ext_zfh),
     ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
     ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
     ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
--=20
2.39.1


