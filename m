Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DC1320D3A
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 20:44:09 +0100 (CET)
Received: from localhost ([::1]:33720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDueG-00045H-TG
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 14:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDucb-0002mz-Q2
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 14:42:27 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDucZ-0006rO-WE
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 14:42:25 -0500
Received: by mail-wr1-x429.google.com with SMTP id u14so16900806wri.3
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 11:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PyQMOMNhhxXlbAGygC8fclmlT+1xFyR1Yi/RxjHfm2I=;
 b=T4zfUnAv04o6N6ZN5mqigXzqhnZWg4LqBSj0AwendtT90bjOFCbyj8PXrKOHeSmvnu
 npU4Y+7gOHF/adILPmGWTeLXssPi9GpMRyoBZxVBvyriyOWkXNpu7kKhvuxk8lv1foLG
 o0uQWuP6lsQOa665oB50FPYnzm+P/yAdCUFoxDmx9w12u9xyT6UgoL9fK2nL9rFYNF9H
 tf4d/9Br9Pf/ZgAjm9YOQzJuuTy/PjZG0dLIigYLjz2kRwEJ9hNWYOc3hgMnlbzgMf82
 VXt/hoRddfcSm6mGiZdPS3Aun8xc76h5qXRvpMSn26Uh8vpN+OOPXIfu5x8QlXp4AbbV
 OgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PyQMOMNhhxXlbAGygC8fclmlT+1xFyR1Yi/RxjHfm2I=;
 b=OlrsjebxUQV9U3VKqS3H5btYjsjraDMOqPPwKjC5B/9og+HCLq30U8wxQ3mAG2hWMb
 GxfCYVWbQHXSkQJut945MbtphcwuAJIEceqsD7V2Bhxtf1I5P3aHt+fMO5YGn/1z81yD
 3xmMnkF9IkcFLljQX3gN1PEQAO/rVrMfThY1iNjfzk0kU9a8K6CpUxwdQJA4H2F4ugU/
 DT8J4D07pH+lDdDW7SBkqLmiEWY9/I+JvsGpdraVvDld5KlaWawviWQ8PCK/FWD8t0y8
 tR87a1MqafweiQLC92TwDqcKKyOK2sPJyazsBvRmj/g8i9yS3Gx3/KNPfYsohKBd/m86
 JUZA==
X-Gm-Message-State: AOAM533s8A20aoe4g0+CIOuQiB08dWdbvNIa1tGIS9/TDUFCCAOW6W+T
 ANuPd49DpO4WUKLki1+W5qg9yKE0IW8=
X-Google-Smtp-Source: ABdhPJzUDbHigdeeRHQ+HyLALmlMbwRrDU6W7iQC1o+kpRsiokgBVAntrmseVb+hNir2vW+PVE1M7A==
X-Received: by 2002:adf:dd42:: with SMTP id u2mr18512916wrm.309.1613936542336; 
 Sun, 21 Feb 2021 11:42:22 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i8sm30293864wry.90.2021.02.21.11.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 11:42:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/43] MIPS patches for 2021-02-21
