Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0DF3054FE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 08:51:08 +0100 (CET)
Received: from localhost ([::1]:56942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4fbW-0007bp-UW
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 02:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l4fZP-0006Mi-Ki
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 02:48:55 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:35692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l4fZO-0008Ef-4g
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 02:48:55 -0500
Received: by mail-lf1-x12b.google.com with SMTP id u25so1358070lfc.2
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 23:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TXDoYnAQYQRDx7sHUB2TT4N/n0IyiResB3ytSYmOUo8=;
 b=f4DfyBqk04djEHwOqwZs7GpAJztoHcrx9Mk26np+JEF/BlcKQGe2s9+R50O7rNkn4Q
 RxKyRfqt7IG2K/5KfI6mszzSKpNRfKEW+yqrClwwetyp6MYOLRvO57Vl4wl+exHhzLy9
 /NH9LthXugDYo7mA4/j648Kt75iWHU4zT3kYhSX2fGh5ZtfyBeSi+ewZi9cSuwhVgq1b
 w5x63drlTSkOIrEgXKpg7J1XY4tf2KrFoM5d2hDG5WUdkOSwvWSAA6kVYPxp+Cy4Ep0J
 MadcAoVsPv7NHN/LCcuLRHHfCHYQVFlGP5GRM7gt2iGjBPsv25wPMD9puPlNHlp+2cx9
 W5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TXDoYnAQYQRDx7sHUB2TT4N/n0IyiResB3ytSYmOUo8=;
 b=WTjpipzkH9gGeoexHygFXiRogxdY7CmWOdYHwl8vEmy4Iw5EfDbdDVSqz9W2LdpRgN
 5TGCKzWgMXUBSzy3hF0lDTruzBkpNPF2gfbp4j0b9kY74EsHxnsuG4LECvteIz710VCQ
 eN3VVv0SmxRCTv6bywTUijDlHQLV5ORnUhMX6FrLyBoMKRncFuYV0+LimkQlkHvbOq/w
 vP7B6bJcMqNoMxW8rcs2XnVJ3iM7B9QXwHsFerGmTxv5sFvu36XdCXwoa6VvqJaYx4AC
 5f7VvkPrbBWOtGFeRJLs2jAxE4+fSvynVMKGsvdMB3MCU0G3g2uUmQSRBLr2k6+fC+t8
 kZMA==
X-Gm-Message-State: AOAM531s29rgpz/DeA30AgyG7/5DxNYLhY4lOqw0TrLUtSGRx6nw9BH+
 p8beavK/DSzMq/rPPWvgeHMLySMsgOI=
X-Google-Smtp-Source: ABdhPJxK7sF2218J6d84YyABSDA5/TVz/x7Z9UQ/99VXYRrYuf9GHBMWzcUUzO9JWDOMJ+SyAAu22w==
X-Received: by 2002:a19:c356:: with SMTP id t83mr4354859lff.484.1611733731721; 
 Tue, 26 Jan 2021 23:48:51 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id n6sm303945lfd.1.2021.01.26.23.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 23:48:50 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 0/3] Xilinx queue
Date: Wed, 27 Jan 2021 08:48:47 +0100
Message-Id: <20210127074850.1886235-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, joe.komlodi@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

The following changes since commit 9cd69f1a270235b652766f00b94114f48a2d603f:

  Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-01-25-1' into staging (2021-01-26 09:51:02 +0000)

are available in the Git repository at:

  git@github.com:edgarigl/qemu.git tags/edgar/xilinx-next-2021-01-27.for-upstream

for you to fetch changes up to 43a9ede1efd12d297278d017ce7df7130672e15d:

  target/microblaze: Add security attributes on memory transactions (2021-01-27 08:32:55 +0100)

----------------------------------------------------------------
For upstream

----------------------------------------------------------------

Joe Komlodi (3):
  target/microblaze: Add use-non-secure property
  target/microblaze: use MMUAccessType instead of int in mmu_translate
  target/microblaze: Add security attributes on memory transactions

 target/microblaze/cpu.h    | 14 ++++++++++-
 target/microblaze/mmu.h    |  2 +-
 target/microblaze/cpu.c    | 48 +++++++++++++++++++++++++++++++++++++-
 target/microblaze/helper.c | 26 ++++++++++++++++++---
 target/microblaze/mmu.c    |  2 +-
 5 files changed, 85 insertions(+), 7 deletions(-)

-- 
2.25.1


