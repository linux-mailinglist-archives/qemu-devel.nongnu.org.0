Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF961639B3B
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 15:05:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozIGc-00029q-J8; Sun, 27 Nov 2022 09:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hoanguyen@ucdavis.edu>)
 id 1oz8FR-0004Mz-EB
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 22:22:29 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hoanguyen@ucdavis.edu>)
 id 1oz8FP-0004ji-2k
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 22:22:28 -0500
Received: by mail-pg1-x52e.google.com with SMTP id w37so1902776pga.5
 for <qemu-devel@nongnu.org>; Sat, 26 Nov 2022 19:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucdavis.edu; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mod3Ock7PvHPA+PuypUzbvv9VmCPX7bzLwcapdra0I4=;
 b=pmaK4pYIZNlbkmq+UQxTPDis8DHOPVqlZLsK75lEbAWnFiJHMaKDZYFh6s7JFj/1CB
 +/T7xtpWz9EY7eYvTJr6lsAPoGW6A6atdNqhfNwmRHGGrwiGoWCctsXqVloCamHP526O
 fLT9JlkQia/1r1OxEMo5VepcVlM5pFMtJtRlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mod3Ock7PvHPA+PuypUzbvv9VmCPX7bzLwcapdra0I4=;
 b=LULDJVYGO2WDxlvsg73xpq0xIvvMGDYRqGtz0fwpACK6ws0cA7tMIw0aaZTRIJhm68
 5YGoH92aCeP5fa1/SPBwkQ0Bb3ekarwrSz4G0bj5w6O+vX37i7in6jSErIICtRQ51lse
 MTOvISBfZrCMsvp6zlc1iAEGHe2FAT07zoGDFhFCcxPAjezSMrQMx1JIsabbtO5cxR35
 H9qVwS/GRjs+Oz0PffPUJFjmH9at77kUTgPgZjsxHH+ft5Nye716pAQyGHtQEUPwADiF
 BFNMU8jGZ3j4k74pWUK7ZakWiWeqpedu4dbRdF+oF5+Bg6Y2W6Z2rRgBUeUFwQmdhHEW
 24bA==
X-Gm-Message-State: ANoB5pkLzyZ6R3rV/f9BR9KRgQMnX9O0r4mDE2CYw0NDLPKC14ubMbwS
 CiiZ9VwBDfbjZDgSQVeuCrqRJOloOxClZQ==
X-Google-Smtp-Source: AA0mqf7cNsA8EIDlAAsb1NPOVXzs01jgSbX7Bv0yQSF3BwLwQA7NMZm3abhvG0Y147kAF+5xxRrCGg==
X-Received: by 2002:a63:d948:0:b0:46f:1081:f517 with SMTP id
 e8-20020a63d948000000b0046f1081f517mr41357590pgj.297.1669519344341; 
 Sat, 26 Nov 2022 19:22:24 -0800 (PST)
Received: from penguin.lxd (c-73-41-83-143.hsd1.ca.comcast.net. [73.41.83.143])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902e5ca00b00188f07c10c9sm6037121plf.192.2022.11.26.19.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Nov 2022 19:22:23 -0800 (PST)
From: Hoa Nguyen <hoanguyen@ucdavis.edu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Hoa Nguyen <hoanguyen@ucdavis.edu>
Subject: [PATCH] hw/cxl/cxl-host: Fix an error message typo
Date: Sat, 26 Nov 2022 19:22:20 -0800
Message-Id: <20221127032220.2649-1-hoanguyen@ucdavis.edu>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=hoanguyen@ucdavis.edu; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 27 Nov 2022 09:04:19 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Hoa Nguyen <hoanguyen@ucdavis.edu>
---
 hw/cxl/cxl-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index 1adf61231a..3c1ec8732a 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -47,7 +47,7 @@ static void cxl_fixed_memory_window_config(CXLState *cxl_state,
 
     if (object->size % (256 * MiB)) {
         error_setg(errp,
-                   "Size of a CXL fixed memory window must my a multiple of 256MiB");
+                   "Size of a CXL fixed memory window must be a multiple of 256MiB");
         return;
     }
     fw->size = object->size;
-- 
2.30.2


