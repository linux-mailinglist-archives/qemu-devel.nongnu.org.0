Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087AE25E5D4
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Sep 2020 08:28:15 +0200 (CEST)
Received: from localhost ([::1]:40010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kERgM-0004em-43
	for lists+qemu-devel@lfdr.de; Sat, 05 Sep 2020 02:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kERcX-0007Au-Sk; Sat, 05 Sep 2020 02:24:17 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kERcV-0003YB-JG; Sat, 05 Sep 2020 02:24:17 -0400
Received: by mail-pl1-x643.google.com with SMTP id x18so2126637pll.6;
 Fri, 04 Sep 2020 23:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XFEZh3+xvAfqz2f0h/nVnmxCipA8eA9k8U4UHOk894U=;
 b=KpYLphlucvzJhRb09Aq11w7D+uhL+xrFv0qXRROlO5AjZILWVqtv3jXXsOCRT/Q6sb
 vlLWsT1JHSxgT6RbO/0986GgRPZM+kbzfRd4PONkz70ZU3TIqISDU2VoRc4g2WQmTRek
 j4YqEM39pCj0jdaU6dU52SMFvguP9UDdBb/0wWZId4XNnUJuisoo++edEsseUFLBOOp4
 aWVwQyRVVwUNkmHm8fkJYh8N9c/LCmEHBa5Gh6NyYrFQOWF8vijjSZR1SdmI5fBPhLp1
 5AUpbhEIa5FuixwfMfOefC1r92gNNchvr5NpmT/Pvebgt/fyzDI32umS0SJIb4NGNTN4
 /pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XFEZh3+xvAfqz2f0h/nVnmxCipA8eA9k8U4UHOk894U=;
 b=F9Lwe70JhwFKktCiLbQ512htBu5Fx6+3hIOyPEyX4vCrN4dxm96RtCdr2arWRob3mD
 vbDjO6R8hePxvih2mgUvu+oCjJKCZZAJexP5mVcQX7HafScYOiIGJAP+ODl03RFU31sK
 MfIGOVYvZm6U104H8g7NibJ6JwYJ3Ihxy1hH2QGfcXCL6TlrYkYEDveuvOoyv+PVSHlX
 MFwQXB1hXCButBz9cF3rHqwq7ZOPumUTIuDUdAROuhiUgCtruZdst+6CmSmwi9AA0UXY
 OLkYT2ULUTSsQz5HF34tknP7zdY9HWXKD9ceXv5E1DR+cVShGKt1jhhLtWQt+uN5yOTU
 QV+g==
X-Gm-Message-State: AOAM5324kthadKZ1mUsEceOeUjpNawMYMEYIGXbfBbsIUetMvLC0Fn8j
 4amvLJYRZ0EMYyL/edwTxskLHsNoQop3Wurr
X-Google-Smtp-Source: ABdhPJx4HEWl37FH1mRyVREEasvM88+bDyjtTp5Nsf1QqlVPKU4c4s6ejy13JEgM3QMSbfBqaBheeQ==
X-Received: by 2002:a17:902:d88e:b029:d0:89f4:6222 with SMTP id
 b14-20020a170902d88eb02900d089f46222mr10534156plz.10.1599287053050; 
 Fri, 04 Sep 2020 23:24:13 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id v8sm21436381pju.1.2020.09.04.23.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 23:24:12 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/11] osdep: These function are only available on
 Non-Win32 system.
Date: Sat,  5 Sep 2020 14:23:30 +0800
Message-Id: <20200905062333.1087-9-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200905062333.1087-1-luoyonggang@gmail.com>
References: <20200905062333.1087-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Block <qemu-block@nongnu.org>,
 Stefan Weil <sw@weilnetz.de>, Peter Lieven <pl@kamp.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
int qemu_unlock_fd(int fd, int64_t start, int64_t len);
int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
bool qemu_has_ofd_lock(void);

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/osdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 412962d91a..e80fddd1e8 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -502,11 +502,11 @@ int qemu_close(int fd);
 int qemu_unlink(const char *name);
 #ifndef _WIN32
 int qemu_dup(int fd);
-#endif
 int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
 int qemu_unlock_fd(int fd, int64_t start, int64_t len);
 int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
 bool qemu_has_ofd_lock(void);
+#endif
 
 #if defined(__HAIKU__) && defined(__i386__)
 #define FMT_pid "%ld"
-- 
2.28.0.windows.1


