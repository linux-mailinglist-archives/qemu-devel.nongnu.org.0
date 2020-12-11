Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B3E2D6F89
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 06:16:07 +0100 (CET)
Received: from localhost ([::1]:58658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knamj-0006jf-Su
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 00:16:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1knal8-0005qv-8y
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 00:14:26 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:38537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1knal6-0001RI-RG
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 00:14:26 -0500
Received: by mail-pg1-x544.google.com with SMTP id e2so6361155pgi.5
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 21:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v0JHzy0Ta5fehdYhfT6YCukRceZeuP8yRCzh8zxFvO0=;
 b=wMXZIt8YK6pTBLpXZFUgHWXh5ox3P0rOJOtEW+10QpSdqEgiG8cmgCQgrGOSUYgvOh
 O9gchJzc46MioG6xGgSKoqsoG+K6/GLeB1lKhy/+X/IPHx+L00DiY+R0wqw/XEm+6Ifr
 oygiCNU36AK1ZenaDaM2Zbs9plZxp3/6h6PR8eBlwKHQjrppjG6OZyfH/+D4C9WCN4lH
 KjebeAz6ERMsm2qeF8F9Dmkwc5fg/zro53PudoAnE/fQzCnNyyBzzEti27XAdOdZRN8a
 Uqmp8F/IPb+42pLMM7a65M6K69TxrGTRITMVfthVwlo4CrLh2hzAAw98hOR0lPLpxe7H
 SdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v0JHzy0Ta5fehdYhfT6YCukRceZeuP8yRCzh8zxFvO0=;
 b=F03FWkhDG9KSfczdGwjuyZKBa7pJzZ6xvO744jhWVj4lBtHRd3gOLVzOuGIEarUHLP
 JUyLI8ByRJ8HdP1XGHZLts1lAkBcnAxpRJV8TeSeztg/1cczafM9rloLtOLVeF5ZeTdp
 osP9YsPup/Qb/c0/b9bNiK7JzkTzGVDXAsX4xaITu2nAUWSraLsSuTW9e8PJTV3l4WlV
 WNzGsxlr8u+/gDIkPEm0s7MCYz0BOpKmaSejKtXelLy52HsrF6SL0xPNylIKbJdHOriF
 Y1lqN/555hj3xo7nz7RznkA305s9R3IeKOdWLDh7rUC83dXkI4uoJzOl8Cd+Siv7WjyW
 b1Hg==
X-Gm-Message-State: AOAM532lGNy4eae2mqYbzPPpMK9ScH4fKInU2fx31EqxwzHQHqNO+hnD
 c9dcZSCt4WTZzZpTD5wEXZ2qF8zzagrjz4n+zgldJZLgeEnToE/04mB1cYw05/baGiY+huAVo3v
 IOmHZHrAMCNHsRIENdtpVpmC33qAR5BJvTFa8SjUPNPV2yNtMdAKtDll0q89+m4+04JnG9rtBbw
 ==
X-Google-Smtp-Source: ABdhPJzp+sfzEBLV1YEKqFViz+bbm/PignwlIJEJeccStdDRgccyv2Gbxm3+A+3Bs38zkW4Zwnme2A==
X-Received: by 2002:a63:3e84:: with SMTP id l126mr10045952pga.39.1607663663020; 
 Thu, 10 Dec 2020 21:14:23 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id h8sm8293554pfk.71.2020.12.10.21.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 21:14:22 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/arm: Set ID_AA64PFR0.DIT and ID_PFR0.DIT to 1 for
 "max" AA64 CPU
Date: Thu, 10 Dec 2020 22:13:59 -0700
Message-Id: <20201211051359.3231-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201211051359.3231-1-rebecca@nuviainc.com>
References: <20201211051359.3231-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=rebecca@nuviainc.com; helo=mail-pg1-x544.google.com
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
 Rebecca Cran <rebecca@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable FEAT_DIT for the "max" AARCH64 CPU.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu64.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 649213082ff9..223e0bfd22c2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -641,6 +641,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
+        t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);
         cpu->isar.id_aa64pfr0 = t;
 
         t = cpu->isar.id_aa64pfr1;
@@ -689,6 +690,10 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
         cpu->isar.id_isar6 = u;
 
+        u = cpu->isar.id_pfr0;
+        u = FIELD_DP32(u, ID_PFR0, DIT, 1);
+        cpu->isar.id_pfr0 = u;
+
         u = cpu->isar.id_mmfr3;
         u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
         cpu->isar.id_mmfr3 = u;
-- 
2.26.2


