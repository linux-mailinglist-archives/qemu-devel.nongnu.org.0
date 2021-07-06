Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECE23BC96D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:21:28 +0200 (CEST)
Received: from localhost ([::1]:58462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iCl-00024x-28
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htp-0000gI-Cf
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:53 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htk-0002Dv-39
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:53 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 h18-20020a05600c3512b029020e4ceb9588so1270605wmq.5
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DltMAJn7Q0ptmA1Qj+5OdFlt7D/C8DwnHW3YDzOE8GQ=;
 b=lmVyUanRz8APjx7NuAy7WF3JOlcFFC/VHj2apOy9X1htN+ZxomRXRAKKIDQW9OIGvp
 4jUBqIlaZ5qcmbxwfqJxQqAdmgxY3FOTkguJkiwshnI+qLh7O28e6nvXe7LNAcgVismu
 hCnmnjRY2OCt4ZhfT1uzEJV+4HesFnmSws6zL2+uKQwXj80581awgKMHH0j535qflBNr
 bbgAC19xfRu1noVISj/r0pkmXD7O2AguYiD/o1Wm7ixTkQmwg6tN8+Pfpuq707J78ZqQ
 cwPdtToj3qlGKd+IrVjk55p0QkZkTYgU5luXzeoJpNi9zeJ4Zjj24KUQj2FPcFcegiDF
 nfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DltMAJn7Q0ptmA1Qj+5OdFlt7D/C8DwnHW3YDzOE8GQ=;
 b=M5WTkoGivY1PiLb5tQQ1RxKewzLiNkENBn/ghFGzIJAj/6gajNRlGlTgqafQkLU/GZ
 ySa/FNIQ5aYrotEUSPhNVuWWpN2WO2j5Ln0eCzHGMRjzT64gggv3DXkocTHUzHzkmpsQ
 6LbrX1E/OPKIIhH+AjcydH1y3t7cYDmgL8CSHxNOzkLr19qXGe2hLcN02f7HD/rOOxM1
 E3AP1WIVMxD4bXSzYOgQxpEJXk2LDxM6prJfKLkYjf+VOMInFMOTpGNWBS8021nW9CRJ
 Wvneru4MPkDQkX/xNT5t1OPuTJAEdYpzx2QTdkpXkfNFstcshSUwQSh8YfiYzU1dUHfW
 eKtw==
X-Gm-Message-State: AOAM530ubZgeMIge70ketJOcYeJTPb5UGNEZr6530ZkY3aol9Z6yP+lp
 cGcMAoBSecFwPUqGBMWx75BQ05GCx60=
X-Google-Smtp-Source: ABdhPJwajgVSt+KFTYepEufz+PjGwLHy14MuBa9VYqOL+Sj881C3ZgXv57J8jqnGDvNW9vPjBDjjOw==
X-Received: by 2002:a7b:c218:: with SMTP id x24mr3841120wmi.177.1625565706784; 
 Tue, 06 Jul 2021 03:01:46 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/40] coverity-scan: Remove lm32 / unicore32 targets
Date: Tue,  6 Jul 2021 12:01:07 +0200
Message-Id: <20210706100141.303960-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

lm32 has been removed in commit 9d49bcf6992 ("Drop the deprecated
lm32 target"), and unicore32 in 4369223902a ("Drop the deprecated
unicore32 target").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210619091342.3660495-2-f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/COMPONENTS.md | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index 02a3447dab..183f26a32c 100644
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



