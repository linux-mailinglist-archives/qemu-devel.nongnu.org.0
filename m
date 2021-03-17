Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A78833EA9D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:35:54 +0100 (CET)
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQif-00026I-4A
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQbk-0004oo-Il
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:28:45 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQbi-0003GM-JT
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:28:44 -0400
Received: by mail-ej1-x635.google.com with SMTP id bm21so953350ejb.4
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i4qtpgFxjTfX/0jE0IFITa6xyZMd1ATFYN618t3ivG8=;
 b=WD/VWwUAmQX+hyoguUOcTMfyok9PoIqcfHzl0GnSOsDoc8ikFTm3vc+2mfN9ISXoYo
 v64TUeqcYzUU7FIiFNvjVyoDEQTSAgIXsHxBe+vlaPQmcYuMDCuD9OImz7puRRp4nJzw
 EFmxQnxUDOGbLvTHf/VibcF79bFrC0yddfZ213PQoB2vHc/bLYhNdJ0d2dPVMG7HxXex
 LfcwwRhrLsfomZeXOrQLMLCE7eKoxzynUaH2Zuqv6FaeL0c0dzzpmHCgQ8PI3DCJ9SYP
 wahNF2cViC9ycbgX4B/oBfca5CpAl7Fg6Lc6Yk2TpHubndsKSxMpARESbOshNUXAa0K4
 yiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i4qtpgFxjTfX/0jE0IFITa6xyZMd1ATFYN618t3ivG8=;
 b=soPDS291lkyoclCWaXCWR1risZtbuxvOHwUED8r6psEV4KyDNvj5pnsOeFMIADrtfk
 r5/F+QPVq3DbhjjNb+9FpB4XtATJEj7Na0JJyN2BNZrcUzsRyOjnF/FanIcPTecPumkf
 O7v271MmkhZWbf+NSujWSmbW8cCsthxcz/hdqpzvO49bWPNkhCf7Lj4U5lLhgnxgWb3a
 Z9d9cJ12EIMquhLq+bUK+bZ0JLHB1fNCNpGjZvBZzuHGKQ2IdJqbL3L15ob1uEYRsgV0
 ZcW7IymBFccgr2OA5Yr2Bm6sGtY3gGCYFctUWFtzQoSnGJ1qXkp3U2kUt5tHjEJIo2EF
 gXXw==
X-Gm-Message-State: AOAM530p7wgOrpocfPG3mzyON6QPbCjHjJQPXVEjO3ulJqkayFhT3iZz
 Z4vL8YDMNEtmM3+0m4CxJT4rKg==
X-Google-Smtp-Source: ABdhPJxXG9vGmnR3yjWf/0O+1H7B3LVUax4PSplNZZWTXhhk5OOegZE3oLloyNg35tRgOAVG6VGAaA==
X-Received: by 2002:a17:906:cf90:: with SMTP id
 um16mr34439128ejb.389.1615966121268; 
 Wed, 17 Mar 2021 00:28:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id kj3sm10823584ejc.117.2021.03.17.00.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 00:28:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 000B31FF9E;
 Wed, 17 Mar 2021 07:22:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 15/15] hw/core: Only build guest-loader if libfdt is
 available
Date: Wed, 17 Mar 2021 07:22:16 +0000
Message-Id: <20210317072216.16316-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317072216.16316-1-alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

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
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210315170439.2868903-1-philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index fdf03514d7..9397503656 100644
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
index 9cd72edf51..59f1605bb0 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -16,6 +16,7 @@ hwcore_files = files(
 common_ss.add(files('cpu.c'))
 common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
 common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
+common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
 common_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
 common_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
 common_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
@@ -37,8 +38,6 @@ softmmu_ss.add(files(
   'clock-vmstate.c',
 ))
 
-softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('guest-loader.c'))
-
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
   'machine-qmp-cmds.c',
   'numa.c',
-- 
2.20.1


