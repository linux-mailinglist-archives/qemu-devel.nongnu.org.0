Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279793DE2E9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 01:10:01 +0200 (CEST)
Received: from localhost ([::1]:51192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAh4K-0007la-89
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 19:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3z3kIYQUKCvImngUiaiiafY.WigkYgo-XYpYfhihaho.ila@flex--stmao.bounces.google.com>)
 id 1mAgyM-0001lC-IF
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 19:03:50 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:56222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3z3kIYQUKCvImngUiaiiafY.WigkYgo-XYpYfhihaho.ila@flex--stmao.bounces.google.com>)
 id 1mAgyG-00068e-Ty
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 19:03:50 -0400
Received: by mail-qk1-x74a.google.com with SMTP id
 p123-20020a378d810000b02903ad5730c883so14044737qkd.22
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 16:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=WySyKNVtmI1hpq+spiGANC9C/vzKA/exVmPjzKEgQag=;
 b=Mm0xyK8e1yq86bRgmho8H09UREqpiFEcNARD6zeJFfBAUhE+n9hC3f067jeL5SEyfr
 frQVqNYqAdfIKDqjBOiWHkWgJB6RFYsh7mOCD9QTZc+mnGKJ8OoxJEgcmyfeGklF9GHx
 orHFUlCC/8LMf/EbzXLq+GOLkHdjpwLFWuatD8paUSMjRk+NPWyYSP1wlbJQmFRQDdXv
 fteugsRyIblLXUGZG8PqF0IcPGRdBnf6r8ERQK2784ovC/rncWWIc5P2uvgqGJtRCroQ
 7Y4Ud4or6xlNOaUhi8P1c2DsgP8GwGs9C8k9RlcbELd3TVF5sU9UGkoKJfY5XSxlmP+3
 PBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=WySyKNVtmI1hpq+spiGANC9C/vzKA/exVmPjzKEgQag=;
 b=YbPryM6+W3nDfQtqOnZdq46DNSROHm0JYTfbucbtlRHtUt3ai51/7XiYMwKwqNA3pW
 V62NLHywSFROVyzo5LTyP0tN37BkDsYJfkyzceKfVQVllJNRdYEqObu5PgJVJPSCn+gg
 x+YA7lmXsD+Tq5Ad7vd8fASI2feAFeDzW3WGqoxkYDdovt85KYT1CQLH7yG/j2jJYqli
 zdNsaRRe/kMgQdJic/RE54mZPin1quxYbsIx6jWy6bV2XCwFsUZJZrjmlXnTyNyRdvkI
 d5t2IFox2kCIOwtQV2AFP3zgrXTD0fNOWjnxgW39nWSIrTPs5zl3RyWpZ8iIV049i7/a
 Xoww==
X-Gm-Message-State: AOAM532siAwXJHi4Lp61HTUEU4Oan92YbgPASMJfgCpgOmmPqirAy3BJ
 rLD3i2Lbouwt1rRYY98uj9/XZs3G7g==
X-Google-Smtp-Source: ABdhPJwb9y2co3QgrOcH3B62JJa+SnR58IFsOS7VtF4et6OBp7i/AA3M4mQ8gD1HFYEfOBUUn9CU3yQFGA==
X-Received: from smvm.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2d5f])
 (user=stmao job=sendgmr) by 2002:ad4:5ccc:: with SMTP id
 iu12mr18087739qvb.47.1627945423356; 
 Mon, 02 Aug 2021 16:03:43 -0700 (PDT)
Date: Mon,  2 Aug 2021 23:03:22 +0000
In-Reply-To: <20210802230323.1164787-1-stmao@google.com>
Message-Id: <20210802230323.1164787-3-stmao@google.com>
Mime-Version: 1.0
References: <20210802230323.1164787-1-stmao@google.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v2 0/1] Add remote I2C device to support external I2C device
From: Shengtan Mao <stmao@google.com>
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, stmao@google.com, 
 crauer@google.com, wuhaotsh@google.com, venture@google.com, 
 maoshengtan2011@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3z3kIYQUKCvImngUiaiiafY.WigkYgo-XYpYfhihaho.ila@flex--stmao.bounces.google.com;
 helo=mail-qk1-x74a.google.com
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


