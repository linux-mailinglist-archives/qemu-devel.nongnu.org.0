Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A9834657C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:40:04 +0100 (CET)
Received: from localhost ([::1]:46356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOk4Z-0002KT-CW
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjKP-0005lz-Iw
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:52:22 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjK8-0003dR-AD
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:52:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id j7so21304226wrd.1
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 08:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Myy6NtGAPdIXwYr97fxHZnULk9+SaTCaWGOnhyLTAiI=;
 b=GEUeuKfWsc7OFTnKfz1BMPr4wT7GJiPoO01dQv4uUFew60n3WWBmiNBp4pKqUZwC5L
 iV1LYLC9AOJ5Qf+dPq9AxxekTJi1UWpnP65ohn6nutK6lVCoCcl9ZAbTMzr96Fl2MG5r
 amV4VkhjgeHqaNLJSHjUaasOSDpx3VDy1vp2lurjWJHhkAsh54i6OWyK2ZuHmFfGGULQ
 +kXwk1Dc4QDH1ySot/qO0vDP6+6EQbWLDYwQIVCDouFMq4VqBoW09QIbeUJCWCMpf2jG
 bYIUc5oF+Ix7wnsDMIsDizDRurPZagW5JdVTwSiuEcCkNBsfMKeZgiz69HrEOB1I+oVY
 7V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Myy6NtGAPdIXwYr97fxHZnULk9+SaTCaWGOnhyLTAiI=;
 b=Wz7mdptGH+gUV4ZqtO3MEOd6nGSChF7jPg/+roSfyvVZVY4c4y98Yz6ctGVls/X797
 yekWFDUVFdwohYd5qfig2v+hS7YBaBfgD9TDQ4bYPHlcTmULS6E0GdwqrWA3CzA6nA+m
 R2Nwx4hAyo/l70RNPVvEwfM3/7KXcxnfCYQ9jTxCieox+XewGcfbWtCRsrMcRwDDTYvS
 jh2F+7UeMGSKxd+aUI1FFdJ3OcxJ1BHM/QN0ExPiKo8yTd62IQWL9cF9NyiS/UzF67qp
 UjF7tMFsNcUqCJWbDWAVi5ARwMnq+6FJXg1mWsIfqMz4AISALoKsIKN4FFqaFkxpiP0Y
 dYHQ==
X-Gm-Message-State: AOAM530Wg1O1tGnxv1UTcdvh8umMyzK/rlLLZDYVf25XKvHAdXfbnn7n
 pjhh9FzVF27UngstWuKNrTFOlZkiSsPEAw==
X-Google-Smtp-Source: ABdhPJw80DzThkCCCOxSyax94GYNFjR4eqHagPBbW9/1LaVPpEDYNm4KN8X5gr6sGTc4X5l1M4ZmMA==
X-Received: by 2002:a05:6000:191:: with SMTP id
 p17mr4775414wrx.154.1616514722601; 
 Tue, 23 Mar 2021 08:52:02 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q17sm23560292wrv.25.2021.03.23.08.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:52:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/13] blobs: Only install PA-RISC SeaBIOS if hppa system
 target is built
Date: Tue, 23 Mar 2021 16:51:25 +0100
Message-Id: <20210323155132.238193-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323155132.238193-1-f4bug@amsat.org>
References: <20210323155132.238193-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Helge Deller <deller@gmx.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Helge Deller <deller@gmx.de>
---
 meson.build         | 2 ++
 pc-bios/meson.build | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 10c21ef52af..a7f3b60d08e 100644
--- a/meson.build
+++ b/meson.build
@@ -95,11 +95,13 @@
 install_edk2_blobs = false
 install_blobs_alpha = false
 install_blobs_arm = false
+install_blobs_hppa = false
 if get_option('install_blobs')
   foreach target : target_dirs
     install_edk2_blobs = install_edk2_blobs or target in edk2_targets
     install_blobs_alpha = install_blobs_alpha or target in ['alpha-softmmu']
     install_blobs_arm = install_blobs_hppa or target in ['arm-softmmu', 'aarch64-softmmu']
+    install_blobs_hppa = install_blobs_hppa or target in ['hppa-softmmu']
   endforeach
 endif
 
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 635485931b9..c494c334e26 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -76,7 +76,6 @@
   'u-boot.e500',
   'u-boot-sam460-20100605.bin',
   'qemu_vga.ndrv',
-  'hppa-firmware.img',
   'opensbi-riscv32-generic-fw_dynamic.bin',
   'opensbi-riscv64-generic-fw_dynamic.bin',
   'opensbi-riscv32-generic-fw_dynamic.elf',
@@ -101,6 +100,12 @@
   ))
 endif
 
+if install_blobs_hppa
+  blobs_ss.add(files(
+    'hppa-firmware.img',
+  ))
+endif
+
 blobs_ss = blobs_ss.apply(config_host, strict: false)
 
 if get_option('install_blobs')
-- 
2.26.2


