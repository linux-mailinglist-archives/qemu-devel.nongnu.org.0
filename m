Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F60A1F1DAF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 18:45:31 +0200 (CEST)
Received: from localhost ([::1]:56354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiKtu-0003kz-BN
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 12:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKnk-0003Bk-7D
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:39:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60000
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKni-0005wH-NN
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591634346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5dEfl0cwLuEiH62YNh1V8hVTBkXM5xTWihadVnr7vN0=;
 b=cqX7oiLf3GInEmnA9S/uCnrR6UlwzgfwIpVIz0KnlMS4ur5Vp+LEusv9nFCitmQCjKuEOz
 tKTyJ4QdgPMsO3Vb/zkl+x+xdzLUoDll93CDrS0NiMhsbbt2EOOdcBy2Wnla0VxZ6atxjA
 //R/9VhbS1JEoLG5sDXmtxo0POIirtw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-G4KlJOCwN4CSBMRUW2CjLw-1; Mon, 08 Jun 2020 12:39:00 -0400
X-MC-Unique: G4KlJOCwN4CSBMRUW2CjLw-1
Received: by mail-wr1-f72.google.com with SMTP id l1so7375074wrc.8
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 09:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5dEfl0cwLuEiH62YNh1V8hVTBkXM5xTWihadVnr7vN0=;
 b=YOGazUnezXqIoOiHzAD2Bp/VPOKQTjFYlMTCCJYlFPrf0Urix1EoSRfqFndySQx9sf
 /TjWH1+geJAMUCvGn7ExREQJ75lgEJxTvilJRAFisIEXB6SJaCbHXn6B0Wqu9f4Fr753
 BeccRjClccXjgR0v3GiI3GyVxy10WgDrP1flEFB+OXeGPd+JzPN/GNi47awRBxcszyij
 IdE9xIbE3jditEGimY/jC436DEOKLAzvWEAL/ALAMGxUnxD7jSYzJOlWsLKEm6CrZEOi
 4hLn5Tp21TBcZIyvNDxXQFuRrSGwkLsIWNIlwZBvIEa3Q+PRARFTlxpgR2CZHmbe7Y4V
 vEjA==
X-Gm-Message-State: AOAM532ODMtEeFY9MqQTP8z3q03uq3pkYL1HPyVQOJaOE2tKVCGerM3m
 QPl6kSnUIRfwk26dUCHFGHOxAJpML9yUrNVsQ8ZwKNKAJEzG3L99Ho26e2NFDHgxF6a3HsKX1pK
 YFW8rrXICDkMvlhE=
X-Received: by 2002:a1c:b445:: with SMTP id d66mr185897wmf.29.1591634339152;
 Mon, 08 Jun 2020 09:38:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy//InSCXtGK5GS1f/6niy1pf1RgUssZQ6qSjPq49G3XyYUh5e5mwn/SqGrWO2z8x5rCyzkKg==
X-Received: by 2002:a1c:b445:: with SMTP id d66mr185885wmf.29.1591634338971;
 Mon, 08 Jun 2020 09:38:58 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id i8sm291463wru.30.2020.06.08.09.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:38:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 07/10] accel/Kconfig: Extract accel selectors into their
 own config
Date: Mon,  8 Jun 2020 18:38:20 +0200
Message-Id: <20200608163823.8890-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608163823.8890-1-philmd@redhat.com>
References: <20200608163823.8890-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 01:05:50
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the accel selectors from the global Kconfig.host to their
own Kconfig file.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile      | 1 +
 Kconfig.host  | 7 -------
 accel/Kconfig | 6 ++++++
 3 files changed, 7 insertions(+), 7 deletions(-)
 create mode 100644 accel/Kconfig

diff --git a/Makefile b/Makefile
index 93903e94b1..7c055a9e32 100644
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


