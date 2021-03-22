Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85835344D29
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:22:53 +0100 (CET)
Received: from localhost ([::1]:42110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOGS-0003iZ-JF
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOAD-00073D-BI; Mon, 22 Mar 2021 13:16:26 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOA6-00008F-0e; Mon, 22 Mar 2021 13:16:22 -0400
Received: by mail-wr1-x433.google.com with SMTP id x13so17959337wrs.9;
 Mon, 22 Mar 2021 10:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UNjAo4F8CpPFJ2eTS3SHLp4CQ0XjZgKI4r04oHbnSB0=;
 b=fYRbP9yQWc1t6z7463HROhcjqBcZVhfAwqBfkDCxpgh36jvnqNmqXdfXqL6W2BGc7g
 sJkVnLXbrtvSsrtJnZ3L+xP1ElrNz5ikNFyZXv3/zTcocACKj4O1BGfTdthrWyIkl50r
 IRTGq49gF4BpnIHmU7wNPQrBGf2I2DS9cg+dh0R5cEZp7G4cCkU/GnSUvzh9EULqbWwJ
 z7ZGHE4rXHmjLUMfWIQAbl5OaXWaSvlsE1OR6wvKfjNVMHGAU/qV3I7CfkN9q+IbIX3c
 U+ZiWpTjsqxuNtrxdMpimT3TPW6TeRDgXo7fm4fv47etTPHDlFelEekyAyxtiAmw9mnX
 iDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=UNjAo4F8CpPFJ2eTS3SHLp4CQ0XjZgKI4r04oHbnSB0=;
 b=FKuSTpCKFJdeRmD/DbIMxCk0w1oCCeeV0RAK7XvQMge13WolSSyaVi8DTHPGkiD0WN
 yYc96nQqBvlHwQO1kY/Lb6SGPCUOsU3y1jVO60P+siHccspM1J1SDiOmp974L/qwwMYj
 55/7H8J4CoGoKMwehpHtvp8ku+2fxPkyyBYppKG5dIyG8s+HZTXD82AY4E/MjDhE4XHX
 RQPx2oGU28lIvryNcRaFxAjouFNNduZ6J2aEiJ6duX71RJshWh8IkwqlOjvT++w6ajkL
 HnPPypNFT1YR9Ujc9ChShaMgzdJ656EQ6yRO24IfnNOgmfV6iKMDvE4GCHwPD26Jko3M
 isiQ==
X-Gm-Message-State: AOAM531UhbaPyeC3tLUH0mGKM0yUQP4EJ8knZWguG49Sb+/1gYai+aF/
 P044qHzbROgLPAFKiSP4EHhobPnsSRkyWA==
X-Google-Smtp-Source: ABdhPJy11gyBnljQvVT/T6ktBRhAaFZfBkonyaGluwwkaftqUIqMCXD65sOJ+8+gw6ygJOYICs5aeg==
X-Received: by 2002:adf:e582:: with SMTP id l2mr548262wrm.207.1616433373425;
 Mon, 22 Mar 2021 10:16:13 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m11sm14352594wri.44.2021.03.22.10.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 10:16:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] SD/MMC patches for 2021-03-21
Date: Mon, 22 Mar 2021 18:16:03 +0100
Message-Id: <20210322171610.4183696-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Simon=20W=C3=B6rner?= <contact@simon-woerner.de>,
 Bin Meng <bin.meng@windriver.com>, Muhammad Alifa Ramdhan <info@starlabs.sg>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cornelius Aschermann <cornelius.aschermann@rub.de>,
 Sergej Schumilo <sergej@schumilo.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit b184750926812cb78ac0caf4c4b2b13683b5bde3=
:=0D
=0D
  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' int=
o staging (2021-03-22 11:24:55 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/sdmmc-20210322=0D
=0D
for you to fetch changes up to cffb446e8fd19a14e1634c7a3a8b07be3f01d5c9:=0D
=0D
  hw/sd: sdhci: Reset the data pointer of s->fifo_buffer[] when a different=
 block size is programmed (2021-03-22 16:56:22 +0100)=0D
=0D
----------------------------------------------------------------=0D
SD/MMC patches queue=0D
=0D
- Fix build error when DEBUG_SD is on=0D
- Perform SD ERASE operation=0D
- SDHCI ADMA heap buffer overflow=0D
  (CVE-2020-17380, CVE-2020-25085, CVE-2021-3409)=0D
----------------------------------------------------------------=0D
=0D
Bin Meng (7):=0D
  hw/sd: sd: Fix build error when DEBUG_SD is on=0D
  hw/sd: sd: Actually perform the erase operation=0D
  hw/sd: sdhci: Don't transfer any data when command time out=0D
  hw/sd: sdhci: Don't write to SDHC_SYSAD register when transfer is in=0D
    progress=0D
  hw/sd: sdhci: Correctly set the controller status for ADMA=0D
  hw/sd: sdhci: Limit block size only when SDHC_BLKSIZE register is=0D
    writable=0D
  hw/sd: sdhci: Reset the data pointer of s->fifo_buffer[] when a=0D
    different block size is programmed=0D
=0D
 hw/sd/sd.c    | 23 +++++++++++++---------=0D
 hw/sd/sdhci.c | 53 ++++++++++++++++++++++++++++++++++-----------------=0D
 2 files changed, 50 insertions(+), 26 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

