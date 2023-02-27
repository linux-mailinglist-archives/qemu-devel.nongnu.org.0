Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FE46A448C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:35:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFO-0001il-0Y; Mon, 27 Feb 2023 09:12:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeFB-0000zg-Mh
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:47 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeF9-0001MS-S7
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:45 -0500
Received: by mail-wr1-x430.google.com with SMTP id l1so3326989wry.12
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dk2Ura4QRUYq4OfGhCjuiJiTdsch+c3zilubabnaDK4=;
 b=cSQ7PfGy9Q8Zg2g0aGw0NshIQH0GRRFaSEhr3qAsnDN4bFo18+nSy9oqi3h/mXCZGb
 eF/PezzMKSEM3MixWuqFemD8Eh17AGCQh1iiApk++CfNo0PTDyP8EuyV+KwO84HZrKEC
 cpX4mWRxD019Kyx0ILhq5+vemh6OuZuAmXTNnkmBGTUWu7NUCb7gAUIlCaDOQzLa7jiG
 kC/YSeRXLgHtEy3SH3nJL7jpqfE+cf7Snf7KlvXlsRpbwZ7AogCspOT/blf9QErL48Id
 vbd26h+BEv8Go0GHy8Ul3l3eoxDaZOIFaYmlTT/X/yVQwhaW60Cu7lFzIXhcVy5Xjn2g
 gY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dk2Ura4QRUYq4OfGhCjuiJiTdsch+c3zilubabnaDK4=;
 b=2cKFlrrzgNOYWc0SrYhuqPW7W+hmVpWiQ0W4JjZM5AXfq+RXO1wLmzkXsgOJLiWswc
 jVPy6+TgA5KldG7jV0Z0SF/6cIoMUoUh04zVnUW7KOD87ZgGvwJh4t+ncjyfnwx46WFY
 d+6k4CpxJudkkiOrNyk1zR/w93PzHxinytok0ybrTP4xFpSThkg0A0JKt09misN79gAm
 +cpmEzyxD/Kkdh1/Q+yY+bUveDyFWBpe7KC0ZvRXOs17GDC9/I89ZVk7i5/2yysK1LD0
 voGiGUuQ53Lrw3CTxmzCUUYS6bJ74r00ntOx7jb2AFlPF2uE+tYD7ChSws0gJncEDBaL
 EIww==
X-Gm-Message-State: AO0yUKUvEhOydCCs/3mJ17waAVImZCbwFn7pdqT418gXKM2gK33mIStQ
 V7MZt2v5wjhhAoFj7vIVTVajGwYLVpUBFBDy
X-Google-Smtp-Source: AK7set8Vy3zAaXQxuNWOVx/jGIGtBF4/fAEaQNH2R6+ivXg5NOUQik5fZDSBWC+QZK8w/pJrvms4IQ==
X-Received: by 2002:a5d:690e:0:b0:2c7:1e52:c5a8 with SMTP id
 t14-20020a5d690e000000b002c71e52c5a8mr9151539wru.21.1677507161997; 
 Mon, 27 Feb 2023 06:12:41 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adfe590000000b002c70e60eb40sm7247590wrm.11.2023.02.27.06.12.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:12:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 125/126] dump: Add create_win_dump() stub for non-x86 targets
Date: Mon, 27 Feb 2023 15:02:12 +0100
Message-Id: <20230227140213.35084-116-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Implement the non-x86 create_win_dump(). We can remove
the last TARGET_X86_64 #ifdef'ry in dump.c, which thus
becomes target-independent. Update meson accordingly.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230225094903.53167-6-philmd@linaro.org>
---
 dump/dump.c      | 2 --
 dump/meson.build | 4 +---
 dump/win_dump.c  | 5 +++++
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index fa650980d8..544d5bce3a 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -2018,9 +2018,7 @@ static void dump_process(DumpState *s, Error **errp)
     DumpQueryResult *result = NULL;
 
     if (s->has_format && s->format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {
-#ifdef TARGET_X86_64
         create_win_dump(s, errp);
-#endif
     } else if (s->has_format && s->format != DUMP_GUEST_MEMORY_FORMAT_ELF) {
         create_kdump_vmcore(s, errp);
     } else {
diff --git a/dump/meson.build b/dump/meson.build
index f13b29a849..df52ee4268 100644
--- a/dump/meson.build
+++ b/dump/meson.build
@@ -1,4 +1,2 @@
-softmmu_ss.add(files('dump-hmp-cmds.c'))
-
-specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
+softmmu_ss.add([files('dump.c', 'dump-hmp-cmds.c'), snappy, lzo])
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('win_dump.c'))
diff --git a/dump/win_dump.c b/dump/win_dump.c
index ff9c5bd339..0152f7330a 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -487,4 +487,9 @@ bool win_dump_available(Error **errp)
     return false;
 }
 
+void create_win_dump(DumpState *s, Error **errp)
+{
+    win_dump_available(errp);
+}
+
 #endif
-- 
2.38.1


