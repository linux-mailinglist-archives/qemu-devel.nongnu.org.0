Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8883C3F70
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:14:57 +0200 (CEST)
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gmu-00047p-VH
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gjH-0006qv-62
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:11:11 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gjF-0007EC-Eb
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:11:10 -0400
Received: by mail-wr1-x432.google.com with SMTP id l7so21179343wrv.7
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=abunXidX42zq4hJcoM5e64zCT3rqFPwKgueoe651fYA=;
 b=CftCWsGtEEBBZ4KJPx+ZazCt/lMvomUjsZPwjUC07z0AztqHhzLnkK+PiLH7FvTanG
 VhzPj7U8iM+SgUZnGSVhh4LaAYVYoe33uWqoZgZTJz39b3Yt1RNP5uX2wwYVG3WqxaMG
 La/VbK1i8S3eIursK2OGEySOhwujdfFfUzHkQ/Q9XztDkvzRjERsBTw2ttnTO5gKQ6YL
 kolAIAa3Byot1GwetwJVKzCu5BWJ1rBUZj6vtXnCRmskZrCWFYreU2O4twAoZ4qf+LVk
 RMTLfRMMgZYp63QN6y91dH73KRfWTnWBpcFj/pjJ4Xx1mJyayUNdkOieXcYCO/o0qXe1
 m1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=abunXidX42zq4hJcoM5e64zCT3rqFPwKgueoe651fYA=;
 b=j6R/j/xvcGG3/xAg4lY3uVBV3w9irCkAGzj/DU3md0QIudHWpvIin6SiLPQLGIWmm6
 aStm52mQI7/G7Jt+KFdEmy4U6ZZ9VG+zEUsbNrf54octSWPmuDXpq7XiFWyXs28UvAo6
 IK7MoKqTmcEpKoftHqox1Mw0KZ5CSDSMwseH960mNBzmeVycM+RKAvgB5kjYYmfkB/gN
 vGuvu+A/bCd8BxpiPgVrjVUKFCTDtMYal3f+niBChyfC0tlZqXjC0TKYvGS6Wore0qek
 7WCQgedj4JocEdHkq6Q+9TcfkARPeM+LrMcWR8WSiqkgVWStZ6TpHsRTsQnyvfrsTxjt
 8ODw==
X-Gm-Message-State: AOAM5308Ypa8GH2UPHwbfzqGIm8vJuQLdslqOhgYW6FjjBOA9gsr9TWc
 Re4spz6Dgh0Pc/kDzZ/RP+tCTroNTBPTj2kK
X-Google-Smtp-Source: ABdhPJw851i8NKNTyh/ewaBn84ShQ71bquVSy6Jo49k3uh/Y+CdBXzYMvqkVTHl0H75XEiGNsLgS6w==
X-Received: by 2002:a5d:4b44:: with SMTP id w4mr9837928wrs.275.1626037867339; 
 Sun, 11 Jul 2021 14:11:07 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id v30sm12961478wrv.85.2021.07.11.14.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:11:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] SD/MMC patches for 2021-07-11
Date: Sun, 11 Jul 2021 23:10:53 +0200
Message-Id: <20210711211057.2714586-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9516034d05a8c71ef157a59f525e4c4f7ed79827=
:=0D
=0D
  Merge remote-tracking branch 'remotes/cminyard/tags/for-qemu-6.1-2' into =
staging (2021-07-11 14:32:49 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/sdmmc-20210711=0D
=0D
for you to fetch changes up to a36cbb79763630837e7a73ae0d67aca210ebc791:=0D
=0D
  hw/sd: sdhci: Enable 64-bit system bus capability in the default SD/MMC h=
ost controller (2021-07-11 23:02:51 +0200)=0D
=0D
----------------------------------------------------------------=0D
SD/MMC patches queue=0D
=0D
- sdcard: Check for valid address range in SEND_WRITE_PROT (CMD30)=0D
- sdhci: Enable 64-bit system bus capability in default host controller=0D
=0D
----------------------------------------------------------------=0D
=0D
Joanne Koong (1):=0D
  hw/sd: sdhci: Enable 64-bit system bus capability in the default=0D
    SD/MMC host controller=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/sd/sdcard: When card is in wrong state, log which state it is=0D
  hw/sd/sdcard: Extract address_in_range() helper, log invalid accesses=0D
  hw/sd/sdcard: Check for valid address range in SEND_WRITE_PROT (CMD30)=0D
=0D
 hw/sd/sdhci-internal.h         |  4 +--=0D
 hw/sd/sd.c                     | 40 ++++++++++++++-------=0D
 tests/qtest/fuzz-sdcard-test.c | 66 ++++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                    |  3 +-=0D
 tests/qtest/meson.build        |  1 +=0D
 5 files changed, 98 insertions(+), 16 deletions(-)=0D
 create mode 100644 tests/qtest/fuzz-sdcard-test.c=0D
=0D
-- =0D
2.31.1=0D
=0D

