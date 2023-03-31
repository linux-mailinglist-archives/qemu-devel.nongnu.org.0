Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A14E6D1499
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 03:03:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi39C-0003B6-Me; Thu, 30 Mar 2023 21:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <37TAmZAcKChA04214tyw44w1u.s426u2A-tuBu1343w3A.47w@flex--komlodi.bounces.google.com>)
 id 1pi399-0003AQ-Rz
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:39 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <37TAmZAcKChA04214tyw44w1u.s426u2A-tuBu1343w3A.47w@flex--komlodi.bounces.google.com>)
 id 1pi397-0006Zo-5r
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:39 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 o89-20020a17090a0a6200b0023b3d3acdd6so10015112pjo.3
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 18:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680224493;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CWOHIBA1YMKJPt+zP+i5ZpURGqnsWVNWiJjU8OCt6E0=;
 b=j9KSX7orJO6oc3aRpmWHnh5lbAsSwwZZRxrtBqkiIIZ/EXis9JBlRVp5ez2ndaYEV0
 5AjC4VTDiuYrzX9vhiqDXOvcQhoeqDYQH0VLafcnSU2O+sdqloD36leMVcLZxFkOnsID
 hN0/diJJDNsIpecmzKLCZdfCisGAnFUxgXTG83ucCxNG0cOCwbnfD+/Wf7G3w/IELnm4
 Zgy3/N0SZjhumGYeb8QuQuFiJykbwMfxZ5FKNJuxpIk1iuesnDw/jR4anhHn/jPk4nHL
 tk3u2CBTJvpSI7eqXJwO2HKa6lAJWgKpNuvoyBgNfdRR+C+lPaVa3gv1nTZKLrOSXnt1
 IrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680224493;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CWOHIBA1YMKJPt+zP+i5ZpURGqnsWVNWiJjU8OCt6E0=;
 b=3/Ff9lLvegLwz1X2iHozfZHvdMBzDkKmNcBhtOOzMhXC75/MhbkBdjRJSn6usdDaJU
 pi3ZL4mr0HSUP8E1tv3PODRAIsFb9TkDAQ/I9E502IOr8sWXGGJpCyIsYRijHkKued90
 PVLUwz/CnEP5JSwJA2nyYZvVDRH327bx9WwtjGfZeGowo/8gSduGLfuSfmsWKwX2/GOg
 E8JetAlOfgBwBDfatuP/zSxq1dDSaRmL/anVQecacnN1695fR5Go/JYm0p6K8J/mL7L6
 oDvnXBEopuzYVktIi/TnrDIiihTUNyWGb+qPe9hQ9UZUPCQd5dj9tYje8eQYeJPrWC3C
 IsEQ==
X-Gm-Message-State: AAQBX9dob3Vr167VxvcPwVIY5yIi950NgJhvZ1HKXjzLuW6ce2qgNVnb
 orGsvZ/o+W0PAb5xggave/c+EFBzyE6/uj1GSrUtdBqPEQ1H3CB5APnU11HnYKHgUgRJDk6yxdg
 PZ75R0IV5zMKolez5tJuWwfoWPllJZGN0w+5aRDK+nHIJji4+YweuYFX8zZkfFpM=
X-Google-Smtp-Source: AKy350YdRQo/XaSvIcvhuJ3Lh5cprcl6QM9jHCj3oebXGUmnXErBXh6me2M0YXHqeusHLAiLan2S4SmCZQGk
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a17:903:493:b0:1a2:6e4d:7831 with SMTP id
 jj19-20020a170903049300b001a26e4d7831mr3170500plb.12.1680224493415; Thu, 30
 Mar 2023 18:01:33 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:01:15 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331010131.1412571-1-komlodi@google.com>
Subject: [PATCH 00/16] i3c: aspeed: Add I3C support
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=37TAmZAcKChA04214tyw44w1u.s426u2A-tuBu1343w3A.47w@flex--komlodi.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi all,

This series adds I3C bus support to QEMU and adds more functionality to the
Aspeed I3C controller.

