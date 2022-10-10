Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6215B5F96FB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 04:37:39 +0200 (CEST)
Received: from localhost ([::1]:58072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohifi-0007ok-GA
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 22:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohibr-0001KA-Ep; Sun, 09 Oct 2022 22:33:39 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohibp-0007pk-JN; Sun, 09 Oct 2022 22:33:39 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 l1-20020a17090a72c100b0020a6949a66aso9238706pjk.1; 
 Sun, 09 Oct 2022 19:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sNDpjghhIJzk3ZF5nExh31OS+OUK/eTgV50nYtZkFLA=;
 b=gdWGVWv6T4Dl4lRUQ7gIoO6qJf4co9GnJMxO1gjA2zIpQ8BxbF584LwmhSDG2HyXIV
 CWcta5Mz+AjTnEpL8PURltsWr1/Q33GkYfLt1Aabw3tyHaouqZhKl2y579F0tQaOHG1K
 zAGmJqngBTkx6WAAC98BRm2Ij/4gE7yLPGdSHeaDf0ANwhtPi9vtpFnxkVRgiajH3ebf
 Ihl73pc68cSlJ4YpU38KbfCFU9xsetyAl1C4QUMZP5LsIYzd1oS3Ki7xEjYllaSqNc+1
 Bl6xcZ/+TAsfzH3iQWNMVVzT0LweqLgGUrjYIZZTU3LV1rYdSP3Fn2MEQn4MHOgEzjw9
 eWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sNDpjghhIJzk3ZF5nExh31OS+OUK/eTgV50nYtZkFLA=;
 b=pNY5aOZ38VkKqXqtMlVFBh+E87Gx4oUz3wnbaq5dOhRxwxbKf11OCEqp/+hiO3rKet
 0QBXInpfeTigGS/6x0XeZVMrY/V3EKsKgR7a6S9dlwd67D6myzUHJtXOY0ibxTyDb7aa
 jiuLavX7EGbQnVw5dk7zAMuLuwkEeKfMuAYYbXNN+H9wLxPdZPiWVYdhRHHj0hrsnI6S
 pqx4gP6j4kh6V+yXebQgKIQ7ZTuFRLXS2gxdV4JwiMpBnVcRRap3i+fNK/ywS6WuzYoL
 59wadt0ctrb7mJmmBmVH77H82BrePxhMY2i4CxQQiG1wN99qNGPeqw+Z8d3EkUwsUQDQ
 LdoQ==
X-Gm-Message-State: ACrzQf32UHOnEJtbYh3gBNvExFaKpObWOpF2ZE64dPtUfxnX4Aq6kOR+
 KeqDwiNFJBdMVgkhfZCkNfbR13EpjKo4TPXWpM4=
X-Google-Smtp-Source: AMsMyM4j5T9YSRv81Bf1XwfLTv8IUjnPqN7XP4rlnsyOF6ghgoMHfK+nvixFMMNYysJegI+HPM9Q5A==
X-Received: by 2002:a17:903:245:b0:178:e0ba:e507 with SMTP id
 j5-20020a170903024500b00178e0bae507mr17253654plh.115.1665369214601; 
 Sun, 09 Oct 2022 19:33:34 -0700 (PDT)
Received: from roots.. ([112.44.203.212]) by smtp.gmail.com with ESMTPSA id
 j64-20020a625543000000b00537b1aa9191sm5743995pfb.178.2022.10.09.19.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 19:33:34 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com, hare@suse.de,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v3 3/3] qemu-iotests: test zone append operation
Date: Mon, 10 Oct 2022 10:33:06 +0800
Message-Id: <20221010023306.43610-4-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010023306.43610-1-faithilikerun@gmail.com>
References: <20221010023306.43610-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This tests is mainly a helper to indicate append writes in block layer
behaves as expected.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 qemu-io-cmds.c                     | 62 ++++++++++++++++++++++++++++++
 tests/qemu-iotests/tests/zoned.out |  7 ++++
 tests/qemu-iotests/tests/zoned.sh  |  9 +++++
 3 files changed, 78 insertions(+)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index e56c8d1c30..6cb86de35b 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1855,6 +1855,67 @@ static const cmdinfo_t zone_reset_cmd = {
     .oneline = "reset a zone write pointer in zone block device",
 };
 
