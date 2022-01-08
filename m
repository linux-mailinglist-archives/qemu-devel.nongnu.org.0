Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD2148868D
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 22:59:21 +0100 (CET)
Received: from localhost ([::1]:59276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Jk8-0003pm-Eu
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 16:59:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6JjB-0002OR-9M; Sat, 08 Jan 2022 16:58:21 -0500
Received: from [2a00:1450:4864:20::334] (port=36776
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6Jj9-0002SC-NW; Sat, 08 Jan 2022 16:58:21 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so7471264wmk.1; 
 Sat, 08 Jan 2022 13:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X8xt0YWpYw1gvU7AjTxcz7KxxOb/5ZWxdt4nb4B+aQ0=;
 b=PiZbjNwc5CTHTHdopFk8GVZh1R0dLqKMqYfayyB95LvHtCsa7pCv4HTxt0Y0LGnwf8
 GqEWdCNWnrGjzPFQEiIMgBglAzVfYhET2mWB7VQyyn9xzUEtGXAPE2W9hnR2vBD2j5qS
 G3soPq3GN7ykdeMWCktoSwyD+hsdL8jraYUpvRtpij1kIO4EeZbiOSXRlnWW7mknhOSn
 MfAAWvtpv0TYMu9b+GdwYYwgEfM/HZvy2D1aZtBIFV7k2DpPfiLmFSOoa/XyEhb02ifv
 /ImUZW3+FuY5wa7+pAj7ZPylvboNLNcDpHAlvopkySVq1GcUeqgnEEirhsv5RvCYUlwR
 lNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=X8xt0YWpYw1gvU7AjTxcz7KxxOb/5ZWxdt4nb4B+aQ0=;
 b=jw4ghdps/UxbhFDItHCRX1LsMlnl8I5TjKHMre4GcEf9UtBho4djMHKAL5LYMO29XP
 7BBcCceZeRkle9wwdwQ86+FvheX01Ysy6LflBlCvXlLt39nfuxYouXQIj5Le3kgeF/3V
 wWriYUYwjtOqCMNnu7Ws6bDI5V1nXCIhinjppIi6ahqTKGNxo1q59yrZvu2FyS5tizuG
 OeXGk37zMIKUpKuSp4d89IhMwds3m+e/c+4P/hN/exr+iMTYVL5kx8Z40YVuwE+73zDo
 Uh/ny4utqI2Uq+P9VFyeC6Lii8U/teGIC7R2pStcCrDDW8ILdutnh/NeYtNvOGlamHyd
 xJiA==
X-Gm-Message-State: AOAM532n5EVQ+Epu69aBSKzw0RnWfwfebnANxWZKTOpJXOtLTRrEE0m3
 NkJdWleCgvg0Lf4BuIav/zZVXnlPzrI6sQ==
X-Google-Smtp-Source: ABdhPJwDbMX/jsRzjsMsSFS/314skuY4oiK/67O7ULy4KlKuxpaI6k7L180sMzr8bzN0QWJIoBMNRg==
X-Received: by 2002:a1c:7517:: with SMTP id o23mr14212789wmc.120.1641679097899; 
 Sat, 08 Jan 2022 13:58:17 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id p13sm3021049wrs.54.2022.01.08.13.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 13:58:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] SD/MMC patches for 2022-01-08
Date: Sat,  8 Jan 2022 22:58:13 +0100
Message-Id: <20220108215815.551241-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

This is the SD/MMC PR that ought to be sent previously.

The following changes since commit b5a3d8bc9146ba22a25116cb748c97341bf99737:

  Merge tag 'pull-misc-20220103' of https://gitlab.com/rth7680/qemu into staging (2022-01-03 09:34:41 -0800)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/sdmmc-20220108

for you to fetch changes up to b66f73a0cb312c81470433dfd5275d2824bb89de:

  hw/sd: Add SDHC support for SD card SPI-mode (2022-01-04 08:50:28 +0100)

----------------------------------------------------------------
SD/MMC patches queue

- Add SDHC support for SD card SPI-mode (Frank Chang)

----------------------------------------------------------------

Frank Chang (1):
  hw/sd: Add SDHC support for SD card SPI-mode

Philippe Mathieu-Daudé (1):
  hw/sd/sdcard: Rename Write Protect Group variables

 hw/sd/sd.c | 52 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 21 deletions(-)

-- 
2.33.1


