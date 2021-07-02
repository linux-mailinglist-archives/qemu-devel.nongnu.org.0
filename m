Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193DE3BA14D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:37:58 +0200 (CEST)
Received: from localhost ([::1]:34700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJMi-0003BU-VA
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJKt-00017P-Ha
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:36:03 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJKr-0003qA-EU
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:36:03 -0400
Received: by mail-wm1-x335.google.com with SMTP id r3so6711865wmq.1
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nqTQ52ZmZ//kPwUeoTiOYuhqx7UMRYqKpuzn5AUik1A=;
 b=KB+lz88xkPkYKkluYzkddGhm9lJIcGy5tc8FQOmZADV95T3RQ/Us9GVJYTRDOKQtyU
 xGWpuU98VYJvy83ZTyWc8RbtlHuzT8ndePyd/GBiUDnzG9X5Pv2dBE0LNR4QDd1zryCd
 q22l2n56hd2KVNvvuQTs908IIjh9uhJbGHwM14tQtQBn/WiJkBB5CWJpLVj1puTNErOp
 4fjLus46v1dC4D5NHruBcQ9ZTbKistYT4afxF43ZYaDkOgsoyPbyRUzN8Lo7hJSvgXt3
 O5s+GQNLU11bet9qomAMm00byaSPIi/PS9wnU7ETFgSFfCNKE4XCQaUh2J4u3i21+Fl/
 64ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=nqTQ52ZmZ//kPwUeoTiOYuhqx7UMRYqKpuzn5AUik1A=;
 b=sGIiq8vIIhaDSSSUZCaBbbTlKH+SINZaO+h+QuGHA3s1wAmIh8Lm9eL5NPtuF/3KuF
 urjkBTkbdSuO6npd0MHRwyMY59AINi+jeHNmGZuxeinudeGwogwW9Ak6lvDkTsjk5kNG
 8vxkdRMBXL+Lwa7e9sz1sr+5bSJXgETHCxzM4hotYMy4VoUdL3yDiNOY2AaXIhIKj9PM
 atvuan+PF6UFGpFiBt1RWFe/mGo6Gflm1fDOB/T8xP3O/xbgLESQAIVoyPppu0vOpJEH
 JDLogPFc0iDzX9kG6HOl5RT3AE6ThvYdm6Pad0BtFvYoI8P8TdI/H8/nZEqMzLS4TrUZ
 LxqA==
X-Gm-Message-State: AOAM533WdMkMe89/7exIRc0ZanWBcMUvRFApmFxCoRzjA3WaH8kEzmMu
 QvMj95EGzkQ9uEwuhahffmHeg2ayib5LLPXT
X-Google-Smtp-Source: ABdhPJz8/BpwWz0hajVlMfJ7Erwottc/REz8s54x0nnLGGjpGSSBFtLRgB+zAo/Jp+Qlc2Ros7iSTw==
X-Received: by 2002:a1c:4e1a:: with SMTP id g26mr5578812wmh.62.1625232959561; 
 Fri, 02 Jul 2021 06:35:59 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id i2sm2961289wmq.42.2021.07.02.06.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:35:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/18] MIPS patches for 2021-07-02
Date: Fri,  2 Jul 2021 15:35:39 +0200
Message-Id: <20210702133557.60317-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 67e25eed977cb60e723b918207f0a3469baceef4=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210629' =
into staging (2021-07-01 20:29:33 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/mips-20210702=0D
=0D
for you to fetch changes up to db0725d54983be3b8d5729dd5692db71da4cc05b:=0D
=0D
  hw/mips/jazz: Map the UART devices unconditionally (2021-07-02 10:41:16 +=
0200)=0D
=0D
----------------------------------------------------------------=0D
MIPS patches queue=0D
=0D
- Extract nanoMIPS, microMIPS, Code Compaction from translate.c=0D
- Allow PCI config accesses smaller than 32-bit on Bonito64 device=0D
- Fix migration of g364fb device on Jazz Magnum=0D
- Fix dp8393x PROM checksum on Jazz Magnum and Quadra 800=0D
- Map the UART devices unconditionally on Jazz Magnum=0D
- Add functional test booting Linux on the Fuloong 2E=0D
=0D
----------------------------------------------------------------=0D
=0D
Mark Cave-Ayland (10):=0D
  g364fb: use RAM memory region for framebuffer=0D
  g364fb: add VMStateDescription for G364SysBusState=0D
  dp8393x: checkpatch fixes=0D
  dp8393x: convert to trace-events=0D
  hw/mips/jazz: move PROM and checksum calculation from dp8393x device=0D
    to board=0D
  hw/m68k/q800: move PROM and checksum calculation from dp8393x device=0D
    to board=0D
  dp8393x: remove onboard PROM containing MAC address and checksum=0D
  qemu/bitops.h: add bitrev8 implementation=0D
  hw/m68k/q800: fix PROM checksum and MAC address storage=0D
  hw/mips/jazz: specify correct endian for dp8393x device=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  target/mips: Add declarations for generic TCG helpers=0D
  target/mips: Extract Code Compaction ASE translation routines=0D
  target/mips: Extract the microMIPS ISA translation routines=0D
  target/mips: Extract nanoMIPS ISA translation routines=0D
  hw/pci-host/bonito: Trace PCI config accesses smaller than 32-bit=0D
  hw/pci-host/bonito: Allow PCI config accesses smaller than 32-bit=0D
  tests/acceptance: Test Linux on the Fuloong 2E machine=0D
  hw/mips/jazz: Map the UART devices unconditionally=0D
=0D
 include/qemu/bitops.h                      |   22 +=0D
 target/mips/tcg/translate.h                |    5 +=0D
 hw/display/g364fb.c                        |   32 +-=0D
 hw/m68k/q800.c                             |   21 +-=0D
 hw/mips/jazz.c                             |   48 +-=0D
 hw/net/dp8393x.c                           |  302 +-=0D
 hw/pci-host/bonito.c                       |   12 +-=0D
 target/mips/tcg/translate.c                | 9277 +-------------------=0D
 target/mips/tcg/micromips_translate.c.inc  | 3231 +++++++=0D
 target/mips/tcg/mips16e_translate.c.inc    | 1123 +++=0D
 target/mips/tcg/nanomips_translate.c.inc   | 4922 +++++++++++=0D
 MAINTAINERS                                |    2 +=0D
 hw/net/trace-events                        |   17 +=0D
 hw/pci-host/trace-events                   |    3 +=0D
 tests/acceptance/machine_mips_fuloong2e.py |   42 +=0D
 15 files changed, 9603 insertions(+), 9456 deletions(-)=0D
 create mode 100644 target/mips/tcg/micromips_translate.c.inc=0D
 create mode 100644 target/mips/tcg/mips16e_translate.c.inc=0D
 create mode 100644 target/mips/tcg/nanomips_translate.c.inc=0D
 create mode 100644 tests/acceptance/machine_mips_fuloong2e.py=0D
=0D
-- =0D
2.31.1=0D
=0D

