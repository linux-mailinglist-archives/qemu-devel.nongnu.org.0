Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EA5267CAE
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Sep 2020 00:47:18 +0200 (CEST)
Received: from localhost ([::1]:59130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHEIf-0004pN-8d
	for lists+qemu-devel@lfdr.de; Sat, 12 Sep 2020 18:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kHEGY-0002rP-Lc; Sat, 12 Sep 2020 18:45:06 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kHEGW-0004EY-S0; Sat, 12 Sep 2020 18:45:06 -0400
Received: by mail-pl1-x643.google.com with SMTP id k13so2652710plk.3;
 Sat, 12 Sep 2020 15:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Q/d/vfX2r5ok5sWGBwNZjHxKJu0oUaT5gHBOiJ10fI=;
 b=GeBLTVQGiC9Bte2jlvrN+8UEXf5kwDsRR6fQ1WubZsCzfs+zlv2KTlYfQsD+aVUzRd
 ukS4/4+Q6R53gEeAd/ebm27/rOlUJu2J/1LoeCK6T7OpMrycf5Q6xMKRk0c301UCmt9I
 vi9a4t0xh644YBbWGw2Z66avGDdCOvOvo3FUkjvB6Po9uIgJPBBSIrh+MktLkKEnPaX1
 mCkEB/rZmt3O3BzewD41LdTR5ZQB+Covto1CaA0+dFjAy/XTSgfK3c8Zo1A6BMgD40Hp
 ADGaJZEqH9yf5nXTVNQZzhupJenZGphB97WDHmKtA0NS9Hcq5Lhu422VwquoUbLWHeFv
 /u5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Q/d/vfX2r5ok5sWGBwNZjHxKJu0oUaT5gHBOiJ10fI=;
 b=bq2+iSEmUWa0uDCiOZAWrxLNZGG8LpLfmVl/k/o5YDGEF3K/9zc9qMdQ1MTf15Q7xU
 Y2YgeOOClCmDcjBWpHozD4Wh7iBDIjDvyJbZdZazPXX/gd+oHL2eVhrQsvvQdo8IORTu
 hl1HF+3TSdZe3MPNIUtnLkXb5TZFu+s0YSbYnKhLL4+kXNU7oOkoet5i8/NKcIoByXKi
 5CJMYYblqB0AQoIjo7rnblOnKLFNZ0QRyxzVUiugl/lMheEfeB/63A+uxY7ooyigsxnL
 OzGt/EMNZGmzXYUkRhu4qfCqR7Snt7PB7NrATQjyo2ZiTGpIUIQGBWd9aSQMnuRUK7No
 Q5Og==
X-Gm-Message-State: AOAM533ZLCbWZWDXGwTmFP2OJAUOozHPKl9hEk2iB3nR6Ak8wD7OMUHa
 MI+/O3My/0+RVCGQe6LUOdrISOQlF3xdYeuAY6c=
X-Google-Smtp-Source: ABdhPJxvV0O7ZUDFzx2DCJ98VHoENNuGNZ1RQ1KgQK2n3OP5/3l3IiKO0LsaCdypcWOGSBaJiHSVrA==
X-Received: by 2002:a17:902:ff02:b029:d0:89f3:28d2 with SMTP id
 f2-20020a170902ff02b02900d089f328d2mr7899759plj.14.1599950702588; 
 Sat, 12 Sep 2020 15:45:02 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id t10sm4639266pgp.15.2020.09.12.15.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 15:45:01 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 03/27] ci: fixes msys2 build by upgrading capstone to 4.0.2
Date: Sun, 13 Sep 2020 06:44:07 +0800
Message-Id: <20200912224431.1428-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200912224431.1428-1-luoyonggang@gmail.com>
References: <20200912224431.1428-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x643.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
 Peter Lieven <pl@kamp.de>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The currently random version capstone have the following compiling issue:
  CC      /c/work/xemu/qemu/build/slirp/src/arp_table.o
make[1]: *** No rule to make target “/c/work/xemu/qemu/build/capstone/capstone.lib”。 Stop.

Subproject commit 1d230532840a37ac032c6ab80128238fc930c6c1 are the tagged version 4.0.2
when upgrading to this version, the folder structure of include are changed to
qemu\capstone\include
│  platform.h
│
├─capstone
│      arm.h
│      arm64.h
│      capstone.h
│      evm.h
│      m680x.h
│      m68k.h
│      mips.h
│      platform.h
│      ppc.h
│      sparc.h
│      systemz.h
│      tms320c64x.h
│      x86.h
│      xcore.h
│
└─windowsce
        intrin.h
        stdint.h

in capstone. so we need add extra include path -I${source_path}/capstone/include/capstone
for directly #include <capstone.h>, and the exist include path should preserve, because
in capstone code there something like #include "capstone/capstone.h"

If only using
    capstone_cflags="-I${source_path}/capstone/include/capstone"
Then will cause the following compiling error:

  CC      cs.o
cs.c:17:10: fatal error: 'capstone/capstone.h' file not found
#include <capstone/capstone.h>
         ^~~~~~~~~~~~~~~~~~~~~
1 error generated.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 capstone  | 2 +-
 configure | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/capstone b/capstone
index 22ead3e0bf..1d23053284 160000
--- a/capstone
+++ b/capstone
@@ -1 +1 @@
-Subproject commit 22ead3e0bfdb87516656453336160e0a37b066bf
+Subproject commit 1d230532840a37ac032c6ab80128238fc930c6c1
diff --git a/configure b/configure
index 4231d56bcc..f4f8bc3756 100755
--- a/configure
+++ b/configure
@@ -5156,7 +5156,7 @@ case "$capstone" in
       LIBCAPSTONE=libcapstone.a
     fi
     capstone_libs="-Lcapstone -lcapstone"
-    capstone_cflags="-I${source_path}/capstone/include"
+    capstone_cflags="-I${source_path}/capstone/include -I${source_path}/capstone/include/capstone"
     ;;
 
   system)
-- 
2.28.0.windows.1


