Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273C130D2BB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 06:02:46 +0100 (CET)
Received: from localhost ([::1]:45060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7AJR-0004j5-6U
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 00:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l7AFH-00014v-MD
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 23:58:27 -0500
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:42567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l7AFG-0007za-37
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 23:58:27 -0500
Received: by mail-il1-x12f.google.com with SMTP id z18so21035629ile.9
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 20:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vD0CuwlvG3G5Gb/vqP04uDAKpmcFoTl+ttHz7Ug/21o=;
 b=jTwXvOGeSlv+9fvVjYN1SvW7s9t8/zHbAVKPu6reXITSXK+xBzmkF+annUF2EFW9vl
 8v+QbG7fz6/yrXKPRivFylCLF74v/tExYVkMNiDxbsUB+l6G093h2rpKi1mSQV9fbDD4
 nrquooQV5xTA9len9Emq9SXbMdHbkXPS7djSlcgvbBUKbwO7pMwNdwqFd++kH7x8gCxN
 j8Jy5j2QoCxjwjsIHU0+5KrNJ4kEkYE9BRnRwMLow7BPwzkL3ogro953O6Fb4GdYvPh1
 iaV0OQKdneBDkaoAMIoiTeravp9luGwuYI4M7q07Rvj2gtZFIrgug4oQfHs1jdEwuEV9
 xDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vD0CuwlvG3G5Gb/vqP04uDAKpmcFoTl+ttHz7Ug/21o=;
 b=rzINBNK02F0Aui42qVuQFtx7/wQhkr5DCSdfQ7bhTg5zl29Pv/Yo8z3PDrF2UZhWGv
 xfi1GZDvoHarZA+XgBMVGifo8Rv71WTHCy9uxHgdP48eFwZruZi2aEHjCM06iaPRN4Od
 +CJ9SbijVhrIE/7QrGnkab+GZWxJ+35+z2scAdcmHXssEEuz49vAQ8zEBTOvy2m5g2A3
 qQxzJXjefm9inNyZRXJFmiFb73+jnJt2Ynnnr01QniFfCd4E0gi+YS6CixEsX4YtL59B
 5CkVwPJKXrdUcTgUtZZ235OqIh2MzwSQMYgjBh53a22F1gInSdSAYcIfGBnXJ9QwoPLT
 z45A==
X-Gm-Message-State: AOAM532gzU59Z02108oInKwMsMzBjpigLCCH7QC6FiZ3eCMHldDaj0pU
 Qj6v+bb3AMmzTfrJbl+GbFNJV0Y7fB6R1/nb9WSqfR0AsYVcPFIMy1YRcr+jnByUExEAHojdjmK
 SPQ5YbFSqdbV4gMw3b3CmWQBHFhIgvFFFwCRKwHJnqWXH/e70DyOnLYNYl9/oU/qnaCIskWQ=
X-Google-Smtp-Source: ABdhPJx1ZYiSK4fQ8VyLdGSd48D7C93kyp28s0gwN0vmZzL9n0bpHmH2lJHSrCNJCaPX/Y0D3qbeWQ==
X-Received: by 2002:a92:d250:: with SMTP id v16mr1307248ilg.236.1612328304810; 
 Tue, 02 Feb 2021 20:58:24 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id a21sm529203ioa.34.2021.02.02.20.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 20:58:24 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/4] target/arm: Set ID_PFR0.DIT to 1 for "max" 32-bit CPU
Date: Tue,  2 Feb 2021 21:58:16 -0700
Message-Id: <20210203045816.10953-5-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210203045816.10953-1-rebecca@nuviainc.com>
References: <20210203045816.10953-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable FEAT_DIT for the "max" 32-bit CPU.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 40142ac141e5..c98f44624423 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2197,6 +2197,10 @@ static void arm_max_initfn(Object *obj)
         t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
         t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
         cpu->isar.id_mmfr4 = t;
+
+        t = cpu->isar.id_pfr0;
+        t = FIELD_DP32(t, ID_PFR0, DIT, 1);
+        cpu->isar.id_pfr0 = t;
     }
 #endif
 }
-- 
2.26.2


