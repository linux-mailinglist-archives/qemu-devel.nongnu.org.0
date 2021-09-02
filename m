Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF78A3FF82E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:59:26 +0200 (CEST)
Received: from localhost ([::1]:42242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwc9-0001DE-Nr
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwR8-0006rF-HX
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:02 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:37397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwR6-0002zR-SD
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:02 -0400
Received: by mail-io1-xd30.google.com with SMTP id b7so4725976iob.4
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rgX9EGZUhVCa+HvsyINfd4/gXyULb05Byjy3eWtljao=;
 b=dV2NlSTeoL2uCzSt2tf5ZQsrgTcMLj1CIhzL7CYxHOELhBvJKEMAt7wtRq2/agZAyb
 sAUMNTUtzWkvitVz84Y1mJqYnS281OivQy3Vzjd8uEp0sL4zQfttHx5KH/sU+CB/ekCk
 P8HGF01UO93dECSic1DyDjFGptp0Ihw1Q20jhRwXce7WB/B6pazLIQrXD27m/OZnTyz3
 2YWNJlDxkx7oUTUCIzvWmdUWmPEhdV3/6k4sVqXWx48m6MoUfZ3fTbf6gB9Vi+FEOl86
 NkZzf3REhpDx7OeNfy/bH27if07GBfH1PRz3ggpcxbNg6ec4TOae56/kaDzr5DcsDTW9
 IP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rgX9EGZUhVCa+HvsyINfd4/gXyULb05Byjy3eWtljao=;
 b=j2ymaizwgOtSKD5oQtAkYEwAbRAzexiDRlTLPuxjKFw6l92L+EFihHpX3WbuD1EUTK
 jerAg800znXEJnWcnqC5ANWDw7vSe48844rln9VbIvlwi0TqmQcRKum+4bafg9vlOkpL
 TAC/DFEqFczBr2HrAo6lriYdarEhu2AXh+ZHQPhDhxnPu0Um8VHqNgGe9+jqUOsltqcI
 8Wk6emSLJS60Hbs5gsgPHFkIHIgpsfsnF2U+Dr+m6Ca47uow/4oW1c/XSCR3dxicPxVB
 yqPezDVsqGtdZHJ52qoeSA/dhQHuNFHh6C/VmiXcI0JL3TDcxRTm9RRRH2rE3g3n2AK1
 TbWQ==
X-Gm-Message-State: AOAM532Sdzj4apIQgs4y3/yyH/4PjKVK9mi4GLUV16i22CLyeBeczJpK
 p5HcYN499Gz0mnW2lA8udNCOovB/FM0jNQ==
X-Google-Smtp-Source: ABdhPJwMEIYIV78fTUlpz7Y0Ctp1r3/2VVs89bu/1sdqWILSRw2Lpoz88nANWL2uY4wghHRcSTqCYA==
X-Received: by 2002:a6b:f714:: with SMTP id k20mr735172iog.148.1630626479385; 
 Thu, 02 Sep 2021 16:47:59 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:47:58 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/43] bsd-user: add host-os.h
Date: Thu,  2 Sep 2021 17:47:02 -0600
Message-Id: <20210902234729.76141-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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


