Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548F4370E0C
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:46:00 +0200 (CEST)
Received: from localhost ([::1]:37052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFEF-0003JZ-Cn
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEo0-0007f1-Pe
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:18:52 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEny-0008BV-I2
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:18:51 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x7so3090932wrw.10
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SviDw4K5XBOoGF63LViAqHxpPlYyDc4wVbmHH+f6eTQ=;
 b=iwUxN9p4qyIE3m0xWc2ZfMOQKZfXWbwyE0I/GbesUi1u0wckzXdYyvJl0By+V8uMRi
 dqDTICAxb6dFLXX5j6Y4xg98thPrig844LtMQCshJROZbM2Z5iyoVuPx4ltOyd2Pi6oJ
 dZ+4fcJybNAbTEUu1zOZjA9qMt+n/F6BPTXOjQxxjGWigOz5j7BU8nbLSY58S6oc8iet
 rhNrOEuHe2MRnEE5WsGu0EIog6KYVE78/pUOTzIEpWi24cn1xbTCD1k/VYYog4h7WFku
 KANR4BkxHWnIH0y+hY/+ciU5mlRonJi/qPnhGcJNFCiAHOFKoVMqxlno68+/VveAE2Je
 xUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SviDw4K5XBOoGF63LViAqHxpPlYyDc4wVbmHH+f6eTQ=;
 b=TIzygj+5FVs75hcRykwP0h3bJJbbmP+A/28LZjigCkIwlEUUjLaGUcKcaXzg6/rxgj
 n2gcskebtg3e7yaFgYXFqaySsiQf5btSh30rQK61q+GcLEYAGVZwQqm5+bWk+b/ZvFG6
 SLIMIZW1iVCSAIbgPnuCLkpCuhWZP04urEyytzARueiZJEmkuihoNvHBadd1AzFz2qKX
 3UB5y6gJLX8JrJtedR8hPFT2W6y53hH937IUq69xe5KU4sTWNhyRBr340Q05F/LyCgQy
 1OdC39W3KL+oPPPqclMnafXrTMONk7Jh8aZmJAk9io7NGezuyi/bX8P+kd6NSVbQZEAw
 jCOg==
X-Gm-Message-State: AOAM530VIEHbRZmcdw8LiGbi7Waylng/3JSkao2aW8wD5vS5cATCub8L
 H6V0f74FR1UMtGK6XOLNxUdTgo/+fOYt33t0
X-Google-Smtp-Source: ABdhPJyHLVlnVubonhG5IGpU7e50aQREXdihDEIdGsEJDhBvN/Rb6pTEK7TujcKufJ84iuVBzDofFg==
X-Received: by 2002:a5d:4810:: with SMTP id l16mr883533wrq.44.1619972329102;
 Sun, 02 May 2021 09:18:49 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id m11sm1916641wmq.33.2021.05.02.09.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:18:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/36] gitlab-ci: Add KVM mips64el cross-build jobs
Date: Sun,  2 May 2021 18:15:38 +0200
Message-Id: <20210502161538.534038-37-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Message-Id: <20210428170410.479308-31-f4bug@amsat.org>
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


