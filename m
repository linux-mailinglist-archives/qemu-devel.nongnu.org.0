Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BC6309170
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 03:04:43 +0100 (CET)
Received: from localhost ([::1]:39760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5fcw-0003ih-TC
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 21:04:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fS6-00080p-4U; Fri, 29 Jan 2021 20:53:31 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:32824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fS4-0000I9-Ip; Fri, 29 Jan 2021 20:53:29 -0500
Received: by mail-wr1-x42a.google.com with SMTP id 7so10652170wrz.0;
 Fri, 29 Jan 2021 17:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dDZADzgKI5lXuqqUK6CV2RYB4kAOXUW22/2lumwj8o4=;
 b=e7psjHWNaDe5BRPalel5z+UrUPQyCYHO0ADPAqwnXvE6/jKDRHnq865wvhM3CvcziS
 81EyjqLup5Sso5l2NVZ/0wY2xzImn5JfNEpSNIBoIBengxfy1LzI66lsP+ni/80f/evR
 U7QLC+B3eBq5pi+hy3v4oWie/DVjl15VvVl+DUC7b4bFZ82n+IBpLOg69cciuSH0bv0o
 ugmYLJK5GlHsO6ioN/+OP/utD5jbLp9Mf2b2fwCAn07n5bGBKAg2Ljhf/XruZU6V7ADq
 ieVbF8YOSHcYMgG6rdoDn8FpNs1Ulo8zayvnM2zRRrDOTV3lmjsv5yKhGHhUzizRmIXS
 CcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dDZADzgKI5lXuqqUK6CV2RYB4kAOXUW22/2lumwj8o4=;
 b=HpcuIS8zbKMlUrQswy8Ke0V1dIFhaN93nWdO/i0yCXV08ASnJVVjk2MbgrR42cOd/s
 xRe3mqE1AoMMxCftg3BQJUT9x1AKjTsEE9K7dQRIykO7PZcg7AFCqGBi3xJYtqRfBerx
 ju2i5kOzbwKGBNjm22HsqXHhE3yvZgL1H9JmqhvD79ubGOHmRwhpdaYbUB+G6RFyCMzF
 imMXEcv6aPgIwqSoy+caTAd8O416s/eAMcvrHxu3BCPyAGtxjVOnVO/oLZuB35WrsYVD
 HdJp7y+smIdksOgEAgNNDs6J/Dle4rlKPqQR7MUXQtQVmztXmrTMhgq60OIikrDnPUCk
 2amw==
X-Gm-Message-State: AOAM530ylYUx7Zyrb34+/Clbmx1Sm56ed64u43h/rQ/LB/esvyo1HVVz
 9RMUR0Y9ti8y8pMs6ypULcxC5CWO6tg=
X-Google-Smtp-Source: ABdhPJxaH/w2Fme7el93QIXUQzDffvAxEB63h7HSmXGa9jkoVnLMptaWM3d09a23cIwVkku9tHUZXg==
X-Received: by 2002:a5d:5049:: with SMTP id h9mr7559886wrt.404.1611971606779; 
 Fri, 29 Jan 2021 17:53:26 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d13sm14972889wrx.93.2021.01.29.17.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:53:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/11] .travis.yml: Add a KVM-only Aarch64 job
Date: Sat, 30 Jan 2021 02:52:27 +0100
Message-Id: <20210130015227.4071332-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Add a job to build QEMU on Aarch64 with TCG disabled, so
this configuration won't bitrot over time.

We explicitly modify default-configs/aarch64-softmmu.mak to
only select the 'virt' and 'SBSA-REF' machines.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Job ran for 7 min 30 sec
https://travis-ci.org/github/philmd/qemu/jobs/731428859
---
 .travis.yml | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index 5f1dea873ec..4f1d662b5fc 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -264,6 +264,38 @@ jobs:
         - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS}"
         - UNRELIABLE=true
 
+    - name: "[aarch64] GCC (disable-tcg)"
+      arch: arm64
+      dist: focal
+      addons:
+        apt_packages:
+          - libaio-dev
+          - libattr1-dev
+          - libbrlapi-dev
+          - libcap-ng-dev
+          - libgcrypt20-dev
+          - libgnutls28-dev
+          - libgtk-3-dev
+          - libiscsi-dev
+          - liblttng-ust-dev
+          - libncurses5-dev
+          - libnfs-dev
+          - libnss3-dev
+          - libpixman-1-dev
+          - libpng-dev
+          - librados-dev
+          - libsdl2-dev
+          - libseccomp-dev
+          - liburcu-dev
+          - libusb-1.0-0-dev
+          - libvdeplug-dev
+          - libvte-2.91-dev
+          - ninja-build
+      env:
+        - CONFIG="--disable-containers --disable-tcg --enable-kvm --disable-xen --disable-tools --disable-docs"
+        - TEST_CMD="make check-unit"
+        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-aarch64"
+
     - name: "[ppc64] GCC check-tcg"
       arch: ppc64le
       dist: focal
-- 
2.26.2


