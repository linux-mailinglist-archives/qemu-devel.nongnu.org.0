Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5D95F96D2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 04:31:31 +0200 (CEST)
Received: from localhost ([::1]:55630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohiZl-00087g-Am
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 22:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohiR0-00035G-Gv; Sun, 09 Oct 2022 22:22:27 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:44610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohiQl-0006ML-0F; Sun, 09 Oct 2022 22:22:25 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so9177854pjl.3; 
 Sun, 09 Oct 2022 19:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7U200FudwbpHutc22Z/SL8svBLcZPO5nI24IbArJq+8=;
 b=W/TNBqihMDqQh52qHijRBxFJvKpzUXl8WKVIJ7X6FFo5rblvIVXCEOk7liSF7AqAe+
 P+tN3ut9vBhhQDaxmmp9BnWlH0ZhfNLLF4DQH/VR7ylgaiDiIj1nqMNoHjttMvejenDd
 NXb1/tnPGyTTEwjNYZ/dEYkxTLs3K0UhH3vmb8RRbs9OpLTNt6Rx0SsiKvvb/7D5KHaX
 S0rHV26D3KsjEF9Fva1F+bqZ9rYLgnzr1LL2pXyVutTMqopbYmF8TY65DlBa6SRRXY2z
 jlmqcDp1GdOdrRsf/LNQJx16eXsfSpdWK1k/jxlmtvx+chdS2uZoGGa33nZNzm8XxbVt
 CrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7U200FudwbpHutc22Z/SL8svBLcZPO5nI24IbArJq+8=;
 b=jUagrMYcdjO6x72QRPv3F0BR61OMXziEwbiexyGASLyS6wgNh3amyE+O2iNM+JCjDf
 PRYSCJjv3MQFUgu6qWs39atJPI8rcS5zzEXCtLSaV6kHigWrv1wrKB8oFhmHiCg0/aRp
 RozCX+II26zsFLLmBd+iqXz9Q2jEsSO3AdAnhB5vxZxBFF0Hb/ZSzt1I+haBtm59YB2d
 P7Y1CGnIp5ORCRFcuHzCqanQis4EfPBXrWupXFRmEOJZ2xfZUe93/TfzYLbZnfuOUKUB
 avZZZuBiNfoMKNytWWXIvul9Q5RvU2zoyLnmiOBam8cxfodWZsKmsANayFGo892xqJ/A
 3Ysw==
X-Gm-Message-State: ACrzQf1jwMcC3lXdirpzDi7PyH6daN7HDopFXg1H9gd52PTQzmQpo6EI
 iYD8aVcCGlJhaJS2zRV/7R9Di5yTQ9ZWfnJn8dY=
X-Google-Smtp-Source: AMsMyM6Ic9b017YJ8ovJVSgpNUqHiaeYL9wgAbZwxYBB33PJz5qWmso7Lo5taB24t6OaqxpdPGTYHA==
X-Received: by 2002:a17:90a:bb94:b0:209:618f:46ac with SMTP id
 v20-20020a17090abb9400b00209618f46acmr29717053pjr.240.1665368528996; 
 Sun, 09 Oct 2022 19:22:08 -0700 (PDT)
Received: from roots.. ([112.44.203.212]) by smtp.gmail.com with ESMTPSA id
 l12-20020a170902f68c00b00178323e689fsm5372740plg.171.2022.10.09.19.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 19:22:08 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 hare@suse.de, damien.lemoal@opensource.wdc.com,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v11 6/7] qemu-iotests: test new zone operations
Date: Mon, 10 Oct 2022 10:21:15 +0800
Message-Id: <20221010022116.41942-7-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010022116.41942-1-faithilikerun@gmail.com>
References: <20221010022116.41942-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have added new block layer APIs of zoned block devices. Test it with:
Create a null_blk device, run each zone operation on it and see
whether reporting right zone information.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/qemu-iotests/tests/zoned.out | 53 ++++++++++++++++++
 tests/qemu-iotests/tests/zoned.sh  | 86 ++++++++++++++++++++++++++++++
 2 files changed, 139 insertions(+)
 create mode 100644 tests/qemu-iotests/tests/zoned.out
 create mode 100755 tests/qemu-iotests/tests/zoned.sh

