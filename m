Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E896F6AD81C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:14:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRUG-0006SP-UE; Tue, 07 Mar 2023 02:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRTm-0005mP-4i
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:11:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRTW-0005rV-5h
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678173065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xaDN9m/eynoKxwgnm01Gs6kfTDNxs6b6f5j1smFqGwY=;
 b=RjhNWZEd1fKMjlYUWdTH19UGm6SQ3bADOg+4xJrcczNMCeIBlDHurqTrcttUBaeU8F4Udc
 kV5LL2/fT/PphX7PkG9aH91jtZBJilJPBxfErFaT9PI6KIwAmKK+ax1p1MxK1uFB1wlQXW
 ovKqMjQKLl8JIO5iK5SZcj+a1mUUpoI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-bV90EG3wNeuYNXOjx0ILtQ-1; Tue, 07 Mar 2023 02:11:02 -0500
X-MC-Unique: bV90EG3wNeuYNXOjx0ILtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E26162808E69;
 Tue,  7 Mar 2023 07:11:01 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA8B240C10FA;
 Tue,  7 Mar 2023 07:10:59 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 43/51] docs/system/devices/igb: Add igb documentation
Date: Tue,  7 Mar 2023 15:08:08 +0800
Message-Id: <20230307070816.34833-44-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 MAINTAINERS                      |  1 +
 docs/system/device-emulation.rst |  1 +
 docs/system/devices/igb.rst      | 71 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 docs/system/devices/igb.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 77f3dd3..e10eaa7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2235,6 +2235,7 @@ F: tests/qtest/libqos/e1000e.*
 igb
 M: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
+F: docs/system/devices/igb.rst
 F: hw/net/igb*
 F: tests/avocado/igb.py
 F: tests/qtest/igb-test.c
diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index 0506006..c1b1934 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -93,3 +93,4 @@ Emulated Devices
    devices/virtio-pmem.rst
    devices/vhost-user-rng.rst
    devices/canokey.rst
+   devices/igb.rst
diff --git a/docs/system/devices/igb.rst b/docs/system/devices/igb.rst
new file mode 100644
index 0000000..70edadd
--- /dev/null
+++ b/docs/system/devices/igb.rst
@@ -0,0 +1,71 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+.. _igb:
+
+igb
+---
+
+igb is a family of Intel's gigabit ethernet controllers. In QEMU, 82576
+emulation is implemented in particular. Its datasheet is available at [1]_.
+
+This implementation is expected to be useful to test SR-IOV networking without
+requiring physical hardware.
+
+Limitations
+===========
+
+This igb implementation was tested with Linux Test Project [2]_ and Windows HLK
+[3]_ during the initial development. The command used when testing with LTP is:
+
+.. code-block:: shell
+
+  network.sh -6mta
+
+Be aware that this implementation lacks many functionalities available with the
+actual hardware, and you may experience various failures if you try to use it
+with a different operating system other than Linux and Windows or if you try
+functionalities not covered by the tests.
+
+Using igb
+=========
+
+Using igb should be nothing different from using another network device. See
+:ref:`pcsys_005fnetwork` in general.
+
+However, you may also need to perform additional steps to activate SR-IOV
+feature on your guest. For Linux, refer to [4]_.
+
+Developing igb
+==============
+
+igb is the successor of e1000e, and e1000e is the successor of e1000 in turn.
+As these devices are very similar, if you make a change for igb and the same
+change can be applied to e1000e and e1000, please do so.
+
+Please do not forget to run tests before submitting a change. As tests included
+in QEMU is very minimal, run some application which is likely to be affected by
+the change to confirm it works in an integrated system.
+
+Testing igb
+===========
+
+A qtest of the basic functionality is available. Run the below at the build
+directory:
+
+.. code-block:: shell
+
+  meson test qtest-x86_64/qos-test
+
+ethtool can test register accesses, interrupts, etc. It is automated as an
+Avocado test and can be ran with the following command:
+
+.. code:: shell
+
+  make check-avocado AVOCADO_TESTS=tests/avocado/igb.py
+
+References
+==========
+
+.. [1] https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/82576eb-gigabit-ethernet-controller-datasheet.pdf
+.. [2] https://github.com/linux-test-project/ltp
+.. [3] https://learn.microsoft.com/en-us/windows-hardware/test/hlk/
+.. [4] https://docs.kernel.org/PCI/pci-iov-howto.html
-- 
2.7.4


