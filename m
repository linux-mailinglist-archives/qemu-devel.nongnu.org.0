Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59775E54D0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 22:03:24 +0200 (CEST)
Received: from localhost ([::1]:35718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iO5nu-00047b-3B
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 16:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57813)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iO5Oi-0008Fl-Cf
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 15:37:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iO5Og-00038f-Lk
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 15:37:19 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37644)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iO5Og-00037w-Fg
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 15:37:18 -0400
Received: by mail-wm1-x330.google.com with SMTP id q130so3169598wme.2
 for <qemu-devel@nongnu.org>; Fri, 25 Oct 2019 12:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nM9J2cmbyGFwjMjK+CMae4AlsIxqtsY1sLspbcwHaoY=;
 b=Db+xTT4yY2eOactcJaKleahmhyHRLxLwyx2+/iW8b4DilZtsgD+DzRcfI4UAoqSjAx
 eS/6w6XmOWBxPIb6yrNNKGcB6gryMBfx/izfGf5A23ZZBMuythINzNJQBDKo/4hcKJAs
 NkPOsaIW3r7EhxjI637d1so+7CltUIugwiDycMz6Hdwp+g6ppo0Oc3ZmwSPAbnbSBDFN
 7PmOUOsDwXFFk6nTkE6eH18Ondsg6bxODkh74/VHKVCPTX8MASH2CV0Z5GjSVZ9kN/zw
 j4o8cCbwNtDBEPTCM7FXcG5S2GQJJislRbm5Z5HwEl8kZckIiCy7Vh1mG5hKyde+K597
 o8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nM9J2cmbyGFwjMjK+CMae4AlsIxqtsY1sLspbcwHaoY=;
 b=CXbJAxV23pX5Azw5jCRlGYf9cdXjsrJtQPk62mi1CQCWnKJYuPgAr6DXAozOQb0UJC
 JjoGTIIMNNDpDSvKvO1g4wPmfL/EVFJaA/CTuFtkJZfgLKax8w6rcenEfx3jU2n90bJ7
 n9vTBCiDbipcBE7QGqGI2EVxWLyAusm2J2v7Y2De54iCNUwYaK1VnKk/9Z+CvvUI2Sga
 MQWvUZt4uETNy2skvcN2g+PPii+t61F3M0n2cX877HdLWnoZchwZR54O5FNQ96tT67m7
 iUvdbB4thzwDAmoAYFemehtGpfGnsU+uDtyD9E/uPY0NlEmuXLsgBdCj9fdUrDAcc0FU
 TFcg==
X-Gm-Message-State: APjAAAVMSUVaaRKtsxAwZtoG01yOanpTG8qTgAD+kF/jaLRrQbqKFk4p
 FjCfJmx+4C8k5AeBrpHrWb2bVg==
X-Google-Smtp-Source: APXvYqxsYvTmcT1A7PI4ZUFFragw6Ptkcg0vVuQc/bhb3bR/OTnN7BLSdomeXAYxbRrtqmS7n+5Neg==
X-Received: by 2002:a05:600c:1051:: with SMTP id
 17mr5119287wmx.149.1572032237304; 
 Fri, 25 Oct 2019 12:37:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a2sm3329837wrv.39.2019.10.25.12.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 12:37:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3FD741FF99;
 Fri, 25 Oct 2019 20:37:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v3 09/15] tests/vm: Let subclasses disable IPv6
Date: Fri, 25 Oct 2019 20:37:03 +0100
Message-Id: <20191025193709.28783-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025193709.28783-1-alex.bennee@linaro.org>
References: <20191025193709.28783-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::330
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
index b5d1479bee9..2929de23aa7 100755
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


