Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B2D2FDB3A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 21:57:06 +0100 (CET)
Received: from localhost ([::1]:37314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2KXJ-0006Qi-3F
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 15:57:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lb.workbox@gmail.com>)
 id 1l2KVY-0005CM-LG
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:55:16 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lb.workbox@gmail.com>)
 id 1l2KVW-0006JU-Tb
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:55:16 -0500
Received: by mail-wr1-x433.google.com with SMTP id c12so5858114wrc.7
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 12:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MVJhaCrhCBlRAQv3mfKaM0VbRKJRTgYkm4ok44vTQFc=;
 b=emKlgp7PQK5rf34SwWNanbHr9csqjQs2BTrrCv+8GQnHwZuRuu+Jdv0ynxe9OKgQpK
 8vkd1azTyfLrvtzqMtsaddFJStYmAvbU1e8oBI4WUh25RHsdagwTwaYsMEl44Gc5IEN6
 eMIPdEvnIqQqjtIich1LRFiwplGZHzIkFkABExLzZFsy6iQ0t4juQFRnZ/kvpX6W1VrG
 x9T8xU7VxaF4/xrCR61goG6LrMMzw1e+xW752mE2IbmbB5DMfrpoAvbGkLYxma0cTxry
 i2vykh7ABnNLzuUO7xULVhXqszsQkOEqIvu3HOwrISB4UjGubjv7HU97XUVgCxzSzFFw
 7bMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MVJhaCrhCBlRAQv3mfKaM0VbRKJRTgYkm4ok44vTQFc=;
 b=mHPgb7qDDfgpKjVKy9rUJbmK/jsupBSOF5+tK4fbshj20/YswReioMXw5V0Lr8uvqa
 oUvur9f2EJ+7rq4C0AfnK2ZpQa/P4A8d/6svLhJaKo83msD20pVrugAR0LIy5xYZMgfv
 J91d8xIqx8WbwkiEm7VIwou090DO2AbTO0GN/NHnPzzzkUGb5Gi/ZXC0n/E/LrmIIHWR
 mgjHForqQlZEOjhmYP3nuVwACL24HtD5u22v1Mgzfp7CY7txHeJ3K0yhW7v47PPSTJ/P
 xcbC+7LBB3UDGgzx7np8qCTqa8bml99Ob4p7xMZl6AcXTA4A2FMfy/0iLPOZ121X/MnS
 xecA==
X-Gm-Message-State: AOAM531k9ScWYYnIXbEvYdHn3qcVf3o6UTedkMCGfahlmwHS5bvp/+eg
 mosfgJRdpVPcf/tXnB851RU=
X-Google-Smtp-Source: ABdhPJyhsUmKMJB5YYAe1S2hgudKRvZW+Uq0H/7aUJCBgwHURu0N4zEkL0ZOgfcl0Dik4B4PYr9gjw==
X-Received: by 2002:a5d:5401:: with SMTP id g1mr10939681wrv.93.1611176112399; 
 Wed, 20 Jan 2021 12:55:12 -0800 (PST)
Received: from lb-xps.. ([176.230.215.91])
 by smtp.gmail.com with ESMTPSA id k10sm5614823wrq.38.2021.01.20.12.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 12:55:11 -0800 (PST)
From: Leonid Bloch <lb.workbox@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 0/4] Introduce a battery, AC adapter, and lid button
Date: Wed, 20 Jan 2021 22:54:57 +0200
Message-Id: <20210120205501.33918-1-lb.workbox@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=lb.workbox@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonid Bloch <lb.workbox@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series introduces the following ACPI devices:

* Battery
* AC adapter
* Laptop lid button

When running QEMU on a laptop, these paravirtualized devices reflect the
state of these physical devices onto the guest. This functionality is
relevant not only for laptops, but also for any other device which has e.g.
a battery. This even allows to insert a ``fake'' battery to the
guest, in a form of a file which emulates the behavior of the actual
battery in sysfs. A possible use case for such a ``fake'' battery can be
limiting the budget of VM usage to a subscriber, in a naturally-visible way.
But of course, the main purpose here is addressing the desktop users.

This series was tested with Windows and (desktop) Linux guests, on which
indeed the battery icon appears in the corresponding state (full,
charging, discharging, time remaining to empty, etc.) and the AC adapter
plugging/unplugging behaves as expected. So is the laptop lid button.

For the ease of review, these commits are also available here:
https://github.com/blochl/qemu/pull/1/commits


Thanks,
Leonid.

Leonid Bloch (4):
  hw/acpi: Increase the number of possible ACPI interrupts
  hw/acpi: Introduce the QEMU Battery
  hw/acpi: Introduce the QEMU AC adapter
  hw/acpi: Introduce the QEMU lid button

 MAINTAINERS                          |  15 +
 docs/specs/acad.txt                  |  24 ++
 docs/specs/battery.txt               |  23 ++
 docs/specs/button.txt                |  35 ++
 hw/acpi/Kconfig                      |  12 +
 hw/acpi/acad.c                       | 318 +++++++++++++++++
 hw/acpi/battery.c                    | 512 +++++++++++++++++++++++++++
 hw/acpi/button.c                     | 327 +++++++++++++++++
 hw/acpi/core.c                       |  17 +-
 hw/acpi/meson.build                  |   3 +
 hw/acpi/trace-events                 |  15 +
 hw/i386/Kconfig                      |   3 +
 hw/i386/acpi-build.c                 | 178 ++++++++++
 include/hw/acpi/acad.h               |  37 ++
 include/hw/acpi/acpi_dev_interface.h |   3 +
 include/hw/acpi/battery.h            |  43 +++
 include/hw/acpi/button.h             |  35 ++
 17 files changed, 1598 insertions(+), 2 deletions(-)
 create mode 100644 docs/specs/acad.txt
 create mode 100644 docs/specs/battery.txt
 create mode 100644 docs/specs/button.txt
 create mode 100644 hw/acpi/acad.c
 create mode 100644 hw/acpi/battery.c
 create mode 100644 hw/acpi/button.c
 create mode 100644 include/hw/acpi/acad.h
 create mode 100644 include/hw/acpi/battery.h
 create mode 100644 include/hw/acpi/button.h

-- 
2.30.0


