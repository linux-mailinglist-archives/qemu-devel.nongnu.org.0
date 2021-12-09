Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5972E46EA75
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 15:59:12 +0100 (CET)
Received: from localhost ([::1]:47310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvKt3-0005IR-Ub
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 09:59:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqg-0002Ya-1v
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:42 -0500
Received: from [2a00:1450:4864:20::42a] (port=37614
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqd-0001XX-2i
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:41 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d9so10162945wrw.4
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 06:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1QYgAjp609xS1sl67fG+HMcw0ipi2+jgawDo+pv6YsU=;
 b=AqIaKPAslWw78cQsF3zgvKdCrZ68QcTqvHm/rvit/XGRO0z/U7DirTRUrgvy1zVHSt
 Mn6Q7BYlr9rWxdtbfTybBHqQfLsmsVUDJC3XgOCI0jujHzJlgDKW+3CX9o00rr5sBnbn
 v2Ke0QD3BRzm4OKJeVNKFLWZUT8jWQCt9YTFokTv947sQsZDQ8EujSwMpa0ox36joYEA
 tVDpyn4TEDvh3B5jcRcby7nne1AkRLzV7GFjhsGvtVNIIeu4dtmOMsdUV1shS710cdtZ
 Ja4Ae6y2iIqNC2XLyEfDgD8IV8QIiGBihvJgsDLcf1ROH3/GWu4WtV/QUVCSF+3YncMm
 KB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1QYgAjp609xS1sl67fG+HMcw0ipi2+jgawDo+pv6YsU=;
 b=F/wp6blwWwmXjry3k4LGiVxYRcEB59erx69KhLhspnOXulfqIdn7gw6ErDMwT0I2e/
 J+/BzJ28KDUICDZ1I6bnXBiSWs/OHaOcNfKz0QYQaHKAs7bWeYlNfSdSgptHQjWaZjrw
 mliKEidHbyJDwVmGZOWYh8bfNd2UnowV3CXaxB4u9NCVg6cgKxhTttxvzT0SwJGUSH5s
 3HY5WMLAoMRLiYHTUQX4WFlEKGqsoeAUGPurTk0k6jHAM0CS2iA/AFvZ9DPxEK/208v7
 D778t4pwVPxT5fWHrXbjF0g/VKH3OFhMiDSMyWaEuyzcDtoeZFCd1OE2Uq1KZBXuVD0G
 8OdQ==
X-Gm-Message-State: AOAM532vl3dCIpNplCWz8brOcK1UmvkiK7foWy4F5OeoDjb4iilTObJ6
 FEhHN4kwgWBrdCWV1d+kPdGqcw==
X-Google-Smtp-Source: ABdhPJzqMm/JzWm3VYj3NUK9w/M1+W3rcxEvBWYRmMA2p4eU07/JZHK3QzN99YSNm+bg1I5qe4ua1Q==
X-Received: by 2002:a5d:58ed:: with SMTP id f13mr6976991wrd.373.1639061797086; 
 Thu, 09 Dec 2021 06:56:37 -0800 (PST)
Received: from xps15-9570.lan (host-92-16-105-103.as13285.net. [92.16.105.103])
 by smtp.gmail.com with ESMTPSA id y142sm30845wmc.40.2021.12.09.06.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 06:56:36 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: marcandre.lureau@redhat.com,
	mst@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH 1/8] vhost-user-video: Add a README.md with cheat sheet of
 commands
Date: Thu,  9 Dec 2021 14:55:54 +0000
Message-Id: <20211209145601.331477-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209145601.331477-1-peter.griffin@linaro.org>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.griffin@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Griffin <peter.griffin@linaro.org>, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 tools/vhost-user-video/README.md | 98 ++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 tools/vhost-user-video/README.md

diff --git a/tools/vhost-user-video/README.md b/tools/vhost-user-video/README.md
new file mode 100644
index 0000000000..c55e0a7b68
--- /dev/null
+++ b/tools/vhost-user-video/README.md
@@ -0,0 +1,98 @@
+# Overview vhost-user-video
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
+[1] https://www.kernel.org/doc/html/latest/userspace-api/media/
+    v4l/dev-decoder.html
+
+[2] https://lwn.net/Articles/760650/
+
+# Guest Linux kernel modules
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_TEST_SUPPORT=y
+CONFIG_V4L_TEST_DRIVERS=y
+CONFIG_VIRTIO_VIDEO=y
+CONFIG_GDB_SCRIPTS=y
+CONFIG_DRM_VIRTIO_GPU=y
+
+# Host kernel modules
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_TEST_SUPPORT=y
+CONFIG_V4L_TEST_DRIVERS=y
+CONFIG_VIDEO_VICODEC=y
+
+# Run vhost-user-video daemon with vicodec
+# (video3 typically is the stateful video)
+vhost-user-video --socket-path=/tmp/video.sock --v4l2-device=/dev/video3
+
+# Qemu command for virtio-video device
+
+-device vhost-user-video-pci,chardev=video,id=video
+-chardev socket,path=/tmp//video.sock,id=video
+
+# Example v4l2-ctl decode command
+wget https://people.linaro.org/~peter.griffin/jelly_640_480-420P.fwht
+
+v4l2-ctl -d0 -x width=640,height=480 -v width=640,height=480,pixelformat=YU12
+--stream-mmap --stream-out-mmap --stream-from jelly_640_480-420P.fwht
+--stream-to out-jelly-640-480.YU12
+
+# Play the raw decoded video with ffplay or mplayer
+ffplay -loglevel warning -v info -f rawvideo -pixel_format  yuv420p
+  -video_size "640x480" ./out-jelly-640-480.YU12
+
+mplayer -demuxer rawvideo -rawvideo
+  format=i420:w=640:h=480:fps=25 out-jelly-640-480.YU12
+
+# Enable v4l2 debug in virtio-video frontend driver
+echo 0x1f > /sys/class/video4linux/video0/dev_debug
+
+# Enable v4l2 debug in vicodec backend driver
+echo 0x1f > /sys/class/video4linux/video3/dev_debug
+
+# optee-build system qemu virtio-video command
+make QEMU_VIRTFS_ENABLE=y QEMU_USERNET_ENABLE=y CFG_TA_ASLR=n
+    QEMU_VHOSTUSER_MEM=y QEMU_VIRTVIDEO_ENABLE=y SSH_PORT_FW=y run-only
+
+Current status
+* Tested with v4l2-ctl from v4l2-utils and vicodec stateful decoder driver
+* v4l2-compliance - reports
+Total: 43, Succeeded: 37, Failed: 6, Warnings: 0
+
+Known Issues
+* 6 v4l2-compliance failures remaining
+* v4l2-ctl 0fps misleading output
+* v4l2-ctl sometimes reports - 0 != <somenumber>
+* Encoder not tested yet
+
+TODOs
+* Test with a "real" stateful decoder & codec
+  (e.g. Qcom Venus or RPi).
+* Test more v4l2 userspaces in the guest
+
+Future potential features
+* Emulation using libavcodec or similar library
+* Support for VAAPI, OpenMax or v4l2 stateless devices
-- 
2.25.1