diff --git a/tests/qemu-iotests/tests/zoned.out b/tests/qemu-iotests/tests/zoned.out
new file mode 100644
index 0000000000..0c8f96deb9
--- /dev/null
+++ b/tests/qemu-iotests/tests/zoned.out
@@ -0,0 +1,53 @@
+QA output created by zoned.sh
+Testing a null_blk device:
+Simple cases: if the operations work
+(1) report the first zone:
+start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:1, [type: 2]
+
+report the first 10 zones
+start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:1, [type: 2]
+start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:1, [type: 2]
+start: 0x100000, len 0x80000, cap 0x80000, wptr 0x100000, zcond:1, [type: 2]
+start: 0x180000, len 0x80000, cap 0x80000, wptr 0x180000, zcond:1, [type: 2]
+start: 0x200000, len 0x80000, cap 0x80000, wptr 0x200000, zcond:1, [type: 2]
+start: 0x280000, len 0x80000, cap 0x80000, wptr 0x280000, zcond:1, [type: 2]
+start: 0x300000, len 0x80000, cap 0x80000, wptr 0x300000, zcond:1, [type: 2]
+start: 0x380000, len 0x80000, cap 0x80000, wptr 0x380000, zcond:1, [type: 2]
+start: 0x400000, len 0x80000, cap 0x80000, wptr 0x400000, zcond:1, [type: 2]
+start: 0x480000, len 0x80000, cap 0x80000, wptr 0x480000, zcond:1, [type: 2]
+
+report the last zone:
+start: 0x1f380000, len 0x80000, cap 0x80000, wptr 0x1f380000, zcond:1, [type: 2]
+
+
+(2) opening the first zone
+report after:
+start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:3, [type: 2]
+
+opening the second zone
+report after:
+start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:3, [type: 2]
+
+opening the last zone
+report after:
+start: 0x1f380000, len 0x80000, cap 0x80000, wptr 0x1f380000, zcond:3, [type: 2]
+
+
+(3) closing the first zone
+report after:
+start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:1, [type: 2]
+
+closing the last zone
+report after:
+start: 0x1f380000, len 0x80000, cap 0x80000, wptr 0x1f380000, zcond:1, [type: 2]
+
+
+(4) finishing the second zone
+After finishing a zone:
+start: 0x80000, len 0x80000, cap 0x80000, wptr 0x100000, zcond:14, [type: 2]
+
+
+(5) resetting the second zone
+After resetting a zone:
+start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:1, [type: 2]
+*** done
diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests/zoned.sh
new file mode 100755
index 0000000000..fced0194c5
--- /dev/null
+++ b/tests/qemu-iotests/tests/zoned.sh
@@ -0,0 +1,86 @@
+#!/usr/bin/env bash
+#
+# Test zone management operations.
+#
+
+seq="$(basename $0)"
+echo "QA output created by $seq"
+status=1 # failure is the default!
+
+_cleanup()
+{
+  _cleanup_test_img
+  sudo rmmod null_blk
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+. ./common.qemu
+
+# This test only runs on Linux hosts with raw image files.
+_supported_fmt raw
+_supported_proto file
+_supported_os Linux
+
+QEMU_IO="build/qemu-io"
+IMG="--image-opts -n driver=zoned_host_device,filename=/dev/nullb0"
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT
+
+echo "Testing a null_blk device:"
+echo "case 1: if the operations work"
+sudo modprobe null_blk nr_devices=1 zoned=1
+
+echo "(1) report the first zone:"
+sudo $QEMU_IO $IMG -c "zrp 0 1"
+echo
+echo "report the first 10 zones"
+sudo $QEMU_IO $IMG -c "zrp 0 10"
+echo
+echo "report the last zone:"
+sudo $QEMU_IO $IMG -c "zrp 0x3e70000000 2" # 0x3e70000000 / 512 = 0x1f380000
+echo
+echo
+echo "(2) opening the first zone"
+sudo $QEMU_IO $IMG -c "zo 0 268435456"  # 268435456 / 512 = 524288
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zrp 0 1"
+echo
+echo "opening the second zone"
+sudo $QEMU_IO $IMG -c "zo 268435456 268435456" #
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zrp 268435456 1"
+echo
+echo "opening the last zone"
+sudo $QEMU_IO $IMG -c "zo 0x3e70000000 268435456"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zrp 0x3e70000000 2"
+echo
+echo
+echo "(3) closing the first zone"
+sudo $QEMU_IO $IMG -c "zc 0 268435456"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zrp 0 1"
+echo
+echo "closing the last zone"
+sudo $QEMU_IO $IMG -c "zc 0x3e70000000 268435456"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zrp 0x3e70000000 2"
+echo
+echo
+echo "(4) finishing the second zone"
+sudo $QEMU_IO $IMG -c "zf 268435456 268435456"
+echo "After finishing a zone:"
+sudo $QEMU_IO $IMG -c "zrp 268435456 1"
+echo
+echo
+echo "(5) resetting the second zone"
+sudo $QEMU_IO $IMG -c "zrs 268435456 268435456"
+echo "After resetting a zone:"
+sudo $QEMU_IO $IMG -c "zrp 268435456 1"
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
-- 
2.37.3


