Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF702F7DC2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:08:55 +0100 (CET)
Received: from localhost ([::1]:53230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PmY-00009C-KO
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEX-0001AA-DX
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:45 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEV-00085m-JY
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:45 -0500
Received: by mail-wr1-x434.google.com with SMTP id w5so9278203wrm.11
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iJuG3Rfmdo42tUHxFy8AoALmnllEX6aTVqM1tNYHJiM=;
 b=iQTyRNsJ84WZf2d3BDqSxdfSv+yOUZuSS/TQqO1joOBR72VCHkKddoPh7wZS3cyY0M
 z5YvWtwz/qaunIY33vwKCnblHflELSoYrrrJNtOXO+TphYXTG+F7SZ3J15NIISo7FXYK
 JrCDMsofITg+Eh5Y/j8x+kpurVtb//QnRVGEVVadMBehVqCmMcbtEVpK62Tdmnl6dUcO
 NpzVX+82eklQ1SJnCSHbAiwk+63aSZCVhmAaMY6cc37/2BpmjqlDJwVMpmByqbtD0STV
 nBMkz8r/JQbAv5wq+ljFCHs7XiDhdTEwUuHwNTvUPAOZuHhuc7u/z4vgo/bLKDEh3wJe
 VhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iJuG3Rfmdo42tUHxFy8AoALmnllEX6aTVqM1tNYHJiM=;
 b=biMEXW/HkXAWbo0VaK3iKxxyYebkK2LhTJL8OzxsGrjUFbDA7Yr7dcd53aPuWENif2
 d/ir+fVA3EtHcMYJqqoU6OuFEWfFm5mrHIKABC/dT0bnPfHGQy29HkJmEMTXt0SoWGqO
 jSfegE0gyEhS4mmbHM7ot65qoNCOdyJcHVphh166wuPpDKf7YwOyPaodtcpazwvDhA+0
 wjtkRSyOsP5PdWamxpCSkJ19cdAe/XAVW/leCDcwXe/5m9Mz9wyPbPnZbhUA4ihhtKeU
 DwwcMocR2jpd3vW7xU6EChNaSnA4hKvsDvZi/ruyuT/Ny6A3ee3Riv6HJ3AEYEzk6xEw
 i5rQ==
X-Gm-Message-State: AOAM530yOQIolDWYD1vJZj6++ezkaEJrFja6uEpBt797ERx7bmz66U7v
 Mj24MgxdUDau3Av9l7qPH/JsPQ==
X-Google-Smtp-Source: ABdhPJzbmm8GszFDNMauvk1QSmBVn+XxxMUI4JG6HNj+NKzQdLxPY4TpHuDXjzZ0hJBDAU35nrNxdQ==
X-Received: by 2002:adf:fb85:: with SMTP id a5mr13198597wrr.331.1610717622256; 
 Fri, 15 Jan 2021 05:33:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g194sm12691056wme.39.2021.01.15.05.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:33:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC2C31FF99;
 Fri, 15 Jan 2021 13:08:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 10/30] Fix build with new yank feature by adding stubs
Date: Fri, 15 Jan 2021 13:08:08 +0000
Message-Id: <20210115130828.23968-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

Fixes: 50186051f42 ("Introduce yank feature")
Signed-off-by: Lukas Straub <lukasstraub2@web.de>
[AJB: tweak MAINTAINERS]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210114141918.5201cc9c@gecko.fritz.box>
Message-Id: <20210114165730.31607-11-alex.bennee@linaro.org>

diff --git a/stubs/yank.c b/stubs/yank.c
new file mode 100644
index 0000000000..6090416065
--- /dev/null
+++ b/stubs/yank.c
@@ -0,0 +1,29 @@
+#include "qemu/osdep.h"
+#include "qemu/yank.h"
+
+bool yank_register_instance(const YankInstance *instance, Error **errp)
+{
+    return true;
+}
+
+void yank_unregister_instance(const YankInstance *instance)
+{
+}
+
+void yank_register_function(const YankInstance *instance,
+                            YankFn *func,
+                            void *opaque)
+{
+}
+
+void yank_unregister_function(const YankInstance *instance,
+                              YankFn *func,
+                              void *opaque)
+{
+}
+
+void yank_generic_iochannel(void *opaque)
+{
+}
+
+
diff --git a/MAINTAINERS b/MAINTAINERS
index cb0656aec3..07e4851aa4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2736,6 +2736,7 @@ Yank feature
 M: Lukas Straub <lukasstraub2@web.de>
 S: Odd fixes
 F: util/yank.c
+F: stubs/yank.c
 F: include/qemu/yank.h
 F: qapi/yank.json
 
diff --git a/stubs/meson.build b/stubs/meson.build
index 80b1d81a31..1a656cd070 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -47,6 +47,7 @@ stub_ss.add(files('vm-stop.c'))
 stub_ss.add(files('win32-kbd-hook.c'))
 stub_ss.add(files('cpu-synchronize-state.c'))
 if have_block
+  stub_ss.add(files('yank.c'))
   stub_ss.add(files('replay-tools.c'))
 endif
 if have_system
-- 
2.20.1


