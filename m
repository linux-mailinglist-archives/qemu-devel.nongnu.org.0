Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C463AD8D9
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:16:25 +0200 (CEST)
Received: from localhost ([::1]:39414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luX5U-0001c5-KX
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luX32-00086V-PK
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:13:52 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luX31-00030h-6x
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:13:52 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c5so13514152wrq.9
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BvKMe3oWEbO1av98NICIfQXQFyycm7JSAQGsZ/WQNoY=;
 b=fFYTeIzUOM47+GSU2VbI+nEvNE1Y7kVxQmpN4gS2mvPPscKTs/P7HY7gyVOgdc/APa
 ptmvM03n9CLXdAnUELDU6SQEnL5SI+Mkq/8Ki20dlgFyL3evPL1f8s9QZSsS9T5q0x3T
 d+LazWYjrLPhqBRabEk6VHzH5FWDMKCFkSLCunAvFNfwmTlLAFFB3bx1hDsUhqRwP1zG
 GrKZprzSgX5SQkXz1WLVORrIXtwQOAQBrYAu+UOyz0WSinaDbV+FfDMKrx6cuxMdMnkQ
 Edy9W+pAf4Hfvhre6rihMYx6puQ9ztF2WVtqSH4HACfYIBtrqLSDK8it4MsT1lv3TBNX
 aoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BvKMe3oWEbO1av98NICIfQXQFyycm7JSAQGsZ/WQNoY=;
 b=WomdNgkGnxllWzapsOhJecu8XtB/br4kRaUM6sCqE0jReXFrdVyaWKHCXTPeKqNzx9
 ZVVDJDQzZLk4u1i+w8NVVIY1zOuUUTNduMZs79RySZJG+E46icKGrrsUF/wR+zrkXqLm
 Ke4gPlKX1r/Gl0pJ8yWR1YbcHX0D3OVsbK7unfKjA9EH+o2Ms6e6zQm1SqOr6AlveyZo
 PF78pGdJPQY591rhtI0W/kM6bCEc5RgFehGyCzq7QiH5jX/l+CDNiQAAVwqKb4ddYYcT
 P/aTcmfYc3lxpsV6hyAKBo/wDxRi8apcmuDrTA2b5ispqwcMpfgB1p1f0LLPdoimILtT
 Nq5w==
X-Gm-Message-State: AOAM5330vZgoIZVlxMJaKcFIqHcNYSP9N4b50BTcXCrUBVaZddGZlFZF
 jtGtdAYGReVUNTynGfrxnJNx/Jg5ZW38Vg==
X-Google-Smtp-Source: ABdhPJyZtb6AJtJjf/XP1wCAfPOmX4Kv+kgmEUsGGhJXopmeCcpFzJ5OdF97x1j/xJ0nUfNrLcchcw==
X-Received: by 2002:a5d:4d43:: with SMTP id a3mr16867466wru.312.1624094029368; 
 Sat, 19 Jun 2021 02:13:49 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id d15sm12043300wrb.42.2021.06.19.02.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 02:13:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] coverity-scan: Remove lm32 / unicore32 targets
Date: Sat, 19 Jun 2021 11:13:41 +0200
Message-Id: <20210619091342.3660495-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210619091342.3660495-1-f4bug@amsat.org>
References: <20210619091342.3660495-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

lm32 has been removed in commit 9d49bcf6992 ("Drop the deprecated
lm32 target"), and unicore32 in 4369223902a ("Drop the deprecated
unicore32 target").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/coverity-scan/COMPONENTS.md | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index 02a3447dab0..183f26a32c9 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -21,9 +21,6 @@ hppa
 i386
   ~ (/qemu)?((/include)?/hw/i386/.*|/target/i386/.*|/hw/intc/[^/]*apic[^/]*\.c)
 
-lm32
-  ~ (/qemu)?((/include)?/hw/lm32/.*|/target/lm32/.*|/hw/.*/(milkymist|lm32).*)
-
 m68k
   ~ (/qemu)?((/include)?/hw/m68k/.*|/target/m68k/.*|(/include)?/hw(/.*)?/mcf.*)
 
@@ -60,9 +57,6 @@ tilegx
 tricore
   ~ (/qemu)?((/include)?/hw/tricore/.*|/target/tricore/.*)
 
-unicore32
-  ~ (/qemu)?((/include)?/hw/unicore32/.*|/target/unicore32/.*)
-
 9pfs
   ~ (/qemu)?(/hw/9pfs/.*|/fsdev/.*)
 
-- 
2.31.1


