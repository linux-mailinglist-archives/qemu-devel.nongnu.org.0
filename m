Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6853C2645
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:50:00 +0200 (CEST)
Received: from localhost ([::1]:37452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rpH-0007VC-Fa
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rmw-0003CP-Gg
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:47:34 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rmu-0004MN-H8
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:47:34 -0400
Received: by mail-wm1-x332.google.com with SMTP id k32so3286430wms.4
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M0B41l8DgGSa12niyjKzHwCDTjBJNRfJGB+oGiCv7dg=;
 b=su72GM5BrWh5XE75wY7BF20omxSaQ0yZCR1Kw+phqNEcliFQK1szWmM1fBlfkxSy8B
 yjQQi5HDuHj+em9Cx9x6OwenyoE1SOuPCIME7PauVWASa39Yr8x+rtU9+cCMkpSnQw3L
 UMbaNU8GQ9Emknr6+qiyYBgtvZN8gKs4TlR5GDUXpsUTPawEAhCtkz/O73Um1H692cMv
 9dTqG1Witu9sptpo0eIq/bStSKMVLCXEBk8Q2r9kdvOsNBqSxsfFfzkDg/hcPZFBhLwT
 m/Mb2oIrK0ajZhhdD3KAQ77awfGP8a0V6MOJGHznr8vrVYyuOvNZGagEuEwmRIxuQGQ8
 FJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0B41l8DgGSa12niyjKzHwCDTjBJNRfJGB+oGiCv7dg=;
 b=Y9Lf5PBpXscP+0FjLf7GuXfzXG7UP4ZEUEjOFVOv7dpmQrtfBW6yYK5g3iCgU8SKIZ
 K/czSEoJhLP4iSubwM+mFZaTgr6wihewgnt3qaUHpgsA3GniOUYPR8gEGrg/ksA6pfHl
 VyiowMQbmiGd6NJ3f+YgAOMuZX8OqdbZ3z34eff6QI4DK3zZ05N1Y+xOgApFVCF3q+c0
 cZNW0bNA5otcO1lXJ+FcYxyKKVRQUx9hb13W1QrQT1wY6ObxK2ytOqIXjwyVq3qV4VFQ
 LUU0QTe0X1q5zp/ksHGJekfsZAAjRRMJdd8BYj4TPtindeukYMkMbYSIvh0yt2iYX/SI
 07iQ==
X-Gm-Message-State: AOAM5315Bwl9nnEQZy+5NvwIT4Hh16scan6FBVv4oS5beQacl9xzBLFY
 nI2npbbw3EQIzoQ4iNUBi6MyUg==
X-Google-Smtp-Source: ABdhPJx+gW8U4x2HnbnD9vL4zpmUMhDGnSVz5TOPwQDzD/7dwVMkvzP3b/qqxyVk99su8eZeUwjhLQ==
X-Received: by 2002:a1c:62c4:: with SMTP id w187mr23554789wmb.27.1625842050867; 
 Fri, 09 Jul 2021 07:47:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t9sm5377184wrq.92.2021.07.09.07.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:47:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E109E1FFB8;
 Fri,  9 Jul 2021 15:30:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 35/40] docs/devel: tcg-plugins: add execlog plugin
 description
Date: Fri,  9 Jul 2021 15:30:00 +0100
Message-Id: <20210709143005.1554-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, Alexandre Iooss <erdnaxe@crans.org>,
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