This implementation is a basic implementation that introduces IBIs
(including hot-join), CCCs, and SDR data transfer. As-is, it doesnt support
multi-controller buses or HDR transfers.

First we add the I3C bus and controller model. With that added we
gradually extend the functionality of the Aspeed I3C controller so it
can do transfers.

With that added, we add 2 targets. The first target is a mock I3C
target. It's intended to be a very simple target just to verify that I3C
is working on the guest. Internally, we've used it on Linux to verify
that i3C devices can be probed and can send/receive data and send IBIs.

The second target is a remote target. The intention of this is to be
able to communicate to a target that exists outside of QEMU.

Lastly we add hotplugging support. The hotplugging doesn't do anything too
complicated, it just adds the device attempting to hotplug to the bus. It is
the device's responsibility to hot-join and go through the DAA process to
participate on the bus.

Thanks!
Joe

Joe Komlodi (16):
  hw/misc/aspeed_i3c: Move to i3c directory
  hw/i3c: Add bus support
  hw/i3c/aspeed_i3c: Add more register fields
  hw/i3c/aspeed_i3c: Add more reset values
  hw/i3c/aspeed_i3c: Add register RO field masks
  hw/i3c/aspeed_i3c: Treat more registers as read-as-zero
  hw/i3c/aspeed_i3c: Use 32 bits on MMIO writes
  hw/i3c/aspeed_i3c: Add IRQ MMIO behavior
  hw/i3c/aspeed_i3c: Add data TX and RX
  hw/i3c/aspeed_i3c: Add IBI handling
  hw/i3c/aspeed_i3c: Add ctrl MMIO handling
  hw/i3c/aspeed_i3c: Add controller resets
  hw/i3c: Add Mock target
  hw/i3c: remote_i3c: Add model
  qtest: remote_i3c: Add remote I3C qtest
  hw/i3c: Add hotplug support

 hw/Kconfig                    |    1 +
 hw/arm/Kconfig                |    2 +
 hw/i3c/Kconfig                |   17 +
 hw/i3c/aspeed_i3c.c           | 2044 +++++++++++++++++++++++++++++++++
 hw/i3c/core.c                 |  646 +++++++++++
 hw/i3c/meson.build            |    6 +
 hw/i3c/mock-target.c          |  314 +++++
 hw/i3c/remote-i3c.c           |  469 ++++++++
 hw/i3c/trace-events           |   52 +
 hw/i3c/trace.h                |    1 +
 hw/meson.build                |    1 +
 hw/misc/aspeed_i3c.c          |  384 -------
 hw/misc/meson.build           |    1 -
 hw/misc/trace-events          |    6 -
 include/hw/arm/aspeed_soc.h   |    2 +-
 include/hw/i3c/aspeed_i3c.h   |  207 ++++
 include/hw/i3c/i3c.h          |  275 +++++
 include/hw/i3c/mock-target.h  |   60 +
 include/hw/i3c/remote-i3c.h   |   72 ++
 include/hw/misc/aspeed_i3c.h  |   48 -
 meson.build                   |    1 +
 tests/qtest/meson.build       |    1 +
 tests/qtest/remote-i3c-test.c |  610 ++++++++++
 23 files changed, 4780 insertions(+), 440 deletions(-)
 create mode 100644 hw/i3c/Kconfig
 create mode 100644 hw/i3c/aspeed_i3c.c
 create mode 100644 hw/i3c/core.c
 create mode 100644 hw/i3c/meson.build
 create mode 100644 hw/i3c/mock-target.c
 create mode 100644 hw/i3c/remote-i3c.c
 create mode 100644 hw/i3c/trace-events
 create mode 100644 hw/i3c/trace.h
 delete mode 100644 hw/misc/aspeed_i3c.c
 create mode 100644 include/hw/i3c/aspeed_i3c.h
 create mode 100644 include/hw/i3c/i3c.h
 create mode 100644 include/hw/i3c/mock-target.h
 create mode 100644 include/hw/i3c/remote-i3c.h
 delete mode 100644 include/hw/misc/aspeed_i3c.h
 create mode 100644 tests/qtest/remote-i3c-test.c

-- 
2.40.0.348.gf938b09366-goog


