Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BCD3BAE56
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:39:28 +0200 (CEST)
Received: from localhost ([::1]:58436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m071b-0004B3-CD
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070H-0001jH-8O
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:05 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070F-0006MG-UD
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:05 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so8683713wms.5
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SCTnh6ViTUcE9tM6sSFAubvn8jw+9dyc2QNPJEEjeRg=;
 b=OSReax8J1dFzoof68kbrQMcb4QTVQnR7wuLiOgObPKJ+41eVBvHPZkrHS3rebwY8v+
 5rGqQ+uz/dqGmfoJLZnldnJ56W6V7DJVmjFb25yqJ1KNp9pt9xoWxhptZa70ig9tewvR
 B4j9K4xnEVxGnVC3nCm/vN69Vc5uUhAIwuEzqmgCoqeP/uMshlQ9kVDFewJajoC4af05
 Is7syzqAoAwMCKuMV04lpit2AiMN1cQWF3/vq7uUXDtTm9FjbYvnQIhPzfiEwYmVALQ9
 s3cJg/GNHnmfiyyoGH+9TK1BhnWDk4n4GYn38uH3FqtFOlzae6MqW0TTL5Ls8DfAk8P0
 y4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SCTnh6ViTUcE9tM6sSFAubvn8jw+9dyc2QNPJEEjeRg=;
 b=kdyvR7vjXkaKUQt3KY2u7//vpzlAUg+VT/ZRHAY1XDsoie5/+JgRc3ThzDo6PX7XSi
 wSXCyFXYspZEoo3KD+f6pX+KnnpqCqutwSuh5nZVnxzliu5WdC+RCA0Fl1s6YPV2l+OY
 jQ/+GrGsknhuNwBSXzmy5xM0GWii1/+yBRuJgp/HL/+e5tpcfICdtKatdVpW00bIZGQX
 vqWYE+U8SPi4a0PvzocWtkUcwm6vTr8zA7biOzlBPss3FTajYMIRwzr0NX6j+gwtoG+X
 D78wYwDd/4Wt/41MK8XcSNdiEZ22qIa6iJKBd4VcI2IOJvmiPnZl3m4zylnzhpJFumFO
 kc6A==
X-Gm-Message-State: AOAM5316Ngj+Y0w9W0zPhQhRvi8uhV3g2vNDxPcj93+BKomQPkAuOcrr
 7PGhEvuPyBKc1sCwydH0QtUerVyWyzg=
X-Google-Smtp-Source: ABdhPJwHcNJTJ4ylZIvwUDF3N/se5egewBbZMoxK5Vq446wODbiNnnmdGIKkmZlhgQkCOKiqs4DU1A==
X-Received: by 2002:a05:600c:2052:: with SMTP id
 p18mr11104167wmg.168.1625423882326; 
 Sun, 04 Jul 2021 11:38:02 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b7sm6896299wri.96.2021.07.04.11.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 11:38:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/12] linux-user/alpha: Handle TARGET_EWOULDBLOCK as
 TARGET_EAGAIN
Date: Sun,  4 Jul 2021 20:37:44 +0200
Message-Id: <20210704183755.655002-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210704183755.655002-1-f4bug@amsat.org>
References: <20210704183755.655002-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Helge Deller <deller@gmx.de>, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Taylor Simpson <tsimpson@quicinc.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux kernel defines EWOULDBLOCK as EAGAIN (since before v2.6.12-rc2).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/alpha/target_syscall.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/alpha/target_syscall.h b/linux-user/alpha/target_syscall.h
index fd389422e31..4e6f9360566 100644
--- a/linux-user/alpha/target_syscall.h
+++ b/linux-user/alpha/target_syscall.h
@@ -44,6 +44,8 @@ struct target_pt_regs {
 #define UNAME_MACHINE "alpha"
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
+#undef TARGET_EWOULDBLOCK
+#define TARGET_EWOULDBLOCK      TARGET_EAGAIN /* Operation would block */
 #undef TARGET_EDEADLK
 #define TARGET_EDEADLK		11
 #undef TARGET_EAGAIN
-- 
2.31.1


