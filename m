Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B5F1DD7DA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 22:01:59 +0200 (CEST)
Received: from localhost ([::1]:48232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbrOA-0000CX-Le
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 16:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrMC-0005fT-OE
 for qemu-devel@nongnu.org; Thu, 21 May 2020 15:59:56 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22464
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrMB-0008Na-Sb
 for qemu-devel@nongnu.org; Thu, 21 May 2020 15:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590091195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TyEDe8wylZalxNMNSz6RpL3nleNnTxzk4iV0Jrd1pvo=;
 b=eo/mVZSkBENfxgkra5eqampOomQDyv/VyHFJKaaWvpZvtVs1u/6Qc9JXutCqEM3KvkbfqF
 +s05X5LOiifoUw1Y1PmBqX0bimNjrDnV+RHJ+Fl4EoorvP4hd6CFX2kx94wH1+V3sZ/AjY
 mE0N+YMza+Qwc/oLF68I8ie+QxEIO/Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-kseHgcNiO02XOk2CqvBzVw-1; Thu, 21 May 2020 15:59:53 -0400
X-MC-Unique: kseHgcNiO02XOk2CqvBzVw-1
Received: by mail-wr1-f70.google.com with SMTP id z8so3344347wrp.7
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 12:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TyEDe8wylZalxNMNSz6RpL3nleNnTxzk4iV0Jrd1pvo=;
 b=PTq8wP36Zj3jgVcOfUg91EA3D+DRbxsnY6z2DsDhbN8dqrKTwqFG92uWWc0df3h+i1
 EpcJZLCSCrkaNO1tm9YofIsl7W4NLtmVW7mxfOQOUgUvRvXuM5ctNemTMeRjpocDf3dw
 RyMNzsAvIZl+Xyq/qV1JglhQGGPVBvpkMRowgo6pKr7JnlkoLVEB7e+MLlHqoWb+EgkJ
 3yEF4w4AcjVAtj0EsuyGDucpcr3U/je65zn8tZgzd4F70snORtpGuvXaIqY7R6r9iE9n
 na0+Ky4INsc3FardTT9Cb8xqO3zyT1TTlgLIQWyERSgXaOG812VXPQojie58lmYH9i10
 SmcA==
X-Gm-Message-State: AOAM531cYJJVF/Inq4ZiDoCe4wYCjyV8YexnGC5lOzPcEKSBWuL5f+CI
 Cft8UKuUQtpRoPNT8y+uFnIL1mVf69SiXMUeuxvTeIJzngC648Rg1kc2fyrHkqTnjKYQbMq1XS/
 RyU+/s4owrfIy+YU=
X-Received: by 2002:a05:6000:1107:: with SMTP id
 z7mr202692wrw.93.1590091192447; 
 Thu, 21 May 2020 12:59:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi56RHX9v+G21jJAOnCw3fEeIRJZTLhwA8U+0eI4Lqjqd8JiM2+5TLbbdNev45iZ0PlCgIuA==
X-Received: by 2002:a05:6000:1107:: with SMTP id
 z7mr202668wrw.93.1590091192251; 
 Thu, 21 May 2020 12:59:52 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id p9sm7364946wrj.29.2020.05.21.12.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 12:59:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/11] accel/Kconfig: Extract accel selectors into their
 own config
Date: Thu, 21 May 2020 21:59:07 +0200
Message-Id: <20200521195911.19685-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 04:44:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the accel selectors from the global Kconfig.host to their
own Kconfig file.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile      | 1 +
 Kconfig.host  | 7 -------
 accel/Kconfig | 6 ++++++
 3 files changed, 7 insertions(+), 7 deletions(-)
 create mode 100644 accel/Kconfig

diff --git a/Makefile b/Makefile
index 7666f81e8a..648757f79a 100644
--- a/Makefile
+++ b/Makefile
@@ -419,6 +419,7 @@ MINIKCONF_ARGS = \
     CONFIG_PVRDMA=$(CONFIG_PVRDMA)
 
 MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host \
+                   $(SRC_PATH)/accel/Kconfig \
                    $(SRC_PATH)/hw/Kconfig
 MINIKCONF_DEPS = $(MINIKCONF_INPUTS) \
                  $(wildcard $(SRC_PATH)/hw/*/Kconfig)
diff --git a/Kconfig.host b/Kconfig.host
index 55136e037d..a6d871c399 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -2,9 +2,6 @@
 # down to Kconfig.  See also MINIKCONF_ARGS in the Makefile:
 # these two need to be kept in sync.
 
-config KVM
-    bool
-
 config LINUX
     bool
 
@@ -31,10 +28,6 @@ config VHOST_KERNEL
     bool
     select VHOST
 
-config XEN
-    bool
-    select FSDEV_9P if VIRTFS
-
 config VIRTFS
     bool
 
diff --git a/accel/Kconfig b/accel/Kconfig
new file mode 100644
index 0000000000..c21802bb49
--- /dev/null
+++ b/accel/Kconfig
@@ -0,0 +1,6 @@
+config KVM
+    bool
+
+config XEN
+    bool
+    select FSDEV_9P if VIRTFS
-- 
2.21.3


