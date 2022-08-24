Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E72A59F5CB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 10:58:08 +0200 (CEST)
Received: from localhost ([::1]:60550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmD9-0008Jd-DI
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 04:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQm7v-0003ZA-6d
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 04:52:47 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:38857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQm7t-0002ib-JC
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 04:52:42 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r22so14460608pgm.5
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 01:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=nSDkeiBJBv26GZv+Kt7q6+6QjA1tAqEVFvSC3pOL+ZU=;
 b=m0Zt3l6/JCREYj4iNEo+DH1WMo80+vnhJ3MZes6iBbWMIG/W6/PqTFD7Ln7WkMGlCd
 /OOlJt8mDdPiJdFXHTXhD1hqw03vn8wPUZxmjwxrEk4MRYH5XMsoyOBsOAJglWUQNRFt
 BFFz+/X8T5x00XDVV7QtWYFrZpsWDNbrqauXmgemsYEJkPp2XZE2saRmNP4uWyXq621Y
 qcYS3MiwsFBaNcu5L3oFqRe0KDn1FTKROLiUeKc+PlSKVho/N5K2npbzOmoCARMhE9va
 I8rV3PSMWAwu/HcS5ChvZVi8McPrcSC15dzhAg4tz8MWLoz03K4F5lG2V10kFJVhZ5hG
 opNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=nSDkeiBJBv26GZv+Kt7q6+6QjA1tAqEVFvSC3pOL+ZU=;
 b=a6V4dsBao767A/8jq394mIWKj3O5Km1/BHm6XaOnMtRxMSckFEZO8VsFIx9/6hWMNF
 hzIqkaE8GRZx/lzHwx5hanjM2jkR/kDeidYHsOd8jlNFvy21DGLoBP3SYSGWwEXsIX9G
 x2zIHkrRwUYn4fPXb6ZTDxfygrsae1XY8VnlSrBKqyVKIfBp7Foiuw/PJ6forWQZgXb8
 RD6KUK+F3oUUv0q8rsBJ6WT5n60pgvAE7aLgkQuaDkJtGIhOS6VaiiyAmk5jGmG/D8Pc
 n7zgpI41TSfjiETCf6mON27MLiloaPVl8iRUalpIEcU/T2BBbjbWLbgAGJUop8wrP1dW
 QSEg==
X-Gm-Message-State: ACgBeo0n6Iw8bBdgth4ENZDVLZmxYT2YuT+mIeRFXpSVbAd4CmtO3w2m
 4oKuYWrLpfJR9XxKPoxg6BABFjdRg/0=
X-Google-Smtp-Source: AA6agR5FcdeM5zb3+EIPUSnJ1uQLRvsbnWvS325QA+HJ1C0z3QknTEovQQeISXbPfAY44uc8vE4Srw==
X-Received: by 2002:a65:6e82:0:b0:41a:9b73:f0e6 with SMTP id
 bm2-20020a656e82000000b0041a9b73f0e6mr24089370pgb.371.1661331159215; 
 Wed, 24 Aug 2022 01:52:39 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 qi3-20020a17090b274300b001f3162e4e55sm813800pjb.35.2022.08.24.01.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 01:52:38 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 1/3] util/main-loop: Fix maximum number of wait objects for
 win32
Date: Wed, 24 Aug 2022 16:52:29 +0800
Message-Id: <20220824085231.1630804-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The maximum number of wait objects for win32 should be
MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- move the check of adding the same HANDLE twice to a separete patch

Changes in v2:
- fix the logic in qemu_add_wait_object() to avoid adding
  the same HANDLE twice

 util/main-loop.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/util/main-loop.c b/util/main-loop.c
index f00a25451b..cb018dc33c 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -363,10 +363,10 @@ void qemu_del_polling_cb(PollingFunc *func, void *opaque)
 /* Wait objects support */
 typedef struct WaitObjects {
     int num;
-    int revents[MAXIMUM_WAIT_OBJECTS + 1];
-    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
-    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS + 1];
-    void *opaque[MAXIMUM_WAIT_OBJECTS + 1];
+    int revents[MAXIMUM_WAIT_OBJECTS];
+    HANDLE events[MAXIMUM_WAIT_OBJECTS];
+    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS];
+    void *opaque[MAXIMUM_WAIT_OBJECTS];
 } WaitObjects;
 
 static WaitObjects wait_objects = {0};
@@ -395,6 +395,9 @@ void qemu_del_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
         if (w->events[i] == handle) {
             found = 1;
         }
+        if (i == MAXIMUM_WAIT_OBJECTS - 1) {
+            break;
+        }
         if (found) {
             w->events[i] = w->events[i + 1];
             w->func[i] = w->func[i + 1];
-- 
2.34.1


