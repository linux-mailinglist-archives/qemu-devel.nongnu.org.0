Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD9B4951D1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 16:54:20 +0100 (CET)
Received: from localhost ([::1]:34504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAZlT-0002MI-9H
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 10:54:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nAW44-0004pS-Ag
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:57:16 -0500
Received: from [2607:f8b0:4864:20::102e] (port=41473
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nAW41-0002i7-Il
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:57:15 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so5616491pjp.0
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 03:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o6XDr36NJxCliDxdkfqfDFTCD9b7LaaUZYEo0i4nSLU=;
 b=OXQxZ9+TruHnaYJcVhouMKsV6/jpT9t2FBy3rdqiMMa7ONmcw8P0NhqJoCWNhaYnwF
 UjDexzyzdx5dRBVCK3rAs++f06DCL7rxVfIzp4KAC9yo4zRvo77TbEp3ahrpw/2xnV4C
 30QnXwlbK5bdArSBUDinzwOFvTjNyJceZz9q7mA96OxXFq0G2AlhBu6aQe/c6JEtY/he
 bGDhqjyZAt+nNyY9vULoU249tulWpTgIqmQ6EeFUXp3pYnH/5ZzKgRFyk/5tl9nMhgZb
 D6XCP4lt+1I6//KAaL51SPtlAR46m7dsi0vP/V7aQmi3LPFO8Dqzy39iR/Rx7R+RE2Io
 zdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o6XDr36NJxCliDxdkfqfDFTCD9b7LaaUZYEo0i4nSLU=;
 b=drXBBub0VBtwI2PWoYA2M0bHOVu1H9T6VggPyvRzYPjMHoOEOxEtoghT78zJjKEHfz
 8ZVHLKaGO2yTSsNzckLvgUhhViikBjdcuOY6pP/I0g+l8J4PyYKk/Bw9PMw+QzrEN3W0
 BJjdVhy7IHIwDkuxD/ni1EQjNBOXkn9SB+eQS5MKmRH/dy7wjFvYsOYrp38D48jZS2S4
 JhICKtCoZJGYrt3vXmwt/k2v+FJNdnXddxeh69w1caWGWk6RZfwdkTZdHVw6ll/zZI2D
 P93Qmk8W5hbaPQ/cr9mGIZMuMhtw8wL4leQKnr60IWCEhn+qMFup5WxZmdUnjpAAbtU6
 6iYA==
X-Gm-Message-State: AOAM5332LEK3V9wyWo9YMFJ7SKnBee3ANnp1P/2gnZKoECZzULNA7h4m
 TdyAb0foQqaoFQjwG5g4WLp9Ww==
X-Google-Smtp-Source: ABdhPJxcwbtN/Y5VfZ7rtg+lYZkKvO0w1Gq4Ipsk7eUWPCK7oLT5gHlbGg4Vx9ZnjXoiOF9S7E8+7A==
X-Received: by 2002:a17:90b:180d:: with SMTP id
 lw13mr10335841pjb.215.1642679829616; 
 Thu, 20 Jan 2022 03:57:09 -0800 (PST)
Received: from localhost.localdomain ([122.179.80.139])
 by smtp.gmail.com with ESMTPSA id c2sm3465694pfv.68.2022.01.20.03.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:57:09 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v3 0/3] Improve RISC-V spike machine bios support
Date: Thu, 20 Jan 2022 17:26:53 +0530
Message-Id: <20220120115656.31686-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Anup Patel <apatel@ventanamicro.com>, qemu-riscv@nongnu.org,
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series aims at improving RISC-V spike machine BIOS support by allowing
use of binary firmware as bios. Further, this also allows us to totally
remove the ELF bios images shipped with QEMU RISC-V.

These patches can also be found in riscv_spike_imp_v3 branch at:
https://github.com/avpatel/qemu.git

Changes since v2:
 - Remove ELF file names from .gitlab-ci.d/opensbi.yml in PATCH3

Changes since v1:
 - Use htif_uses_elf_symbols() in htif_mm_init() for PATCH1
 - Added PATCH2 and PATCH3 to remove ELF bios images

Anup Patel (3):
  hw/riscv: spike: Allow using binary firmware as bios
  hw/riscv: Remove macros for ELF BIOS image names
  roms/opensbi: Remove ELF images

 .gitlab-ci.d/opensbi.yml                      |   2 -
 hw/char/riscv_htif.c                          |  33 ++++++++-----
 hw/riscv/spike.c                              |  45 +++++++++++-------
 include/hw/char/riscv_htif.h                  |   5 +-
 include/hw/riscv/boot.h                       |   2 -
 include/hw/riscv/spike.h                      |   1 +
 pc-bios/meson.build                           |   2 -
 .../opensbi-riscv32-generic-fw_dynamic.elf    | Bin 838904 -> 0 bytes
 .../opensbi-riscv64-generic-fw_dynamic.elf    | Bin 934696 -> 0 bytes
 roms/Makefile                                 |   2 -
 10 files changed, 54 insertions(+), 38 deletions(-)
 delete mode 100644 pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
 delete mode 100644 pc-bios/opensbi-riscv64-generic-fw_dynamic.elf

-- 
2.25.1


