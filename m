Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1A14FD327
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 10:58:53 +0200 (CEST)
Received: from localhost ([::1]:34958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neCMN-0006z8-TL
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 04:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1neCIF-0005Sw-BH
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 04:54:36 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:36657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1neCIC-00069q-Kl
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 04:54:34 -0400
Received: by mail-ed1-x52f.google.com with SMTP id u18so10828217eda.3
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 01:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7IxBAb0CB9yBD91NLQnjbzmPApzLPhxC8VwvuJrZz1I=;
 b=RA2BioZSgtHLWyGd7Qm71LkdAlOqa88svmERnl5qC2EVHTYNqRcnw9SWYKOsgluAvc
 VBcKKf/bB9xuASApHw0makAtDwfK0Ngc0YSZUmWRMQhhqVbLGv9O0Jjs0WIW84qDMVbH
 o0OfNSx+2RPFf1kbYgXedDzOoEUnvP5v9cAsNMd78JN2pSgkYVUKiaboIo+TjBjFfTET
 avLkVa+hdIEZaIGezD/F8s5xnAnvdu92N5k9/hLHwM13hwjlOavoigAsHBlBQ7+vJQlb
 uhoe4YfegSYqEZ4oO03GsLRQg8ujPyy/q36f0H+A6HIzUztHsbpgaCQ+C9NlfyYYyFhb
 dVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7IxBAb0CB9yBD91NLQnjbzmPApzLPhxC8VwvuJrZz1I=;
 b=icvtm8vZN2TZACuX/QMadNthbLQ1BAqqSZyaZ3GZpxY/JSR3pFWr5HaeSvsCX8sy8t
 KvV43+uA4j+n3HhfEX0C8x/fmLwKMw6n2yFLp56x4Roy7VVwqP4xG8x3gY2m7RfBOYBP
 5UeidZC+PswPvc7PFtcqOpvnmlTZeepFmoyztXAjeMPYUtfZVSjAQUsP/xtkfMKNFkwT
 MZWTYUCZbt2x09G8S8540wfieYMv92YJxxZK4IC7FzWtswuG604RPHf/JFmaU3+ER1JY
 1F8ljk90g1pRg575xapCJBohk13ilHEE3qf4IXgRAjNGcxUDhyjBPAduA5S4PkA9tyE6
 p7yA==
X-Gm-Message-State: AOAM530kPC+pTpdMjiRWul3ic6NtJkzSxTn8OvZGgt7NADAWAbfggbn1
 wD3Ir1yUHTdoOsIJNV5MEbuNpw==
X-Google-Smtp-Source: ABdhPJxzYjoWDmM4lI98EV8DhvQdMMBtw/olXIm/kD04AIIUrRr5bCCGk0X2lcJGYbadBK1mk2mObQ==
X-Received: by 2002:a05:6402:42d4:b0:416:5cac:a9a0 with SMTP id
 i20-20020a05640242d400b004165caca9a0mr38439177edc.86.1649753671157; 
 Tue, 12 Apr 2022 01:54:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a1709063e8100b006ce06ed8aa7sm13024936ejj.142.2022.04.12.01.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 01:54:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 74D561FFB7;
 Tue, 12 Apr 2022 09:54:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] target/i386: fix byte swap issue with XMM register access
Date: Tue, 12 Apr 2022 09:54:26 +0100
Message-Id: <20220412085426.148191-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During the conversion to the gdb_get_reg128 helpers the high and low
parts of the XMM register where inadvertently swapped. This causes
reads of the register to report the incorrect value to gdb.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/971
Fixes: b7b8756a9c (target/i386: use gdb_get_reg helpers)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: qemu-stable@nongnu.org
---
 target/i386/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
index 098a2ad15a..c3a2cf6f28 100644
--- a/target/i386/gdbstub.c
+++ b/target/i386/gdbstub.c
@@ -129,8 +129,8 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
         n -= IDX_XMM_REGS;
         if (n < CPU_NB_REGS32 || TARGET_LONG_BITS == 64) {
             return gdb_get_reg128(mem_buf,
-                                  env->xmm_regs[n].ZMM_Q(0),
-                                  env->xmm_regs[n].ZMM_Q(1));
+                                  env->xmm_regs[n].ZMM_Q(1),
+                                  env->xmm_regs[n].ZMM_Q(0));
         }
     } else {
         switch (n) {
-- 
2.30.2


