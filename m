Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D172ADFDE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 20:36:54 +0100 (CET)
Received: from localhost ([::1]:34106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcZRl-00021t-8n
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 14:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEz-0002WO-4O
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:41 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEt-0007bL-2Y
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:40 -0500
Received: by mail-wm1-x343.google.com with SMTP id c16so4288093wmd.2
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 11:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gyLb9ojs6jXl39zOSmf/3xCnTbh+0xT1wLgMD2FgmNg=;
 b=TgCeMwZgYthPT2CYIyIsHA/8KWF6hUEhh46qNeYsNMvJEFeQfH5OkgU2chXSkBP65Y
 mIkQNVrSwdm4W1EV36HC43kj47jWRS+wvxMpWUKr29k+MsLmVuiKINgg1ogUSVqej5Ia
 TXPJthw+RjNe9386aGa4d5RHk/JBErTxtkICwKTAwClRxr+j9bqrvTbGZMFv9k+2X/oz
 ewjSaZhtIkk9zPUYYqr72o0U9BC8GuJBU0NMoiNxSzLAM75EYCLzARhuqkmxoJAfLmsK
 DcpRWCGgdYALf5kTYTH+yfEdAjUR+gpqAYokXMmz2XRIyMsOyNw0G5anXkk/qTRtyTyV
 CVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gyLb9ojs6jXl39zOSmf/3xCnTbh+0xT1wLgMD2FgmNg=;
 b=g78Imd1AFYmNhfhhz/SSKAFrPU81TVn8JVbrJeeR+Sj73fHFYqSMpNtU+8wxp0BQFC
 NSbJPNCzuvnyd8h+7f8WL1/Zq65PojQQCjH16Gve0gp47xQPhOGxme2qf7cRU19c9X9z
 SCxarFgNLlrRrTBnNVUmaE8XeteMkuVy8JAGkoulGQsWTF2F7nD9WO5Ju/61RB+N1Wnd
 bBD8wgvGt9waSIzsJeUv+HzuBurDwz2PTwvm+C4xeVe0T7UCfc09/wej7NcBxFN4EPq+
 z4l0cFZoce8vl4PM9FQf0TpJdOBec5AGenBeMO+Sj7Hr1VLyJBVyuhA7Ut5T1KxrALOa
 Q9Gg==
X-Gm-Message-State: AOAM531qLY/H7urfWkEdCK/rjMQE1Ff5K0c6sEGrw6vO2jjlF9skDIli
 MkMRSD47hdQTjuFjCZ45anKPMC4uegdd3g==
X-Google-Smtp-Source: ABdhPJyh4gjGskuU7uCLQdkr41ec4qyF/dL30LaToayS9VsvE3BzDFahttSiMOglF0fpj83LZycd/w==
X-Received: by 2002:a7b:ce0e:: with SMTP id m14mr660911wmc.111.1605036213760; 
 Tue, 10 Nov 2020 11:23:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g131sm4002025wma.35.2020.11.10.11.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:23:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CE59B1FF92;
 Tue, 10 Nov 2020 19:23:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 06/10] accel/stubs: drop unused cpu.h include
Date: Tue, 10 Nov 2020 19:23:12 +0000
Message-Id: <20201110192316.26397-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110192316.26397-1-alex.bennee@linaro.org>
References: <20201110192316.26397-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "open list:X86 HAXM CPUs" <haxm-team@intel.com>,
 Wenchao Wang <wenchao.wang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201105175153.30489-14-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/stubs/hax-stub.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/accel/stubs/hax-stub.c b/accel/stubs/hax-stub.c
index 1a9da83185..49077f88e3 100644
--- a/accel/stubs/hax-stub.c
+++ b/accel/stubs/hax-stub.c
@@ -14,7 +14,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
 #include "sysemu/hax.h"
 
 int hax_sync_vcpus(void)
-- 
2.20.1


