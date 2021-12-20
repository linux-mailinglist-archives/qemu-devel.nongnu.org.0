Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB77F47B057
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 16:31:46 +0100 (CET)
Received: from localhost ([::1]:53278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzKdd-0005Kw-Rt
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 10:31:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzCUF-0006rs-VN
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 01:49:34 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:46848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzCUE-0002O1-5l
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 01:49:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639982970; x=1671518970;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W6JKwS5ppCb6tYc4q1z6gITxAoMMDoHNGnK3uVsKI14=;
 b=HH86SysCMekJRn0Ie0HbayYreeZAiXR00xVJmmhwzhMjUYwZIk50L9yT
 OmuP1a25mh1NsIdCJYZzN5YxIkulSzz/kqco3B51gTUVGA50v0YZpange
 9NwYhfsM7ABceSkQ6KWjrpmKRbWm8vaeDyKA58GoSdz+OVXDxpsBtGTX9
 Y4D2yN+lz7IbvYCICW613/eeOCYXzcZtNQ04DQv/tYFIPSAY7rU8cn53f
 zhijm4imn8XaHkZoDHG8oJmkyxvvwnFrBsG5lrx0ik8+OG/cL8cuapHrU
 C8E5n2WWF8dXkJOETAoTAEXsWYU2EI3iqoh+QK64tQxi8mL2woCC8kAig g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="187632716"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 14:49:28 +0800
IronPort-SDR: gwjzK6LTosNDGG38LBlMZCa41YDuf9ou1dEix74m60bS4cbiBdk7vhx8kJwbE78bqMq0AhuZUG
 pRrN+A2oOs+G+WN2M39t/YPSGcBjLBSHWDpkl1COeBh/3bgMFrdUbmpuPMep+Tf6UNPbnWQxBQ
 dRoow49tMtmPDWOA5HS7RZsUhWTcRBmE4C5zBN9X6kDLcARclURaviWmNEAzlXp0WHlKVuIntM
 fKk0aaEgW/cHJC4E9OIZs3WgSiBHP5QBxRN02Okbj0YhkJbwPvm7usmvCpQ2OhgU5VIMCsj9H7
 nymthPW9P7E6xHsGxzEOLSfr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:23:45 -0800
IronPort-SDR: STNQvxXOF5Dsh/8BhK42JdMtzL6yxWnWhTPdEz7D1HVNyOv2hDzOAhUQoh2iqkWlYV5s8lmBk0
 TjDefRbm485RqX5msZxPlbXPXegn/avMcT3khMsm3ug7FGerSR9ZnJ1aZJ3fHz2nUZXYYHqLmM
 m1fO0khKc4qgeJ4qY2zYpOzM4ys/VS8IYJz31UB6apw1qSi1ZmqNtLdmhuuLJhVPIpPkNxjhi/
 nZXvCLfsV+4k3LQddiCVQzzP5CWLVGHNp8YqCRV2vxnF8+74FQ+wCSBhtZ4ZRlhHkQLg8XK9+t
 sAk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:49:29 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHVYz4HFdz1Rwnv
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 22:49:27 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1639982966; x=1642574967; bh=W6JKwS5ppCb6tYc4q1z6gITxAoMMDoHN
 GnK3uVsKI14=; b=Bu6dc+/OqR8NhvLEj2BLZojiCvMsgBDQkeZRTITLbq+ZXwLq
 DJzkjk0uPmxrzlhtfNu3FndkdrQ038nYnyWC7+5JAAAic4w8uTUu3jaWeFYIwsaw
 u9dKR7uV6MBlo1FQDnMVs7pdKUWVjxUvAMr9jQ5uXY+vv/303726PI9M7kbDUlT2
 rppyosSBvp5vxbMB3lWEhQSj0drjoTDFV+Vudf9U2/BLve7IRaiZq7R+c85u+Cu6
 EcPOC7gJQa4sqGKR1Xt0yePFmEviXzCyXQco4n3vKtJGWjcMIa29V2GCuWYEkhU4
 0r9vWr68ST8xE+kSdSY0VrRdfOuZ/ClX1B2f6w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Jg6x5TGH8vSc for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 22:49:26 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHVYt52mdz1RtVG;
 Sun, 19 Dec 2021 22:49:22 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 0/3] RISC-V: Populate mtval and stval
Date: Mon, 20 Dec 2021 16:49:13 +1000
Message-Id: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>=0D

Populate mtval and stval when taking an illegal instruction exception.=0D
=0D
The RISC-V spec states that "The stval register can optionally also be=0D
used to return the faulting instruction bits on an illegal instruction=0D
exception...". In this case we are always writing the value on an=0D
illegal instruction.=0D
=0D
This doesn't match all CPUs (some CPUs won't write the data), but in=0D
QEMU let's just populate the value on illegal instructions. This won't=0D
break any guest software, but will provide more information to guests.=0D
=0D
Alistair Francis (3):=0D
  target/riscv: Set the opcode in DisasContext=0D
  target/riscv: Fixup setting GVA=0D
  target/riscv: Implement the stval/mtval illegal instruction=0D
=0D
 target/riscv/cpu.h        |  2 ++=0D
 target/riscv/cpu_helper.c | 24 +++++++++---------------=0D
 target/riscv/translate.c  |  5 +++++=0D
 3 files changed, 16 insertions(+), 15 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

