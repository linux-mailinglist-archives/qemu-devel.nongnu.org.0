Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A566442F89
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:56:46 +0100 (CET)
Received: from localhost ([::1]:39734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuHN-0008TO-5B
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu3r-0006W6-JV
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:42:47 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu3o-0005vM-D6
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:42:47 -0400
Received: by mail-wr1-x431.google.com with SMTP id u1so1793038wru.13
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rD9luL/Z2uX82syOzzIMkwjYe38QdIHT6dzkj/LFnUs=;
 b=a8waanJRPUxbvuYvNFETu68yULkCfRaC3ydWMw1Hc4h9QbK/h1SswDgojhx7xxjQm1
 njAZk9Eo7F0ok2GBSQCA+9J58ULpvE7iJUJsV7nCiFYpnes36c6pK+WB32wjwJVhO8FJ
 IUHSXvY8oIOXryC+ybqy5clOni2an/IVD+pln2niGjdbZvlQsqwNMKAUpTsPg/Syb4O4
 P2kX4SBYKJqQ+UzIfBDhQQR8bY3ywpsZugv30DLcCEill/yRfkQRv41mqVpas/VUk8LW
 0O+Eg2UVMaqXOFz10avsyDkHAsvtIOqHTsIjr7+86x13fqs8CTGhfcOV2Tw5hXo4upB8
 Tg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rD9luL/Z2uX82syOzzIMkwjYe38QdIHT6dzkj/LFnUs=;
 b=tpRcGHktWc01j0+kW3/vtgPIo6QnKFObBgcHuWNAOJ3Xb/WVqzAkcVa6yd/UCEN5Is
 t0ze1en0XJvI7Cfr1tn9fTH97eDlW7hhEXQL3rfLocKYX9vnmuP1N7T/vth71oaCLUFx
 wY2JC7YxJAiOZNY0OcJ5F7mA6YshjozUio9FeayFuGtMlnNm+2sBOK4mR0GCv/tHZMSW
 5d5XDF8wAy4912NyNIix0hcfJyfl86erL2lqbcDm2Gmo2QjkZoAylK/Kp+vE/QNSdxh7
 avqDHJpGRvFSSQKKroj/f4r5fGFQZz25w4MD5aJT4/Q0yzAhLrafGCjsohQR1XGQYpvG
 NRCQ==
X-Gm-Message-State: AOAM531uyqufoipMZea4gRDDjg+uN/5cF+Kt31YmkfEgg1n4a3nja5hx
 gSegWhcMYtBCjaXcjq4IY4ZTR1TodXA=
X-Google-Smtp-Source: ABdhPJyd9540ryNG8zm6FQ/xDawtTRl+tvFv5ZRl2b3DAO/1PGADbpYOgm6LmFUBUBg1Nsg1D1bFMQ==
X-Received: by 2002:adf:f001:: with SMTP id j1mr41989503wro.351.1635860562345; 
 Tue, 02 Nov 2021 06:42:42 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 g10sm3083636wmq.13.2021.11.02.06.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:42:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/41] MIPS patches for 2021-11-02
Date: Tue,  2 Nov 2021 14:41:59 +0100
Message-Id: <20211102134240.3036524-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 844d6dfc3e48a8d404b03ea815868fd01c6f7317=
:=0D
=0D
  Merge remote-tracking branch 'remotes/alex.williamson/tags/vfio-update-20=
211101.0' into staging (2021-11-02 07:25:59 -0400)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/mips-20211102=0D
=0D
for you to fetch changes up to 6f08c9c5316a80a049d4861eaac5844466ba3eba:=0D
=0D
  Revert "elf: Relax MIPS' elf_check_arch() to accept EM_NANOMIPS too" (202=
1-11-02 14:35:22 +0100)=0D
=0D
----------------------------------------------------------------=0D
MIPS patches queue=0D
=0D
- Fine-grained MAINTAINERS sections=0D
- Fix MSA MADDV.B / MSUBV.B opcodes=0D
- Convert MSA opcodes to decodetree=0D
- Correct Loongson-3A4000 MSAIR register=0D
- Do not accept ELF nanoMIPS binaries on linux-user=0D
- Use ISA instead of PCI interrupts in VT82C686 PCI device=0D
=0D
----------------------------------------------------------------=0D
=0D
BALATON Zoltan (4):=0D
  usb/uhci: Misc clean up=0D
  usb/uhci: Disallow user creating a vt82c686-uhci-pci device=0D
  usb/uhci: Replace pci_set_irq with qemu_set_irq=0D
  hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI interrupts=0D
