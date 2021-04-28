Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F103336D97A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:21:33 +0200 (CEST)
Received: from localhost ([::1]:48250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbl4H-0002eg-0z
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbl08-0006ai-1t
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:17:16 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbl06-0003MA-K6
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:17:15 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 a22-20020a05600c2256b0290142870824e9so2688338wmm.0
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bIBz+cc+PVq4jBndEUgHGuyOnipUh6TZscrO0OVvRs8=;
 b=mjjJNynvyp4y92hztoB939rY+Zho2Man4waOTdBnwiUNSlcd8V+Jl9UvPwe1KUwSwy
 8drjHEKRX4x3bi3pAlrteZQbdG9EWsTiqwoIUzg4iy9JiUpAZolflTpu0dHyK1HPBNy0
 NIxyV8i9rJj+ZNREeBXC+7bz3U0Ag4a7cgP4KPxPod1VcbYZW+pntmJgqzR7jIloyBEW
 N2ySWqyHGjevwIHP9Yt1J7VcqYx3pU9GdH3r6MqxWdknNjdH136mn+iQt6dW3iclf4rz
 tkfI4v4FqZPvp2owjFFYLcD1O/Lt09Gk7Bqh5x0+XyDVOP4x5sRSQOV9xxNemE+vHrKM
 qPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bIBz+cc+PVq4jBndEUgHGuyOnipUh6TZscrO0OVvRs8=;
 b=m2LrsVIRrB/3qQAgFtpAZb6hWo5XuLkfiOaOLSF99u2hQNnmw0Xq841fSfVRQYpct9
 NCj37a6BUEEOQ6qGTKd+lS/nLoRGxK3Q/Z6PmY8D2ChD4bGT/xa0dgBQKfyKWCJV6WLh
 s6IqPsb4fZVd62uzZmzPJsne2mwmKTICVWIQsmJ7aInTWEv/WoryoClrVuhwGhjv72z+
 vOKJbU5CHGQGCBjzVey5oKfhQKQTNVYk5fRy10E00EyTzvKU8tfmU/uNfqrQ24fOZkQf
 2lSIlCxwrLWQDxYed1WTLY073xrIo5o0oKUrBdtaBRDUZTPgL41Mwc0nH2e6FtGSehvW
 bVAw==
X-Gm-Message-State: AOAM532g1a9TAKmdavMDY1o9WIlDFPu0kDjsvn+wlQXFmqpOJcXVSRzW
 PIUtgWifAj7Mu1xENkMXdHjTyf21N+9E9A==
X-Google-Smtp-Source: ABdhPJwv15OUsqzhdM/CaGq/yCrI9WDUt+XqwQgIo71iZXSKd4h5UYjGniUYMA3A3IH0JsZi5QlGPw==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr31727210wmi.36.1619619432120; 
 Wed, 28 Apr 2021 07:17:12 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l21sm7942942wme.10.2021.04.28.07.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 07:17:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] hw/sparc64: Remove unused "hw/char/serial.h" header
Date: Wed, 28 Apr 2021 16:16:52 +0200
Message-Id: <20210428141655.387430-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428141655.387430-1-f4bug@amsat.org>
References: <20210428141655.387430-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc64/sparc64.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/sparc64/sparc64.c b/hw/sparc64/sparc64.c
index e3f9219a101..cc0b9bd30d3 100644
--- a/hw/sparc64/sparc64.c
+++ b/hw/sparc64/sparc64.c
@@ -26,7 +26,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "hw/boards.h"
-#include "hw/char/serial.h"
 #include "hw/sparc/sparc64.h"
 #include "qemu/timer.h"
 #include "sysemu/reset.h"
-- 
2.26.3


