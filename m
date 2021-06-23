Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6253B200D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 20:10:53 +0200 (CEST)
Received: from localhost ([::1]:47922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw7Ku-0004Kh-3y
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 14:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7BU-0006Qf-Jv; Wed, 23 Jun 2021 14:01:08 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7BT-0003J8-0f; Wed, 23 Jun 2021 14:01:08 -0400
Received: by mail-wr1-x432.google.com with SMTP id l12so2894407wrt.3;
 Wed, 23 Jun 2021 11:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FLbphoqmwiUyiyCMD4ROz97Sbo7JeHpruBGsZnhByOI=;
 b=fcoQrJ8x8/1mPNpptxbB4XtkjeFOs6vqQ/BNz39Km7riPQ7ylX3nNiLa/lV16JY6YQ
 jnOGY7uFy/gcHrPAPmJhTYis+k6bQcxBqbRteZUTKP/l4XRg+4hjYnBwLIc6T/JFNkcL
 rrAcUsT5qYJn4j7ZlOt824VKM5ybFgiafQzD6HtXmDVW8wPua+XXRRnEd1ozgty3yIwB
 bC5Ql1qLTLsOZd9e/NAsEEyXgkRt4ad41Xp6pYGtx/mxaUGT+6dUFHbiOlUNKHANOUzH
 nwWlLcsRVozJlD5QRsbcer11UK7cEF1YZ4d0w8/pnG9JptrAKV1WWKoXJ1okQSZGzblE
 bJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FLbphoqmwiUyiyCMD4ROz97Sbo7JeHpruBGsZnhByOI=;
 b=kD1WMVVfy0oqPDLq1xDu2cYg7H46/PjzZ7q1xFLLY46+lQsxY9prnPMhnXFsyjap3U
 +ER7+mtgsgGBTXtUW+w8ZhBcW5I4kqdSPAqz2hBxmHPO1pcur2vjPzEJzFjLDYtsr4DW
 co555OXiC++rE3JG45TV0Amb7I4JhAhVC56txx//E53X2M8oBOqNpZu8Wnjt93q7oLuy
 1GLifnP0IVRZTgWGtQWpB4wdqnpB82O8JB+FMbAhpC2ZDiWufc+jzdwouswDpf+zdhfW
 e7z5qrJv88aS/sB3u/78nkld+7t/dfywUOXIAV3m1cWs9wI6611KmVl/F2IDnncey8X/
 3v/A==
X-Gm-Message-State: AOAM531VpwfgoNTnA0s+uRN+VoAkcgtsraPKE1ggFHcmppM0HF/9rcZa
 NCbaqr1hcj7IaYxV7pOYQEawB2I+fYWPow==
X-Google-Smtp-Source: ABdhPJxzse7zV9GRa66MWQpHURrTNuVK6ZqzcVzzftBOxkO+nUJXY5Yrn8js0mmSM5U1YQbHB04l5g==
X-Received: by 2002:a5d:6502:: with SMTP id x2mr1429346wru.327.1624471264954; 
 Wed, 23 Jun 2021 11:01:04 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id y189sm6660678wmg.6.2021.06.23.11.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 11:01:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] tests/acceptance: Remove now unused pow2ceil()
Date: Wed, 23 Jun 2021 20:00:20 +0200
Message-Id: <20210623180021.898286-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623180021.898286-1-f4bug@amsat.org>
References: <20210623180021.898286-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Tom Yan <tom.ty89@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't use pow2ceil() anymore, remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 48c0ba09117..77bc80c505d 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -29,12 +29,6 @@
 except CmdNotFoundError:
     P7ZIP_AVAILABLE = False
 
-"""
-Round up to next power of 2
-"""
-def pow2ceil(x):
-    return 1 if x == 0 else 2**(x - 1).bit_length()
-
 """
 Expand file size
 """
@@ -43,12 +37,6 @@ def image_expand(path, size):
         with open(path, 'ab+') as fd:
             fd.truncate(size)
 
-"""
-Expand file size to next power of 2
-"""
-def image_pow2ceil_expand(path):
-    image_expand(path, pow2ceil(os.path.getsize(path)))
-
 class LinuxKernelTest(Test):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
 
-- 
2.31.1


