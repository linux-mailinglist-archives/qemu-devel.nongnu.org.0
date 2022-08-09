Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B517558D2B6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 06:19:50 +0200 (CEST)
Received: from localhost ([::1]:36236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLGib-0003OX-CW
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 00:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oLGfo-0006h4-Vd
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 00:16:56 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:40844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oLGfm-0004ZO-Sg
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 00:16:56 -0400
Received: by mail-oi1-x230.google.com with SMTP id c185so12610462oia.7
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 21:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=OyczFOlat3ssXKM402zgzGhQJT0O7WqOkSJhLNbsYEI=;
 b=pLkALXSvjxrqIMTfe0cQSOldjfGsmp1R3mC/N3IXc/ivJjA4mQ96Rb7VEf3ogkU8t/
 VyLhEpMP0ceu7rUTT16XO5NakKebwNERONb8aHtrItgQy2dXBYAyQRdDxx44U6H+Frp3
 BbEZwCXnWTVRALm30k6WLk9D6JU4rO2jODljBPdR1XzNyIQTkCQ0mUv/3yA8Zsq/HdJX
 ZvyUsVbJbXcGYASe3IdM9PElVBCDJJherTMCHmwrj2BEcTVECxckdqjD7MRD6UUJD2Bd
 W9gXgNt2fZTy3pr/gjwgO5MYPDCGfX5f3DemL8oHrocbvVr2eGGNJkCWrCnEvHKb8c72
 h0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=OyczFOlat3ssXKM402zgzGhQJT0O7WqOkSJhLNbsYEI=;
 b=qcTttatUx4fJ2IsjB2Ll5gxGs8a0KfE/h5FmL9ZCkDdLvQG06H56yYra88hxS05W9Z
 WysDKL1DRHOFUn1jrZo+y2kDOUCuUH0k4T+2fmfJ3eErwq1zla0ATxgV2Ls6qFlqioGJ
 q32hlKQ5m2WyDSF3AzVIt4GdfEB8YSwDv0YdbpNIvRy0utvq8uCe5qK37Is2/lzYEpN7
 7hox61sf56L9lVTbEt1hgrdjYBReY6nIwJ/FBCe+xPE5shJPSibs0smgifkw1wnE9Pif
 5h7keSKdOAT0oqiKqejT0oWYvVcpgzDxm//ot0YWrTWE6xvTk7uTSaDTPMlGzRRJv17V
 qZvA==
X-Gm-Message-State: ACgBeo02X3JRP/1qRjssGnBsit0jo981K67si8e1cJ0HJGmOsR4GTyrT
 //1o5F/dnZLt83CNVAtS83eKMIQcIzMwoQ==
X-Google-Smtp-Source: AA6agR6YDKeL8n62KTcRlFEat08CoYtLb+0FLSuHs6OTtG16G09RAdefq6zC2HVDbXuiPs0FENf07g==
X-Received: by 2002:a05:6808:1641:b0:33a:1754:82a5 with SMTP id
 az1-20020a056808164100b0033a175482a5mr12400340oib.206.1660018612825; 
 Mon, 08 Aug 2022 21:16:52 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 g15-20020a9d648f000000b0061c9ccb051bsm2712738otl.37.2022.08.08.21.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 21:16:51 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v8 0/4] RISC-V Smstateen support
Date: Tue,  9 Aug 2022 09:46:39 +0530
Message-Id: <20220809041643.124888-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This series adds support for the Smstateen specification which provides a
mechanism to plug the potential covert channels which are opened by extensions
that add to processor state that may not get context-switched. Currently access
to *envcfg registers and floating point(fcsr) is controlled via smstateen.

These patches can also be found on riscv_smstateen_v8 branch at:
https://github.com/mdchitale/qemu.git

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


