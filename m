Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15344030CA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:16:19 +0200 (CEST)
Received: from localhost ([::1]:33332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjO6-0007LZ-Ot
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2Z-0005uF-9U
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:04 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:38672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2X-0000yY-9F
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:03 -0400
Received: by mail-il1-x142.google.com with SMTP id u11so168043ilj.5
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/alk5dhNog11lYeAdIDLuwiTsPArXCiZibQ+tOSdZPs=;
 b=R9CZcuIHaYn2OcdRT0jCyHgdH6JO3/OPeJ9QyJFfKvli4h9xPioFJGTdbgw83SJFwL
 Iv2LpjgK+ZBnynffulXV1TbKh1NBf6ABivUHTDuzpTkeRsdMojdMpFAuZ1ANCv5iQeJl
 +QHsGZw7THv4yQzDDznQkLFxcQYz05YfnzksxrZc1FU9rf5AigzmnWLktV/HR/nHQxl/
 DirVyVl8wfGHCzmRrb6xIVhhfj7f5fmwcl5/UucJzACsmnjm4Wv2z/YYIKJuv8GMnl9L
 RU10xktvecONVORvDfJbV+fJuY9pIl5fkiEPjanwjeeSyEMpUJXxPK9cSm/IAfTsMsW9
 /NWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/alk5dhNog11lYeAdIDLuwiTsPArXCiZibQ+tOSdZPs=;
 b=GXkN0MbEZd2ajJeHspIWGqGlk2t27TbLmIIsvix4a+Zt7dQirNTs0qrZsDJTVELLIz
 qferbL+IC/yIwO0Af1tzLhKToRCpl/aAuUVal6eWU0FbJ8TZ1nSK4JzE5zG3YbrO79HJ
 KQKYU/iumeawV4zDvb+s8/WANZzumD1wgx8WPrti/cvI5r5B9xx3m9kmE7i1CNhbB9dN
 wxMGvxJQnbvfntirF0HrbOC/Sxd1yPdDRTFLkW42diX8BZw/+gtdkUdHopyjQcegCRia
 qiepjEmzpSwIDbgwVGMap/KPNzw2QSgKiyn70GKS0WYF0g3L9kihnENubRPaceUd2K3k
 P4hA==
X-Gm-Message-State: AOAM531GkmEOSAkl9FAa84ahoBiPYlx7lo+p4/B8CGRQWap24Linh+w0
 EusvWWYxySPI/6qwGbaXPR54aXxG5EJehpQRDkA=
X-Google-Smtp-Source: ABdhPJzp4wMmU27mhuwTJfOHqtOfRhc+HgOvfNmyg3sqe5eywMrHHbqRboT7E/WEOXTtruaHC0zLCw==
X-Received: by 2002:a92:db06:: with SMTP id b6mr265511iln.305.1631051640002;
 Tue, 07 Sep 2021 14:54:00 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:59 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 24/42] bsd-user: Create target specific vmparam.h
Date: Tue,  7 Sep 2021 15:53:14 -0600
Message-Id: <20210907215332.30737-25-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::142;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x142.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Target specific values for vm parameters and details.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/target_os_vmparam.h  | 38 ++++++++++++++++++++++
 bsd-user/i386/target_arch_vmparam.h   | 46 +++++++++++++++++++++++++++
 bsd-user/qemu.h                       |  1 +
 bsd-user/x86_64/target_arch_vmparam.h | 46 +++++++++++++++++++++++++++
 4 files changed, 131 insertions(+)
 create mode 100644 bsd-user/freebsd/target_os_vmparam.h
 create mode 100644 bsd-user/i386/target_arch_vmparam.h
 create mode 100644 bsd-user/x86_64/target_arch_vmparam.h

