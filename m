Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC4A6A446E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:31:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFI-00015L-ED; Mon, 27 Feb 2023 09:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeDa-0008G5-Qa
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:11:12 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeDR-00012y-1m
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:59 -0500
Received: by mail-wr1-x42a.google.com with SMTP id l1so3320698wry.12
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kvJnfasId6KgbNDIaJsqs/RNAtBPzSC/BmR0A+kAo0c=;
 b=iK88KVBrdDd2Pj5unro9BTC4Iuai0TrZM3xbOOIDa5LD7IzNQrhxAw1TUlXLiOh3Jv
 YE/bsSAR8F0ahhXjlQhGmXVtuMxIsi3ZIJ11hylv+31V6BWxQ0kpiNaqZO8XGrjn0YQT
 x8FGQBqip+8birnGjERQMXfjOZCp2k+9ntFaedy6kBpp80/1OSO0Xvf5uMsxDwFwOFj6
 IK5NAf8oTeQhyFs6rizPXLulWnoaztbL5yUSZ61MhQrTBD+K/zaaKELYweipNA77Trrl
 NFwtkNkD50GOp2JYAQaB3PHRHfDO70ZykYmF5l6Or+UMcmUOajID/Jx39ZkHKrg/yu40
 yVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kvJnfasId6KgbNDIaJsqs/RNAtBPzSC/BmR0A+kAo0c=;
 b=TH0ZNBzjLxhxz9DubqCQ4f7/IElBrbjLVYe/YvbkKD1JBZZj4EQeuVhl5oXlwp1d3u
 xITNsWeeZSLu+OHJvNttAAg/rUecEHXTon0FNiG9oM+SNO7oLcMoDQDIvcWGlSDhj/B9
 Wg4ElHyUmJG1Wcj9aafyPzaztT5ObDGTPOQ7aEkVgohnvOarNpXmMKUSsHBx+u23oGzF
 m4BnbloSRTKFc6kd/lZIJTHctP0j4KPKoaKZHiPt05FHlb3AM1moOVr920AlUzzCsZrE
 51xziywO+2hdVtg6j9pEsZoBR+zbLG5QerJa1xffzSYKS7YZG+b5x+DGl+G7XnN85IFV
 VJzw==
X-Gm-Message-State: AO0yUKVNNaQROqMLhq5Tp05LHi6azlahECad6YlKRhGigNxeUG0bfya3
 1TMNWpa0U2JFf15L5kBomH0T+Eyit2Cacbc1
X-Google-Smtp-Source: AK7set8j1dAxPsl4YsfW5w9dUMPQBjs0xPi2tbMpNnzFCypykaVp5rCXSo4zyKgjcKanqKsb4tHjtQ==
X-Received: by 2002:a5d:6d0a:0:b0:2c5:5938:e6d6 with SMTP id
 e10-20020a5d6d0a000000b002c55938e6d6mr7691470wrq.35.1677507055310; 
 Mon, 27 Feb 2023 06:10:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a056000100d00b002c6e84cadcbsm7299747wrx.72.2023.02.27.06.10.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:10:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 105/126] hw/ide: Include 'exec/ioport.h' instead of
 'hw/isa/isa.h'
Date: Mon, 27 Feb 2023 15:01:52 +0100
Message-Id: <20230227140213.35084-96-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The IDEBus structure has PortioList fields, so we need its
declarations from "exec/ioport.h". "hw/isa/isa.h" is not required.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-9-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/ide/internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index e6deb1c5dc..84d3722d67 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -9,9 +9,9 @@
 
 #include "hw/ide.h"
 #include "hw/irq.h"
-#include "hw/isa/isa.h"
 #include "sysemu/dma.h"
 #include "hw/block/block.h"
+#include "exec/ioport.h"
 
 /* debug IDE devices */
 #define USE_DMA_CDROM
-- 
2.38.1


