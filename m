Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D983D3E26
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:06:47 +0200 (CEST)
Received: from localhost ([::1]:38922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ydK-00035O-4C
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yav-00009v-Da
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:19 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yat-0005PC-UP
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:17 -0400
Received: by mail-wr1-x429.google.com with SMTP id o1so3097089wrp.5
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ne/z5Gv0CAc17gk1fX6YTUeREKNOhWQSB8sL1YVywMA=;
 b=TcusK1K6vnsp8I3J3O1O+E4Qd3jshj8R24pHoNPzOalHlPZDhqf4dAtbnJsKImdHkF
 s2LtTYMxbXCEQ1OYDQzNX5l0qvm2pLluQQykkgfvb758h7uri4M4AdsAqjvSYfTVtT4w
 vkUBnF7GV3zuS7S+3F56rHP4Uuyq/kSR4WgZtOX7aj6d0LaRsgzesfMMdEiuQ2Rz4eF6
 DtEBn/u252Zyk6wMX79xtCpIIILNDv+51El1g6nXyIycLwMi1uonQhvd7S/CI2jBONT+
 Yysj05MiiWLUTpN+diG9qZkTU5c/HPd6g0Kz7Ps/VP4Opvysq2uVT+p/p+IuP514HqpY
 yzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ne/z5Gv0CAc17gk1fX6YTUeREKNOhWQSB8sL1YVywMA=;
 b=RRY+2LimEeBF9qu0e1yKlaepwjpt04wcv6RMq2/fhnzjLZH+W5a1H1fSXnFLZiZKbU
 ZXa8gPF2I6ls3zdJMgrT9fGlSRbM0+dc8hSmxGaYDksBZiWr7sC75AWG7RBzr6zAMWxe
 cTb/+loBB9IRwD7hG4jv/2yFxIv4XNO8+pHJhw1aHciCZ0HSw0qZU1aO38P3fEfEksdK
 1zS58fJOs1N1avg7ADJ983f/adT0BMvkyZhc4+nf2Pmmho3bh80kT2QWCR9Ybsruzh9g
 303pvBdCwiSQYMIG9jNK0chxSVt4wqp9p+b9p9axSimCrOw/KQ3cNztpz3CpLDFcZ5yW
 dhbA==
X-Gm-Message-State: AOAM533MxxtQPAUIfm408+Is+CVm8tesmse25Jq2XOvFoAA/C33oqms+
 fuH3PGGGfPLgY4gmxzq+BP2+Vw==
X-Google-Smtp-Source: ABdhPJx7wd+NehUdtHcLq2+khHWLLW2M5GoLoGCHDYOm32XGQptPBozo5SXrXTpC76RNDkhGSocFeg==
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr6609266wrs.97.1627059854237; 
 Fri, 23 Jul 2021 10:04:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o17sm1222291wmp.31.2021.07.23.10.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8E9281FF8F;
 Fri, 23 Jul 2021 18:03:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 03/28] docs: add a section on the generalities of vhost-user
Date: Fri, 23 Jul 2021 18:03:29 +0100
Message-Id: <20210723170354.18975-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we do mention some of this stuff in the various daemons and
manuals the subtleties of the socket and memory sharing are sometimes
missed. This document attempts to give some background on vhost-user
daemons in general terms.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210720232703.10650-4-alex.bennee@linaro.org>

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
index 8adf05f606..7afcfd8064 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -86,4 +86,5 @@ Emulated Devices
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


