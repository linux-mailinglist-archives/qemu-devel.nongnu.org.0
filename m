Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C33520645
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 22:59:28 +0200 (CEST)
Received: from localhost ([::1]:32828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noATX-0005CS-Hw
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 16:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noARi-0003P2-H8
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:57:34 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noARg-0004yy-Tn
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:57:34 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso257456wma.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 13:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4NO6IBCWa/ZXtEXK/25kkAzsHYn6jl3nTLhMwi1Cpo0=;
 b=cS7GtWqsPEu49xYrZprYqDPYTuBCBv+yfLKzuRnaIMNq5YhrlQRPLuJc72qElzdA/T
 OUBXCxzUvB5enZgpHQnivAeA2bUA9GKIwheTruRVnR8XcLybn0b+6ywLQjpxbZQnZ9RA
 /DREGKU9LzghLCjPRiLNX6c4dSZpvabAu+PGtVgGSreiI75uShhR8FTC8AeazQWLUNN0
 7f096rBUCu+Znxgex+xMGlxKf7w5eUzueioTnneRxlDILzaOn1OuHjDnvuicyDH1bvMi
 g8U78LuXSn18+OucWbgDSxKiSx08sOzhsAuhTIJKJppk81GvosG9aKEkomz4kJUB81nU
 5hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4NO6IBCWa/ZXtEXK/25kkAzsHYn6jl3nTLhMwi1Cpo0=;
 b=kdHBQZgnhaQ9IEwNl9aUZNoKVcCC6aQRmAqHds4GffIyYMRqgbNcv7NvtkOWRfzQ5A
 5uYpO0uoAWHthAq+ElcWtP4l5F5p0d1pYEcYqxv9EGhmJYHLfjylX3TCQ6cpLVG0pimC
 O25ds1RqmWP1KS3WrBSObvEj7TohlXbFV5QnreTP76dYtIu600xhdZ/R+08NJyI4jTYI
 syWnlf/VxbBN5Oxa0S3V1iXcOXiaoXl2WDyNt9CcJqq6uqIDFHSHel+cc5nIl7wR9yiY
 7vd451SbYEbIGSVqSBSTmPbVH6HYbKZnmbxPxa0MytjCQtnCj/SxsosHpSZya0zTZAy1
 E6kw==
X-Gm-Message-State: AOAM531kDVrwBpbi2iv5ewreNWJIaCeD3bJy3XPCnQ4ysw+G+Ja1BzY5
 i3ZOfU/X45yQB0ZDEylbhmlcWIdzQtE=
X-Google-Smtp-Source: ABdhPJz0Zu4PC0pJ1wJPvqqcCkVaQtCRFbT38e2B5XMsmqm4NLLNPviQVNtbPouRHgL6cOLGwxuiWg==
X-Received: by 2002:a05:600c:288:b0:394:31f9:68f with SMTP id
 8-20020a05600c028800b0039431f9068fmr24486800wmk.57.1652129850261; 
 Mon, 09 May 2022 13:57:30 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 5-20020a05600c234500b003942a244ed1sm319683wmq.22.2022.05.09.13.57.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 May 2022 13:57:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 0/3] linux-user: Use CPUArchState* instead of void* when
 possible
Date: Mon,  9 May 2022 22:57:25 +0200
Message-Id: <20220509205728.51912-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Since v1:
- Rebased

v1: https://lore.kernel.org/qemu-devel/20220306234005.52511-1-philippe.mathieu.daude@gmail.com/

Philippe Mathieu-Daudé (3):
  linux-user/elfload: Remove pointless non-const CPUArchState cast
  linux-user: Have do_syscall() use CPUArchState* instead of void*
  linux-user: Remove pointless CPU{ARCH}State casts

 linux-user/elfload.c        |   2 +-
 linux-user/strace.c         | 202 ++++++++++++++++++------------------
 linux-user/strace.h         |   4 +-
 linux-user/syscall.c        |  81 +++++++--------
 linux-user/uname.c          |   4 +-
 linux-user/uname.h          |   2 +-
 linux-user/user-internals.h |  18 ++--
 7 files changed, 155 insertions(+), 158 deletions(-)

-- 
2.35.1


