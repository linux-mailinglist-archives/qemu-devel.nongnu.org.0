Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB705BC311
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 08:45:28 +0200 (CEST)
Received: from localhost ([::1]:36322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaAX1-00078m-47
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 02:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oaAHc-0007nq-UV
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 02:29:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:33530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oaAHW-00005y-Fm
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 02:29:32 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 bu5-20020a17090aee4500b00202e9ca2182so6066093pjb.0
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 23:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Vopz/BYe+Ey6PidW4HcEje2S/QViCiaTuz0aoYDIniA=;
 b=Iu0VnE7+LQcWMt405DjeIkm7F21RdtpqiJIhKn+6ieMArdCHDCK820YzHlQsKwoF50
 LmCFc2JJlil8mLoUJCdJ0tevY3tA2wCROX41iwK+1v/WeeaE7mnVeodiTvW4JYKlvOO1
 sha4plAUE9kluqu8kVpOOWoXFENTAVR2GRsXWEsE+7MdnpZbHSV41btZu/IvDJ8krm6N
 yoqq+eDLRu8MSO63zv+eeGMVpBbuXMoNiBKICBjPyYUkn6gMtK/OqltytKr+YQhDhxbj
 smPmXkMFmdEqLsFU32M4zur6Gj+tl1OigpBdPK/VwC0drvWZt1pJ+nRQwxH/8B5TX++F
 3dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Vopz/BYe+Ey6PidW4HcEje2S/QViCiaTuz0aoYDIniA=;
 b=OcK5FCLRtIbxqQHa7KtDqNN7S7gEYpFTbyLX0ujfAc1w1AU9NZUnBLDaBy28oTo9w6
 1hyUbb31Fu7HV+Cz0/asFaVuJ19ypVfzmv9B1vhMk7Rfk8SqNwT/29MdZrUeddcxqEjd
 Pagf20iGxhN1wePSqWncgHtGuXkEsLGAV8t6rly5LyHmAn0aRRMiKG+E9Rrsb1lnxXjW
 a/CT2sojr1l4b+VObfAynoT8MnhWCmcyyVfs3u7+rqXeIoVodTxMS7WOkodShP0jdWON
 Yqw87U2m2X9RdQ9VRFx9+rGDaP9NQYZIA/JGXlmkDhGBec4+IHbUee8Qd72i59SyZIjn
 xM6Q==
X-Gm-Message-State: ACrzQf0/9Fro78UQ5FHAn/H3uAAelZN+6LaRNrV0RqVE2xKNp7Zv9UeA
 s5MGk1A01ahxRDdNCY6V32qTRAqU4hHouQ==
X-Google-Smtp-Source: AMsMyM7lkZvdUCohcXepz1prpT7WQdqZ25m3mKSamP3y4NgdejnztWNGS4MoQOs/lzybpMxKJFKihA==
X-Received: by 2002:a17:902:e549:b0:178:6d7c:abf6 with SMTP id
 n9-20020a170902e54900b001786d7cabf6mr12004662plf.131.1663568957066; 
 Sun, 18 Sep 2022 23:29:17 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.169.74.146])
 by smtp.googlemail.com with ESMTPSA id
 y1-20020a17090264c100b001782580ce9csm17678574pli.249.2022.09.18.23.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 23:29:16 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v9 0/4] RISC-V Smstateen support
Date: Mon, 19 Sep 2022 11:59:04 +0530
Message-Id: <20220919062908.643945-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

This series adds support for the Smstateen specification which provides a
mechanism to plug the potential covert channels which are opened by extensions
that add to processor state that may not get context-switched. Currently access
to *envcfg registers and floating point(fcsr) is controlled via smstateen.

These patches can also be found on riscv_smstateen_v9 branch at:
https://github.com/mdchitale/qemu.git

Changes in v9:
- Rebase to latest riscv-to-apply.next
- Add reviewed by in patches 2 and 4

Changes in v8:
- Rebase to latest riscv-to-apply.next
- Fix m-mode check for hstateen
- Fix return exception type for VU mode
- Improve commit description for patch3

Changes in v7:
- Update smstateen check as per discussion on the following issue:
  https://github.com/riscv/riscv-state-enable/issues/9
- Drop the smstateen AIA patch for now.
- Indentation and other fixes

Changes in v6:
- Sync with latest riscv-to-apply.next
- Make separate read/write ops for m/h/s/stateen1/2/3 regs
- Add check for mstateen.staten when reading or using h/s/stateen regs
- Add smstateen fcsr check for all floating point operations
- Move knobs to enable smstateen in a separate patch.

Changes in v5:
- Fix the order in which smstateen extension is added to the
  isa_edata_arr as
described in rule #3 the comment.

Changes in v4:
- Fix build issue with riscv32/riscv64-linux-user targets

Changes in v3:
- Fix coding style issues
- Fix *stateen0h index calculation

Changes in v2:
- Make h/s/envcfg bits in m/h/stateen registers as writeable by default.

Mayuresh Chitale (4):
  target/riscv: Add smstateen support
  target/riscv: smstateen check for h/s/envcfg
  target/riscv: smstateen check for fcsr
  target/riscv: smstateen knobs

 target/riscv/cpu.c                        |   2 +
 target/riscv/cpu.h                        |   4 +
 target/riscv/cpu_bits.h                   |  37 ++
 target/riscv/csr.c                        | 471 +++++++++++++++++++++-
 target/riscv/insn_trans/trans_rvf.c.inc   |  40 +-
 target/riscv/insn_trans/trans_rvzfh.c.inc |  12 +
 target/riscv/machine.c                    |  21 +
 7 files changed, 583 insertions(+), 4 deletions(-)

-- 
2.25.1


