Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C451FE43B6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 08:44:26 +0200 (CEST)
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNtKj-0000QF-F1
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 02:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iNtDv-000347-8P
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:37:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iNtDu-0008Nt-8e
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:37:23 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:50775)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iNtDu-0008NU-2Q
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:37:22 -0400
Received: by mail-wm1-x343.google.com with SMTP id 11so770392wmk.0
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 23:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7lImME4yU8lQjHY3wQXqs44DBkoFK3uSqvZ6R7jQMW0=;
 b=gdwQ7JDcWrA0gpmlZx20c6JON2HQJ+vy1mn/tvvxbCuO0QfvZblL0ezEI/fbMZv6xI
 2pOK3C6IqYZv8POQeR1ax/4kzYZ19IcuywSaqBqOwUz5uaFj+i26O2efRFBkOx1w7JCA
 lPgYhPVjYCzOqDMSrnqyLTpia9f0ufZyEjtaoJI4GljwaHWvrbQkczfb490Uw412EkYi
 PZGeyOFg4z1ILZ1lMBQg+NFcQvQtwDgHtANFMvG70szuYy8xdGKSpFU8z+ACeaUGkzKQ
 a8HUnfruIPgRl18eYe6JgJRgJyZDK2zEbTGKQtzbn6Kcjjm8Yi7KIULB1Tz/I1YDAPUK
 SW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7lImME4yU8lQjHY3wQXqs44DBkoFK3uSqvZ6R7jQMW0=;
 b=J0KsjES6dqLLBDZi4SOZYCcXZ5Iwn9Al/QWfRBNUqzOgH99EGMmvtZ+9rPRtKz+n5y
 XUcyBGd8D8vBTMlCGVoNdpTIaO9grz1kNIrXSgbVRiYND6wMXkCDfRA0jvN1xBl9mzj9
 aMjoDHh4vFwTTX0wwZwzya8DS2w7wdl7Kl1T0+MDB79oFec86zvQ1VrTowj0WwxWbmT9
 sKcTp4kwIEwCFUj69XfX0W0MI9H0l7YRDO1UvTs+JPbDOVfEkNNmeuDyfUp77uXH4zqC
 eAIPQVAakwoVkq0BoRWbrZGL1Xepwa3RmWSqe9RrJw8hGtmy95OQ3Lx7f56N2N79DPCP
 7aCA==
X-Gm-Message-State: APjAAAXOCUQI8oXDIBbjWsCj4lj7+zxYw9vr5/6vLfH6JWBEJIFTpEB0
 o2wcB3H2dUThAvaSQItv8RZfdQ==
X-Google-Smtp-Source: APXvYqy6RRGjhVPRbdD8Yg3iTcUCJhXpUPD70bzCN76QayXFNNmJ+4DRmHmLEcOpXD0UcDx0isXI5A==
X-Received: by 2002:a1c:610b:: with SMTP id v11mr1823629wmb.156.1571985440911; 
 Thu, 24 Oct 2019 23:37:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f20sm1069070wmb.6.2019.10.24.23.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 23:37:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9BE3B1FF9A;
 Fri, 25 Oct 2019 07:37:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 10/73] tests/vm: Let subclasses disable IPv6
Date: Fri, 25 Oct 2019 07:36:10 +0100
Message-Id: <20191025063713.23374-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025063713.23374-1-alex.bennee@linaro.org>
References: <20191025063713.23374-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

The mechanism will be used to work around issues related to IPv6
on the netbsd image builder.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191018181705.17957-3-ehabkost@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 4921e47f9f2..59bd1d31fbe 100755
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -57,6 +57,8 @@ class BaseVM(object):
     arch = "#arch"
     # command to halt the guest, can be overridden by subclasses
     poweroff = "poweroff"
+    # enable IPv6 networking
+    ipv6 = True
     def __init__(self, debug=False, vcpus=None):
         self._guest = None
         self._tmpdir = os.path.realpath(tempfile.mkdtemp(prefix="vm-test-",
@@ -81,7 +83,8 @@ class BaseVM(object):
         self._args = [ \
             "-nodefaults", "-m", "4G",
             "-cpu", "max",
-            "-netdev", "user,id=vnet,hostfwd=:127.0.0.1:0-:22",
+            "-netdev", "user,id=vnet,hostfwd=:127.0.0.1:0-:22" +
+                       (",ipv6=no" if not self.ipv6 else ""),
             "-device", "virtio-net-pci,netdev=vnet",
             "-vnc", "127.0.0.1:0,to=20"]
         if vcpus and vcpus > 1:
-- 
2.20.1