Date: Sun, 21 Feb 2021 20:38:49 +0100
Message-Id: <20210221193851.2528045-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a528b8c4c638d60cc474c2f80952ff0f2e60521a=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/sdmmc-20210220' =
into staging (2021-02-20 19:28:27 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/philmd/qemu.git tags/mips-20210221=0D
=0D
for you to fetch changes up to cc2b4550115baf77d556341f17eb464d18953cee:=0D
=0D
  vt82c686: Fix superio_cfg_{read,write}() functions (2021-02-21 19:42:34 +=
0100)=0D
=0D
Since v1: Add missing license in include/hw/mips/bootloader.h.=0D
=0D
----------------------------------------------------------------=0D
MIPS patches queue=0D
=0D
- Drop redundant struct MemmapEntry (Bin)=0D
- Fix for Coverity CID 1438965 and 1438967 (Jiaxun)=0D
- Add MIPS bootloader API (Jiaxun)=0D
- Use MIPS bootloader API on fuloong2e and boston machines (Jiaxun)=0D
- Add PMON test for Loongson-3A1000 CPU (Jiaxun)=0D
- Convert to translator API (Philippe)=0D
- MMU cleanups (Philippe)=0D
- Promote 128-bit multimedia registers as global ones (Philippe)=0D
- Various cleanups/fixes on the VT82C686B southbridge (Zoltan)=0D
----------------------------------------------------------------=0D
=0D
BALATON Zoltan (16):=0D
  vt82c686: Move superio memory region to SuperIOConfig struct=0D
  vt82c686: Reorganise code=0D
  vt82c686: Fix SMBus IO base and configuration registers=0D
  vt82c686: Make vt82c686-pm an I/O tracing region=0D
  vt82c686: Correct vt82c686-pm I/O size=0D
  vt82c686: Correctly reset all registers to default values on reset=0D
  vt82c686: Fix up power management io base and config=0D
  vt82c686: Set user_creatable=3Dfalse for VT82C686B_PM=0D
  vt82c686: Make vt82c686b-pm an abstract base class and add vt8231-pm=0D
    based on it=0D
  vt82c686: Simplify vt82c686b_realize()=0D
  vt82c686: Move creation of ISA devices to the ISA bridge=0D
  vt82c686: Remove index field of SuperIOConfig=0D
  vt82c686: Reduce indentation by returning early=0D
  vt82c686: Simplify by returning earlier=0D
  vt82c686: Log superio_cfg unimplemented accesses=0D
  vt82c686: Fix superio_cfg_{read,write}() functions=0D
=0D
Bin Meng (1):=0D
  hw/mips: loongson3: Drop 'struct MemmapEntry'=0D
=0D
Jiaxun Yang (6):=0D
  hw/mips: Add a bootloader helper=0D
  hw/mips/fuloong2e: Use bl_gen_kernel_jump to generate bootloaders=0D
  hw/mips/boston: Use bl_gen_kernel_jump to generate bootloaders=0D
  hw/mips/boston: Use bootloader helper to set GCRs=0D
  hw/intc/loongson_liointc: Fix per core ISR handling=0D
  tests/acceptance: Test PMON with Loongson-3A1000 CPU=0D
=0D
Philippe Mathieu-Daud=C3=A9 (20):=0D
  target/mips: fetch code with translator_ld=0D
  target/mips: Remove access_type argument from map_address() handler=0D
  target/mips: Remove access_type argument from get_seg_physical_address=0D
  target/mips: Remove access_type arg from get_segctl_physical_address()=0D
  target/mips: Remove access_type argument from get_physical_address()=0D
  target/mips: Remove unused MMU definitions=0D
  target/mips: Replace magic value by MMU_DATA_LOAD definition=0D
  target/mips: Let do_translate_address() take MMUAccessType argument=0D
  target/mips: Let cpu_mips_translate_address() take MMUAccessType arg=0D
  target/mips: Let raise_mmu_exception() take MMUAccessType argument=0D
  target/mips: Let get_physical_address() take MMUAccessType argument=0D
  target/mips: Let get_seg*_physical_address() take MMUAccessType arg=0D
  target/mips: Let CPUMIPSTLBContext::map_address() take MMUAccessType=0D
  target/mips: Remove unused 'rw' argument from page_table_walk_refill()=0D
  target/mips: Include missing "tcg/tcg.h" header=0D
  target/mips: Make cpu_HI/LO registers public=0D
  target/mips: Promote 128-bit multimedia registers as global ones=0D
  target/mips: Rename 128-bit upper halve GPR registers=0D
  target/mips: Introduce gen_load_gpr_hi() / gen_store_gpr_hi() helpers=0D
  target/mips: Use GPR move functions in gen_HILO1_tx79()=0D
=0D
 hw/mips/loongson3_bootp.h                   |   7 +-=0D
 include/hw/isa/vt82c686.h                   |   1 +=0D
 include/hw/mips/bootloader.h                |  22 +=0D
 include/hw/pci/pci_ids.h                    |   3 +-=0D
 target/mips/cpu.h                           |  26 +-=0D
 target/mips/internal.h                      |  10 +-=0D
 target/mips/translate.h                     |   8 +=0D
 hw/intc/loongson_liointc.c                  |  16 +-=0D
 hw/isa/vt82c686.c                           | 542 ++++++++++++--------=0D
 hw/mips/bootloader.c                        | 200 ++++++++=0D
 hw/mips/boston.c                            |  62 +--=0D
 hw/mips/fuloong2e.c                         |  60 +--=0D
 hw/mips/loongson3_virt.c                    |   6 +-=0D
 target/mips/msa_helper.c                    |   1 +=0D
 target/mips/op_helper.c                     |   9 +-=0D
 target/mips/tlb_helper.c                    |  80 ++-=0D
 target/mips/translate.c                     | 111 ++--=0D
 MAINTAINERS                                 |   1 +=0D
 hw/isa/trace-events                         |   2 +=0D
 hw/mips/meson.build                         |   2 +-=0D
 tests/acceptance/machine_mips_loongson3v.py |  39 ++=0D
 21 files changed, 749 insertions(+), 459 deletions(-)=0D
 create mode 100644 include/hw/mips/bootloader.h=0D
 create mode 100644 hw/mips/bootloader.c=0D
 create mode 100644 tests/acceptance/machine_mips_loongson3v.py=0D
=0D
-- =0D
2.26.2=0D
=0D

