Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7086EBAB3
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 19:30:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqH2Y-0006tO-2Q; Sat, 22 Apr 2023 13:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itachis6234@gmail.com>)
 id 1pqFy0-00023k-8D
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 12:20:04 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itachis6234@gmail.com>)
 id 1pqFxw-0007Hh-2w
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 12:20:02 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-63b5c4c769aso4346833b3a.3
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 09:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682180396; x=1684772396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2YrUREgFu0MlYo7oSaAiYG4SU5g6cj18IVt3rdxu9ZI=;
 b=n21jdN5jMJY2x8OizhyArjqZ/dAnb9WPQNVJbKbzFWNMqPr/HV257leLMqAm20ZMvt
 yo1dKhuvU85z6inTEI1P5XPWjm/rm4FuBuIYZpwDQ442GApBD7tDU+83/0zrg1qLFwBL
 uBTLaELZ2SB9OhuE3aumRhx/uht6RYb+fc4MXekG+pdH/6m78m+rmqK9cSjx/eD8KDX8
 sSqb8e3wqfon2CrpwJd1MRAKXGJJnd2TdSVc5ctbX43Lp7xVC7ztY2WlKMcpa8EF4I4a
 +y65Kp3WHr5T6ToaF0I+7IU0ZMPf1ifhUPyTH5gpt9F8iQ8lNQzboRkl8IqaSbF2zmWH
 1+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682180396; x=1684772396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2YrUREgFu0MlYo7oSaAiYG4SU5g6cj18IVt3rdxu9ZI=;
 b=aE1ousPCfnGozknTvo6LxG3xckoZwL99sbNlVCe++uh9XEbFNUTw1MQW6Dh++ej6Rg
 nc2NrV8QDyLklClBpfGib/aBAwTzr+MD0XU2zLUuMpNsiC8gpufiwaJeOSU/QNv9raV1
 cKa2C88QN8TkgwPO7RA0tLejZ8Ig9hXWs5gXKX0EIwAbZmXEeYI3XaaQncMQ4qguiPqZ
 xUU76+dU7vz2pqyVAHHd/fkUoJPXWwJGHPkF5MmXA/6Rhnc4Sy4LDrr4X+BFOVIUJNF9
 vqTgCLrYqrUpbQXjF1HwATaeJFfLJKdM1pstPvgQldoiOW6h1qjPA8vhm951hlujxf0w
 AAUA==
X-Gm-Message-State: AAQBX9eDQWHQXLFaDDOQ9koDAw9kW5WW8lGxCHc52BBz9DaovmgW/OnT
 PY+RvhxFrhu2L2ZPrdIqGJE=
X-Google-Smtp-Source: AKy350aQe485Vjpiddo4sj7DDpNdtgeY4J217ZBhnnhlFOI+2AU+lMjoTVUXWVk64Bp9D5SIiS+W4g==
X-Received: by 2002:a05:6a20:c88d:b0:ee:777b:782b with SMTP id
 hb13-20020a056a20c88d00b000ee777b782bmr9731514pzb.9.1682180396244; 
 Sat, 22 Apr 2023 09:19:56 -0700 (PDT)
Received: from apple.localdomain ([182.65.27.4])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a655b8e000000b0051f14839bf3sm4241667pgr.34.2023.04.22.09.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 09:19:56 -0700 (PDT)
From: Ajeets6 <itachis6234@gmail.com>
To: itachis6234@gmail.com,
	qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 5/7] Created qemu-os.h for function prototype
Date: Sat, 22 Apr 2023 21:49:32 +0530
Message-Id: <20230422161934.2311-5-itachis6234@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230422161934.2311-1-itachis6234@gmail.com>
References: <20230422161934.2311-1-itachis6234@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=itachis6234@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 22 Apr 2023 13:28:49 -0400
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stacey Son <sson@FreeBSD.org>

+Added t2h_freebsd_timespec and h2t_freebsd_timespec function protype in
qemu-is.h
+included qemu-os.h in os-time.c and os-time.h

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Ajeets6 <itachis6234@gmail.com>
---
 bsd-user/freebsd/os-time.c |  2 ++
 bsd-user/freebsd/os-time.h |  5 ++++-
 bsd-user/freebsd/qemu-os.h | 30 ++++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 bsd-user/freebsd/qemu-os.h

diff --git a/bsd-user/freebsd/os-time.c b/bsd-user/freebsd/os-time.c
index e71eed6519..5c88e1f13d 100644
--- a/bsd-user/freebsd/os-time.c
+++ b/bsd-user/freebsd/os-time.c
@@ -23,6 +23,8 @@
 #include "qemu/osdep.h"
 #include <time.h>
 #include "qemu.h"
+#include "qemu-os.h"
+
 
 
 abi_long t2h_freebsd_timespec(struct timespec *ts, abi_ulong target_ts_addr)
diff --git a/bsd-user/freebsd/os-time.h b/bsd-user/freebsd/os-time.h
index f76744e808..bd995c8a7b 100644
--- a/bsd-user/freebsd/os-time.h
+++ b/bsd-user/freebsd/os-time.h
@@ -22,6 +22,7 @@
 
 
 #include "qemu.h"
+#include "qemu-os.h"
 
 
 
@@ -94,4 +95,6 @@ static inline abi_long do_freebsd_clock_getres(abi_long arg1, abi_long arg2)
     }
 
     return ret;
-}
\ No newline at end of file
+}
+
+#endif /* FREEBSD_OS_TIME_H */
diff --git a/bsd-user/freebsd/qemu-os.h b/bsd-user/freebsd/qemu-os.h
new file mode 100644
index 0000000000..0c502ff0e5
--- /dev/null
+++ b/bsd-user/freebsd/qemu-os.h
@@ -0,0 +1,30 @@
+/*
+ *  FreeBSD conversion extern declarations
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
+
+#ifndef QEMU_OS_H
+#define QEMU_OS_H
+
+#include <sys/timex.h>
+
+/* os-time.c */
+abi_long t2h_freebsd_timespec(struct timespec *ts, abi_ulong target_ts_addr);
+abi_long h2t_freebsd_timespec(abi_ulong target_ts_addr, struct timespec *ts);
+
+
+#endif /* QEMU_OS_H */
\ No newline at end of file
-- 
2.34.1


