Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97BF4A8CF4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:09:34 +0100 (CET)
Received: from localhost ([::1]:43964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiQ9-00050H-Qw
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:09:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFheB-0002t1-2s
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:20:00 -0500
Received: from [2607:f8b0:4864:20::629] (port=36495
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhe9-0002Mr-CP
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:19:58 -0500
Received: by mail-pl1-x629.google.com with SMTP id x3so3038098pll.3
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DQdof7VmG4fP9HneeQI67zQ6Mp9xoMA/D8cCJfYkxBk=;
 b=hCy5k1c8AfpBE3r6hslGNIMfIWuOL37Lof+ogIHiqysKDSP79lIXOl3rl94+xmmJ+W
 j+Fiv/L5UZ8QHVKY1nF7SlGhKHNwA8vTAbjW9P5buphek1xKojl689d3/7RrSAM+sZKg
 0ksBSbDG9w3BIRfMl/NVeuA4/ZhXffdX1HnrO7G56wcyXrdskyQ+iidh0i9UFlf3laZY
 SRnPvt0mVSxprwdjEvoUHymAn67v9GpAla3mPTDj7Ij2qWoDAfNuc0E0LTQsuYsbgpao
 9+tZJBj97tepWcEYwFMwobaw5VvPg15uZFWLUR+K916FMrPtBhh8iG+acVellgLkK9Iu
 npfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DQdof7VmG4fP9HneeQI67zQ6Mp9xoMA/D8cCJfYkxBk=;
 b=enXXIQyMvizUutwMA6HIFqREmNVN4jaciSdAwtbIR+7id9wcZD1IotthyUsZRkcMbe
 OM8ReJzHiTr1MJP0yO0eMnmTMAYq0ix/5mbhdGflqfBOV68NsJxUBk4cPrVHfnPooWNU
 +Ngqi7zhynBTDbS5213C0TsBcr/l8TNqtpHjzfaP6H3D+8LxuGi97vjXFgmGcrYlNcsQ
 azFk3sCAh4xW6foXkZxHfqXsi8m7Eu4q7aGcTNAm6i7OY7/dz7SUdn2rZraY5EvOKR65
 6OVMRSsSCM8Ox9hnnNQyn+1l3qCIROSG+imQLg/Hto1w/ib8tutcJ7BbasKvfaGCgwIx
 RexQ==
X-Gm-Message-State: AOAM532/L/ARLTdYpT+797zGJYxRg2rXZ9vcdebXx7H2jGNdzM/+4m7s
 1wsXRPA+AoRYG3bToOMcP3jhkDGEpQA=
X-Google-Smtp-Source: ABdhPJx94xQ/8eZKVsYSzsHGAll+uSZ5w3Wzxcp9iAeeCzVfAEzKDJ+nNvE7ktPVUb2eQ/sUoJG/2w==
X-Received: by 2002:a17:902:9a06:: with SMTP id
 v6mr19833326plp.109.1643915996055; 
 Thu, 03 Feb 2022 11:19:56 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id s10sm17849172pfu.186.2022.02.03.11.19.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:19:55 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 12/21] softmmu/globals: Remove unused 'hw/i386/*' headers
Date: Thu,  3 Feb 2022 20:18:05 +0100
Message-Id: <20220203191814.45023-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/globals.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/softmmu/globals.c b/softmmu/globals.c
index 7d0fc81183..3ebd718e35 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -25,8 +25,6 @@
 #include "qemu/osdep.h"
 #include "exec/cpu-common.h"
 #include "hw/display/vga.h"
-#include "hw/i386/pc.h"
-#include "hw/i386/x86.h"
 #include "hw/loader.h"
 #include "hw/xen/xen.h"
 #include "net/net.h"
-- 
2.34.1


