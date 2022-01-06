Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF90486DA2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 00:19:34 +0100 (CET)
Received: from localhost ([::1]:46060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5c2f-0006R5-6y
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 18:19:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wHbXYQYKCiEQFQRPODLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--titusr.bounces.google.com>)
 id 1n5bzh-0002qj-A0
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 18:16:29 -0500
Received: from [2607:f8b0:4864:20::104a] (port=39564
 helo=mail-pj1-x104a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wHbXYQYKCiEQFQRPODLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--titusr.bounces.google.com>)
 id 1n5bzf-00067v-SB
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 18:16:28 -0500
Received: by mail-pj1-x104a.google.com with SMTP id
 n91-20020a17090a5ae400b001b334716dc5so3743747pji.4
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 15:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=tLMiL3/RJk8cMvV7xxC4xBg7Wmxe4jbKQPmbVxBstV8=;
 b=eeu7R8Q7h/pitoA8jrCka2o+n2rxrPon0jxsnWLO9qkpCScXUxE/Ye9usI5+NBjLAm
 suqJq925r5A5jOHPPukTqpsJhJRtvVGIECvtvlVSy5OUNDug8jKh7/3968b7Xl8tylKf
 Pr1TDmO+P4WgJHewmZ1RVgwqbscUMVJxAE1lK1dxfYo12MLcfh1ipjVtnP16s6lx0owJ
 0+fvt+kEIQMpPw6s/RPawNxrNoStSvi7pv5V6/9s5oK0vSu9JMJc3+Qkb+yWaxCuLjqb
 plIn+kD2doUL7LssOC+tXJYQddc4fkaODW/GrJAw2Yru8Ss5eAuqSUeHppo30aMUpo0J
 FbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=tLMiL3/RJk8cMvV7xxC4xBg7Wmxe4jbKQPmbVxBstV8=;
 b=w20AjomC1Bwk3dBKUdxr9CJV/FWJJEdFBtPTwJd9kxUDB5Qfs0VCIqbBp3I1/fbuWU
 j5jE38re4TUoJdAgXKTClOPyu87p+yFcJdn9ZEtC3iRb3DrbBxKuCUDmjIK5v/NDH9La
 2RnLJ4r45pnZkCasw7mVLcVSnoa57Yv9Si0jg8L1zZBXIUrt+N/edfK28eyN4zBTKaDU
 XPYjZan3MXKoOnGlw65qF4MrZ24j+/YOpPu4S5YvDaQB7W0jOeCf2pbql7vC7YYco/F9
 a4SfJS7P9TBwaCw6zfgJRhTQeFpc10rH+SDNgkS48IszphihWzQbzIJdrJhPYPTR1nAO
 i8tw==
X-Gm-Message-State: AOAM532LVVwc85iVvTDF3xRiXOUOQ2csaFImTWRriqk5HYYqixZr/PG8
 I/y4+LvWNUrv24aDX9iPhefjP/rw02Q=
X-Google-Smtp-Source: ABdhPJyrT+JOZjwJA1My1XM75Y+0b00XR0WIo0biL7vQCTtHeVi0wk9ZwZ9dY1I1s7YGJ1pUzVqvKhUogYc=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6102:3554:: with SMTP id
 e20mr19321804vss.50.1641510592124; Thu, 06 Jan 2022 15:09:52 -0800 (PST)
Date: Thu,  6 Jan 2022 23:09:31 +0000
Message-Id: <20220106230936.417020-1-titusr@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 0/5] Fixups for PMBus and new sensors
From: Titus Rwantare <titusr@google.com>
To: f4bug@amsat.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::104a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3wHbXYQYKCiEQFQRPODLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--titusr.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

Shengtan Mao (1):
  hw/i2c: Added linear mode translation for pmbus devices

Titus Rwantare (4):
  hw/i2c: pmbus updates
  hw/sensor: add Intersil ISL69260 device model
  hw/sensor: add Renesas raa229004 PMBus device
  hw/misc: add Renesas raa228000 device

 MAINTAINERS                   |  15 +-
 hw/arm/Kconfig                |   1 +
 hw/i2c/pmbus_device.c         | 106 +++++++-
 hw/sensor/Kconfig             |   5 +
 hw/sensor/isl_pmbus.c         | 278 ++++++++++++++++++++
 hw/sensor/meson.build         |   1 +
 include/hw/i2c/pmbus_device.h |  23 +-
 include/hw/sensor/isl_pmbus.h |  52 ++++
 tests/qtest/isl_pmbus-test.c  | 460 ++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build       |   1 +
 10 files changed, 930 insertions(+), 12 deletions(-)
 create mode 100644 hw/sensor/isl_pmbus.c
 create mode 100644 include/hw/sensor/isl_pmbus.h
 create mode 100644 tests/qtest/isl_pmbus-test.c

-- 
2.34.1.448.ga2b2bfdf31-goog


