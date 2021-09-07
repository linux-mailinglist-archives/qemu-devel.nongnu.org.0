Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440A54030BD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:11:17 +0200 (CEST)
Received: from localhost ([::1]:44928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjJE-0004U1-C2
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2R-0005o6-HN
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:56 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:47037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2P-0000sp-S8
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:55 -0400
Received: by mail-io1-xd41.google.com with SMTP id b200so430783iof.13
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rgX9EGZUhVCa+HvsyINfd4/gXyULb05Byjy3eWtljao=;
 b=Xi+QUXPPMC6nRhuP2MUzi2huW3t6l+3WARTJNXt2TkPbfGE7AnvINWaqQYY4C+hA8g
 sfoUfygII7hyJmEMfBN62woMiHq33zloeIbKxtAInTeRazZS/AEPG+kfZwfgd9+c+Csn
 sYbavlz3xaD2e4wGS3OWLA+2S4gzg6bjCarwi9fxtIu7ERH4yERZSrje/uNCxSSfiquC
 SaBa415lBYXgeQldVO80bYnMaXhXzBHkH+8akC5tJz/HRGS+ncO/uUDJ3tyvzVLwffmN
 ufVHdNpFo9ryS9bF1sHMAVgU2O/GDGIxyqZmT6BxrmiDKCjGAORdUbhgKTQrsB4yysFu
 tQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rgX9EGZUhVCa+HvsyINfd4/gXyULb05Byjy3eWtljao=;
 b=kiOSGrM4cDvZGKBsb6J/uVz3VAvHdAXWCUdSTrgb/CgP+3qaqIMjmUAFsem3z6G/zV
 Q8LZBe51sNb32tszqVzcnL2mJb9AO+6NSTCKVLJL6OACJ52HmQGgDFYO4OGs4w5PLUhD
 /bqd02mJnlJgF/sOeaYiZN+D+oUFNgH/77r0hCB7bYdmvW9/tEGClWz4TUGnnVAglzmQ
 m8lZOHMqLiOTSDyWWEswgd0hchdOpLSWl8PrnUglbbdfubmvdI9Cq+HiLVCxkfr7dI4C
 CV3chFkED/w2BkD5myrFhFmCe/kqNWndKVIMGiig418wtYBry5MnwT/BbleZ2JAyB6Bm
 52vQ==
X-Gm-Message-State: AOAM530M+gmeDFB5iuDe9x59Ssuc/mTl5/um2JACdrFGpOYhzGOQ/4lH
 can2/5ABQ6OUpKfb/IVF4lZsWhoZ/yTnIoVIfFg=
X-Google-Smtp-Source: ABdhPJxqjxn9iQ8NR6fVe6WbJs+wrjPivWZ7C7cy60ru+PVhm7NzYRTw1oxokF6J2Pp86KO+PpoTgw==
X-Received: by 2002:a05:6638:1613:: with SMTP id
 x19mr436436jas.77.1631051632641; 
 Tue, 07 Sep 2021 14:53:52 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:52 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 16/42] bsd-user: add host-os.h
Date: Tue,  7 Sep 2021 15:53:06 -0600
Message-Id: <20210907215332.30737-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d41;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd41.google.com
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
index 0000000000..bd3f2892db
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
+#ifndef _HOST_OS_H_
+#define _HOST_OS_H_
+
+#endif /*!_HOST_OS_H_ */
diff --git a/bsd-user/netbsd/host-os.h b/bsd-user/netbsd/host-os.h
new file mode 100644
index 0000000000..d4bbc7d58f
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
+#ifndef _HOST_OS_H_
+#define _HOST_OS_H_
+
+#endif /*!_HOST_OS_H_ */
diff --git a/bsd-user/openbsd/host-os.h b/bsd-user/openbsd/host-os.h
new file mode 100644
index 0000000000..ae23bfef64
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
+#ifndef _HOST_OS_H_
+#define _HOST_OS_H_
+
+#endif /*!_HOST_OS_H_ */
-- 
2.32.0


