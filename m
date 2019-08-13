Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5B68B930
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 14:52:46 +0200 (CEST)
Received: from localhost ([::1]:52016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxWI9-0007FN-Vb
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 08:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53641)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hxWFR-0002Ts-1C
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 08:49:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hxWFQ-0000l1-1m
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 08:49:56 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34626)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hxWFP-0000k9-S8
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 08:49:56 -0400
Received: by mail-wm1-x341.google.com with SMTP id e8so1009716wme.1
 for <qemu-devel@nongnu.org>; Tue, 13 Aug 2019 05:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7gMIeXb33bJiJJ2wC99NJRgf91T+h2agcGiVoSf4NFI=;
 b=AtkGgsui1bxAw0W/eI+q06kI2PErsc2z8s4oTsD9Kl5APeF2G1TOwavC/uSEoRy3rv
 ALXF2RG6BmCPJ4AGv2VbsluYkQ/SRzZpz/brustAm6AeabRHnJQIX7fJzzqiG6vZzKEo
 Zb/ZWfxYr28V483fDYpFUxj7u2qOBcmVBlcsc76YWMoAnDN9PtDa6TQA70cinwxwhBqT
 Bj7Yc2xuqBWrYX8VdVRI427qx8ulF3C29O/xak/SNwfai5Vb//eSdrEkFptOO3sbVIf5
 fhCTyWrnYZPjZhcT73dLmeM6+UuCAQgukWwGESKVUBZRVbpzMf4AtVNHjRGDN+F1D1Ph
 RCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7gMIeXb33bJiJJ2wC99NJRgf91T+h2agcGiVoSf4NFI=;
 b=o8HnHA/TAxRhOHXw1bAOwFuu9HaOzjiREFayOQFD+XtvV4CK5A51OxgnGOtpvQZ/am
 1IAgjnnjc0dek9o9BMl4hhMpO9XHV8tKjRLhslLF+SIvgqCsUQ7xtFT17H5yag4Pwrk8
 ra6eWCdXOy8HH4kbtyzT6hzgvGrfnq8oUJOVxAtFWJ5Nu1/b2VVWBkSjk1V7O4iCQSL2
 IAP9mok67/zIVpdW4k8ocmz1jTOfrgt7u+0HWtrWgPPg04GhmHyryf6XQV4PvftuX8Na
 HFLt0RiQIIaP0dJRRTzL9If5zmf6YmjQifkxgXvVK7rucqXvFvcCsuHAykA/2sqRpQta
 xXoQ==
X-Gm-Message-State: APjAAAVlICwpXx4+R9Xu23ASL+bB2kXrnBezWtq5UB0qGEyD0N809ZDA
 f4shUfCSAxPvjL8s11xpUgynEQ==
X-Google-Smtp-Source: APXvYqxauFES2XK//lwC+e4NWh67klPh/C9QLwOhfixvolGWspvpspHuVPBcAmatwpC6t8iT+SmMAQ==
X-Received: by 2002:a05:600c:23cd:: with SMTP id
 p13mr2791724wmb.86.1565700594824; 
 Tue, 13 Aug 2019 05:49:54 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id x20sm236796612wrg.10.2019.08.13.05.49.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 05:49:51 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C6A4A1FF9A;
 Tue, 13 Aug 2019 13:49:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 13 Aug 2019 13:49:43 +0100
Message-Id: <20190813124946.25322-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190813124946.25322-1-alex.bennee@linaro.org>
References: <20190813124946.25322-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH v3 10/13] fpu: rename softfloat-specialize.h ->
 .inc.c
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, armbru@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is not a normal header and should only be included in the main
softfloat.c file to bring in the various target specific
specialisations. Indeed as it contains non-inlined C functions it is
not even a legal header. Rename it to match our included C convention.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 fpu/{softfloat-specialize.h => softfloat-specialize.inc.c} | 0
 fpu/softfloat.c                                            | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename fpu/{softfloat-specialize.h => softfloat-specialize.inc.c} (100%)

diff --git a/fpu/softfloat-specialize.h b/fpu/softfloat-specialize.inc.c
similarity index 100%
rename from fpu/softfloat-specialize.h
rename to fpu/softfloat-specialize.inc.c
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 6bf6241710f..6e98fee48a3 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -634,7 +634,7 @@ static inline float64 float64_pack_raw(FloatParts p)
 | are propagated from function inputs to output.  These details are target-
 | specific.
 *----------------------------------------------------------------------------*/
-#include "softfloat-specialize.h"
+#include "softfloat-specialize.inc.c"
 
 /* Canonicalize EXP and FRAC, setting CLS.  */
 static FloatParts sf_canonicalize(FloatParts part, const FloatFmt *parm,
-- 
2.20.1


