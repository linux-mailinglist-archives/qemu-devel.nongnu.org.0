Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BAF320AF0
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:37:13 +0100 (CET)
Received: from localhost ([::1]:53376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDprE-0006me-1X
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpoo-0005cf-9R
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:34:42 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpoj-0002Hc-Ab
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:34:39 -0500
Received: by mail-wm1-x32d.google.com with SMTP id i9so1259258wml.5
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zrCkq5bFNONJq95Gtvk4iKjwa25G85BPRBqaMLtYtTg=;
 b=SIBhhXT3+BDvP1oLR4UDNqvLxYdC4dRjdpyQuLQmRxQQngEh5cSLYNliSDOuysWEBS
 +tFGXajoQsB7zTMdK1+dFZYuk2VaAjjQ4MCVvbzna6n22ey80VGVGF3ieFZxpOHqEkQJ
 VJucXRyMDWuUsIPVMpvummcISqPvd36kHEM285cu5ZHpn6zpSjcUe+wRRptKMq/EwFOt
 Zk4fVrTnj2nWFXe53zbLRtaNRUqBcW/Wdc8JiVol5Q0r8lS8djWO2xCQisbmrBfmZXyl
 EEwuvLs7/P6ej7L9Aguibr+dI/0rld3FIPXk05nseryfEwmRd3DvdM8Ud/wc335UJUnu
 Fmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zrCkq5bFNONJq95Gtvk4iKjwa25G85BPRBqaMLtYtTg=;
 b=dacRTBRJfKjegwbNi0qs3WDQQvjfvbeHjLEBFNKb1WjUYa8fziPtliAPG96rQjJEbT
 xexkJF8gTEsJCRTUg+KCwehHR46N49keQUc4/NDrmDbaIUEphWuXfg7i9bj2xUkve42d
 DP1sGu9CKz7llKdgK/iPR8BpWMnUdIOMfhWEnElh47bem0MvtzOdF1PIRqyqDZG3FBFH
 45ZnTr10j6hk6tZwlQ8A/v6IQEnSff6MELpZ6DcxUWpw8V/WZWz8cGuOTKjnB+Z2s43e
 hw5qeRcdpW9M2XXS+vLudMAdFSayVm2oTzm4oY09TyLVh/3oVNcC0/nfaIOIfua8CSZX
 wyxA==
X-Gm-Message-State: AOAM531a973+vptuuEwzxnJmUmWd4eiMup83J3na53ZPBQ1bCNAW8GOm
 HOetVJAyjxhedGL7d1aTgVXpT3uZlFI=
X-Google-Smtp-Source: ABdhPJxanZkxL8h93Dox7D6E8j7MSFhgTIIEegOj9XXIy4z3Im1B1xT+QW0wDcwaVrt8ok24pGl0Qg==
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr16086985wmc.35.1613918075150; 
 Sun, 21 Feb 2021 06:34:35 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b6sm10527374wrq.56.2021.02.21.06.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:34:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/43] MIPS patches for 2021-02-21
Date: Sun, 21 Feb 2021 15:33:49 +0100
Message-Id: <20210221143432.2468220-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
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
for you to fetch changes up to 98e7c7108127bc9f2bf9065cbddd25778025b9c6:=0D
=0D
  vt82c686: Fix superio_cfg_{read,write}() functions (2021-02-21 15:28:52 +=
0100)=0D
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
 include/hw/mips/bootloader.h                |  14 +=0D
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
 21 files changed, 741 insertions(+), 459 deletions(-)=0D
 create mode 100644 include/hw/mips/bootloader.h=0D
 create mode 100644 hw/mips/bootloader.c=0D
 create mode 100644 tests/acceptance/machine_mips_loongson3v.py=0D
=0D
-- =0D
2.26.2=0D
=0D

