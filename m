Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036574CB683
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 06:39:58 +0100 (CET)
Received: from localhost ([::1]:38064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPeBv-0003Dn-GV
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 00:39:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe1Z-0002Ar-Fx
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:29:14 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:61796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe1W-0000XC-Lv
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:29:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646285350; x=1677821350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FvBfKuvIQJbc2dYYjtjc+FeCYg2H8sravqi1VKHjGGk=;
 b=j5rooirQ7ARtqUCaFHc1bwQxFb3CgFzg0DP9yklkcATHmDgiT6ddyC4A
 31ZokUlTfuZeZCmUmlJlaZydkSpnh0FABgjTLS6XBGuiFU6HYjKYdqa6N
 u+2Rvdc3yMGnmbgLW1b6dWiQXKZya1/SjU3gMWD5xVU9VBzfKWkFwP4s5
 MTJIDUhuInAM5b4qzS/7tCCElF8drgXQn9qbRQqpT1Hwztn5w9SyZsJwO
 CVmkIo4tsxbVNZoVRQtjUnRbUCXBLzFLeMNXDvaEvgNvFczRsIZIp3n/B
 GbyVlTnq6y+eDXx06LhS0kjcmFLf+NTJogInkBz6ngw0qESeFJkjcxVeo Q==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="194355361"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 13:28:58 +0800
IronPort-SDR: v+0GGkmANMhYbgwUqFF67L7N5hy0EH1cFg15BEx5p2ezJvb5vNtDA/BwktGUyRD9hIic3a3qgp
 wDDuSDafgn6iYoPuzjrdPp4ZKv8Pnnkx9QhYRKA+DVQJ6fXFBcthkrpASrKhH6bA3LnZCCUhVK
 Fe5nbjxfZbU3uY3bUp4VzrzewW9FvCY4ry5woGCC50qDB+r9BxNot/zNp37Xyzwkc78a+GnNt/
 yfhU1m9Q8UTJCXLcajM71lSzAh/sY0SyThGreFQQMXtO4rOT0zp5rleyuyXUyzv/bcR8sXoy/j
 0quy3rmrYpw4BdnOfYGcbNEb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:00:20 -0800
IronPort-SDR: W4FIbHm0Hh+7OAxS0SQYCqV0s1AKcF2PAgc9m6gqW8Ghocjy+VAolTgnLlJKFp1zwH85CrQU5j
 7bND5ooy76LNgIcYt8W+tzCdwQ/x/VYwWpl2KZnAFIACOzBYUZ9HG+3rY0FsJkwOIXpXlS3wvH
 jX6E7i/RmTho2qmFodJAXxsZkZJNZsG7iMuBc5UVa/ftoKZXQUeRcLSkSlyegsnATPcp5KnYZK
 rvU/G5nZy0NajGXZBj8K8va+lSdL6ub2MGVlFRmm+InolxykW9AhpT7SqUDBEfz6bSMlPEff2Y
 1dQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:28:58 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K8KKQ1Rzkz1SVp0
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 21:28:58 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1646285337; x=1648877338; bh=FvBfKuvIQJbc2dYYjt
 jc+FeCYg2H8sravqi1VKHjGGk=; b=EvtAXelPh7puovZnBr9Z+qpINsHhOx0K07
 1oPLb+zFR/z1PpwvK4Kz4UM2EOb731+H9593U5DP+xnaR0nD+ewdQxe2nVF40ziz
 ukYY6CKrrJUkiNiiZiVML+XSwJK6hFWbPFKqy+ahu/H5IoZU58hF6X1a68WbGSh1
 CnOHdpmMGH6/PleBnkLJ6RbBsrQsn6iImLfC3/jT2wHOCBD9KYbNrJ8M5Sw4UzYl
 y9YJHUZlNtq0tItqt3ary+4JM2pofHU3nW6iCBgGW/G0cQe5eB6noCOu5j05Rmm/
 kGKAZMpXjUvJJn+VueZF9/Y1nU5yf1Xk2RaCZRZXgqOfF+0V5rWA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id b6Ur67XrLz9C for <qemu-devel@nongnu.org>;
 Wed,  2 Mar 2022 21:28:57 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.101])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K8KKK3fJsz1Rvlx;
 Wed,  2 Mar 2022 21:28:53 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 ardxwe <ardxwe@gmail.com>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 08/13] target/riscv: add cfg properties for zfinx,
 zdinx and zhinx{min}
Date: Thu,  3 Mar 2022 15:27:59 +1000
Message-Id: <20220303052804.529967-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
References: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=05403f1d5=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Co-authored-by: ardxwe <ardxwe@gmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220211043920.28981-2-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  4 ++++
 target/riscv/cpu.c | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8183fb86d5..9ba05042ed 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -362,8 +362,12 @@ struct RISCVCPUConfig {
     bool ext_svinval;
     bool ext_svnapot;
     bool ext_svpbmt;
+    bool ext_zdinx;
     bool ext_zfh;
     bool ext_zfhmin;
+    bool ext_zfinx;
+    bool ext_zhinx;
+    bool ext_zhinxmin;
     bool ext_zve32f;
     bool ext_zve64f;
=20
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b0a40b83e7..55371b1aa5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -587,6 +587,11 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
             cpu->cfg.ext_d =3D true;
         }
=20
+        if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
+            cpu->cfg.ext_zhinxmin) {
+            cpu->cfg.ext_zfinx =3D true;
+        }
+
         /* Set the ISA extensions, checks should have happened above */
         if (cpu->cfg.ext_i) {
             ext |=3D RVI;
@@ -665,6 +670,13 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
         if (cpu->cfg.ext_j) {
             ext |=3D RVJ;
         }
+        if (cpu->cfg.ext_zfinx && ((ext & (RVF | RVD)) || cpu->cfg.ext_z=
fh ||
+                                   cpu->cfg.ext_zfhmin)) {
+            error_setg(errp,
+                    "'Zfinx' cannot be supported together with 'F', 'D',=
 'Zfh',"
+                    " 'Zfhmin'");
+            return;
+        }
=20
         set_misa(env, env->misa_mxl, ext);
     }
--=20
2.35.1


