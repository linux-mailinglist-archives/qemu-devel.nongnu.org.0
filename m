Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5E8595297
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 08:37:13 +0200 (CEST)
Received: from localhost ([::1]:34972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNqCO-0004rd-D3
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 02:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNq1J-0005kt-1E; Tue, 16 Aug 2022 02:25:45 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNq1F-0003Zf-HA; Tue, 16 Aug 2022 02:25:43 -0400
Received: by mail-pg1-x534.google.com with SMTP id l64so8471383pge.0;
 Mon, 15 Aug 2022 23:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=AbM7fTPtWik1gu6NNQf85lKrMmeb7WBh151vruFR3Dw=;
 b=DxYKwD3DOFDrOdDzdDHuN8XjiD1P7f6dWVBK3jWGMrcvWf2hlrgzdUymHaBoWa2fT9
 AsJM3WoZeKzyVIWgR2TIhkvo/n+8tgAa+Wfvz5CrBUXyfmf0dqZkj/conCqSBv1ls7xc
 Ani81p5EvtWcciwEgK0BNXfsM/UowXyTKfwZNJ6A0YM6+Wwjppg6jdifwB2XhIze+V/X
 m3KVcLV3D882ZWZ0vPdKDoGRmJmKnjzsOBarje1giB27RCdLzLTv0h2EHNmD3WNvb/L4
 7bmsQBHYzz1FNl3+hZ2ZKQivsf4cwgFAgsT5tDiuq/0vBAYNi2fzPJyqqoHEifDen+4I
 GjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=AbM7fTPtWik1gu6NNQf85lKrMmeb7WBh151vruFR3Dw=;
 b=Jvm3sPLWzLl4ELyU2JOomyfb4FnS6WWma0IdO47pFCw7wwLM50URKIHebo9ctAeQO5
 dYfjgW+gN2HjJpf/Cmmv3u+gBq5tIBMIRM+oT7lPd1Dqmzcv7IUDc5BbgNAf0NVMSIrk
 0/KJIY6zg0sPbXwgHx8v8xUC+tXTZXsT3cl+TeBQpmYGbpDSkqhmF9+tfFvgK4u83dSc
 W0xATft8oEJGykONbIvwI0iCryS3JOdoZ/sZzNgCvDuSHPKxn0aQLKVsmLQdyCvDzezV
 6lgE09vQro06e1rJgoGbw/H93qBiVLx807Z6/dRVuLYmuBD+9lrYl7Y2VEFgJma7XI6X
 HtUw==
X-Gm-Message-State: ACgBeo0aAx66tFArRQ2035ycbKUUSHE2vQ40ftyTcGNebwn1/SQQcMta
 utNuW/1Ji8ox1LN7CFRm+sfEj92MBXJGaQ==
X-Google-Smtp-Source: AA6agR5Ukse/QXtua2NSiz5+LhoVJ+B9sRI6mBGHnZbgh6F6LL1Qc8JSgu1lOr12TgIpp3V/hM3ddQ==
X-Received: by 2002:a63:8c47:0:b0:40d:2d4:e3a2 with SMTP id
 q7-20020a638c47000000b0040d02d4e3a2mr17163429pgn.2.1660631139772; 
 Mon, 15 Aug 2022 23:25:39 -0700 (PDT)
Received: from roots.. ([106.84.129.185]) by smtp.gmail.com with ESMTPSA id
 e15-20020a170902784f00b0016f1c1f50f4sm8082868pln.235.2022.08.15.23.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 23:25:39 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 stefanha@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, qemu-block@nongnu.org,
 damien.lemoal@opensource.wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v7 3/8] file-posix: introduce get_sysfs_long_val for the long
 sysfs attribute
Date: Tue, 16 Aug 2022 14:25:17 +0800
Message-Id: <20220816062522.85714-4-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816062522.85714-1-faithilikerun@gmail.com>
References: <20220816062522.85714-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Use sysfs attribute files to get the long value of zoned device
information.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/file-posix.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index c07ac4c697..727389488c 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1258,6 +1258,33 @@ static int get_sysfs_zoned_model(struct stat *st, BlockZoneModel *zoned) {
     return 0;
 }
 
+/*
+ * Get zoned device information (chunk_sectors, zoned_append_max_bytes,
+ * max_open_zones, max_active_zones) through sysfs attribute files.
+ */
+static long get_sysfs_long_val(struct stat *st, const char *attribute) {
+#ifdef CONFIG_LINUX
+    g_autofree char *str = NULL;
+    const char *end;
+    long val;
+    int ret;
+
+    ret = get_sysfs_str_val(st, attribute, &str);
+    if (ret < 0) {
+        return ret;
+    }
+
+    /* The file is ended with '\n', pass 'end' to accept that. */
+    ret = qemu_strtol(str, &end, 10, &val);
+    if (ret == 0 && end && *end == '\n') {
+        ret = val;
+    }
+    return ret;
+#else
+    return -ENOTSUP;
+#endif
+}
+
 static int hdev_get_max_segments(int fd, struct stat *st) {
     int ret;
     if (S_ISCHR(st->st_mode)) {
-- 
2.37.1


