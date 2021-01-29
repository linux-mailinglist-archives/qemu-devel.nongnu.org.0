Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2683088E4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:09:51 +0100 (CET)
Received: from localhost ([::1]:60492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Sb0-0002ol-Ky
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5Rnb-0004v3-W0
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:48 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnZ-000673-16
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:47 -0500
Received: by mail-ed1-x529.google.com with SMTP id c2so10094517edr.11
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QcUQysKIzSM/Au103fYACCSBXfd/a9CnayLthJR5WoQ=;
 b=DkBxv3KreXhtMeucU5pgPSuHUIGI6EuVRCRh2kfel0jJVOgUvPI/22gGs+Zdf+lYVj
 DVhbZMS9oD44rPQu4DuSD8O6DRgwcHO4kuT51SnfWfIdALl8hWuxGNIv/ZNsblWA1qbe
 wBYQ8Y1MsLoh0NH9O49Idu+UmCUcrR2RVnLnox0yRyo97nmzzyWCloXeTT2UHFzZj9fu
 bAeIzx2t8Clr6gSNPev+wO6qMhbEXblKA+qOpW21q6c2f+Evd+SA8Xz9ImzxfyjNnYzb
 sVoYd9BGnG96jCUrnpKgluQLgYlW8ZAiN9ixQ4WDsYGgMXsI65IrFw+v/x1YDW09i0PX
 /Uhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QcUQysKIzSM/Au103fYACCSBXfd/a9CnayLthJR5WoQ=;
 b=YPWGyoEWhUQZ0jcsFG3XtC5jHRtvrKWA5kmn9dUO9VI1n8yerUAHmnSxUDsd3BKYBm
 rOM+GxMa82x/leDPL0ClNwl70ZxRkxHc+qcOmcIX+JB6E6SzL1BsxVbym2VItSo1Z1Jt
 ddywpkPD1Cn5WDRwHx8SAojaLo1/J5tT7NiQ2fAAuEP6tqoY9TSocMScFfvt26d35EY9
 p5KYhc8fb2I0/qVAlmGWCsi1/PRxG/LnukCsWHSR2G6MCOf/MDiSkXueC/PpgMMFurox
 kCZ0igQ0F7fgqg82bTF1EeUpSvii5BSFEVmzL2ccv86hinLXztkMszMcxHBLbksZJ1vI
 ZvaA==
X-Gm-Message-State: AOAM531+uvrowPnX22CBgsE7YdSODhXBlOPywD4AuX6rXfBUAJjO02ul
 4zSF4GYfh8nNqCuqT92+1NE9porDSPaBLA==
X-Google-Smtp-Source: ABdhPJzVQgiWbgg6OY+DpNCeTLarQ2H6cRcosMPX4KSPHerPgrg+dFdp+NOftEHUbftHk0pTXSAaTw==
X-Received: by 2002:aa7:d511:: with SMTP id y17mr4590403edq.112.1611919123754; 
 Fri, 29 Jan 2021 03:18:43 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/36] qapi/meson: Remove QMP from user-mode emulation
Date: Fri, 29 Jan 2021 12:18:10 +0100
Message-Id: <20210129111814.566629-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210122204441.2145197-11-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/meson.build  | 10 +++++++---
 tests/meson.build |  7 ++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/qapi/meson.build b/qapi/meson.build
index 2839871b47..b301a46f04 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -4,14 +4,18 @@ util_ss.add(files(
   'qapi-dealloc-visitor.c',
   'qapi-util.c',
   'qapi-visit-core.c',
-  'qmp-dispatch.c',
-  'qmp-event.c',
-  'qmp-registry.c',
   'qobject-input-visitor.c',
   'qobject-output-visitor.c',
   'string-input-visitor.c',
   'string-output-visitor.c',
 ))
+if have_system or have_tools
+  util_ss.add(files(
+    'qmp-dispatch.c',
+    'qmp-event.c',
+    'qmp-registry.c',
+  ))
+endif
 
 qapi_all_modules = [
   'acpi',
diff --git a/tests/meson.build b/tests/meson.build
index 6f1ff926d2..7d7da6a636 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -86,7 +86,6 @@ tests = {
   'test-qobject-input-visitor': [testqapi],
   'test-string-input-visitor': [testqapi],
   'test-string-output-visitor': [testqapi],
-  'test-qmp-event': [testqapi],
   'test-opts-visitor': [testqapi],
   'test-visitor-serialization': [testqapi],
   'test-bitmap': [],
@@ -117,6 +116,12 @@ tests = {
   'test-qapi-util': [],
 }
 
+if have_system or have_tools
+  tests += {
+    'test-qmp-event': [testqapi],
+  }
+endif
+
 test_deps = {
   'test-qht-par': qht_bench,
 }
-- 
2.29.2



