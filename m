Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40B24DA7A3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 03:01:26 +0100 (CET)
Received: from localhost ([::1]:50552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUIyb-0007po-Af
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 22:01:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0672150a7=alistair.francis@opensource.wdc.com>)
 id 1nUIwa-00062N-1Z
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 21:59:20 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:36891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0672150a7=alistair.francis@opensource.wdc.com>)
 id 1nUIwW-0006NG-Va
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 21:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1647395956; x=1678931956;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EK0FagbRAlcOP2ydcIVZ7cjxZBeV5IjcgmQ28uU5Irg=;
 b=lYH3Y+/8C5gdlM/S6zdmxvZUYdTKmQ1SVDH2GFcXr+cwDhKujWK+S27M
 ltWPfU0d8pEdotJxpCS89Q3fStYjFhVb5G+aro9hIeEv4Wz46HxN4kJdh
 Llka7ho5wvh8aZvCAWAS1tFQnKvJOqOTtVD6Zc+4ssfOu8jlObGa0l6nO
 irVkUK8qsreZBsWq4nRlSwd1gLZDvflQCCw+y+8fpEO+84LXGbrSIBBbi
 KJzxGvlktqTw3tBwVAuK4fUQZOx7vHkLfr9lcH7cn0cqfIYUYLcO2bwWM
 Ep15EkrTOg11HihjqFGkhyGE4s/QGA591X+F5rBU9lq1cHAJhNIFKZED6 Q==;
X-IronPort-AV: E=Sophos;i="5.90,185,1643644800"; d="scan'208";a="307412979"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2022 09:59:11 +0800
IronPort-SDR: yqIyjZnk4h/4AcZeaRPS/nxDvNx1mY4RtLzj6COcpult138PHFVy6PIVjGMe0ANA4boCRZC787
 h6j0AkWumFMMHVL6RR/QnQi6eI0l2lfVid7CWVFAg2LdSSktmrPPmkRS6xt5gQb1KMKLWDEd4B
 PJ++oyLm/iL8ASmQNo33ssdK6elWFoCrjZYX2Q8RddhRD3WCzLSCTxbyFRWo/Dgb7P+/bdhEeF
 VNInEuaUVtSIEl3ngADcCtIXeKcC9r1r3UEBnsM8iUYPOJWXJLzNJKp2Uc1PY1G2OSSI/wtCmM
 CJOazekW88oi2PZ6+eTLC7Hq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 18:30:18 -0700
IronPort-SDR: CI8cKK/6hRFB0G76K/A7IqcaZ46TwCdIJGhaUnzoH5iNEY0Ln55i9+sQVAzA7hoxAQguc61Zrq
 KWEhZUsrN6+S/J8ApXNhKbE5WGb882MgeCHcxkP3eWxbkwFsA8NiD4QmC31PCJqt6S40DxHn8d
 WpALK+0ZbEJQlIQFDk5wmTaBBhGHPb2nNUqCcRbe8KWbEe7k+sYyQbXncPQTO95W2TzywVJDEH
 XqEFCKCSm3wBNy/dZo1CktmL9bdE+HH7nDkShX75Rvz84ifJljEeE2uyRpx+bBsVwgK5OfWIt4
 yVE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 18:59:12 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KJD3M3KKyz1SVp0
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 18:59:11 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1647395950; x=1649987951; bh=EK0FagbRAlcOP2ydcIVZ7cjxZBeV5Ijc
 gmQ28uU5Irg=; b=MygOLNdZWKlp8qaf6c2mY7KilPV3o1mITO+8UkEwy85TAa1r
 LPBkZR6Y03oYaeApvT4MEmkgNwP//2SLHYv39xdetNI3I4BImfSch2zGEQ+kueMk
 aqpURIebwzgV9Htk1ZtvVj+Zn7tV70YlGSHJtivIb5BovmWupyzFoq6wGuHB4m8P
 F8em8JhBPUbaSMKAPn/9Vw4CKX8v8AmdW+BLSpBQpZY3kHiHGlnxn1HSgiPOEPCu
 9CGpoJ+5udN0e53pykcequAaxvIHuLYPwyv03cG4VS2VUI1LCu4jZhwdpdZ8APMA
 UAg5L5CKmvSdZXYzTKZVM1WKznvZGdvPN4R2/Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 67FJGEtRfh9L for <qemu-devel@nongnu.org>;
 Tue, 15 Mar 2022 18:59:10 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.107])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KJD3H6Ds4z1Rvlx;
 Tue, 15 Mar 2022 18:59:07 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com, alistair23@gmail.com
Subject: [PATCH v2 0/2] target/riscv: Allow software access to MIP SEIP
Date: Wed, 16 Mar 2022 11:58:59 +1000
Message-Id: <20220316015901.3787779-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=0672150a7=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>=0D

The RISC-V specification states that:=0D
  "Supervisor-level external interrupts are made pending based on the=0D
  logical-OR of the software-writable SEIP bit and the signal from the=0D
  external interrupt controller."=0D
=0D
We currently only allow either the interrupt controller or software to=0D
set the bit, which is incorrect.=0D
=0D
This patch removes the miclaim mask when writing MIP to allow M-mode=0D
software to inject interrupts, even with an interrupt controller.=0D
=0D
We then also need to keep track of which source is setting MIP_SEIP. The=0D
final value is a OR of both, so we add two bools and use that to keep=0D
track of the current state. This way either source can change without=0D
losing the correct value.=0D
=0D
This fixes: https://gitlab.com/qemu-project/qemu/-/issues/904=0D
=0D
Alistair Francis (2):=0D
  target/riscv: cpu: Fixup indentation=0D
  target/riscv: Allow software access to MIP SEIP=0D
=0D
 target/riscv/cpu.h |  8 ++++++++=0D
 target/riscv/cpu.c | 30 +++++++++++++++++++-----------=0D
 target/riscv/csr.c |  8 ++++++--=0D
 3 files changed, 33 insertions(+), 13 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D

