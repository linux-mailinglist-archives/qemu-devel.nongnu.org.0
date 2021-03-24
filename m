Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A373D347B27
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:52:10 +0100 (CET)
Received: from localhost ([::1]:48312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4rh-0006Bo-EL
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4f5-0000GI-KW
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:39:07 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4f3-0003RS-PQ
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:39:07 -0400
Received: by mail-wm1-x32e.google.com with SMTP id k128so10637696wmk.4
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6V3I/617iDbb/+WUozJNJUkeoG1NJQtGMXaybo4P6+c=;
 b=NCR7iikvhLuh6qliDuePFeWVUUAc9nmNHSO65l1JEm6yqwmuFRDpnLQPO49cElPBde
 dE6D3/kw4t5Rwc95T2NL7j8JK82hMqDev/Drb/Ksx4xsJSrQqZsv5k/R+HclJawL5y5B
 CpFizT7FIjTJdaBAo/Q4sHesJqcag3n9P+Xf/p876Op9T0gqmnXRuz2ZONZ2x83B10Pd
 6HDAXM0V4T2P/B1m5jfkUpPN0Ni6RVtu218DjbWSBPqpP9sRsPUP2sf5/MKUsSi/M8Y8
 iFvF5+k/eXRV70ZbVmDCV9fL1sAd8CIPrqkzOo9XXuSkHHb1tIM5+3+YTwQb8xBcue6g
 iM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6V3I/617iDbb/+WUozJNJUkeoG1NJQtGMXaybo4P6+c=;
 b=kDtgpoCy1PGhRIof495HUarpKxgEpbneOoyziA7M9Asy7/mwVu/0ZC2SEqdQQa//kc
 vxlMeIuBnNpNqOnOjOm/uyy/P3SHhTEfXr7e4C8R9xiDBut0p7pzzHTxgnqpOKJXNMfS
 KAFdDEZ7apT5ghIqW2mRlcOrOOYkDTfnSZUXIGWI9S/qia+oHjOuW/SH7iEnOi0F/z2t
 DNM1d+D4+yV9qDFy8K2QhMFZD9mlOfUUifyqAgiKTm9/Fx4pdBS3Sb0k1fHJWeShitpg
 jLEc06+v4al4906NixO+RGBGilcKKLXSad3h3wvDTndWK+VQqwrXppiBk0AC21XoVHa9
 0k3Q==
X-Gm-Message-State: AOAM532E8WJ34rcTkf2OYEgtbHTv4QoJrov+ixSBfeeTkkYAIbvBwGBd
 E3urxfR01b/ptnX4LihAMQkxcA==
X-Google-Smtp-Source: ABdhPJy+LNMVsKrBZthp4zaZsCtvTqcCQmlARuEgEy1OZ/9gBxd2xmropCIzskn5UJfgtnCG/k2LmQ==
X-Received: by 2002:a1c:bc56:: with SMTP id m83mr3294863wmf.174.1616596744436; 
 Wed, 24 Mar 2021 07:39:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u23sm2785424wmn.26.2021.03.24.07.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:39:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CBA431FFAA;
 Wed, 24 Mar 2021 14:30:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 21/22] iotests: iothreads need ioeventfd
Date: Wed, 24 Mar 2021 14:30:20 +0000
Message-Id: <20210324143021.8560-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
 "open list:Block layer core" <qemu-block@nongnu.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

And ioeventfd are only available with virtio-scsi-pci or virtio-scsi-ccw,
use the alias but add a rule to require virtio-scsi-pci or virtio-scsi-ccw
for the tests that use iothreads.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210319202335.2397060-7-laurent@vivier.eu>
Message-Id: <20210323165308.15244-22-alex.bennee@linaro.org>

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


