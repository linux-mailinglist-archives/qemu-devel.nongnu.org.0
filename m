Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A96369B83
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:47:37 +0200 (CEST)
Received: from localhost ([::1]:58206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2i8-0005Mw-49
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b6-0005tS-73
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:21 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:47017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b2-0008CP-Oz
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:19 -0400
Received: by mail-il1-x132.google.com with SMTP id l19so1202792ilk.13
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+p7bgzl3P92a2AG9Mhyg/hcdVHv2/BVMcAyEHGEflKI=;
 b=qmJe2AeUoRMc6wBO0GYk4j7bTkr9vMJnUB76QlzdUKDK0snTvo+X9rajs3Anu7OqkS
 k8Nug6U0Lx1kbgtyZmoyK9LCwK0Jox+wi18w5Bevl0G4QV4hmtDXS+PIhXao/fF1Wpdf
 AoQBH9i2vEkfrrxZ0ogipgbS8ye/N++/2byhJG49yaLIWY03CxJn0RmYdQ9einyQhZKw
 BVoPD6t1aaH/dlUs0zTNb08MwBU3XtWOXjD9C7yqzy7U40l/EhfwgTy3GlODejIhLaw1
 PqnFU1DXLKv1L102XsZDeIkjdcVlSa38SRpFPFa6VlpTlKYjj0QZQNzUDv3xVJgzNvUZ
 k7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+p7bgzl3P92a2AG9Mhyg/hcdVHv2/BVMcAyEHGEflKI=;
 b=LmDXH2lj7qkKO8chWStpfrS/HP4XqipLIJ/EtIZRMn5xNdQwABCFHDz2aKHnjq3iyj
 PZ6eqyGGwsoHFOj0vbarM9PUKiaI8EWgAPpruiLXD55kVC7Bsab+Ytx6g29ihzWeGXd/
 FkeIenRBuFVXl0N5EXUwIfTF2dGzm+9RSqG8u/efLUVQevL3bT8W2xVkO1w5e2BACvMV
 nKnJqtsTQGGrn53F4TV47XjgCyuN6gAzcon7vDiQHVZAeJgZuPY6ObmN6ja/LOX0btjL
 eJOKmbuNOIW9f8tn1wFOGXqd8K6n33QYTMfVCSLg54Zhsc/hjOJAbFu0oQljhjmyPghb
 x5OA==
X-Gm-Message-State: AOAM53069o9SwDInDo+Oy/fvIR6UH32fkiCgyOO3FjaPCCeI6nQ5Z9U8
 Mb8G1Yczd2FZG8jzDrnswZz6Z8wgm1wzHOWu
X-Google-Smtp-Source: ABdhPJynRl+/c0oT0boZIH83RKo/EY4XtmVGWkixhCPrQuR618U3tuiXkhgG1LiMViBYspH/GE7kPQ==
X-Received: by 2002:a92:cac5:: with SMTP id m5mr4337190ilq.222.1619210415458; 
 Fri, 23 Apr 2021 13:40:15 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n1sm3201308ion.22.2021.04.23.13.40.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:40:14 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 17/24] bsd-user: move extern to header file
Date: Fri, 23 Apr 2021 14:39:52 -0600
Message-Id: <20210423203959.78275-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203959.78275-1-imp@bsdimp.com>
References: <20210423203959.78275-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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

extern char **environ has no standard home, so move the declaration from the .c
file to a handy .h file. Since this is a standard, old-school UNIX interface
dating from the 5th edition, it's not quite the same issue that the rule is
supposed to protect against, though.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 1 -
 bsd-user/qemu.h | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 5958b07e62..a94ab63065 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -48,7 +48,6 @@ unsigned long reserved_va;
 
 static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
 const char *qemu_uname_release;
-extern char **environ;
 enum BSDType bsd_type;
 
 /*
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 3480db890d..4305bd1aed 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -27,6 +27,8 @@
 
 #include "exec/user/abitypes.h"
 
+extern char **environ;
+
 enum BSDType {
     target_freebsd,
     target_netbsd,
-- 
2.22.1


