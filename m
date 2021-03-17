Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4471533F4C2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:56:59 +0100 (CET)
Received: from localhost ([::1]:59318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYXa-0003oc-9z
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCK-0004zc-Um
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:00 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:46784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYC8-00073b-JP
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:00 -0400
Received: by mail-oi1-x22d.google.com with SMTP id w125so13614266oib.13
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pdx5IHMNJMWLSyIxuUHsSBhxY133uYKKixRsoH24+bQ=;
 b=Aq7ItKV3O6cCZQR3z0At+LS7mfENuPCiKSbpzce+40DavsEqa5a7B96sCdQ/XRPDQI
 epq9yEKXjr28Hz2n8sAielEaZcW5MOJJLaGOu9JZ5kXN+KkKDeRfqz9S4kaqw/Y5sKIg
 +9ob2pMEJC14rQjkbI3zaHNzY2fNFKVE/HMBmJXqpi0+1Pk5eizVN0v1MULuL5+22fv8
 MFYFa1vSIEDZLAkxSU0pw0EYxJDXL+Dp4pCeyGchnq2bapF1LrNUNdj4nZmNo317n3Ho
 h9zj8MDxf3smjVenAPbcng4Et8BYM3/i3oAEXUmJvaxwA0rPuCn5jaPJgthQZ0xfFzUO
 lDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pdx5IHMNJMWLSyIxuUHsSBhxY133uYKKixRsoH24+bQ=;
 b=juN3rFe/fir4PuGK11xN2QxQ62EU/oUK+EaLXgxBZt/XOhskFxICi8yOkzSjS8Wplz
 0Wc29Zp+lPxSZohlj2CmqSYt1b/MPDXiuHkgpYQMKJftZfaxBaA2MZpFtSgDoUv8Cq5P
 2e+3KMuT+yT0qPHIMKwEcs/SlkfOF3m0qARSbUb446sRZnAcg9h235EeJVStj/XAJcKy
 j+M1w6gRWJBwrURxXNQamUbXZB/SoVd3k+He3E/fncuka1eyPcL4gV85Gi6JJzeICkEM
 JQk2XSTyNcRRMFz0WRQbQKN+6rJXCQ4PHcp03gmZDCHW4ZpqkPcfsg8Bvkr135tOuOv6
 oRXg==
X-Gm-Message-State: AOAM531oiIY/8hd89t1UGD7ZOYPI87p9/B8BcCKxc4tAT2wypnFhigzG
 /9SfnvYnA/bEat/nKqMV3saOXrIt4kvI9t2a
X-Google-Smtp-Source: ABdhPJzpe5st+caO2tiRkRgGAr7OcvBPeKCxAIktPSTBhzOj0AfjEaGE892BF/Oh+jC/60pCOacQYg==
X-Received: by 2002:a05:6808:1405:: with SMTP id
 w5mr3245940oiv.48.1615995285903; 
 Wed, 17 Mar 2021 08:34:45 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:34:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/38] tcg patch queue for 6.0
Date: Wed, 17 Mar 2021 09:34:06 -0600
Message-Id: <20210317153444.310566-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5d1428d6c43942cfb40a909e4c30a5cbb81bda8f:

  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20210315' into staging (2021-03-17 09:07:28 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210317

for you to fetch changes up to 5e8892db93f3fb6a7221f2d47f3c952a7e489737:

  tcg: Fix prototypes for tcg_out_vec_op and tcg_out_op (2021-03-17 09:04:45 -0600)

----------------------------------------------------------------
TCI argument extraction helpers and disassembler
TCG build fix for gcc 11

----------------------------------------------------------------
Miroslav Rezanina (1):
      tcg: Fix prototypes for tcg_out_vec_op and tcg_out_op

Richard Henderson (37):
      tcg/tci: Remove ifdefs for TCG_TARGET_HAS_ext32[us]_i64
      tcg/tci: Rename tci_read_r to tci_read_rval
      tcg/tci: Split out tci_args_rrs
      tcg/tci: Split out tci_args_rr
      tcg/tci: Split out tci_args_rrr
      tcg/tci: Split out tci_args_rrrc
      tcg/tci: Split out tci_args_l
      tcg/tci: Split out tci_args_rrrrrc
      tcg/tci: Split out tci_args_rrcl and tci_args_rrrrcl
      tcg/tci: Split out tci_args_ri and tci_args_rI
      tcg/tci: Reuse tci_args_l for calls.
      tcg/tci: Reuse tci_args_l for exit_tb
      tcg/tci: Reuse tci_args_l for goto_tb
      tcg/tci: Split out tci_args_rrrrrr
      tcg/tci: Split out tci_args_rrrr
      tcg/tci: Clean up deposit operations
      tcg/tci: Reduce qemu_ld/st TCGMemOpIdx operand to 32-bits
      tcg/tci: Split out tci_args_{rrm,rrrm,rrrrm}
      tcg/tci: Hoist op_size checking into tci_args_*
      tcg/tci: Remove tci_disas
      tcg/tci: Implement the disassembler properly
      tcg/tci: Push opcode emit into each case
      tcg/tci: Split out tcg_out_op_rrs
      tcg/tci: Split out tcg_out_op_l
      tcg/tci: Split out tcg_out_op_p
      tcg/tci: Split out tcg_out_op_rr
      tcg/tci: Split out tcg_out_op_rrr
      tcg/tci: Split out tcg_out_op_rrrc
      tcg/tci: Split out tcg_out_op_rrrrrc
      tcg/tci: Split out tcg_out_op_rrrbb
      tcg/tci: Split out tcg_out_op_rrcl
      tcg/tci: Split out tcg_out_op_rrrrrr
      tcg/tci: Split out tcg_out_op_rrrr
      tcg/tci: Split out tcg_out_op_rrrrcl
      tcg/tci: Split out tcg_out_op_{rrm,rrrm,rrrrm}
      tcg/tci: Split out tcg_out_op_v
      tcg/tci: Split out tcg_out_op_r[iI]

 meson.build                  |    2 +-
 include/tcg/tcg-opc.h        |    2 -
 tcg/tci/tcg-target-con-set.h |    1 -
 tcg/tci/tcg-target.h         |   13 +-
 disas/tci.c                  |   61 ---
 tcg/tcg.c                    |   19 +-
 tcg/tci.c                    | 1109 ++++++++++++++++++++++++++++--------------
 tcg/aarch64/tcg-target.c.inc |    3 +-
 tcg/i386/tcg-target.c.inc    |    6 +-
 tcg/mips/tcg-target.c.inc    |    3 +-
 tcg/ppc/tcg-target.c.inc     |    8 +-
 tcg/riscv/tcg-target.c.inc   |    3 +-
 tcg/s390/tcg-target.c.inc    |    3 +-
 tcg/tci/tcg-target.c.inc     |  486 ++++++++++++------
 14 files changed, 1107 insertions(+), 612 deletions(-)
 delete mode 100644 disas/tci.c

