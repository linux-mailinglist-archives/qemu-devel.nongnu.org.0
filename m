Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270B531299F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 05:06:24 +0100 (CET)
Received: from localhost ([::1]:41460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xoY-00030l-Vd
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 23:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdp-00080F-Mh
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:11 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdl-0001JJ-UL
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:09 -0500
Received: by mail-pf1-x436.google.com with SMTP id k13so2308857pfh.13
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nvbfT9FlFh307EBqHKObJFDpc/YAbcER3B44sbw1RyQ=;
 b=x8cI8JrTyYoCjpTke8J9pCpzHXomZgZegkQ0xyWrd/7hCw9WQvbHz2whJp5lognnGy
 eFZGiNETW5L3QlBnHPE3/5Jst1OTPhaGWR+np5lgC9/62Srs92FFPwfVUJKzXesU0OWo
 SXsPGrUc1NBXYToR6lFyG1nRtpwUa4GUZaHHeEcj6gw/XRsLbDB+Wjm32JVLlY6A7B/s
 0BZAEp606ZgY6q52G60/QtILAhTrWnZma3SK3QzLO5pS61oUq8P1D/DkmBHmR9QCrcuP
 SxzvIOpg8wKbHpd5VljGI+AeXeeagTrsfmFXlSeZ0B4MZrfbpny6stIePymyzfjM8pos
 XadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nvbfT9FlFh307EBqHKObJFDpc/YAbcER3B44sbw1RyQ=;
 b=k4xDP9FmKFLlL0WhWdeMuADQoGDMfxJx6PyccmRdNMlnHKcSihDCv8DJqQ8Dg3dnCQ
 +fKk5svAMOT3rWudT0IuBj39jTZVLUd0r/iQODMr2tcBApRnfXhCsHS3+ojKHkErpZJq
 +ATAZy3q2Fy2pl+22BHMgu8O6o/zi7pafdSs9fNr+R5eIFMxjz0wDKqWTRvfOTaqzMwg
 nEgc2oFdYzyf2qFaQ9xMQqi5SAJYVOQsrIKBO8OVjxiJT0/ApXrZh1Td/Xe4xn+LguDq
 FOEO3leOx8fYSy6JCvLRBGZ2zgNLfsffJ+NGUrNsyPJ08sTICmW/rJNTLt+uwaGdIryI
 SfTw==
X-Gm-Message-State: AOAM532LP876NK+AelChi/ZXzOW0uaJ62I2D1tLuX2R03KzYiAhQIWPc
 KWzhkJPxjY0+bvFRMnNvru+2eegNShrd/w==
X-Google-Smtp-Source: ABdhPJztAR8oW7jqz5yQZuWUHI58CTQua/Cab0k7hiBoyw1Dd+1+zymRY+bUXc6ocV53uLu1b0UQkA==
X-Received: by 2002:a65:4906:: with SMTP id p6mr14896976pgs.419.1612752664611; 
 Sun, 07 Feb 2021 18:51:04 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id p12sm10308690pju.35.2021.02.07.18.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:51:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/16] tcg/s390x: Rename from tcg/s390
Date: Sun,  7 Feb 2021 18:50:46 -0800
Message-Id: <20210208025101.271726-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208025101.271726-1-richard.henderson@linaro.org>
References: <20210208025101.271726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This emphasizes that we don't support s390, only 64-bit s390x hosts.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                              | 2 --
 tcg/{s390 => s390x}/tcg-target-con-set.h | 0
 tcg/{s390 => s390x}/tcg-target-con-str.h | 0
 tcg/{s390 => s390x}/tcg-target.h         | 0
 tcg/{s390 => s390x}/tcg-target.c.inc     | 0
 5 files changed, 2 deletions(-)
 rename tcg/{s390 => s390x}/tcg-target-con-set.h (100%)
 rename tcg/{s390 => s390x}/tcg-target-con-str.h (100%)
 rename tcg/{s390 => s390x}/tcg-target.h (100%)
 rename tcg/{s390 => s390x}/tcg-target.c.inc (100%)

diff --git a/meson.build b/meson.build
index 2d8b433ff0..d6ddf88b00 100644
--- a/meson.build
+++ b/meson.build
@@ -233,8 +233,6 @@ if not get_option('tcg').disabled()
     tcg_arch = 'tci'
   elif config_host['ARCH'] == 'sparc64'
     tcg_arch = 'sparc'
-  elif config_host['ARCH'] == 's390x'
-    tcg_arch = 's390'
   elif config_host['ARCH'] in ['x86_64', 'x32']
     tcg_arch = 'i386'
   elif config_host['ARCH'] == 'ppc64'
diff --git a/tcg/s390/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
similarity index 100%
rename from tcg/s390/tcg-target-con-set.h
rename to tcg/s390x/tcg-target-con-set.h
diff --git a/tcg/s390/tcg-target-con-str.h b/tcg/s390x/tcg-target-con-str.h
similarity index 100%
rename from tcg/s390/tcg-target-con-str.h
rename to tcg/s390x/tcg-target-con-str.h
diff --git a/tcg/s390/tcg-target.h b/tcg/s390x/tcg-target.h
similarity index 100%
rename from tcg/s390/tcg-target.h
rename to tcg/s390x/tcg-target.h
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
similarity index 100%
rename from tcg/s390/tcg-target.c.inc
rename to tcg/s390x/tcg-target.c.inc
-- 
2.25.1


