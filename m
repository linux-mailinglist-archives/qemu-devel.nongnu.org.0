Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69E036A222
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:34:59 +0200 (CEST)
Received: from localhost ([::1]:49416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLFC-0004bM-BJ
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKij-0005pq-Bd
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:25 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:40745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiL-0004Kw-23
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:25 -0400
Received: by mail-il1-x129.google.com with SMTP id c18so43124165iln.7
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LwG+nWA2LtdBBnjFrGwuENdtJtdJ3/bpWBWdq5mEXd8=;
 b=G8uQSqBy9ycxOHOtptCKYH4wmvelfbZwOF311yd/Xc4fhGF56ClLkoz3QrcRnxWH/z
 kYFdBPnC+iDdaUGYUif9SBdqWKgPcq4IVqVuFU3LoM7t3KOcqVc1M7tULcQfa3evI9mo
 aGZoollIDEAyRX4vPx7FjD7gxFwDh9EZY8xgx0GxHen6FgFQl90FHzSLMu+US/98AK/g
 nEEpAfBQUJhTrH85kfpl2M8Fy1FbP64ldN3zQ4iUuH/PNE/gZ6FPIXdZMO4kt7QgfBF8
 CmZXqf97J/SVfi5ewV8MqWJHj/wA91eSaWdW+iMaCWqdqsTSJm/bLW52L2M4E3Fl5Eu4
 xYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LwG+nWA2LtdBBnjFrGwuENdtJtdJ3/bpWBWdq5mEXd8=;
 b=YX1A3mVvd5DN4kCI+iz6mVZjjC2FwH2plrnSj982QuShOLAEit3/+Kb5XWAheG2wA5
 qsOV+5upSp3D9YLLIRQhVjZSbzzpbROGQaBU+TqEfDh/CkPmQ4MDdj33Gy5LjAxT9E/c
 J6ZG3cLL4rBmLhyU5nGi2r1d6U8EixWsHWNnOheMxkog7Wt83Nr5rxCrZ8iLdKyTVk2m
 MHy8n7puRfqvNiECNaelNjmuLWXmlkXtq4VvyrAB3W7aEFoSQf0QJFrqxNCef7eqKIXP
 Oj3L5c7Iu9wVd8bnRkTVJF9x9Fmv16MGW2Ec3beBvg1mun2fusHphHe+3XDlO/wnmAn5
 VDbg==
X-Gm-Message-State: AOAM533Xr+a2tZaSEOmbaN/3hJN/qrpFUQci/JoJ/Ag5VwwDaOW7CsDc
 QRvMwF5aiKtHVW0fyuh8h3a65l6P8DMabILQ
X-Google-Smtp-Source: ABdhPJxrvK5qnn8BoNHuIvqPgAE2WeKA1bkfTuZZKEWapaz1+OQW4rzkWFDeYhSgxR/qf/XGwS6qtA==
X-Received: by 2002:a05:6e02:1baf:: with SMTP id
 n15mr7180330ili.148.1619280059266; 
 Sat, 24 Apr 2021 09:00:59 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:58 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 39/48] bsd-user: style tweak: spaces around =,
 remove stray space
Date: Sat, 24 Apr 2021 10:00:07 -0600
Message-Id: <20210424160016.15200-40-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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
 bsd-user/strace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index be40b8a20c..e4153fd0a1 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -147,11 +147,11 @@ static void print_syscall(int num, const struct syscallname *scnames,
         abi_long arg4, abi_long arg5, abi_long arg6)
 {
     unsigned int i;
-    const char *format="%s(" TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld ","
+    const char *format = "%s(" TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld ","
         TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld ","
         TARGET_ABI_FMT_ld ")";
 
-    gemu_log("%d ", getpid() );
+    gemu_log("%d ", getpid());
 
     for (i = 0; i < nscnames; i++) {
         if (scnames[i].nr == num) {
-- 
2.22.1


