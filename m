Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAD5369BBD
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:02:45 +0200 (CEST)
Received: from localhost ([::1]:44474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2wm-0006Xv-7o
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2bL-00061n-2E
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:35 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:37560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b7-0008E6-RR
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:32 -0400
Received: by mail-io1-xd36.google.com with SMTP id b10so50081400iot.4
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KCpN3fMjVnI6P/5+Hcy21zU+TlRkeIdqq7qwGLErEGg=;
 b=x8GKAOKiPefv5QO2a/MUFJf6ZPMSDaneW9djsmzNOsqqcCoQ2kLfx/S3p5gQyBrX4Q
 84sAW5cjtR00T6cddtdHYmcrea3VcK7PcsKFcNPQ57sBUMplklVa51se9WkPIY6bYWTs
 idzz77aN1AzH8rXfN+M1VM4ZX8TUQAaWliatM60ErAfX5ZFhuoXUXvgyW/isYNCZugdn
 ADg+E3OmtQzD10ZcnKIDGAAPtSBPxzGNmpgS64vx/il50ON4Vs/hfzbnOxqdtp9P6xX4
 N7KnbMyK1xM/SlcxIdtPNdFM0uJieymxQdstQlyOlagO9egK+19bFiXu1RSVzgcdRnjm
 BMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KCpN3fMjVnI6P/5+Hcy21zU+TlRkeIdqq7qwGLErEGg=;
 b=eEt3PHq+NXv06ZZvZAvBJlJCoRpPHjQsRrGYhrk2g0UzcJyfsJrTMrSbg6WgmlLgNP
 jU5IXnu/R+yjuHQr8zeDuv0FtZX09ie9BoSxdP0mvCUBY7eos3IdtFvL5SCpqgtMTqIp
 bzzA+fcLXc55NPP4sTrAAm+jp3cCFk4GQgobIMOJUecWw0jsDN9Wnz3lHtR3C0JzWR7p
 8OCX2+agB2vHfoQSv20fiwV0tEvXJDQsDnJFuR1UP2TiLSVDTHZhFpGrvCKBcIL9RsCV
 Ma2X10vIG4C9/7Wc5aE18LFacvkGiDf2yGYaewkcJ5dgv4+r/W9PvETpv0f794L4Oea4
 N9Fg==
X-Gm-Message-State: AOAM533KDxAM+aKlCVOUf9McyD8NMVps1OGbuYer1Qj7zVTTqhzoPni7
 3NlNilIKAMyLtPVBbJcHbgM3tcBjLE7mYTX6
X-Google-Smtp-Source: ABdhPJxfrir9p3Uiqyxy9dJaUjTn0Vh/YXE4XBgl9QexD299UEX0Oj7idb8OplTlvn5zQqb4HJziiA==
X-Received: by 2002:a6b:7d4c:: with SMTP id d12mr4415477ioq.29.1619210418941; 
 Fri, 23 Apr 2021 13:40:18 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n1sm3201308ion.22.2021.04.23.13.40.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:40:18 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 21/24] bsd-user: add arm target_signal.h
Date: Fri, 23 Apr 2021 14:39:56 -0600
Message-Id: <20210423203959.78275-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203959.78275-1-imp@bsdimp.com>
References: <20210423203959.78275-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Add a arm target_signal.h to complete the files currently in the tree. The arm
directory isn't compiled, so it was missing target_signal.h. Update it to the
same level as x86 and sparc. This was abstracted from the target_arch_vmparam.h
file in the bsd-user branch.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_signal.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 bsd-user/arm/target_signal.h

diff --git a/bsd-user/arm/target_signal.h b/bsd-user/arm/target_signal.h
new file mode 100644
index 0000000000..02be90a2d1
--- /dev/null
+++ b/bsd-user/arm/target_signal.h
@@ -0,0 +1,31 @@
+/*
+ * ARM target specific signal handling code
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
+#ifndef TARGET_SIGNAL_H
+#define TARGET_SIGNAL_H
+
+#include "cpu.h"
+
+/* this struct defines a stack used during syscall handling */
+
+static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
+{
+    return state->regs[R_ESP];
+}
+
+#endif /* TARGET_SIGNAL_H */
-- 
2.22.1


