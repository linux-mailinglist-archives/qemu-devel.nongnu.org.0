Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C6636A1FF
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:14:39 +0200 (CEST)
Received: from localhost ([::1]:46384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKvW-000576-Uc
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKil-0005us-HA
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:27 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:34585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiM-0004LN-VE
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:27 -0400
Received: by mail-il1-x136.google.com with SMTP id c15so43208989ilj.1
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bFmEuRUoyogZECJof/Yh6AI51ApSTVaAZW3RigfbmQg=;
 b=DYkYSr1q4M7nIQwWKVFYKLCCAmWUeoIFvS9lXyqu8apKbdGkHz8ZP0LZ+hZd1onf/k
 f9akCu/whAFeHBV+daXvjpjdrJrD1vfXxLpNkg3HLeAQnQcdi8fIb/RLi+31wR+VhxiG
 1fdWQe6lC+rPXWBVeE4y0YDnmpIBX8KXZSNJ8Cg4X9KDifJLjkp45HL73gGRWDM/vVuS
 f49Ws6xcCv4dnJYslKH471TyVts6CQv+mWGGPzvQTBYQbm8IOD/7bkIvtxB6paEW6SA3
 EamoCgVW2MKsNEifut71yU69jxM/cROSy4Xauut6Qyx5mqazbQnGog6aSVkUD/JLI5hR
 Q3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bFmEuRUoyogZECJof/Yh6AI51ApSTVaAZW3RigfbmQg=;
 b=Qv9sc5EIDcutML5plNrKRKByK62eeDf0bK7NFZu1wEnZxkvzY1NvATqVdDrK9y36nS
 uIbk2qPA/syim/wtM0dKIfsEmCYeqeu2eQt4u+XmjCejd56Cc5QXdF0Hq+0xP7tukmL/
 0cZBetzkuVzPHV60pNUrY4qTqdl/m0Gi7UCKcMMF1B5JKeR3OV8gMov25Dr9w7xKtrBp
 vXPJZBvMRwRfWSW+OMHmFYIsWVGCP2RIlcDkC+hpX5rg3LAPKNFIKq2YyFf3qbFno2bB
 6am7ZGBqPCgCWwVMk6x8ZwBG8aNOfTMqClAh0kVqe/y1qr8ugHQtYurAXNGpIFexjdzd
 PBNg==
X-Gm-Message-State: AOAM530sZj9IwEADWjbdu80EwUJyunnvJRCkq7I2SBP+YEoMzi1unxt8
 zngy6D71K3+/igWznRSBfwO9v+BUNIfHWS2a
X-Google-Smtp-Source: ABdhPJzMXrGjSE8kj8WqMgq39Rnjr1ktXt+deBgJi3/hcPJJZhwGKoi1t9Ne8hj+ZB27v+M1IRc+pA==
X-Received: by 2002:a05:6e02:13ca:: with SMTP id
 v10mr6592243ilj.191.1619280060075; 
 Sat, 24 Apr 2021 09:01:00 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:59 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 40/48] bsd-user: style tweak: Use preferred block comments
Date: Sat, 24 Apr 2021 10:00:08 -0600
Message-Id: <20210424160016.15200-41-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
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
 bsd-user/strace.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index e4153fd0a1..aa4ab8cee7 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -159,8 +159,10 @@ static void print_syscall(int num, const struct syscallname *scnames,
                 scnames[i].call(&scnames[i], arg1, arg2, arg3, arg4, arg5,
                         arg6);
             } else {
-                /* XXX: this format system is broken because it uses
-                   host types and host pointers for strings */
+                /*
+                 * XXX: this format system is broken because it uses host types
+                 * and host pointers for strings
+                 */
                 if (scnames[i].format != NULL) {
                     format = scnames[i].format;
                 }
-- 
2.22.1


