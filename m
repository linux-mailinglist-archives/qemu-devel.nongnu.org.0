Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AB44C99FD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 01:43:05 +0100 (CET)
Received: from localhost ([::1]:36392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPD54-0007rN-CC
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 19:43:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3-bgeYgYKCvwxmxywvksskpi.gsquiqy-hiziprsrkry.svk@flex--titusr.bounces.google.com>)
 id 1nPCtt-00006i-VE
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:31:30 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=37455
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3-bgeYgYKCvwxmxywvksskpi.gsquiqy-hiziprsrkry.svk@flex--titusr.bounces.google.com>)
 id 1nPCts-0000Bc-6A
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:31:29 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 a22-20020a25ca16000000b006287c713265so67614ybg.4
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 16:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ZU70MnsXx5QEKl7LGYOTM+eEtk43gFNs3SNHJdPDM74=;
 b=qyJnG+fzhxSK6evyGEX+VUpdE1rgOCk/eOKjCPyOpxN1Y4pNj6JpHq1ih9V+cjJpS+
 kfsQu6tuc94IUIMTfGIAul3zCGweOz+2HoeqvN5z1ZtgiASkqgC1Jn8BvPpplxEbXUeA
 4SWHqL1y9vww78tFn6emGv2IupGf+1q9/XnqW7FnC5ZSv8HSYbtNmO7feuxykBTImjDi
 lw1yNh6BBIJQJSiuJpMUZmylk+n9JSqly2pxtvVanLFBkMqJX/ftz74PMHoi6geRw4Mb
 YCP4onen9wtM7NMCKarActA2Nmm7wH4mdGhY3IiFfKYUOqJpRjGVcWnTNXXhsVzLviC0
 0CxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ZU70MnsXx5QEKl7LGYOTM+eEtk43gFNs3SNHJdPDM74=;
 b=EcTlEoo/EJlAk1rhyz7OlaHSFtRQgrJi/4dw+jTxed/d16p9nGbQ8l7Tl/duVEw7cC
 z6UR9wIkY9ld2iCxlAa1gP6LtxH/JKCWYTvZzRDKwvBuMKxZF3wFfYBojaFP88PKDn9q
 +EkrgX+gREGe+80W0jFSo608E/JH7e/rFwVxppye6dh4CYy7oVIjXVQi9Oh/QFDvZFST
 LnLrD5b4WYtrQlup2U+gewhSdQqtWoUizzN1ioui+7hCyM9cVfR+o/9tRLKbCl6PMWIW
 rYWnKaCPqhRsx3PthJuq3rDul2XgSyDFiqXFiHH8I4lrbe51VxJ7D4TBnKonLBw4tKXe
 GMgQ==
X-Gm-Message-State: AOAM531ZeBohJw9wZl0TKYVxpV0f6oDRNnPwq7juT8eqjB38G4xCqQy2
 vi07KVUHRbzyXVoHvtrN+4htRgd8/pw=
X-Google-Smtp-Source: ABdhPJwxskuIjy0DuPKIwtNA4DNrQllBqopyFfgx4nFriCdggupOfQCsWJpcTRqQAf3nua5T7waRTqN+5Vg=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a81:918b:0:b0:2d6:5636:4594 with SMTP id
 i133-20020a81918b000000b002d656364594mr27857801ywg.72.1646180601426; Tue, 01
 Mar 2022 16:23:21 -0800 (PST)
Date: Tue,  1 Mar 2022 16:22:58 -0800
Message-Id: <20220302002307.1895616-1-titusr@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v2 0/9] Fixups for PMBus and new sensors
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3-bgeYgYKCvwxmxywvksskpi.gsquiqy-hiziprsrkry.svk@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

This patch series contains updates to PMBus in QEMU along with some PMBus
device models for Renesas regulators.
I have also added myself to MAINTAINERS as this code is in use daily,
where I am responsible for it.

v2:
  - split PMBus commit with updates into individual fixes
  - renamed isl_pmbus[.ch] adding _vr for voltage regulators

Shengtan Mao (1):
  hw/i2c: Added linear mode translation for pmbus devices

Titus Rwantare (8):
  hw/i2c: pmbus: add registers
  hw/i2c: pmbus: guard against out of range accesses
  hw/i2c: pmbus: add PEC unsupported warning
  hw/i2c: pmbus: refactor uint handling and update MAINTAINERS
  hw/sensor: add Intersil ISL69260 device model
  hw/sensor: add Renesas raa229004 PMBus device
  hw/sensor: add Renesas raa228000 device
  hw/sensor: rename isl_pmbus to isl_pmbus_vr

 MAINTAINERS                      |  13 +
 hw/arm/Kconfig                   |   1 +
 hw/i2c/pmbus_device.c            | 106 ++++++-
 hw/sensor/Kconfig                |   5 +
 hw/sensor/isl_pmbus_vr.c         | 279 ++++++++++++++++++
 hw/sensor/meson.build            |   1 +
 include/hw/i2c/pmbus_device.h    |  23 +-
 include/hw/sensor/isl_pmbus_vr.h |  52 ++++
 tests/qtest/isl_pmbus_vr-test.c  | 474 +++++++++++++++++++++++++++++++
 tests/qtest/meson.build          |   1 +
 10 files changed, 944 insertions(+), 11 deletions(-)
 create mode 100644 hw/sensor/isl_pmbus_vr.c
 create mode 100644 include/hw/sensor/isl_pmbus_vr.h
 create mode 100644 tests/qtest/isl_pmbus_vr-test.c

-- 
2.35.1.616.g0bdcbb4464-goog


