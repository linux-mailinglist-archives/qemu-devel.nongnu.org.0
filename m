Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813D313178C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 19:35:07 +0100 (CET)
Received: from localhost ([::1]:57784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioXDV-0004rj-Vc
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 13:35:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45499)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1ioX4D-00029p-Vk
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 13:25:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1ioX4C-0004FY-RJ
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 13:25:29 -0500
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41]:42441)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1ioX4C-0004FG-NL; Mon, 06 Jan 2020 13:25:28 -0500
Received: by mail-qv1-xf41.google.com with SMTP id dc14so19417436qvb.9;
 Mon, 06 Jan 2020 10:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bPEopA2rGPiKlnwe7NwEEW5/buNpX4bBB0w0wRuIyWo=;
 b=VwihmafXyrVYQKAP1pZJKtR4hfs73lmSlCTxATzLXkFHVkupvup1ZQLLLiplJDqsQq
 bczTVaeiaZ4fDnBYDC8azWkuwM4uEx6INZLK3pkookVwygZbBOteZgBd5nFDXEG0BWaW
 o1S77n7u3WX2kZnhr/LV8l5clxTwAKoh8rVd711zrk5rono1U5aZjP+H1H5/+rPB0K5U
 dw8gWHKa1d6qlfDUZYM6aEQkZEo3eqSH/V8H6fL7i9Rg4RaRb+JBOAopejZ19h43YXe0
 WA7h+D+gqR602cf0FMGl8ykZf+3Cjh3/G4HDEEXLmPKtF1lFtC/hNNnFMbxLh8F6VOgT
 ytZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bPEopA2rGPiKlnwe7NwEEW5/buNpX4bBB0w0wRuIyWo=;
 b=hZC+UXSMN/waHCpoNVPYUK8lspLBXVYx/pepyVHwuYcYOPbbcdpc10qMh9E2NCehxx
 Qk6xyyWOhbzR0Ly2Dh1ZfY7tNuHleTxcdM8YLh0EQpXp9SVsrb5Q7z5LY4+KCb2hUjyy
 t855hOmZy58G5lE8huWGwJHvCeN8XRK2GQR2B2JF5H3h1E/Bu0SlAdyU9MLIs9H0BYe9
 c3VCb5ASNvgPmop9hwhi8yzdTtcrMuRJP+VcFZ0vPexmJO60/mnMsOpPpl+Tld3WR4BB
 DpyaRpHzKlpbtEc5qP9zkrYhu7CXuOJyq+0KrkSIZutHTZ6rHfMQa0nmtV7OnejF+ODV
 eWUQ==
X-Gm-Message-State: APjAAAWnsj1MgOdil44OtfA9qcz7d0oA5MRYOxLJ1c27Zv4nzSC0eqnv
 aO8Z5RtJ/B2NSLs39VsfOwm77rZ0
X-Google-Smtp-Source: APXvYqzciuoVbabwwxlGIl13Ksj3vtokHbUWMVSjvO9RGjZcKpW4zNQZ5T9o2tbs6M1UcRLDoSfAdQ==
X-Received: by 2002:a05:6214:1272:: with SMTP id
 r18mr51710568qvv.208.1578335128135; 
 Mon, 06 Jan 2020 10:25:28 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:655b:9e1c:e865:3705:e1df])
 by smtp.gmail.com with ESMTPSA id b81sm21026522qkc.135.2020.01.06.10.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 10:25:27 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 20/59] block/vpc.c: remove unneeded 'fail' label in
 create_dynamic_disk()
Date: Mon,  6 Jan 2020 15:23:46 -0300
Message-Id: <20200106182425.20312-21-danielhb413@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106182425.20312-1-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f41
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
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'fail' label can be replaced by 'return ret' on error and
'return 0' in the end of the function.

CC: Kevin Wolf <kwolf@redhat.com>
CC: qemu-block@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 block/vpc.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/block/vpc.c b/block/vpc.c
index a65550298e..2678b48dfd 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -839,13 +839,13 @@ static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
 
     ret = blk_pwrite(blk, offset, buf, HEADER_SIZE, 0);
     if (ret < 0) {
-        goto fail;
+        return ret;
     }
 
     offset = 1536 + ((num_bat_entries * 4 + 511) & ~511);
     ret = blk_pwrite(blk, offset, buf, HEADER_SIZE, 0);
     if (ret < 0) {
-        goto fail;
+        return ret;
     }
 
     /* Write the initial BAT */
@@ -855,7 +855,7 @@ static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
     for (i = 0; i < DIV_ROUND_UP(num_bat_entries * 4, 512); i++) {
         ret = blk_pwrite(blk, offset, buf, 512, 0);
         if (ret < 0) {
-            goto fail;
+            return ret;
         }
         offset += 512;
     }
@@ -882,12 +882,10 @@ static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
 
     ret = blk_pwrite(blk, offset, buf, 1024, 0);
     if (ret < 0) {
-        goto fail;
+        return ret;
     }
 
-    ret = 0;
- fail:
-    return ret;
+    return 0;
 }
 
 static int create_fixed_disk(BlockBackend *blk, uint8_t *buf,
-- 
2.24.1


