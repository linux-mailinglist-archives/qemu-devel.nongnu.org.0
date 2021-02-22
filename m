Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8742B32121B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:38:12 +0100 (CET)
Received: from localhost ([::1]:51186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6jL-0000nL-Kd
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lE6es-00020u-CF
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:33:34 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:35355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lE6en-0000t5-FJ
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:33:32 -0500
Received: by mail-lj1-x22c.google.com with SMTP id a17so55613113ljq.2
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 00:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mtkVxIBXFYw9+1cTpCukmkY9e+c+nRszSnkihvojuEo=;
 b=QHWaLy4c+mA2xEKtUnBMOOvGc+P1K+a8bJQ5k6JpcuGX9cBQxlM33Sv8lh4/Xagjm7
 Ej0boFLntwWG4DeYYcffO0ANbLBosB51xup9/+BFn7hUT4DosQwy1pPIbqu7p2L3DytM
 j/wFztTUk4Xn7T5X49hNAqiWOaRYdgsGWolDLvTJBaP56abQgXkt4b8Bvy2QP1qS7qnH
 SQLsz4ez6zPiQbUgCe1kMR+SPEcfmYPsTSgoAl+iBUISjry6kC9P1waglp6+ob22p+HV
 FYDRUob5IV9S6Alomyt3CPwZ3jfaNN81fP0Ay1JyKCkVYVtmPvSX9DbmsKkC8+/BJEr4
 iMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mtkVxIBXFYw9+1cTpCukmkY9e+c+nRszSnkihvojuEo=;
 b=EwSZ8HSZ4c7H0cpzsIResgbP5qR5QR1BxF/SL4WZZYyqyvZDllaQKNpTZ13fflDQ/R
 X2P5pdQUm8H5ZI7g+rI0JNdsi+UpklRvivsUqFheOhySG+JXmlqtwXQbvzBCuuMe8LIc
 /WgmMDBf2Jhr8psNLeBQt222cdeI6vPlOqjuoBlmLaTKWYDR7cLcRH1Ll7Pf9wAjPFnY
 JR+PZYXl5PpoDCRbB2+ZcliD0XYY266atB2V+A6DBm6PrNRr5xw1/7RZvBAXeZxdqKa1
 OmucH2U3cNdrqdJ7PbyeoL4R3qqfMgUDtKlF/uyUztgF4xprSy35fRY5ZxeYuCcEPOIu
 ScAg==
X-Gm-Message-State: AOAM533bvy6cEDux45Q8Xu/+AlTY0UCwu214mVsE2ocjETt9B+UkNYzG
 nUB7RqMpVMcY1mzFLxWyqVj7IoZ+OELu7w==
X-Google-Smtp-Source: ABdhPJyJG3sluPJYHFg2Uy9e34CIyMFH82IU520LWsOzPJPeojrme5iH+YJ6lzd3a5rhMDEloxOCMg==
X-Received: by 2002:a05:6512:b06:: with SMTP id
 w6mr12733433lfu.190.1613982805771; 
 Mon, 22 Feb 2021 00:33:25 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id 3sm1838850lfr.105.2021.02.22.00.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 00:33:25 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 0/3] CRIS queue
Date: Mon, 22 Feb 2021 09:33:21 +0100
Message-Id: <20210222083324.331908-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, f4bug@amsat.org,
 stefans@axis.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

The following changes since commit 00d8ba9e0d62ea1c7459c25aeabf9c8bb7659462:

  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/mips-20210221' into staging (2021-02-21 19:52:58 +0000)

are available in the Git repository at:

  git@github.com:edgarigl/qemu.git tags/edgar/cris-next-2021-02-22.for-upstream

for you to fetch changes up to fd52deea52d79192c43a1a7a0240a3cabbc55e80:

  target/cris: Plug leakage of TCG temporaries (2021-02-22 09:04:58 +0100)

----------------------------------------------------------------
CRIS PR 2021-02-22 v1

----------------------------------------------------------------
Philippe Mathieu-Daudé (2):
      target/cris: Use MMUAccessType enum type when possible
      target/cris: Let cris_mmu_translate() use MMUAccessType access_type

Stefan Sandstrom (1):
      target/cris: Plug leakage of TCG temporaries

 target/cris/mmu.h               |   2 +-
 target/cris/helper.c            |   4 +-
 target/cris/mmu.c               |  31 +++++-----
 target/cris/translate.c         | 124 ++++++++++++++++++++++++++++------------
 target/cris/translate_v10.c.inc |  70 +++++++++++++++--------
 5 files changed, 153 insertions(+), 78 deletions(-)

-- 
2.25.1


