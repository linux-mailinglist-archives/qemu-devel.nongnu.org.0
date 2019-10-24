Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5371E399C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 19:15:24 +0200 (CEST)
Received: from localhost ([::1]:48424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNghn-0000AU-QQ
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 13:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58006)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNfxw-0007eK-Oi
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 12:28:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNfxv-0000s3-KV
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 12:28:00 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40424)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNfxv-0000rs-EE
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 12:27:59 -0400
Received: by mail-wr1-x436.google.com with SMTP id o28so26784351wro.7
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 09:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=acyYv45nXPHhkUzRU5weWk65uHswNK+60vD7SN3aiY4=;
 b=TmwUmveauFgZfmst5Mk7pRIQjwpBmB8XuGz/9gH8s3AFoYOIxPRAfitCL0jFnkLDv3
 7RKgH6Nb4cCmD3O+bksDuGNoqMIg7Qmo1734Edsi1cKBvW+xavEib34hfIKRgtnxgOKw
 hGKPsv1zHl4JgXY422T/iEvCTLYGxq8QozTB9Cv+vhwBn4qMq0CRnFLlQDGaH7Yth7nH
 Ij1TMwhhtlDhdwC40PBOYktg7eIJXnN7nWjzp2Lx+PKK3vzxpDgOPPhxeMSATWvqcydu
 kHydFuhq4FyHm1xYTG5o0+RyNEfzJsNLDI5wyLfNHHN+p8GAxvTXyp0x5Kb4KBygcJXW
 BlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=acyYv45nXPHhkUzRU5weWk65uHswNK+60vD7SN3aiY4=;
 b=rWH/ZOVWqbeImDs1QuwFemCai08GJNhlxn7BzgEJGwDPXbqdo2pyMFIousy8oUV+qk
 6d996zxgBC9Pm8E+ZHrk/vI2FzZBUiXeXgKmzcCM/R/83jOk76rK4EwRrf21IBcNXlDg
 yHH7G2ghnzBgK/fHSxjFMQ+On0tRWteiya/TWECNY9wIk4OTZaRugxxisEq6MTDcV63o
 7GaFbx0bVjeSYsLGiQD2iiHf8R3EAbtGJBayKls7TdPDlQq5ZxEyMv/JgbRnEOH5bKqV
 er8igsjZAx7suXtktfsS5PHPNy1pBEogApRP/XnKe6tEMEY5T3l0fHEYHjMBkdGL2nH2
 zHiw==
X-Gm-Message-State: APjAAAVs9L+crEzxVR+TY7plOI6vMtontYmGoLeGlBtHeZqmDsCkBZTM
 syp5Rwh/jIxx5m1mF3B67RVunKSSlp8=
X-Google-Smtp-Source: APXvYqzBVXnOw+A56LybEnsvJ/nv23IpfI9C5QNjufGeYrsuqOVFfy/KHLlg/Md6TY/BJM+Q85c7Wg==
X-Received: by 2002:adf:8289:: with SMTP id 9mr4946098wrc.0.1571934478172;
 Thu, 24 Oct 2019 09:27:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r27sm42606124wrc.55.2019.10.24.09.27.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:27:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/51] linux-user/arm: Rebuild hflags for TARGET_WORDS_BIGENDIAN
Date: Thu, 24 Oct 2019 17:26:58 +0100
Message-Id: <20191024162724.31675-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191024162724.31675-1-peter.maydell@linaro.org>
References: <20191024162724.31675-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::436
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

From: Richard Henderson <richard.henderson@linaro.org>

Continue setting, but not relying upon, env->hflags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20191023150057.25731-24-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/arm/cpu_loop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index e28c45cd4ab..7be40717518 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -440,6 +440,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     } else {
         env->cp15.sctlr_el[1] |= SCTLR_B;
     }
+    arm_rebuild_hflags(env);
 #endif
 
     ts->stack_base = info->start_stack;
-- 
2.20.1


