Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2AC3BDA03
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:20:16 +0200 (CEST)
Received: from localhost ([::1]:54796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mrj-0004on-IS
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mf6-00056a-Gx
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:01 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mf4-00072Y-OU
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:00 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i8so13583288wrp.12
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M0B41l8DgGSa12niyjKzHwCDTjBJNRfJGB+oGiCv7dg=;
 b=Ko0rze6urFLr9sEmYdV2433Xyq3fnB2Dz4FescYUFF/v4Hcg/ZIxVCvpQzk0GJNhK1
 tqzwVJzlFAS+6lQtUEi4fV/ROD8JMEE9f9+PHjBCKLgJicc64QWjBF7SPynFHsxswBCQ
 5Clsr0p+TUied6bkuryVLF8Xi8bDARrrWrKUmUfMGxWo8SD9QaOy3v5XVXIqYH64qNvr
 0kdM0eziTacQqtDIfjDLohamo8z9FpmaJnq9svr7+tocSIduaQoKU1QFi+oNw8YwCu6S
 qMvk+Vn2ZkDRp8OlUfNSKYduXGTsI+RuyIQaMg+54n7yNfChlWHSkFr5lNHasCFl1gMZ
 W7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0B41l8DgGSa12niyjKzHwCDTjBJNRfJGB+oGiCv7dg=;
 b=sbgCSaRlT6pRdRKcr7ieDBCRgOXWR2FwJPC3IYN9u9XBlDccdYBVHyeDEvQ7jNVJN+
 iu/WMg7EuufAcZJua5e215T1WQ7w3nlykZ9F6zTqxufFjflkhuycDRdDAmYYmtN5uw4n
 2J/iOWGyhvtDGQcuRvbWBlkCN2tyRbqTiLy8MkcHDah7If5ymPgAXKHdB9R3tTgYgBpY
 ysQvsWuRPOoU59rYhEWxYi49aX057S38vxAG4qpmPj0AH68eoaLaYyAM3ArMS3jnIMzp
 HGS4ScRuottHe3ZaOGQJCODCI4xVcWYBJfGZMLkh9SzdDWJDGa9MjrKz3CTJW8Pp9Vnx
 +g9w==
X-Gm-Message-State: AOAM530iDVSDLvr3ROiN1/fLEN5LUh7rpquEmxdDqXB5ipDDwwI+4Qmo
 +Ri2RWuryrDqIVDV8aYUzZVarA==
X-Google-Smtp-Source: ABdhPJwbLeQ0bsSjy2s5C5JvubWat4GfIuNVinuLgPRw9u6RzpfqddxNLQLCbNgOErUh6OesMhGl/Q==
X-Received: by 2002:adf:e690:: with SMTP id r16mr8238954wrm.196.1625584016997; 
 Tue, 06 Jul 2021 08:06:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t9sm18039244wmq.14.2021.07.06.08.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:06:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D9541FFBB;
 Tue,  6 Jul 2021 15:58:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 34/39] docs/devel: tcg-plugins: add execlog plugin
 description
Date: Tue,  6 Jul 2021 15:58:12 +0100
Message-Id: <20210706145817.24109-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexandre Iooss <erdnaxe@crans.org>

This adds description of the execlog TCG plugin with an example.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
Message-Id: <20210702081307.1653644-3-erdnaxe@crans.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/tcg-plugins.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 0cd77c77d2..179867e9c1 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -320,3 +320,27 @@ the user to see what hardware is accessed how often. It has a number of options:
       off:0000001c, 1, 2
       off:00000020, 1, 2
       ...
+
+- contrib/plugins/execlog.c
+
+The execlog tool traces executed instructions with memory access. It can be used
+for debugging and security analysis purposes.
+Please be aware that this will generate a lot of output.
+
+The plugin takes no argument::
+
+  qemu-system-arm $(QEMU_ARGS) \
+    -plugin ./contrib/plugins/libexeclog.so -d plugin
+
+which will output an execution trace following this structure::
+
+  # vCPU, vAddr, opcode, disassembly[, load/store, memory addr, device]...
+  0, 0xa12, 0xf8012400, "movs r4, #0"
+  0, 0xa14, 0xf87f42b4, "cmp r4, r6"
+  0, 0xa16, 0xd206, "bhs #0xa26"
+  0, 0xa18, 0xfff94803, "ldr r0, [pc, #0xc]", load, 0x00010a28, RAM
+  0, 0xa1a, 0xf989f000, "bl #0xd30"
+  0, 0xd30, 0xfff9b510, "push {r4, lr}", store, 0x20003ee0, RAM, store, 0x20003ee4, RAM
+  0, 0xd32, 0xf9893014, "adds r0, #0x14"
+  0, 0xd34, 0xf9c8f000, "bl #0x10c8"
+  0, 0x10c8, 0xfff96c43, "ldr r3, [r0, #0x44]", load, 0x200000e4, RAM
-- 
2.20.1


