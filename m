Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A29E6EAF6B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:44:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptqn-0005BV-Up; Fri, 21 Apr 2023 12:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptqm-0005B9-DE
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:08 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptqk-00036o-Nz
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:08 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so16558255e9.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682095385; x=1684687385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k2Um5wgBWBpl0Ohqwu5qkKXb0EUjSh7ibG2/yRb/lxc=;
 b=qJDVelWNfh+Jq38fI5PGljlnxUjBy+kcf/KHFGZlijOD1Vkw0W8SEIAFv2zOMbJ/VB
 nHtgTYogRx4etwRUKpdLCJOFB8in0L8h2+nFh9E0vUYlANkJ5wbeMQ0tHKEUaodEpq6k
 XH45M50sdh3DCpikcen5erLNspWEoenP8chmaGgJEDYLRVDY7xUMEHZ0fQWH3JucXggF
 zCfFydEIeFnrQHPqigdQJk6XqEo0zqx6FI9aEoQgnxHzHHW5QdUYTA8se5p2ugT98mdx
 VFyehMRYbMeMG4lT3m6mm6RnVarlxC20iOemw6OhcsUMArYuv6rQ6excL0UDttIZW/94
 Ja3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095385; x=1684687385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k2Um5wgBWBpl0Ohqwu5qkKXb0EUjSh7ibG2/yRb/lxc=;
 b=UTYzfNN7x+2WNtBQ7hQD10FqrZclEaKAY/Bvr7YoIokm9GyRjsIXf9skDaCQ5AXC4X
 hRFDdEYNfXD2wQDpQMnBEPOktkAwh81Qsy4AsjxKI7Rc6EAO+znZMJ2Gnptv0RTwBm+O
 N9e2hkS/uTfTopcxwRP8OCDUiAwggzXWWtiDPXobaD++uTaCEo/qUbjt8O9IG0VE32Zn
 RZSN2hd8qlrsU94+0lmCUQUEj5BLpkNZAX5Fcf1T9WoZJoCJy0qMXkvNae1mywAbX/4m
 9cVbu/tjC0SLhuYdTGrDxWjiivK7nGlrlmHGjzZKwvXvOcrNIMu9Fg1NVA30+asDLbkj
 3tAw==
X-Gm-Message-State: AAQBX9e1JjmmJx1L+Q9wLBPVF9bOg2nkhhEFuP5+y73YhaQzHfuqwCsI
 gpEU5u+RhVQ2oY7P6+GT1166dTNhojs=
X-Google-Smtp-Source: AKy350atCX7mEHfzip+veB8+YCL9AR6nEBKN7eNUrDB6kvUGejhaWD5pXkqaZ3UFzZnpBlPqFO/L7Q==
X-Received: by 2002:a5d:6789:0:b0:2ef:e73d:605d with SMTP id
 v9-20020a5d6789000000b002efe73d605dmr7637193wru.30.1682095385420; 
 Fri, 21 Apr 2023 09:43:05 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm5266658wml.11.2023.04.21.09.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:43:05 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Stacey Son <sson@FreeBSD.org>,
 Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v3 04/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:41:53 +0200
Message-Id: <20230421164200.2913-5-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
References: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x329.google.com
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

Declaration of the socket conversion functions.

Add bsd-user/qemu-bsd.h, required by bsd-user/bsd-socket.h, contains
forward declarations of the socket conversion functions defined in bsd-user/bsd-socket.c.

Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
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


