Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DF33DE2D5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 01:05:09 +0200 (CEST)
Received: from localhost ([::1]:44122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAgzc-0002rC-Cp
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 19:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wnkIYQUKCuUZaTHVNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--stmao.bounces.google.com>)
 id 1mAgy7-0001By-0t
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 19:03:35 -0400
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49]:42870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wnkIYQUKCuUZaTHVNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--stmao.bounces.google.com>)
 id 1mAgy4-00060M-9i
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 19:03:34 -0400
Received: by mail-qv1-xf49.google.com with SMTP id
 g2-20020a0cdf020000b029033bc8be6d4aso8936097qvl.9
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 16:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=WySyKNVtmI1hpq+spiGANC9C/vzKA/exVmPjzKEgQag=;
 b=evi1rOOKt3C+FHwiD/5anPiy1peBKCcGWXAgXOh6MYHGckPUYiTrD31DG67ZjWr5xJ
 wDhY0dPz9xh8ekshZrnNyE8UHkKNTikWnBNfD+0593gDtkNzvrLb+0TxFCIvM6xCPAB5
 f5ygdUf/dWsBAp5XiYtW6E6eiPB5Mneyr+hORgxbCxBZidjN9Da0Uqv7rGuYiBkIA+Ph
 jspp14T0L4Q7F4FurvpYSzzdxe1J60traKKNqwSrT7BTvH8wIZjEwQ90q3yx6SF6Cp+1
 1K3E9Ry6ZamuD0dbg7ZuxPY7IMsOF28xtclg3PiWLm6kVeEYkSZoeZmj/pehHTYNAUZH
 v4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=WySyKNVtmI1hpq+spiGANC9C/vzKA/exVmPjzKEgQag=;
 b=uITSwwhK8qT0NDqNMUw6v7CxHe6LOHBbOY/X2YrN8x5ukj9XTKE5cYEDvE0X/8ovte
 KEZkXsuAb3uC4hLsOCp5K3rTAWjnByeyLRaqCiHSULU98ZLTZUqQjke22iUVTOZ5/mIO
 ggCk6Uk8snke25lgw4paokONbRRmT93dsHXq3W4JAlGxcEzkUVCOQEnLfb4/Z7+lvJDA
 NEKyufjcUjnpORM7Hr1hAVwOx21rHGWT+igZ6i0ykXaFSSWfajBOmFD22eUGoKbSeMXf
 /8dg+zh7ByLUapjCvO6npcuUo9h7cRC1EaoOIYTD1+nrXQVi1rS1gpM+p2N7zHkbAzga
 yaTw==
X-Gm-Message-State: AOAM532IGDYMW42+NUdV5pILIGzf+YQtdMHqGzaWk5WJCr74X6yTYSgW
 qwGP1STFFLMtKhzsztpyqvJRzl95uQ==
X-Google-Smtp-Source: ABdhPJxI8OIZWZUH3aFFGvw7lZ32HeKtOqsgrTCohw3uCE9YS9WhrBUrZn7RoPR9pW55AGaVSguNydCYsQ==
X-Received: from smvm.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2d5f])
 (user=stmao job=sendgmr) by 2002:a05:6214:2589:: with SMTP id
 fq9mr18987328qvb.30.1627945410139; Mon, 02 Aug 2021 16:03:30 -0700 (PDT)
Date: Mon,  2 Aug 2021 23:03:20 +0000
Message-Id: <20210802230323.1164787-1-stmao@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v2 0/1] Add remote I2C device to support external I2C device
From: Shengtan Mao <stmao@google.com>
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, stmao@google.com, 
 crauer@google.com, wuhaotsh@google.com, venture@google.com, 
 maoshengtan2011@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f49;
 envelope-from=3wnkIYQUKCuUZaTHVNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--stmao.bounces.google.com;
 helo=mail-qv1-xf49.google.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
2.32.0.554.ge1b32706d8-goog


