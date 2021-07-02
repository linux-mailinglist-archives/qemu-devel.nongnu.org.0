Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3BF3B9F43
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:48:23 +0200 (CEST)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGic-0000td-9n
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGb1-0004h9-0m
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:31 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:45799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGaw-0006ck-8C
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:30 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso6045621wmj.4
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 03:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b4cQvDxv3U0hq7oSF/cGe7YwUjG/pIr/hMSWdlGoaBw=;
 b=PEVszNmTs/x19yK9bZJV98DZatrUysk+75eEB8JwhZvZSkjxT0VxfFwjdW2pZv2h8Y
 5XVZBuqmBXMtW5bWHmHBEuSw6XiZ9uQtDF2TQeLnW336RgyXImdzoJEVU99rhiX0O4da
 GK5bEC+Lin/VqFdiKOJFSDS0wJ3FrXTnvWwSjE9p2a6S2+kUmdBegUA1mTRuxsS7XAJB
 CWhcxRvXFKVC1mRldZ4HJ0/MGjehiK10LuUSZjht71W0x53GB8yKhyXoqO0u64kxuIcw
 qhVTq96fn35DUGHtTrEIPKLSCwY2WiszXGzomqBEBnhx/TINgHMFLLXwJTMsjfATWwdk
 OiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b4cQvDxv3U0hq7oSF/cGe7YwUjG/pIr/hMSWdlGoaBw=;
 b=ZlBjlCGBCjoX+N7s3e2AyLGg87ko7Z5Ih5TmvllwyudyphIW8uHcuyRgUEM9JHVg9w
 g1KSw2YQM4aU+eJtGo2NdSOBh08/kFObqLiE2+pjFNoC8ho/L+Awq1JD4ecAr3/r8u/0
 ZR8xEyNlmVwN3fAHDQ0IXF3nIwGJl0Bd1LWefbKD7Z/rz6ytsZHiizHMJrchhfJ+NJ4g
 R4VBwIEh2by1ieSmkHYrmgfRrdj/EJVMsMbqF8DZRFjbaFp5KYiaWv3Ao3a22WRUZUjn
 40qVdwNod1tQ7MD/fstBx2xywn2GHJIVB2Q6JoI+O7rqvuHZkcLSchyxhQbfxa1cxB5h
 QKDA==
X-Gm-Message-State: AOAM530uZwn3WzbaOE5D09odaA9uKHQkodgnPD3uEMYsw8BCzI1CnRRg
 7V+PoCuvqPLknggqH6n41E6KXQ==
X-Google-Smtp-Source: ABdhPJwHAw5EkYyJx+n/VtwsOCf6+Wd0X7aPRv3rpBuAMJ0DgSg4QpVBssW9JvOb0GsJPTblCjmNkw==
X-Received: by 2002:a7b:ce82:: with SMTP id q2mr15536075wmj.60.1625222424453; 
 Fri, 02 Jul 2021 03:40:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/11] hw/gpio/pl061: Document the interface of this device
Date: Fri,  2 Jul 2021 11:40:12 +0100
Message-Id: <20210702104018.19881-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a comment documenting the "QEMU interface" of this device:
which MMIO regions, IRQ lines, GPIO lines, etc it exposes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/pl061.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index f3b80c7776f..06a1b82a503 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -6,6 +6,13 @@
  * Written by Paul Brook
  *
  * This code is licensed under the GPL.
+ *
+ * QEMU interface:
+ *  + sysbus MMIO region 0: the device registers
+ *  + sysbus IRQ: the GPIOINTR interrupt line
+ *  + unnamed GPIO inputs 0..7: inputs to connect to the emulated GPIO lines
+ *  + unnamed GPIO outputs 0..7: the emulated GPIO lines, considered as
+ *    outputs
  */
 
 #include "qemu/osdep.h"
-- 
2.20.1


