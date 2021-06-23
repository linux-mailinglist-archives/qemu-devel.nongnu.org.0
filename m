Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4183B1FF9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 20:03:26 +0200 (CEST)
Received: from localhost ([::1]:57254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw7Dh-0008Vn-N7
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 14:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7B5-0005ie-VS; Wed, 23 Jun 2021 14:00:44 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7B3-00033A-Pw; Wed, 23 Jun 2021 14:00:43 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso4535645wmh.4; 
 Wed, 23 Jun 2021 11:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jpfEeYicWk3WcHYujzH4ZYs5R2DyejTVybejhWkZu7c=;
 b=GDo6Wsq33MoBa8m4nDO0NBM76C8tBygSmbtPDzVbNujY2NIj2/c3QncpLpBNh79F56
 gGiafNeovpUy9d8Dwq8BEfRlZTL8zrujhNunXNREfv0KBAPm3qbvnP2ptWCxICdmaZrw
 RowHo+9WRonRbiBoL+Q+qRrJ8FffkA2zj3q3IdqqVTDEh8KcSihCJRP0sRbdLyvALMja
 4zsxk1wSRtoIAg7dLba4e0uCjWXV34TG9Zsl9KmvILpu/OeFmzSvJQUCNHj+0XWgwF5B
 hRBv1a8bsWpEHAeun9R/N+24nW/SL6JusF0AuTpQ+a/+Kd/pr+XhaSORhd89CCVLGwod
 3v6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jpfEeYicWk3WcHYujzH4ZYs5R2DyejTVybejhWkZu7c=;
 b=ekY1Y62A00vqrltmJVmY3I+nTxzguE4brB+wWUyZUBWf4Lbkzc/4OIaA94me4DieKK
 msuwpgSHTQOu8CvYcD4CoAo35hTBLC74FLCuG0H+6ZM2EegX68lNVDXd5kihpLaU5rRg
 lWzq9eMTAOWrvZ0Xi1pUNv1zvDmL/qiaEK4bt5qcCk0yLqIR/LkbwRxFETQvzSrCeS3e
 RTWfo8wiTdociAAlvIvE2Wr7AQCg0mCMYf0FAr+WcIwmf8TxWgntBXmXYUUZZOLDt318
 k+SyI/6GCyKIK/yDIdidfOFTHlZlKBrHnQPIoh9388mMIIMF2Xze+A1P/7etFX1K1w86
 3lLA==
X-Gm-Message-State: AOAM531n5pIr5WKAT3XHArmBS+k0gsHUiuSpA/FhNQr8xTvElMVoDCqt
 2yj11B9alY36OsdLU5daFjK/ef73LgVC0g==
X-Google-Smtp-Source: ABdhPJyM+/mAaoIFo5rA5NFnrUDbvXtKxWajw/+EQxD15G0NR+ILFupNsmxVKadvlvIzY4M+XCq35A==
X-Received: by 2002:a05:600c:a4c:: with SMTP id
 c12mr12236702wmq.38.1624471239854; 
 Wed, 23 Jun 2021 11:00:39 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l23sm7660720wmc.5.2021.06.23.11.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 11:00:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] tests/acceptance: Tag NetBSD tests as 'os:netbsd'
Date: Wed, 23 Jun 2021 20:00:15 +0200
Message-Id: <20210623180021.898286-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623180021.898286-1-f4bug@amsat.org>
References: <20210623180021.898286-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Tom Yan <tom.ty89@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avocado allows us to select set of tests using tags.
When wanting to run all tests using a NetBSD guest OS,
it is convenient to have them tagged, add the 'os:netbsd'
tag.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 1 +
 tests/acceptance/ppc_prep_40p.py       | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index cded547d1d4..20d57c1a8c6 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -862,6 +862,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
         :avocado: tags=arch:arm
         :avocado: tags=machine:orangepi-pc
         :avocado: tags=device:sd
+        :avocado: tags=os:netbsd
         """
         # This test download a 304MB compressed image and expand it to 2GB
         deb_url = ('http://snapshot.debian.org/archive/debian/'
diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_prep_40p.py
index 96ba13b8943..2993ee3b078 100644
--- a/tests/acceptance/ppc_prep_40p.py
+++ b/tests/acceptance/ppc_prep_40p.py
@@ -27,6 +27,7 @@ def test_factory_firmware_and_netbsd(self):
         """
         :avocado: tags=arch:ppc
         :avocado: tags=machine:40p
+        :avocado: tags=os:netbsd
         :avocado: tags=slowness:high
         """
         bios_url = ('http://ftpmirror.your.org/pub/misc/'
@@ -64,6 +65,7 @@ def test_openbios_and_netbsd(self):
         """
         :avocado: tags=arch:ppc
         :avocado: tags=machine:40p
+        :avocado: tags=os:netbsd
         """
         drive_url = ('https://cdn.netbsd.org/pub/NetBSD/iso/7.1.2/'
                      'NetBSD-7.1.2-prep.iso')
-- 
2.31.1


