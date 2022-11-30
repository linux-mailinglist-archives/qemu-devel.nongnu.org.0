Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A96363CD0D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 02:56:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0CJN-0003Qf-Jh; Tue, 29 Nov 2022 20:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1p0CJL-0003PN-BZ
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 20:54:55 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1p0CJJ-0005RF-Nn
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 20:54:55 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 w15-20020a17090a380f00b0021873113cb4so543377pjb.0
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 17:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7Na3Qsw2N8+bEzTD+3WGfRuAEDb8bOMMkoc+54F3zD8=;
 b=Ff+Yibyt5FylZ6tZTHtDwpu/ALhNFkDd5WC5D0/XVvBFzak3Hhax+N2xYmkbIsFuLC
 kj2MlgoE8J20KZ75iCglwebJh+P18eL9n2hOTPGENoL0xfthoMG65cxbAq1M0dGSWRdo
 Lx2U6q7YBPcbpbuT+cig5Zcaiuw0I+M4LLrgF7b8g74ZNnK0E+yU02zLWCderXkLY3iG
 YTvsutYHfMeVY2J60FwslH3mO+URV8SQ/5XbiDY2BXalmBYFMyIFnnT69KYGuVHLbRo4
 n5FM71lSOOkyAL/s49DOmy1zWqI0HWkqWJP6zW9PO45EWZtdzi16+jsGcdreXJIvbYEk
 vdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Na3Qsw2N8+bEzTD+3WGfRuAEDb8bOMMkoc+54F3zD8=;
 b=SCXIksSHSsXmmf/tpq0VFNbWd9fihQgAO6hIHYcVl5hfyU8UWG0gvmvnGOGc5I1Hey
 STuDO/LVMoTDgUmM2iawCfbm3PArY4i1JVDJq4E88uUWkb+Y+DPdcxh0NVV2ZZ0iHzw1
 TaGXi+/QmHjvU8Fx1gyrwBhJP9034zlSp0T5P80rZWQcE9hoLLSWa246yOwn14ml7CmE
 vjkvsjikoJ7clJ/bGKB7/+UoG7LU1losx+1iWPjqxImYwiIctUwn80pBLvNxV2ehw1Ya
 WF8thPNRW8Ea5E+eWB/6etmaHfDLnMCFFVAbEu19arG8U+aA8/tHQVD73k/TJAoEy7s9
 RNGQ==
X-Gm-Message-State: ANoB5pnyVjYfx0pc8f4sE24jpqe2DIYXJDelv9g5SXnUjaEzbzBSrz+o
 SKFwcb70Gi4HCUS1/eJAY6ELt/36Da7tQQZF2AXqR7ADIJDBegtDLkbrMqRNom0T1Z94wmGj/+1
 3lh+YcSdbUh9l/TUw0qssb61Sw4fn4rtAJZVh8uJSWTNPR8g+JfPEJUUulhg3g2+RsMEj
X-Google-Smtp-Source: AA0mqf7hoCLgNipEvantO22dDBmvwc4TpN1xhKvgMujp2YfqbMXms7OSdrhAXAF0B2gJ0dxifdkG8w==
X-Received: by 2002:a17:90a:ff14:b0:219:1927:27bc with SMTP id
 ce20-20020a17090aff1400b00219192727bcmr21221540pjb.229.1669773291379; 
 Tue, 29 Nov 2022 17:54:51 -0800 (PST)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a655b48000000b004768ce9e4fasm9003871pgr.59.2022.11.29.17.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 17:54:51 -0800 (PST)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v3 0/3] Implement the watchdog timer of HiFive 1 rev b.
Date: Tue, 29 Nov 2022 17:54:41 -0800
Message-Id: <20221130015444.1459842-1-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=tommy.wu@sifive.com; helo=mail-pj1-x102a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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

Changes since v2 ( Thank Alistair for the feedback ):
- Delete the declaration and definition of the create function.

Tommy Wu (3):
  hw/misc: sifive_e_aon: Support the watchdog timer of HiFive 1 rev b.
  hw/riscv: sifive_e: Support the watchdog timer of HiFive 1 rev b.
  tests/qtest: sifive-e-aon-watchdog-test.c : Add QTest of watchdog of
    sifive_e

 hw/misc/Kconfig                          |   3 +
 hw/misc/meson.build                      |   1 +
 hw/misc/sifive_e_aon.c                   | 383 +++++++++++++
 hw/riscv/Kconfig                         |   1 +
 hw/riscv/sifive_e.c                      |  13 +-
 include/hw/misc/sifive_e_aon.h           |  60 +++
 include/hw/riscv/sifive_e.h              |   8 +-
 tests/qtest/meson.build                  |   3 +
 tests/qtest/sifive-e-aon-watchdog-test.c | 650 +++++++++++++++++++++++
 9 files changed, 1117 insertions(+), 5 deletions(-)
 create mode 100644 hw/misc/sifive_e_aon.c
 create mode 100644 include/hw/misc/sifive_e_aon.h
 create mode 100644 tests/qtest/sifive-e-aon-watchdog-test.c

-- 
2.27.0


