Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCC93BADF5
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 19:10:51 +0200 (CEST)
Received: from localhost ([::1]:47872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m05dq-0007pO-6l
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 13:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m05b8-0001bm-Dh
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:08:03 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:44022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m05b6-00075x-RA
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:08:02 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so9709560wmc.2
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yyWwCax0ANqlJGd1zXixJ2cUF3+/K6etOqORQ4aXV8U=;
 b=aeU0Z+yQ2vF+2c0yQ9+eQOmSVtTyMgmY8k3BuBR2Bk5iMa4Mx8X5przc0MRLTmIWlC
 cjuEepluYpVJsMgkkIW9QA9Fvz8k3hYqpI9Q8/kZWeL9rZf1Gj6yjZj8mQy/1FX7koVZ
 qUQPtd4nsOLZnTo+obFGCb5iIg8DdM8dHp3eyuz/WEyxYwxeTuJqynDz+k7FTSKR2lyO
 7KqjN4QbV8X7r4w7tkiw64VpFSWnKcHTkUGaQ3A2c718yTt16dNQ4xlXrKVApj4Pr4Ad
 +fozsVvCgFgwnV2L+bCVA4rAXruAMXFbG7dE+bS9akvy72ceqNb2yyF/06yMLoGwMulz
 AWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yyWwCax0ANqlJGd1zXixJ2cUF3+/K6etOqORQ4aXV8U=;
 b=laFJLaZ0sItda1Ntn00qCMy02c08CrOecduB+1dpMMF821KZPqJ0tdf7kAnhedTtPT
 S8OUPI3Y5agWKwaLCcReAqQ8JHGEI6/hZsu5zIl/ESgocUVn9c2usGysQwY2E7B23j8o
 g7kWXYVVGSWmd8/cvJ4Ib6Wzo2YqBcbZddjaKUe8iTCA5hhY/lVP0DTL7Uguhz9EAw/I
 FSGOgPwSgxCBmdMy7LDSAqnR/ZSZsU+tMc5c98xS/0xQPiZBBIPFpoCMu0BoyRrdFKFL
 dTg6nEb5m7MuEgq/YbgJ2/h9W5pYS2LN5a1T0KAVO+6go1RADwb+MIKpMaQY4ZwaDxiH
 aEJA==
X-Gm-Message-State: AOAM531B9A8upmvYLIvzpDTB3un7zivWkGjgT7rUwgeWT79oh7UXW4Fr
 a9wpi+Nb6WK3VGVi80KjWz0kNOSB8II=
X-Google-Smtp-Source: ABdhPJy41eC8tESwBe33SkgLlDoUIpijiW+vIfquwxNtJocc+eqY/9PfnvnwcJmNMQGJ2QtPYeu+Fw==
X-Received: by 2002:a05:600c:3783:: with SMTP id
 o3mr10707524wmr.123.1625418479082; 
 Sun, 04 Jul 2021 10:07:59 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e8sm10422670wrq.10.2021.07.04.10.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 10:07:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/mips: Complete UHI errno list and log unexpected
 errors
Date: Sun,  4 Jul 2021 19:07:36 +0200
Message-Id: <20210704170736.617895-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210704170736.617895-1-f4bug@amsat.org>
References: <20210704170736.617895-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Zak <richard.j.zak@gmail.com>, Leon Alrae <leon.alrae@imgtec.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The spec only defines a set of host errno to translate to guest.
Complete the current errno set, and log unexpected errno (they
are currently replaced by EINVAL, which is dubious, but we don't
modify this).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 3e91c9eb76c..6e6518dd626 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -100,10 +100,46 @@ static void uhi_errno_init(void)
      * Unified Hosting Interface (rev 1.1.6)
      * Appendix A. "Error values"
      */
+    uhi_errno_insert(EPERM,         1);
+    uhi_errno_insert(ENOENT,        2);
+    uhi_errno_insert(EINTR,         4);
+    uhi_errno_insert(EIO,           5);
+    uhi_errno_insert(ENXIO,         6);
+    uhi_errno_insert(EBADF,         9);
+    uhi_errno_insert(EAGAIN,        11);
+    uhi_errno_insert(EWOULDBLOCK,   11);
+    uhi_errno_insert(ENOMEM,        12);
+    uhi_errno_insert(EACCES,        13);
+    uhi_errno_insert(EBUSY,         16);
+    uhi_errno_insert(EEXIST,        17);
+    uhi_errno_insert(EXDEV,         18);
+    uhi_errno_insert(ENOTDIR,       20);
+    uhi_errno_insert(EISDIR,        21);
+    uhi_errno_insert(EINVAL,        22);
+    uhi_errno_insert(ENFILE,        23);
+    uhi_errno_insert(EMFILE,        24);
+#ifdef ETXTBSY
+    uhi_errno_insert(ETXTBSY,       26);
+#endif
+    uhi_errno_insert(EFBIG,         27);
+    uhi_errno_insert(ENOSPC,        28);
+    uhi_errno_insert(ESPIPE,        29);
+    uhi_errno_insert(EROFS,         30);
+    uhi_errno_insert(EMLINK,        31);
+    uhi_errno_insert(EPIPE,         32);
+    uhi_errno_insert(ERANGE,        34);
+    uhi_errno_insert(ENOSR,         63);
+    uhi_errno_insert(EBADMSG,       77);
     uhi_errno_insert(ENAMETOOLONG,  91);
 #ifdef ELOOP
     uhi_errno_insert(ELOOP,         92);
 #endif
+    uhi_errno_insert(ECONNRESET,    104);
+    uhi_errno_insert(ENOBUFS,       105);
+    uhi_errno_insert(ENETUNREACH,   114);
+    uhi_errno_insert(ENETDOWN,      115);
+    uhi_errno_insert(ETIMEDOUT,     116);
+    uhi_errno_insert(ENOTCONN,      128);
 #ifdef EOVERFLOW
     uhi_errno_insert(EOVERFLOW,     139);
 #endif
@@ -126,6 +162,8 @@ static int errno_mips(int host_errno)
                                      NULL, &uhi_errno)) {
         return GPOINTER_TO_INT(uhi_errno);
     }
+    qemu_log("semihosting: Illegal UHI errno: %d\n", host_errno);
+
     return EINVAL; /* Not reachable per the specification */
 }
 
-- 
2.31.1


