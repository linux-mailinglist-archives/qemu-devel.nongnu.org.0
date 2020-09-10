Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECA126443F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 12:36:15 +0200 (CEST)
Received: from localhost ([::1]:49394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGJw6-0005iS-ID
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 06:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kGJrm-0006vg-AD; Thu, 10 Sep 2020 06:31:46 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kGJrk-000362-FN; Thu, 10 Sep 2020 06:31:46 -0400
Received: by mail-pg1-x52f.google.com with SMTP id f2so1991165pgd.3;
 Thu, 10 Sep 2020 03:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Q/d/vfX2r5ok5sWGBwNZjHxKJu0oUaT5gHBOiJ10fI=;
 b=ns4QmS2IsnRySuQXjBp5ziFLlXrPQogKSSJJtJVmXGSjvZxfl+0Ve1FiiJLfOPe6fa
 gkUj33aNZeE6TBnhY30Rv2Xe0Z3pE5ZJGZXOp0jIkypJJm7ynwLpI/1217QBHXNC+SMi
 LiM25i3jcmD5lRKuEzhbkR3CALywcozV0/ezq+qq7sXnXqz4VkY70fkz5GJ9PmZYNS6I
 U85093PaLTvwMt9wTX1h2zKwlm48UMpijAPwGbxpKt8iBdtD2t7vfLUkYpaFwqoSeSw8
 JYxg7jTdXz6SYVI6ALvaO0bUZ/y3AZsEKLSQVtkR6IpWofM4tha37tDJQvY7Wz6JtmWx
 F+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Q/d/vfX2r5ok5sWGBwNZjHxKJu0oUaT5gHBOiJ10fI=;
 b=ix8A/GPlBJ75LK5prTL8bR4YU5stXIeZ5nGi93uL0eyduWyaXURXMdi77+1wuOZhQd
 J+mKcgWhCuzwd3J5qUFB+Yj/SgbjD51b2kJWTLv8viD5dyDTyN77ARJXHK8vTJrlHH9d
 RCmq6U2xKZ8kc846Dr15RIe5BlxuBOsD00xw5UiN+mq8x/3oGkS8cVvZsyzqlvYDVaRj
 WjCEQdtQ7x45lPATUwmq0270lAW4Y87p3OHMoyLsZZrafWAxaWEiu4SpNxo6F8EmNxyt
 unST36frMdVEoGuJJKfIrU7jnXvMNpqUcaf5u89uskbxLa6Is2mogUe0V8w0/l268HON
 tgFA==
X-Gm-Message-State: AOAM532TT1Rn2DiqtJWjjt09EV/eeclSr67qn+BjUWNBu7l5NOz010M8
 Qa8YXdliBfad68MFbSSictvECqnNIxM8RSMerYo=
X-Google-Smtp-Source: ABdhPJxv8yQi8TLku5oEqgOsYkaUKBDDlK+5QV+s4yw5e9tgEms1QBayJaDSBeU3Ja2GEigXmHeTHg==
X-Received: by 2002:a63:30c2:: with SMTP id w185mr3970567pgw.436.1599733901328; 
 Thu, 10 Sep 2020 03:31:41 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id g21sm2000203pfh.30.2020.09.10.03.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 03:31:40 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/25] ci: fixes msys2 build by upgrading capstone to 4.0.2
Date: Thu, 10 Sep 2020 18:30:38 +0800
Message-Id: <20200910103059.987-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200910103059.987-1-luoyonggang@gmail.com>
References: <20200910103059.987-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x52f.google.com
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


