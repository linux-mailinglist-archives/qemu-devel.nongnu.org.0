Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77615564365
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:14:56 +0200 (CEST)
Received: from localhost ([::1]:47992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nGJ-0002NM-IW
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEI-0007tH-Oi
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:12:50 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEA-0001p4-UZ
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807162; x=1688343162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4O9Haf7jJUgWkLHCw9Mzfwpnsh8yiNMghAUQ5LlJUbQ=;
 b=gUwkfo05a/YH87Xcs8fI/J+NWzaYSK7RWIlWzWT405JnlUpG2aoCjUOC
 MQpb5cgQWBSryp3erKgWBKlYm5NHuCtNXqGPTYPdO9o2t6lM8XFUkiOVH
 s9notumyO+DbgYc1xHby8+nHzlLoT92kRbVgrfEpBTiZ9x70OUpbI6/Yy
 xpaXpFFMx3q75MZXWyhRXlt26ThXxKAuQozZ3fbCI5PzZGfIgmkETVaNS
 8xQESYWNGVLMA+sqf/EnajRrZxmKAIjJltQOELHnyGUynGClNbSZj800G
 b69bpXTQt6yC013ubIp0eGgJTys0zW7Qh3ewHGdkBU6yeNvHSv8PGY82F g==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667213"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:12:40 +0800
IronPort-SDR: 0JWgGGptwQx6Xp2739EoB8FU2Pq9tmUfHqQL4gCOWPZUwYhM+Ju7uXZoxBtBdhOiNzn5pBTo6Z
 g9ADkC/UyqgvPobgTEAgIDXlbTgD9hd7kVSLVqa0TBChMAp8SY10hxcgXKxcFYXd8ms85gEZaT
 OT8P1Ml1qcvuJXA025vbuKIF/ssV04psfrBWnSCZHKfzI3xJPGwPH6nrRy3wBd++w0N5ntUAAB
 fm1Wte0bhXURPWm4nDE5tSa6n/EmZxjO+cEU0tBHQgRFoFiVe23kRfIU8PMzy/eEjhtHLVegQz
 bAfE/XTvFmUHjfIISoBrmtkF
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:02 -0700
IronPort-SDR: 7DTwA3+yEQhiR30ibS7bkcSawlpWUQtPwiD9OIgHuUbsfAk0M6//cpjErQxmv/3OdlcoNdB2SR
 il6f90s/F5KP8NsIZfQk00Tj5dCBHXCdzAfeVYLLcdQ/yJOp3j4mC3GjNFcLqk2QSTph0La4hQ
 1xyxhtlvVn4Sw31xQV5/9NxcMLgbHi+ETW+OujCIY0/lcCAT5Uca6Tch08qGx6VP1yjNF6hQ0i
 OinRBbV5UyMKaGcxYUuyqXo7OdQoPRM6TsVZbFQs/z+DOpr/N2k251rhIjQogBBe6SJeKHoC4T
 vjY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:12:41 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8X83kHgz1Rwnm
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:12:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1656807159; x=1659399160; bh=4O9Haf7jJUgWkLHCw9Mzfwpnsh8yiNMg
 hAUQ5LlJUbQ=; b=hs09/t/epYRpNHSljVWVBz+NfnHaxoQZAB5NgqI9hCVYZKAH
 nl6zrTdnz7ZkSj1kScPdu22XB3pt8fs2zsZ/OkHtqgFpn5G8mLpfzdbCRTHjgUMU
 T6C+n7cmcoxiKni1gIiGD7bXOxkWwZjy3OZQAV6yUwUy2kr/VNiyaZUMIVfooBTX
 pdnEiR6uKAXsw5FA5+kwnaeirsjKCtX0hwUgduFSsLJcjq6++zo1SXW9cXmHFGTP
 UaWOF7N8fNnUjlLrI09SBfSQjvFREV9+6gm8bgnwuqnaQuZ48dPGjcH6BlwppCz6
 4qFXT7THJqb2wjwRM0p8pdMgvuKPIzkrWSSM/Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id eTXezzLwkxD9 for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:12:39 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8X65chvz1RtVk;
 Sat,  2 Jul 2022 17:12:38 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 00/19] riscv-to-apply queue
