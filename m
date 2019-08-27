Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755639DAEC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 03:07:29 +0200 (CEST)
Received: from localhost ([::1]:45674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2PxI-0002sZ-EK
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 21:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40623)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nirsof@gmail.com>) id 1i2PvV-0001zc-Um
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 21:05:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nirsof@gmail.com>) id 1i2PvU-00089n-Ow
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 21:05:37 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39268)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nirsof@gmail.com>)
 id 1i2PvU-00089K-JG; Mon, 26 Aug 2019 21:05:36 -0400
Received: by mail-wr1-x443.google.com with SMTP id t16so17027982wra.6;
 Mon, 26 Aug 2019 18:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fIvQy1ykQXBQTJsM7YCohNrs6CVu+JoIyyx/UlVI+UI=;
 b=Fa0AT+eiPwDEsigpiZQFk2fybq2xdQ5hJyYuXRhZEY9r+utGiYx27OQ3Ji/aOqd4TE
 vZP8xNL6fSY+Iwk22dWz9DSBLX+TOoPMetpcM4TXBB4YPCSnClDianC6lggV4XDgfh03
 BfctNww9iU9tDSlC1MHfsOrklxTiD4c8gRvNLzSDeYeSMGBMq2lGMIgzRLJYScjMO4Cv
 GhstO1N2M8APou9FLnqiziPQ0EJIp1TWGnHCCX1lOEVifN+nEmLkyZ2T/GDStNIBghG3
 zm5Q9AN5iQq0HEf/AXwMf7F4pWjp5daJTLGBWCF/NxEqnZa3o4Q4eL6//HSupVzihTqA
 Akxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fIvQy1ykQXBQTJsM7YCohNrs6CVu+JoIyyx/UlVI+UI=;
 b=OilH9vpcKC6wp74fjgqHsdZyVwIiQJemkb2036UILkG9RhlwRB2FTPzSp+VWC0fCJy
 sWt+6jc2fZ9dxlrYh9GMbbUt0ZTf/oBReg3k3zaagBt5PP4L7ttJNH0e9JoYn7M00XqD
 KZ5k04Ro9jdtIuRVVTdu7WnsjPfK57euCWDQQT3EWkklplqy9tmNGbmiHjuZWyHenlBJ
 VPV/F5X3HGzTkhDHggPV0aQyCnpQvPAzh0GXQEoI8d3msabgjlhfBSpep5hY7ZSWkooT
 G3VS+G475a2RlP1XH3PqPBl/uoxUPNkSzS3P7wdwqhbHTrtLE0VaDOP3CM8XFulvehAP
 atJA==
X-Gm-Message-State: APjAAAU0B9TzG41mZIROrdzbc6zmvGFIJ0+KcEk6JL8hOSrXCAchkq+Y
 9QQ9VOlf+/Vkc5roplxM82MZ0IVeCeg=
X-Google-Smtp-Source: APXvYqz37iMY1lYU4gutEvTtPstHKCeW8NfAXjrmufQCGdunB3cuFOMgGOWSMHq+56Cc9W/SYbOkRQ==
X-Received: by 2002:adf:f28d:: with SMTP id k13mr24015750wro.19.1566867935320; 
 Mon, 26 Aug 2019 18:05:35 -0700 (PDT)
Received: from sparse-local.redhat.com (93-172-125-206.bb.netvision.net.il.
 [93.172.125.206])
 by smtp.gmail.com with ESMTPSA id v7sm14161572wrn.41.2019.08.26.18.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 18:05:34 -0700 (PDT)
From: Nir Soffer <nirsof@gmail.com>
X-Google-Original-From: Nir Soffer <nsoffer@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 04:05:28 +0300
Message-Id: <20190827010528.8818-3-nsoffer@redhat.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190827010528.8818-1-nsoffer@redhat.com>
References: <20190827010528.8818-1-nsoffer@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH v3 2/2] iotests: Test allocate_first_block()
 with O_DIRECT
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
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using block_resize we can test allocate_first_block() with file
descriptor opened with O_DIRECT, ensuring that it works for any size
larger than 4096 bytes.

Testing smaller sizes is tricky as the result depends on the filesystem
used for testing. For example on NFS any size will work since O_DIRECT
does not require any alignment.

Signed-off-by: Nir Soffer <nsoffer@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/175     | 28 ++++++++++++++++++++++++++++
 tests/qemu-iotests/175.out |  8 ++++++++
 2 files changed, 36 insertions(+)

diff --git a/tests/qemu-iotests/175 b/tests/qemu-iotests/175
index 7ba28b3c1b..55db2803ed 100755
--- a/tests/qemu-iotests/175
+++ b/tests/qemu-iotests/175
@@ -49,6 +49,23 @@ _filter_blocks()
         -e "s/blocks=$((extra_blocks + img_size / 512))\\(\$\\|[^0-9]\\)/max allocation/"
 }
 
+# Resize image using block_resize.
+# Parameter 1: image path
+# Parameter 2: new size
+_block_resize()
+{
+    local path=$1
+    local size=$2
+
+    $QEMU -qmp stdio -nographic -nodefaults \
+        -blockdev file,node-name=file,filename=$path,cache.direct=on \
+        <<EOF
+{'execute': 'qmp_capabilities'}
+{'execute': 'block_resize', 'arguments': {'node-name': 'file', 'size': $size}}
+{'execute': 'quit'}
+EOF
+}
+
 # get standard environment, filters and checks
 . ./common.rc
 . ./common.filter
@@ -57,6 +74,9 @@ _supported_fmt raw
 _supported_proto file
 _supported_os Linux
 
+_default_cache_mode none
+_supported_cache_modes none directsync
+
 size=$((1 * 1024 * 1024))
 
 touch "$TEST_DIR/empty"
@@ -79,6 +99,14 @@ for mode in off full falloc; do
     stat -c "size=%s, blocks=%b" $TEST_IMG | _filter_blocks $extra_blocks $min_blocks $size
 done
 
+for new_size in 4096 1048576; do
+    echo
+    echo "== resize empty image with block_resize =="
+    _make_test_img 0 | _filter_imgfmt
+    _block_resize $TEST_IMG $new_size >/dev/null
+    stat -c "size=%s, blocks=%b" $TEST_IMG | _filter_blocks $extra_blocks $min_blocks $new_size
+done
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/175.out b/tests/qemu-iotests/175.out
index 263e521262..39c2ee0f62 100644
--- a/tests/qemu-iotests/175.out
+++ b/tests/qemu-iotests/175.out
@@ -15,4 +15,12 @@ size=1048576, max allocation
 == creating image with preallocation falloc ==
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 preallocation=falloc
 size=1048576, max allocation
+
+== resize empty image with block_resize ==
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=0
+size=4096, min allocation
+
+== resize empty image with block_resize ==
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=0
+size=1048576, min allocation
  *** done
-- 
2.20.1