=0D
Philippe Mathieu-Daud=C3=A9 (37):=0D
  MAINTAINERS: Add MIPS general architecture support entry=0D
  MAINTAINERS: Add entries to cover MIPS CPS / GIC hardware=0D
  MAINTAINERS: Split MIPS TCG frontend vs MIPS machines/hardware=0D
  target/mips: Fix MSA MADDV.B opcode=0D
  target/mips: Fix MSA MSUBV.B opcode=0D
  target/mips: Adjust style in msa_translate_init()=0D
  target/mips: Use dup_const() to simplify=0D
  target/mips: Have check_msa_access() return a boolean=0D
  target/mips: Use enum definitions from CPUMIPSMSADataFormat enum=0D
  target/mips: Rename sa16 -> sa, bz_df -> bz -> bz_v=0D
  target/mips: Convert MSA LDI opcode to decodetree=0D
  target/mips: Convert MSA I5 instruction format to decodetree=0D
  target/mips: Convert MSA BIT instruction format to decodetree=0D
  target/mips: Convert MSA SHF opcode to decodetree=0D
  target/mips: Convert MSA I8 instruction format to decodetree=0D
  target/mips: Convert MSA load/store instruction format to decodetree=0D
  target/mips: Convert MSA 2RF instruction format to decodetree=0D
  target/mips: Convert MSA FILL opcode to decodetree=0D
  target/mips: Convert MSA 2R instruction format to decodetree=0D
  target/mips: Convert MSA VEC instruction format to decodetree=0D
  target/mips: Convert MSA 3RF instruction format to decodetree=0D
    (DF_HALF)=0D
  target/mips: Convert MSA 3RF instruction format to decodetree=0D
    (DF_WORD)=0D
  target/mips: Convert MSA 3R instruction format to decodetree (part=0D
    1/4)=0D
  target/mips: Convert MSA 3R instruction format to decodetree (part=0D
    2/4)=0D
  target/mips: Convert MSA 3R instruction format to decodetree (part=0D
    3/4)=0D
  target/mips: Convert MSA 3R instruction format to decodetree (part=0D
    4/4)=0D
  target/mips: Convert MSA ELM instruction format to decodetree=0D
  target/mips: Convert MSA COPY_U opcode to decodetree=0D
  target/mips: Convert MSA COPY_S and INSERT opcodes to decodetree=0D
  target/mips: Convert MSA MOVE.V opcode to decodetree=0D
  target/mips: Convert CFCMSA opcode to decodetree=0D
  target/mips: Convert CTCMSA opcode to decodetree=0D
  target/mips: Remove generic MSA opcode=0D
  target/mips: Remove one MSA unnecessary decodetree overlap group=0D
  target/mips: Fix Loongson-3A4000 MSAIR config register=0D
  target/mips: Remove obsolete FCR0_HAS2008 comment on P5600 CPU=0D
  Revert "elf: Relax MIPS' elf_check_arch() to accept EM_NANOMIPS too"=0D
=0D
 hw/usb/hcd-uhci.h               |    3 +-=0D
 target/mips/tcg/msa.decode      |  243 ++-=0D
 hw/usb/hcd-uhci.c               |   14 +-=0D
 hw/usb/vt82c686-uhci-pci.c      |   15 +=0D
 linux-user/elfload.c            |    2 -=0D
 target/mips/tcg/msa_helper.c    |   64 +-=0D
 target/mips/tcg/msa_translate.c | 2743 +++++++------------------------=0D
 target/mips/cpu-defs.c.inc      |    2 +-=0D
 MAINTAINERS                     |   37 +-=0D
 9 files changed, 957 insertions(+), 2166 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

