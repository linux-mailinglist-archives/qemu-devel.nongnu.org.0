Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AE46C4D7E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:23:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezLc-0007pA-1v; Wed, 22 Mar 2023 10:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLW-0007ns-LL
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:21:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLU-0007Ft-2S
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679494903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vx20FkO4qrTT1t0kX/w4FLGP9efJRwvPTxvvgxnVEMY=;
 b=cNiaztnapSIqtpSg1lX/viYwdHSz/nh6e9USApL7IFRL22nsuMINaBHxXHyhPBVfLoehhd
 YFvy67cNTjogDOmsJ5lf5MrrTdwRuTP0k1p+wFnyUwchikbNJXt0HJq4Woi9gdYmgB9gG9
 s1Z+NOS34HlO1wFTqKaiTGEfuPOn/Xo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-cQH5Kai0OKGOM5f678BHcw-1; Wed, 22 Mar 2023 10:21:39 -0400
X-MC-Unique: cQH5Kai0OKGOM5f678BHcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 967E985A5A3;
 Wed, 22 Mar 2023 14:21:39 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.226.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDE1240C6E67;
 Wed, 22 Mar 2023 14:21:36 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, fmartine@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, eballetb@redhat.com,
 Albert Esteve <aesteve@redhat.com>, alex.bennee@linaro.org,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 sgarzare@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 peter.griffin@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 01/12] docs: Add a vhost-virtio-video rst file
Date: Wed, 22 Mar 2023 15:21:21 +0100
Message-Id: <20230322142132.22909-2-aesteve@redhat.com>
In-Reply-To: <20230322142132.22909-1-aesteve@redhat.com>
References: <20230322142132.22909-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=aesteve@redhat.com;
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

From: Peter Griffin <peter.griffin@linaro.org>

Add rst file with a brief description of the
daemon and a cheat sheet of commands.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 docs/system/devices/vhost-user-video.rst | 124 +++++++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 docs/system/devices/vhost-user-video.rst

diff --git a/docs/system/devices/vhost-user-video.rst b/docs/system/devices/vhost-user-video.rst
new file mode 100644
index 0000000000..ff0a8fe5c7
--- /dev/null
+++ b/docs/system/devices/vhost-user-video.rst
@@ -0,0 +1,124 @@
+=====================
+QEMU vhost-user-video
+=====================
+
+Overview
+--------
+
+This vmm translates from virtio-video v3 protocol and writes
+to a v4l2 mem2mem stateful decoder/encoder device [1]. v3 was
+chosen as that is what the virtio-video Linux frontend driver
+currently implements.
+
+The primary goal so far is to enable development of virtio-video
+frontend driver using purely open source software. Using vicodec
+v4l2 stateful decoder on the host for testing then allows a pure
+virtual environment for development and testing.
+
+Currently the vmm only supports v4l2 stateful devices, and the
+intention is it will be used with Arm SoCs that implement stateful
+decode/encode devices such as Qcom Venus, RPi, MediaTek etc.
+
+A Qemu + vicodec setup for virtio-video should also allow for
+CI systems like kernelci, lkft to test the virtio-video interface
+easily.
+
+Currently support for VAAPI or decoding via libavcodec or similar
+libraries is not implemented, but this could be added in the future.
+
+Some example commands are provided below on how to run the daemon
+and achieve a video decode using vicodec and a link to some test
+content.
+
+[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-decoder.html
+
+[2] https://lwn.net/Articles/760650/
+
+Examples
+--------
+
+Guest Linux kernel modules:
+
+::
+
+    CONFIG_MEDIA_SUPPORT=y
+    CONFIG_MEDIA_TEST_SUPPORT=y
+    CONFIG_V4L_TEST_DRIVERS=y
+    CONFIG_VIRTIO_VIDEO=y
+    CONFIG_GDB_SCRIPTS=y
+    CONFIG_DRM_VIRTIO_GPU=y
+
+Host kernel modules:
+
+::
+
+    CONFIG_MEDIA_SUPPORT=y
+    CONFIG_MEDIA_TEST_SUPPORT=y
+    CONFIG_V4L_TEST_DRIVERS=y
+    CONFIG_VIDEO_VICODEC=y
+
+Note: Vicodec has been recently included in the Fedora kernel releases,
+but it is not yet set on the default Debian kernel.
+
+The daemon should be started first (video3 typically is the stateful video):
+
+::
+
+    host# vhost-user-video --socket-path=/tmp/video.sock --v4l2-device=/dev/video3
+
+The QEMU invocation needs to create a chardev socket the device can
+use to communicate as well as share the guests memory over a memfd.
+
+::
+
+    host# qemu-system								\
+        -device vhost-user-video-pci,chardev=video,id=video                     \
+        -chardev socket,path=/tmp//video.sock,id=video                          \
+        -m 4096 		        					\
+        -object memory-backend-file,id=mem,size=4G,mem-path=/dev/shm,share=on	\
+        -numa node,memdev=mem							\
+        ...
+
+After booting, the device should be available at /dev/video0:
+
+::
+
+    guest# v4l2-ctl -d/dev/video0 --info
+    Driver Info:
+            Driver name      : virtio-video
+            Card type        : 
+            Bus info         : virtio:stateful-decoder
+            Driver version   : 6.1.0
+            Capabilities     : 0x84204000
+                    Video Memory-to-Memory Multiplanar
+                    Streaming
+                    Extended Pix Format
+                    Device Capabilities
+            Device Caps      : 0x04204000
+                    Video Memory-to-Memory Multiplanar
+                    Streaming
+                    Extended Pix Format
+
+Example v4l2-ctl decode command:
+
+::
+
+    guest# wget https://people.linaro.org/~peter.griffin/jelly_640_480-420P.fwht
+    guest# v4l2-ctl -d0 -x width=640,height=480 -v width=640,height=480,pixelformat=YU12 \
+        --stream-mmap --stream-out-mmap --stream-from jelly_640_480-420P.fwht            \
+        --stream-to out-jelly-640-480.YU12
+
+Play the raw decoded video with ffplay or mplayer
+
+::
+
+    guest# ffplay -loglevel warning -v info -f rawvideo -pixel_format yuv420p \
+        -video_size "640x480" ./out-jelly-640-480.YU12
+    guest# mplayer -demuxer rawvideo -rawvideo \
+        format=i420:w=640:h=480:fps=25 out-jelly-640-480.YU12
+
+Enable v4l2 debug in virtio-video driver
+
+::
+
+    # echo 0x1f > /sys/class/video4linux/videoX/dev_debug
-- 
2.39.2


