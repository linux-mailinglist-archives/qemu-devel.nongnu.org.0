Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE6422C1C1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 11:09:28 +0200 (CEST)
Received: from localhost ([::1]:52814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jythn-0003zK-8M
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 05:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jytgo-0002y4-CU
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 05:08:26 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:32797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jytgm-0003qI-Ny
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 05:08:26 -0400
Received: by mail-pg1-x543.google.com with SMTP id o13so4909557pgf.0
 for <qemu-devel@nongnu.org>; Fri, 24 Jul 2020 02:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0T7C8gSWgr1wtDkt6o+vQNAP8br3EtqgTWVItkOaUQ=;
 b=HTw2x7jz4ZGphx+bpb0N7WfxMnLjPBZNWbfbid/EOQZa/dTLkLo6SjNnAB8TUR/G0f
 yY7uAPtMGnuNiN2LQQBxX2fiZSAMUbEYvJXfgAhdJPGMkz/sLzbupuXfS/VRPH34/q+L
 uM0JFmZl5RiLPu1pqa2gazy5HKyAaVgDircLERJ5i98umAwWm800g2/beQFqL5N83snj
 7Q47zjCMaz+3LsAB9zhMPS4cW03zP8QqyB4fYOJLDKnWIrcppS/SbvGB68L3psS5yKe+
 5vtNpiuNYk7KlWYEfH0hBt7C+OKy+xsw7opC3pDQRCDoNrpnXv84OuNaPbCM0ESYw9Z4
 bzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0T7C8gSWgr1wtDkt6o+vQNAP8br3EtqgTWVItkOaUQ=;
 b=qtsenU/BT076JKLsPXN7WGalsSNACchQjSVgmV9OYmEkJfoXNoG1KssLQ3CPxJz58W
 /2jmPors5YP6NAHonGNV337tYXzQMLXBAzr8unDdDp8XkpXfsaEXfAf7hN/Vmh8IuMXg
 4wVc+6boawiNRhh2FOMwF9k3b3OGyqXE28zlByDH1IewzPgfVFO8JVYCb31TW2OIuUgI
 naWG6yBYgZUlc2EpbBKrTaFCtCmreZqFULKwUrACAOrRjHZANzRehMhYtTTQ/WxSB2yT
 gHSRVbW0QyPAY2dSffgsT1IAQaSKl5vXzh/bS/tx67n32UsN8015xr+CkyvRza0Ia7BD
 iO+w==
X-Gm-Message-State: AOAM532vghe0xBaRXG8O1VhupOvTvmrFCKfW/A1zk1SpWYXaPnbfSv+6
 IPfTVV+6qEx6hWp895n6j3zn1A==
X-Google-Smtp-Source: ABdhPJwvx0Wuy6U3ztF2SJjlde2nytuNtHVZaRW94EqxPYFRtr/nQqUyVWGib8FeHvbWmjY6m2CWrQ==
X-Received: by 2002:a65:4b85:: with SMTP id t5mr7748098pgq.36.1595581702067;
 Fri, 24 Jul 2020 02:08:22 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id z10sm5751282pfr.90.2020.07.24.02.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 02:08:21 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 0/4] Fix some PMP implementations
Date: Fri, 24 Jul 2020 17:08:13 +0800
Message-Id: <cover.1595581140.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=zong.li@sifive.com; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set contains the fixes for wrong index of pmpcfg CSR on rv64,
and the pmp range in CSR function table. After 3rd version of this patch
series, we also fix the PMP issues such as wrong physical address
translation and ignoring PMP checking.

Chagned in v4:
 - Refine the implementation. Suggested by Bin Meng.
 - Add fix for PMP checking was ignored.

Changed in v3:
 - Refine the implementation. Suggested by Bin Meng.
 - Add fix for wrong pphysical address translation.

Changed in v2:
 - Move out the shifting operation from loop. Suggested by Bin Meng.

Zong Li (4):
  target/riscv: Fix the range of pmpcfg of CSR funcion table
  target/riscv/pmp.c: Fix the index offset on RV64
  target/riscv: Fix the translation of physical address
  target/riscv: Change the TLB page size depends on PMP entries.

 target/riscv/cpu_helper.c | 13 +++++++--
 target/riscv/csr.c        |  2 +-
 target/riscv/pmp.c        | 60 +++++++++++++++++++++++++++++++++++++++
 target/riscv/pmp.h        |  2 ++
 4 files changed, 73 insertions(+), 4 deletions(-)

-- 
2.27.0


