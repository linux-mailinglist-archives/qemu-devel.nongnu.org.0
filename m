Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C119A8EE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 11:52:42 +0200 (CEST)
Received: from localhost ([::1]:57310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJa37-0003qA-Tu
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 05:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38459)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jJZym-0004L1-4T
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 05:48:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jJZyl-0002CR-2W
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 05:48:12 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:39524)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jJZyk-0002C7-Sj
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 05:48:11 -0400
Received: by mail-wm1-x333.google.com with SMTP id e9so6423010wme.4
 for <qemu-devel@nongnu.org>; Wed, 01 Apr 2020 02:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IiHiPfqSf5RxTYVWG0ZPN64iJbsFrXxtKKLhTgnCXm4=;
 b=o4vYVVwe2EC92JvUXX3NUKM4/28QtjdplV4no0lfxCgy5M98elsMbsK8YZ5zMP/yfg
 joliNWhm17CbcgQB4JIY1CnM4Hj1r2DN0KOsKsDu3aS8NPQOItWNXuNSYXjvo1wJGvC8
 Or+nm2PfUhzOgJZTbX/UVTtEBdBAGmWLgdwrIW9Yz42054i+5snn/YVHmcGMvYfXJhay
 peXWQF4v4cnMaPK2BPoZZc2ElSvndfyGiBguuQ+Y7KJQOxst+ZqAvbyU+tGX7dgjwTq+
 Um2ZdyxuJHYOSef5AFF9yHm92WKrg7ubRZqQD2Lbct1jsYKouhOg8ItPN8cMiE0rxr7J
 qTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IiHiPfqSf5RxTYVWG0ZPN64iJbsFrXxtKKLhTgnCXm4=;
 b=Dev5vlF7YWbb9xryKrwab7PCK9eZ6QdWvgf2wjcvoMAUN+m0wAL2O4xbACVadlJKfe
 0DEmb7xfPtc57WhtNqqopCX2yHvO723vnF8dT+tv6bN5rOK0Xd69uPxjNqmEWZyRJyGm
 NrD/PWP+idx18ARUUcfH7WVOLHT4z2QrSUxqjcv8nF7slYIPfxp4hyNN5t1UZeLhBhXe
 0uxtoFwswIQaI0QoerCusRz1otQ1l/NeikWwFIVyefeUCT1Kpbc9hLxGYFZPJoKu7p9k
 /Xfp78HpyK/u3wHAfU9BoGRYkkEnBeqXkPYuXUPBb2QFvrcj3JcQeM4+nD2lDadeObFp
 MknQ==
X-Gm-Message-State: AGi0PuYRtMGt09l8kmXN9EjyIfxKQCY3NC/C4Ic2sZiIvN9U8o5C4zdn
 /bH0Ktgp6i+OvFi9GIL8mkxWYg==
X-Google-Smtp-Source: APiQypL3qT/ng4H8zsPoTm92t2srUtNHi9cg41Gzg+vNwft4IeWldnuE01wCzh7dbRLCePxvRh16yw==
X-Received: by 2002:a1c:8193:: with SMTP id c141mr3330040wmd.14.1585734489788; 
 Wed, 01 Apr 2020 02:48:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o9sm2184644wrx.48.2020.04.01.02.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 02:48:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 09BC91FF92;
 Wed,  1 Apr 2020 10:48:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 06/10] gdbstub: fix compiler complaining
Date: Wed,  1 Apr 2020 10:47:55 +0100
Message-Id: <20200401094759.5835-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200401094759.5835-1-alex.bennee@linaro.org>
References: <20200401094759.5835-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::333
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Denis Plotnikov <dplotnikov@virtuozzo.com>,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Denis Plotnikov <dplotnikov@virtuozzo.com>

    ./gdbstub.c: In function ‘handle_query_thread_extra’:
        /usr/include/glib-2.0/glib/glib-autocleanups.h:28:10:
    error: ‘cpu_name’ may be used uninitialized in this function
    [-Werror=maybe-uninitialized]
        g_free (*pp);
               ^
    ./gdbstub.c:2063:26: note: ‘cpu_name’ was declared here
        g_autofree char *cpu_name;
                         ^
    cc1: all warnings being treated as errors

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
Message-Id: <20200326151407.25046-1-dplotnikov@virtuozzo.com>
Reported-by: Euler Robot <euler.robot@huawei.com>
Reported-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 013fb1ac0f1..171e1509509 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2060,8 +2060,8 @@ static void handle_query_thread_extra(GdbCmdContext *gdb_ctx, void *user_ctx)
         /* Print the CPU model and name in multiprocess mode */
         ObjectClass *oc = object_get_class(OBJECT(cpu));
         const char *cpu_model = object_class_get_name(oc);
-        g_autofree char *cpu_name;
-        cpu_name  = object_get_canonical_path_component(OBJECT(cpu));
+        g_autofree char *cpu_name =
+            object_get_canonical_path_component(OBJECT(cpu));
         g_string_printf(rs, "%s %s [%s]", cpu_model, cpu_name,
                         cpu->halted ? "halted " : "running");
     } else {
-- 
2.20.1


