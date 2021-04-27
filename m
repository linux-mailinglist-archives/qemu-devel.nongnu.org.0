Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2470436CBA5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 21:29:07 +0200 (CEST)
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbTOL-0003ba-O2
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 15:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbTMO-0002gN-7c
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:27:04 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbTMM-0008QY-R8
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:27:03 -0400
Received: by mail-wr1-x434.google.com with SMTP id x7so60559984wrw.10
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 12:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8/zyPaXhI+Qt5MdcCmG2gCC6LSJvpjKq+XMHPX6polw=;
 b=kRMoNH+M1vSYJuoWrvCuJfjn3bkyfB9CmZlrwPfzqXEvn9GVkAuDScLpAC8Sqxo6j9
 8tegLDAaz4HRYx3J4Awj7jP567ezrOx+N22jRrzBWs5ODBZJ6lxkfJN72MhLi9596P2r
 9TBSJWiMWqu+X7Ur+QY3JcGw7Mqh/8I1aIWRbwIQvjpsgNUbRTIcsFtzmavEDE6cs004
 Pl57YTEJ13ryie1Lat+hDXsyTgWIT4HUL3YePXUg/lYZRbDFOBTDfTpIImj81wE8g0b9
 r7A8eK/q2TKpVFq+GsZCexA8ngNVA1U+7pv4sVm/c9h4N8XXW2AirN+kyi6YxdFfJMd8
 Oniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=8/zyPaXhI+Qt5MdcCmG2gCC6LSJvpjKq+XMHPX6polw=;
 b=O1jmmGR0y+czx3Z6u1nTuArYUJfKboOKRWoeVzIM0N+NGIki3C8pRuPy0mq7qXmn9l
 /jjFZSlAPrQsNKinMJa/siCrySs45dJZY8r45GqtvYYwffHOvI85UGw6JAHVUXhYj2Wl
 doqQZKZE0bX0B5AYZg44rEoOyzffg3A2RDKjsQaIkNch7QESqW35rkIyX4idKsehpPac
 SynH3OHNc8BBXodaBA9OmAnBc9SrYZ3I1mOm5SRPQdzHn3StRsnO4U+nQ95Y1TzRlUQ9
 2qvhgjbhlSGrhYDyN+1N0oj05SJevgdbQ43nuJepjjtiO/ZJIXFm7FE5fZ2a4wtJQBwD
 7eYQ==
X-Gm-Message-State: AOAM532EEVIqRWkXGAib2ixaxWF5nNo2Z8U0xxsYW5yufsSL7C0GZFuN
 WnndEZYtL0BgmWrhyGimh3S+daUwv7Yqow==
X-Google-Smtp-Source: ABdhPJwQ1YxKDx8g76riVzV6OhAX0EpQ0zTckQfR/kPei1x8DElaDlHIblYseFGXbVAQBc8PFa1mhw==
X-Received: by 2002:a5d:650d:: with SMTP id x13mr31219996wru.264.1619551621059; 
 Tue, 27 Apr 2021 12:27:01 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u6sm861826wml.6.2021.04.27.12.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 12:27:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/sparc: Kconfig fixes to build with/without the leon3
 machine
Date: Tue, 27 Apr 2021 21:26:56 +0200
Message-Id: <20210427192658.266933-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/sparc: Allow building the leon3 machine stand-alone=0D
  hw/sparc: Allow building without the leon3 machine=0D
=0D
 target/sparc/cpu.h          |  6 ----=0D
 hw/sparc/irq.c              | 61 +++++++++++++++++++++++++++++++++++++=0D
 hw/sparc/leon3.c            | 37 +++++++++++++++++++++-=0D
 hw/sparc/sun4m.c            | 32 -------------------=0D
 target/sparc/int32_helper.c | 37 ----------------------=0D
 hw/sparc/meson.build        |  1 +=0D
 hw/sparc/trace-events       |  2 ++=0D
 target/sparc/trace-events   |  4 ---=0D
 8 files changed, 100 insertions(+), 80 deletions(-)=0D
 create mode 100644 hw/sparc/irq.c=0D
=0D
-- =0D
2.26.3=0D
=0D

