Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BBA6EBAAF
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 19:29:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqH2b-0006vz-Pc; Sat, 22 Apr 2023 13:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itachis6234@gmail.com>)
 id 1pqFy0-00023j-8S
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 12:20:04 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itachis6234@gmail.com>)
 id 1pqFxw-0007G4-2y
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 12:20:02 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63b57c49c4cso2759502b3a.3
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 09:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682180388; x=1684772388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y0/W3cxH1hrq6ZsVgVTx66VqcjfJ692sb4HPppqAWsg=;
 b=Chf45JII1eCv+etCJRyWGorpM5JgxMxcmsyx/v+cJsc9UWryVYC0LcAyV3cm/YE+nq
 CGjoEgwzYoCVzpbwDgbugSc+16Xku5vBRd60bXDPpybHAzrAXpiUaACfHgmfkkG8/vx8
 hCBA3ddmyABUh9aTOo6+7NHu7paWt0fGodp50413oWlm61v5kU2xuWxK2zgn5xV0XXVT
 e6hTteGQp5z75PbSSrnt0/okBEGEsfeukTkGJ4oVs1YS7FzEksKfoMPlaHL4025sVY5Q
 5lpVPv6YayWfqDJI4kq/kynsgrKm5RTsCgZKG1gAZbtxQSxSpZDGp/mxKonEfVqhRG0a
 lDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682180388; x=1684772388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y0/W3cxH1hrq6ZsVgVTx66VqcjfJ692sb4HPppqAWsg=;
 b=Am0utiVMSkoqoIeSNEwy0rJf/+5YQ0SsDU76U1QhW9MJzr8ahOP8+c1A3qVijq4faQ
 WUeqALolrw1oYQdhDgftLT57dVY0MbHft6/jQdAifNSxFfzjvs43XCC+PxLwIZevix1h
 K5uO0EnhRB2loNxUK7Y8kf2UjurBbuKkEb4586YJpi9aCNYSfeFhAGGXuIzius97kb9l
 c3CxJ4KdkbpEW+kfTEdDr2OfYsUjYndQAIo+6sFt3a4bcv8ZtkxGh0pSA24H90ZpS9IG
 ZG68HvEPM2iA9ypkyo7LmUPiQnJeqR8NmirO73T6hY0BWdJw1pCZDmUUX/FsNZPx25Ed
 vPVw==
X-Gm-Message-State: AAQBX9dyC909UmdH6ghfr5ws6MkOUlgBt62SM145LFy7fQNGK4MF60bl
 u6uXCf++dA3v9fg3DNlo3RU=
X-Google-Smtp-Source: AKy350YwCSTLDUFR0a6clj/8/5bNkdKPDXZJS1FVwwvMxAFAHJEYd9gZtRAv+hh822vKwwDBZFPWpg==
X-Received: by 2002:a05:6a00:c88:b0:638:7e00:3737 with SMTP id
 a8-20020a056a000c8800b006387e003737mr12492487pfv.23.1682180388522; 
 Sat, 22 Apr 2023 09:19:48 -0700 (PDT)
Received: from apple.localdomain ([182.65.27.4])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a655b8e000000b0051f14839bf3sm4241667pgr.34.2023.04.22.09.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 09:19:48 -0700 (PDT)
From: Ajeets6 <itachis6234@gmail.com>
To: itachis6234@gmail.com,
	qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 1/7] Create os-time.c and add t2h_freebsd_timeval
Date: Sat, 22 Apr 2023 21:49:28 +0530
Message-Id: <20230422161934.2311-1-itachis6234@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=itachis6234@gmail.com; helo=mail-pf1-x42c.google.com
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

os-time.c contains various functions to convert FreeBSD-specific time
structure between host and guest formats

Signed-off-by: Ajeets6 <itachis6234@gmail.com>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
---
 bsd-user/freebsd/os-time.c | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 bsd-user/freebsd/os-time.c

diff --git a/bsd-user/freebsd/os-time.c b/bsd-user/freebsd/os-time.c
new file mode 100644
index 0000000000..ec9f59ded7
--- /dev/null
+++ b/bsd-user/freebsd/os-time.c
@@ -0,0 +1,41 @@
+/*
+ *  FreeBSD time related system call helpers
+ *
+ *  Copyright (c) 2013-15 Stacey D. Son
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
+/*
+ * FreeBSD time conversion functions
+ */
+#include <errno.h>
+#include <time.h>
+#include <sys/types.h>
+#include "qemu.h"
+
+
+abi_long t2h_freebsd_timeval(struct timeval *tv, abi_ulong target_tv_addr)
+{
+    struct target_freebsd_timeval *target_tv;
+
+    if (!lock_user_struct(VERIFY_READ, target_tv, target_tv_addr, 0)) {
+        return -TARGET_EFAULT;
+    }
+    __get_user(tv->tv_sec, &target_tv->tv_sec);
+    __get_user(tv->tv_usec, &target_tv->tv_usec);
+    unlock_user_struct(target_tv, target_tv_addr, 1);
+
+    return 0;
+}
\ No newline at end of file
-- 
2.34.1


