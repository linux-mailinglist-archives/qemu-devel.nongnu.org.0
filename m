Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CB53C189B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:46:47 +0200 (CEST)
Received: from localhost ([::1]:51538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Y6o-0006oc-6g
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1XTR-0005oL-7s
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:06:05 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1XTP-0007ud-Li
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:06:04 -0400
Received: by mail-wr1-x436.google.com with SMTP id f17so8406510wrt.6
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RvhI9ksEymOOKWa366gN24dtSn0gH6JxMPD3K+ppmiw=;
 b=TmKOfq8+U+bmlFZEKXtm0L2vFWmYgXhWRxFYbsE3YmTLyrOErJtI73eYYT8irowRNS
 Pzf2/lhHqg9/pzWQ9hXvVBZiSOKIhzj4dzWr37D2CVDpKW7AJ+YJ057qEPvRbRhjVStF
 4eXucHjVYO3XRvrnyITc/Ms0s6yEIDGIPTSBDNLJA9ZdrKB6R2Keqk6JTPaUDvXEhWUS
 KhumjcuKj2JI2TA8Jl9S8KMo36gY93cxXyEuXlFhg8qK//cj5l60xwGGTHj00t0ENSvK
 sS9y7ZpCI0BLtB0J/dWALm0WI4e22erIxdmOSzfMs4Ac4N8KlzugzR1XwLp8hS44fT/z
 mU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RvhI9ksEymOOKWa366gN24dtSn0gH6JxMPD3K+ppmiw=;
 b=Rr45YT9sExanxEG10ng+7YbZZzlXPwUaah1gAZZbxtvDl2uu4hnoT3BCfxIwaPAaIU
 N1LGFo2W5ntthLByQnj9Y6Ds1t3u87eLLkghIgv3FoWzfP8AxDKXphYPlDL6kk47H1Rl
 raFk/KkWMH155ij7xXxDRnPS4nDFSrl5BfVbFuMilVDpTtTQfzdtSq43j7iF1q3wFhSR
 rHDsW45YJZB6WI2FYgFxP0MOvuumZn274BRwSLeNKQR0nE0tOEztnln7iMMMmwGcPTQQ
 MVpp6pnJEOjYW66NGpzvCOE5uINFvR9HaZ+2/36iV+1al8Z8Ta6Qosf2dnNUS9FnPGnM
 SvHw==
X-Gm-Message-State: AOAM532sd8VF+IYDUKFOkTaEtrIB2HRMNCGLj7091Hb2o0PX447dEG5V
 1+8S9poroCsE6vspPep07/O5Ve9K3NA=
X-Google-Smtp-Source: ABdhPJx31+JKNN9NPkqVx3Xd2LEvMal9nOYBVq4ohaaNisaJ51Q4q+ggfRFiSgtYkq0avvC0n25pjg==
X-Received: by 2002:a5d:4c50:: with SMTP id n16mr36086701wrt.249.1625763962191; 
 Thu, 08 Jul 2021 10:06:02 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s24sm2929205wra.33.2021.07.08.10.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:06:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/8] linux-user/sparc: Rename target_errno.h ->
 target_errno_defs.h
Date: Thu,  8 Jul 2021 19:05:44 +0200
Message-Id: <20210708170550.1846343-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708170550.1846343-1-f4bug@amsat.org>
References: <20210708170550.1846343-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to have one generic target_errno.h (API to access target
errno), and will add target errno definitions in target_errno_defs.h.
The sparc target already have its errnos in an header, simply rename
it.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


