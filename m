Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C3E4C7785
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:22:04 +0100 (CET)
Received: from localhost ([::1]:45122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkep-0000bM-3n
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:22:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkVI-0000zA-DF
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:12:12 -0500
Received: from [2607:f8b0:4864:20::d32] (port=37847
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkV3-0006bb-Vm
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:12:12 -0500
Received: by mail-io1-xd32.google.com with SMTP id c23so15692275ioi.4
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g2a4iUrTub2nz3g1lIS5iV9/jqK5TM3KXVGIVjpt/k4=;
 b=kWavE4RsO/SmqlKVhbX/5I71z9TcvJ4VB1kJoXVwo9m9vISk6KZbMcGmJ6V6RwR004
 03XwBYma5ODpfTx8KOmoZ9kHjxBVn7XDu0qe0gXNcEWUsg3jAmY2Ra3v6jpFCwP/jdqo
 XijSBNbjPrpsJCxlW8b2Q+0kW6H7qSrZN0vMpUR/SjhtqQC44nXMVVqaw+e+7xBYoPmk
 xGDDANcgJVkmcQSK8YvFYoXXd0qXJewQXbso1JpuHEgtvQVK8LPTglH97dZd1yyW+FSR
 pBhhklSJO+QIh5NFsMyhUKajIdR9x9BQw2/DYKlkAgGeYG+StEB7bcmVPe8G6kfYN5Gy
 Utgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g2a4iUrTub2nz3g1lIS5iV9/jqK5TM3KXVGIVjpt/k4=;
 b=eeHSXuwE+twmtTsAnhz/RqMojO0A5ZZNhFEhT1Drz0jmLKxaGkdB9LNx/sSVil/hkX
 CG6VmDczQVV/wupcRY+uKPqU/xaarPtWiogrnxAJVfKptI9r5Osb0dNgi7i/gC5LUw6J
 N5ADFt7QSuW37c4u0aTnV6iOgIbLHOXAXBFEteaXk06vs6OcVLoGQASShQ+9pH0/MZ2E
 fhXrEweOHVfnLXyMaayx2BiZCpJSPRJLnJ9FYik0oQPR2GYU5LMHsAfYXaj50947WTDe
 dadL6oAE0wJhL81Ggd42rNFSXhUr0hMzGJxvQysPHXR6VsmY9hPBN79mxo6vk1XaMHcs
 Xagw==
X-Gm-Message-State: AOAM531uZes8Q3EGWMd7jX+u8wjRAt+fDBQdAIqqaDAWXZkCfEwovWZm
 fkipD05GuP1oXBUulsNK/gf1+DQpR+PRZg==
X-Google-Smtp-Source: ABdhPJy4J3YhbqsmrND0CDov7xcep5j1fkY3PLB0IUklPhcBcWVLLXCP2lwXwqXdUEpOzgVezoxEaw==
X-Received: by 2002:a05:6638:1453:b0:308:eafa:41c with SMTP id
 l19-20020a056638145300b00308eafa041cmr18289626jad.30.1646071915780; 
 Mon, 28 Feb 2022 10:11:55 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm6015396ioc.8.2022.02.28.10.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:11:55 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/16] bsd-user: introduce target.h
Date: Mon, 28 Feb 2022 11:12:12 -0700
Message-Id: <20220228181214.2602-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220228181214.2602-1-imp@bsdimp.com>
References: <20220228181214.2602-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create target.h. This file is intended to be simple and describe basic
things about the architecture. If something is a basic feature of the
architecture, it belongs here. Should we need something that's per-BSD
there will be a target-os.h that will live in the per-bsd directories.

Define regpairs_aligned to reflect whether or not registers are 'paired'
for 64-bit arguments or not. This will be false for all 64-bit targets,
and will be true on those architectures that pair (currently just armv7
and powerpc on FreeBSD 14.x).

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target.h    | 21 +++++++++++++++++++++
 bsd-user/i386/target.h   | 21 +++++++++++++++++++++
 bsd-user/qemu.h          |  1 +
 bsd-user/x86_64/target.h | 21 +++++++++++++++++++++
 4 files changed, 64 insertions(+)
 create mode 100644 bsd-user/arm/target.h
 create mode 100644 bsd-user/i386/target.h
 create mode 100644 bsd-user/x86_64/target.h

diff --git a/bsd-user/arm/target.h b/bsd-user/arm/target.h
new file mode 100644
index 00000000000..419c039b68e
--- /dev/null
+++ b/bsd-user/arm/target.h
@@ -0,0 +1,21 @@
+/*
+ * Intel general target stuff that's common to all i386 details
+ *
+ * Copyright (c) 2022 M. Warner Losh <imp@bsdimp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TARGET_H
+#define TARGET_H
+
+/*
+ * arm EABI 'lumps' the registers for 64-bit args.
+ */
+static inline bool regpairs_aligned(void *cpu_env)
+{
+    return true;
+}
+
+#endif /* ! TARGET_H */
+
diff --git a/bsd-user/i386/target.h b/bsd-user/i386/target.h
new file mode 100644
index 00000000000..9b9df047a3b
--- /dev/null
+++ b/bsd-user/i386/target.h
@@ -0,0 +1,21 @@
+/*
+ * Intel general target stuff that's common to all i386 details
+ *
+ * Copyright (c) 2022 M. Warner Losh <imp@bsdimp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TARGET_ARCH_H
+#define TARGET_ARCH_H
+
+/*
+ * i386 doesn't 'lump' the registers for 64-bit args.
+ */
+static inline bool regpairs_aligned(void *cpu_env)
+{
+    return false;
+}
+
+#endif /* ! TARGET_ARCH_H */
+
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 56042ddbc5d..a9efa807b78 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -35,6 +35,7 @@ extern char **environ;
 #include "target_syscall.h"
 #include "target_os_vmparam.h"
 #include "target_os_signal.h"
+#include "target.h"
 #include "exec/gdbstub.h"
 
 /*
diff --git a/bsd-user/x86_64/target.h b/bsd-user/x86_64/target.h
new file mode 100644
index 00000000000..8956631db1d
--- /dev/null
+++ b/bsd-user/x86_64/target.h
@@ -0,0 +1,21 @@
+/*
+ * Intel general target stuff that's common to all x86_64 details
+ *
+ * Copyright (c) 2022 M. Warner Losh <imp@bsdimp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TARGET_H
+#define TARGET_H
+
+/*
+ * x86 doesn't 'lump' the registers for 64-bit args, all args are 64 bits.
+ */
+static inline bool regpairs_aligned(void *cpu_env)
+{
+    return false;
+}
+
+#endif /* ! TARGET_H */
+
-- 
2.33.1


