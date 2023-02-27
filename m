Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA036A43A4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:03:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe6J-0007mN-1u; Mon, 27 Feb 2023 09:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6A-0007UF-PS
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:26 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe68-0007pv-T1
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:26 -0500
Received: by mail-wr1-x436.google.com with SMTP id l1so3292542wry.12
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mvnDqPFrZmQX328ErtChnfMcQ4qhPU9eJ1iYjOq8AGU=;
 b=ImBTBUUV2ccDVsIEdJJ9VvJpN7pxQFVtimnEBsAwcMbpx7nXDDtlQLb5oCgKhIudSu
 BCeu9krAH8ZyK7HlprGuJgBo6Y0OEmP766RnXxkZK0y7zKB1YYyDNcayZfcTlDcVVFa4
 eAHJrvUHEsfD8qNK8jcgH9ydltP/7eOoaz6vWleBLCInzyfNAu/t/WzMGXNqNr6Y2zxm
 BqCApTxiYViAhogFkcACu+FmU1vgwu3Cs+pzTETzxoK2m/ivwqVs51a/GOSx/m/wpCF6
 IPaxvEAIkY5QyLsmdIOxUrq/aYBCWpkoi32jKbJwStvgdQKXD1RTmg06P6HXZA5+//jQ
 Le+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvnDqPFrZmQX328ErtChnfMcQ4qhPU9eJ1iYjOq8AGU=;
 b=H5EyzqBKieC8+SgFwZMtDH1wo/TGmiZt2M4TUNUjXi9Ock1RD+cK9tgGKCGcaNNmMm
 S5ypJ2lTdsKNTVNkejJ2REBd1D+zTvJxjrR8SOSIgb0Gkc+ltOysw2w6ahKSbklmb4AA
 /+pzYHVuOibGCZw7lKRbaO6CG569ifMUh4Dax5TQX+qjFYW5dPtOWlsuoWIby6PKw7t9
 8O5FRc6PO0P5/S0eiyaw6i2xJmPZRRBSQ6L97ofgQLiEmnh86VXbmm7SvIw13C8sOvEF
 QXDMI1A63MC43Ndet+YW68jfb5xnYtywmlE2nzh14Gsu5gAEBJg5p5iF7Gjp1mkaAnNI
 3PsA==
X-Gm-Message-State: AO0yUKWzQ1a6Y6FdsmoNPaouD1ortcS/uloOtDjNgbT0Xawy4F57Ozl6
 17oHCX9antfQ+az4dYVhRmxqpk7t9jGfWV0K
X-Google-Smtp-Source: AK7set8G0LSleH4yQVq+rjRiELLeASUB0IpKahRHLMmLbmHXs0vP53OIdMFU5K5XdadHcCXWWL4cXQ==
X-Received: by 2002:adf:cd87:0:b0:2c7:1e3b:2d46 with SMTP id
 q7-20020adfcd87000000b002c71e3b2d46mr8029714wrj.17.1677506603086; 
 Mon, 27 Feb 2023 06:03:23 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5704000000b002c559843748sm7232417wrv.10.2023.02.27.06.03.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:03:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 022/126] qom/object_interfaces: Fix QAPI headers included
Date: Mon, 27 Feb 2023 15:00:29 +0100
Message-Id: <20230227140213.35084-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
user-mode builds") we don't generate the "qapi-commands-qom.h"
header in a user-emulation-only build.

Commit f375026606 ("qom: Factor out user_creatable_process_cmdline")
incorrectly added a dependency on this "qapi/qapi-commands-qom.h"
header (the QMP handlers are still defined in qom/qom-qmp-cmds.c).
Remove it, and add "qapi/qmp/qobject.h" which declares qobject_unref.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221220115709.18508-1-philmd@linaro.org>
---
 qom/object_interfaces.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index f94b6c3193..7d31589b04 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -2,8 +2,8 @@
 
 #include "qemu/cutils.h"
 #include "qapi/error.h"
-#include "qapi/qapi-commands-qom.h"
 #include "qapi/qapi-visit-qom.h"
+#include "qapi/qmp/qobject.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qjson.h"
-- 
2.38.1


