Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A691550C8F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 15:52:44 +0200 (CEST)
Received: from localhost ([::1]:51336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfPOl-000481-R0
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 09:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41558)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hfPGI-0006iv-CW
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:43:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hfPGG-0007g5-Mc
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:43:58 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40189)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hfPGG-0007OS-AM
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:43:56 -0400
Received: by mail-wm1-x32f.google.com with SMTP id v19so13430096wmj.5
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 06:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UmlC5jhm/yiDMB/28jG9Y1RW/s/4aA4e4sfjTnMWwG4=;
 b=obrIbgPGbOjoOwra80SsV3ITSoWb/Un6kxVUrlBzcsbEp8kslAZ1/mT13TKTgnQSK5
 GL5O8V+yMwd4CBBYfCPnV7kL0T59sMy3DEvw2rmos89naaRqb84V6LZgZ7F7wCnZXmUb
 r5nn0JNSs7y2YpQbG6NaYSNBa/w/O6fUSYMC8Tg8TyeTYr8+m4USdw2TlranpSivwREd
 sglLj1Zmwz28F9MTWTWaN2SSbqQxPA3iKKii1PUdcYPDWKqIZjiSzwOe7pRuLBWEGzkj
 H3QLR7pVEdSu7JJF+nr8Y3dI+GO18ycd8Sox0ihzv1+DuvZ15+ywpnC+Fz78Nbq446s2
 Ak0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UmlC5jhm/yiDMB/28jG9Y1RW/s/4aA4e4sfjTnMWwG4=;
 b=sLbADiSdoVK0j6jIqnNbBkjbBt+fxVyvwGvr1dqCHloHt+RcBAcU7jxaLnSZOAfnjb
 zyGLWtHSFT2VnjgNJCN2ILwJA7O8b6IU8aIYxwl6RRsr45Vgu7+DqjyXxFUOlToQZHYH
 DRIStUByMq2lI8sbjEe/p14QOPLmihTXpNx/NSTk6ms6MjReYNbF/lc3ISqBI3OaRAbG
 DEgQSPnZrCLcE19mIO19ec82qnb0c37MQ/hMXveMun9gZCkVhhpIVOOllwAaR/PTx0jL
 IWr3qyeEnHLkNRZLzrfav7h7wXJnFI2M1KaBkg6tZeRBxRwGYJ/46y2bXN8KoUv8/326
 R6zA==
X-Gm-Message-State: APjAAAVCUrzUu2NesLG+ZVHm8f/BXM3sdhgK/sVyrRev4SYo/OAPcR0A
 SPPVXYBmQ21kN2j5JF9yUAcrhw==
X-Google-Smtp-Source: APXvYqxfXFCree/i0XFd2AIns4ij+K9pYRujG9dNl35kRHA1Ucb4x0pimJFgRgwjiaasPyV+Mob0SQ==
X-Received: by 2002:a1c:dc45:: with SMTP id t66mr16621984wmg.63.1561383822979; 
 Mon, 24 Jun 2019 06:43:42 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id y133sm23398521wmg.5.2019.06.24.06.43.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 06:43:41 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EACB61FF92;
 Mon, 24 Jun 2019 14:43:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Mon, 24 Jun 2019 14:43:23 +0100
Message-Id: <20190624134337.10532-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624134337.10532-1-alex.bennee@linaro.org>
References: <20190624134337.10532-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32f
Subject: [Qemu-devel] [PULL 05/19] tests/vm: send proxy environment
 variables over ssh
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Packages are fetched via proxy that way, if configured on the host.
That might be required to pass firewalls, and it allows to route
package downloads through a caching proxy server.

Needs AcceptEnv setup in sshd_config on the guest side to work.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190617043858.8290-2-kraxel@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 4847549592..5e30bac661 100755
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -38,6 +38,13 @@ class BaseVM(object):
     GUEST_PASS = "qemupass"
     ROOT_PASS = "qemupass"
 
+    envvars = [
+        "https_proxy",
+        "http_proxy",
+        "ftp_proxy",
+        "no_proxy",
+    ]
+
     # The script to run in the guest that builds QEMU
     BUILD_SCRIPT = ""
     # The guest name, to be overridden by subclasses
@@ -106,6 +113,8 @@ class BaseVM(object):
                    "-o", "UserKnownHostsFile=" + os.devnull,
                    "-o", "ConnectTimeout=1",
                    "-p", self.ssh_port, "-i", self._ssh_key_file]
+        for var in self.envvars:
+            ssh_cmd += ['-o', "SendEnv=%s" % var ]
         if interactive:
             ssh_cmd += ['-t']
         assert not isinstance(cmd, str)
-- 
2.20.1


