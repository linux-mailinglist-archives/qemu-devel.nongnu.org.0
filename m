Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6473D2C47
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 21:03:36 +0200 (CEST)
Received: from localhost ([::1]:56178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6dyp-0007hg-Fh
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 15:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3lcD5YAUKCgw45ym0s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--stmao.bounces.google.com>)
 id 1m6dx3-0006PA-S6
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 15:01:45 -0400
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849]:40718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3lcD5YAUKCgw45ym0s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--stmao.bounces.google.com>)
 id 1m6dx1-00068W-VV
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 15:01:45 -0400
Received: by mail-qt1-x849.google.com with SMTP id
 g10-20020ac8768a0000b029023c90fba3dcso31736qtr.7
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 12:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=0cBb6NaUcslbx5vxbmmSDtbuc2iSUitmzm+UVWzjl/s=;
 b=HgDDalB81vO7BijksgEW6nV/SEDDeRErPoDoXgIwg84sSbTf8RQs5SzCUv09kcDJhD
 7j/HmsrjxBziLVWtefswvS2MuaIVOQ5KPGUaGIC6YdT+ILlIBzbh5cuoAJE6NwknTbx/
 qZ8uXGnQAg1EnPAD5NwFOzMWKH6kzd8jKfk4rk5p3IsvMTo2qMo8r8rOlRzC9oiR2aYY
 hze9qrxLblV80khnakYEaUrOoMOp9fvQn95HM0IvSyMPxPqnFYRck5ln/0OdMhB4uVEf
 PHpXt4iDDPfymVRy2hcDqBihE3hsnfjTwDhuY3JEYtlc01r+jWJaE45bOSL47YLxD69p
 uMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=0cBb6NaUcslbx5vxbmmSDtbuc2iSUitmzm+UVWzjl/s=;
 b=JKvUWxDDYqaK1LgzMqe5FMN4SG9cjfUePoNT3Ns3SGuXHEIv2sFV2lMaJefh8VlR/2
 e9qxB9Awv7KDwGRTbY+1o6kPO2QeWBMd5SYOeKJgJpLvuoRSAnYTXWupCdjLOZnQDzwS
 N6HLWhDnEB2Lt6GAExRA10ZK56l0872NL6nan5J30gga62FvAdsPQWYdtzueuJa7J7kv
 SxkM4EvICDjB/Icu6sjG47ufLf4DUO6P01mSAfLO9k7RjyPMoR6+lx0T7hMKvafCh9UE
 ci506VI8yo/HmyjwmZY4Ay7ubQkduOTAlbhs63a8YUs4QLEgeELC9qbTCqDP479OEET7
 KARA==
X-Gm-Message-State: AOAM531uEXMSM13B+Nbl9rO1wLC+XVDwu9TNqRt+gKTEf6hbZNEoMJ8C
 qJI+6eXzlGpeaeQM1dXprWIxQY3PBw==
X-Google-Smtp-Source: ABdhPJwhafmfMKu/92pVl9qA0vkFzkiXiXB9d6hIWMvcC8Xs+ejKw5QqFwseRzy7NcIM8TnisKusY0LLRg==
X-Received: from smvm.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2d5f])
 (user=stmao job=sendgmr) by 2002:a05:6214:f0b:: with SMTP id
 gw11mr1286833qvb.10.1626980501124; Thu, 22 Jul 2021 12:01:41 -0700 (PDT)
Date: Thu, 22 Jul 2021 19:01:37 +0000
Message-Id: <20210722190138.486785-1-stmao@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
Subject: [PATCH 0/1] Add remote I2C device to support external I2C device
From: Shengtan Mao <stmao@google.com>
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, stmao@google.com, 
 crauer@google.com, wuhaotsh@google.com, venture@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::849;
 envelope-from=3lcD5YAUKCgw45ym0s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--stmao.bounces.google.com;
 helo=mail-qt1-x849.google.com
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
2.32.0.402.g57bb445576-goog


