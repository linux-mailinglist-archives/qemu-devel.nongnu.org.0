Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D86251B57
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 16:53:00 +0200 (CEST)
Received: from localhost ([::1]:46460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAaJn-0003c7-Ia
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 10:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kAaIn-0001wS-3v
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 10:51:57 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:35937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kAaIl-0000Xo-JX
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 10:51:56 -0400
Received: by mail-pf1-x443.google.com with SMTP id m8so7551308pfh.3
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 07:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MU1D0gcoO3ZaMdBitGLyuB0vQmL5fSRzDQyIOcmupWk=;
 b=ohVoPahkc/2gK3Rsd+a2bbGrnOOsqVW2vj8cBMSo1hoeFiuMskYoShu6gzrqMUyuwl
 Fp/mzMmNpt8Ve3qsVCW5pJiUpLD8dAR6C20FQAEPyWTAOh47ysKH9BydAXtyYrCo3zLs
 1tz/dCuOCbVcGGqCgyVCVfDYuwGfc+Qa5T5M162UY4nTbrcGU5GjR3K/RsXzFPwVTgUR
 8UbkM9x+J/QTYsaaULPAobhdQLzax8d3w9AtHrXiUt+hn0HakVHT7y44gwj8650/kM/n
 lg5LN6psD+MGUQ9c3gF9FoT5qlcR2fGu7MMqsX1QIby/x2GrMdV2n4Z7DbYJE+yO5hV1
 +luA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MU1D0gcoO3ZaMdBitGLyuB0vQmL5fSRzDQyIOcmupWk=;
 b=IdAKP2ln4yd4EsMQDfyPHQUTCFdsIqR9E073vmsYBKxvPDhW15EUD34FzVqo0HbTN2
 xrP9+hDfFjw/GThsVvZcThnvmmBvTgv1ipIXIjcpDZ1Xc8s8x0Ap3qnbEHm6hzYvOf82
 qnJfKZ+BaX8vop0FgiZPG3YH5mBPqmoD6SBgwiDL2QQ27sE2rcOWOiGzaigWzwQkgwEA
 y/f3xX4VBqmG5bxdsy7TPKcOICISd1jspbL7+GluUBSb/kevPyWJ5z0fCj1GJnZiFzH+
 rfhtzUjAykqH8AYIEv2uEc5SFSWKRzlgpm5SomXHrzkZAuP8O3S+OE8JqZx0ECMaQzlh
 8Zvg==
X-Gm-Message-State: AOAM533oDajoMPBBL0rxYSdrv0xHvyzhK9ksosUhie6iuQfjBR86roQA
 RlcEhIbv9PFekjiTK/f3NE1pFa2BKiOYIkj7
X-Google-Smtp-Source: ABdhPJy+opfCw285m1BaJXRV+7yNArTPmBS/bouh/w03m5MdGiQFj6z0EG+oVBuxSLOkXs/3EiSpTA==
X-Received: by 2002:a17:902:7d85:: with SMTP id
 a5mr8079601plm.148.1598367113655; 
 Tue, 25 Aug 2020 07:51:53 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id m22sm3104383pja.36.2020.08.25.07.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 07:51:52 -0700 (PDT)
From: luoyonggang@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] meson: Fixes the ninjatool issue that E$$: are generated
 in Makefile.ninja
Date: Tue, 25 Aug 2020 22:51:30 +0800
Message-Id: <20200825145133.178-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.27.0.windows.1
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

SIMPLE_PATH_RE should match the full path token.
Or the $ and : contained in path would not matched if the path are start with C:/ and E:/
---
 scripts/ninjatool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/ninjatool.py b/scripts/ninjatool.py
index cc77d51aa8..6ca8be6f10 100755
--- a/scripts/ninjatool.py
+++ b/scripts/ninjatool.py
@@ -55,7 +55,7 @@ else:
 
 PATH_RE = r"[^$\s:|]+|\$[$ :]|\$[a-zA-Z0-9_-]+|\$\{[a-zA-Z0-9_.-]+\}"
 
-SIMPLE_PATH_RE = re.compile(r"[^$\s:|]+")
+SIMPLE_PATH_RE = re.compile(r"^[^$\s:|]+$")
 IDENT_RE = re.compile(r"[a-zA-Z0-9_.-]+$")
 STRING_RE = re.compile(r"(" + PATH_RE + r"|[\s:|])(?:\r?\n)?|.")
 TOPLEVEL_RE = re.compile(r"([=:#]|\|\|?|^ +|(?:" + PATH_RE + r")+)\s*|.")
-- 
2.27.0.windows.1


