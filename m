Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD194976D6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 02:04:43 +0100 (CET)
Received: from localhost ([::1]:41640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBnmk-0004vu-7Y
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 20:04:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=01678aa48=alistair.francis@opensource.wdc.com>)
 id 1nBnjf-0003Bc-5p
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 20:01:32 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:31092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=01678aa48=alistair.francis@opensource.wdc.com>)
 id 1nBnj1-0003kC-Hg
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 20:01:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642986051; x=1674522051;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z/jLsWth+gcXxCWJwaPtYp6g1S1gAjwBId85xThuZkY=;
 b=Uyf05kkSLUIJVhjvvs24TUn5RsTX4jPKOC50OhGC4Jk18ArxFdZGbktX
 4idXOMoH1p835dcSJEQZt2mCu3GQMbKClOLZh2pXwTOH4X08GCAFew6RD
 uU+GpZNbIZp+NqgT/5UoKuZIKXR/gyyGDNtyuawnXA0A5Kg1m9rzvni6w
 7cm9sX/Zl8U6fIntKamv7X4Yg3RmTvn5V1im7eQh3g+C3Y8AdqVmbggZu
 TY/dweesG2Rn5zxTeteQBGzlxlOFUuDzow2hl7+BSdJDimPuaNmU5hNDX
 lM8gMVeB2asKsiNo1gNjBuPUv63Z05Yie8HQIRMO539wOUEA4RVng1cIU Q==;
X-IronPort-AV: E=Sophos;i="5.88,311,1635177600"; d="scan'208";a="191176027"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jan 2022 09:00:12 +0800
IronPort-SDR: TSWk0yOMFR/6xA0qUixhCxSUi/ALAlwhG6RK9lryKR9A844W4hrv+LZoQElr0l+1kk0eu0k9PZ
 XOnTIkm22cV6TXIW51K9vWDDJony3mqWa4mKv7r7e1yPi+bvYU0rHbPVcKULJ4SBjM8tDxq71n
 FOKz+IoNCvxv7GAcfhCfHVGqnBbOa/Mbb9ZESnUU4yU3XfzpqskCu0BZSVyFDNdlkaqHVh6+bl
 O5XFqtE4Rm8D7PLZxx0DtL1Au+R4R/fAy2rmvePpwcCBYIebq/CB7Mp8XISHHi7qM1Q+xERu1N
 q9Y03qwnOqSTZwN5lqGYIwyK
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 16:33:35 -0800
IronPort-SDR: 3Z3Nt/482RVMDF+s4BPRZPn7oZYX34VDAN9fla9de6PeeE8B7wLG381Vdx5jUEd/5rCjJk68dd
 +J9PPMbEnSTtZsyPxYRBQKfHfw/CmBpQXPuOXEbnfKKrRndSJG0O//f1oOZlsF8Ev6+5B4hRek
 WD9TBHIfOI5xE3d2z2KWuM3Fs7NQZp9FiJktMjt9s/rTdbjrgYlOQCoJJiG3491c4bjTIcqz7p
 lGVvVleiyDgaZlJivWJcmGmN0nVW4aFNhttFo+ofvljOfAexk2scgu0Ksy2vL0ggTe3ADmGUGT
 Q4w=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 17:00:11 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jhs8r0TSYz1SVny
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 17:00:12 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1642986010; x=1645578011; bh=z/jLsWth+gcXxCWJwaPtYp6g1S1gAjwB
 Id85xThuZkY=; b=sFS+PvIQWUrRixa5Y0YCWO+KXLFu1g+UW1+WPMq1gJuEefVH
 qpVZ7OsBT80TaU643IvGlUl9ZqoGIeowUU8Dkx0mMBr7EKR1yTVqGvjnk5xjMtjz
 4bHluIOMqjZYOA8qAlvs0e8dqQp8/0MXxGmSbQvpsaX3hFeYO9L2sD31nKyp4r/7
 DY1GjHjimcbGOilKO+UK6uitVorIIW6S1DQWY9W/5m3Jwf9Z71KMsXB906paEJ0U
 ldv677Mq9fhNdp3q7rwxPzfWNqjfCU629t5FBKdsiwQxS3tjqKFyeYLH95pXaDd6
 we73cQs1271C4swYR2iajik5eKpkE/v9+3KNzw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CQEJrVjzWIVI for <qemu-devel@nongnu.org>;
 Sun, 23 Jan 2022 17:00:10 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.84])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jhs8h2GQcz1RvlN;
 Sun, 23 Jan 2022 17:00:03 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 bmeng.cn@gmail.com
Subject: [PATCH 0/2] RISC-V: Correctly generate store/amo faults
Date: Mon, 24 Jan 2022 10:59:56 +1000
Message-Id: <20220124005958.38848-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=01678aa48=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

This series adds a MO_ op to specify that a load instruction should=0D
produce a store fault. This is used on RISC-V to produce a store/amo=0D
fault when an atomic access fails.=0D
=0D
This fixes: https://gitlab.com/qemu-project/qemu/-/issues/594=0D
=0D
Alistair Francis (2):=0D
  accel: tcg: Allow forcing a store fault on read ops=0D
  targett/riscv: rva: Correctly generate a store/amo fault=0D
=0D
 include/exec/memop.h                    |  2 +=0D
 accel/tcg/cputlb.c                      | 11 ++++-=0D
 target/riscv/insn_trans/trans_rva.c.inc | 56 ++++++++++++++++---------=0D
 3 files changed, 48 insertions(+), 21 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

