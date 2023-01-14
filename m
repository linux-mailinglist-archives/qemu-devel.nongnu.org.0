Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AAE66A915
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 05:03:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGXi8-0008Ln-HB; Fri, 13 Jan 2023 23:00:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXi2-0008Is-FY
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 22:59:58 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXi0-0005HF-FF
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 22:59:58 -0500
Received: by mail-pj1-x102e.google.com with SMTP id q64so24253671pjq.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 19:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gUHUe9uYKAinK4NLL6n7/4jCeZmM+FnyeBkaoxjFHZE=;
 b=nRKKLWNbJPn29hbKuN+S+UuXn9ouyUpO2YbwL05cE0r+AdkFhIjwDbrWy42VcimQQs
 xeG46jPkkccht6IWumg6j3Qh7XGQJUUR3BLiLafTajAHyUPYbkYRqS/1zzZ6pRLapAd2
 Nlb1sIR444O0GmtCVviZBivq2PSbu2u0A9uhmsyZamjQxI84gw/ZJAN2JMt40VJsYtbl
 2n9sJEt5N50/Ts+CAzQ6K/c9QFkpyazHPBDMmK37fLYMVlIBKyW4wF2UNhTEmgWhYRAt
 kPYL5lB1IQEcnoihIQ5/61fTvvxTWgbyIdb8CbZJnt8wCu01yNKYF6xQQ+bp2BRPEIzN
 rlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gUHUe9uYKAinK4NLL6n7/4jCeZmM+FnyeBkaoxjFHZE=;
 b=Zn3/LkebCys17yycuKgFhUWqK4NIQT41H4OJPTrg8d/nqwrBCad3FVMNVmS5GZhBEW
 PTflZFgWmqUWPm9SfFY9RviTSDqFJBc8Ls5PrLKvwDO3/jmy1vQXRJvsQF7srrpdrwsk
 4xgm1mw7MyEqPibcNsPCXRqgQ1BkewyZtMiVypSOiHFS8MZ7fzfRBDRiz+DjmaekmdYB
 3XiAEaXlA6fY8Syv0ikBMdfxsSrTcOyRo4WrHMgt3RgfjTDiE2838eb2Fw0q4rUtnjKA
 jLEKXiAP+rOs+te0G3EaQSLfJdvGgcajcpGQUXg/eVFmc+Qi8UQnwPuc+Rvmhfi889dE
 erNg==
X-Gm-Message-State: AFqh2kq8fULpPYAVnwoAaSxt3Sr5WWcofY8ril+V/a/u4TX4gvLCyClE
 t2ql+o5E8s/tHJ+sELjN4AK94w==
X-Google-Smtp-Source: AMrXdXvTiKyKaNvMsplL8dyJIGAIoTAF2UPe5vVe5i1VaAIY4P2Jl1+Xv3wwYTQjC7JtB2cRQHiLbg==
X-Received: by 2002:a05:6a20:3b22:b0:b6:8317:219b with SMTP id
 c34-20020a056a203b2200b000b68317219bmr7837463pzh.8.1673668791768; 
 Fri, 13 Jan 2023 19:59:51 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a170902868f00b00189fdadef9csm910894plo.107.2023.01.13.19.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 19:59:51 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 00/19] e1000x cleanups (preliminary for IGB)
Date: Sat, 14 Jan 2023 12:59:00 +0900
Message-Id: <20230114035919.35251-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We are adding a new device named igb, yet another Intel NIC. As the new
implementation derives from e1000e, overhaul e1000e implementation first.
e1000 has many commonalities with e1000e so we also apply the corresponding
changes to the device if possible.

This was spun off from:
https://patchew.org/QEMU/20230112095743.20123-1-akihiko.odaki@daynix.com/

The changes from the series are as follows:
- Fixed code alignment in e1000.c. (Philippe Mathieu-Daudé)
- "e1000: Configure ResettableClass" and e1000e's corresponding patch was based
  on the old version so they are now updated. (Philippe Mathieu-Daudé)
- Added "e1000e: Remove extra pointer indirection"

The series was composed on patches submitted earlier for e1000e. The below
are links to Patchew:
03: https://patchew.org/QEMU/20221103060103.83363-1-akihiko.odaki@daynix.com/
04: https://patchew.org/QEMU/20221125135254.54760-1-akihiko.odaki@daynix.com/
05: https://patchew.org/QEMU/20221119054913.103803-1-akihiko.odaki@daynix.com/
06: https://patchew.org/QEMU/20221119055304.105500-1-akihiko.odaki@daynix.com/
08 includes: https://patchew.org/QEMU/20221119060156.110010-1-akihiko.odaki@daynix.com/
10: https://patchew.org/QEMU/20221125140105.55925-1-akihiko.odaki@daynix.com/
11: https://patchew.org/QEMU/20221125142608.58919-1-akihiko.odaki@daynix.com/
13: https://patchew.org/QEMU/20221201095351.63392-1-akihiko.odaki@daynix.com/
14: https://patchew.org/QEMU/20221201100113.64387-1-akihiko.odaki@daynix.com/
15: https://patchew.org/QEMU/20230107143328.102534-1-akihiko.odaki@daynix.com/

Akihiko Odaki (19):
  e1000e: Fix the code style
  hw/net: Add more MII definitions
  fsl_etsec: Use hw/net/mii.h
  e1000: Use hw/net/mii.h
  e1000: Mask registers when writing
  e1000e: Mask registers when writing
  e1000: Use more constant definitions
  e1000e: Use more constant definitions
  e1000: Use memcpy to intialize registers
  e1000e: Use memcpy to intialize registers
  e1000e: Remove pending interrupt flags
  e1000e: Improve software reset
  e1000: Configure ResettableClass
  e1000e: Configure ResettableClass
  e1000e: Introduce e1000_rx_desc_union
  e1000e: Set MII_ANER_NWAY
  e1000e: Remove extra pointer indirection
  tests/qtest/e1000e-test: Fix the code style
  tests/qtest/libqos/e1000e: Remove duplicate register definitions

 hw/net/e1000.c              | 254 ++++++++----------
 hw/net/e1000_regs.h         |  61 ++---
 hw/net/e1000e.c             |  88 +++---
 hw/net/e1000e_core.c        | 519 ++++++++++++++++++------------------
 hw/net/e1000e_core.h        |  68 +++--
 hw/net/e1000x_common.c      |  10 +-
 hw/net/e1000x_common.h      |  54 ++--
 hw/net/fsl_etsec/etsec.c    |  11 +-
 hw/net/fsl_etsec/etsec.h    |  17 --
 hw/net/fsl_etsec/miim.c     |   5 +-
 hw/net/trace-events         |   4 +-
 include/hw/net/mii.h        |  14 +-
 tests/qtest/e1000e-test.c   |   2 +-
 tests/qtest/libqos/e1000e.c |  26 +-
 tests/qtest/libqos/e1000e.h |   5 -
 15 files changed, 541 insertions(+), 597 deletions(-)

-- 
2.39.0


