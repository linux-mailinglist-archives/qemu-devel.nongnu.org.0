Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9115AE4E0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:58:20 +0200 (CEST)
Received: from localhost ([::1]:60100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVLX-0004zY-Mz
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVUTX-0001V4-UK
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:02:31 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:35446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVUTV-00017y-Si
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:02:31 -0400
Received: by mail-pf1-x435.google.com with SMTP id 123so1306699pfy.2
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 02:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=jDJ3xeqr1CKa788xhUrlzCt/huwL/qB60RhDoRSMn5U=;
 b=fJY0/oOTJpJ+R8ZD2uzJ/XHi04QmOOwTDnZCqbi11QAX3wAY9z6WiQdWJvVvU+ABYm
 +iWlLou+7PjCFfLBYPKyarbo1QxMW5t3AVg880SbK73+6DCsYbTdwcbuDsfmus4Srvg2
 eboHkg4/Ew/tU6rNukP1yq6Qoyy3O41uQ6+3dc5B5vGqOdLB7XNsWwkyn+WnyzxQ2wqQ
 K2sX/L0nu2sPoZ0h9n3gmVjoY8UCdtp3SM1Wdn+3vRmoPqi44W57lTSnwfk3N/pnot7G
 EDuVoP+x976hj8JTA3TDpgCSNAcQR2UUkaFUi1wv9dfU80rCXNIS5XqU6WOQmlXxsrKo
 qG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=jDJ3xeqr1CKa788xhUrlzCt/huwL/qB60RhDoRSMn5U=;
 b=wB24G13LGzaOWOD7qY2vVBtemfaoR4m+G3C1vthBuHBkwgKupX1fU0+frE8zAC0Zji
 7aAUD+nQb0Tz0B1omXsVyRQHVcrHojo+s3AkFI9A0yLSoTMSjEibJ/rELS642yovDIrI
 s5uUyw6XQpMdN8cW4e9GH6/QRQPO788Zogi0K6x7qCaHeTEJ7JL6/uly7tFcDeaxNiQx
 qHvr/sDBTa39DUkd6y1OAIn7A80GhLrb6+0d32zU0dq7/cYQ0PG1qvyjyukQITdcsb3n
 Zok60KgIV4G9fqQEm6MIXj8rVlxSaG+UkDS46JB9kDqGWRS9VEqS8iSJ6fVpVa8sdm6Z
 GBtA==
X-Gm-Message-State: ACgBeo3hKKnc5lgwwUNj7XWgP4Q2dxTbBOIAaqGqlWdhuiH/XsIKeKHg
 y6cNCMnOqpiA57TSIoyGzEoCjA==
X-Google-Smtp-Source: AA6agR70nbjscxXU/iFeVd+QnMxuLpxfbSb0APoGNfk48X31q02mtNInDUtVH9eRISjEaZyD+5zI1Q==
X-Received: by 2002:a05:6a00:2181:b0:51b:560b:dd30 with SMTP id
 h1-20020a056a00218100b0051b560bdd30mr54702438pfi.44.1662454946918; 
 Tue, 06 Sep 2022 02:02:26 -0700 (PDT)
Received: from localhost.localdomain ([49.206.11.92])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a17090a2f8200b001fabcd994c1sm11987315pjd.9.2022.09.06.02.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 02:02:26 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V4 0/3] hw/riscv: virt: Enable booting S-mode firmware from
 pflash
Date: Tue,  6 Sep 2022 14:32:16 +0530
Message-Id: <20220906090219.412517-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series adds the support to boot S-mode FW like EDK2 from the flash. The
S-mode firmware should be kept in pflash unit 1.

When -kernel (and -initrd) option is also provided along with the flash,
the kernel (and initrd) will be loaded into fw_cfg table and opensbi will
branch to the flash address which will be the entry point of the S-mode
firmware. The S-mode FW then loads and launches the kernel.

When only -pflash option is provided in the command line, the kernel
will be located and loaded in the usual way by the S-mode firmware.

These patches are available in below branch.
https://github.com/vlsunil/qemu/tree/pflash_v2

The first two patches in this series are refactor patches.

These changes are tested with a WIP EDK2 port for virt machine. Below
are the instructions to build and test this feature.

1) Get EDK2 sources from below branches.
https://github.com/vlsunil/edk2/tree/virt_refactor_smode_v1
https://github.com/vlsunil/edk2-platforms/tree/virt_refactor_smode_v1

2) Build EDK2 for RISC-V
	export WORKSPACE=`pwd`
        export GCC5_RISCV64_PREFIX=riscv64-linux-gnu-
        export PACKAGES_PATH=$WORKSPACE/edk2:$WORKSPACE/edk2-platforms
        export EDK_TOOLS_PATH=$WORKSPACE/edk2/BaseTools
        source edk2/edksetup.sh
        make -C edk2/BaseTools clean
        make -C edk2/BaseTools
        make -C edk2/BaseTools/Source/C
        source edk2/edksetup.sh BaseTools
        build -a RISCV64  -p Platform/Qemu/RiscVVirt/RiscVVirt.dsc -t GCC5

3)Make the EDK2 image size to match with what qemu flash expects
truncate -s 32M Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd

4) Run
a) Boot to EFI shell (no -kernel / -initrd option)
qemu-system-riscv64  -nographic   -drive file=Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1  -machine virt -M 2G

b) With -kernel, -initrd and -pflash
qemu-system-riscv64  -nographic   -drive file=Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1  -machine virt -M 2G -kernel arch/riscv/boot/Image.gz -initrd rootfs.cpio 


Changes since V3:
	1) White space and comment edits
	2) Added RB tag

Changes since V2:
	1) Moved the doc comment to .h file

Changes since V1:
	1) Modified code to support the use case when both -kernel and -pflash are configured.
	2) Refactor patches added to help (1) above.
	3) Cover letter added with test instructions.


Sunil V L (3):
  hw/arm,loongarch: Move load_image_to_fw_cfg() to common location
  hw/riscv: virt: Move create_fw_cfg() prior to loading kernel
  hw/riscv: virt: Enable booting S-mode firmware from pflash

 hw/arm/boot.c             | 49 ---------------------------------------
 hw/loongarch/virt.c       | 33 --------------------------
 hw/nvram/fw_cfg.c         | 32 +++++++++++++++++++++++++
 hw/riscv/boot.c           | 29 +++++++++++++++++++++++
 hw/riscv/virt.c           | 32 ++++++++++++++++++-------
 include/hw/nvram/fw_cfg.h | 21 +++++++++++++++++
 include/hw/riscv/boot.h   |  1 +
 7 files changed, 107 insertions(+), 90 deletions(-)

-- 
2.25.1


