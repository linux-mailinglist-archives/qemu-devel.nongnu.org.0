Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFF3121CB1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 23:25:21 +0100 (CET)
Received: from localhost ([::1]:60870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igyno-0004L5-Jy
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 17:25:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1igybG-00056T-Bq
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 17:12:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1igybF-0007BM-BW
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 17:12:22 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:45932)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1igybF-0007A9-62
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 17:12:21 -0500
Received: by mail-pl1-x641.google.com with SMTP id b22so2172704pls.12
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 14:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eyI58KOw8f6KjHd513cv2CHH4iBrq42PUmdQAMssFYg=;
 b=y0zu4hd2MvQjbCLfdNsD+C6dYMaWZP37eth0V4UPELQzZbDPlQu96pEDFRSUZaV2aW
 s3g19xjW0pE4Q6JNNcYXCFEiCTIJFSn7/Lp6GJFarT5bfu5PwKL7iE/svpZCHmL0A6NY
 IZjhFZDNSmmJiNRNfZDRh4OLf/MjkNRWKfQ/+EG7fFlwT479K8cY8i+stvR2DSIX2iDs
 5r0Im6ZFVZqpZUSCb28Mf0ruNqQ+plB7dcLaEuCuxoz9GR47GklxFahABRH9ZQWMLGzb
 uESNbM7sFkVwfmIeU/SDhc0PBhlC9tzukRZQELHMtARYK3esEQj/1ZPO4EpTIieYwPES
 yIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eyI58KOw8f6KjHd513cv2CHH4iBrq42PUmdQAMssFYg=;
 b=V/4FfQOgfWoMZPQ8pVf5HX+uz7sP/1p+4OogJDOsB9zzDw6oime6Ki1qG0MJfteANG
 gpTWsU9tkNJ5imelTFIoI2Thk/InXT4fZiIQlN28NmevXDuMoQdY6vAOU2cRD1beIeUx
 srkKvNO9smyE0C89im8CyMz9AXbkTu7TSJ+V1gS9smZxQX0yqHT+iXKeMCjfVmS4+2Vy
 LAy2y/XCyLEEqMoUIgbHASKu3OzLkcSE1ehz/ABqcgGpfpwBT2vmMMA1i2u5GEGx4NVn
 0Zaz4b+yiUzlQ8UAmB2NEdUi8TCofRucAcytCzccy2xI5tPbpzEs2v0aSCiEEDhEzOVi
 U1wg==
X-Gm-Message-State: APjAAAUuPhlvXgWZV2BxEAI/Kuu9XFzzLOPltRnlLk9yMqW/D2zuMQtv
 paHX7glGqUYLCqjkBXP+wQ9zFrBHwWQ=
X-Google-Smtp-Source: APXvYqzt8MCVridvyUR2r/VlbVM2yhk7QGym0ND8QLbjSXBVZLeYasemmH9KLxrTEImOtye89YdTqg==
X-Received: by 2002:a17:90b:3011:: with SMTP id
 hg17mr1950393pjb.90.1576534340021; 
 Mon, 16 Dec 2019 14:12:20 -0800 (PST)
Received: from localhost.localdomain
 ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
 by smtp.gmail.com with ESMTPSA id d6sm529767pjl.8.2019.12.16.14.12.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 14:12:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/28] linux-user: Include tcg.h in syscall.c
Date: Mon, 16 Dec 2019 12:11:42 -1000
Message-Id: <20191216221158.29572-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216221158.29572-1-richard.henderson@linaro.org>
References: <20191216221158.29572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Code movement in an upcoming patch will show that this file
was implicitly depending on tcg.h being included indirectly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 171c0caef3..34825f15bf 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -115,6 +115,7 @@
 #include "user/syscall-trace.h"
 #include "qapi/error.h"
 #include "fd-trans.h"
+#include "tcg.h"
 
 #ifndef CLONE_IO
 #define CLONE_IO                0x80000000      /* Clone io context */
-- 
2.20.1


