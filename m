Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CB74DBF72
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 07:24:00 +0100 (CET)
Received: from localhost ([::1]:59516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUjYF-000522-PA
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 02:23:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=068022f98=alistair.francis@opensource.wdc.com>)
 id 1nUjTN-0001rX-30
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 02:18:57 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:4019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=068022f98=alistair.francis@opensource.wdc.com>)
 id 1nUjSx-0004NK-76
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 02:18:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1647497909; x=1679033909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EK0FagbRAlcOP2ydcIVZ7cjxZBeV5IjcgmQ28uU5Irg=;
 b=E370jymTzq0T6DwoB4hyjncdYziXmV/YxpcVgEY0WRU5tQuXJZllWuYT
 IJvPLOLoZWfhb9ChN2IefejTpQp1vk8q9ixhPdFEjTKjf8zJivB8ua/Rt
 1nmer4elfiIe1BxMtZ1JYy/MpW/glq1f2TWIWDw/HsSh8LRJ18YFWznC9
 xe4DxT3pUlfaVfyNGR/xwqRSMKpeI0zDw+1RMH7oUAf4Tr0QwZM95pPBj
 aCdidoCOUYCnkC6k6AgU1/Z/G1oUeiiGs5z3U3D9bAllk4V+t43PhaMtj
 MR4GiM0DPz6SPKErcxs2Sy2jyeQHT4z1dpuTg5Q14K2QX0NMpXaKBNVcL w==;
X-IronPort-AV: E=Sophos;i="5.90,188,1643644800"; d="scan'208";a="200422232"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Mar 2022 14:18:25 +0800
IronPort-SDR: 1CRHCN2ye8d9bJDvX3z8D1/Kex+9ovc/arvwTJwoxQ3NKFsFMCrNvM3hYfLJ8RCQ33TwJT5Enj
 1D2Q6KDuv83wxXw/JmoVXWfu55GyqXTzHl9QLKzSvM/IotA6nLaSewOsNtC6tkIst+iEmfCrmj
 gfVJb1zDsUraImchpeDaXM+N8eJ2Ts3jRbd0vboVaULJXZhbJZtqyIIyIt6q+81Xohz60h1OHx
 UXSk2sXG2LD0ox6XZBd0JPcaqlRXt0ne5jrUtaYZB+5WIRltjC1TAnUhbdwpSWpMSQ7He2xLk5
 i0H8935ftT3bZAVX8BIY4c7v
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 22:49:32 -0700
IronPort-SDR: M8b3d0tRNftLonUtH86Ns0soCKPPRPpMcZWUPAfcY6CVlWO3CML+TN/1TgjKg5KVV28PGETuz5
 eJ5BkUCZyKqgl/KP78/Eb3YskenynQtj7/2KngQXha5nXiIKS2OjiDalDRzWpiFZ2jxtKSMF0D
 sLo1P6mNKEjbZzYGDIfZg7zQVunvxAMlEQFxwH6k7neOl8tnF99pJv16PDFmV04PmKq/oBkCtx
 NeodPn3ukZ3ChOxTkyCZVDDfn9YX0cRZHMLm7oc/Wl8E1AfhjQl6w+MwQBz0IifXrrHpzXpeHG
 dSM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 23:18:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KJxm23Krqz1SVp1
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 23:18:26 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1647497906; x=1650089907; bh=EK0FagbRAlcOP2ydcIVZ7cjxZBeV5Ijc
 gmQ28uU5Irg=; b=jeJMIMPzfQ4kNpC1V6+2EIhGJ0lqB6+yh9BVu6iNFv8Ue1+a
 xIx+nVTjPbES+y2rdHY7gVCww4J2esj82y4RlYGjNUbVlAkvGDB8oHIFJgSR5YHA
 agFciwGYmBekFObp4feeZLP2ROIQQEcEo0Pn7pJQXSO+84ZmNmS9fNYK+UlLRu3Q
 ieCX4fxNUSlkQGwmE0rU03QJHscs4xUCTGbrhuZoMAZxcv/XW1Sr+iK3yJqiql1Y
 p8cvkl69TFTdS+y0oh/ANmJtNbsQmV9Nrke+XqjsLyUFLX4HTe/S9ttPvpbMYHmE
 0YnHO5mZrNPzymb13zthlnvGV9hA8zd+88tFDQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4--odqzoxyuY for <qemu-devel@nongnu.org>;
 Wed, 16 Mar 2022 23:18:26 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.107])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KJxly09gDz1Rvlx;
 Wed, 16 Mar 2022 23:18:21 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com, alistair23@gmail.com
Subject: [PATCH v3 0/2] target/riscv: Allow software access to MIP SEIP
Date: Thu, 17 Mar 2022 16:18:15 +1000
Message-Id: <20220317061817.3856850-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=068022f98=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

