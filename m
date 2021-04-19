Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F31C364AB9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:44:06 +0200 (CEST)
Received: from localhost ([::1]:32862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZoT-00006x-N2
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZS2-0000l2-9M
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:20:57 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZS0-00022A-Qz
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:20:53 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 q123-20020a1c43810000b029012c7d852459so63458wma.0
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hAxtd3FVfWCgth1vFkPSMi25H2dRcEPTe7zUFtCCWjA=;
 b=LkVDFduRReXyNjjidVVROEwIzHD0FERodXAlwrXdSNbV8cKH2+K5gmA/zMP1rh3Cwd
 Din7i3w3KR/Eft8MAfdY2XPHqrZwEAdU0Zte4pvlpltFsmypHJNTGdNV5oaBkupZDzxO
 p3K2RZteFeMbRB7DmqOm9ALgmPPBIMOck8SvoQnRqFHjWemMfEt8RPXydU274/MtcSOZ
 RRjJYnj3RoCj3ywZnxVBldqR8lL2HpKLuu58AdgsSXKWuRAwQ5WB+JeXF97uBsckf8Ap
 kNuctMcnqPZ2FcU/vj7UmcXOfQx9Bl5YN37kxHGJvmTehBGTTBo33huD0mb4GRYnYV6q
 ncIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hAxtd3FVfWCgth1vFkPSMi25H2dRcEPTe7zUFtCCWjA=;
 b=b4NX7Eipt7wtIvMYPw88gCWYb0HqZMv+Jdonf4GvwRoNJICQ8qOZIPvJY9hhmledyO
 dYt3j5M/4ztd88VpJ+BSaaser45fiWO8QnT0JhYOncVTHs1svYXCFt6kdTWObeEe3zvy
 opDEb2jHXRMB/8M0p/pbh5LJRJryEmFTdXWNErL8JbbJsVFtnzvKIbEBFzNaZ6WQHFAg
 Jm2riJYEHqciszzam5H2uU9jQRdxlQgZznVdk8m0T0S0OEphTe8qDvOIr2tQpVCmw09E
 usxAsRGu6KiuYGXLCvIijCdWDAfEMtMDwVWD/4JjLqyvgF18pQyo/WTLufDGy9TmgArm
 mkMw==
X-Gm-Message-State: AOAM531esiq50z371iBDI8XooUm6qeqwZc5p9VTs9hd9IUJb9gIxV7En
 98BLAvgGb6So9AQCITm2bGDbTUslZMHvKQ==
X-Google-Smtp-Source: ABdhPJyKHbINv4bwEC2o0hSiGbzTEQ2xMxyAUl2Bm1rfDBzjwX+NI9cErNU2Ba6IAVtLtfPnYeUKJA==
X-Received: by 2002:a05:600c:35d1:: with SMTP id
 r17mr561973wmq.71.1618860051155; 
 Mon, 19 Apr 2021 12:20:51 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u8sm24104177wrr.42.2021.04.19.12.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:20:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/30] gitlab-ci: Add KVM mips64el cross-build jobs
Date: Mon, 19 Apr 2021 21:18:23 +0200
Message-Id: <20210419191823.1555482-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419191823.1555482-1-f4bug@amsat.org>
References: <20210419191823.1555482-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
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


