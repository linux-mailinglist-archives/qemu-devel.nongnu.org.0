Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B733D73C5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:53:38 +0200 (CEST)
Received: from localhost ([::1]:47320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8KiP-0002Ym-K7
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8KdA-0001qw-Se
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:12 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd9-0004w9-2q
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:12 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b7so14647409wri.8
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9bOeALNfsi9kwgNj2lgc+kwfoBDFcZ0aq/Tk9pto5GQ=;
 b=gnV6/Xoz7KZO0EZ2xqu9phk6AFrUdv66l3CRuZTBACPBzgtLz9RWoic8iScqdh36LA
 +aeL+gzTYPY82kGtdRh0bvXyWwEigaXyqveE4F9ufpV+1xY67qs43j66pj+pTV5RrJRl
 E6JrmDHz8uE/9H2ftT59kxyB3DNN8GloeWRV/NxJ7LI4oZ9zqlnIPZq77Fol2JCtH2rp
 2JQb7nZnuVE1rhvlKsiOoLV3vuioclTJ/DZi8uh6OIZWT+u/mlYX5xmg90hqBpQ6UUKi
 nVzwYdakQdoAaCMB0nD6Orb4XJOks4FCeRYqfIl00lL1rGuv53XJQjSUmAfga8MoPbOR
 0CTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9bOeALNfsi9kwgNj2lgc+kwfoBDFcZ0aq/Tk9pto5GQ=;
 b=XaIiUMSytFZeQnDYBi7TWSLTvt0P/GlAyV8Xn+wifAAsnBrNYkbOxO1vLDK2C/GOEc
 6wvnDe/kHPfSPJN/Xctc3b90AdUT30RQMd/LS/8c6ipwDNa2go5Sfr5rTIlaZGwt8jFn
 kgxa8AVMUuM+YVlQRuFJO/l1omRKcK+0iOLHrKWZxPS4TCvGBz7URcV8EvnrzladQMEZ
 RF2jFQjxUPuc659ItJjUzgJeIFXP9ymN5vofW9SrZPv19DMpGnWtaaalUGVcbh2YPyrg
 zKFwuUpb4XE3ReP3WVGvCCugy3zKHX9Y6Vdek2ngeSw4SCstsvzi0N/VXkU/WT2LhVGJ
 04Yw==
X-Gm-Message-State: AOAM532GpPLvVR7dw+aTYHUXATyCM9pS9k80uzLYvsOFVKwHSbVLKv12
 E4FXD+PLnNyTbM6B2G7jbMrQGUHF+lyhAw==
X-Google-Smtp-Source: ABdhPJwcxxRFr/b+JY5upAe4+PW1foXF9l1PNwnVn6P0h8J6yIOQ/i2CsPi9StKJ1/lgayh7YJCB+Q==
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr13912610wrr.373.1627382889664; 
 Tue, 27 Jul 2021 03:48:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm2413598wmi.33.2021.07.27.03.48.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:48:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/14] docs: Update path that mentions deprecated.rst
Date: Tue, 27 Jul 2021 11:47:56 +0100
Message-Id: <20210727104801.29728-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727104801.29728-1-peter.maydell@linaro.org>
References: <20210727104801.29728-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

Missed in commit f3478392 "docs: Move deprecation, build
and license info out of system/"

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210723065828.1336760-1-maozhongyi@cmss.chinamobile.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure         | 2 +-
 target/i386/cpu.c | 2 +-
 MAINTAINERS       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 69cef688612..79e2ddc74e0 100755
--- a/configure
+++ b/configure
@@ -5230,7 +5230,7 @@ fi
 
 if test -n "${deprecated_features}"; then
     echo "Warning, deprecated features enabled."
-    echo "Please see docs/system/deprecated.rst"
+    echo "Please see docs/about/deprecated.rst"
     echo "  features: ${deprecated_features}"
 fi
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index edb97ebbbee..34a7ce865bb 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4110,7 +4110,7 @@ static const X86CPUDefinition builtin_x86_defs[] = {
  * none", but this is just for compatibility while libvirt isn't
  * adapted to resolve CPU model versions before creating VMs.
  * See "Runnability guarantee of CPU models" at
- * docs/system/deprecated.rst.
+ * docs/about/deprecated.rst.
  */
 X86CPUVersion default_cpu_version = 1;
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 445f7fe2d19..42ac45c3e50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3439,7 +3439,7 @@ F: contrib/gitdm/*
 
 Incompatible changes
 R: libvir-list@redhat.com
-F: docs/system/deprecated.rst
+F: docs/about/deprecated.rst
 
 Build System
 ------------
-- 
2.20.1


