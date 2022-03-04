Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EF64CCC40
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 04:24:06 +0100 (CET)
Received: from localhost ([::1]:54802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPyY0-00052e-Qf
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 22:24:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPyUa-0002dj-FG
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 22:20:32 -0500
Received: from [2607:f8b0:4864:20::22b] (port=44970
 helo=mail-oi1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPyUY-0001wj-81
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 22:20:31 -0500
Received: by mail-oi1-x22b.google.com with SMTP id j24so6674193oii.11
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 19:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e/27IOWraZjV9GMKoYulTmDrLr1cU7t1LiwpTba4cwE=;
 b=aBfHHjW8EdB3tdZnlllyFbaZ+bMGAcMyrxZxy6aB+GZ89o5e3SOa7cjAphWv59gw7t
 NbBO9z3qMUztLYri9dO0JwzfJLM/Yd3XAq0pllTgMPgxjbVBcV0SZiU3tVAPfcPkpgw3
 xXHSX0+vhqVUCpRDj1Gvx/2smVSmocfe44mHJ786E9RmHEzLuJP5Dj2f9Vrd185gkkk6
 +aXkuisLKm+vxUDsfWTXYZjOLXyKDIJEXEdrhHE5WvpX6uBD+Xub8Q/p5VFsCMdsLZOK
 4H2fV1hh/s3eAtXqXjBZAcsR1ocZD4Xa05lMmS0DL3qNjx18G/iOutnNBy3cwdc9tWVy
 IYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e/27IOWraZjV9GMKoYulTmDrLr1cU7t1LiwpTba4cwE=;
 b=fIjpY4FegfY+b3Ye0rAfnoWJVb+9jr3txeboXZxRK5GO5SW1DDhfgdZwsAXvUOMrsx
 cjs71jMT7UWLzf1ca6RRZQrgngrsY6op0MNxDZIdNUPEVH6kXPyH0pYJD3X628CxBO/S
 1JCOXmhLWLk/TE+rctYohTJ244jKwEzjXEeuq+zlwvSESog9zjaPFTqjTfCkv3GdyBhd
 lhEctrgl9cclqTtEX/PmOb/vGSdj3IaiLI8240beBccoO3jW7mSaTytIMKQgjtQtIUyO
 TcmXKsunSQASr/gbqMjl8RgG9rVlpr2Mv/m5JPzvGtgahwbI4+InUKL6JUVyRJW5eGp1
 uY+g==
X-Gm-Message-State: AOAM530jHkBoN1yBNbzI+rKHh0JNSpfNyAMqVEtInUDIm8qlWXBdds57
 V9o9rS3nzLpZEXysMFVyofU0oxBxM9oZPA==
X-Google-Smtp-Source: ABdhPJwMVl2AyiU2jhPluK3Am89ij7syGUTHI2bU0d4SdrxWuN4pf0Frvq6Z86d++P5a9Cy8T257qg==
X-Received: by 2002:a05:6808:1183:b0:2d4:5eeb:1ca3 with SMTP id
 j3-20020a056808118300b002d45eeb1ca3mr7474840oil.8.1646364028645; 
 Thu, 03 Mar 2022 19:20:28 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 u12-20020a056808114c00b002d72b6e5676sm2284052oiu.29.2022.03.03.19.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 19:20:27 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH  0/3] Implement Sstc extension 
Date: Thu,  3 Mar 2022 19:20:20 -0800
Message-Id: <20220304032023.730344-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series implements Sstc extension[1] which was ratified recently.

The first patch is a prepartory patches while PATCH 2 adds stimecmp
support while PATCH 3 adds vstimecmp support. This series is based on
the ISA extension[2] & privilege version update series[3].

The series can also be found at
https://github.com/atishp04/qemu/tree/sstc_v1

It is tested on RV32 & RV64 with additional OpenSBI[4] & Linux kernel[5]
patches.

[1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
[2] https://lore.kernel.org/all/20220222220704.2294924-1-atishp@rivosinc.com/
[3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg870659.html
[4] https://github.com/atishp04/opensbi/tree/sstc_v1
[5] https://github.com/atishp04/linux/tree/sstc_v2

Atish Patra (3):
target/riscv: Rename timer & timecmp to mtimer and mtimecmp
target/riscv: Add stimecmp support
target/riscv: Add vstimecmp support

hw/intc/riscv_aclint.c     |  20 ++--
hw/timer/ibex_timer.c      |  14 +--
target/riscv/cpu.c         |   7 ++
target/riscv/cpu.h         |  12 ++-
target/riscv/cpu_bits.h    |   8 ++
target/riscv/cpu_helper.c  |  11 ++-
target/riscv/csr.c         | 183 +++++++++++++++++++++++++++++++++++++
target/riscv/machine.c     |   4 +-
target/riscv/meson.build   |   3 +-
target/riscv/time_helper.c | 113 +++++++++++++++++++++++
target/riscv/time_helper.h |  30 ++++++
11 files changed, 381 insertions(+), 24 deletions(-)
create mode 100644 target/riscv/time_helper.c
create mode 100644 target/riscv/time_helper.h

--
2.30.2


