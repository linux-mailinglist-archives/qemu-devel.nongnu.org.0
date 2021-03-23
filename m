Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55995346624
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:19:23 +0100 (CET)
Received: from localhost ([::1]:58718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkgc-0008Hu-C2
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkMs-00070o-6O
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:58:58 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:41947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkMn-0005wB-3o
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:58:57 -0400
Received: by mail-ed1-x530.google.com with SMTP id z1so24315167edb.8
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HljywFt12dZyd3+HxlsIwX7M2zOm5+joKHSo35RZz6U=;
 b=h5FeLUhOhP/AVy2A8sjz395WaSJRypcWbMimZBMWBgbUCPriWKnRB2XN1cNXqEY2vf
 XlLeNrnN/LHAJ5ccONIIYQuMNfUXieixpVP5VqHsArMByYxAeg8L6BeJWiq8BXjD1fdy
 Htii9sXEIlss6rAS8ygk9pfuS+HvdCldEgzzrFUy94tv1bQeJF6Xby9QL+7c9xmhAmWW
 gSes/+A4j5OcZgJFz/UMn11Du8Wp8X9SsGZuYRxl8+/BeC1QlVarPRSpuLDHW4rw0z1h
 RZaOROnKpU0zmbdWqCVtseunOYHnvK7QZGCPLeI+h30kiczDEppIPPs2YdKjCJwEYBYk
 SUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HljywFt12dZyd3+HxlsIwX7M2zOm5+joKHSo35RZz6U=;
 b=F5gV0fPRbIJTipvkRBbLOrasM+rGXF6yRv3iVimmo4xQ4KkQESB5M0mvkpnJDubqg8
 4JrdEnzBz6XFHjExjK3+3fbPNJrCpGECLSPshrCICtdcely3L2ygRoiwfhJHCBAhLqmj
 iFCapeajp8Foo82bxTtca2rFknGdAJvmuYbkGw5FfiwdwyBzVotiz6sQOCkAbIcm5MwK
 XHvUnKpg2O8xHqrOVg+LcbCYD1qa0kmD7vm5k9eaUD8Ux5obdaPMyqkaKL2kdKurfPq9
 SlI6I2QPfAnVWnvB11EI6uHn6f3WMa4fEdk9Cx+6l+zfUr22OhEp7TLuO1k8IgyXodO3
 j28Q==
X-Gm-Message-State: AOAM531rB48BC1uXUOykPsjiQ/VDs9Wa4fRmiT/kFyFUIVEe8ESreTXo
 uJVN4Y5ndJOvK5MBft3Gjdov4Q==
X-Google-Smtp-Source: ABdhPJz3MuKXQMiYLnqnkuJsOvmxQv4QWX62hEspvFSjUM2k7TZ5Zwt+rDJl/qAxZsoqSgO98DXarw==
X-Received: by 2002:a05:6402:3495:: with SMTP id
 v21mr5441216edc.117.1616518731634; 
 Tue, 23 Mar 2021 09:58:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n16sm13321344edr.42.2021.03.23.09.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:58:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DACD21FFA9;
 Tue, 23 Mar 2021 16:53:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 21/22] iotests: iothreads need ioeventfd
Date: Tue, 23 Mar 2021 16:53:07 +0000
Message-Id: <20210323165308.15244-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

And ioeventfd are only available with virtio-scsi-pci or virtio-scsi-ccw,
use the alias but add a rule to require virtio-scsi-pci or virtio-scsi-ccw
for the tests that use iothreads.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210319202335.2397060-7-laurent@vivier.eu>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qemu-iotests/127        |  3 ++-
 tests/qemu-iotests/256        |  6 ++++--
 tests/qemu-iotests/common.rc  | 13 +++++++++++++
 tests/qemu-iotests/iotests.py |  5 +++++
 4 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/127 b/tests/qemu-iotests/127
index 98e8e82a82..32edc3b068 100755
--- a/tests/qemu-iotests/127
+++ b/tests/qemu-iotests/127
@@ -44,7 +44,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file fuse
 
-_require_devices virtio-scsi scsi-hd
+_require_devices scsi-hd
+_require_one_device_of virtio-scsi-pci virtio-scsi-ccw
 
 IMG_SIZE=64K
 
diff --git a/tests/qemu-iotests/256 b/tests/qemu-iotests/256
index 8d82a1dd86..13666813bd 100755
--- a/tests/qemu-iotests/256
+++ b/tests/qemu-iotests/256
@@ -24,6 +24,8 @@ import os
 import iotests
 from iotests import log
 
+iotests._verify_virtio_scsi_pci_or_ccw()
+
 iotests.script_initialize(supported_fmts=['qcow2'])
 size = 64 * 1024 * 1024
 
@@ -61,8 +63,8 @@ with iotests.FilePath('img0') as img0_path, \
     log('--- Preparing images & VM ---\n')
     vm.add_object('iothread,id=iothread0')
     vm.add_object('iothread,id=iothread1')
-    vm.add_device('virtio-scsi-pci,id=scsi0,iothread=iothread0')
-    vm.add_device('virtio-scsi-pci,id=scsi1,iothread=iothread1')
+    vm.add_device('virtio-scsi,id=scsi0,iothread=iothread0')
+    vm.add_device('virtio-scsi,id=scsi1,iothread=iothread1')
     iotests.qemu_img_create('-f', iotests.imgfmt, img0_path, str(size))
     iotests.qemu_img_create('-f', iotests.imgfmt, img1_path, str(size))
     vm.add_drive(img0_path, interface='none')
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 65cdba5723..7f49c9716d 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -977,5 +977,18 @@ _require_devices()
     done
 }
 
+_require_one_device_of()
+{
+    available=$($QEMU -M none -device help | \
+                grep ^name | sed -e 's/^name "//' -e 's/".*$//')
+    for device
+    do
+        if echo "$available" | grep -q "$device" ; then
+            return
+        fi
+    done
+    _notrun "$* not available"
+}
+
 # make sure this script returns success
 true
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 1e9e6a066e..5af0182895 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1146,6 +1146,11 @@ def _verify_virtio_blk() -> None:
     if 'virtio-blk' not in out:
         notrun('Missing virtio-blk in QEMU binary')
 
+def _verify_virtio_scsi_pci_or_ccw() -> None:
+    out = qemu_pipe('-M', 'none', '-device', 'help')
+    if 'virtio-scsi-pci' not in out and 'virtio-scsi-ccw' not in out:
+        notrun('Missing virtio-scsi-pci or virtio-scsi-ccw in QEMU binary')
+
 
 def supports_quorum():
     return 'quorum' in qemu_img_pipe('--help')
-- 
2.20.1


