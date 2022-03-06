Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269A24CEBB8
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:28:43 +0100 (CET)
Received: from localhost ([::1]:60136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqwE-0004oN-9B
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:28:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWP-00022P-G9
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:05 -0500
Received: from [2a00:1450:4864:20::32f] (port=55149
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWN-0004C6-M7
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:00 -0500
Received: by mail-wm1-x32f.google.com with SMTP id c192so7632668wma.4
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bjYnkWYvJGLe/RHpRbUjogpbIJK/iJBgaSrmGm2zNkg=;
 b=ngbTLNbOjASTQIC6uI/xthFocpknh4Y9H0z/JJbwZz/klkQECZasJSOtCb1Z1UFDEj
 B5QZCf74ynlJ4vIfNbsHZ3ePDZTSR3qXvzSvOsKr/LFE+1jTQ2dCXBpEnB6+szEsGJlb
 +kYBXBqwO/U0cinHsblnGdskrOgxV2uUQUdBNJ3RR4vGUu6VgoYfT84Y16RzauxlEmo+
 9HnTbu8nxrnJoFATlDSmblCjUg3axBf4Ivi+x7y/TanwaMnsFx64XtIRn02+WFyU2/k8
 M8Y0f6fpeXEBcfSgTEeiPx0tsSMnF1DvFP9GlRxN1M5fW756EV8QWi+0XyRO4X3dvKXI
 DYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bjYnkWYvJGLe/RHpRbUjogpbIJK/iJBgaSrmGm2zNkg=;
 b=SEa44FxMif7h+CDeSgaNfOYM70CgYlVBpANff7GqUWhhgG93/CmWoPjwJjn68Rw2XF
 sE44p9FwhSoBqcSqgPeoZ6v6RUyO5YV8watrmASDw+mvwIgnx2IvuRJuSbB3JgQqzSpO
 hic1bQbcIqRKugMqGwgMjWehqaarWzsF6avhqDo5MbHcfedYJekXZCZYfHSsbV+ZEjPK
 J+gDmmVpinDJyaM9Mb/jf4NgMlIdLetxcsscKGcJ1ku2VNvIkEIS4x06xM+fL5717PXn
 KywZtsKHNXeVa6BPu3g7L7T4YvO4pbG5gA6Z/8vRH3I70Gsxh1RCRGKmMGV9CdR6wYSI
 r1MA==
X-Gm-Message-State: AOAM532nfxh7AA5D/sPpAsjqrOndzFI8w6Zx0Ln2SpVPWYq+xaKeXVRo
 VgNtOvUv7bYbW4XK+Obr4tK2NyGRXl4=
X-Google-Smtp-Source: ABdhPJwb9IbKo9R7pdkYEjxWPJSQ0wwm0oAccp5/pZADJnQCj92MG4k/eftYW4hXK3nOVvbr0wJzsw==
X-Received: by 2002:a05:600c:384e:b0:389:7355:a821 with SMTP id
 s14-20020a05600c384e00b003897355a821mr11297882wmr.141.1646571718202; 
 Sun, 06 Mar 2022 05:01:58 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 p11-20020adf9d8b000000b001f063deef80sm7287401wre.86.2022.03.06.05.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:01:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/33] exec/cpu_ldst: Include 'cpu.h' to get target_ulong
 definition
Date: Sun,  6 Mar 2022 13:59:49 +0100
Message-Id: <20220306130000.8104-23-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220214183144.27402-5-f4bug@amsat.org>
---
 include/exec/cpu_ldst.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index da987fe8ad1..6adacf89280 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -64,6 +64,7 @@
 
 #include "exec/memopidx.h"
 #include "qemu/int128.h"
+#include "cpu.h"
 
 #if defined(CONFIG_USER_ONLY)
 /* sparc32plus has 64bit long but 32bit space address
-- 
2.35.1


