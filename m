Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD72A26AA7C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 19:25:09 +0200 (CEST)
Received: from localhost ([::1]:59044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIEhY-0004Fh-O7
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 13:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kIEWx-0008Og-31; Tue, 15 Sep 2020 13:14:11 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:46015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kIEWE-0002fv-81; Tue, 15 Sep 2020 13:13:27 -0400
Received: by mail-pl1-x642.google.com with SMTP id bh1so1681326plb.12;
 Tue, 15 Sep 2020 10:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7zvfu2AU8jmrgTOs2oC3Qnm1T8TZc9G/7u0+CpqNJic=;
 b=Lxh+fpbtzUw8lEDag8RBDAQu6NVws2MDKUtGtpZUoHfLcBAA4FWBKsts/h49PF2OQX
 eBbG6WNPz9lSEYC+9uTKfd/LM+YBO+ydG+hFyNK50g0UNjIWj2JP9wdE3obtHTBt1bSA
 DrY5t3xeXp+xHyr2CdbT6dLyBU9oOtJmeyUxK8F3LMdLDf1IIJr8u0p0hPDNRs4QU3d2
 AlL70uoTIpF1VteR92LAg4UppG2A1RjzAoFoGuwUG6BElQm4hhY+jtx12xfxkdhPQXLI
 iEQnawpY2A4vMDBnUF2gXkbkLolTAo04DFNoei6rcayYz2uwOyVY0pqZa+Tj1PQ7477e
 ZmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7zvfu2AU8jmrgTOs2oC3Qnm1T8TZc9G/7u0+CpqNJic=;
 b=Sig2H8WpeoVBVPn6bb8xMzjXfCG30Cp3hVoZ01lgUtsfmp2Cub0El3I/yY5gkl8aao
 sGy9ZYvxInPjHQXaO+BpXL2cq4aw06ZLVyYnLJrJiVg3qKFZupiEFKwJq+dScmNK6L6+
 oKu5obX0XqjESexf2ZAduU6vL2N5T8ouIw6St9lFRSib6i8883UluWkvdIlAVRKwhxVP
 /Jf4CtZKwFMxV30vzztO1+PO++OWrTr+AinrvRUuHACdDcJ65vN7RgND62FUWXatqsdE
 nGA+zc6tLU17WYv+xSgXW2ozV/QWsHGPZx1a+475nq7loafp5ZemercAQjQLyFJ+lMHb
 05OA==
X-Gm-Message-State: AOAM531QZqieZWBGZ7VInq5/SXpDaxBWQxUBFwgJM8Pi73W+wgJtqiJ/
 kkh+20KAOgDtiNiBE/XBa8vEEDGH1EpNsx7YL4I=
X-Google-Smtp-Source: ABdhPJxmxx08k/UjHH1KvuuXszEK/OXbFy4Ew5im1vp39jBxnOB2rZokMAX5w5jKghXMCW1zcAPlTg==
X-Received: by 2002:a17:90b:198:: with SMTP id
 t24mr322408pjs.107.1600190004192; 
 Tue, 15 Sep 2020 10:13:24 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id j14sm124046pjz.21.2020.09.15.10.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 10:13:23 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 07/26] tests: Fixes test-replication.c on msys2/mingw.
Date: Wed, 16 Sep 2020 01:12:15 +0800
Message-Id: <20200915171234.236-8-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200915171234.236-1-luoyonggang@gmail.com>
References: <20200915171234.236-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Lieven <pl@kamp.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Windows there is no path like /tmp/s_local_disk.XXXXXX
Use g_get_tmp_dir instead of /tmp.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/test-replication.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/tests/test-replication.c b/tests/test-replication.c
index 9ab3666a90..e7cbd6b144 100644
--- a/tests/test-replication.c
+++ b/tests/test-replication.c
@@ -23,14 +23,14 @@
 
 /* primary */
 #define P_ID "primary-id"
-static char p_local_disk[] = "/tmp/p_local_disk.XXXXXX";
+static char *p_local_disk;
 
 /* secondary */
 #define S_ID "secondary-id"
 #define S_LOCAL_DISK_ID "secondary-local-disk-id"
-static char s_local_disk[] = "/tmp/s_local_disk.XXXXXX";
-static char s_active_disk[] = "/tmp/s_active_disk.XXXXXX";
-static char s_hidden_disk[] = "/tmp/s_hidden_disk.XXXXXX";
+static char *s_local_disk;
+static char *s_active_disk;
+static char *s_hidden_disk;
 
 /* FIXME: steal from blockdev.c */
 QemuOptsList qemu_drive_opts = {
@@ -571,6 +571,11 @@ static void setup_sigabrt_handler(void)
 int main(int argc, char **argv)
 {
     int ret;
+    const char *tmpdir = g_get_tmp_dir();
+    p_local_disk = g_strdup_printf("%s/p_local_disk.XXXXXX", tmpdir);
+    s_local_disk = g_strdup_printf("%s/s_local_disk.XXXXXX", tmpdir);
+    s_active_disk = g_strdup_printf("%s/s_active_disk.XXXXXX", tmpdir);
+    s_hidden_disk = g_strdup_printf("%s/s_hidden_disk.XXXXXX", tmpdir);
     qemu_init_main_loop(&error_fatal);
     bdrv_init();
 
@@ -605,5 +610,10 @@ int main(int argc, char **argv)
 
     cleanup_imgs();
 
+    g_free(p_local_disk);
+    g_free(s_local_disk);
+    g_free(s_active_disk);
+    g_free(s_hidden_disk);
+
     return ret;
 }
-- 
2.28.0.windows.1


