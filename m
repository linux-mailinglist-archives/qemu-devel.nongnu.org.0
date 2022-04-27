Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023FE510EF4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 04:46:54 +0200 (CEST)
Received: from localhost ([::1]:34438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njXhc-0005by-OB
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 22:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1njXgl-0004xL-Kv
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:45:59 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1njXgk-0008Q2-5A
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:45:59 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so611618pji.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 19:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D7Ez5RC1k4creGmSeAOGMmMH0WhuUkCXzHimCqCiQBs=;
 b=qR0EhT8qRm1P06rJQ2/Vqxg2OveGqW/eAzGOgSe1mSU7b2WdiRymDspGqApT6wouBB
 +EbWAcy0NF43hhpWKbAbyu8l8Ocg4bny/TNbcgXBFfMFjXIR3WDA+DI3oRnapFO6dYCY
 I3FCHHzOwuhj+n12sz1lHAwRqtn+AJh0fn/suIJfuKrHJKM2RvEQM8j18BGgX/ylw7YJ
 fhVIG/7caDIWVgG3v/qCcmXd8w4sxy/iqjcMqTcAdhy7Y9UwdRybAGpLdYdWhFl1ARB7
 JW1TUdf7R6ff632004HmgSdHrQjHGIWO9SBEZzwEcgFVYKLSRiv3HtFdz/OLWSa7roNX
 /97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D7Ez5RC1k4creGmSeAOGMmMH0WhuUkCXzHimCqCiQBs=;
 b=4U5GXcxThc7SLWxFviRnaCnaWaSyTZi3BSga6Y2W8B081WbFvOug2MUbH+SFb1kpJn
 PCgXCHKiv9LzWqvSSl0jqEbIJeuK+tbhAOW1StQyoZ9iWFsoFDm27omThOgYxAIrv0ia
 rpruDzfLwA5rODMeko9LFh3x8KE0nb46AdAfg14+hccxioN8h35huzyniY8bbNF+QTbe
 qa62sZ1apLn25EyZzsp2rHKi+Yb+ZRzusjXZLVVlbICC6FDYVOgRNMXzA6DD0WM2KcCU
 p1Pb833HjHZ0s7zrBkZGFDcotX6TgGxRbVco896z1uAOAVml+4gzQBbwF8T+3luhH0bK
 pPzA==
X-Gm-Message-State: AOAM53090C2aJVdJKxDn1tbdQCddEiWq7kNFo0f8kwdd0JhzyUOX/HP4
 MsNAbHegXF30uPqRc5n8NDb1Yf2/lpBfmA==
X-Google-Smtp-Source: ABdhPJwvEbcYnD/ayTd0mQYThakivMO1TPmuzvnbLGv4hbCb6Vjh6JmtbTLBNeE0seYDa7nYgq3iaA==
X-Received: by 2002:a17:90b:4a49:b0:1d2:adce:8a89 with SMTP id
 lb9-20020a17090b4a4900b001d2adce8a89mr41313857pjb.43.1651027556320; 
 Tue, 26 Apr 2022 19:45:56 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:6592:2b54:e92c:a9f3])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a17090a074800b001d92e2e5694sm4363466pje.1.2022.04.26.19.45.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Apr 2022 19:45:55 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] 9pfs: local: Do not follow symlink in _nofollow
Date: Wed, 27 Apr 2022 11:45:45 +0900
Message-Id: <20220427024545.18298-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102d.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/9pfs/9p-local.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index d42ce6d8b82..def8afdb4d6 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -365,7 +365,7 @@ static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
     if (fd == -1) {
         /* In case the file is writable-only and isn't a directory. */
         if (errno == EACCES) {
-            fd = openat_file(dirfd, name, O_WRONLY, 0);
+            fd = openat_file(dirfd, name, O_WRONLY | O_NOFOLLOW, 0);
         }
         if (fd == -1 && errno == EISDIR) {
             errno = EACCES;
-- 
2.32.0 (Apple Git-132)


