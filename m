Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F10258ADE3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 18:07:10 +0200 (CEST)
Received: from localhost ([::1]:49730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJzqv-0007wV-Ob
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 12:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oJzeT-0007PI-Tg
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:54:18 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oJzeS-0004mw-3W
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:54:17 -0400
Received: by mail-wr1-x430.google.com with SMTP id l4so3668902wrm.13
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 08:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=i/2Te5aPkzaGgF6Yd5Elo1dMRE7ml/rzKBW+IcYIQIQ=;
 b=VrlJVqeBIviU6PDcuhASVU+PYr58lUA7zKvCXG4hq0NjWrBEuNKkixiE7cmHwuF6Gs
 iDg5tSHKkKaqj3gpe1kFfxPlKTf1FBNUK+SVnL/U1ObCsQ9cNOGU40liD3ih3HYhfWIW
 K2o2Q7gsA2Sq3L5/XJUpUhfkZITJN5B++Fbaod7CqVCDdR4agQtnow1IVbbBEiIGCYZr
 HDtka7hvt9hPNgKm3IiemK6f/4vnDxVrs8JS9uaWgrhPHrlIbR7VOYulLOIKoIH0ffcN
 62NuT50CcEb2IdBr6Yfe0FX4ZrNTIthyKqXyvYU9WZ90d0mReaLCgz0pWDGN4FubbKaX
 Qa6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=i/2Te5aPkzaGgF6Yd5Elo1dMRE7ml/rzKBW+IcYIQIQ=;
 b=bDDF+/UiscAG6BmxerZBj5Acd2TT3/0BiJVOB145MVWrABWkeSvKxyPoIYou9YFrZj
 VOX1uO8DpOOhCHKeLjmyOM0YPe2ql7XjU18yFCWwojPPj/13eWYxxxU/i8xyAIF9JTfA
 Rik3dcRZSdgetJmKQjcFRuKoPr45hInWWuTlJUtPQRlgmAgfOlad0OmL3cC6vQz8Bpph
 pQFuIQEw0qzTWXObmxmBT4tlR9iJI3g5EWxZtm4R7saKhfylk+CAytpdv59tIthTzjru
 D+kuDUPapEnQrRflIJTvo5BHNkAAPlIP78a50Je+Sb2RqjqRLly6p3c0pRrPO79Pj02M
 VfeA==
X-Gm-Message-State: ACgBeo1s7QncmNCCGneXwAo12620GtRX5k/V3KUoCgDlL5BbKeGJFeAa
 Z27xAy1Tbgs37TmH4RRE31yB5w==
X-Google-Smtp-Source: AA6agR4ir/WJ2OZJuENnbVRZfcwfwGcqTB5otlRWWDzRBQGL7k/gziveqr6hVWSoTgd1c4r4WJQk8Q==
X-Received: by 2002:adf:d1c2:0:b0:220:762f:fc64 with SMTP id
 b2-20020adfd1c2000000b00220762ffc64mr4864194wrd.253.1659714853733; 
 Fri, 05 Aug 2022 08:54:13 -0700 (PDT)
Received: from henark71.. ([93.107.66.220]) by smtp.gmail.com with ESMTPSA id
 t10-20020a5d49ca000000b0021d6dad334bsm4133543wrs.4.2022.08.05.08.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 08:54:13 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 0/5] QEMU: Fix RISC-V virt & spike machines' dtbs
Date: Fri,  5 Aug 2022 16:54:00 +0100
Message-Id: <20220805155405.1504081-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 05 Aug 2022 12:00:37 -0400
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

From: Conor Dooley <conor.dooley@microchip.com>

The device trees produced automatically for the virt and spike machines
fail dt-validate on several grounds. Some of these need to be fixed in
the linux kernel's dt-bindings, but others are caused by bugs in QEMU.
Patch one of this series is lifted from an earlier submission by Palmer
that seems to have got lost by the wayside somewhere along the way,
hence the rather out of date email used for Palmer [0].

I mostly opted for what appeared to be the smallest change that would
fix the warnings, partly due to my inexperience with the QEMU codebase.
A "sister" patchset for the kernel will clear the remaining warnings.

Thanks to Rob for reporting these issues [1],
Conor.

To reproduce the errors:
./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
(The processed schema needs to be generated first)

0 - https://lore.kernel.org/qemu-devel/20190813225307.5792-1-palmer@sifive.com/
1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/

Conor Dooley (4):
  hw/riscv: virt: fix uart node name
  hw/riscv: virt: Fix the plic's address cells
  hw/riscv: virt: fix syscon subnode paths
  hw/core: fix platform bus node name

Palmer Dabbelt (1):
  target/riscv: Ignore the S and U letters when formatting ISA strings

 hw/core/sysbus-fdt.c    |  2 +-
 hw/riscv/virt.c         | 10 +++++++---
 include/hw/riscv/virt.h |  1 +
 target/riscv/cpu.c      | 18 +++++++++++++++++-
 4 files changed, 26 insertions(+), 5 deletions(-)


base-commit: 2480f3bbd03814b0651a1f74959f5c6631ee5819
-- 
2.37.1


