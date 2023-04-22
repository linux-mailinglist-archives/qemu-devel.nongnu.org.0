Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8436EBAB1
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 19:30:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqH2c-0006wE-BY; Sat, 22 Apr 2023 13:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itachis6234@gmail.com>)
 id 1pqFy0-00023l-9B
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 12:20:04 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itachis6234@gmail.com>)
 id 1pqFxx-0007Hu-1l
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 12:20:03 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-63f273b219eso713900b3a.1
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 09:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682180399; x=1684772399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KoCP+9WwtWsdfQgiwJlHFCougdvA0L39h6Ol8wVVnj8=;
 b=cDIOm5saxJrc+/tlYgiXYkODl5DY5S4BgTIcffQrySNqknkcTxfoZHi3QsLgRIqJs3
 Wv4sfGdEbBuKRUGijSiGtAfBIcOKwH8h/4vVaJEjhSRmW1RbQ02ExzzaLKqbcmh3NGGI
 KZLRzQame+EyBEhBIfEJ0w7WYlve/0/UFhp5R7QP+R3/aPpSedVc5rtgA1RAMHoF310e
 ehg0zxpIEsP/4UO4BvNRNQ3spA7yn3oN2rTLycOvqjoJzyGr+OCTVil84dnalTpG4mcI
 Y+i4xYaUFWhzykM18Yu6/Aq3a7R8VB0J6NmJq+yDYQo9xnh2b30IwSYWS0n3F0Nf4lPO
 egVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682180399; x=1684772399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KoCP+9WwtWsdfQgiwJlHFCougdvA0L39h6Ol8wVVnj8=;
 b=aOI+Tx4MvQVUvHQFsK0Oj7ZwvG/gN+0EbJheIIJwbF/80x1G7LFv9Ia9DjTjEQvgr/
 0EEWsTLoXOPCnYRThEn2epCSLLS2pOW4lGt/k7cjC+jlsYKgOGlKgy6Brk2cMPQZFmLc
 vXo0PAlFFrOQ31Ss4fKamnhsr3F1k3AWBLQFdwvyHfo8kxJQobmw/18riP6/FYqROVtI
 r/MbxI8e7qEUOwyfCuL+gAeNuz7nIJ5z1jjzlFoddThgJRvjDTub1uAnSJ0fDfjckfsJ
 6/NcSgbrUMDS5Mq9c1qjTJ6xz4QYLwHBNITleJxZ0kPjwgBJAoJhW9gs2FyhQOMgOjVe
 bUDA==
X-Gm-Message-State: AAQBX9dSOWRTzGVufS85avHw0u/BRLBBoIOFI95hbxtFvAAcrkjURMFh
 PIFNacHzHOVsy01/f9n6upg=
X-Google-Smtp-Source: AKy350ZP2816kRnqZGIzRFSjEnKz6X3Gdy6oelw23rBaMA49qJO9PA4B+Ubu0q4fRnhOpd1tcJ9Q/A==
X-Received: by 2002:a05:6a00:1801:b0:638:edbc:74ca with SMTP id
 y1-20020a056a00180100b00638edbc74camr13114362pfa.0.1682180399603; 
 Sat, 22 Apr 2023 09:19:59 -0700 (PDT)
Received: from apple.localdomain ([182.65.27.4])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a655b8e000000b0051f14839bf3sm4241667pgr.34.2023.04.22.09.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 09:19:59 -0700 (PDT)
From: Ajeets6 <itachis6234@gmail.com>
To: itachis6234@gmail.com,
	qemu-devel@nongnu.org
Cc: imp@bsdimp.com
Subject: [PATCH 7/7] Added safe_syscalls for time functions.
Date: Sat, 22 Apr 2023 21:49:34 +0530
Message-Id: <20230422161934.2311-7-itachis6234@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230422161934.2311-1-itachis6234@gmail.com>
References: <20230422161934.2311-1-itachis6234@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=itachis6234@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 22 Apr 2023 13:28:49 -0400
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

From: Warner Losh <imp@bsdimp.com>

+Added safe_syscalls

Signed-off-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Ajeets6 <itachis6234@gmail.com>
---
 bsd-user/freebsd/os-syscall.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 8fd6eb05cb..3d56aff0fd 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -49,6 +49,16 @@
 /* *BSD dependent syscall shims */
 #include "os-time.h"
 
+/* used in os-time */
+safe_syscall2(int, nanosleep, const struct timespec *, rqtp, struct timespec *,
+    rmtp);
+safe_syscall4(int, clock_nanosleep, clockid_t, clock_id, int, flags,
+    const struct timespec *, rqtp, struct timespec *, rmtp);
+
+safe_syscall6(int, kevent, int, kq, const struct kevent *, changelist,
+    int, nchanges, struct kevent *, eventlist, int, nevents,
+    const struct timespec *, timeout);
+    
 /* I/O */
 safe_syscall3(int, open, const char *, path, int, flags, mode_t, mode);
 safe_syscall4(int, openat, int, fd, const char *, path, int, flags, mode_t,
-- 
2.34.1


