Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1972C606375
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:46:46 +0200 (CEST)
Received: from localhost ([::1]:57938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWoS-0003ns-6X
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:46:42 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWiG-0000Xq-Rt
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDQ-0000bi-2F
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:00:19 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDN-00050s-8n
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:59:59 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so1996589wmb.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BsnTukbpFLVmrOVd5Rj83jH6OSi+bbFHS2pZXyWEQH8=;
 b=RbqQscMssqhba+R/TVBk22Q1pJ6Ci/xm3vr9cmHSWXuRWeHYDEQ8YyHzt1rXaNuKEV
 4ihFX94ivc/gf7dp9G4Ro+onXpUpI+AXgLxBM4tYwtFqibSBbWf3Zm1Ge4CenRUH8s5B
 grmYLSi8DRefDXXbyLx87KcXxQqRkwd/Zp3FowmiakUCGUseQzoUfI8RD0NC928x8yQ4
 m1W8gAv+UYF/9ZfQ1OkeBtYsF1seVOyZr1d1T6hZP+p+ETG/o3lvcNo+NTLh8kbiAyDY
 sbMB4Z2AdiVpTsQ+A4mcmzvMPCWYUBPCWipT/tMIHC93oU0A7wicaxFoAF6sOJZvW81p
 DM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BsnTukbpFLVmrOVd5Rj83jH6OSi+bbFHS2pZXyWEQH8=;
 b=WBg4ocqS56ozYP3hnjUBy1BsiDuZyqb1xjzVohraFTfXM4xaelkBlh4Efz0PZOoAsc
 If5WpMer7/SmGHXgY3bGHZi8zr3PYozhuoExlY6JHIuDhv03bIaDzfdEnE5orm6ti2Gy
 1buaZnlB1dt2YHWRZCCJrEnx6PBNJbPxkU1R/rgQG7kXkAsTZWPPvHpEYkHQ8iud6Vwg
 UkF4b5a4QIQv/OVaEe0wuBZNYOJdVbAb1Ap6auZOPt7+WlwdHe5eevsUdGtm0cZAGC69
 +7MCm/qVTUrW5LRdX3wMAUVKR8tMbZrAzwwyiNFf7lKlUS4XYnaAf538gWl1UJzVUyn2
 N3gw==
X-Gm-Message-State: ACrzQf2HhuIBCrpIs8F4TohatJ5z6SYidNLlnhomDqQwJJhpCnkRBPlT
 mTgNxE4R7VH20NQOD04SbWiFSQ==
X-Google-Smtp-Source: AMsMyM4asUoVc7jo07eANIzMvf0+Qk/pwMHL5zgoZMS2CvFZatNndX6wyavNnI/Ed0/QUgceyR3xxg==
X-Received: by 2002:a05:600c:1c07:b0:3c6:cb22:8a93 with SMTP id
 j7-20020a05600c1c0700b003c6cb228a93mr30343202wms.45.1666267195915; 
 Thu, 20 Oct 2022 04:59:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16467886wrs.53.2022.10.20.04.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:59:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 71B231FFC6;
 Thu, 20 Oct 2022 12:52:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 15/26] MAINTAINERS: add entries for the key build bits
Date: Thu, 20 Oct 2022 12:51:58 +0100
Message-Id: <20221020115209.1761864-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes to the build files are a bit special in that they usually go
through other maintainer trees. However considering the build system
is the root of everything a developer is likely to do we should at
least set it out in MAINTAINERS.

I'm going to nominate Paolo for meson stuff given the conversion was
his passion project. I'm happy to cast an eye over configure stuff
considering a lot of the cross compile logic is in there anyway.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>

---
v2
  - s/Odd Fixes/Maintained/
  - nominate more reviewers
---
 MAINTAINERS | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e3d5b7e09c..6a6f4d62bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3764,6 +3764,30 @@ F: docs/about/deprecated.rst
 
 Build System
 ------------
+Meson
+M: Paolo Bonzini <pbonzini@redhat.com>
+R: Marc-André Lureau <marcandre.lureau@redhat.com>
+R: Daniel P. Berrange <berrange@redhat.com>
+R: Thomas Huth <thuth@redhat.com>
+R: Philippe Mathieu-Daudé <philmd@linaro.org>
+S: Maintained
+F: meson.build
+F: meson_options.txt
+F: scripts/meson-buildoptions.*
+F: scripts/check_sparse.py
+F: scripts/entitlement.sh
+F: scripts/symlink-install-tree.py
+F: scripts/nsis.py
+
+TL Makefile and configure
+M: Paolo Bonzini <pbonzini@redhat.com>
+R: Alex Bennée <alex.bennee@linaro.org>
+S: Maintained
+F: Makefile
+F: configure
+F: scripts/mtest2make.py
+F: tests/Makefile.include
+
 GIT submodules
 M: Daniel P. Berrange <berrange@redhat.com>
 S: Odd Fixes
-- 
2.34.1


