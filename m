Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9CD3B1822
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 12:32:54 +0200 (CEST)
Received: from localhost ([::1]:50472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw0Bh-00019R-Cp
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 06:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw07A-0001RU-Ez
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:28:12 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:46837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw077-0001em-CK
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:28:12 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 v20-20020a05600c2154b02901dcefb16af0so977505wml.5
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 03:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u9B5xdpf2yU7sFVUdnTiWK3SHTAbvqNdrvNOrq3aOV0=;
 b=C80qmH3tv2G1vh7NHfE4CflsYj/uThhrlU+HjcUW4qSGz9N2ULVklZwvP4M1rqHr0S
 ebCskVtKvWVupssD2xyC8KxlXjrvmdO46zJF4RJpKePPgEHE/HNeKeMfADfMkAiWjgao
 3Wg93TvKHzv8kUOEe8h+wMCmeQknH5oPM75ECoDNRwKgjyUXelJp/4E0yVxHFtsBNnmv
 8gSkCd+p8i/Ev80rLTtvxge8X7M/6bqQvzzyj4R+8COptyErk8PSWWzZf6BtP7xo41p/
 dNCvTaLQJYTgD9S1VEqnOJLDpcdxKImMctc3QHZI3sAxEyUKJvozrvKCaUm1EOmBfJL7
 S78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u9B5xdpf2yU7sFVUdnTiWK3SHTAbvqNdrvNOrq3aOV0=;
 b=Qm8HSDLSRgoLTubxaI7oeRqxTBUUcxNs9lK5y5V3SVqek7YQcwkaIHCNTWpRjQQAwP
 KzRo3xsWpVb0BLjzIjIQyAFajQDotqOI8LfyNspHLbFZVN/NayiMfgSNR1el+I7t64r7
 buIhWQYtU+22h3cMgE9C5YSZzgmxHR+Qu7OaoMjQmLKmfu1pY9yclZsHmcPQviDVYh2D
 MCIqbQtUez5IA7lTbwz7yhHlesdApISriQxz16iBV4y9hujjvuy3W9+qOLgkDQtTpTor
 x5//yrH9pkphAbH4QCEk8fXZKjmAYgeJZ6IzaETujdimPrsuvtTUmxww0/H96LxS6VZK
 U2gw==
X-Gm-Message-State: AOAM531Ba2I0U15XbqEAwSi8021q33qUd+Ud1uTMNIyzIE0iZYRt8/XR
 dLARBUlFbE27503DzD04rRXXZw==
X-Google-Smtp-Source: ABdhPJxrX+OqjimvupCjK9n9L6vdGevmveFJ7IQCUIudvpHOV0/x6bzNMDiixMvv6NS0yY1WJ1Mxnw==
X-Received: by 2002:a1c:f70b:: with SMTP id v11mr9877026wmh.186.1624444087798; 
 Wed, 23 Jun 2021 03:28:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o2sm2409579wrp.53.2021.06.23.03.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 03:27:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0B6181FF90;
 Wed, 23 Jun 2021 11:27:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 4/8] GitLab: Add "Bug" issue reporting template
Date: Wed, 23 Jun 2021 11:27:45 +0100
Message-Id: <20210623102749.25686-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623102749.25686-1-alex.bennee@linaro.org>
References: <20210623102749.25686-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Krempa <pkrempa@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Based loosely on libvirt's template, written by Peter Krempa.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
CC: Peter Krempa <pkrempa@redhat.com>
Message-Id: <20210607153155.1760158-2-jsnow@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab/issue_templates/bug.md | 64 ++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 .gitlab/issue_templates/bug.md

diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
new file mode 100644
index 0000000000..e910f7b1c2
--- /dev/null
+++ b/.gitlab/issue_templates/bug.md
@@ -0,0 +1,64 @@
+<!--
+This is the upstream QEMU issue tracker.
+
+If you are able to, it will greatly facilitate bug triage if you attempt
+to reproduce the problem with the latest qemu.git master built from
+source. See https://www.qemu.org/download/#source for instructions on
+how to do this.
+
+QEMU generally supports the last two releases advertised on
+https://www.qemu.org/. Problems with distro-packaged versions of QEMU
+older than this should be reported to the distribution instead.
+
+See https://www.qemu.org/contribute/report-a-bug/ for additional
+guidance.
+
+If this is a security issue, please consult
+https://www.qemu.org/contribute/security-process/
+-->
+
+## Host environment
+ - Operating system: (Windows 10 21H1, Fedora 34, etc.)
+ - OS/kernel version: (For POSIX hosts, use `uname -a`)
+ - Architecture: (x86, ARM, s390x, etc.)
+ - QEMU flavor: (qemu-system-x86_64, qemu-aarch64, qemu-img, etc.)
+ - QEMU version: (e.g. `qemu-system-x86_64 --version`)
+ - QEMU command line:
+   <!--
+   Give the smallest, complete command line that exhibits the problem.
+
+   If you are using libvirt, virsh, or vmm, you can likely find the QEMU
+   command line arguments in /var/log/libvirt/qemu/$GUEST.log.
+   -->
+   ```
+   ./qemu-system-x86_64 -M q35 -m 4096 -enable-kvm -hda fedora32.qcow2
+   ```
+
+## Emulated/Virtualized environment
+ - Operating system: (Windows 10 21H1, Fedora 34, etc.)
+ - OS/kernel version: (For POSIX guests, use `uname -a`.)
+ - Architecture: (x86, ARM, s390x, etc.)
+
+
+## Description of problem
+<!-- Describe the problem, including any error/crash messages seen. -->
+
+
+## Steps to reproduce
+1.
+2.
+3.
+
+
+## Additional information
+
+<!--
+Attach logs, stack traces, screenshots, etc. Compress the files if necessary.
+If using libvirt, libvirt logs and XML domain information may be relevant.
+-->
+
+<!--
+The line below ensures that proper tags are added to the issue.
+Please do not remove it.
+-->
+/label ~"kind::Bug"
-- 
2.20.1


