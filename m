Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A693F3C14E9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:14:05 +0200 (CEST)
Received: from localhost ([::1]:50564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Umy-0003Af-LU
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1Uke-0000RB-2T
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:11:40 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1UkZ-0002X5-I7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:11:36 -0400
Received: by mail-wm1-x332.google.com with SMTP id j34so4173114wms.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ypcer0K+TjkxtkSvTRCI8hZzkA/fkAGIRyrUc0lGxkI=;
 b=UhVwnFYYlx9j0cB/KgPqZdw8atp1GdVopJpfSpy6PUlOKvkhpC9w2OwTbx35JBdI7/
 pmNB7EK9eayFk5PYQZc2ZyMPSLUqovnfINDrEJW5dG0ncMB+RSHGNB3EZzTXNqBZ25lz
 DFJzmCVpwNlB9XLSAXVLN5fmglxzAtEDjSKPRI952LVH4vEjqvH74HhbqWO2Ip9Z1cuR
 0/QIcBkOs+MBF82nKW65ls+HlDbaVOm2iQM4kN/z4dsV3yqXC84sbcpLOPnExWIFqTWe
 zysZssBTInYelYINb7kdi4YJ2MjszpEZl13MS0hDmij+ov3LsaZACi1ccChXAkqgKs6M
 0Trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ypcer0K+TjkxtkSvTRCI8hZzkA/fkAGIRyrUc0lGxkI=;
 b=dXoGBVGQTzXL1ptOBitcevu0BZpw0Tm3A9q8L9MwSLyDEssqt2TaHf2nZgXFEONoPY
 TW/nNLkUmRidzcKI4gK+FT1l/eD/DojqFA647NhK6Dl4+c9jMlGBuuCJ0qvO8QoKBhRS
 MgTh/w/+19CSC0CmURzyfsH1L2IWgVj72hTZwrgUFI+zoEoX1+kJhSNa1wclCgYYH3Bz
 gypEUjLsBX+9SOpubWH60JyM9WBYvZ6mgFgejATDfFEaAo36XggJJUtYIjd/xnpQ8RR0
 oZzaNok1QSGlud6d6d3KucthwMWBrsozkM0A8WPnkEURrcGEL/k/EGRAtqLyjmZ1z77q
 XLEw==
X-Gm-Message-State: AOAM530hcoaDEXFlr7dK5yVRgLpb9yf9bc4442+ArYZomYx4OWiu5xPu
 BIW6rslstE8V886e3GqeEviMHv9KC7M=
X-Google-Smtp-Source: ABdhPJyAiBD6e99wQI4HuGetL1a9OP/OjxOumwRaW2A4WYIO+qKMiz+s1CEO4m58FN18TOYz3EeEXQ==
X-Received: by 2002:a1c:f717:: with SMTP id v23mr5503725wmh.32.1625753492155; 
 Thu, 08 Jul 2021 07:11:32 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t17sm2322651wrs.61.2021.07.08.07.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 07:11:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] linux-user/sparc: Rename target_errno.h ->
 target_errno_defs.h
Date: Thu,  8 Jul 2021 16:11:15 +0200
Message-Id: <20210708141121.1731691-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708141121.1731691-1-f4bug@amsat.org>
References: <20210708141121.1731691-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to have one generic target_errno.h (API to access target
errno), and will add target errno definitions in target_errno_defs.h.
The sparc target already have its errnos in an header, simply rename
it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/sparc/{target_errno.h => target_errno_defs.h} | 4 ++--
 linux-user/sparc/target_syscall.h                        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename linux-user/sparc/{target_errno.h => target_errno_defs.h} (99%)

diff --git a/linux-user/sparc/target_errno.h b/linux-user/sparc/target_errno_defs.h
similarity index 99%
rename from linux-user/sparc/target_errno.h
rename to linux-user/sparc/target_errno_defs.h
index 9b846899cd4..e0008109867 100644
--- a/linux-user/sparc/target_errno.h
+++ b/linux-user/sparc/target_errno_defs.h
@@ -1,5 +1,5 @@
-#ifndef SPARC_TARGET_ERRNO_H
-#define SPARC_TARGET_ERRNO_H
+#ifndef SPARC_TARGET_ERRNO_DEFS_H
+#define SPARC_TARGET_ERRNO_DEFS_H
 
 /* Target errno definitions taken from asm-sparc/errno.h */
 #undef TARGET_EWOULDBLOCK
diff --git a/linux-user/sparc/target_syscall.h b/linux-user/sparc/target_syscall.h
index 15d531f3897..dad501d008c 100644
--- a/linux-user/sparc/target_syscall.h
+++ b/linux-user/sparc/target_syscall.h
@@ -1,7 +1,7 @@
 #ifndef SPARC_TARGET_SYSCALL_H
 #define SPARC_TARGET_SYSCALL_H
 
-#include "target_errno.h"
+#include "target_errno_defs.h"
 
 #if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
 struct target_pt_regs {
-- 
2.31.1


