Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F7833A0A8
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:49:58 +0100 (CET)
Received: from localhost ([::1]:59720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAGr-00077H-Nq
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAFX-0005bB-UK
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:48:35 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAFV-0006kh-OZ
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:48:35 -0500
Received: by mail-wr1-x42a.google.com with SMTP id j2so6603885wrx.9
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ShWtYev9jtvvhTbgfYjDaKY90VT6j9nSQKf5ecQIcuw=;
 b=uCJ/WLImdp56uG2HuneqjcPcpF3xxm/YGzmYkmiXVhcaA9CfPKf7I439G83MratBdg
 9woHHDH3fyRmVnpERWeK/bgzKHCwCtywfB4A1MW49cefdJcJJDyjtCaoBQKs3dQDVsGQ
 R5L+w1m2ZrsbK5raOrgtWpBaXq6q4bPnQvAjC1jHKxGTXSSj8g740CtdUV0hHqiRv1zD
 58YXDo4FKZBuxCgEgNxBYE0WvphL1QaqtDnoF7HB6JlPuyaKEYQTiA0rSiZbvHAtqxLR
 CoPT732xO0JadW3WU+sWUuHJ+ysKmgsn+c+vWTb6ITHIa719lL+rUqOJGg6jQ9PSVrbk
 fB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ShWtYev9jtvvhTbgfYjDaKY90VT6j9nSQKf5ecQIcuw=;
 b=PehSKEiMbKizDj4wXXUUNbmjsiQTzAhSyS9dp88Ul1aoNWkzaNMnswPM94rvnP5MMV
 Ez96PkmQMZSUD5PzTwE+UCRzvqlnHu6UhiOEytKsFBszidzt6qBfueE9JOPAAvVWAi90
 8tZieKhX2jlhaX/zEWs2Q1MFlO+XMXHzI4RMzhow0a1S9jcX78mwe+g3LyMKVTh0upWM
 by/e0yBPSalImGli+u7bv/MgeNnSgO0XIGgI47wOwo9CBqlOVKaDPf3nkoKHBKn5OxwO
 p0llhoP36j5z8drmmh0ir1wDOmfgsgNM66Kvhmr8CZxWbQtkfn1DZ2xGngalKdSQ78Vm
 RIYg==
X-Gm-Message-State: AOAM531SZKeNbhqVnMycD2I0afQ3UBqKYOpc98B9fcA0K93USD8n0/sR
 7bqhjJhetGdgj61s1aCWO6eq7cfiFAgISw==
X-Google-Smtp-Source: ABdhPJwD0iYpsez4Bic0yt8wjGb8C1xeCgOOiOiAXBllrgugSjFpmikXUidOAO9bORBvPV+lOxqLlg==
X-Received: by 2002:adf:ea82:: with SMTP id s2mr20616413wrm.1.1615664911935;
 Sat, 13 Mar 2021 11:48:31 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x23sm7336290wmi.33.2021.03.13.11.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:48:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/27] MIPS patches for 2021-03-13
Date: Sat, 13 Mar 2021 20:48:02 +0100
Message-Id: <20210313194829.2193621-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3f8d1885e48e4d72eab0688f604de62e0aea7a38=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210311-pull-reques=
t' into staging (2021-03-12 13:53:44 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/mips-20210313=0D
=0D
for you to fetch changes up to 4a86bf271eed1a8ed56e2556d7b8eb4f0fddae7a:=0D
=0D
  target/mips/tx79: Salvage instructions description comment (2021-03-13 20=
:29:36 +0100)=0D
=0D
Nothing particularly exciting, but good diffstat.=0D
=0D
----------------------------------------------------------------=0D
MIPS patches queue=0D
=0D
- Tidy up the GT64120 north bridge=0D
- Move XBurst Media eXtension Unit code to mxu_translate.c=0D
- Convert TX79 to decodetree=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=C3=A9 (27):=0D
  hw/mips/gt64xxx: Initialize ISD I/O memory region in DeviceRealize()=0D
  hw/mips/gt64xxx: Simplify ISD MemoryRegion read/write handlers=0D
  hw/mips/gt64xxx: Fix typos in qemu_log_mask() formats=0D
  hw/mips/gt64xxx: Rename trace events related to interrupt registers=0D
  hw/mips/gt64xxx: Trace accesses to ISD registers=0D
  target/mips/meson: Introduce mips_tcg source set=0D
  target/mips/meson: Restrict mips-semi.c to TCG=0D
  target/mips: Rewrite complex ifdef'ry=0D
  target/mips: Remove XBurst Media eXtension Unit dead code=0D
  target/mips: Remove unused CPUMIPSState* from MXU functions=0D
  target/mips: Pass instruction opcode to decode_opc_mxu()=0D
  target/mips: Use OPC_MUL instead of OPC__MXU_MUL=0D
  target/mips: Move MUL opcode check from decode_mxu() to=0D
    decode_legacy()=0D
  target/mips: Rename decode_opc_mxu() as decode_ase_mxu()=0D
  target/mips: Convert decode_ase_mxu() to decodetree prototype=0D
  target/mips: Simplify decode_opc_mxu() ifdef'ry=0D
  target/mips: Introduce mxu_translate_init() helper=0D
  target/mips: Extract MXU code to new mxu_translate.c file=0D
  target/mips: Use gen_load_gpr[_hi]() when possible=0D
  target/mips/tx79: Move MFHI1 / MFLO1 opcodes to decodetree=0D
  target/mips/tx79: Move MTHI1 / MTLO1 opcodes to decodetree=0D
  target/mips/translate: Make gen_rdhwr() public=0D
  target/mips/translate: Simplify PCPYH using deposit_i64()=0D
  target/mips/tx79: Move PCPYH opcode to decodetree=0D
  target/mips/tx79: Move PCPYLD / PCPYUD opcodes to decodetree=0D
  target/mips: Remove 'C790 Multimedia Instructions' dead code=0D
  target/mips/tx79: Salvage instructions description comment=0D
=0D
 target/mips/translate.h      |   10 +=0D
 target/mips/tx79.decode      |   39 +=0D
 hw/mips/gt64xxx_pci.c        |   59 +-=0D
 target/mips/mxu_translate.c  | 1609 +++++++++++++++=0D
 target/mips/translate.c      | 3665 +---------------------------------=0D
 target/mips/tx79_translate.c |  303 +++=0D
 target/mips/txx9_translate.c |   20 +=0D
 hw/mips/trace-events         |    6 +-=0D
 target/mips/meson.build      |   18 +-=0D
 9 files changed, 2057 insertions(+), 3672 deletions(-)=0D
 create mode 100644 target/mips/tx79.decode=0D
 create mode 100644 target/mips/mxu_translate.c=0D
 create mode 100644 target/mips/tx79_translate.c=0D
 create mode 100644 target/mips/txx9_translate.c=0D
=0D
-- =0D
2.26.2=0D
=0D

