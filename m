Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A285E92EE
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:06:40 +0200 (CEST)
Received: from localhost ([::1]:46422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQP9-0003eh-CI
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrb-0002xl-9O
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:00 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrY-0006LJ-0d
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:57 -0400
Received: by mail-pg1-x535.google.com with SMTP id 129so2789805pgc.5
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bgoeJG+EitAc6steECPvwA+eqgU3ODIY2NLoSDcVQq4=;
 b=gC3zL9HFx52uurQYDWZ4C2ZiCZGhwj1xWSRsfqhb21GDZIr85rLug/Zl0dK4O2uQ1W
 Zz1yBWyB3Hc92fOtr7emHGgZqJVrJbuOZcYvS6/zI/dO22Li4vptgBuqN9oSkPnikJ6+
 QzGnCK/LwyImEdB3PlS3zvH3eJEXcCGPS11zFVY+yo1r3yCTiG1rwY/+gAVvDGyYSXz3
 ErwxUYKtiDKEskYfit5JYsdKYKELxp64alTitqtpNiVqbZmOhI51ZYZ854x9jo+8cWut
 g3ggFJLxAr4CqOQzgiYkoXacQrjxIwIJ8p5C3BVn8q6ojHtjRfpUTk6D0hmxgYHtSH68
 GgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bgoeJG+EitAc6steECPvwA+eqgU3ODIY2NLoSDcVQq4=;
 b=N3s8tsWwLiX7UVQIVD0sKzM2IFn4k/IzhEv1rn2rIdm/Zn2b8UjT8fqqZ80RGjIOtP
 zJTGEQFRycsVMRzl+LeSx9mUkiToVlAt7XhcRPynPwNOna6ShcfTy6udjx82revv6XyM
 e7QdH1SWGDi9+3ez6i+YFULy1BDGxlAmoTWBc/m/U6VMkEvfVn+dfC4nEloHIoSa0vAz
 D+QtPUJuIlv6wrjYIfxy0Q/MHsA9EQY1d00fOl0Nu9llecRPNiODdEQOapLgW7GF9W8c
 svwxh4xs5+5hxg/1EXMeokT8Zuwo6+fdS7G6x0Z0FpR5ouKS0Lx4N4qU0G3Y2LH7nfau
 +ETw==
X-Gm-Message-State: ACrzQf3D8xdckHiltTNTc45MZFU9Cg+KZxcYve2TE4jz4Ww6f1lePjS2
 urehP+e42CHryS8EoT244Wb2rN7O11c=
X-Google-Smtp-Source: AMsMyM4TSK41GYrfDRPMzxMIZCfbAWttAhUolfdVJuRbVMeAgVnF+oyAn7ZnBSm4zikSn9/0iU1c+A==
X-Received: by 2002:a63:210c:0:b0:43b:e1c8:ecf0 with SMTP id
 h12-20020a63210c000000b0043be1c8ecf0mr15682121pgh.32.1664105515026; 
 Sun, 25 Sep 2022 04:31:55 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:54 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 29/54] tests/qtest: Build test-filter-{mirror,
 redirector} cases for posix only
Date: Sun, 25 Sep 2022 19:30:07 +0800
Message-Id: <20220925113032.1949844-30-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

The test-filter-{mirror,redirector} cases use socketpair() API that
is only available on POSIX and should only be built for POSIX.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v2)

Changes in v2:
- Introduce a new variable qtests_filter and add that to the
  qtests_ARCH variables

 tests/qtest/meson.build | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e910cb32ca..455f1bbb7e 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -39,9 +39,14 @@ qtests_pci = \
 qtests_cxl = \
   (config_all_devices.has_key('CONFIG_CXL') ? ['cxl-test'] : [])
 
+qtests_filter = \
+  (slirp.found() ? ['test-netfilter'] : []) + \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) + \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : [])
+
 qtests_i386 = \
-  (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +             \
-  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +                     \
+  (slirp.found() ? ['pxe-test'] : []) + \
+  qtests_filter + \
   (have_tools ? ['ahci-test'] : []) +                                                       \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +           \
   (config_all_devices.has_key('CONFIG_SGA') ? ['boot-serial-test'] : []) +                  \
@@ -95,8 +100,7 @@ qtests_i386 = \
    'vmgenid-test',
    'migration-test',
    'test-x86-cpuid-compat',
-   'numa-test',
-   'test-filter-redirector'
+   'numa-test'
   ]
 
 if dbus_display
@@ -120,30 +124,25 @@ endif
 qtests_x86_64 = qtests_i386
 
 qtests_alpha = ['boot-serial-test'] + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
-  (slirp.found() ? ['test-netfilter'] : []) + \
+  qtests_filter + \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
 qtests_avr = [ 'boot-serial-test' ]
 
 qtests_hppa = ['boot-serial-test'] + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
-  (slirp.found() ? ['test-netfilter'] : []) + \
+  qtests_filter + \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
 qtests_m68k = ['boot-serial-test'] + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
-  (slirp.found() ? ['test-netfilter'] : [])
+  qtests_filter
 
 qtests_microblaze = ['boot-serial-test'] + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
-  (slirp.found() ? ['test-netfilter'] : [])
+  qtests_filter
 
 qtests_microblazeel = qtests_microblaze
 
 qtests_mips = \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
-  (slirp.found() ? ['test-netfilter'] : []) + \
+  qtests_filter + \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
@@ -152,8 +151,7 @@ qtests_mips64 = qtests_mips
 qtests_mips64el = qtests_mips
 
 qtests_ppc = \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
-  (slirp.found() ? ['test-netfilter'] : []) + \
+  qtests_filter + \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_M48T59') ? ['m48t59-test'] : []) +                     \
   (config_all_devices.has_key('CONFIG_TCG') ? ['prom-env-test'] : []) +                      \
@@ -174,13 +172,11 @@ qtests_sh4 = (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-te
 qtests_sh4eb = (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : [])
 
 qtests_sparc = ['prom-env-test', 'm48t59-test', 'boot-serial-test'] + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
-  (slirp.found() ? ['test-netfilter'] : [])
+  qtests_filter
 
 qtests_sparc64 = \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
-  (slirp.found() ? ['test-netfilter'] : []) + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
+  qtests_filter + \
   ['prom-env-test', 'boot-serial-test']
 
 qtests_npcm7xx = \
-- 
2.34.1


