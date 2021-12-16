Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBB54767AB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 03:03:47 +0100 (CET)
Received: from localhost ([::1]:35400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxg7W-0001Fe-5k
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 21:03:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Spy6YQcKCoEptrqtinlttlqj.htrvjrz-ij0jqstslsz.twl@flex--komlodi.bounces.google.com>)
 id 1mxg3k-0003UL-0H
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 20:59:52 -0500
Received: from [2607:f8b0:4864:20::d49] (port=33703
 helo=mail-io1-xd49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Spy6YQcKCoEptrqtinlttlqj.htrvjrz-ij0jqstslsz.twl@flex--komlodi.bounces.google.com>)
 id 1mxg3h-0007SU-K2
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 20:59:51 -0500
Received: by mail-io1-xd49.google.com with SMTP id
 85-20020a6b0258000000b005ed47a95f03so22363876ioc.0
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 17:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=zR0jyaMTufgLJ9bs8jCZKPVQaE4ELRRo3lNyqn+uc1o=;
 b=XxkamrYwXFefv7aW8nlcthbABhm4psg3H4Bn6f9eZOsYTUNx9dO09slovIBFRF2OrD
 sQlY1bpUcv8uHc1fW7TtAvWFRygizwyEr6q0Omxc8s/Z7+BFtxuBqaPFJdAJMCaUTuZO
 Io7q8N/xjLLmlZapRCZblKRr+qC5jogrJS6+1un4iKTQvNpI6THLc8uKWRQG+H7fGGQI
 YZXEU9nn3G5m32pQmOPctiBHgKCaSSTULsTJVWhQCTAz9JkqHWsq/WCWqRBmPvUU5c2q
 oMwnXKQd9oPvIIG5I9rfFUfBfy2Lz4x/bdMa0CyXTj/HdBDtqipHtEmJ7C1D4ARac5ZC
 qJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=zR0jyaMTufgLJ9bs8jCZKPVQaE4ELRRo3lNyqn+uc1o=;
 b=6RhsL1xwI11p7hK0wFqW8ekggsTSiwTPVAWhFlwV54QBvsVF+ahY8MVn5WcvTEOJAn
 Cusu+WGCMG0pDicmTRB3specJprYTArhrbdQSbvNzTcz5NAmzF+gVfzfm8miqJVh6ixX
 AGFxeeRuplwUZ0KtmK/f3uotQc+r15B3G5JrNoDdPMgLMn2FppefBs6Uws2AnvDBerjM
 jm8FxQc705eeTrXVfiyb8BSn6P2m/9DtHfdiwnRTM4VF2MtGTbVnLXoenZZBqm/0BNqF
 6gxmUDMT48lm7AAFJRiYOK4tM5xlQ0jX9hGozmY0ICeZ2SHSkLJkZjz6gJSM0SDUZqHx
 GH0Q==
X-Gm-Message-State: AOAM533yj/QEnZYRcVydvajzOXieoXDqI3L77BrzNWLXsN3jJDTc+8F9
 ChjeZJI0u2cKcJXb4VhPcVNB5nNbB5RF8wnMDqaWQ1rzRpb2YNWVDyis/AW+MwQwscKnxumtOYz
 4jPVd6tPITDtCBH7XPK8NB1BHOhHVBzH/7xgys5gk01oCfmP2VGJbkzu5A5hI7lw=
X-Google-Smtp-Source: ABdhPJxXwDY1A9jDPO3CiT9mkxEP0c++vDFwyU7VfnjdufNDB7oVu5nKFMQ5Q4gW71NJb4VdUYUZRIzpRBQ6
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a63:9049:: with SMTP id
 a70mr8007604pge.544.1639619658516; Wed, 15 Dec 2021 17:54:18 -0800 (PST)
Date: Thu, 16 Dec 2021 01:54:11 +0000
Message-Id: <20211216015417.1234812-1-komlodi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [RFC PATCH 0/6] Introduce GPIO transmitter and connect to NPCM7xx
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, venture@google.com, hskinnemoen@google.com, 
 kfting@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d49;
 envelope-from=3Spy6YQcKCoEptrqtinlttlqj.htrvjrz-ij0jqstslsz.twl@flex--komlodi.bounces.google.com;
 helo=mail-io1-xd49.google.com
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

Hi all,

This series introduces a GPIO transmitter, which allows the transmission
of GPIO controller pin state over chardev, and attaches it to the NPCM7xx
GPIO controller.

The GPIO transmitter takes in a GPIO controller number and a bitfield
containing the GPIO state of that controller, then formats a packet and
sends it via chardev to whomever is listening for it.
The purpose of this is for external software to receive the packet and
interpret it so it can do any actions it needs to, based on GPIO state.

For example, in our use case, we have a VM manager managing an x86 guest
and an ARM (NPCM7xx) guest. On real hardware, the ARM SoC is a BMC which
has some power control over the x86 SoC.
Because of this, we need to relay GPIO power events from the BMC to the
x86 machine (i.e. reset, power off, etc), so we have software read in
the GPIO transmitter packets, keep track of what power state the x86
machine is in based on the GPIO state of the BMC, and notify the VM
manager of any important changes.
The VM manager can then power up/down and reset the x86 machine as
needed.

Thanks!
Joe

Joe Komlodi (6):
  hw/gpio/gpio_transmitter: Add Device
  hw/gpio/gpio_transmitter: Add allowlist
  hw/gpio/npcm7xx: Number controllers
  hw/arm/npcm7xx: gpio: Add GPIO transmitter
  hw/gpio/npcm7xx: init GPIO transmitter allowlist
  qtests/gpio_transmitter: Add test

 hw/arm/Kconfig                            |   1 +
 hw/arm/npcm7xx.c                          |   8 +
 hw/gpio/Kconfig                           |   3 +
 hw/gpio/google_gpio_transmitter.c         | 249 ++++++++++++++++++++++
 hw/gpio/meson.build                       |   1 +
 hw/gpio/npcm7xx_gpio.c                    |  25 +++
 include/hw/arm/npcm7xx.h                  |   2 +
 include/hw/gpio/google_gpio_transmitter.h |  66 ++++++
 include/hw/gpio/npcm7xx_gpio.h            |   4 +
 tests/qtest/google_gpio_tx-test.c         | 216 +++++++++++++++++++
 tests/qtest/meson.build                   |   1 +
 11 files changed, 576 insertions(+)
 create mode 100644 hw/gpio/google_gpio_transmitter.c
 create mode 100644 include/hw/gpio/google_gpio_transmitter.h
 create mode 100644 tests/qtest/google_gpio_tx-test.c

-- 
2.34.1.173.g76aa8bc2d0-goog


