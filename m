Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813563C8731
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:15:48 +0200 (CEST)
Received: from localhost ([::1]:38806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gbz-00075L-Hp
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNl-0007Qq-SK
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:01:05 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNk-0007eI-4E
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:01:05 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso3614973wme.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m+wx049KJ28JpFC9cH0HgqwfF96vUTHrRWKaIFgqKEY=;
 b=BLCRDvz9BtOLCneYOZwJQYaJEjSNVqRYJMZ+GWgLnorRcMyXne/8u65qg24ZXQMJp5
 c3IiWpuogXwgJUH79S7MhsmoDlDo4JDSKSFP57LW5TKzM0GYHb1A0PADKAl94fgc6URF
 UvHOPacG+ni84YF9ZeTMpS9bWiYdpfvKGvtFeeYirshaFxws04nn5RJNthDjjrB2LqCH
 OsabpTOFNwKzoy9X5nJ1zDM2fLGgxGpjtdc6ZjYS68mSbdupLckvX5TQS39Gb+ifR388
 JcbmXCdrORU4nsbpVRp8BthhXipIWIxM21v7ZMWZwbZcSkrBnckBlCCvWP3eRqQZQQiF
 kXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m+wx049KJ28JpFC9cH0HgqwfF96vUTHrRWKaIFgqKEY=;
 b=q3s+at3Q/CvS1k2vnqXEsrIoOz9AsVkCQgRQuLLGYJOkWg1AYLyGV2YCvFMgxcdb3S
 sRrZQ2Fnau2IQfmLsmfhYJgSU88egbZ87Yr48Q8aw36PdRikgH8xF4aTd8Rkn+6v8Sfi
 r77fgGcF1Yfd359S3htD2UKcgX/CeDW4ai5c0679R8unQwbq3sSeAKjDn1YWw27pOVOZ
 KzZcKvYuylq04mLVW6xea0ThB9pcdCnOUGQQjJi+HeBh4FANuu1qeiJ2riN46t/9+D2z
 9I92HxBto+3zH8+AxpDaneceIUf3ER5ErBhjdvC9pEAZf/yqLZc7nFkZlwdGDdPEd7kd
 fmvA==
X-Gm-Message-State: AOAM531SVMNiERh4kWFbRYpSJYX6TyK6Z9XE+NsU2bXBnXE0qSroEbBU
 og+h/A74I7roO6nEaaS5RYQ04Q==
X-Google-Smtp-Source: ABdhPJzpdv32756ZXnpbot76GR/QjkgwDIOIbW0W5DuU0odTaZmXgftc3qNFSl38imwwoNwDN8jmqA==
X-Received: by 2002:a1c:62c4:: with SMTP id w187mr11710029wmb.27.1626274862691; 
 Wed, 14 Jul 2021 08:01:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o29sm2238160wms.13.2021.07.14.08.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:00:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DA3721FFC0;
 Wed, 14 Jul 2021 16:00:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 39/44] docs/devel: tcg-plugins: add execlog plugin
 description
Date: Wed, 14 Jul 2021 16:00:31 +0100
Message-Id: <20210714150036.21060-40-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexandre Iooss <erdnaxe@crans.org>

This adds description of the execlog TCG plugin with an example.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210702081307.1653644-3-erdnaxe@crans.org>
Message-Id: <20210709143005.1554-36-alex.bennee@linaro.org>

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


