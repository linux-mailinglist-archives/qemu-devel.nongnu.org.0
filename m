Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0DC4D083F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 21:20:55 +0100 (CET)
Received: from localhost ([::1]:36782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJqg-0001Mq-Aj
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 15:20:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <31WUmYgYKClID2DECB08805y.w86Ay6E-xyFy578707E.8B0@flex--titusr.bounces.google.com>)
 id 1nRJkr-0000S6-A9
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:14:53 -0500
Received: from [2607:f8b0:4864:20::34a] (port=47790
 helo=mail-ot1-x34a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <31WUmYgYKClID2DECB08805y.w86Ay6E-xyFy578707E.8B0@flex--titusr.bounces.google.com>)
 id 1nRJkp-00075E-OQ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:14:53 -0500
Received: by mail-ot1-x34a.google.com with SMTP id
 b19-20020a056830105300b005b23d3eb1daso1898911otp.14
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 12:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ED0XesU2EOorz+/tkc1bsLG8fKPtIRFenTTRv8zMjw0=;
 b=KBzld8kBnZKY26jrShM62gFJYsFBqztoNHuVwoI0Qxmmk/hyUAivAUgEIA/0fpjELB
 +FfUyp0r4w4Y9DzKxaXyBgUu6Bjn9ye/FkrhptBJ16TAvNs1vW0KOd/+e7VmABETWVWT
 TT6/A7at90b8KZXuH3uIFp9L0sbykUu99UPGXXoOKwcefD1F1eJDvhI8KD6TdZR8+xCL
 Sprej8n2VXOs3SBnKhUvV39OO6o6XdvA1rT1hnuRikHnOujw1yX5vjcRtcxINGR8cYfI
 zJFEyT1fWzjCrXo59uorrjMf40sYRT62vwH+ucFUfN5qUjConzN1o4d1WcsgLQCeoir6
 Ci1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ED0XesU2EOorz+/tkc1bsLG8fKPtIRFenTTRv8zMjw0=;
 b=Vamki4FAWC2vZptqg+v9Z41qFqHn13tRJOIUtWPZfULK/wE8whchTFM2izPu9B6eoZ
 Yn+IWyg0PEGtQfnLqvx/ozi/21LBTuD8JPmbVNND0+DTpSvmHmx9R/PLoIIcN1Z/PS8D
 qGmAHkY3g4WJ94EMoujc0TEq9kBkMkya48wILpF7q/9wsNI1054OCpsvwsxXMpIhEh8g
 ogKYLWOlZYP+ZS1XQSOHLa1F5OUzE/8yR4C3EYeNYJ8jzFWzzSh6zi+v5Hs2SZ3vXHk6
 oOfqhpbpUy5e901/fyfaQH25R6n4hBFIaTfEqcoU0dFryAPAIssFL60Phs4KEJ7Uyr43
 aOuQ==
X-Gm-Message-State: AOAM5339+pZmcy4U+BuKCqan4sMG/4Ybl1ic+yp1leNDGXwL4HxeW697
 P4xBW2KWJ9bum958Zfdf6qIZ5JwrXVk=
X-Google-Smtp-Source: ABdhPJwrPZmFCqO2lTGRDIz/xw8uITk9+iYrw0gI4ZelRmYWEikQIVPyWc/OPgHhFpboCKGwgCvY1io2V2g=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3c4a:fc8b:1418:53ce])
 (user=titusr job=sendgmr) by 2002:a25:5090:0:b0:628:b76b:b9d3 with SMTP id
 e138-20020a255090000000b00628b76bb9d3mr9692826ybb.128.1646683605304; Mon, 07
 Mar 2022 12:06:45 -0800 (PST)
Date: Mon,  7 Mar 2022 12:05:56 -0800
Message-Id: <20220307200605.4001451-1-titusr@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v4 0/9] Fixups for PMBus and new sensors
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <f4bug@amsat.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::34a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::34a;
 envelope-from=31WUmYgYKClID2DECB08805y.w86Ay6E-xyFy578707E.8B0@flex--titusr.bounces.google.com;
 helo=mail-ot1-x34a.google.com
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

v3:
  - split uint refactor commit and removed commit renaming files
  - rename rolled into preceding commits
  - update commit description for uint refactoring change

v4:
  - responding to reviewer suggestions
  - added PMBUS_ERR_BYTE for consistent error returns

Shengtan Mao (1):
  hw/i2c: Added linear mode translation for pmbus devices

Titus Rwantare (8):
  hw/i2c: pmbus: add registers
  hw/i2c: pmbus: fix error returns and guard against out of range
    accesses
  hw/i2c: pmbus: add PEC unsupported warning
  hw/i2c: pmbus: refactor uint handling
  hw/i2c: pmbus: update MAINTAINERS
  hw/sensor: add Intersil ISL69260 device model
  hw/sensor: add Renesas raa229004 PMBus device
  hw/sensor: add Renesas raa228000 device

 MAINTAINERS                      |  13 +
 hw/arm/Kconfig                   |   1 +
 hw/i2c/pmbus_device.c            | 112 +++++++-
 hw/sensor/Kconfig                |   5 +
 hw/sensor/isl_pmbus_vr.c         | 279 ++++++++++++++++++
 hw/sensor/meson.build            |   1 +
 include/hw/i2c/pmbus_device.h    |  25 +-
 include/hw/sensor/isl_pmbus_vr.h |  52 ++++
 tests/qtest/isl_pmbus_vr-test.c  | 474 +++++++++++++++++++++++++++++++
 tests/qtest/meson.build          |   1 +
 10 files changed, 949 insertions(+), 14 deletions(-)
 create mode 100644 hw/sensor/isl_pmbus_vr.c
 create mode 100644 include/hw/sensor/isl_pmbus_vr.h
 create mode 100644 tests/qtest/isl_pmbus_vr-test.c

-- 
2.35.1.616.g0bdcbb4464-goog


