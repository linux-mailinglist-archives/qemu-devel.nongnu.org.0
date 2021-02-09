Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723893145E7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 02:56:57 +0100 (CET)
Received: from localhost ([::1]:34848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9IGu-0007wk-GV
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 20:56:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3oeshYAMKCgglrmowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--dje.bounces.google.com>)
 id 1l9IFp-0007CD-Sc
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 20:55:49 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:33703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3oeshYAMKCgglrmowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--dje.bounces.google.com>)
 id 1l9IFo-0006WN-8v
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 20:55:49 -0500
Received: by mail-pl1-x64a.google.com with SMTP id h8so8450360pls.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 17:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=Fwyqm+uYuhAgy2x5gAGgnngLDXvwocxH657NO5bc9Hw=;
 b=RZjIOpOzhlq1A00zwYHTdvYzhNnjur2yA8xicnBYUg678OrCOtNColWfil/bAvNjxW
 4ucjPX3Yd25r7PMyAQgMVryw0mIgj6xp7BWqR3O7FqV+4Km6DfiGXo3u2c29LOk/eSbn
 nKt2O34d5dceekyuGfRXk4pVcviNI85BtEuAlwZhUWs0Q29Ch4YSOiiySEzsWlAdFUec
 e8viaOSdt6WFFsXqwhzKT112nYvk8jeGGsSRQs0dzalsGCggEQLfyvhLM3SX6d24oFah
 Ufh2XR+U36q2ggGUylZVehzG4nnXVDKco9AI64u6Dzcv+PqQ7oBvZ2JKoFIk/QIzsO6W
 be6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=Fwyqm+uYuhAgy2x5gAGgnngLDXvwocxH657NO5bc9Hw=;
 b=Z4dopGWNy7mJ2latlwrIJ4E7rQNIwpmKVrmWpaMVhD7XTzNdSEkEJS4Oy4Xn9KRGNq
 hAmDEjLPqULtnP+kUvfLgf3q4sw2cWkoEru7MaDBHV+wi2N+16/udv5GfycrG9wKEEB+
 2MzRmbBYShJ9qB9C5k5a0huC5Ot6xMlz/w6jCCngCN1qCb9oMgaf7ylyGUlc3pJos/Jd
 6MHZ9Mk0Jh+3UG4SCngLTLbvodRzTiA1F4cuXKsZGUriQ148iPZFXX+WQ2U0af4IWjnG
 va0qeBaYDuOl5dCaMMmmCtHtj66WxdTH85tzgRpxBQfYUnjOoE62NyN64EpfuUNml+2n
 2kww==
X-Gm-Message-State: AOAM532rWuB7sUAlixhIKWkU27NWPfP0xqInu8t48eGafW+T7MbIHNB4
 uSTC6Z5W3l6AdwAvjK9Tr5WedXjcvkR+zefaLdLqP4HDZ2YbPSCKaJ/RojlqMAy2+oZXucrbQCC
 s/NL4xcg2XfYpZ3tvXphvr4hyE9cmxIm4aGdGSg10pPxf8YYlEFGP
X-Google-Smtp-Source: ABdhPJyscDSaTuPQuMD3hAtKq7DLoWYfpLCbNwiflRG0LwkvES1DqXVA0mE7awVV0bz643gU+QVg2o0=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:e459:49a8:64d6:2427])
 (user=dje job=sendgmr) by 2002:a63:4346:: with SMTP id
 q67mr19754280pga.223.1612835745668; 
 Mon, 08 Feb 2021 17:55:45 -0800 (PST)
Date: Mon,  8 Feb 2021 17:55:38 -0800
Message-Id: <20210209015541.778833-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v3 0/3] Add npcm7xx emc model
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hao Wu <wuhaotsh@google.com>, Avi Fishman <avi.fishman@nuvoton.com>, 
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3oeshYAMKCgglrmowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--dje.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Doug Evans <dje@google.com>
From:  Doug Evans via <qemu-devel@nongnu.org>

This is a 10/100 ethernet device that has several features.
Only the ones needed by the Linux driver have been implemented.
See npcm7xx_emc.c for a list of unimplemented features.

Doug Evans (3):
  hw/net: Add npcm7xx emc model
  hw/arm: Add npcm7xx emc model
  tests/qtests: Add npcm7xx emc model test

 docs/system/arm/nuvoton.rst    |   3 +-
 hw/arm/npcm7xx.c               |  50 +-
 hw/net/meson.build             |   1 +
 hw/net/npcm7xx_emc.c           | 857 +++++++++++++++++++++++++++++++++
 hw/net/trace-events            |  17 +
 include/hw/arm/npcm7xx.h       |   2 +
 include/hw/net/npcm7xx_emc.h   | 286 +++++++++++
 tests/qtest/meson.build        |   1 +
 tests/qtest/npcm7xx_emc-test.c | 812 +++++++++++++++++++++++++++++++
 9 files changed, 2026 insertions(+), 3 deletions(-)
 create mode 100644 hw/net/npcm7xx_emc.c
 create mode 100644 include/hw/net/npcm7xx_emc.h
 create mode 100644 tests/qtest/npcm7xx_emc-test.c

-- 
2.30.0.478.g8a0d178c01-goog

Differences from v2:

1/3 hw/net: Add npcm7xx emc model

- move call to qemu_set_irq
- remove use of C99 mixed decls/statements
- add use of g_autofree

2/3 hw/arm: Add npcm7xx emc model

- none, patch ok as is

3/3 tests/qtests: Add npcm7xx emc model test

- remove use of C99 mixed decls/statements

