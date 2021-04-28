Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7BF36D96C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:18:50 +0200 (CEST)
Received: from localhost ([::1]:40088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbl1c-0007i2-SY
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbkzv-0006Ru-27
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:17:03 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:45705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbkzt-0003F7-0p
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:17:02 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 n4-20020a05600c4f84b029013151278decso8910047wmq.4
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HyBtcuy/Lkw+T0wOH3YTAJdDnfl3dCjXbs9IYUKuMgo=;
 b=uOV8hge0XAOAUb25KuJJ2xNKdV4HQDezFnzOMUaWH9ni7Wgm0IpGSQWv3oBOSkBx4y
 WKRsyD+/U22Fp0qTI4Yh2g5QYuSri5ohba2hCrL3V30c+xLCnCeGu7ynp2V9/6ns6rzr
 WZUIqRzfMIvWa1tCxbi5UTfelPfRY/T7SNQyw/CR91d/VVR/29EvAYyeU3JpGJ0yU1JU
 UZAEsulwgXWPLfIQwdYtRXQUn5g431fvRmlIRknZBdLGw1GIKQlkd4UuPYVsJx4AinMq
 aVuajD0FBBvisHacXmX6TCMpbIQlEpzeKEO0XVVnLXmRv5LRpqqJyy9sCtXVGjZ51zs7
 w0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HyBtcuy/Lkw+T0wOH3YTAJdDnfl3dCjXbs9IYUKuMgo=;
 b=fyx0c1cNumuxoT8KFfNniLbBlBhCnrdQdqO5oUAiTXakeG/F2m5DxFX/X1nS3r5RMC
 UIr53zpLWXvdwr4k5MtgCMr42tGaqpcFwRq3kVvMZrVPVLoBA1tNdg2DKjkeDUyuasmp
 /bz+C+3qUUmIamEsGIJKjWG/D2ZazRhmlMwHo8NmoFOLA/KZn/VRRaogDua8qpnx21Gd
 kxKkQ/wX6qWkEjwXPiKIG0skbkxe74ZpT+U5wnaOtCxnLZt02u9cAYwB2eNEJtGCQS7M
 VcIDWPikKwF4mqQhqGTsNWR8ws68eGuzbbXIc2WDKP0vJDQpa9pom23ffzrSu842NO44
 ctqA==
X-Gm-Message-State: AOAM533fRDjIbWenBaGVwDWd260H9wTkZPEAjrtFhbb1PcK1SbP4YjnJ
 m2+/Zr3Hyz2I6m/D6FnpF16JTZ85rNmk9A==
X-Google-Smtp-Source: ABdhPJza/F/JQfGmuiEVk2dMX+z75R4/SEH2/ZIoJUNtXnIdWDH7AwZubA2oVvRNvyDJUiAiKFLgQA==
X-Received: by 2002:a1c:e409:: with SMTP id b9mr4861495wmh.189.1619619417402; 
 Wed, 28 Apr 2021 07:16:57 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id e10sm147459wrw.20.2021.04.28.07.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 07:16:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] hw/sparc: Kconfig fixes to build with/without the
 leon3 machine
Date: Wed, 28 Apr 2021 16:16:50 +0200
Message-Id: <20210428141655.387430-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review: 2-4=0D
=0D
Since v1:=0D
- move cpu_check_irqs() to target/sparc/ (rth)=0D
=0D
This series fixes link failure when building either the leon3=0D
machine or the sun4m ones.=0D
=0D
The problem is we have hardware specific code in the architectural=0D
translation code. Move this code to hw/sparc/.=0D
=0D
The link failures can be reproduced doing:=0D
=0D
  $ echo CONFIG_LEON3=3Dy > default-configs/devices/sparc-softmmu.mak=0D
  $ configure --without-default-devices=0D
  $ ninja qemu-system-sparc=0D
  $ ./qemu-system-sparc -M leon3 -S=0D
=0D
or:=0D
=0D
  $ echo CONFIG_SUN4M=3Dy > default-configs/devices/sparc-softmmu.mak=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/sparc: Allow building without the leon3 machine=0D
  hw/sparc64: Remove unused "hw/char/serial.h" header=0D
  hw/sparc64: Fix code style for checkpatch.pl=0D
  hw/sparc*: Move cpu_check_irqs() to target/sparc/=0D
=0D
 target/sparc/cpu.h          |  6 ----=0D
 hw/sparc/leon3.c            | 37 +++++++++++++++++++-=0D
 hw/sparc/sun4m.c            | 32 -----------------=0D
 hw/sparc64/sparc64.c        | 63 ---------------------------------=0D
 target/sparc/int32_helper.c | 70 +++++++++++++++++--------------------=0D
 target/sparc/int64_helper.c | 66 ++++++++++++++++++++++++++++++++++=0D
 hw/sparc/trace-events       |  4 +--=0D
 hw/sparc64/trace-events     |  4 ---=0D
 target/sparc/trace-events   | 12 ++++---=0D
 9 files changed, 145 insertions(+), 149 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

