Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413203BEFDB
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 20:51:45 +0200 (CEST)
Received: from localhost ([::1]:36904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Ce8-0007Ep-BC
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 14:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1CYb-0007cH-W2
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 14:46:02 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1CYU-0000mQ-Oj
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 14:46:01 -0400
Received: by mail-wr1-x436.google.com with SMTP id u8so4199450wrq.8
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 11:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G7tH/UyjoZn7F4238YHQ3Au0z5gN4wRoSGJnmtNDE80=;
 b=Cr+VR0xZyi3AOQelEoy3JkHoRcX1HIhMW/OrSxlmZ7k31ZjLl4P8MdmfXMyzZSfAP9
 z0SGClMy+d2jA5WpQpiSwnLbAo2erhHZH8lL0f0XiJa1pQpWDRdahk0FsGW2ep4eSgkI
 mBuODK3Y4JZGAbitnRjpcxpmbJX3V2oPhLXVgIR25KA9nGBzC1qyK+NqZBb3y/9AsfeG
 i7JsqofqtFXnbXJEU4YZNgLH+pndkHrFbh1N/VYvbWkZ8BZl4t49lCP5fftjT/xqdhDb
 jk97RUUbezUrbyKEqdhj/FaiEIeEhY74ZSsfOhG1ATVD4q92v8qnnoPiHmFH5lCBARfb
 oPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G7tH/UyjoZn7F4238YHQ3Au0z5gN4wRoSGJnmtNDE80=;
 b=te64pt7zB1PUKxT5KUX/mSBp0aJ5t6JRRY0zuk05mIuvUa4DuLyNPTMaEPxuB0BXmp
 4uM9CWeZFgNDPTN9J5U0IzewUONr8xX4+Yo7+f0QukC3BtrqfynYT0X8m1KVe/86QIA3
 +/bzagPqVr9K3yzwycxfBoYOA5SISScvMxsdl8l0P15rt+gCGZ8hvzd1QageiDuO22Nf
 Epm9jftcOp6VaD5PCakYjnKdTbcf5+YrXV1ONB+jddA1koEzcdE8WBFCAGKDvLIeGtI8
 ZjNf+iY+KEixrfa7uK5A4Ny+yuWQCh23P/awpwBHfCfJN5daQ359/D3lZzMemAkrLRm9
 Tbow==
X-Gm-Message-State: AOAM530eUCmgMdKx9B/5qVE1S5MO7rlKV0dEJM8wvE4OXgEVJQUs2762
 MqH/s6AuraE7v1Nb3TFLpaBhqw==
X-Google-Smtp-Source: ABdhPJxEWkrf72CENC15N6ZeQtzMgekMnxTDT/5SXUoYXJikpyxWsriDRt15eD5qiKbxyfu6WAHXpg==
X-Received: by 2002:a5d:6c69:: with SMTP id r9mr28763296wrz.8.1625683553202;
 Wed, 07 Jul 2021 11:45:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s7sm21777158wrp.97.2021.07.07.11.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 11:45:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 682FD1FF8C;
 Wed,  7 Jul 2021 19:45:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] docs: add a section on the generalities of vhost-user
Date: Wed,  7 Jul 2021 19:45:49 +0100
Message-Id: <20210707184549.24436-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210707184549.24436-1-alex.bennee@linaro.org>
References: <20210707184549.24436-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
 docs/interop/vhost-user.rst        |  4 ++-
 docs/system/device-emulation.rst   |  1 +
 docs/system/devices/vhost-user.rst | 57 ++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+), 1 deletion(-)
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
index 0000000000..ecb1107d4c
--- /dev/null
+++ b/docs/system/devices/vhost-user.rst
@@ -0,0 +1,57 @@
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
+meets the specification for a given device can be used. The daemon
+will open a socket and *listen* for a connection from QEMU at which
+point the protocol will start its negotiation.
+
+Shared memory object
+====================
+
+In order for the daemon to access the VirtIO queues to process the
+requests it needs access to the guest's address space. This is
+achieved via the ``memory-backend-file`` object. A reference to a
+file-descriptor which can access this object will be passed via the
+socket as part of the protocol negotiation.
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
+      -chardev socket,id=ba1,path=/var/run/foo.sock \\
+      -device vhost-user-foo,chardev=ba1,$OTHER_ARGS \\
+      -object memory-backend-memfd,id=mem,size=4G,share=on \\
+      -numa node,memdev=mem \\
+        ...
+
-- 
2.20.1


