Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BDC47AF6D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 16:12:35 +0100 (CET)
Received: from localhost ([::1]:41790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzKL3-0004Fp-EG
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 10:12:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzApD-0004fI-4A
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:20 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzApB-0000Me-Cy
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976581; x=1671512581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9EyNksIWXiE4rgva6ROXb7qG3QEl0f7yluJ7UQU/ti8=;
 b=c5imSQq+RXnzthO0cyYf0EibNGhL4lWEzleQwKz3EYJ6o8be7oNxx1Mf
 HrjfYttKo1SIpwN5bZyNWvTexLaGTgpEHcQ1cMnhQtiryZAmZV591pjCF
 ljXPojsJ98YZ7I4yfiGqHPyM9U1Z0tjkVU+yzFtz0B5jKRnLsGqf8giko
 YbCIuJmqqOCjLbVk3H4oNi2bNp7uQyPFmYr2YwhEpJQO7kVRggRZPAjBx
 ckSeS9yCogpjPhdXJrpPpxTfLANIfFXzgbMadCoeYT7LW3wYCcpSCc7Be
 3GzqLoXHQsX9LHO5IJ5szgqokl6ybEse1Qofr7Ssx9jp98NB9WlamDS89 A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292662373"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:03:00 +0800
IronPort-SDR: VEod9IIUdO9Az4lUvX694fRyN5fHvbUO7IHRHui/ndrzgJaAWVRWdgkChbYXGTTsYqx5UgeVZu
 gNoc/8PjzbjfAC7EwYuXvrNmTYwYCfaFzwixgjEkFSR1STymBNkwd4v2HWY9HY4jfXACe4Wojg
 xDLfaFAiZnxCBQu2xlpA12jEc327USpmd8n2Hf1zEsMO6LvlUapIwzMw2OWEelyxjz03/DLBgq
 dYH8rHzIU//cNN0DREIW2+wKUK02Db7B8aaPRxGpzMFqy6P3lRcQg0sXvUCWExGCkdCvSmcjUA
 yvN5sQEt63PVrVxvD3Mv2CS7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:35:49 -0800
IronPort-SDR: LgTvU72K8trHTS46941zldL5oAbGXagU3uRjAjaV/rAmOfqGXlyme1MJusza590z89hTXxTBrP
 4l5rLF+FqJ3O+mmOG85K61jI+YfZOtqoKoAOO86JXbO3rABFrkxbwaJ/Jnxp6EKS9vbsqImtfq
 piv3/jdMf7sxNdUngSx1W5wmT1+waeCwJuJF311Wg9gh9qqjKp+b5E5u4pcq0tKYxAPjVrvoCR
 raVkZ0vfSKsJmopTJfkLzIWh8EbYpJeixI+UGvqYAMQO9+9pdO/Up9VVh+pC+XfyXnGzddEeHM
 DdU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:03:00 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHSC73x1wz1Rwns
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:02:59 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976578; x=1642568579; bh=9EyNksIWXiE4rgva6R
 OXb7qG3QEl0f7yluJ7UQU/ti8=; b=Gx5vTfwaSQyjQl6gChLhmTAUIS+l28h0c+
 xn48HBFTVG07lgglh0HdqYCvge/J2P8erLa5qTmtwrejY2zpHJE/z0VHDuhgU0kj
 aR53JAb5j+Te3GwiIq267ijEC/iaXiiajMu4aQilSktw6Qoz6v2SR1XDu7Ri8r0P
 T6TRXOi+omWrvmkuUqttHvUKlNsQ37HR5KhFFGJul6xaBx/wc/Xkx/FxnrzY9iRd
 TSZRW/D+GrpEN9jpAhOL+CP3nbTzEaWCfj/zDNtU5015VKHIVVrgQBf+VNmc/6MA
 szhU+Xpqw+B6qrJwm8NfJAmZbEtFkZ9N3VdBfdViaEYgtXcCD2cA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id XK1r_1noZo66 for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:02:58 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHSC31xgRz1RtVG;
 Sun, 19 Dec 2021 21:02:54 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Khem Raj <raj.khem@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PULL 86/88] riscv: Set 5.4 as minimum kernel version for riscv32
Date: Mon, 20 Dec 2021 14:57:03 +1000
Message-Id: <20211220045705.62174-87-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alistair Francis <alistair.francis@opensource.wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: Khem Raj <raj.khem@gmail.com>

5.4 is first stable API as far as rv32 is concerned see [1]

[1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D7a55dd3fb6d2=
c307a002a16776be84310b9c8989

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Message-Id: <20211216073111.2890607-1-raj.khem@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 linux-user/riscv/target_syscall.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/riscv/target_syscall.h b/linux-user/riscv/target_=
syscall.h
index dc597c8972..9b13161324 100644
--- a/linux-user/riscv/target_syscall.h
+++ b/linux-user/riscv/target_syscall.h
@@ -45,10 +45,11 @@ struct target_pt_regs {
=20
 #ifdef TARGET_RISCV32
 #define UNAME_MACHINE "riscv32"
+#define UNAME_MINIMUM_RELEASE "5.4.0"
 #else
 #define UNAME_MACHINE "riscv64"
-#endif
 #define UNAME_MINIMUM_RELEASE "4.15.0"
+#endif
=20
 #define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
--=20
2.31.1


