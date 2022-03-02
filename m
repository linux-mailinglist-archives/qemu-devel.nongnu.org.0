Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930B54C9AD8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 03:02:43 +0100 (CET)
Received: from localhost ([::1]:56780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPEKA-00034w-MK
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 21:02:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hM0eYgYKCrEkZkljiXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--titusr.bounces.google.com>)
 id 1nPEG8-0000XN-O8
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:58:32 -0500
Received: from [2607:f8b0:4864:20::114a] (port=45476
 helo=mail-yw1-x114a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hM0eYgYKCrEkZkljiXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--titusr.bounces.google.com>)
 id 1nPEG7-0008CW-Bp
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:58:32 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-2d07ae11467so1721357b3.12
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 17:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=myjcARcgVaqRTXq5PFEdPinnf6fzxQhBTPRXxxbCglI=;
 b=JeH/9ng8GA7ZvJ8ePu6jO5j7DsVnzv/sae0wSe6gSWirvRuY1XWLE2mXSmGNW0rvan
 G7IUa1+WVhRbCkoOinLPK8OY/zUwuMLClteSFqARE4ipqOGv3ght+rQUfxJnNcFyw6O0
 ShZ7TF8wsmC8TlUQ3Z4CqpmHTD4ZLB6XvAoFvbGt2fc69Upu0RNjqHl4wRuxIlXVqYLR
 z6XNKNRdsTqNqTCATlStgBt5h9qAy1pFfWMve8flCE9eDZ0W9rR2lO4rjrSoYosfAx8g
 xor3NXHCAiKZItY6VqS2o8RmfuzxDgD/y7FrhzdXbBapPmYi7aQ36AajkiCgY9MbgOuT
 LVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=myjcARcgVaqRTXq5PFEdPinnf6fzxQhBTPRXxxbCglI=;
 b=6r6si6UY7yQJN10ZfSXIoOS9Jq3pcss4SP+tc2GV0VbHasQhNrB4khJTu6EHcJEuIG
 FIf2mLebiT+gX8CQXxPSbYc2MFd4abRLAxCDmqMzgH0Gk+ABonOF5j8xfXzc5S+ft06c
 9QpZ4X3G7KIiDXt36kPB3qEXQZ15fXSUKVX9rL+GiKh1myPRWmNnGKMBoR8QnM14BvHc
 AcAN/CqnSjAqr+DNGeJSEL5k0jorzhbTVnYg35bAAxEhuIlhdgPPXaPU5OPp/4kNaPjJ
 u0uj1Iqu4Mr9baS6mspEJFceFo2yv+PKUcTs9ed7ep8TwiEEiCavqV1lw7Ht6rIOwCuZ
 sBhQ==
X-Gm-Message-State: AOAM530gxEGjhoru7yAMloJk9m4h//Jsua5LRdYWjS/LBe/l4aottZiz
 sSQgslSlZM8rAY8sJn7ZJA1mzVhpgYA=
X-Google-Smtp-Source: ABdhPJy6mJ8k3C8u4CjMjxLZbvquEzaO0uzIawC6YOFHjDq0aFJjwTdBOtVQMA+tSE7SbIzTw22k1jzRSdQ=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a25:8c86:0:b0:628:a042:9529 with SMTP id
 m6-20020a258c86000000b00628a0429529mr433572ybl.231.1646185860876; Tue, 01 Mar
 2022 17:51:00 -0800 (PST)
Date: Tue,  1 Mar 2022 17:50:44 -0800
Message-Id: <20220302015053.1984165-1-titusr@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v3 0/9] This patch series contains updates to PMBus in QEMU
 along with some PMBus device models for Renesas regulators. I have also added
 myself to MAINTAINERS as this code is in use daily, where I am responsible
 for it.
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::114a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3hM0eYgYKCrEkZkljiXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--titusr.bounces.google.com;
 helo=mail-yw1-x114a.google.com
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

v2:
  - split PMBus commit with updates into individual fixes
  - renamed isl_pmbus[.ch] adding _vr for voltage regulators

v3:
  - split uint refactor commit and removed commit renaming files
  - rename rolled into preceding commits
  - update commit description for uint refactoring change

Shengtan Mao (1):
  hw/i2c: Added linear mode translation for pmbus devices

Titus Rwantare (8):
  hw/i2c: pmbus: add registers
  hw/i2c: pmbus: guard against out of range accesses
  hw/i2c: pmbus: add PEC unsupported warning
  hw/i2c: pmbus: refactor uint handling
  hw/i2c: pmbus: update MAINTAINERS
  hw/sensor: add Intersil ISL69260 device model
  hw/sensor: add Renesas raa229004 PMBus device
  hw/sensor: add Renesas raa228000 device

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


