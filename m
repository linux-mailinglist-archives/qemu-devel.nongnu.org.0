Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB76301EA3
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:13:18 +0100 (CET)
Received: from localhost ([::1]:37700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3ll7-0004AP-W0
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:13:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3lj6-0002Gd-QZ; Sun, 24 Jan 2021 15:11:12 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3lj5-0007yy-6P; Sun, 24 Jan 2021 15:11:12 -0500
Received: by mail-wm1-x32b.google.com with SMTP id y187so8960480wmd.3;
 Sun, 24 Jan 2021 12:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ID5Kq+TkonDsdI+egmyclkJ1QmFuPGVY25or1gZhcY=;
 b=Otiyj1neGjFiR163XdkgjpvfXbY/2nPdJKrpVgfp/BgS5FbbTrbOw5GcgRhHcEVhEP
 k81owazrXOlRHkjLcXn1QSqLR31PJKlkzyjwCBbfWJhXwKATPCnAneaMddkphJ/q8B6O
 wskAU2w2SPTVJIZvsiq2b4Pc2S4pZtX/yxYzDA955sKz/Wnk52wOKJW/5Renj/shY+af
 Qo602x86LW4u2b3MUwZ2mz2IrXURWVqfQSXZavNwp+Q3zWuGmx6PgekAYaC/rC9lzsxI
 CK/jdoMNeaL2Ve7aw3bp1L8EBndpQ4uqHbb2G77Tud9L5MNTQLfSqj1CogMvYUUwHIXr
 YLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=0ID5Kq+TkonDsdI+egmyclkJ1QmFuPGVY25or1gZhcY=;
 b=jhKyZp9j6IcZWb2562ADNSiVGmNGnQEtYchvtWfM5aCg3EWITOyY4+/Pm0PnMNJgaG
 XwQVGn8V60o+UeUdlb+GLeGcP+4QDCC31f1sh1P71DF4N20Z49DPts2uLDHRK61s8ikr
 bUCTEu6dS1gOfTsGCjXODrtjNzc+C7BIpxXDZEu3pnLBdiWM4pAx8BvlNTPTV298b8i5
 hchvTrkTh8W2nuR7oaL+a5B7vnPQNItsDFPgDrYaQD0r3yWHroj4zu4uUrcYwze0QEtQ
 zPHP8ovfx4ZfQM2/Sn4unzX6EWUZWVL3ynFjP258AM/H0o3CThgBwM/BMTMRqTq4gnNh
 n6qg==
X-Gm-Message-State: AOAM5306eV3OvWJcEs0RAkXFuCwk3MkPI5FWY4cyed1rRVFS+I4EW7aA
 B2rdYyX+rBNKSJxeJWRK5/B6/wGnhiA=
X-Google-Smtp-Source: ABdhPJxiJA11Tuj/nxcBeReUiMFvo6ENE4gK474LFpOYH4syU7LQRJj91GGA13emQ4IzYQkWckXaxA==
X-Received: by 2002:a1c:68d5:: with SMTP id
 d204mr12861293wmc.178.1611519069042; 
 Sun, 24 Jan 2021 12:11:09 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id j2sm19168461wrh.78.2021.01.24.12.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:11:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] SD/MMC patches for 2021-01-24
Date: Sun, 24 Jan 2021 21:10:57 +0100
Message-Id: <20210124201106.2602238-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e93c65a6c64fa18b0c61fb9338d364cbea32b6ef=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210122-pull-reque=
st' into staging (2021-01-23 14:40:45 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/philmd/qemu.git tags/sdmmc-20210124=0D
=0D
for you to fetch changes up to 3f20ccd359913013723f64e2443dd513786039f6:=0D
=0D
  hw/sd: sd.h: Cosmetic change of using spaces (2021-01-24 20:11:05 +0100)=
=0D
=0D
----------------------------------------------------------------=0D
SD/MMC patches=0D
=0D
- Various improvements for SD cards in SPI mode (Bin Meng)=0D
=0D
----------------------------------------------------------------=0D
=0D
Bin Meng (9):=0D
  hw/sd: ssi-sd: Fix incorrect card response sequence=0D
  hw/sd: sd: Support CMD59 for SPI mode=0D
  hw/sd: sd: Drop sd_crc16()=0D
  util: Add CRC16 (CCITT) calculation routines=0D
  hw/sd: ssi-sd: Suffix a data block with CRC16=0D
  hw/sd: ssi-sd: Add a state representing Nac=0D
  hw/sd: ssi-sd: Fix the wrong command index for STOP_TRANSMISSION=0D
  hw/sd: ssi-sd: Use macros for the dummy value and tokens in the=0D
    transfer=0D
  hw/sd: sd.h: Cosmetic change of using spaces=0D
=0D
 include/hw/sd/sd.h       |  42 ++++++-------=0D
 include/qemu/crc-ccitt.h |  33 ++++++++++=0D
 hw/sd/sd.c               |  26 +-------=0D
 hw/sd/ssi-sd.c           |  59 ++++++++++++++----=0D
 util/crc-ccitt.c         | 127 +++++++++++++++++++++++++++++++++++++++=0D
 util/meson.build         |   1 +=0D
 6 files changed, 229 insertions(+), 59 deletions(-)=0D
 create mode 100644 include/qemu/crc-ccitt.h=0D
 create mode 100644 util/crc-ccitt.c=0D
=0D
-- =0D
2.26.2=0D
=0D

