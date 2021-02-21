Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FC3320D64
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:08:53 +0100 (CET)
Received: from localhost ([::1]:60720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDv2D-00005D-1d
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDux2-00048g-Tl; Sun, 21 Feb 2021 15:03:34 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDux1-00086y-H4; Sun, 21 Feb 2021 15:03:32 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h98so12108820wrh.11;
 Sun, 21 Feb 2021 12:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tuW/bZqhOYUsUa8HZIutmrxZFzUxuZRNcKFfymRQrfU=;
 b=LlWXUOeD9e7COvfdu70Y228yhgm+WUhqWxbtK8oSoX2Rj0uev6AK9inPTqfD3pejFS
 dk+eRaVkGj14zELlQWLDm6FkxFwVQqP8mjOcaGAIfaYTkCcZOxJSpa4balToqoSHO7w+
 4vWNlOajFGr5h92peCFkUuS65a+P6m14W9cLKRYOTvMQ8DuGN8JjK8Q3oIYieKatGlIr
 8K0mlBRP05tq4BAalS/87FaM1DoQreIPShqgQAoMBs5z1/JRNwbOKWqvtqEOaBG7SX8O
 U2/FPaP8FDPiA8m72S/PyoqdCne3SZdWIvEEo5ZkZws+Pfmned6fNT0O6xrAN+OzsXm9
 U76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tuW/bZqhOYUsUa8HZIutmrxZFzUxuZRNcKFfymRQrfU=;
 b=mGZuahZI1PTZGA+P8HSzbSd5bctgavjhiCSue8oumtU+1v4EYAvbUZxR281oIFbWSL
 scb3R7P4f1NivL/drEhBfQelH4NRcZ6u1sKEBbqlvlwO6BjFNdTUlLbqgqXM3TGcokhO
 yw5BIjLnUfhAWNohVrXkmEpBHLOj4VwhcI9DYaENq5UH4XEV/WexJoifNmPknQrabcWm
 gFG88Zap7erNeET1oJNADNSb7y1NVHd+Vqh7tv3zaPPPiHFvdaiUg7amOUeFaUh29pVi
 asUcvCMkDKcm5hE5DYqIz/V5uPDwFpHr6uFq0SEFte4Dg3kvICzV1kC6GTaFgo16D4Mn
 2Weg==
X-Gm-Message-State: AOAM530vxFKtG/xAk/cyxr8KJjTuTddXtZi5J+LHfiY1kmBL10W0jwzC
 1zDXSetVlzBTi61IOdrxUhdj3mHtJnc=
X-Google-Smtp-Source: ABdhPJxarupXBZfEX/DKUyJl1AMb7JcB4vv2euT2smh5XgoNrnbRpZQmuJKtRBl456TcwmWqBRLOHw==
X-Received: by 2002:adf:e90e:: with SMTP id f14mr17742203wrm.324.1613937809888; 
 Sun, 21 Feb 2021 12:03:29 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h12sm31429397wru.18.2021.02.21.12.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 12:03:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] hw/pci-host: Introduce SH_PCI Kconfig entry
Date: Sun, 21 Feb 2021 21:02:48 +0100
Message-Id: <20210221200249.2536247-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221200249.2536247-1-f4bug@amsat.org>
References: <20210221200249.2536247-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to be able to use the 'SH4' config for architecture
specific features. Add more fine-grained selection by adding
a CONFIG_SH_PCI selector for the SH4 PCI controller.
Move the file with the other PCI host devices in hw/pci-host
and add its missing MAINTAINERS entries.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/{sh4 => pci-host}/sh_pci.c | 0
 MAINTAINERS                   | 1 +
 hw/pci-host/meson.build       | 1 +
 hw/sh4/Kconfig                | 1 +
 hw/sh4/meson.build            | 1 -
 5 files changed, 3 insertions(+), 1 deletion(-)
 rename hw/{sh4 => pci-host}/sh_pci.c (100%)

diff --git a/hw/sh4/sh_pci.c b/hw/pci-host/sh_pci.c
similarity index 100%
rename from hw/sh4/sh_pci.c
rename to hw/pci-host/sh_pci.c
diff --git a/MAINTAINERS b/MAINTAINERS
index 6117ad414a4..7698a69e621 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1390,6 +1390,7 @@ S: Odd Fixes
 F: hw/char/sh_serial.c
 F: hw/sh4/r2d.c
 F: hw/intc/sh_intc.c
+F: hw/pci-host/sh_pci.c
 F: hw/timer/sh_timer.c
 F: include/hw/sh4/sh_intc.h
 
diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
index 1847c69905c..87a896973e7 100644
--- a/hw/pci-host/meson.build
+++ b/hw/pci-host/meson.build
@@ -10,6 +10,7 @@
 pci_ss.add(when: 'CONFIG_PCI_SABRE', if_true: files('sabre.c'))
 pci_ss.add(when: 'CONFIG_XEN_IGD_PASSTHROUGH', if_true: files('xen_igd_pt.c'))
 pci_ss.add(when: 'CONFIG_REMOTE_PCIHOST', if_true: files('remote.c'))
+pci_ss.add(when: 'CONFIG_SH_PCI', if_true: files('sh_pci.c'))
 
 # PPC devices
 pci_ss.add(when: 'CONFIG_PREP_PCI', if_true: files('prep.c'))
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index 34c01dadde9..b9f0538d57f 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -11,6 +11,7 @@ config R2D
     select SM501
     select SH4
     select SH7750
+    select SH_PCI
 
 config SHIX
     bool
diff --git a/hw/sh4/meson.build b/hw/sh4/meson.build
index 303c0f42879..424d5674dea 100644
--- a/hw/sh4/meson.build
+++ b/hw/sh4/meson.build
@@ -2,7 +2,6 @@
 sh4_ss.add(files(
   'sh7750.c',
   'sh7750_regnames.c',
-  'sh_pci.c'
 ))
 sh4_ss.add(when: 'CONFIG_R2D', if_true: files('r2d.c'))
 sh4_ss.add(when: 'CONFIG_SHIX', if_true: files('shix.c'))
-- 
2.26.2


