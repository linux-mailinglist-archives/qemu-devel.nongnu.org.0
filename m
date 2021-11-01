Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF0E4423F3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 00:27:11 +0100 (CET)
Received: from localhost ([::1]:33788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhghq-0004bv-Kj
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 19:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3DHeAYQgKCg8B9wp387wv33v0t.r315t19-stAt0232v29.36v@flex--wuhaotsh.bounces.google.com>)
 id 1mhgem-0001iu-VV
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:24:01 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:55857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3DHeAYQgKCg8B9wp387wv33v0t.r315t19-stAt0232v29.36v@flex--wuhaotsh.bounces.google.com>)
 id 1mhgek-0002up-PA
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:24:00 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 t62-20020a625f41000000b004807e0ed462so4323595pfb.22
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=p0U5B0j6kDEpX9NU9AVmzRUURoUpHs1zskZNtqaLUdU=;
 b=h5MUDVFU8YnXF8Id5icCdi9D29HsS1QDxvASWK76hKxQmNIf50XscNr43EoxKvhShY
 nGSQSjPjT1NdnxxcvHcdR7GyXeg66IkGUyDucVTDwmLpodgGe5teDro6i6jCwvYCQeq9
 Ge2WgblBqvoIH6dJaOht+FDy0PR+6vwa5pNETzvOIcMmIznq2t51BBf+JX7Y+ksOga6d
 +RrDZxm3WvhuqIMGUh+FpNuU+r8tWfMjCn9ZoCaa1XQWUphVBGmFUBoYNIZk1WmHFbtA
 r4uzbcIFyuWYMLizHXLqL8bMVKcCwEXNcLU+3eDqeysvcMcM8Bh9wjg1l0PJBC2Y8sov
 McKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=p0U5B0j6kDEpX9NU9AVmzRUURoUpHs1zskZNtqaLUdU=;
 b=hb3mi4imFkqOlPOnqB/x5ooh1SRIHvR5ujEb2A7YJDc8bufD8yrnwmtT4quur0wZ54
 VHdIEJQFQfBJg/jSrA4hU6yzFDFANyXJPTj9yFWtre1pVgq1YnWZ6+ppj8FtKSl2C+v3
 nbfr5KefaE/RNys2wBRjfKV+Ye4T76USbZTNqlb3cdFL9poGL4g/HSnt2yXH+cwz5BP/
 zCuUWphgEvidWSTWkHMVv7PeaE3hB1BehPAO/uBeCX3U8n/TzoM1r3km9TfDsK3N5tU4
 rdvUg9GYvRqaYduSE5buPv7xiFjVT4ZHj7V77U3/EjFFoLOHbaudsPnPCgfXIXAibZ3g
 jcBg==
X-Gm-Message-State: AOAM53268r3hNeBKfmYuWg/vvxRR2+0iB+pPrIaHAh3wgkD4SHUJsyTF
 ZFSdvA3NHoGmIBntn+bPuQPVT1MtMNa2vQ==
X-Google-Smtp-Source: ABdhPJzec4EYvPJysrgzIQTarTD+OYu9lKETw9x2pOaRKywD1gaG3wVueyeb45BUJVc2Wsw+kZk0lhfH/C52Fw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:6411:0:b0:44c:bf9f:f584 with SMTP id
 y17-20020a626411000000b0044cbf9ff584mr31971260pfb.29.1635809036075; Mon, 01
 Nov 2021 16:23:56 -0700 (PDT)
Date: Mon,  1 Nov 2021 16:23:40 -0700
Message-Id: <20211101232346.1070813-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v3 0/6] Misc NPCM7XX patches
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3DHeAYQgKCg8B9wp387wv33v0t.r315t19-stAt0232v29.36v@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

This patch set contains a few bug fixes and I2C devices for some
NPCM7XX boards.

Patch 1~2 fix a problem that causes the SMBus module to behave
incorrectly when it's in FIFO mode and trying to receive more than
16 bytes at a time.

Patch 3 fixes a error in a register for ADC module.

Patch 4 makes the ADC input to be R/W instead of write only. It allows
a test system to read these via QMP and has no negative effect.

Patch 5 modifies at24c_eeprom_init in NPCM7xx boards so that it can fit
more use cases.

Patch 6 uses the function defined in patch 5 to add the EEPROM and other
I2C devices for Quanta GBS board.

-- Changes since v2:
1. Dropped patch 7.
2. Drop an extra variable in patch 5.

-- Changes since v1:
1. Rewrote patch 5 to implement the function in NPCM7xx board file instead
   of the EEPROM device file.
2. Slightly modify patch 6 to adapt to the changes and QEMU comment style.
3. Squash patch 7 into patch 5 to make it compile.
4. Add a new patch 7.

Hao Wu (5):
  hw/i2c: Clear ACK bit in NPCM7xx SMBus module
  hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX SMBus
  hw/adc: Fix CONV bit in NPCM7XX ADC CON register
  hw/adc: Make adci[*] R/W in NPCM7XX ADC
  hw/nvram: Update at24c EEPROM init function in NPCM7xx boards

Patrick Venture (1):
  hw/arm: quanta-gbs-bmc add i2c devices

 hw/adc/npcm7xx_adc.c           |  4 +-
 hw/arm/npcm7xx_boards.c        | 96 ++++++++++++++++++++--------------
 hw/i2c/npcm7xx_smbus.c         |  8 +--
 tests/qtest/npcm7xx_adc-test.c |  2 +-
 4 files changed, 65 insertions(+), 45 deletions(-)

-- 
2.33.1.1089.g2158813163f-goog


