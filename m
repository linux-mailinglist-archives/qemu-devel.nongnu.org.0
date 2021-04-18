Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDF73636E8
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 19:01:47 +0200 (CEST)
Received: from localhost ([::1]:57402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAnq-00061Z-3U
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 13:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAMi-0004IA-AC
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:33:44 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAMg-00050G-R5
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:33:44 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 d200-20020a1c1dd10000b02901384767d4a5so704255wmd.3
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZBhz6WdoMG0UvLFB01F3gQJVJVkTUP/940dT/MZBTo4=;
 b=B82sYnwFqUUFXdVRUkcwbHqWgmb19qtS1wj7DgTcEPi4LodEVkA7oY4m2uq25O70xf
 /jOkfxQQIb2UykdGSQWqv5Up53BMeUjLDRZ0buU2P0j4Nga/o9JT66F8pnWVRqZr64r6
 PrlOHpydS7PpaL3QP33uWKaDOWjVZu4LQTj6mG56LDgOvQhZH7Da3sA18lWkgK+Mmo8K
 /2aXcxktGHneEnYuEeFHcLjX6rNvEd6uPjaMTZO/ZRCfJh02fdETBMQ8brMkSD0U0X0C
 BNenkFjEYQP31QdHzbzSZxVVkgu6sxEyAJ2RvO6A06dtrfmwTypbWiye4/cjzyaqR3WM
 BNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZBhz6WdoMG0UvLFB01F3gQJVJVkTUP/940dT/MZBTo4=;
 b=dmfejTv8i92e7t4UXGmAsEbgpt1COVNyJHqy3Y4yT1Bh3coYwL7AF4rvFm98Q0X3Vi
 U0VUW8kgPUe67XurMylQ+JV1w6kXsbRCsoUZvxsc7jZBhWG8bziMp49NDLdqG32ywZ3c
 o8u9ZDe25cc+AR4H09tHB0vC1up7341FHAPI3xxQtgnkF6pXQg0AFuz45tMfER+Y7hcE
 bkiUMkItHtGY4xxa9AvBeCxBuCVKElHCEOnJeS9bzPPqk3JS070gBV3r3tDPzRI1rPOO
 Me8EOOweuHXtS+zMEMmpvbdvexeEDoF6q7RgxYOkEFVlNyaAFtS7sp+cjYMAo77ervlt
 Sz8Q==
X-Gm-Message-State: AOAM530h7bjVSv2/znT+wINmw/D45XWVFRKyOHz7DacM/dVYdYWXDtU6
 BNhNqr90JNgicnkdEY9MiBtEYakt/eC03g==
X-Google-Smtp-Source: ABdhPJzpWSFT7PK59+tzSReX9gMJJMFmQr/juiOQ+QZfniby70xQ3qmqkKEZ+vkeF/tvyK3zWFKo1g==
X-Received: by 2002:a1c:bd85:: with SMTP id n127mr17548384wmf.37.1618763621117; 
 Sun, 18 Apr 2021 09:33:41 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o18sm16196136wmp.26.2021.04.18.09.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:33:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/26] gitlab-ci: Add KVM mips64el cross-build jobs
Date: Sun, 18 Apr 2021 18:31:34 +0200
Message-Id: <20210418163134.1133100-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new job to cross-build the mips64el target without
the TCG accelerator (IOW: only KVM accelerator enabled).

Only build the mips64el target which is known to work
and has users.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 2d95784ed51..e44e4b49a25 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -176,6 +176,14 @@ cross-s390x-kvm-only:
     IMAGE: debian-s390x-cross
     ACCEL_CONFIGURE_OPTS: --disable-tcg
 
+cross-mips64el-kvm-only:
+  extends: .cross_accel_build_job
+  needs:
+    job: mips64el-debian-cross-container
+  variables:
+    IMAGE: debian-mips64el-cross
+    ACCEL_CONFIGURE_OPTS: --disable-tcg --target-list=mips64el-softmmu
+
 cross-win32-system:
   extends: .cross_system_build_job
   needs:
-- 
2.26.3


