Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5FB3C81E8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:43:37 +0200 (CEST)
Received: from localhost ([::1]:33052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bQW-0003NY-D9
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bJz-0001uT-BV
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:51 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bJt-0004GI-En
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:51 -0400
Received: by mail-wm1-x32f.google.com with SMTP id l6so1185969wmq.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V2k26oi2LiEioZB/feP47Q2t0koGpAhQkbvn0KZWlzA=;
 b=yUqUjAHUV1N7u0BqCkUxJdtjercxXfACVHS6UxIOCLB1ks4HOr2kwTL4uBqACrvWYn
 i1xJHvXY9SBbgsN0805fz65L2wJxMro2Rxq5ksYhvDZ2DtwWIIyKAf6D9UOttkRI95zt
 pqMTVK4RZ2bUcAgzqQHw/a63ChOomhhNS4TMekYcEQbzmhi0uYQ9MaTZx8JGrZpua0Xf
 /VIiCBi++/98M3hWdm0NwLXeOZsUih5new9pFw4YEqnlbs4PX8IHAOcbtFvOpHbaZDWX
 2nFrc0ZsjhuOY4w8EM/DkL0SSNs5tlw1prj0YT+j79VYGalslpQcKQXg4hIPP4pJvtV1
 dhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V2k26oi2LiEioZB/feP47Q2t0koGpAhQkbvn0KZWlzA=;
 b=HQYEZ+haarSC5mdgmgi+r7wEI9VdOPufR7e1oY7HVNuQA0umB6lCJbox7MYyEPw/4D
 62Ea1xn6pzPd0WFOPTXKdGDaAcU5Ol5cPucxSIeDgUaYCYvXy/cwP6w8EmqyyIUDEkfw
 IHFKHLACi2f6zGD6XEMQ25ARpfgg/rSoxfKQof84Zjg9w68a3mhGLyJBUq9IswZZSoih
 C5R1E0mAJnCUgErfeLHQEdTil+CI3Ok10hVOnMy+kD4hV4NkCGpeXhQKTdj/Amx3lUxZ
 lM7xlRAy6Z4fgHYgg9K85Uahb/W+IePf+QsDKwVGlhkqxzZZPIpL9qGYq9h4v75Qra6T
 Sguw==
X-Gm-Message-State: AOAM532vwRqWZHu5eSI7f5Ofgy5zQgrLWKodiNSXspFMBADqGjHjQm2k
 2KbEkKIs762mn3m6jdOlOW6sFA==
X-Google-Smtp-Source: ABdhPJwlBZoTWzBAdJLNscmiHtnm//n5Jm5vEgyJ1mJs8LdRl2eiFpBuRCXFGOM2+q+kd2ufRD2sHg==
X-Received: by 2002:a05:600c:4656:: with SMTP id
 n22mr3075971wmo.24.1626255404152; 
 Wed, 14 Jul 2021 02:36:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d8sm1940303wra.41.2021.07.14.02.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:36:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 30F8D1FF8F;
 Wed, 14 Jul 2021 10:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/21] docs: add a section on the generalities of vhost-user
Date: Wed, 14 Jul 2021 10:36:20 +0100
Message-Id: <20210714093638.21077-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we do mention some of this stuff in the various daemons and
manuals the subtleties of the socket and memory sharing are sometimes
missed. This document attempts to give some background on vhost-user
daemons in general terms.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>

---
v2
  - drop reference to socket direction (it can be either)
  - mention memory-backend-memfd object
  - mention requirement to match system memory size
---
 docs/interop/vhost-user.rst        |  4 +-
 docs/system/device-emulation.rst   |  1 +
 docs/system/devices/vhost-user.rst | 59 ++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 docs/system/devices/vhost-user.rst

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index d6085f7045..f46423b6f3 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -1,3 +1,5 @@
+.. _vhost_user_proto:
+
 ===================
 Vhost-user Protocol
 ===================
@@ -6,7 +8,7 @@ Vhost-user Protocol
 :Licence: This work is licensed under the terms of the GNU GPL,
           version 2 or later. See the COPYING file in the top-level
           directory.
-
+          
 .. contents:: Table of Contents
 
 Introduction
diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index a0f00bc340..5aca6ed66b 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -75,4 +75,5 @@ Emulated Devices
    devices/net.rst
    devices/nvme.rst
    devices/usb.rst
+   devices/vhost-user.rst
    devices/virtio-pmem.rst
diff --git a/docs/system/devices/vhost-user.rst b/docs/system/devices/vhost-user.rst
new file mode 100644
index 0000000000..86128114fa
--- /dev/null
+++ b/docs/system/devices/vhost-user.rst
@@ -0,0 +1,59 @@
+.. _vhost_user:
+
+vhost-user back ends
+--------------------
+
+vhost-user back ends are way to service the request of VirtIO devices
+outside of QEMU itself. To do this there are a number of things
+required.
+
+vhost-user device
+===================
+
+These are simple stub devices that ensure the VirtIO device is visible
+to the guest. The code is mostly boilerplate although each device has
+a ``chardev`` option which specifies the ID of the ``--chardev``
+device that connects via a socket to the vhost-user *daemon*.
+
+vhost-user daemon
+=================
+
+This is a separate process that is connected to by QEMU via a socket
+following the :ref:`vhost_user_proto`. There are a number of daemons
+that can be built when enabled by the project although any daemon that
+meets the specification for a given device can be used.
+
+Shared memory object
+====================
+
+In order for the daemon to access the VirtIO queues to process the
+requests it needs access to the guest's address space. This is
+achieved via the ``memory-backend-file`` or ``memory-backend-memfd``
+objects. A reference to a file-descriptor which can access this object
+will be passed via the socket as part of the protocol negotiation.
+
+Currently the shared memory object needs to match the size of the main
+system memory as defined by the ``-m`` argument.
+
+Example
+=======
+
+First start you daemon.
+
+.. parsed-literal::
+
+  $ virtio-foo --socket-path=/var/run/foo.sock $OTHER_ARGS
+
+The you start your QEMU instance specifying the device, chardev and
+memory objects.
+
+.. parsed-literal::
+
+  $ |qemu_system| \\
+      -m 4096 \\
+      -chardev socket,id=ba1,path=/var/run/foo.sock \\
+      -device vhost-user-foo,chardev=ba1,$OTHER_ARGS \\
+      -object memory-backend-memfd,id=mem,size=4G,share=on \\
+      -numa node,memdev=mem \\
+        ...
+
-- 
2.20.1


