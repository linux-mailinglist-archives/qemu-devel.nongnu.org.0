Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF003C14F1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:16:13 +0200 (CEST)
Received: from localhost ([::1]:57788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Up2-0007tb-Lx
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1Uky-0000uV-0Z
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:12:00 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1Ukw-0002dE-KM
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:11:59 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so19020737wmq.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 07:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6dsB8cMCUImwWEL5TbAD5ltzkk64xQvJ0itCNpq6Yho=;
 b=sq2ZcazH8KLjVbfs8DNC0dU0zeW8YaODQ+BDsk2Nuvq1RA9eDTB3DN4Is7P9rEqJIw
 gUBq0ZXmGwhoL/ESSdTjTQedCiuW3hRo05t0eY6X/opdQXVos5MI0q9hdix0lHLQSFxw
 32ZUEDCQWW9i90oekMe2oe/0hxctHhgtv+X1j3+YSXLNJh1tQ8WznrlEloIFVyug5HRZ
 687/sChSpIeh2GgqwFV8G8zXkRVd9dlmuQQh89/jVUt3HVK6TVsbO8qLCf55M3d/cM6U
 XGjENMd5tL3jg+tvTH0GTcygXUzONcpYBwfoEqUJKBpMDEPZn5vmdNmZ4lScjGEXtCxi
 RkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6dsB8cMCUImwWEL5TbAD5ltzkk64xQvJ0itCNpq6Yho=;
 b=CiIZ/i0XdmCycV9vO1oPA7Ll3fiCnkJyNzMLpeSUUh6ZCtVdFKKxiTCylixaG0j/lZ
 pjzlahBFtqXuM1jLgUm3ZdXHl+YFEiQtvelsEA5MNpt8qhOP9KgZHONISGuQfx9xPuAj
 DTVtZo8nYmRryBYV/rlivvVQwgVdBxLOjR8PBON5zP+iQgqNZXP5pQI+6aCwiNOdyZG0
 gZAixdFp1EOAWv8vU5Ji5pTbomcmKk3ftbXSF10QuWlZeVJbwxt23maA+9cZ7waTBGBu
 9oSYQlQbfAtKJbIr8eTgxg/xy/AdhOUL6ToAIVYS4AMCnODxGPi+e4V03mAKFxOJ/j5D
 Zhew==
X-Gm-Message-State: AOAM530VmDyT3XaqUGApSBEtmlctdX2miFwVZlOaxnQ8DRgd4y5SJ7BI
 CdshBu0YVs/Ez1xsoY3QwCnz6/AbMr8=
X-Google-Smtp-Source: ABdhPJzvOO31A4CMtj7pHTlY8a7A9qIM5Az6vIBQQkT/tX8K2DDwnBgWkd6pgWHlZyTpBVj1JDdZFA==
X-Received: by 2002:a7b:c3d3:: with SMTP id t19mr10269663wmj.156.1625753515816; 
 Thu, 08 Jul 2021 07:11:55 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l9sm2358792wrp.14.2021.07.08.07.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 07:11:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] linux-user/syscall: Introduce errno_exists()
Date: Thu,  8 Jul 2021 16:11:20 +0200
Message-Id: <20210708141121.1731691-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708141121.1731691-1-f4bug@amsat.org>
References: <20210708141121.1731691-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4842a1987b7..56682b06cbd 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -509,6 +509,11 @@ static inline int next_free_host_timer(void)
 
 #define ERRNO_TABLE_SIZE 1200
 
+static inline bool errno_exists(int err)
+{
+    return err >= 0 && err < ERRNO_TABLE_SIZE;
+}
+
 /* target_to_host_errno_table[] is initialized from
  * host_to_target_errno_table[] in syscall_init(). */
 static uint16_t target_to_host_errno_table[ERRNO_TABLE_SIZE] = {
@@ -672,7 +677,7 @@ const char *target_strerror(int err)
         return "Successful exit from sigreturn";
     }
 
-    if ((err >= ERRNO_TABLE_SIZE) || (err < 0)) {
+    if (!errno_exists(err)) {
         return NULL;
     }
     return strerror(target_to_host_errno(err));
-- 
2.31.1


