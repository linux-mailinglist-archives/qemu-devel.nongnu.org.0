Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F03983C5C97
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:49:45 +0200 (CEST)
Received: from localhost ([::1]:48260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vNZ-0001ME-0t
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v23-0004VJ-Jt
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:31 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1z-00004v-0k
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:28 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so11117349wmi.2
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m+wx049KJ28JpFC9cH0HgqwfF96vUTHrRWKaIFgqKEY=;
 b=VmnFS1ZC/+VboiYWrk1c9gULOLJyoXr6mcIcFOeUUwJW/07Rqs/SJjnNTvt7d8Gp01
 s26+lw0CYKvVnN4o809oglxvVOcTm03p1vBr8kbRGaB7Q7sV91N1thnE4U0JhdMIKVcL
 Zn19ncq9azK3zDnnLlbFGGyylUmmDfUGxX/FlFsLpvGePX/8MBcJ0Ub8RGozCUWJJZV+
 94TjH8NrmMco78lPDwSncPo+7VJXKHjUBO3lrKch0akhYK/D+X974bt1quVC03UICUTe
 10CC4yKTo8NgW3eH1pUS5z/JndvyuyPo5LvT11pTMNP+sNMURuVxNpzwn1D0Sam8vw7J
 VQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m+wx049KJ28JpFC9cH0HgqwfF96vUTHrRWKaIFgqKEY=;
 b=t6LKEHcGa3MheLqTOuOrBBBi03LEjcfNcsvtojF1Bf4VWeCgJB+vuOz8skWb50PN1U
 8rWJhYBDXZASJyFdX9o3itkXuMeqhxstRhSPOegOoSsG8QRuFl4DuGtgaSoiX+9Fsuub
 Q8zT5oWSVL3OnmhU+9cEV8oZW+5m4D/jvPNSKcZr1AwPL1IzZSE8hCOU9j9/Lr5i85ko
 CueqwMm3E2mmn2pkOpctXVXscQmocVcNTXJvwhNPB3vxkKFZEQbGS6Jmv5riK6o+QpH6
 JCeEkDjuQmXRLf0bQ02gq847wJvWqNjNbftArT0aDE5inHdwMozka4J6yeJyVjx/BoRo
 mnYw==
X-Gm-Message-State: AOAM530PrphFisigPOz4S8D+iuZ4j98gJtVAQllIO1lIxoHQFvCatxe9
 xLAY1aXvJuGlYqw/dSL8uk7mSA==
X-Google-Smtp-Source: ABdhPJz1hJpfEjAe/5Pp6W3xXv1/B3RK79XHdC1qSS8u8SM2iKyPFYLDYet7bgjCPo29PszktUUiuA==
X-Received: by 2002:a1c:9d16:: with SMTP id g22mr31475840wme.152.1626092845196; 
 Mon, 12 Jul 2021 05:27:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f7sm7393877wru.11.2021.07.12.05.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:27:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 817331FFBD;
 Mon, 12 Jul 2021 13:26:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 35/40] docs/devel: tcg-plugins: add execlog plugin description
Date: Mon, 12 Jul 2021 13:26:48 +0100
Message-Id: <20210712122653.11354-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
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


