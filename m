Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977CF605DE0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 12:41:59 +0200 (CEST)
Received: from localhost ([::1]:59448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSzs-0005cS-Mr
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:41:56 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSzh-0002wl-E7
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olSew-0004K8-0F
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:20:18 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olSeu-0004LB-56
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:20:17 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l14-20020a05600c1d0e00b003c6ecc94285so2118932wms.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 03:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+TEzLKXHSYLYaRf2ur7/YkVrD096ac7fNMXbBKKnNGw=;
 b=qbSKD5FNYtrb4ylu4LG71MbNRMYOQthWLifiQRYxD55kYMt8mcCNCw1Rq7AsruuHGQ
 ESONAlje6LFk8hAJXgdPcuWIyRDuiSYif9bIZ9384jp5R5PNQO5epwZdpPNqcu2p00V0
 XKYsDHM2fEQCH+OGLXqfMwIkQ2RnsAYkweZYM+DCUm8G61CNpDGeObchI5n6h19Ii2x7
 Ax0nLvPcBjIbRBIouQGiy+ZxARVscbye6AM1oj9xoHg8JcjC65yhaNVJ2+VVsNQmAR35
 r439c7vYnPFP+nJubWEQtAa5WVpZELjA4QrovHymmWQyQV3HkTZ24oB11jQzxIPvci/M
 e5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+TEzLKXHSYLYaRf2ur7/YkVrD096ac7fNMXbBKKnNGw=;
 b=OP2wctWtvTSmv+jfmB77u2K0//YSE/YW+gY4wZfwl1fwgdeE5sAWPTCVZ2eO+caIU2
 4Whq+wDdkUra6OKtPyMIwLD2TcSOW4MjLdIwWsXLYMxPnF7Pc9qGvdtN48kQbfjpSQFe
 IZxsoo4LEZc+QkOPRKLoPUyFLdzkSpmGyhUIaQdhj2dStvbKlHVWFH2zd5MqOY+Pgd3N
 6n2TiFiGll1eUzIGyJKbVz8K4NBOfIin4iRhq064YbXkYatbV1ZbahQcq/Dd95SO0pEp
 v5HuAsruW7AHytxv19TIIbCbWdbgv7I++f9+b2T9UzDwy95Jpvy/hr9GSQ8LElBGpVau
 FGwA==
X-Gm-Message-State: ACrzQf0hYEsreGq26MaOhb6gEBilAE7gl29ZxGYOYz6HN6FqbdjhfmKr
 t//eQf6uAITcx4HV1PBbQ+iAtw==
X-Google-Smtp-Source: AMsMyM6U2vroAO0FqNYAdDadNugaGYEyuW83ACucPbn4b/UnXkjkVkTAhIYceRs5zrHIWX+ppbivJw==
X-Received: by 2002:a05:600c:219a:b0:3c6:f259:7e30 with SMTP id
 e26-20020a05600c219a00b003c6f2597e30mr16628662wme.111.1666261214456; 
 Thu, 20 Oct 2022 03:20:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b003b47ff307e1sm2249128wmb.31.2022.10.20.03.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 03:20:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH] tests/avocado: raspi2_initrd: Wait for guest shutdown message
 before stopping
Date: Thu, 20 Oct 2022 11:20:12 +0100
Message-Id: <20221020102012.3015662-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The avocado test
 tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
finishes wiith

    exec_command(self, 'halt')
    # Wait for VM to shut down gracefully
    self.vm.wait()

In theory this should be fine. In practice it runs into two bugs:

 * when the test calls self.vm.wait() Avocado closes the socket
   connection to the guest serial console immediately, so the
   avocado logs don't have the last part of the guest output:
   https://gitlab.com/qemu-project/qemu/-/issues/1265
 * when the socket is closed, a bug in the QEMU socket chardev
   means that it loses any data that the guest UART has not
   yet consumed. This means that the guest doesn't always read
   the full 'halt' command string, so the test intermittently
   fails with a timeout:
   https://gitlab.com/qemu-project/qemu/-/issues/1264

Work around both of these by waiting for the guest to print the
string that means it has completed the shutdown process.  This fixes
a very long standing intermittent failure in this test.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/636
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/avocado/boot_linux_console.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index ca9d09b0d7c..eed4b49e6e4 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -489,7 +489,7 @@ def test_arm_raspi2_initrd(self):
                                                 'BCM2835')
         exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
                                                 '/soc/cprman@7e101000')
-        exec_command(self, 'halt')
+        exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
-- 
2.25.1


