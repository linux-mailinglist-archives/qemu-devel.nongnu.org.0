Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DBD3DF2F2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 18:41:43 +0200 (CEST)
Received: from localhost ([::1]:39046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAxU6-0002G8-CE
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 12:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3RnEJYQUKCl0NOH5JBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--stmao.bounces.google.com>)
 id 1mAxS6-0000nG-Cb
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 12:39:38 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:40696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3RnEJYQUKCl0NOH5JBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--stmao.bounces.google.com>)
 id 1mAxS4-0003Cw-PA
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 12:39:38 -0400
Received: by mail-qk1-x74a.google.com with SMTP id
 h5-20020a05620a0525b02903b861bec838so17453490qkh.7
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 09:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=mQ7bK7+sKq3F9+DQvIqgIXSNNsyVsO+4TuhwVfhuGdM=;
 b=k/Ob+NzmcKC+tsTKuZUMdymjdcTQaNHUM4u3HKdLjOATt1yULJHMqHf+feON6deyJr
 6wnZ19BYJdX3vlBoKsb4cXY1EKWUIssMOCvcwp9Cg3CQj11rweGDqiOTh8nyn8ZJ2+FU
 KUSEUTRn8IpcOaFPE3pKmqNwGZkg3fBEiGOTdUHdqdLDXFpA/yd3fVCYdUUQhseqOVdx
 DheguMMR4ucZyznkG4lVV6+cktXufPBCXKYjhxSJpZNo3ziTHq3IyHbCFeXLzdF+Jyjy
 QnJLfXgnZEkKG1XhiOL0xor4PgVEdqx0z43EpzIWgB4A/GWaF3Z3x6YGB27MmlCcMBe6
 6Btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=mQ7bK7+sKq3F9+DQvIqgIXSNNsyVsO+4TuhwVfhuGdM=;
 b=sOX4pMwCy1Y6gtWx8nusjk7Y1tq8PtfdhMGfPvF+pQGdG7acY9KR2H8MJvx/Cyp/QG
 FWCzSYkHiR+CKeTRimp8e2IZ0HSgpXgGm17ngGNZna8WSmJCL5h5vNcZjs6rpsPCHDVs
 LTGfIJr0qbMqPzA2CECB309hdtE/Tr3oCTYKP9gHcSB6+Ioq1mOGRJG9Vu1+IOQcdSUr
 npy3MzZZXysy7no6QyWGYp6EZYggxnS88WzC/xSc8nKvE9dTIzxcvhHota4GJjXZXncD
 OdTbbzj/cs4SJU12EhHKXXioQ4mbth2zs1yZMnDrvfWb9LUqSDzfbIZRt4ECYsJjd/Vx
 mqjg==
X-Gm-Message-State: AOAM531SjkrZjnI1BsRVjrEGC+gC9hkDl8EH9pYyw0vSWCKUYopl0+Re
 RZgoDXQz/DeB2yx8bj0sxQmqBc2wQQ==
X-Google-Smtp-Source: ABdhPJyOA5BrqxiaCMjerFeGE/9sSafYL3Dg75whjRFfiOplz+0kXtoX1VuclduJvBDwVpF3QBQ12sGqQw==
X-Received: from smvm.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2d5f])
 (user=stmao job=sendgmr) by 2002:a05:6214:2481:: with SMTP id
 gi1mr22195907qvb.35.1628008774974; Tue, 03 Aug 2021 09:39:34 -0700 (PDT)
Date: Tue,  3 Aug 2021 16:39:12 +0000
Message-Id: <20210803163913.1302164-1-stmao@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v3 0/1] Add remote I2C device to support external I2C device
From: Shengtan Mao <stmao@google.com>
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, crauer@google.com, 
 wuhaotsh@google.com, venture@google.com, maoshengtan2011@gmail.com, 
 Shengtan Mao <stmao@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3RnEJYQUKCl0NOH5JBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--stmao.bounces.google.com;
 helo=mail-qk1-x74a.google.com
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

This patch implements the remote I2C device.
The remote I2C device allows an external I2C device to communicate with the I2C controller in QEMU through the remote I2C protocol.
Users no longer have to directly modify QEMU to add new I2C devices and can instead implement the emulated device externally and connect it to the remote I2C device.

Previous work by Wolfram Sang (https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=i2c-passthrough) was referenced.
It shares the similar idea of redirecting the actual I2C device functionalities, but Sang focuses on physical devices, and we focus on emulated devices.
The work by Sang mainly utilizes file descriptors while ours utilizes character devices, which offers better support for emulated devices.
The work by Sang is not meant to offer full I2C device support; it only implements the receive functionality.
Our work implements full support for I2C devices: send, recv, and event (match_and_add is not applicable for external devices).

v1 -> v2
    fixed terminology errors in the description comments.

v2 -> v3
    corrected patch set emailing errors.

Shengtan Mao (1):
  hw/i2c: add remote I2C device

 hw/arm/Kconfig                |   1 +
 hw/i2c/Kconfig                |   4 +
 hw/i2c/meson.build            |   1 +
 hw/i2c/remote-i2c.c           | 117 ++++++++++++++++++
 tests/qtest/meson.build       |   1 +
 tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++++++++
 6 files changed, 340 insertions(+)
 create mode 100644 hw/i2c/remote-i2c.c
 create mode 100644 tests/qtest/remote-i2c-test.c

-- 
2.32.0.554.ge1b32706d8-goog