diff --git a/bsd-user/freebsd/target_os_vmparam.h b/bsd-user/freebsd/target_os_vmparam.h
new file mode 100644
index 0000000000..990300c619
--- /dev/null
+++ b/bsd-user/freebsd/target_os_vmparam.h
@@ -0,0 +1,38 @@
+/*
+ *  FreeBSD VM parameters definitions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _TARGET_OS_VMPARAM_H_
+#define _TARGET_OS_VMPARAM_H_
+
+#include "target_arch_vmparam.h"
+
+/* Compare to sys/exec.h */
+struct target_ps_strings {
+    abi_ulong ps_argvstr;
+    uint32_t ps_nargvstr;
+    abi_ulong ps_envstr;
+    uint32_t ps_nenvstr;
+};
+
+extern abi_ulong target_stkbas;
+extern abi_ulong target_stksiz;
+
+#define TARGET_PS_STRINGS  ((target_stkbas + target_stksiz) - \
+                            sizeof(struct target_ps_strings))
+
+#endif /* !TARGET_OS_VMPARAM_H_ */
diff --git a/bsd-user/i386/target_arch_vmparam.h b/bsd-user/i386/target_arch_vmparam.h
new file mode 100644
index 0000000000..bb7718265b
--- /dev/null
+++ b/bsd-user/i386/target_arch_vmparam.h
@@ -0,0 +1,46 @@
+/*
+ *  i386 VM parameters definitions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _TARGET_ARCH_VMPARAM_H_
+#define _TARGET_ARCH_VMPARAM_H_
+
+#include "cpu.h"
+
+/* compare to i386/include/vmparam.h */
+#define TARGET_MAXTSIZ  (128 * MiB)             /* max text size */
+#define TARGET_DFLDSIZ  (128 * MiB)             /* initial data size limit */
+#define TARGET_MAXDSIZ  (512 * MiB)             /* max data size */
+#define TARGET_DFLSSIZ  (8 * MiB)               /* initial stack size limit */
+#define TARGET_MAXSSIZ  (64 * MiB)              /* max stack size */
+#define TARGET_SGROWSIZ (128 * KiB)             /* amount to grow stack */
+
+#define TARGET_RESERVED_VA 0xf7000000
+
+#define TARGET_USRSTACK (0xbfc00000)
+
+static inline abi_ulong get_sp_from_cpustate(CPUX86State *state)
+{
+    return state->regs[R_ESP];
+}
+
+static inline void set_second_rval(CPUX86State *state, abi_ulong retval2)
+{
+    state->regs[R_EDX] = retval2;
+}
+
+#endif /* !_TARGET_ARCH_VMPARAM_H_ */
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index fea1a167e4..1b37757e06 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -41,6 +41,7 @@ extern enum BSDType bsd_type;
 #include "target_arch.h"
 #include "syscall_defs.h"
 #include "target_syscall.h"
+#include "target_os_vmparam.h"
 #include "exec/gdbstub.h"
 
 /*
diff --git a/bsd-user/x86_64/target_arch_vmparam.h b/bsd-user/x86_64/target_arch_vmparam.h
new file mode 100644
index 0000000000..81a915f2e5
--- /dev/null
+++ b/bsd-user/x86_64/target_arch_vmparam.h
@@ -0,0 +1,46 @@
+/*
+ *  Intel x86_64 VM parameters definitions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _TARGET_ARCH_VMPARAM_H_
+#define _TARGET_ARCH_VMPARAM_H_
+
+#include "cpu.h"
+
+/* compare to amd64/include/vmparam.h */
+#define TARGET_MAXTSIZ  (128 * MiB)             /* max text size */
+#define TARGET_DFLDSIZ  (32 * GiB)              /* initial data size limit */
+#define TARGET_MAXDSIZ  (32 * GiB)              /* max data size */
+#define TARGET_DFLSSIZ  (8 * MiB)               /* initial stack size limit */
+#define TARGET_MAXSSIZ  (512 * MiB)             /* max stack size */
+#define TARGET_SGROWSIZ (128 * KiB)             /* amount to grow stack */
+
+#define TARGET_VM_MAXUSER_ADDRESS   (0x00007fffff000000UL)
+
+#define TARGET_USRSTACK (TARGET_VM_MAXUSER_ADDRESS - TARGET_PAGE_SIZE)
+
+static inline abi_ulong get_sp_from_cpustate(CPUX86State *state)
+{
+    return state->regs[R_ESP];
+}
+
+static inline void set_second_rval(CPUX86State *state, abi_ulong retval2)
+{
+    state->regs[R_EDX] = retval2;
+}
+
+#endif /* !_TARGET_ARCH_VMPARAM_H_ */
-- 
2.32.0


