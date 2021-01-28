Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464EC307895
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:49:30 +0100 (CET)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58bx-0002A2-Ak
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58Ui-0000hj-Mx
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:00 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58Uh-0007LP-5f
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:00 -0500
Received: by mail-ed1-x535.google.com with SMTP id d2so6901411edz.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+NyLP4/ImVPnecvb+eZeVSP/TUOelRx6xYCp4TmFnCg=;
 b=TBzVjUTCSL/4WMLOsCyvpxTj+JORpZguH+LpIjbbZLuGceE1GH1cODsh+FFkpEZ0BT
 x5fP0ZBC3e7Yg854KVuOHvORfOLwh5mfdeaC/l4RQO9X6PkJflDUMnwknoZolEEegCgU
 HIcKs1tvBwMeI/qARzQUH9cO/Kwv7AayuqAqRwsLyjzdcfqZ6UWuZKaWLBQj6JXRJzaS
 pPHn+suAGna4HYis4AKSIbisLewxR0DvNfjmlAKYsdamyruPVUz3gEwUiSU/Jb8RAYh2
 ZsYfvaSnmSBjNXNLGJOdiVi8zSlPVMzXe7qtURJ0H1ImlZd02lC/oBEYKZahOaV30uyU
 zhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+NyLP4/ImVPnecvb+eZeVSP/TUOelRx6xYCp4TmFnCg=;
 b=HwfJCn5xOusBdLo2A2gM9ySMHKLcZ0BG/uX/HG9v60AFrlI1Gh81M1GSo4/BpN/LLS
 cKBBlHtBLGvuXnYsFcTMjEqxGnJsYOFenkisket00ovy4SLyAcTSwLRfYsUII41x7cU3
 cNph/L7UKE62UR6hl4D5/1imYAA5mT2CeGxcRFmnBfuEFOy1N5ZmUiNaLYk9+duJdZD9
 2TI6khcgR37EtvcGpRaMbUTmO5kQySyJxnkpxQGso/E5Gf2GSs3uY1m3akcBwaNgqpWF
 K4NE9I47csY2UZ+chEm6niyjyDM/mr9Aw6shiia+9nqqqYSEdxbPB+jwtpfIv11rlqYj
 EHJw==
X-Gm-Message-State: AOAM531jWue3g+DO3+GkeL4GTGV8saPzFg8bcny6UcrhCtgwW8rKjpzq
 2m52OCjhK+Sox5oJXmrKS9mirPJ96Ao=
X-Google-Smtp-Source: ABdhPJwQadWqyrEmTt6gI2FGcsumt2MQkO+GfbPoXcLR2aUUIdYf+PzxzEDyZ8FLP9TuUZOtjnyJyw==
X-Received: by 2002:a05:6402:3487:: with SMTP id
 v7mr14728463edc.68.1611844914116; 
 Thu, 28 Jan 2021 06:41:54 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id lg21sm2372913ejb.91.2021.01.28.06.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:41:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/13] target/mips: Remove unused MMU definitions
Date: Thu, 28 Jan 2021 15:41:17 +0100
Message-Id: <20210128144125.3696119-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128144125.3696119-1-f4bug@amsat.org>
References: <20210128144125.3696119-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove these confusing and unused definitions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index b9e227a30e9..9e6028f8e63 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1220,22 +1220,6 @@ typedef MIPSCPU ArchCPU;
 
 #include "exec/cpu-all.h"
 
-/*
- * Memory access type :
- * may be needed for precise access rights control and precise exceptions.
- */
-enum {
-    /* 1 bit to define user level / supervisor access */
-    ACCESS_USER  = 0x00,
-    ACCESS_SUPER = 0x01,
-    /* 1 bit to indicate direction */
-    ACCESS_STORE = 0x02,
-    /* Type of instruction that generated the access */
-    ACCESS_CODE  = 0x10, /* Code fetch access                */
-    ACCESS_INT   = 0x20, /* Integer load/store access        */
-    ACCESS_FLOAT = 0x30, /* floating point load/store access */
-};
-
 /* Exceptions */
 enum {
     EXCP_NONE          = -1,
-- 
2.26.2


