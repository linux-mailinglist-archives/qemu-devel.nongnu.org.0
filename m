Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63311403389
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 06:57:26 +0200 (CEST)
Received: from localhost ([::1]:44992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNpeH-0001Oj-Dk
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 00:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=87817de26=alistair.francis@opensource.wdc.com>)
 id 1mNpbV-00073y-UA
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:54:33 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:16629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=87817de26=alistair.francis@opensource.wdc.com>)
 id 1mNpbU-0003bh-FP
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631076871; x=1662612871;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ncX/nTcrB+USZpwB3qA/0kd/YLWr+7KU1EPURpT8z2I=;
 b=qZ6MoO9YB+GKKjSRtpD4wKGgl7F5d9ZZB7kCQTQjRuP4rmkdTgpWtq/K
 lf+ZMdP51xvNQVV0WU8c9jJSMPgwHTMyprvIB4sN1GSgjjeN5d6j4xK1q
 wb9TF3ZfmiFBJ/VTGX8y1s1d/QXx2X8uzrwvyYsJxpcotB3mYL/HUmaPJ
 IyE1DbZYLnB/fFunTQ01KnUcEVgIWxggLQz8xQbYEzO2TjKuG2qGgyENu
 RdEf00nv93qa6gO7oGT2QkGewRjX1EIcNuOWDCVkrgH5UwU1HAVlfMcut
 qff94a2FxoiP0jspnm61s4UbojIwdMcwDE2HpROJdD8hwxBxxDKGNH+Te w==;
X-IronPort-AV: E=Sophos;i="5.85,276,1624291200"; d="scan'208";a="179443421"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Sep 2021 12:54:25 +0800
IronPort-SDR: 7xy/fNckYvbQPU5Kb/Uu594CXoeDp3sFHbrHY3bQxaFkc2o/kwfr4mRywudNPMNldrK78haz+G
 J3P7Jghijc7yQ9rQuodp5D3z7FspFFRTj5Im4ogw9Gf017eWpN5XdaKPQZFOpvbENgQg7kwxxS
 cV4o9TPvlRwe4eX8+VqyHwmdAkXvM+9faQ2xq9nwKzBqmrM7xls4auR3seDoCqcu+gOfmyehca
 Gr7NCiOPZCLn7vAV8qTRgjUKSmVlLZb4a7wBSx4Gr9Wug9RpSPge9Jc95BN54i1q2+jbQaJSwe
 suQ+U99QnEtQOvlIijCEZyi0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 21:31:03 -0700
IronPort-SDR: 6DwmbrkeazJkKOwZcCRFRCIBcl4Dl3Zy2ftvpnB5cDaQZAzWzHR2tN71lL5+nEdNJZsXvRSGYd
 +CYu8grU6IpHG2QcPWlPgLWjNgT9gpKWkvO35SWvlsqzN1beUFqQ4q6IcKOy9oxlLlqx49ek8n
 /gETUfzIWVZo3BfLQmU0dDjbThgJ6YfafFJyeKV+9hmqzcXMeUmuSVrxs9mhGIhT8s34BfonwB
 RbjrtGzqFDl6Ql1JSxBkH3Sr5VrhQoqO5gqNWoz93WR6XyGN20TpcgZ2jas+nVBt0Pe/wWH7iU
 1/E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 21:54:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H48tp0DYVz1Rvlh
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 21:54:26 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1631076865;
 x=1633668866; bh=ncX/nTcrB+USZpwB3qA/0kd/YLWr+7KU1EPURpT8z2I=; b=
 Vq81Ra3My9IsPcMeT7/PBXjhuRob+qoSI/YHrX9Ge6dl1hCnFTkXLI4X//lhFJSd
 GTJMlwkOVV6Dpj+GhSBlgY5mNLedIOJ0hwcld7EYz9mWA6gLCShwa1OSGhQhuWlS
 aehY3TRu+dEBIgkkDpMOpTgwKO4Alheq9cACruzC7SNFJzHhqZXjQHz9dlo+jdov
 O3UBBOmw23zdS4ZDe/chHOk1nE0fAJw2lyvsfl60hKEclNagovQWtoiP7pyF6/v4
 ZBPJGGBbxY5+VSel9FIsKDmKOYJXdRfUTxxMRi5rtsp6ElIafZm1IIOqOFC2iD+8
 YDy3LYkiNKtEEFQmUcC+WQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id loZ4jKlxJ9Zp for <qemu-devel@nongnu.org>;
 Tue,  7 Sep 2021 21:54:25 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.20])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H48th0Nj2z1RvlR;
 Tue,  7 Sep 2021 21:54:19 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 0/3]  RISC-V: Populate mtval and stval
Date: Wed,  8 Sep 2021 14:54:13 +1000
Message-Id: <cover.1631076834.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=87817de26=alistair.francis@opensource.wdc.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>


Populate mtval and stval when taking an illegal instruction exception if
the features are set for the CPU.



Alistair Francis (3):
  target/riscv: Set the opcode in DisasContext
  target/riscv: Implement the stval/mtval illegal instruction
  target/riscv: Set mtval and stval support

 target/riscv/cpu.h        |  6 +++++-
 target/riscv/cpu.c        |  6 +++++-
 target/riscv/cpu_helper.c | 10 +++++++++
 target/riscv/translate.c  | 43 +++++++++++++++++++++------------------
 4 files changed, 43 insertions(+), 22 deletions(-)

--=20
2.31.1


