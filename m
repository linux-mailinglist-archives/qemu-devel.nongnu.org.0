Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C08C6EA31A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 07:26:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppjFh-0003TS-EX; Fri, 21 Apr 2023 01:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFg-0003TJ-3O
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:24:08 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFe-0001fe-6s
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:24:07 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f193ca053eso747235e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 22:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682054644; x=1684646644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h/UJOn8wgRX4tTksbI20dhhsucFRBdZhIv7ROQ0RsL8=;
 b=WYvQwjiIGI52FmN6fA1ePjvofb0XnzHuMrKW9i+Tz0/X7WlEvXH6Y3SME+QFyv5DEP
 WVRZDtYq0BkvGMC0vprOm3gSd4Ps7uUUfHSjPmb/UlYH5NqqFb3Gs35ItRL1vAATbqr+
 U8YINw8jRprBeX8tqEjchSf+nx7pN+yX/3ViVrMS8NlARCDaEI7porMJ7tFY9bc/NcYe
 H1/VvHcdzZZpnU1i9ZzAfW2ZCh+mcgoWZ2d5/RXXrTAXVDynxbdXXczEI6rvy3js62KD
 quOifU/jKvGF5Y8qMIteTZ1eQaBAqIoikYGJ/eFMm5RnGr1absYMborscJVOMKVDAsKN
 V2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682054644; x=1684646644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h/UJOn8wgRX4tTksbI20dhhsucFRBdZhIv7ROQ0RsL8=;
 b=XEX0K8heXSxNxh4lDUXDSdisS/vZE03LCZefRcMHAlv5DDmam63Aah4wkd20sz9KnH
 kaUI1cyaI1uthFVah8/fxETvv0v51K64cbhTDFSmlTAoAh8qyrPETwXHtk+Y14D+gN/u
 WtBkTIxPoKOhNOeQ9g6CyxhzBfrElNxBfGam3LyUMrosZgu9AQ8t72DmJt1OWVTrUTVV
 es2BGODC4+OBq9UNDxbDaC07Tk7VE/RMPlBqua8sP0nBik4/q9h9/WYAoyvBjfw8BPq0
 pPqOD0uWqrlJ9UXLq6Soz4tIFD+0n+P4eaJx4GPh1kJ2wyQ3sFi7jCjWK7OMAELL1jlN
 iu7g==
X-Gm-Message-State: AAQBX9fT4TzkdhC4fnekcaSlT7a7Y99fwMZbsSt5bNHEcaFD/VoQZGPd
 1CvnAKdFvHL+92BbTR8Dob8FfVk8ptY=
X-Google-Smtp-Source: AKy350bmeFm4mv7E0r/SciRNqHxupST4u7AoRwfeQXzp9R6WryrHjrPzWJD/rBx9sMshcBeD79LHmw==
X-Received: by 2002:a05:600c:258:b0:3eb:29fe:f922 with SMTP id
 24-20020a05600c025800b003eb29fef922mr737018wmj.29.1682054644352; 
 Thu, 20 Apr 2023 22:24:04 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a7bc3cd000000b003f173c566b5sm3813475wmj.5.2023.04.20.22.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 22:24:03 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
X-Google-Original-From: Karim Taha <krm.taha@outlook.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 04/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 07:22:48 +0200
Message-Id: <20230421052255.5603-5-krm.taha@outlook.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421052255.5603-1-krm.taha@outlook.com>
References: <20230421052255.5603-1-krm.taha@outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stacey Son <sson@FreeBSD.org>

added bsd-user/qemu-bsd.h, required by bsd-user/bsd-socket.h, contains
forward declarations of the socket conversion functions defined in bsd-user/bsd-socket.c.
---
 bsd-user/qemu-bsd.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 bsd-user/qemu-bsd.h

diff --git a/bsd-user/qemu-bsd.h b/bsd-user/qemu-bsd.h
new file mode 100644
index 0000000000..a052688596
--- /dev/null
+++ b/bsd-user/qemu-bsd.h
@@ -0,0 +1,36 @@
+/*
+ *  BSD conversion extern declarations
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
+#ifndef QEMU_BSD_H
+#define QEMU_BSD_H
+
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <netinet/in.h>
+
+/* bsd-socket.c */
+abi_long target_to_host_sockaddr(struct sockaddr *addr, abi_ulong target_addr,
+        socklen_t len);
+abi_long host_to_target_sockaddr(abi_ulong target_addr, struct sockaddr *addr,
+        socklen_t len);
+abi_long target_to_host_ip_mreq(struct ip_mreqn *mreqn, abi_ulong target_addr,
+        socklen_t len);
+
+#endif /* QEMU_BSD_H */
-- 
2.40.0


