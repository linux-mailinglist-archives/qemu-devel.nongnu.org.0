Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962CF12474F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 13:53:50 +0100 (CET)
Received: from localhost ([::1]:53773 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihYpp-0007py-8c
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 07:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56311)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3s-0007Jz-0L
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3p-0003Kj-Nc
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:15 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33369)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY3p-0003GE-Bg
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:13 -0500
Received: by mail-wr1-x432.google.com with SMTP id b6so2032556wrq.0
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0RravkZg4GJs8al28mPtQXZKMfdxgs/SErQE/3uoU0E=;
 b=bSaeIsvZJdjx874TaEqBWWL/9Y8tw0cc0u6FXF8Ee+pY6FvPkG1GU7Ia0hyR8oA+WX
 EmRAFioB0+alCZz6UvtgGRIgP2hiqXAfDPDLw5U8MIcPEWJ/ZKOi9Fi9ZYOX6EEODa9n
 SWxQffs3P8tnRFrfaj0685/XAcHQZ9WyC5Ge/u7oZtySWhQMnRklegn5cYRtDfRJBsge
 e9JbYQGl6dGU3WcA+Hf4NywdM9qMIUWf+fBJrP0x6Voqyo7TwWjEe05bI/ZhGIotFlDA
 gxr3mQFFFgDbTcnIMJY0tRHscY8WB1xLh6L/ZME2C6yzwM1kobqq5p7hGlFUstiP8ag5
 fSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=0RravkZg4GJs8al28mPtQXZKMfdxgs/SErQE/3uoU0E=;
 b=N6s+ty/Ek0ihCF+KJS+AUhc+w8yxUZXi5Yf/0SvSew4jsevmoY2/3n7ceV8TyUxe+S
 Wcz+MpIrZLYBvJOadraLE54jsQ1TjAN8RzfBwA3jTLBpLkm43iDU6AbbMizhZ5glLqog
 c7+jA1BQBlbYM4swDhCqvdrwahV+FuU5w/YuO6g/0gLJhwYaEB5k8Cxh7LSNq2KEEsst
 XbW10uP4JTBOEl/gnohtZQN6gVHsk8Ex4+y/NI5LYi6GjWtAdNCDW9ArwvsEdxJx/2/f
 65W21NKGOKF1H2q4raBb0l2rg2xuit1KBgINccjX2op2H5X7Do6n3+JAPYgLh99MA58h
 0yLA==
X-Gm-Message-State: APjAAAXen0yobGVgf+EuxBeUjLRfVg7nqhbEnMUFoLnxaW0eIp/sLtBI
 /hzVZD7KA/UyGM7t+hYycTOUj5yp
X-Google-Smtp-Source: APXvYqztM9aA5KO+EQm15CgOWoGN8+2UfpqlGGOIfJMu5YK/Jq1ue/ta1h5HWkZONVUyGtih8Tr8Nw==
X-Received: by 2002:adf:e984:: with SMTP id h4mr2384917wrm.275.1576670652036; 
 Wed, 18 Dec 2019 04:04:12 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.04.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:04:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 69/87] docs: Create bitops.rst as example of kernel-docs
Date: Wed, 18 Dec 2019 13:02:35 +0100
Message-Id: <1576670573-48048-70-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::432
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Create a bitops.rst which is just a container for the
kernel-doc comments in qemu/bitops.h.

This is mostly a test of the kernel-doc extension machinery.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20190521122519.12573-7-peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/bitops.rst | 8 ++++++++
 docs/devel/index.rst  | 1 +
 2 files changed, 9 insertions(+)
 create mode 100644 docs/devel/bitops.rst

diff --git a/docs/devel/bitops.rst b/docs/devel/bitops.rst
new file mode 100644
index 0000000..6addaec
--- /dev/null
+++ b/docs/devel/bitops.rst
@@ -0,0 +1,8 @@
+==================
+Bitwise operations
+==================
+
+The header ``qemu/bitops.h`` provides utility functions for
+performing bitwise operations.
+
+.. kernel-doc:: include/qemu/bitops.h
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index c86a3cd..ac86215 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -23,3 +23,4 @@ Contents:
    secure-coding-practices
    tcg
    tcg-plugins
+   bitops
-- 
1.8.3.1



