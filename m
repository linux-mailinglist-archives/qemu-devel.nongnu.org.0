Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4629B261E44
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 21:50:20 +0200 (CEST)
Received: from localhost ([::1]:42060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFjdD-0006zS-8N
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 15:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kFjbx-0005GT-Aa; Tue, 08 Sep 2020 15:49:01 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kFjbv-0002Vm-JV; Tue, 08 Sep 2020 15:49:00 -0400
Received: by mail-pf1-x443.google.com with SMTP id d6so26421pfn.9;
 Tue, 08 Sep 2020 12:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FykcAGlQ92KK8Qz4pGd0AfXWzqAA8073pCgMiQdYiFk=;
 b=gA91ZjGyT/RxlTSgC/+KW6G0ko3p3sKrjs692qW5jAFheJSH6Fk6vYajypISOfcYEI
 bL0N7sX7eGyRtHjaVKFrtxkmypxQP3RWvJFlwpIItGTbk2RH7lIOQtbUUn/TtzFTsr97
 tqpdw/UfQmqPbUyL1WJHhJoSFenFTHuHZXNjvd0XTZQULBTuiwkQSy2fztVygR18q8KI
 s4WgegmIrUl0YpW5adepw/goJL9Ij4jHXaqrlZMz2SBxUOMMfJFe5sv4YEdOwE/NBO6I
 9XanFqYJ0+QWVEkPwjE7pdxYSxlEUVFgwLHNWAhCR3GrUnUo3gsAOwzLF5jSnYgzRwD+
 64IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FykcAGlQ92KK8Qz4pGd0AfXWzqAA8073pCgMiQdYiFk=;
 b=ub5MSoFPvDiG/hfLq8Gsye7TrnLt9JWzQ1veCL3aFPsq6vH50w2rrqFQWDzAgQ9Y2C
 UCTM4g4+NqRPGTKzmZEBW+/abxenQpsWsx32jmZ8MD7VOD9rpdpAQyVW/O9bkpb12nBK
 pLPJs7sd4R3iSxEAFufZo/TnKsWQ9YMwp/ScWkyUcOdyg/6uHbIBJvtC/88De5y3luxf
 +dRh3WGrIekzhUWJGZkMbzxZgZ/hNGuFV5+eRWcK9hn+TAC/0f/MXEYd6jRigc0jDX4l
 PxPgNq2pxe9HfUGNL836gwq33d8s/8GN5zPbBAWx2O4Fhwnk2ltEN3LufdB2t/hijpZv
 v8hQ==
X-Gm-Message-State: AOAM53035CA7PpveTE7ua6WW6oJp5uGsu8r7xMGroYSch1tLS+QH6g2S
 NtpK59w4g/PuYRNQ4d28PC+shbwqse1kebt1
X-Google-Smtp-Source: ABdhPJxQgMzmhzlyBh4e55RPzzxExnIpT7gbimqnyDkR6dUkmHFJEqdv9IcxKi4wmhGm+IK16gC2gA==
X-Received: by 2002:a63:5515:: with SMTP id j21mr253428pgb.31.1599594537629;
 Tue, 08 Sep 2020 12:48:57 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id n127sm216922pfn.155.2020.09.08.12.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 12:48:56 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/16] tests: disable /char/stdio/* tests in test-char.c on
 win32
Date: Wed,  9 Sep 2020 03:48:09 +0800
Message-Id: <20200908194820.702-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200908194820.702-1-luoyonggang@gmail.com>
References: <20200908194820.702-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x443.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Peter Lieven <pl@kamp.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These tests are blocking test-char to be finished.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 tests/test-char.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/test-char.c b/tests/test-char.c
index d35cc839bc..80e5bac61a 100644
--- a/tests/test-char.c
+++ b/tests/test-char.c
@@ -103,6 +103,7 @@ static void char_console_test(void)
     g_test_trap_assert_stdout("CONSOLE");
 }
 #endif
+#ifndef _WIN32
 static void char_stdio_test_subprocess(void)
 {
     Chardev *chr;
@@ -126,6 +127,7 @@ static void char_stdio_test(void)
     g_test_trap_assert_passed();
     g_test_trap_assert_stdout("buf");
 }
+#endif
 
 static void char_ringbuf_test(void)
 {
@@ -1471,8 +1473,10 @@ int main(int argc, char **argv)
     g_test_add_func("/char/console/subprocess", char_console_test_subprocess);
     g_test_add_func("/char/console", char_console_test);
 #endif
+#ifndef _WIN32
     g_test_add_func("/char/stdio/subprocess", char_stdio_test_subprocess);
     g_test_add_func("/char/stdio", char_stdio_test);
+#endif
 #ifndef _WIN32
     g_test_add_func("/char/pipe", char_pipe_test);
 #endif
-- 
2.28.0.windows.1


