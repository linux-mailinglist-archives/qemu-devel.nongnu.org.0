Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D786F55B5F5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 06:12:28 +0200 (CEST)
Received: from localhost ([::1]:60836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5g6t-0004uf-M0
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 00:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o5fsw-0004gY-P3
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 23:58:03 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o5fsu-0007zN-7e
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 23:58:02 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 n16-20020a17090ade9000b001ed15b37424so8166930pjv.3
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 20:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pv04gkshDxNH3B9RohTSkXVFQo/HTk4n+LV9OX7qnAM=;
 b=Wk9odHKE8NFaKDug++ZBprDAxk7v41Zlhj75fNO/8bSmAbTgD/jJqjGVGD6xudomlP
 n3lvaf12dHFV7AxJ0QcLYHb2Xbp3m2ZierJW4gkzgmU2sJ4t2I8uxDvDaWvPNvZtiiVa
 ymKFFpVVZefdYLprnvmkv2y79UiRWd/0j3WfIDDzxRLFdAhr4eG6/+efrCzXOcZ1EyZv
 AlbNHmXEUbljc5zj7KR3U99sEWCXJDg/G9Kup7D/LC9JcYtZQgtFqLmTkhTf0GzU3WP4
 CB43Rysify1Rg/tn4UJFRL0imeFITdtG/BOgblK2ApEcFuikkITbhEvOzIgAxBir5pKS
 EXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pv04gkshDxNH3B9RohTSkXVFQo/HTk4n+LV9OX7qnAM=;
 b=eYyfQkNV54OGPzfbsNlAJZ0++vUD3su6yEg9PgjGmhcgUNXVz+lVg+5y+fQMEQUckf
 Vm5UnaYtLRw1/OXeyI0KDWr9Qh/ux+lAUhyNzbBG/UA2kwTb3BbSVrmedMUFWFBnMWv3
 1bZfCHv0/QEL+rlPhWMBUL5p061A0EM9uM15MmK3CNrGu3Tgqgi2TECiHwtjnxN6l8iu
 It1epKJ5E5gRfBRl88NoyRk+isdbVQ1FqT4YIJhq6o/WvncGGDqNZMt+mNy401NV6T9Z
 ZMZ/6eNTa6q/gNymv10SNFBygA/lhdOnPFij85+5wrmE0p6f5iIj0IlDjckpmpzQNJQx
 XmMQ==
X-Gm-Message-State: AJIora/0DwSdHCuXwXDs8tZ65wv72eZ7sRirR17bhd7waDRuIv1wNNOa
 BvjeEdOz09asKsKbEsoM9ts=
X-Google-Smtp-Source: AGRyM1sD5/Q6UowBenRT4qF28od+2iGKCeVbA4LoQPnW84bp5Y/v7unbioJZMy+y8dDcynveROl5Vw==
X-Received: by 2002:a17:90b:1d92:b0:1ed:38d5:c45e with SMTP id
 pf18-20020a17090b1d9200b001ed38d5c45emr13481478pjb.167.1656302278817; 
 Sun, 26 Jun 2022 20:57:58 -0700 (PDT)
Received: from localhost.localdomain ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 a9-20020aa78649000000b0052531985e3esm5951314pfo.22.2022.06.26.20.57.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 26 Jun 2022 20:57:58 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v10 1/4] tests/vm: do not specify -bios option
Date: Mon, 27 Jun 2022 12:57:41 +0900
Message-Id: <20220627035744.23218-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220627035744.23218-1-akihiko.odaki@gmail.com>
References: <20220627035744.23218-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Paolo Bonzini <pbonzini@redhat.com>

When running from the build tree, the executable is able to find
the BIOS on its own; when running from the source tree, a firmware
blob should already be installed and there is no guarantee that
the one in the source tree works with the QEMU that is being used for
the installation.

Just remove the -bios option, since it is unnecessary and in fact
there are other x86 VM tests that do not bother specifying it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220616083025.116902-1-pbonzini@redhat.com>
---
 tests/vm/fedora  | 1 -
 tests/vm/freebsd | 1 -
 tests/vm/netbsd  | 1 -
 tests/vm/openbsd | 1 -
 4 files changed, 4 deletions(-)

diff --git a/tests/vm/fedora b/tests/vm/fedora
index 92b78d6e2c9..12eca919a08 100755
--- a/tests/vm/fedora
+++ b/tests/vm/fedora
@@ -79,7 +79,6 @@ class FedoraVM(basevm.BaseVM):
         self.exec_qemu_img("create", "-f", "qcow2", img_tmp, self.size)
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
             "-device", "VGA",
             "-cdrom", iso
diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 805db759d67..cd1fabde523 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -95,7 +95,6 @@ class FreeBSDVM(basevm.BaseVM):
 
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
             "-device", "VGA",
             "-cdrom", iso
diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index 45aa9a7fda7..aa883ec23c9 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -86,7 +86,6 @@ class NetBSDVM(basevm.BaseVM):
 
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
             "-cdrom", iso
         ])
diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 13c82542140..6f1b6f5b98a 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -82,7 +82,6 @@ class OpenBSDVM(basevm.BaseVM):
 
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
             "-device", "VGA",
             "-cdrom", iso
-- 
2.32.1 (Apple Git-133)


