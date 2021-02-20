Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F9832021E
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:15:08 +0100 (CET)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDFvO-0001j5-Lh
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFtc-00008j-E5; Fri, 19 Feb 2021 19:13:16 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFta-0005HV-JY; Fri, 19 Feb 2021 19:13:16 -0500
Received: by mail-ej1-x633.google.com with SMTP id hs11so16977543ejc.1;
 Fri, 19 Feb 2021 16:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhT02exn9uFMw4korQl/47x/FyxAQJolOeh+Gcu1cvo=;
 b=PqKtL2Mchr0m5mRb4/JBHc8BLQDcrTefWxOceW+yQAxRqtDHR094EatwFHAWbOQ83Q
 QEow2z6Voe/Li4Xu2Kb5SnmYu1C5snj1SfqFClmhQWsj57NpUYra/8wkn9z9MpXdeYty
 IY1/tP0z/TuZpjDCwro4n5pF0c2oApBYyVQTzlJpLNyK3hOYUiBgMKGW8x7jC6DgeF17
 Gdv1Kz4RDLe6KIqsOoUwUDJi7C8PB3PIjpcfnfP4PZu/lT8DF/O1EeivXvqi6Xh02VaH
 +AZhOZ64emfoSr9H6I4TPOywPIAHeuaCs4CbczgNY9PrUh0gI50k3j0ipYMdsp5gXmZa
 hjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rhT02exn9uFMw4korQl/47x/FyxAQJolOeh+Gcu1cvo=;
 b=oDjcJ6TQQ6LfRx2GxPcB+F82QsS5Kk5wAziyAaMBQ6EH5/s4yAhBwI4QFNge0nIxoA
 Ty0t3+N9Jt427+dbqP3EgPeCPGWjauf4XG6N2v0+L5sAFgU7oeEbFqldkZUOzvPkFGN7
 pJND+RNKc8VLzGE1/Db2J/l3/f0VLcS0QhK2mu135sUUXlKJrY5/Urwcl6ch//CrIyLz
 0xpbbxtkAWTkpo5cYq7hFBnjwdnqhOhcbZPsp6Jqj2l2WrWI0R609YVpIxv+q2UqKE47
 +UdaKi93ZmgnvfLDlFKYYQp1yc7bsxKOSpzE+tYXp/ep6kUZS8YGLPUDbOTOfsQPylwu
 8kuw==
X-Gm-Message-State: AOAM533Ywk4mRIAfJt9Qa6SjwxfBFwzKvKZQikmKCvHXNGMB51rTEAlV
 rwuPBaPg/BUhEPk5ewx/m2PzslUSkDs=
X-Google-Smtp-Source: ABdhPJxkR31jh6Sf+ToST6762TnJEakMPKgNb+6l4lT+qaFDzkCe8GCpnfWAe+PWghQl6unRlebhlg==
X-Received: by 2002:a17:907:2710:: with SMTP id
 w16mr9065002ejk.33.1613779991980; 
 Fri, 19 Feb 2021 16:13:11 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m19sm6032659eds.8.2021.02.19.16.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:13:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/18] SD/MMC patches for 2021-02-20
Date: Sat, 20 Feb 2021 01:12:51 +0100
Message-Id: <20210220001309.2225022-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e90ef02389dc8b57eaea22b290244609d720a8bf=
:=0D
=0D
  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-02-18' i=
nto staging (2021-02-19 17:22:42 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/philmd/qemu.git tags/sdmmc-20210220=0D
=0D
for you to fetch changes up to 3e0a7693be30d6a6eda8a56f3862ac2e502a9e81:=0D
=0D
  MAINTAINERS: Add Bin Meng as co-maintainer for SD/MMC cards (2021-02-20 0=
1:08:59 +0100)=0D
=0D
----------------------------------------------------------------=0D
SD/MMC patches=0D
=0D
- Various improvements for SD cards in SPI mode (Bin Meng)=0D
- Add Bin Meng as SD/MMC cards co-maintainer=0D
----------------------------------------------------------------=0D
=0D
Bin Meng (17):=0D
  hw/sd: ssi-sd: Support multiple block read=0D
  hw/sd: sd: Remove duplicated codes in single/multiple block read/write=0D
  hw/sd: sd: Allow single/multiple block write for SPI mode=0D
  hw/sd: Introduce receive_ready() callback=0D
  hw/sd: ssi-sd: Support single block write=0D
  hw/sd: ssi-sd: Support multiple block write=0D
  hw/sd: ssi-sd: Fix SEND_IF_COND (CMD8) response=0D
  hw/sd: ssi-sd: Fix STOP_TRANSMISSION (CMD12) response=0D
  hw/sd: ssi-sd: Handle the rest commands with R1b response type=0D
  hw/sd: sd: Fix address check in sd_erase()=0D
  hw/sd: sd: Only SDSC cards support CMD28/29/30=0D
  hw/sd: sd: Fix CMD30 response type=0D
  hw/sd: sd: Move the sd_block_{read, write} and macros ahead=0D
  hw/sd: sd: Skip write protect groups check in sd_erase() for high=0D
    capacity cards=0D
  hw/sd: sd: Skip write protect groups check in CMD24/25 for high=0D
    capacity cards=0D
  hw/sd: sd: Bypass the RCA check for CMD13 in SPI mode=0D
  hw/sd: sdhci: Simplify updating s->prnsts in=0D
    sdhci_sdma_transfer_multi_blocks()=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  MAINTAINERS: Add Bin Meng as co-maintainer for SD/MMC cards=0D
=0D
 include/hw/sd/sd.h |   2 +=0D
 hw/sd/core.c       |  13 ++++=0D
 hw/sd/sd.c         | 149 +++++++++++++++++++--------------------------=0D
 hw/sd/sdhci.c      |   7 +--=0D
 hw/sd/ssi-sd.c     | 136 +++++++++++++++++++++++++++++++++++------=0D
 MAINTAINERS        |   1 +=0D
 6 files changed, 199 insertions(+), 109 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

