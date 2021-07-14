Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCC53C8ADB
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:27:36 +0200 (CEST)
Received: from localhost ([::1]:32882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jbb-0000Om-7G
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVJ-0003RE-9i
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:05 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:56014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVH-0001zZ-KN
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id j34so2159793wms.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ph2AvIO8hHsWfHfct12Why6YoLFkLJudHR0rkhrmPB0=;
 b=mhpcww3Ug6O3XYh0lLfeJnupmamyHdyp4D3h3nZywbXsF2bE4joByyC+eYJfYrSqgZ
 y2c6msoZRrdTnueKLRuhtQIv/7U/1V9SqrzwaU3k4oelSw6ykgXb30ZV7TGRqIY9mip8
 1UaNI3+nfo3sStwLcOxfDZtUUn2GUWzA0ctSess0ALjVmhSnW0MRoIRObtdTTyCoHBLh
 4twxYs2aMW25lZ26H01RSvsvWX9bu6ptioCRh4UhJztgKUbTwqDfvBgTTPJ+ZsqCiBUb
 QyUAopoR7YcEEObeV7s2yPziVGbQF4K1p6R7rxHCEbjkLWjQ5KssOqMx10+BxYspI2uv
 9YGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ph2AvIO8hHsWfHfct12Why6YoLFkLJudHR0rkhrmPB0=;
 b=bIQH9aDjtbNpOgh60u5VcsnVIAuxbAXj5+TqlLL/S1JNgkmFZa8Hw4gaRo1l69Qlgf
 anUMZdxwwuE4WRpq/Vvifp8BGIMoNdf8ZCmLP2zYICIKx9WVljJniN4w9djAQV1Xl5Gp
 ftwBHB9frLPENVtThlWact/YCsOhC6qxaWcceBY8haja7vN90/dc0IDWJa/sbpnCzpSe
 z2l81/v32I6lGypj1WMNrrHGVhjx/wqIWqgcDqLyA4VTAhW+N5XM06c4VMDKtgNMZOIr
 5g7OLfqHwCoUj/NXT7+9p3vpgEXAe/0K96LkmpBSZdIGHAgXab++Z1wIA5EXiFkPNJI9
 TptQ==
X-Gm-Message-State: AOAM532/iBhgj7c99MErBmsE0I9VO3cCBKLnb1tFNLk2M3FzHuUXsWMg
 9IW6hHR4aGtbLljRqgkdIHL4mPGWAaHd3g==
X-Google-Smtp-Source: ABdhPJxdWdk/WkcY4R9llyg6YOI74vpnT6m0z3a1K0gV0O+H/+pcypiGzkeSIyGugCNAdF4sbbGm8Q==
X-Received: by 2002:a05:600c:4c94:: with SMTP id
 g20mr1833454wmp.40.1626286862267; 
 Wed, 14 Jul 2021 11:21:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n23sm2793482wmc.38.2021.07.14.11.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:20:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E849D1FF8F;
 Wed, 14 Jul 2021 19:20:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/21] docs: add a section on the generalities of vhost-user
Date: Wed, 14 Jul 2021 19:20:38 +0100
Message-Id: <20210714182056.25888-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Message-Id: <20210714093638.21077-4-alex.bennee@linaro.org>
---
 docs/interop/vhost-user.rst        |  2 +
 docs/system/device-emulation.rst   |  1 +
 docs/system/devices/vhost-user.rst | 59 ++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 docs/system/devices/vhost-user.rst

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index d6085f7045..7fc693521e 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -1,3 +1,5 @@
+.. _vhost_user_proto:
+
 ===================
 Vhost-user Protocol
 ===================
diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index 3156eeac2d..ea7e1fd491 100644
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


