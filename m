Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CC4288FAA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 19:14:13 +0200 (CEST)
Received: from localhost ([::1]:40608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQvy8-0003Vh-1F
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 13:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kQvd0-0002sd-5C
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:52:22 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:39161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kQvcy-0007j3-Oi
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:52:21 -0400
Received: by mail-wm1-x343.google.com with SMTP id d3so10489764wma.4
 for <qemu-devel@nongnu.org>; Fri, 09 Oct 2020 09:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=II5s3PrMx9JAfE6WS0RKBXpeNP3nxGPfnMgubn1ABWk=;
 b=VNmTp/mBphBw/u1iYjn8uX9qv4TA3xSy6r8T1JQEbfeTUuQ2K2SnjNHM8UkaSvAN+C
 vB+ffrGfpJoWKhrvSJeKjsGEwrgFPKWMzQ7rAin5wySCNsH3h4p7R6D5v4XRjreGD24t
 bVdMi1troDM8fvmPa4pj7i3uIg+4v1yLhP3VuVfMnNViGCS3lySeDsQyrTJBQ7C2bewf
 r6D1A8waxkNXtN02FDnYVcffa7X2D7SeAWJpdZ0xsCyAW0Hhxwe3nxmoXy4uhMtzbnUw
 ljzLO5sJZEa0eMU3FXQ70XG4l8y2cnPVPI48AUTvYvhLKnitTG78tFqykqDdYtkZ3TuZ
 Aqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=II5s3PrMx9JAfE6WS0RKBXpeNP3nxGPfnMgubn1ABWk=;
 b=VoOjXy6L3xE4FgzYg0QhjPVSXHwg67QTWCVeJoG+nh/TTZxqARr1+KH0KQYkUkbV+a
 I+UBL9aAdi/Brdbls3AgCUOfUni0l1PiZ58rVae44KGv/L7Bai1GqBZiSBZVPQfTldkJ
 /iaN0hBG4INHn6pihZL2GX6/p4zLO1X8pL4gg7H84a4m2y2NWZ0WIuA5koxuPBuyapCe
 H/u2x0TkyTuIxncySe4jqDcIhItmtftY5DyKZJjxGjqS7sQsql1SFmNF0dldYWNceKe/
 CLYBe9JQoyrOhlsiXAO7Tzr/GYLxJTi2vL+YvnDzg8Y9kYG/mMICS7ygnj13DabKh94w
 lRTQ==
X-Gm-Message-State: AOAM531KV7mnLZxkKCDTbrYJuJ+tzKwIM+iF9QIEohQ2dXyUdD2RQ3A0
 N5BkWm3Rh1qEb8XIlKjyWkmKE9gQPsA=
X-Google-Smtp-Source: ABdhPJzRaVThMZD+kZ+tZbfusKhA+3+eD/b9QrIuSa2/xsOAXV/ibqvSUnchdv5Vl0i+1bS3AWvZHA==
X-Received: by 2002:a1c:f407:: with SMTP id z7mr15094987wma.110.1602262336315; 
 Fri, 09 Oct 2020 09:52:16 -0700 (PDT)
Received: from x1w.redhat.com (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id p13sm12777125wmb.5.2020.10.09.09.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 09:52:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] MAINTAINERS: Move MIPS GIC timer files to Boston board
 section
Date: Fri,  9 Oct 2020 18:52:08 +0200
Message-Id: <20201009165208.2905569-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201009165208.2905569-1-f4bug@amsat.org>
References: <20201009165208.2905569-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
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
Cc: Chen Huacai <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MIPS GIC timer is only used by the Boston board.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 702f73823fc..62db288bfc4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -233,11 +233,9 @@ F: docs/system/cpu-models-mips.rst.inc
 F: hw/intc/mips_gic.c
 F: hw/mips/
 F: hw/misc/mips_*
-F: hw/timer/mips_gictimer.c
 F: include/hw/intc/mips_gic.h
 F: include/hw/mips/
 F: include/hw/misc/mips_*
-F: include/hw/timer/mips_gictimer.h
 F: tests/tcg/mips/
 K: ^Subject:.*(?i)mips
 
@@ -1167,7 +1165,9 @@ S: Odd Fixes
 F: hw/core/loader-fit.c
 F: hw/mips/boston.c
 F: hw/pci-host/xilinx-pcie.c
+F: hw/timer/mips_gictimer.c
 F: include/hw/pci-host/xilinx-pcie.h
+F: include/hw/timer/mips_gictimer.h
 
 OpenRISC Machines
 -----------------
-- 
2.26.2


