Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B791336A21F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:31:55 +0200 (CEST)
Received: from localhost ([::1]:42838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLCE-0001nm-Qu
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKij-0005pM-2d
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:25 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:44872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiK-0004K1-V0
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:24 -0400
Received: by mail-il1-x12c.google.com with SMTP id i22so393257ila.11
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S9w7CJ0+MJpr5zL1Lbw3l/YeW43hAWDuCaPwKLYTrT8=;
 b=I2hJ3TSb9UL97rgTQrLQ3HLY1ysw+Jm2GxiGqQY7lCB0BMjGy8N82/4JpM19CBiKXh
 fEPqlJ2Ql7n5j0haA4blaDZyNUK2CxSebVo+PyVdsCq1D4e83zhvrsz1byv9khwRd7BS
 Yh/38FWE4lqbM+Kc/bTptOhToW7ou4eXeLj+U8Y1ZaAHgwFmrPvpcDDpTDgHuWBb0Rdz
 GGj77VLACYpZeMPcYXZboQ2SqBsFaPaDrTv3Qlh7PEbnKjGpqJhIRGJqyCAFJFJ2+p2D
 BTmSMkaUHSm5GrDDYhWPhNuwesVQiKZ5XIxi8A+r67wmdeH8Osctrxo+xuHqBQve/YXE
 x0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S9w7CJ0+MJpr5zL1Lbw3l/YeW43hAWDuCaPwKLYTrT8=;
 b=M5zrOdyAGrhUO/9vcalFIKWE5wbjRH74YMbyRPZgaurj/JAeQjCBr1drEJehj6LGu2
 64tcrO8AMpc0cw4AVdT8yI5bv7pIReClufSHcl/OWO7qMnM6CARwJoHGWWZFw7z/+NtN
 P6SGkFtxaxZEMegVie6O7cfhPvg8iQjgs+ScOdOljAatexJUFT/YtXGwa7NeNxzoQQtX
 RJJFbpKqQ6gKOOdlO0OFB4FDJVTUdj3m192yGu4CkvHn52+v4AZZqy39/h/QtaWi3YfL
 mwttpbF/UEqfVQg+GNfRJOC23u3XR0acx+IHiNxy+d7oDnT50Id3lETO/knSFsARoOzh
 zC9g==
X-Gm-Message-State: AOAM5319AXFJ6NIxnVpfeAShsdYZbb8aKtKNI8oUOkmZfgGlJsCyiP19
 kN9W1PA0APgq9h8EjMtHhYQRi1NImM0Dlziv
X-Google-Smtp-Source: ABdhPJyvid7tQZbl2jpWGIXYMonTvuFx9WmpFj+mmw7ot2gHzzT5PK9+OPhbvqGBFyFi2coh8RtzeQ==
X-Received: by 2002:a05:6e02:5a2:: with SMTP id
 k2mr7315462ils.177.1619280057761; 
 Sat, 24 Apr 2021 09:00:57 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:57 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 37/48] bsd-user: style tweak: don't assign in if statements
Date: Sat, 24 Apr 2021 10:00:05 -0600
Message-Id: <20210424160016.15200-38-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/uaccess.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/bsd-user/uaccess.c b/bsd-user/uaccess.c
index 7eb4546fed..aab5e995a9 100644
--- a/bsd-user/uaccess.c
+++ b/bsd-user/uaccess.c
@@ -14,7 +14,8 @@ abi_long copy_from_user(void *hptr, abi_ulong gaddr, size_t len)
     abi_long ret = 0;
     void *ghptr;
 
-    if ((ghptr = lock_user(VERIFY_READ, gaddr, len, 1))) {
+    ghptr = lock_user(VERIFY_READ, gaddr, len, 1);
+    if (ghptr) {
         memcpy(hptr, ghptr, len);
         unlock_user(ghptr, gaddr, 0);
     } else
@@ -29,7 +30,8 @@ abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len)
     abi_long ret = 0;
     void *ghptr;
 
-    if ((ghptr = lock_user(VERIFY_WRITE, gaddr, len, 0))) {
+    ghptr = lock_user(VERIFY_WRITE, gaddr, len, 0);
+    if (ghptr) {
         memcpy(ghptr, hptr, len);
         unlock_user(ghptr, gaddr, len);
     } else
-- 
2.22.1


