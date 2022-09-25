Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0865E9326
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:38:02 +0200 (CEST)
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQtV-00056E-6N
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPs9-0003O3-TH
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:35 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPs8-0006SH-7x
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:33 -0400
Received: by mail-pl1-x633.google.com with SMTP id b21so3924935plz.7
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=AlbGfswSfsbErT9c2Vi9QSm49FyIznpLBZX8XPIW0d4=;
 b=SrMry3rmOnWUdusjOufGMRu9nZcspylO/6ONnFiJCK/eQrBkH2QeKrfbOOqe2CsASA
 q4LkcYkpwXXz4GMqG646aB7siPQXPTkSxttPf4p69iE4xaqD80UXMQ+0kFC0+8o8Ar29
 SIhanLbuBotHp+wX22wxVBOvZbwZPaZM5PVMmoBqSzgLlc+zvsI6pzEZzEQzAQoO3Xsn
 W+J0NIgAH7Hw1FAav7hbUSQp44uFa08evML+8OB7mpFM1i1bYCEaaGLDzj5j9FTFlY8i
 O2im47GFSmg9jlIHyJxXb3z5UMRTJiTUeX+bBJxG8j+wEXi/+IloL/vR/Zj2UOSDZd+r
 lMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AlbGfswSfsbErT9c2Vi9QSm49FyIznpLBZX8XPIW0d4=;
 b=gaj70qbt8rm4Kmpjl7yuzXK7LQ4H0ggj4mpV9yEYcFM0XUUgnHJmeEYaarhsoNNRK5
 gA9Nght9g+qtn4Bw+v7J5nvqPjAKcq8RponCR/hJ1loz3h0uwXiI29BnbUyagHHwkPgQ
 9rmLwgADH2Mn2anJF28TKq+UL0DpIaxeXzfEBsoooSHh57M70YZrkLxylyQ2dcZp7h5v
 Fb1Gsr1ml/xUqpf0bm+QzGzcp3oE6MmlTWZ3xFkPfhkjO8IPV+TNTe57eQju14aHSXRe
 6Ot0Mf4jk6CQQgUmmK4F3D0vjMJ2H+UOc4dsfaGZAQM83wSC2UH887LWzO7maTmkEu7i
 DcuQ==
X-Gm-Message-State: ACrzQf08W3YixezLGRjKFH5whFLtBwxcPTIxMUnzax4Thngw8yQjZMq/
 TqkpwDEc750XkzMsQYMkSgrSHt6gHAA=
X-Google-Smtp-Source: AMsMyM7nsQtx6dGZ4T4pblWiJCZCK1+8w1wjzjgON28oYhIw/bEbbSgqB85e48W5Yjr8b6Zrd/Vn/w==
X-Received: by 2002:a17:903:244e:b0:178:4f50:1ca0 with SMTP id
 l14-20020a170903244e00b001784f501ca0mr17163678pls.104.1664105549289; 
 Sun, 25 Sep 2022 04:32:29 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:29 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 42/54] chardev/char-file: Add FILE_SHARE_WRITE when opening
 the file for win32
Date: Sun, 25 Sep 2022 19:30:20 +0800
Message-Id: <20220925113032.1949844-43-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x633.google.com
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

The combination of GENERIC_WRITE and FILE_SHARE_READ options does not
allow the same file to be opened again by CreateFile() from another
QEMU process with the same options when the previous QEMU process
still holds the file handle opened.

This was triggered by running the test_multifd_tcp_cancel() case on
Windows, which cancels the migration, and launches another QEMU
process to migrate with the same file opened for write. Chances are
that the previous QEMU process does not quit before the new QEMU
process runs hence the old one still holds the file handle that does
not allow shared write permission then the new QEMU process will fail.

There is another test case boot-serial-test that triggers the same
issue. The qtest executable created a serial chardev file to be
passed to the QEMU executable. The serial file was created by
g_file_open_tmp(), which internally opens the file with
FILE_SHARE_WRITE security attribute, and based on [1], there is
only one case that allows the first call to CreateFile() with
GENERIC_READ & FILE_SHARE_WRITE, and second call to CreateFile()
with GENERIC_WRITE & FILE_SHARE_READ. All other combinations
require FILE_SHARE_WRITE in the second call. But there is no way
for the second call (in this case the QEMU executable) to know
what combination was passed to the first call, so we will have to
add FILE_SHARE_WRITE to the second call.

For both scenarios we should add FILE_SHARE_WRITE in the chardev
file backend driver. This change also makes the behavior to be
consistent with the POSIX platforms.

[1] https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and-opening-files

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Add another case "boot-serial-test" to justify the change

Changes in v2:
- Update commit message to include the use case why we should set
  FILE_SHARE_WRITE when opening the file for win32

 chardev/char-file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/chardev/char-file.c b/chardev/char-file.c
index 2fd80707e5..66385211eb 100644
--- a/chardev/char-file.c
+++ b/chardev/char-file.c
@@ -60,8 +60,8 @@ static void qmp_chardev_open_file(Chardev *chr,
         flags = CREATE_ALWAYS;
     }
 
-    out = CreateFile(file->out, accessmode, FILE_SHARE_READ, NULL, flags,
-                     FILE_ATTRIBUTE_NORMAL, NULL);
+    out = CreateFile(file->out, accessmode, FILE_SHARE_READ | FILE_SHARE_WRITE,
+                     NULL, flags, FILE_ATTRIBUTE_NORMAL, NULL);
     if (out == INVALID_HANDLE_VALUE) {
         error_setg(errp, "open %s failed", file->out);
         return;
-- 
2.34.1


