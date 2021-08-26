Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A15B3F8FD5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:18:04 +0200 (CEST)
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMl4-0005vw-KN
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfw-0006AU-DF
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:40 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:41703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfu-0006s8-GL
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:40 -0400
Received: by mail-io1-xd44.google.com with SMTP id j18so5556732ioj.8
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rCADJHtb2smO/fMTHMh99sfxayWkHU7m8yH8FtJZoTM=;
 b=d5kCbVfCUasGCJ3XpdotZQv/qGNxWDK6oI5rsBdZhIEJzpWVWD1xQ/OSTXd+fJm/kn
 M1h71j59GlTOewbQufCNUdPLp5UBd0vaT6tcw8eHwE3ATZ3wGgQeGh5XEfbyqSdFPEXe
 C5na9iqCf+K4W0qXEADf1uCTLleKEoAQR2IRzDdr+TzgzwTtbrE2HhqmjYzjaqFr++SE
 zNPORdjeu+U2dS06zvLo3gfjGaGH8H6aB9FRj646rOiqLSXbtT6QL/uAYIe93G+yDPuZ
 vsuQaw8OqfncxLN/S5RCM44WRIdVYHkzLa2QsdkJogYcgmiityKbkz4zOKK2WX3bh+mX
 ocjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rCADJHtb2smO/fMTHMh99sfxayWkHU7m8yH8FtJZoTM=;
 b=oFowBADqtqMd0Ql9RXUfQFatSsc0PaDeg2EPgBJHs+WLmB39ZJBbnufLMNoJbYl3bc
 jybWRfgmCjKhQZNVKk7ogv86zgrBr9i+X8YRcZzheF1L3vhAeUdMD8PLfZOeD5dG6Nmr
 PWysxd2hvHTpR30KGAG5Fq5PV6QUULRTuKhZ9QQlqvh16itfeL1z0iziCGKTtwBjcRId
 wuHVEBN4HtDXUFdyj78mB65+MtQjQGdkfM12yAv97I2q3rVYQXjzc9vq+0h2vsZIOLVT
 DTOS/Kwgnmx7lQZMpiRU/TQBb2f7epwRzzz/iR8CZ6cLvFohAqbEMTQirjWo4ey6LMXo
 4tKg==
X-Gm-Message-State: AOAM530ycf11KVMGVYFHsWeT2rm915zYB1uxZjEov1XbGQFipzjDxlSe
 CKiURqCxQ1JiWz5inOZ1PZRjB1N9pIwPh0IZ
X-Google-Smtp-Source: ABdhPJzUR6VIkkN/uhsIW3zSqx1sQSi+2r317IzKz6rXaJhZEzGdpWJ+mIZRINehWtLQZ+MKWMNYxg==
X-Received: by 2002:a6b:ec0b:: with SMTP id c11mr4497707ioh.207.1630012357149; 
 Thu, 26 Aug 2021 14:12:37 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:36 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/43] bsd-user: add host-os.h
Date: Thu, 26 Aug 2021 15:11:34 -0600
Message-Id: <20210826211201.98877-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d44;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd44.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Host OS specific bits for this implementation go in this file.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/host-os.h | 23 +++++++++++++++++++++++
 bsd-user/netbsd/host-os.h  | 23 +++++++++++++++++++++++
 bsd-user/openbsd/host-os.h | 23 +++++++++++++++++++++++
 3 files changed, 69 insertions(+)
 create mode 100644 bsd-user/freebsd/host-os.h
 create mode 100644 bsd-user/netbsd/host-os.h
 create mode 100644 bsd-user/openbsd/host-os.h

diff --git a/bsd-user/freebsd/host-os.h b/bsd-user/freebsd/host-os.h
new file mode 100644
index 0000000000..a799164324
--- /dev/null
+++ b/bsd-user/freebsd/host-os.h
@@ -0,0 +1,23 @@
+/*
+ *  FreeBSD host dependent code and definitions
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
+#ifndef __HOST_OS_H_
+#define __HOST_OS_H_
+
+#endif /*!__HOST_OS_H_ */
diff --git a/bsd-user/netbsd/host-os.h b/bsd-user/netbsd/host-os.h
new file mode 100644
index 0000000000..b44cb7fdda
--- /dev/null
+++ b/bsd-user/netbsd/host-os.h
@@ -0,0 +1,23 @@
+/*
+ *  NetBSD host dependent code and definitions
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
+#ifndef __HOST_OS_H_
+#define __HOST_OS_H_
+
+#endif /*!__HOST_OS_H_ */
diff --git a/bsd-user/openbsd/host-os.h b/bsd-user/openbsd/host-os.h
new file mode 100644
index 0000000000..9083555f26
--- /dev/null
+++ b/bsd-user/openbsd/host-os.h
@@ -0,0 +1,23 @@
+/*
+ *  OpenBSD host dependent code and definitions
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
+#ifndef __HOST_OS_H_
+#define __HOST_OS_H_
+
+#endif /*!__HOST_OS_H_ */
-- 
2.32.0


