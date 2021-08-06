Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85363E3233
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 01:50:35 +0200 (CEST)
Received: from localhost ([::1]:41046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC9bl-000742-MG
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 19:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gcoNYQUKClwMNG4IAIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--stmao.bounces.google.com>)
 id 1mC9af-0005Lu-Um
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 19:49:25 -0400
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a]:40629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gcoNYQUKClwMNG4IAIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--stmao.bounces.google.com>)
 id 1mC9ad-0002qu-Bg
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 19:49:25 -0400
Received: by mail-qv1-xf4a.google.com with SMTP id
 k7-20020ad453c70000b02902f36ca6afdcso3220789qvv.7
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 16:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=IlWXFMCa0UMgwIUaqgru3sFdgAucXJ3aH12PDRfT6H0=;
 b=TFE4bTtlMnFUHaFi70DEOFaabTsq0uj0ybz1GrScuyx+8Cw6sRxiWIk/uHg3fXV/0A
 +JGSU8kOiO2ihdQZR6cBxe1r/q81+iwxZI78it6YSj9KTH6/lSAh5xplO3IcsqMJ5QmB
 afSxIZbmG45bXEYoWEsewxYz0h7GJqjnrvx7rFQVl/LRyRmbt9CBhwsd6PD9PlnocoO5
 /qjuvVgkpBK+9NqBXphud+fhMKzBQI4qoH2HvVzx04AJh+sBNi2M3te8vkOYQ5q3Q1jI
 PhXzqcag0l0aSIZCI1Kst1K4ANXgL/+PBp1BrhK56Ncy09v4KVna/ekdjtr9UQ/idzfT
 kTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=IlWXFMCa0UMgwIUaqgru3sFdgAucXJ3aH12PDRfT6H0=;
 b=tckD0959Zx3sp3np7wdqu9axBT+WH/fhcw38Cqf09RZfGFQu5Vtj3QKfe/ejf+JzRr
 47bzgK/CB7KCOaf0RRFDGSBltV0gjulPq/2NTYHSXvyZQyHrKSEGR881HrF+M3OA1i+o
 7qJR1v3U6XqtYr8tZtx/SlIe4wja6A1oItR7YkCsy+zteFadLbTqZlNvJ1587wFEHm4E
 PwgA9BbT0yMrtU1UzD1Mmd+BaHCDGpuD5PhAZHzsFN6kl9BwafmEobboy1LMW5JKk1Ef
 YMsyRmJmRdqRCGtdN1/+hypaqp+lTVNlRKewTPLvRtXPvmkNeZn45cf9Ixykz+msh7Um
 2a6A==
X-Gm-Message-State: AOAM533vYg5dyqiP2I6LbxuBGg64MejgvboLko/ZzEM/FuBD2sbxlpn7
 ofU0sbh2QMb1HTX6UCSsX3jMqK13Hw==
X-Google-Smtp-Source: ABdhPJyFPQk25Z8vJ8mzC/y+/nuGxBiAqjJ9qnZd4BwpQRrl2gUPNzj9D/mpTmN4QlC+UzQsYByTomsZzQ==
X-Received: from smvm.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2d5f])
 (user=stmao job=sendgmr) by 2002:a05:6214:2428:: with SMTP id
 gy8mr2492492qvb.49.1628293761235; Fri, 06 Aug 2021 16:49:21 -0700 (PDT)
Date: Fri,  6 Aug 2021 23:49:16 +0000
Message-Id: <20210806234918.122457-1-stmao@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v4 0/2] Add remote I2C device to support external I2C device
From: Shengtan Mao <stmao@google.com>
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, crauer@google.com, 
 wuhaotsh@google.com, venture@google.com, maoshengtan2011@gmail.com, 
 Shengtan Mao <stmao@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=3gcoNYQUKClwMNG4IAIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--stmao.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

This patch implements the remote I2C device.  The remote I2C device allows an
external I2C device to communicate with the I2C controller in QEMU through the
remote I2C protocol.  Users no longer have to directly modify QEMU to add new
I2C devices and can instead implement the emulated device externally and
connect it to the remote I2C device.

Previous work by Wolfram Sang
(https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=i2c-passthrough)
was referenced.  It shares the similar idea of redirecting the actual I2C device
functionalities, but Sang focuses on physical devices, and we focus on emulated devices.
The work by Sang mainly utilizes file descriptors while ours utilizes character
devices, which offers better support for emulated devices. The work by Sang is
not meant to offer full I2C device support; it only implements the receive
functionality.  Our work implements full support for I2C devices: send, recv,
and event (match_and_add is not applicable for external devices).

v1 -> v2
    fixed terminology errors in the description comments.
v2 -> v3
    corrected patch set emailing errors.
v3 -> v4
    added remote I2C protocol description in docs/specs

Shengtan Mao (2):
  hw/i2c: add remote I2C device
  docs/specs: add remote i2c docs

 docs/specs/index.rst          |   1 +
 docs/specs/remote-i2c.rst     |  51 ++++++++
 hw/arm/Kconfig                |   1 +
 hw/i2c/Kconfig                |   4 +
 hw/i2c/meson.build            |   1 +
 hw/i2c/remote-i2c.c           | 117 ++++++++++++++++++
 tests/qtest/meson.build       |   1 +
 tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++++++++
 8 files changed, 392 insertions(+)
 create mode 100644 docs/specs/remote-i2c.rst
 create mode 100644 hw/i2c/remote-i2c.c
 create mode 100644 tests/qtest/remote-i2c-test.c

-- 
2.32.0.605.g8dce9f2422-goog


