Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D672FB463
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:43:23 +0100 (CET)
Received: from localhost ([::1]:46124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1mbi-0008Dr-PM
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVb-0008Lb-DF
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:37:03 -0500
Received: from mail-wm1-f42.google.com ([209.85.128.42]:34051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVZ-0003X1-AG
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:37:02 -0500
Received: by mail-wm1-f42.google.com with SMTP id o10so1146057wmc.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 00:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9vd6hpkLzyfwiYIVLQKmNQ3i0ap+mf7O3NsDnvrqQJc=;
 b=hmGbYELQ68oSibwpONMtKQCQlU9kl2fFkcA8X/qX+8CZ8VmKCKEgYPohqlIEK9oKT/
 CeDm3BjTvuUUe/3sg+Izmw2PH3b+Bt+kcixbAZ5+j+cE5SUOvBSxIEXgFCYeQEuGce8p
 wtsbFRERuJJQLHLYLVIrFw8nEgd7BMAl4BvdcNRPgd0h13r9uIXPQT0LmC1S3XklM3mf
 /C8Z/+qLogLKKc2hZzvgmLsJtrSA4ZOvC+suMqIlB4Sdy2/uoXonfU07oezLAUIfLZro
 rNn42cKJBjNyq60goAQvhRhaYbvuOfzkM8nS9nvc4v5OkYROUJLY9pjlbwaIOBwifUjh
 qVJA==
X-Gm-Message-State: AOAM533Mdu5mb10kBtjCuy7pKz2QZ+QcPbtMj2wAmrJfpO01M5pffagp
 eXxOJu+Ohj2ndqQ4Rj/6H50CJKk7PUE=
X-Google-Smtp-Source: ABdhPJxBP2jMnvQs9er9yG8+heNItgVQ1T5RZJDJXJoOUTxO0dWrxTFnNirx+N/daUrs+/Rc57019g==
X-Received: by 2002:a1c:e0d4:: with SMTP id x203mr2915627wmg.160.1611045419932; 
 Tue, 19 Jan 2021 00:36:59 -0800 (PST)
Received: from localhost.localdomain (pd9e83aed.dip0.t-ipconnect.de.
 [217.232.58.237])
 by smtp.gmail.com with ESMTPSA id z14sm540833wrm.5.2021.01.19.00.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 00:36:59 -0800 (PST)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/11] hw/m68k/next-cube: Add missing header comment to
 next-cube.h
Date: Tue, 19 Jan 2021 09:36:17 +0100
Message-Id: <20210119083617.6337-12-huth@tuxfamily.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119083617.6337-1-huth@tuxfamily.org>
References: <20210119083617.6337-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.42; envelope-from=th.huth@gmail.com;
 helo=mail-wm1-f42.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The next-cube.h file is missing the usual copyright-and-license
header; add it (same as the next-cube.c one).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210115201206.17347-12-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 include/hw/m68k/next-cube.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/hw/m68k/next-cube.h b/include/hw/m68k/next-cube.h
index d38c52d540..43577282d1 100644
--- a/include/hw/m68k/next-cube.h
+++ b/include/hw/m68k/next-cube.h
@@ -1,3 +1,13 @@
+/*
+ * NeXT Cube
+ *
+ * Copyright (c) 2011 Bryce Lanham
+ *
+ * This code is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published
+ * by the Free Software Foundation; either version 2 of the License,
+ * or (at your option) any later version.
+ */
 
 #ifndef NEXT_CUBE_H
 #define NEXT_CUBE_H
-- 
2.29.2


