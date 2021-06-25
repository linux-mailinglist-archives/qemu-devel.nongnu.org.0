Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9F73B401F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:16:24 +0200 (CEST)
Received: from localhost ([::1]:58236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhwl-0003RU-Sl
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwhuY-0000cR-Qe
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:14:06 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwhuW-0002xU-HG
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:14:06 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h11so9776564wrx.5
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X7MWCKLUlWRy8aD7dKX2iXictuJ1eiPw/daTK5+xsVs=;
 b=bZuGEVcCF9Wd4CqpEYDrx8F9AOUy8toj9VnwWIp4QWuBXQMwd+13utipMhpcV3M1Iz
 4dSxfrIRvK+tuUNmJ+MbyclybaJAYrub6JUGjNXEgiz0RIVmvXZyIVKpcgFpHyKqObIf
 Nxpp8WFYN/fme7A9EdlPiANjze6nFSZP/oJuY9Icz6NYn92TfDPYyt7knIsiONrkh/8B
 soGXA56X8EFptMDTI8XeRRdI39jizpSCivfg2nUrrKNdj6xmLlTIx1ezH491KJ2admqg
 Jir+IqIbYrvHZM3snKCkjTcnasYesxHSa89BuQt6loIZYljzTeBegL2DSU7vCmhA8xzq
 hGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X7MWCKLUlWRy8aD7dKX2iXictuJ1eiPw/daTK5+xsVs=;
 b=PEnr/oG/GlTgSHMiVtWYgxzkABX/Zapv5FQWMJNGe9HmhUQ/WEiSu4zBNyD9rArZ2T
 TH1+yVk/5L6MOXAUnD6Op4bxRSXwTPbOMQtf7Da6McVuVLqpTMq70D+vABGY3eM/JcpR
 vm0ZwR54aZx/vaOg6oSPWhM2qlIRQFo7tz8HtniNgr3iGp6vKXrV/XT0+vdHbkn5bzd0
 pLFiicnbcpUEj6vCZa5rMo7UHmX9UKZOKy1RqJTcnIJMjCf6zNW8ri8GvwU4yDfQ+zF5
 chMi9Nqmm0RRLBRqLBtdW5eSGvkd2YWXktlzoUNQVKZHdlWcXVNNfGLCY+DxwR9hP3Zg
 retQ==
X-Gm-Message-State: AOAM530vTGF9NZtoC4cTU5CahC3eCBAh6Jl/wEaR1kmbjzUgH3YTHrcT
 Hy0xqGAQTFRS3fZ0viwi672GBA==
X-Google-Smtp-Source: ABdhPJxbNaAZ7ITJNlOaPVoX4iI/KUU7fILwezY678/x7F54RijCCDE3dAOFE1S310G+6Fp5mFBPJQ==
X-Received: by 2002:adf:e80c:: with SMTP id o12mr9790810wrm.425.1624612443122; 
 Fri, 25 Jun 2021 02:14:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c8sm5405961wri.91.2021.06.25.02.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:14:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C04CB1FF90;
 Fri, 25 Jun 2021 10:13:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 4/7] GitLab: Add "Bug" issue reporting template
Date: Fri, 25 Jun 2021 10:13:52 +0100
Message-Id: <20210625091355.25673-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210625091355.25673-1-alex.bennee@linaro.org>
References: <20210625091355.25673-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Based loosely on libvirt's template, written by Peter Krempa.

Signed-off-by: John Snow <jsnow@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
CC: Peter Krempa <pkrempa@redhat.com>
Message-Id: <20210607153155.1760158-2-jsnow@redhat.com>
Message-Id: <20210623102749.25686-5-alex.bennee@linaro.org>

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


