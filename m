Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0E35BF0C2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:02:01 +0200 (CEST)
Received: from localhost ([::1]:34622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamFb-0006N6-VB
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8G-0001Kd-Iu; Tue, 20 Sep 2022 15:42:12 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:45641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8E-0001od-T3; Tue, 20 Sep 2022 15:42:12 -0400
Received: by mail-oi1-x22d.google.com with SMTP id o64so5062516oib.12;
 Tue, 20 Sep 2022 12:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=w4mKFWkroJ6LYWtvT/lNqueFTXt2D5h/9jpEPTwV4Zo=;
 b=iV/0Upo3xaBls77gBvQANw5n9wt0Mva+v2zDu7mB3/E1SnMWm9VJK/R6ZtjZaL+U91
 Zm8SkbVO8SrYoT4dQsmo43gkj4izzD0l2W+w6w+5OnCcqqnqCV05KtLOOmtI6FuWhnWN
 Q+t4Ado9dNNUDrZMYAujSjdRs9BSHZQZUm/5NiDibe2LMW5yf3I2VTXCkM1xGwwO9WkI
 wHsUTUYMDjz6xjfFfdOSkivF46y0X8CHyY4d/zAY45xcscN/9/46XZHdvYD6esceNv6Q
 EBNNGp1LIQFUbjtYB4gPP+UScO0ELsVCXeAcrUYn5MSFnRvzZUyLkt0UqnqfU4B6nXk0
 s0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=w4mKFWkroJ6LYWtvT/lNqueFTXt2D5h/9jpEPTwV4Zo=;
 b=X2VxlAUQ2HnAx9Gjlx4Lty+gXtz1X/+P3XjNwMA2v7/pNT4xy9wXdzuxFHFBbGtHdc
 nEGgIqep6h+5qKCnmrzpSAfjz+V9U7l6cMrIH0TDQr0DsWHO9jzLoccVy9W9XFgCiTN8
 SSoVMjXAjVbw/lGrqk9Qo0Vi4j9Pdo55nqzobmO4kRkud/x4lTEqN3G7hnn4ronVt7b3
 E5iJOS2CitxzlZ35bMITKYITSnP2NS4WHaZiGtjddL4e+JnXwHSK4kpmbNusHkcRgnHG
 LOHR9tmWoImgEti7bxfv7iFw+Mx4WKdPrcMOa0OZSGJZWLKXW5GdYDXJWYmwRqy2RV5r
 UKng==
X-Gm-Message-State: ACrzQf1+fzJGu63ykczkhxL90iWIB/a1G/MtZjvoSnWZ2Fx/XgUGQYWb
 AyShHsODELXc+vvCGTNXqUOWJOeuLFI=
X-Google-Smtp-Source: AMsMyM60ie807qDNmaivCUV+6vrXohXrjTFp1IIYbD527LbsXNIA+bDTgLDoNoglOvF/JB3rIlLqLg==
X-Received: by 2002:a05:6808:140d:b0:350:d77c:4e6d with SMTP id
 w13-20020a056808140d00b00350d77c4e6dmr1745026oiv.160.1663702928889; 
 Tue, 20 Sep 2022 12:42:08 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:08 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 00/17] ppc queue
Date: Tue, 20 Sep 2022 16:41:45 -0300
Message-Id: <20220920194202.82615-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d29201ff34a135cdfc197f4413c1c5047e4f58bb:

  Merge tag 'pull-hmp-20220915a' of https://gitlab.com/dagrh/qemu into staging (2022-09-17 10:31:11 -0400)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220920

for you to fetch changes up to 6b5cf264ee76d24b357a60b69b0635a533c1f647:

  hw/ppc/spapr: Fix code style problems reported by checkpatch (2022-09-20 12:31:53 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-09-20:

This queue contains a implementation of PowerISA 3.1B hash insns, ppc
TCG insns cleanups and fixes, and miscellaneus fixes in the spapr and
pnv_phb models.

----------------------------------------------------------------
Bernhard Beschow (1):
      hw/ppc/spapr: Fix code style problems reported by checkpatch

Víctor Colombo (14):
      target/ppc: Add HASHKEYR and HASHPKEYR SPRs
      target/ppc: Implement hashst and hashchk
      target/ppc: Implement hashstp and hashchkp
      target/ppc: Move fsqrt to decodetree
      target/ppc: Move fsqrts to decodetree
      target/ppc: Merge fsqrt and fsqrts helpers
      target/ppc: Remove extra space from s128 field in ppc_vsr_t
      target/ppc: Remove unused xer_* macros
      target/ppc: Zero second doubleword in DFP instructions
      target/ppc: Set result to QNaN for DENBCD when VXCVI occurs
      target/ppc: Zero second doubleword for VSX madd instructions
      target/ppc: Set OV32 when OV is set
      target/ppc: Zero second doubleword of VSR registers for FPR insns
      target/ppc: Clear fpstatus flags on helpers missing it

Xuzhou Cheng (2):
      hw/ppc: spapr: Use qemu_vfree() to free spapr->htab
      hw/pci-host: pnv_phb{3, 4}: Fix heap out-of-bound access failure

 hw/pci-host/pnv_phb3.c                     |  1 +
 hw/pci-host/pnv_phb4.c                     |  1 +
 hw/ppc/spapr.c                             |  2 +-
 include/hw/ppc/spapr.h                     |  5 +-
 target/ppc/cpu.h                           |  8 ++-
 target/ppc/cpu_init.c                      | 28 ++++++++++
 target/ppc/dfp_helper.c                    | 31 +++++++++--
 target/ppc/excp_helper.c                   | 83 ++++++++++++++++++++++++++++++
 target/ppc/fpu_helper.c                    | 74 ++++++++++++++------------
 target/ppc/helper.h                        |  8 ++-
 target/ppc/insn32.decode                   | 18 +++++++
 target/ppc/int_helper.c                    |  4 +-
 target/ppc/translate.c                     | 13 +++++
 target/ppc/translate/fixedpoint-impl.c.inc | 34 ++++++++++++
 target/ppc/translate/fp-impl.c.inc         | 50 ++++++------------
 target/ppc/translate/fp-ops.c.inc          |  2 -
 16 files changed, 278 insertions(+), 84 deletions(-)

