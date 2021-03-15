Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7C833C3FA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:19:57 +0100 (CET)
Received: from localhost ([::1]:55696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqsm-0002z5-HJ
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLqeG-000117-4J
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:04:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLqe7-0001I3-VA
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615827886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eXBXuTBobkVS4Z7U4WlcUAPBhsSnyBbul7EuaAHIH7E=;
 b=eHRN68mrXjqulxghRxW6HPtc1LCCG48s1WOq/XkrQdmHj+chmmey5HK041b9UlSpA875rB
 obFP+sG9MI8V7Ib+psQ/126umfxs7RizB0ZVoAbwV7C89mPZVM8YZbC0bhhcO7yqjflu6i
 iujE/xh6dLsEs9ZJ5hXDvlkv1ir5KgM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-AMNcfCmPPPa8UQskI3KQ0w-1; Mon, 15 Mar 2021 13:04:44 -0400
X-MC-Unique: AMNcfCmPPPa8UQskI3KQ0w-1
Received: by mail-wr1-f69.google.com with SMTP id n16so14295791wro.1
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 10:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eXBXuTBobkVS4Z7U4WlcUAPBhsSnyBbul7EuaAHIH7E=;
 b=S0N/bzMjQxVYvGVCSWlNOnJcikcSsJEG94RhWt+nnP42CAtPUpQRot+O4U+aupL/ng
 cF+4juOtNdTFwFZ6Uyt2Pxad8C2RP+ErFq34G9pgDqLNrLydTjg5FqSyiU1A7RK2JT42
 XA7Nt4o09eWTPZUdRyGpmF8vkgyJ9xBD3bj8d6a/zNEScJ6yRYotgMExHTbWntgSJs+6
 vulg7XH4zIBzhUwt24v+xLsdV0j1qmEyZFedo4m264MG4IH6rtqUmv4IDVMfmnS0Vt44
 TiORir8/DkGrFOW52mNCPB8gmYCRU1KNRqxHFGYl61RLHr2crCKng4a/JLLc+pSBtrB5
 uPMw==
X-Gm-Message-State: AOAM533GE3fWSUsBoTWB8cst4XBvpmFrrQ8DKAgQO5xpveFiSkr3rglH
 f5gFDvTQ3OOjm11yAQTvPpmdOVkl+EAaWyZcH74gd/D3KYErRKIs2SIHpJeqCxLbZswMZStKrTh
 r+R4Nz2+0Qj2aP2ZIISrOLyg8dFWIo4GieusG3JUVfCwlDkPRhVcbQC1V16sc3jYb
X-Received: by 2002:a7b:ce91:: with SMTP id q17mr690472wmj.28.1615827882769;
 Mon, 15 Mar 2021 10:04:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD8b8kejxc8x3h2zwM5gYhuPBm8ZNt6JAvpBqpaaRpPL8ww/HURRunrfaGaewvh9dplMUi1Q==
X-Received: by 2002:a7b:ce91:: with SMTP id q17mr690379wmj.28.1615827881711;
 Mon, 15 Mar 2021 10:04:41 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id k4sm25209374wrd.9.2021.03.15.10.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 10:04:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/core: Only build guest-loader if libfdt is available
Date: Mon, 15 Mar 2021 18:04:39 +0100
Message-Id: <20210315170439.2868903-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a Kconfig entry for guest-loader so we can optionally deselect
it (default is built in), and add a Meson dependency on libfdt.

This fixes when building with --disable-fdt:

  /usr/bin/ld: libcommon.fa.p/hw_core_guest-loader.c.o: in function `loader_insert_platform_data':
  hw/core/guest-loader.c:56: undefined reference to `qemu_fdt_add_subnode'
  /usr/bin/ld: hw/core/guest-loader.c:57: undefined reference to `qemu_fdt_setprop'
  /usr/bin/ld: hw/core/guest-loader.c:61: undefined reference to `qemu_fdt_setprop_string_array'
  /usr/bin/ld: hw/core/guest-loader.c:68: undefined reference to `qemu_fdt_setprop_string'
  /usr/bin/ld: hw/core/guest-loader.c:74: undefined reference to `qemu_fdt_setprop_string_array'
  collect2: error: ld returned 1 exit status

Fixes: a33ff6d2c6b ("hw/core: implement a guest-loader to support static hypervisor guests")
Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/core/Kconfig     | 5 +++++
 hw/core/meson.build | 3 +--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index fdf03514d7d..9397503656d 100644
--- a/hw/core/Kconfig
+++ b/hw/core/Kconfig
@@ -11,6 +11,11 @@ config GENERIC_LOADER
     bool
     default y
 
+config GUEST_LOADER
+    bool
+    default y
+    depends on TCG
+
 config OR_IRQ
     bool
 
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 9cd72edf513..59f1605bb07 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -16,6 +16,7 @@
 common_ss.add(files('cpu.c'))
 common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
 common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
+common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
 common_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
 common_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
 common_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
@@ -37,8 +38,6 @@
   'clock-vmstate.c',
 ))
 
-softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('guest-loader.c'))
-
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
   'machine-qmp-cmds.c',
   'numa.c',
-- 
2.26.2


