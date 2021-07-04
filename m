Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AF33BAE58
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:39:38 +0200 (CEST)
Received: from localhost ([::1]:59530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m071l-0004tc-OJ
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070V-00026i-Hn
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:19 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070U-0006Tk-10
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:19 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso12506644wmh.4
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l83MMXMFR2vl9ctHFO603Ad6lSWk25Ov1gyYgtgA0Ts=;
 b=vR0W9RvAYBZAV3iEKsgpj1VV66b/JdEJ3mHgR0KjmcKVxAQ1Vsb41cB92g6tdA9mBl
 IWeJ5Dc73q5EJS+c/GMSIGP0rpmXqbx8FBWp5F8YM9s3/5Y+421TRw/OWH4JTNlM44Ux
 OYzR1ldjTaWjJ6CTTxM/3hooIYCupiLP7xGiISLc2Zeq11m2IF2l8pzhR2YxYn7B36st
 O0I4XunF4puSdk5K8BVK4Efx018Q8S5P6L2x5UrP9hD2j/F1YCBHkicA364cTK8UEolD
 /u6YOg9tu/pF2FgsNz9uxkEKsBW6h+k90oiQH/SZv0X9NJWXjx3y3xw443v8dFWHM9oE
 LrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l83MMXMFR2vl9ctHFO603Ad6lSWk25Ov1gyYgtgA0Ts=;
 b=czibqQaz7PCSGY0DY7bpcsnjjRV85DEbvgFlwThM13h3AgyMxNJ3BHcP/QjVjQqdMS
 90Z19HEwXdfd8Yf876ad4KSWWXPq7E5j/gnjSwABRNU+c50VOl7NKj/+5devW52R0sZL
 uZR/ukiGmjsR5mJN0q9lzOAwhJnEOTV9dRnlW6YzUCbkI2NM/HM1bE2V29UJgXuqyEXe
 FZZTd84C1/xCdx2oEs/l7XdWzAWwNuYQySI6WknQ8SB6nY81iV6OTgG/WL/Pd0NmBihl
 MXPB0dnktdJnSYh6idaYYgGvWEbTc6xj0Yl1oj7Djy+PHF7KfViNTW66W4R0/B9Bvi/v
 cdzw==
X-Gm-Message-State: AOAM5302wqo9GihsVYTg3qXLVKaGOS2o2rYAFw5QAiR0sNg9J330NQKD
 b7TTK6rciQZg/hen3nsHWPZvr/EKdJU=
X-Google-Smtp-Source: ABdhPJwBWFkNpM96bk9uhn/Iwy1T1bs8cC2g0ACiIgts2cKck5sJV3Om4tkZm612DF3YyyC8zGQoLQ==
X-Received: by 2002:a05:600c:1c27:: with SMTP id
 j39mr8698742wms.130.1625423896595; 
 Sun, 04 Jul 2021 11:38:16 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q19sm19209992wmc.44.2021.07.04.11.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 11:38:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/12] linux-user/sparc: Rename target_errno.h ->
 target_errno_defs.h
Date: Sun,  4 Jul 2021 20:37:47 +0200
Message-Id: <20210704183755.655002-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210704183755.655002-1-f4bug@amsat.org>
References: <20210704183755.655002-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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

We want to have one generic target_errno.h (API to access target
errno), and will add target errno definitions in target_errno_defs.h.
The sparc target already have its errnos in an header, simply rename
it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/sparc/{target_errno.h => target_errno_defs.h} | 0
 linux-user/sparc/target_syscall.h                        | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename linux-user/sparc/{target_errno.h => target_errno_defs.h} (100%)

diff --git a/linux-user/sparc/target_errno.h b/linux-user/sparc/target_errno_defs.h
similarity index 100%
rename from linux-user/sparc/target_errno.h
rename to linux-user/sparc/target_errno_defs.h
diff --git a/linux-user/sparc/target_syscall.h b/linux-user/sparc/target_syscall.h
index 15d531f3897..dad501d008c 100644
--- a/linux-user/sparc/target_syscall.h
+++ b/linux-user/sparc/target_syscall.h
@@ -1,7 +1,7 @@
 #ifndef SPARC_TARGET_SYSCALL_H
 #define SPARC_TARGET_SYSCALL_H
 
-#include "target_errno.h"
+#include "target_errno_defs.h"
 
 #if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
 struct target_pt_regs {
-- 
2.31.1


