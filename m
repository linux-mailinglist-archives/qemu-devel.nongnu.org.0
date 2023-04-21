Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386946EA314
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 07:25:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppjFw-0003XT-Dp; Fri, 21 Apr 2023 01:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFu-0003XK-Le
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:24:22 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFt-0001gR-5W
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:24:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f09b4a156eso8898055e9.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 22:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682054659; x=1684646659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HMO9TEZM3Xt0KDf/UGCR9bNy+ZZ32hC0ReB2Tzx5JtQ=;
 b=B5favXl1Y4fTeRKXDRyOW95QbAn0NFBzONugggOChqbKtKhB+oUpzeIvGZgDRooKEa
 622ZTClMgiGoaMsLfc4OJjxFETkFuS7Yu4wjRl/TKhmo49Z3fwoR3xjRMSZlcBS8sL4m
 RPU9Q+fPXNxXnYU9GNzI3cutrQ7HqYfan1V9ae6mMvLeUw8308/BiDU17B8kN31AYr6a
 GjRsBBwPOyLNilvIkoiwLni79FZrkFyvQj4/WWr5De/UqEQxiYeCRdzdS/j4ebver1fw
 T+fQgbLySDHu81kLkzEpVHEagZVsE1SMAWJqy+5/IgCFwSI4gsvg3mNAV2qbqZ3t6UKn
 re/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682054659; x=1684646659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HMO9TEZM3Xt0KDf/UGCR9bNy+ZZ32hC0ReB2Tzx5JtQ=;
 b=aO85/eQaXmDcTwnC2DxbdDaBD/nuNr2sZttgZTwdyVFPLkb2fcPTm/dRarntGct5Yq
 6csBGsF1EZWDCCF3aQW5OmvrZm2BGNunNxc5XV6o+DDJo2Ym44yWz04tFYN0r6vLVByz
 2oNuBbFJDMyIzOEJcyJGOrm97belaeFMxa27jn/lHGbY8N8lNld0hAVtQyC8ksEyU9KR
 aOuXF8dkEJtTrPdtUnk6rVj0NHp6efnAJLitYtK9wEQgALXHLq/Wp3+sSDkKlUpPSL0r
 h2xHnVD/+kjBHNP0qfHsYCbatrBwGs5cbqC6OExzV4IUj6afQHzax9T4sSV5j32hAh5t
 9E4w==
X-Gm-Message-State: AAQBX9cH9yVls2rf1czIppY4rQK2dQJ2kf6Iqa/5e9yAKqUPqWGbZ9FE
 W0i8iCklBcZC0VDKNZ01VIabEJVTvig=
X-Google-Smtp-Source: AKy350aLwvwUzflPRrw6Z6ofxmTLjimvZr+ebG+4iQjknZgSqaSZEMYAyHEtIsvzEAhry5Fe5nQqCg==
X-Received: by 2002:a5d:6206:0:b0:2f5:7fcf:4d9c with SMTP id
 y6-20020a5d6206000000b002f57fcf4d9cmr2516537wru.18.1682054659411; 
 Thu, 20 Apr 2023 22:24:19 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a7bc3cd000000b003f173c566b5sm3813475wmj.5.2023.04.20.22.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 22:24:19 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
X-Google-Original-From: Karim Taha <krm.taha@outlook.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 08/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 07:22:52 +0200
Message-Id: <20230421052255.5603-9-krm.taha@outlook.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421052255.5603-1-krm.taha@outlook.com>
References: <20230421052255.5603-1-krm.taha@outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x32e.google.com
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

added the connect(2) syscall to bsd-user/bsd-socket.h.
---
 bsd-user/bsd-socket.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/bsd-user/bsd-socket.h b/bsd-user/bsd-socket.h
index 7da4cf11a0..f191f22d63 100644
--- a/bsd-user/bsd-socket.h
+++ b/bsd-user/bsd-socket.h
@@ -58,4 +58,25 @@ static inline abi_long do_bsd_bind(int sockfd, abi_ulong target_addr,
     return get_errno(bind(sockfd, addr, addrlen));
 }
 
+/* connect(2) */
+static inline abi_long do_bsd_connect(int sockfd, abi_ulong target_addr,
+                                      socklen_t addrlen)
+{
+    abi_long ret;
+    void *addr;
+
+    if ((int)addrlen < 0) {
+        return -TARGET_EINVAL;
+    }
+    addr = alloca(addrlen + 1);
+
+    ret = target_to_host_sockaddr(addr, target_addr, addrlen);
+
+    if (is_error(ret)) {
+        return ret;
+    }
+
+    return get_errno(connect(sockfd, addr, addrlen));
+}
+
 #endif /* BSD_SOCKET_H */
-- 
2.40.0


