Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB11E2D9F84
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:50:06 +0100 (CET)
Received: from localhost ([::1]:38228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kosv7-0000GO-PX
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:50:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosjh-0008B4-JE
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:17 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosjf-0007Qg-3l
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:16 -0500
Received: by mail-wm1-x343.google.com with SMTP id 190so4449900wmz.0
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8LC7/cpbLmFmCpCdsWMBAZLA2elqMbfY/U5LRkkEQ4w=;
 b=URmAnvrSw3+rmfGrZ+no4b5Lcrec0Kqp0lNe2JuQLRP1bILan3ppJpC/IQgdIxKs7Q
 +bmK30fxdvE58S0Y+OwPM2NwWrZ4n0TOwtfDJXZxIQOngo9u2a4EoKzUM775qmkjXWwE
 h63BP5nBBLU3zGcT/LFFQmV4Jk8O9Zvz2MJmEmycHnP/xdX3xAQyXXJPO+FemWhalK50
 XcchaHG1hnu4sMNw8XAdQDRxgRhbiO+qjRzicNrFi2Uzl9R+qYHGKVXwduOcD+JYHLtL
 aBLjhH8t3ODfbEBG47jOTvxH1aURoBSwVWpDrtpB0tX58NLt+V7o4NJKj9YeEwRbgm7W
 coHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8LC7/cpbLmFmCpCdsWMBAZLA2elqMbfY/U5LRkkEQ4w=;
 b=OPDqe6HMSZTVTf2YJW8Xs4j4KRNXSb4Le6zVjALECqfzR19UF5YmYfQU2Ku/dHEakM
 ecGTQa3IR7a/mXAe7xIGTowEZ1xYr+4/ObVGyJ+QlNo3LA2DtElc/B8cY21XRz554zSK
 kwN2YJkkEKYWwm1gVaeoWCCsakQe6Whlm9wIEkxvyfgchzvPRH6RrZH2TQA7+0kKv1io
 3W/bOyUZHUh3gbFabmWXBocwxzlLgHDMkai11k1aAtudHqf3yJoU7n+UWq0+PP4KQ11R
 wtuGM/b5PUlM5/PZGqLTzmhy16weYzQwZFlphmz1VwZmDx5RhWrS2+kIsfs/q4qbEim1
 JEeQ==
X-Gm-Message-State: AOAM5305aHVOyiKta27CBNdKXvKC8K22KZtAXqI6sVh62eAgCP/qqe8+
 hV4iJnAxjue/6GRILFSfiMT4grL2SiA=
X-Google-Smtp-Source: ABdhPJypoAc+0LLSY2eLKsIDkQhh04/COoZyQzQJoudCNtNC1CMePgXrJmRksR8sstCKXszd7R/AUA==
X-Received: by 2002:a1c:7d88:: with SMTP id
 y130mr28665528wmc.158.1607971092851; 
 Mon, 14 Dec 2020 10:38:12 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id v20sm31460263wml.34.2020.12.14.10.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 10:38:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/16] target/mips: Rename helper.c as tlb_helper.c
Date: Mon, 14 Dec 2020 19:37:29 +0100
Message-Id: <20201214183739.500368-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214183739.500368-1-f4bug@amsat.org>
References: <20201214183739.500368-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This file contains functions related to TLB management,
rename it as 'tlb_helper.c'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201206233949.3783184-13-f4bug@amsat.org>
---
 target/mips/{helper.c => tlb_helper.c} | 2 +-
 target/mips/meson.build                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename target/mips/{helper.c => tlb_helper.c} (99%)

diff --git a/target/mips/helper.c b/target/mips/tlb_helper.c
similarity index 99%
rename from target/mips/helper.c
rename to target/mips/tlb_helper.c
index 59787b870b8..2e52539a511 100644
--- a/target/mips/helper.c
+++ b/target/mips/tlb_helper.c
@@ -1,5 +1,5 @@
 /*
- *  MIPS emulation helpers for qemu.
+ * MIPS TLB (Translation lookaside buffer) helpers.
  *
  *  Copyright (c) 2004-2005 Jocelyn Mayer
  *
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 4179395a8ea..5a49951c6d7 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -4,10 +4,10 @@
   'dsp_helper.c',
   'fpu_helper.c',
   'gdbstub.c',
-  'helper.c',
   'lmmi_helper.c',
   'msa_helper.c',
   'op_helper.c',
+  'tlb_helper.c',
   'translate.c',
 ))
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
-- 
2.26.2