Date: Sun,  3 Jul 2022 10:12:15 +1000
Message-Id: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit d495e432c04a6394126c35cf96517749708b41=
0f:

  Merge tag 'pull-aspeed-20220630' of https://github.com/legoater/qemu in=
to staging (2022-06-30 22:04:12 +0530)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220703-1

for you to fetch changes up to 435774992e82d2d16f025afbb20b4f7be9b242b0:

  target/riscv: Update default priority table for local interrupts (2022-=
07-03 10:03:20 +1000)

----------------------------------------------------------------
Fifth RISC-V PR for QEMU 7.1

* Fix register zero guarding for auipc and lui
* Ensure bins (mtval) is set correctly
* Minimize the calls to decode_save_opc
* Guard against PMP ranges with a negative size
* Implement mcountinhibit CSR
* Add support for hpmcounters/hpmevents
* Improve PMU implenentation
* Support mcycle/minstret write operation
* Fixup MSECCFG minimum priv check
* Ibex (OpenTitan) fixup priv version
* Fix bug resulting in always using latest priv spec
* Reduce FDT address alignment constraints
* Set minumum priv spec version for mcountinhibit
* AIA update to v0.3 of the spec

----------------------------------------------------------------
Alistair Francis (3):
      target/riscv: Fixup MSECCFG minimum priv check
      target/riscv: Ibex: Support priv version 1.11
      hw/riscv: boot: Reduce FDT address alignment constraints

Anup Patel (4):
      target/riscv: Don't force update priv spec version to latest
      target/riscv: Set minumum priv spec version for mcountinhibit
      target/riscv: Remove CSRs that set/clear an IMSIC interrupt file bi=
ts
      target/riscv: Update default priority table for local interrupts

Atish Patra (7):
      target/riscv: Fix PMU CSR predicate function
      target/riscv: Implement PMU CSR predicate function for S-mode
      target/riscv: pmu: Rename the counters extension to pmu
      target/riscv: pmu: Make number of counters configurable
      target/riscv: Implement mcountinhibit CSR
      target/riscv: Add support for hpmcounters/hpmevents
      target/riscv: Support mcycle/minstret write operation

Nicolas Pitre (1):
      target/riscv/pmp: guard against PMP ranges with a negative size

Richard Henderson (3):
      target/riscv: Set env->bins in gen_exception_illegal
      target/riscv: Remove generate_exception_mtval
      target/riscv: Minimize the calls to decode_save_opc

V=C3=ADctor Colombo (1):
      target/riscv: Remove condition guarding register zero for auipc and=
 lui

 target/riscv/cpu.h                             |  24 +-
 target/riscv/cpu_bits.h                        |  30 +-
 target/riscv/pmu.h                             |  28 +
 hw/riscv/boot.c                                |   4 +-
 target/riscv/cpu.c                             |  17 +-
 target/riscv/cpu_helper.c                      | 134 ++--
 target/riscv/csr.c                             | 857 +++++++++++++++----=
------
 target/riscv/machine.c                         |  25 +
 target/riscv/pmp.c                             |   3 +
 target/riscv/pmu.c                             |  32 +
 target/riscv/translate.c                       |  31 +-
 target/riscv/insn_trans/trans_privileged.c.inc |   4 +
 target/riscv/insn_trans/trans_rvh.c.inc        |   2 +
 target/riscv/insn_trans/trans_rvi.c.inc        |  10 +-
 target/riscv/meson.build                       |   3 +-
 tests/tcg/riscv64/Makefile.softmmu-target      |  21 +
 tests/tcg/riscv64/issue1060.S                  |  53 ++
 tests/tcg/riscv64/semihost.ld                  |  21 +
 18 files changed, 843 insertions(+), 456 deletions(-)
 create mode 100644 target/riscv/pmu.h
 create mode 100644 target/riscv/pmu.c
 create mode 100644 tests/tcg/riscv64/Makefile.softmmu-target
 create mode 100644 tests/tcg/riscv64/issue1060.S
 create mode 100644 tests/tcg/riscv64/semihost.ld

