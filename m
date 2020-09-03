Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E9125BD77
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 10:39:26 +0200 (CEST)
Received: from localhost ([::1]:55100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDkmD-000260-Pg
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 04:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kDkfP-0008EM-DH
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 04:32:23 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kDkfM-0001Xt-OE
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 04:32:23 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 67so1527071pgd.12
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 01:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OM5+pO1x05sX0Z4q9m5s0uFvz3+CGbA97ITxzJid3EY=;
 b=dQIZDeJQJ1LD8h7KeVW13IWtEQsMmz/U1H80+YCsgBu+F+T4hdo72uMvX6cIQ7XZAi
 Df6TyeXvxuEqseicQKew13FKN/UNTSGko0GWw6hZ2OQr6umHR+S97b44YKZRyLW/SQvE
 bGHCzN8ZRAnfk0hCkInu7Vkm8NXLdTGAHpGkgAltq11d0/pJpUK1X0wTetjxEWe/dWiZ
 v/7mF1ZOOahXS3ORcf8s3EZyJFIDt6zR2sZH5j58W4rbbgxcy5j0Hp8cMPvM1412JOox
 tSVRkIXjavls9EgqZEI/ZzcYgcerIaTexLicJ6z+oGT0KmurRlQ80JYsjb3JPzTth/rI
 a5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OM5+pO1x05sX0Z4q9m5s0uFvz3+CGbA97ITxzJid3EY=;
 b=s6JUOjQA3IXF0u/xcAd7YcSB+wYSm+baO4kX13pNkF/hlm1Xu4DeS9bzS364KAdqoH
 ZErYJNagzxf3hKBV//9suTbmsF/EVlDnB5PX2jpzD1SBQdDwVeov4r6c5JEFBl4BqPHc
 zTC3FVBOndUjF9ZNEHm8MMYHsm2ebU4EarIE1OSZ8NyO4cP9enR4IUj8FrWFx8scZNaO
 3/88bkfEVjpa6mFo5aSNRpSD+V0FibMc0ya4Dfwv4jM27qIkC/YdyPU7fzz2UKeWv1Ij
 9Y5sY8H1q0MW509roBl7PlcbISnjgjbMuLfpn9N9aiBspxgqrnMY2+dQkTzdYLRWIbSZ
 Ys0w==
X-Gm-Message-State: AOAM532yiNZ6wfq3lqsx3qVk8KM4mV94JYodGmnjC4mOL1GhBvrMdzjs
 /8/OD1oJaNAyU9n0O/IRUbe6jvxpH8309caj
X-Google-Smtp-Source: ABdhPJyiKZtdNKpylNX9KTZn+MXK1RFDs/otG+scQwhM1AJenynlG3OWJEyNpdJnf6R8uvKYrIJ4CA==
X-Received: by 2002:a63:c64c:: with SMTP id x12mr2083996pgg.433.1599121938828; 
 Thu, 03 Sep 2020 01:32:18 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id e7sm1759201pgn.64.2020.09.03.01.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 01:32:17 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/12] ci: fixes msys2 build by upgrading capstone to 4.0.2
Date: Thu,  3 Sep 2020 16:31:43 +0800
Message-Id: <20200903083147.707-9-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200903083147.707-1-luoyonggang@gmail.com>
References: <20200903083147.707-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x52a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 capstone  | 2 +-
 configure | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/capstone b/capstone
index 22ead3e0bf..1d23053284 160000
--- a/capstone
+++ b/capstone
@@ -1 +1 @@
-Subproject commit 22ead3e0bfdb87516656453336160e0a37b066bf
+Subproject commit 1d230532840a37ac032c6ab80128238fc930c6c1
diff --git a/configure b/configure
index 5f2bcc4b57..e42d210e5f 100755
--- a/configure
+++ b/configure
@@ -5248,14 +5248,14 @@ case "$capstone" in
       git_submodules="${git_submodules} capstone"
     fi
     mkdir -p capstone
-    QEMU_CFLAGS="$QEMU_CFLAGS -I${source_path}/capstone/include"
+    QEMU_CFLAGS="$QEMU_CFLAGS -I${source_path}/capstone/include -I${source_path}/capstone/include/capstone"
     if test "$mingw32" = "yes"; then
       LIBCAPSTONE=capstone.lib
     else
       LIBCAPSTONE=libcapstone.a
     fi
     capstone_libs="-L${build_path}/capstone -lcapstone"
-    capstone_cflags="-I${source_path}/capstone/include"
+    capstone_cflags="-I${source_path}/capstone/include -I${source_path}/capstone/include/capstone"
     ;;
 
   system)
-- 
2.28.0.windows.1


