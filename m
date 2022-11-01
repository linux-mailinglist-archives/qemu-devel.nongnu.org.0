Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA37614366
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 03:48:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ophJS-0002I6-ES; Mon, 31 Oct 2022 22:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1ophJ5-0002E1-CT
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 22:47:29 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1ophJ3-0004D9-7o
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 22:47:14 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 p8-20020a056830130800b0066bb73cf3bcso7800234otq.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 19:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LNFLpDjl6gEmrwAKx9a5roVrTsz01H64OI9IVTmmQUQ=;
 b=CjDXJufn7C6d+ZokQ8yj0QZIK/GPc9r/10wW5xVkMI+95T0WQwgiiLzzHcBEGX3fK+
 WigGJGGKAxqEl8B9GrxJ10yVHhJ8L5C+WeCorL845HGlDO6m1FfWeiPoNXVEdYNQWsWv
 vnw9I42rzPTgJHxfVd3q6IkZnvkKnwGt2huYiEhuAE+qgaeb9DhVHzM1xCk2TA8lw96E
 RN0DW335zaLtOx42F4yjb9D7DP3JZz4ctNvTyyfW8/vavxyzcOe6i1bFM8Vjwi3kJqB6
 XfQV48mHu85Sl9hsH7ndIvaLIp6nWcAIAXsfCMNNkbYtOCxrafjYNolThrBBHyd6qycy
 6LSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LNFLpDjl6gEmrwAKx9a5roVrTsz01H64OI9IVTmmQUQ=;
 b=TKfSdWFKE4teaK0PvSONPLBiobth/9ANNBWE/aVE3w+nv/To2c42SsT+vtGPOeDh1R
 dbTi17A3CegurwoFFbVNfR0y2GWKKVJcmZ2ElLjk4MeJLwc0128ya/MIpgcIIV9Hk+K7
 W1Xw4MARgPHSnrIkd40AMTBSyQyBD3F3rPFsZXrR1WwMT4aRBUrRSKLy7aVinNUjLyq2
 NbkxeKnqS/9LGXvE8GeL05s/z9fBaNeObk5gSXlQ4wsJ39qkfgkenNjF9NyU11y0wqbk
 TDIU6oDoTzBQF48jhuyrCkCFXA9rI3M7G2Ww8HzHhL3IVAn1VfVNhwRekT7TBcUAqsKG
 iZfg==
X-Gm-Message-State: ACrzQf0w0SQocomKthWGZkvGveQQw08D6vtFwqh7dY8eLM4VFsaAT5QB
 UqG0wVNkwmzgrTAXI+G7dxr4MGrbkBzG3aIfV5IrTyU8iJXu8iMUigIKjLM0C6cQX/YPXh8ZBZv
 T7HJoJFmdssSWQwlDdwP4r9jxrUIS9VHliRhwUhXP8UGKKrKld3SFesX+Mpes4wjRizwscKc=
X-Google-Smtp-Source: AMsMyM629vGvszhFiW1Z7i5d2Al7HB4iEDo6UsaaN6CJafdhZtqQ+szQdJM6f1MfCwY3yJcaT14Q2w==
X-Received: by 2002:a05:6830:2706:b0:661:e264:9b82 with SMTP id
 j6-20020a056830270600b00661e2649b82mr8403066otu.82.1667270830422; 
 Mon, 31 Oct 2022 19:47:10 -0700 (PDT)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a05683001c400b00661a33883b8sm3367215ota.71.2022.10.31.19.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 19:47:09 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v2 0/3] Implement the watchdog timer of HiFive 1 rev b.
Date: Mon, 31 Oct 2022 19:46:53 -0700
Message-Id: <20221101024656.517608-1-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=tommy.wu@sifive.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

The HiFive 1 rev b includes a watchdog module based on a 32-bit
counter. The watchdog timer is in the always-on domain device of
HiFive 1 rev b, so this patch added the AON device to the sifive_e
machine. This patch only implemented the functionality of the
watchdog timer, not all the functionality of the AON device.

You can test the patchset by the QTest tests/qtest/sifive-e-aon-watchdog-test.c

Changes since v1 ( Thank Alistair for the feedback ):
- Use the register field macro.
- Delete the public create function. The board creates the aon device itself.
- Keep all variable declarations at the top of the code block.

Tommy Wu (3):
  hw/misc: sifive_e_aon: Support the watchdog timer of HiFive 1 rev b.
  hw/riscv: sifive_e: Support the watchdog timer of HiFive 1 rev b.
  tests/qtest: sifive-e-aon-watchdog-test.c : Add QTest of watchdog of
    sifive_e

 hw/misc/Kconfig                          |   3 +
 hw/misc/meson.build                      |   1 +
 hw/misc/sifive_e_aon.c                   | 403 ++++++++++++++
 hw/riscv/Kconfig                         |   1 +
 hw/riscv/sifive_e.c                      |  13 +-
 include/hw/misc/sifive_e_aon.h           |  62 +++
 include/hw/riscv/sifive_e.h              |   8 +-
 tests/qtest/meson.build                  |   3 +
 tests/qtest/sifive-e-aon-watchdog-test.c | 650 +++++++++++++++++++++++
 9 files changed, 1139 insertions(+), 5 deletions(-)
 create mode 100644 hw/misc/sifive_e_aon.c
 create mode 100644 include/hw/misc/sifive_e_aon.h
 create mode 100644 tests/qtest/sifive-e-aon-watchdog-test.c

-- 
2.27.0


