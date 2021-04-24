Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B3A36A211
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:24:06 +0200 (CEST)
Received: from localhost ([::1]:47996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laL4g-0000p3-29
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiE-0005an-LV
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:55 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:42759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKi2-0004FL-Cz
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:53 -0400
Received: by mail-il1-x12b.google.com with SMTP id a9so1187645ilh.9
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+qgB7LIv7ulI10/sB6fMYvxgl/UL1tSMx6lT6tBXwJc=;
 b=bm+o8ZGyDNA2L3GrisWJUDvv2HPhHRhEWm68wbP4DPz4CJpAoHB6Ripu0wgAmOAC7t
 HYaByXBVxAKHcAKWc6qr1CNktyNoPlrJTaxvgFe+JgdunuwnD3AWJ9jNLuHud4KzdnWZ
 Cr00f54Pky+toSzB9YHUCMJQ7derfG8RAeAAejoCmS5NEOvu+13/pwLwVLi5ZDA0kEZ4
 YwkMKYM5Xd2KH4wlwGl4d2XcpuJGvGxdrjrxMnOU3dJ3TW1+tRkwS29Sw2lvqLUhIsGW
 +zolpWl9B1aKs+2nXiG1h3ZETyCa6jN4Cb9ngxI0g49nIFgJb8CSJDpHz2sdpNjRwbIY
 d68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+qgB7LIv7ulI10/sB6fMYvxgl/UL1tSMx6lT6tBXwJc=;
 b=dC7Ii9m0CcTD+W5JwvsI5bxPmqM+I24S/O3ZBTQol2kmWHl/41jSFP37IIzHfcuOMH
 IwEbnbM0ZTi4ZDx+zgkBLCvEEdONFO+iFbsigPCApNSj9+FGvuT+u+C3saj4vlECNVP8
 +LLRI60kBI+brq+GQpshISaSHMO9IEMB91Q0cNdg8C/h2WFWFQLbYmFWm/ssmVKuOkwf
 dqYPGsIRmusqZbg+CCAQtubadtEfz/jsglbiozDTu3YH1rw4+VApxmmDeXR8LTJPOaud
 RiANRGbscLPqN8CS6khGEffpg18RTqUTfBrTSTAGFI4hcIJZSDGxERv17dKl7UaJKv5X
 yvHQ==
X-Gm-Message-State: AOAM531cpZCXmRc2oS2Sc15U5xD7J4hFv7oI230MDOPJPR2+VJH5Q7rb
 AcDDQdTNVsQSzj5g00FLBSmfHAHxS6C64+AC
X-Google-Smtp-Source: ABdhPJzYL57O4yujeZKUf9NBEq5F0CKJtG9h/KDxGF7A+rbfcVgtsw8TNWT1dWjGHTbAoAOS9gPR6A==
X-Received: by 2002:a92:d650:: with SMTP id x16mr7034694ilp.223.1619280039908; 
 Sat, 24 Apr 2021 09:00:39 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:39 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/48] bsd-user: style tweak: Put {} around all if/else/for
 statements
Date: Sat, 24 Apr 2021 09:59:44 -0600
Message-Id: <20210424160016.15200-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsdload.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index fd14ffa4cd..e1ed3b7b60 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -13,8 +13,9 @@ abi_long memcpy_to_target(abi_ulong dest, const void *src,
     void *host_ptr;
 
     host_ptr = lock_user(VERIFY_WRITE, dest, len, 0);
-    if (!host_ptr)
+    if (!host_ptr) {
         return -TARGET_EFAULT;
+    }
     memcpy(host_ptr, src, len);
     unlock_user(host_ptr, dest, 1);
     return 0;
@@ -75,8 +76,7 @@ static int prepare_binprm(struct linux_binprm *bprm)
     if (retval < 0) {
         perror("prepare_binprm");
         exit(-1);
-    }
-    else {
+    } else {
         return retval;
     }
 }
@@ -132,11 +132,13 @@ int loader_exec(const char *filename, char **argv, char **envp,
     int i;
 
     bprm.p = TARGET_PAGE_SIZE * MAX_ARG_PAGES - sizeof(unsigned int);
-    for (i = 0 ; i < MAX_ARG_PAGES ; i++)       /* clear page-table */
+    for (i = 0 ; i < MAX_ARG_PAGES ; i++) {     /* clear page-table */
             bprm.page[i] = NULL;
+    }
     retval = open(filename, O_RDONLY);
-    if (retval < 0)
+    if (retval < 0) {
         return retval;
+    }
     bprm.fd = retval;
     bprm.filename = (char *)filename;
     bprm.argc = count(argv);
-- 
2.22.1


