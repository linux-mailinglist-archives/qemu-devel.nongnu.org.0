Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551F3370004
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:53:01 +0200 (CEST)
Received: from localhost ([::1]:52436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXK0-000682-B4
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lcWvv-0001HH-Ic
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:28:07 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30]:47092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lcWvt-0003nz-Na
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:28:07 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 k26-20020a4adfba0000b02901f992c7ec7bso2218270ook.13
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fseFyTir1UuEOvm76mfhyfMzoaGC4uNp7JEOiDXfHFs=;
 b=PRoCjOb5ZSKO02WqT030zeRZd3n8Km36wBCk7vwSyPP7bxrFWMma0ybvEcM1wZhvz0
 A0kf5EyfsPnhe8wJjUJmEAq/04LSHxl+i+RjR3BlMFoyJsMaMm3Rp/Rb//VBUlRNIiWr
 rj1QzPCG15D1iXuKBkl+l7QOZtmFKNZTqgprBgbMCAe6KBUTNgGN4fTrPEixlZtgFIQH
 JGx8np5//iUCjZGhpzGyheR1WcDiWddagTu2dQW8sEdQS//0W0bfGrvRxsSWVjdMOBI1
 5rrN3bShpyayWuVAuCksfWkeAoMakupWhs/mAnbZmBvAWgbYxDamWrwyrJRZNHL3yqY2
 AZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fseFyTir1UuEOvm76mfhyfMzoaGC4uNp7JEOiDXfHFs=;
 b=AyT7M1BWRk8EL2p86+RuB/oEpIXBBlQKSy0yu5B8k0V2aeYbuNgndwGkiEi1jaT7WG
 m5dSVn5Sff2SZFl2ipJlWYNp1sjLbsxgEsTxYH22JNwDt7/5cxGkIaIHNTa2dAN2hGFz
 A3xDd81daw0/creH9MY+x16GJP953qVlOcNibXRniCOgRTw3ceZ/Ri7Wzo0WGDLiwDcG
 K87MY7qfFTnjb0+INOTfRkGo7NvCS1X8GRf3i38rLsJF/u/zvnl+9NANTDAcqK5baeMP
 c0G3MAznPhX5DDidGTyn18rj/ZVYXpg8rNlPG4Wo5Rr/Y9U6RLh04okDcT6zzJJT6JtQ
 aq5g==
X-Gm-Message-State: AOAM530N4pPxCETp+NCvjaNqZfsSOuee0oJMmk4daZf3CLoH65qWvPSl
 H0ghCvhGM0LTG0I09m4k84gg0WrVdiCVaw==
X-Google-Smtp-Source: ABdhPJxiA27uwAkaBVvGkRi4OF57wJA7eOSueXraEXSDUmgunZEkf34vnarO58f1Qg5TNEVOYZ4nKQ==
X-Received: by 2002:a4a:d02a:: with SMTP id w10mr5390947oor.72.1619803684303; 
 Fri, 30 Apr 2021 10:28:04 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d207sm297587oob.7.2021.04.30.10.28.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Apr 2021 10:28:03 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] bsd-user: style tweak: Put {} around all if/else/for
 statements
Date: Fri, 30 Apr 2021 11:27:46 -0600
Message-Id: <20210430172746.99818-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210430172746.99818-1-imp@bsdimp.com>
References: <20210430172746.99818-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::c30;
 envelope-from=imp@bsdimp.com; helo=mail-oo1-xc30.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


