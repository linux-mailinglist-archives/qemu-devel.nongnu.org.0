Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538E9440A5B
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:08:38 +0200 (CEST)
Received: from localhost ([::1]:33326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgrqO-0003sU-Ua
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgroD-0001sW-Kx
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:06:22 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgroA-0004e0-Hy
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:06:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id d3so21600787wrh.8
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EFQVQK2LhQVJg5tfUz9V0qkHY45B8RtgxK1ddqJBTuA=;
 b=MKpM+VHMk6G0RbBHShNnE7ia4oHnLmqtKgUO12ptAkY34qvQV37FUCEU1RRejBrX7k
 imJW+MwWd8LBf0Axq9r9B8U0H0l9KHD5mD5vn2/QX4mPiGYzrkQGP0AeAqK1E5jgg7E0
 OxqiWFThV6vCNdkjlRkqlSN6XTbJpwv3Fsne1KqsSMn0XjsiG+WaZ/OUtDf5h1drdLpi
 jlGZCHtjdrCwc+jBq5za4Um5nt7F2VAjUajH0pU9/bj/QxLREGDHiWe8SUfMGVYEJp19
 qBeY1ETKQWzJ+wzacxm3IDD4jmqXxIHduhadddzTw+kmnEB3V96pvZrd5E6/dO2a46IN
 TWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=EFQVQK2LhQVJg5tfUz9V0qkHY45B8RtgxK1ddqJBTuA=;
 b=c2+5+usZdwwV5A1/h2p6zZ8V9V4WOgC/Qs+37BiEPSqLebVfzl1/1ziushlX2j4+1/
 ZiKtRMA75aPXJzpr8YawACkmiTwH02lCKg2C2JdSNiSPLl6nU/i0BwpsTJwG6yn1v9bR
 h5MfkRcl8wiqj+yr/rNcdteuJjoVPPH0KPWttXJ9zQsCcptgWYtyou59gQXs1V/I/M2k
 NpJqFE/EEAksUwzwGDjffRXOBKMce81IDWPvI/MMr1JJM5xdyCydktgNNhZ2lhH1hf+A
 wg240W2naxebqVw7nH+PDtgtx5Qkady742Cnm9Ua/WwL6TTTpRcOOj6bv2/GDj8cDs1s
 9Ytw==
X-Gm-Message-State: AOAM5311UksMysLTqJ4BpcC8Geaz8z7VT9KJEcot4kyboUZamE0SP3oZ
 jAdEIXxq+dmyG4V5forVFMeJwMx8Tdk=
X-Google-Smtp-Source: ABdhPJxhBgPMEIBakQXd4aOfmu6RVySNzY8TeyBMWItMH4nTU3C0z7v60TIGMn9NrYkohoP6GKzW7g==
X-Received: by 2002:adf:ca03:: with SMTP id o3mr24157078wrh.424.1635613576899; 
 Sat, 30 Oct 2021 10:06:16 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 m15sm7893260wmq.0.2021.10.30.10.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:06:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/30] Renesas SH-4 patches for 2021-10-30
Date: Sat, 30 Oct 2021 19:05:45 +0200
Message-Id: <20211030170615.2636436-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit dd61b91c080cdfba1360a5ea1e4693fffb3445b0=
:=0D
=0D
  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-10-29' i=
nto staging (2021-10-29 19:42:36 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/renesas-20211030=0D
=0D
for you to fetch changes up to 46e44759fc24a05e338cd37a735b4aad5422e717:=0D
=0D
  hw/timer/sh_timer: Remove use of hw_error (2021-10-30 18:39:37 +0200)=0D
=0D
----------------------------------------------------------------=0D
Renesas SH-4 patches queue=0D
=0D
Patches from Zoltan:=0D
- Various clean up to align the code style with the rest of the code base=0D
- QOM'ify the SH_SERIAL device=0D
- Modify few memory region size to better match the hardware manual=0D
=0D
----------------------------------------------------------------=0D
=0D
BALATON Zoltan (30):=0D
  hw/sh4: Coding style: Remove tabs=0D
  hw/sh4: Coding style: Fix multi-line comments=0D
  hw/sh4: Coding style: White space fixes=0D
  hw/sh4: Coding style: Add missing braces=0D
  hw/sh4: Coding style: Remove unnecessary casts=0D
  hw/sh4: Fix typos in a comment=0D
  hw/sh4: Change debug printfs to traces=0D
  hw/sh4/r2d: Use error_report instead of fprintf to stderr=0D
  hw/char/sh_serial: Do not abort on invalid access=0D
  hw/char/sh_serial: Rename type sh_serial_state to SHSerialState=0D
  hw/char/sh_serial: Embed QEMUTimer in state struct=0D
  hw/char/sh_serial: Split off sh_serial_reset() from sh_serial_init()=0D
  hw/char/sh_serial: QOM-ify=0D
  hw/char/sh_serial: Add device id to trace output=0D
  hw/intc/sh_intc: Use existing macro instead of local one=0D
  hw/intc/sh_intc: Turn some defines into an enum=0D
  hw/intc/sh_intc: Rename iomem region=0D
  hw/intc/sh_intc: Drop another useless macro=0D
  hw/intc/sh_intc: Move sh_intc_register() closer to its only user=0D
  hw/intc/sh_intc: Remove excessive parenthesis=0D
  hw/intc/sh_intc: Use array index instead of pointer arithmetics=0D
  hw/intc/sh_intc: Inline and drop sh_intc_source() function=0D
  hw/intc/sh_intc: Replace abort() with g_assert_not_reached()=0D
  hw/intc/sh_intc: Avoid using continue in loops=0D
  hw/intc/sh_intc: Simplify allocating sources array=0D
  hw/intc/sh_intc: Remove unneeded local variable initialisers=0D
  hw/timer/sh_timer: Rename sh_timer_state to SHTimerState=0D
  hw/timer/sh_timer: Do not wrap lines that are not too long=0D
  hw/timer/sh_timer: Fix timer memory region size=0D
  hw/timer/sh_timer: Remove use of hw_error=0D
=0D
 meson.build              |    1 +=0D
 hw/sh4/sh7750_regs.h     | 1528 +++++++++++++++++++-------------------=0D
 hw/sh4/trace.h           |    1 +=0D
 include/hw/sh4/sh.h      |   19 +-=0D
 include/hw/sh4/sh_intc.h |    2 +-=0D
 hw/char/sh_serial.c      |  232 +++---=0D
 hw/intc/sh_intc.c        |  573 +++++++-------=0D
 hw/pci-host/sh_pci.c     |   10 +-=0D
 hw/sh4/r2d.c             |   69 +-=0D
 hw/sh4/sh7750.c          |  631 ++++++++--------=0D
 hw/sh4/sh7750_regnames.c |  148 ++--=0D
 hw/sh4/shix.c            |   12 +-=0D
 hw/timer/sh_timer.c      |  151 ++--=0D
 hw/char/trace-events     |    4 +=0D
 hw/intc/trace-events     |    8 +=0D
 hw/sh4/trace-events      |    3 +=0D
 hw/timer/trace-events    |    5 +=0D
 17 files changed, 1713 insertions(+), 1684 deletions(-)=0D
 create mode 100644 hw/sh4/trace.h=0D
 create mode 100644 hw/sh4/trace-events=0D
=0D
-- =0D
2.31.1=0D
=0D

