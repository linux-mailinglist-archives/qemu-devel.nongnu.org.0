Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010F65206AF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 23:32:26 +0200 (CEST)
Received: from localhost ([::1]:60832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noAzQ-0002tj-Pe
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 17:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1noAvk-0000XU-NB
 for qemu-devel@nongnu.org; Mon, 09 May 2022 17:28:37 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:35480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1noAvi-00018W-Mf
 for qemu-devel@nongnu.org; Mon, 09 May 2022 17:28:36 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 j10-20020a17090a94ca00b001dd2131159aso472586pjw.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 14:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rJEvylGX6XFsP6JM89wy/96G5JB+filiHmzriU7ed8Y=;
 b=zwrOiXwOffmx/W++WX6vbg2dvUqyl9y4sQiGLyuN8RZu9zC8mH4CLPch7hUXVz6EWE
 y7NOMnjBFb8JU3OVf50scQ41OgWnEb4Vzvg9qA32fuxsyoG4DstqIZY0t5qGOYRrJPrL
 Nr4/AWhFdNNQlCttH5oKK8QE3clym9294z5yXqcOccLDCirV2x/KyVhXAinZZqf9yRFM
 rWwcZi0nyDN78TkO0H1trvB8hIhfhGrru8lE+afaGr7+GzWXF4pnVVweI1JbC75aRJN6
 oXtXk+FdJ0uynY+Q8kFa7iJoB75KXf+0j9AUF84Vu8oXZWv7GNHDgXWBXfKQ4h8jtfb7
 RBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rJEvylGX6XFsP6JM89wy/96G5JB+filiHmzriU7ed8Y=;
 b=Xrmju5OyKIDY/edMAXKq0MyGl0pG31sWJbBhfbp5i+unssyRCpitNPvGsuND2QrNg8
 zemHGullnfc4eGFDeN5C3HO9MuIyuGbRJsYG3K2LoICnIbPPce531k33U7MmbJ/4OwpU
 k06l6RYrAaEugd0NZq3U/IYmthK0qII0SHgbRKbiEYV7Q5EZehs8iw1GLcZr7Fa+H/wH
 ulqPFZkpvwqaToJ52fWpk5fFdrVkmwhu95HOuuqv01UgrBAfm4Vf2AoB5jPU0EGbAToE
 tlKZnSnsDI1OWGP+4ueYgbxhNPb1IhzcwSvbxNnWhnFt3QY1dBIXnO4H3alJWi45O88A
 DN+A==
X-Gm-Message-State: AOAM5307B5rQBqTOK9x78mFjL3+363/tApLl31omkmLOnYhaOUnm0KkW
 OovnzwED9Qoa5DuEJmcmtpx0NrpzAb+WAQ==
X-Google-Smtp-Source: ABdhPJwB1TJfOqkKL/E9r/Ci9qZ/FwfUTGHY+ANVi2OLOro+089DsvlLxjaIPRZWcu3cY6SK4RukOw==
X-Received: by 2002:a17:902:9a42:b0:158:bf91:ecec with SMTP id
 x2-20020a1709029a4200b00158bf91ececmr17969506plv.115.1652131712517; 
 Mon, 09 May 2022 14:28:32 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 n89-20020a17090a5ae200b001cd4989fecfsm164509pji.27.2022.05.09.14.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 14:28:31 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v3  0/3] Implement Sstc extension 
Date: Mon,  9 May 2022 14:28:24 -0700
Message-Id: <20220509212827.2057822-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This series implements Sstc extension[1] which was ratified recently.

The first patch is a prepartory patches while PATCH 2 adds stimecmp
support while PATCH 3 adds vstimecmp support. This series is based on
on top of upstream commit (faee5441a038).

The series can also be found at
https://github.com/atishp04/qemu/tree/sstc_v3

It is tested on RV32 & RV64 with latest OpenSBI & Linux kernel[2]
patches. It does require the mcountinhibi support patch from PMU series[3]
or dummy one from Anup's series [4]. Otherwise, OpenSBI doesn't detect v1.12
priv version.

Changes from v2->v3:
1. Dropped generic migration code improvement patches.
2. Removed the order constraints while updating stimecmp/vstimecmp.

Changes from v1->v2:
1. Rebased on the latest upstream commit.
2. Replaced PATCH 1 with another patch where mtimer/timecmp is
   moved from CPU to ACLINT.
3. Added ACLINT migration support.

[1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
[2] https://github.com/atishp04/linux/tree/sstc_v3
[3] https://github.com/atishp04/qemu/tree/riscv_pmu_v7
[4] https://www.mail-archive.com/qemu-devel@nongnu.org/msg885157.html

Atish Patra (3):
hw/intc: Move mtimer/mtimecmp to aclint
target/riscv: Add stimecmp support
target/riscv: Add vstimecmp support

hw/intc/riscv_aclint.c         |  41 +++++--
hw/timer/ibex_timer.c          |  18 ++-
include/hw/intc/riscv_aclint.h |   2 +
include/hw/timer/ibex_timer.h  |   2 +
target/riscv/cpu.c             |   8 ++
target/riscv/cpu.h             |  14 ++-
target/riscv/cpu_bits.h        |   8 ++
target/riscv/cpu_helper.c      |  11 +-
target/riscv/csr.c             | 200 +++++++++++++++++++++++++++++++++
target/riscv/machine.c         |   7 +-
target/riscv/meson.build       |   3 +-
target/riscv/time_helper.c     | 114 +++++++++++++++++++
target/riscv/time_helper.h     |  30 +++++
13 files changed, 426 insertions(+), 32 deletions(-)
create mode 100644 target/riscv/time_helper.c
create mode 100644 target/riscv/time_helper.h

--
2.25.1