+static int do_aio_zone_append(BlockBackend *blk, QEMUIOVector *qiov,
+                              int64_t *offset, int flags, int *total)
+{
+    int async_ret = NOT_DONE;
+
+    blk_aio_zone_append(blk, offset, qiov, flags, aio_rw_done, &async_ret);
+    while (async_ret == NOT_DONE) {
+        main_loop_wait(false);
+    }
+
+    *total = qiov->size;
+    return async_ret < 0 ? async_ret : 1;
+}
+
+static int zone_append_f(BlockBackend *blk, int argc, char **argv) {
+    int ret;
+    int flags = 0;
+    int total = 0;
+    int64_t offset;
+    char *buf;
+    int nr_iov;
+    int pattern = 0xcd;
+    QEMUIOVector qiov;
+
+    if (optind > argc - 2) {
+        return -EINVAL;
+    }
+    optind++;
+    offset = cvtnum(argv[optind]);
+    if (offset < 0) {
+        print_cvtnum_err(offset, argv[optind]);
+        return offset;
+    }
+    optind++;
+    nr_iov = argc - optind;
+    buf = create_iovec(blk, &qiov, &argv[optind], nr_iov, pattern);
+    if (buf == NULL) {
+        return -EINVAL;
+    }
+    ret = do_aio_zone_append(blk, &qiov, &offset, flags, &total);
+    if (ret < 0) {
+        printf("zone append failed: %s\n", strerror(-ret));
+        goto out;
+    }
+
+    out:
+    qemu_iovec_destroy(&qiov);
+    qemu_io_free(buf);
+    return ret;
+}
+
+static const cmdinfo_t zone_append_cmd = {
+    .name = "zone_append",
+    .altname = "zap",
+    .cfunc = zone_append_f,
+    .argmin = 3,
+    .argmax = 3,
+    .args = "offset len [len..]",
+    .oneline = "append write a number of bytes at a specified offset",
+};
+
 static int truncate_f(BlockBackend *blk, int argc, char **argv);
 static const cmdinfo_t truncate_cmd = {
     .name       = "truncate",
@@ -2652,6 +2713,7 @@ static void __attribute((constructor)) init_qemuio_commands(void)
     qemuio_add_command(&zone_close_cmd);
     qemuio_add_command(&zone_finish_cmd);
     qemuio_add_command(&zone_reset_cmd);
+    qemuio_add_command(&zone_append_cmd);
     qemuio_add_command(&truncate_cmd);
     qemuio_add_command(&length_cmd);
     qemuio_add_command(&info_cmd);
diff --git a/tests/qemu-iotests/tests/zoned.out b/tests/qemu-iotests/tests/zoned.out
index 0c8f96deb9..b3b139b4ec 100644
--- a/tests/qemu-iotests/tests/zoned.out
+++ b/tests/qemu-iotests/tests/zoned.out
@@ -50,4 +50,11 @@ start: 0x80000, len 0x80000, cap 0x80000, wptr 0x100000, zcond:14, [type: 2]
 (5) resetting the second zone
 After resetting a zone:
 start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:1, [type: 2]
+
+
+(6) append write
+After appending the first zone:
+start: 0x0, len 0x80000, cap 0x80000, wptr 0x18, zcond:2, [type: 2]
+After appending the second zone:
+start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80018, zcond:2, [type: 2]
 *** done
diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests/zoned.sh
index fced0194c5..888711eef2 100755
--- a/tests/qemu-iotests/tests/zoned.sh
+++ b/tests/qemu-iotests/tests/zoned.sh
@@ -79,6 +79,15 @@ echo "(5) resetting the second zone"
 sudo $QEMU_IO $IMG -c "zrs 268435456 268435456"
 echo "After resetting a zone:"
 sudo $QEMU_IO $IMG -c "zrp 268435456 1"
+echo
+echo
+echo "(6) append write" # physical block size of the device is 4096
+sudo $QEMU_IO $IMG -c "zap 0 0x1000 0x2000"
+echo "After appending the first zone:"
+sudo $QEMU_IO $IMG -c "zrp 0 1"
+sudo $QEMU_IO $IMG -c "zap 268435456 0x1000 0x2000"
+echo "After appending the second zone:"
+sudo $QEMU_IO $IMG -c "zrp 268435456 1"
 
 # success, all done
 echo "*** done"
-- 
2.37.3


