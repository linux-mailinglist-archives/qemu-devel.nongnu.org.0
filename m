Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DF4506548
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:02:52 +0200 (CEST)
Received: from localhost ([::1]:56264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghsx-0000Gb-4W
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggm5-0001Bk-J4
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:47 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggm1-0004Rx-Qb
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:41 -0400
Received: by mail-wr1-x431.google.com with SMTP id b19so20893521wrh.11
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tl9QZYAXBfOO9wSADBXfX+4Z4VSezO7/iMstqBw8M9c=;
 b=BTm0GJ2uXwm6G/pu6EDAWPm4AtcUG9Xv4pgKgzkgZ3joBd90jdtJC8ki+gMWipaIOJ
 EaHzBV5snouiFr6PhohgDHX2Ptgyp3mtv7qzQRx5jRakaMaYCK91FqDM6hvcUbS8aho8
 b2Q6DTXrUACSi38wGLBO8sSq9ZEweLeIHm478qNUG8z4xNFx9/JhNy7cb+oBnrZd9Pzb
 +amWZzCFPsMHMt8Ci80Z+8ktR72Icn9NHVPUkKqHChiI72a4Mg0UL5d8Z4U4Dxs7IJzi
 0zzerRmeccmDpdYFvgOKY//+K1r6fSVy7lCl3Uh1GTq7svDa/LT24ijfXhTPlm7GHSgr
 lDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Tl9QZYAXBfOO9wSADBXfX+4Z4VSezO7/iMstqBw8M9c=;
 b=HyXMDMoGBqgxpQMWbccjgOnRpvmeN88SmSW8P8QY7gvCwsbROSMp8S88ktBZv0LyR1
 9LxSXhloocKfbwkJRAlPX1MtvC1P4e8pjl5q/imrLbSK+T99iANHw+WQ1ftduvJOGiUl
 AmCVjPjkWqeYaP/2p/71rEJciPM+/cATruCmiE7D2WSSZpAjLw/z3YD/yeILOPZEbvVR
 7uF31lFO8iie5We0LMjo1G6qBeRd2Odbla1DQTDNuyNC6P4txVTeK9sQhR49jW/GSvnd
 BEW26pOYPEHzmlUgUawR5WZgpVmbn0lOAb2QuWNvI24mnvgqyYI0l2FbBBKvvqSVvSUX
 DACA==
X-Gm-Message-State: AOAM5312YkkSDF23AerDfFWzZY2sZ/j6zJJ5AFA/SzB7dqN8vmImLbqE
 EVjTaNmm16xJVKbqNWQH/bbvBtoSFZstMA==
X-Google-Smtp-Source: ABdhPJzM80Vh1rEq5OspL8muq8b9CI8Y3Vv3LCHCqqIrQUTIXUD5q2mGknevPhcqPn7MSjjkef0dLQ==
X-Received: by 2002:adf:e189:0:b0:207:a0e8:be49 with SMTP id
 az9-20020adfe189000000b00207a0e8be49mr10463261wrb.130.1650347494091; 
 Mon, 18 Apr 2022 22:51:34 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/53] include: move os_*() to os-foo.h
Date: Tue, 19 Apr 2022 07:50:47 +0200
Message-Id: <20220419055109.142788-32-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

For consistency with other os_ functions that do not have POSIX
implementation, declare an inline function for the stub in os-win32.h.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-27-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu-common.h     | 4 ----
 include/sysemu/os-posix.h | 2 ++
 include/sysemu/os-win32.h | 4 +++-
 os-win32.c                | 9 ---------
 4 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 1fbc20e4bc..a271cac66a 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -24,10 +24,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-/* OS specific functions */
-void os_setup_early_signal_handling(void);
-int os_parse_cmd_args(int index, const char *optarg);
-
 void page_size_init(void);
 
 #endif
diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index 23bd45457d..58de7c994d 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -42,7 +42,9 @@
 extern "C" {
 #endif
 
+int os_parse_cmd_args(int index, const char *optarg);
 void os_set_line_buffering(void);
+void os_setup_early_signal_handling(void);
 void os_set_proc_name(const char *s);
 void os_setup_signal_handling(void);
 void os_daemonize(void);
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 1351d1d29e..3c74a78e33 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -62,8 +62,10 @@ struct tm *localtime_r(const time_t *timep, struct tm *result);
 static inline void os_setup_signal_handling(void) {}
 static inline void os_daemonize(void) {}
 static inline void os_setup_post(void) {}
-void os_set_line_buffering(void);
 static inline void os_set_proc_name(const char *dummy) {}
+static inline int os_parse_cmd_args(int index, const char *optarg) { return -1; }
+void os_set_line_buffering(void);
+void os_setup_early_signal_handling(void);
 
 int getpagesize(void);
 
diff --git a/os-win32.c b/os-win32.c
index e31c921983..6f21b57841 100644
--- a/os-win32.c
+++ b/os-win32.c
@@ -61,12 +61,3 @@ void os_set_line_buffering(void)
     setbuf(stdout, NULL);
     setbuf(stderr, NULL);
 }
-
-/*
- * Parse OS specific command line options.
- * return 0 if option handled, -1 otherwise
- */
-int os_parse_cmd_args(int index, const char *optarg)
-{
-    return -1;
-}
-- 
2.35.1



