Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A4F4CD6ED
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:58:18 +0100 (CET)
Received: from localhost ([::1]:51790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9Np-0001iD-9J
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:58:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ8q7-0003WA-59
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:23:27 -0500
Received: from [2a00:1450:4864:20::332] (port=32956
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ8q5-0000R8-QM
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:23:26 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 n33-20020a05600c3ba100b003832caf7f3aso4071272wms.0
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 06:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dw4gFgBdkE4xjFXJHwwB31Bs9WiEtP58FXRpcS09YLM=;
 b=UQNlTp5nrAvEgnAmj/G0G/T6BXYWM5iouQMNY7CePQXoxMAIueg31/h98jksLiyUem
 wvi1CQyYLMTdWV5qmkOhIYpvgKgPhakDngDfX4XHyWg9gxvfY+6Om3nccg0LKOFRPCVD
 6OEzlAE3bAjd3R4jKzvkAK3q34FIcQ/A7nBEu9rolge5Lrt+7Rc4sZGVMj4uHJxo4HmD
 zGegVb8fcMvn/b04Vi2Gn7HE2NUw3CEmtAw+zFAXaZWqniEnOAV+XOl3ANOwkEqERqfO
 AziBImIK8d1MR4qFgMW1szJ3iO9jE6RXAGZzWpmqC6DVpk+JLJryzdcYMAopqm2etthN
 xsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dw4gFgBdkE4xjFXJHwwB31Bs9WiEtP58FXRpcS09YLM=;
 b=7azAwSF/XcHz6CNLUN20hCLhMpG0caJ3uuW8Lu3Lx3k7R+wWQCA+ckebQeV6HviV0p
 FtpxIUeVzMdg+TtbgBHksHtEQ9qBbxmRnUXhA8gjOeE9CYuT4Wmi5yKvDszI5mZmsjRw
 vRlDWcLcXQtI725WpViiD+v5vh6eHFVwebP+grif+vW0bT36G6X4VfCzl1+KAF72CU8n
 ESjIF7mWy43RP81cbru1fkCm2WXwsgmLwzQNGN1RIwgyf578ui9I1Bc4DjVL9x268npD
 Xtr55hNuKiKlMNgNshmInyUhCL1adoQQsqmQ9huLwctXMZObjqsifkojBrCRQMwFbefi
 UYnA==
X-Gm-Message-State: AOAM533ePdB3oFFafUzi6j+XO6fxufIvo/2JiIIMdLcOmpUCkI8b8ejm
 To8ss0in7V/F7zGu+bSoYMQ/Rk4bzcw=
X-Google-Smtp-Source: ABdhPJw0huxwnYe88p7DAO0YktKtVAQgL3f8LubgXwBbxjhR6Qg6CDsIc4JCcHMpzJPK3zm4fChW/A==
X-Received: by 2002:a7b:cc8f:0:b0:389:844e:9e28 with SMTP id
 p15-20020a7bcc8f000000b00389844e9e28mr1933727wma.67.1646403803960; 
 Fri, 04 Mar 2022 06:23:23 -0800 (PST)
Received: from localhost.localdomain (108.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.108]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c354f00b00381753c67a8sm5079021wmq.26.2022.03.04.06.23.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Mar 2022 06:23:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/core/accel-cpu: Add missing 'qom/object.h' include
Date: Fri,  4 Mar 2022 15:23:20 +0100
Message-Id: <20220304142320.14281-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

hw/core/accel-cpu.h requires "qom/object.h" for the ObjectClass
structure and the DECLARE_CLASS_CHECKERS() macro definitions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/accel-cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
index 5dbfd79955..ab176b4e90 100644
--- a/include/hw/core/accel-cpu.h
+++ b/include/hw/core/accel-cpu.h
@@ -11,6 +11,8 @@
 #ifndef ACCEL_CPU_H
 #define ACCEL_CPU_H
 
+#include "qom/object.h"
+
 /*
  * This header is used to define new accelerator-specific target-specific
  * accelerator cpu subclasses.
-- 
2.34.1


