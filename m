Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532762BB847
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:27:03 +0100 (CET)
Received: from localhost ([::1]:52128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgDvp-00044j-HR
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDgR-00050B-J3
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:11:09 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDgQ-0004ZK-5k
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:11:07 -0500
Received: by mail-wr1-x441.google.com with SMTP id m6so11689600wrg.7
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s44mYLGUlM6uamsgG+YNsLF+fke2Wh0JOve4ukdROjw=;
 b=iBAr2j7iKQa3f6wJ3DCzZ6LE921omTEaT4kDQarshFqOLk+CC5Rt+MwYNIbrbKwR+h
 BZSJSLcEL+XXKEygJcLjwCkdvuUDoIVWWCuiZn1m9qO6lLqUOtG4SHDYO7AB6iPnEVIb
 Ukx0neEPt4pX2jwSxlmZi+rA8i69UVTJxxdn1TjaW3GLbth6rql8sh0JplE65dWN3jvg
 zlJEMy3ljPEtAhiVqQD1PrP5XKMV7C7ae9lFQcfQQz9YUiq3jw/86S9Q+Zpv3a1Pgxck
 FxwRgyt2+RyiQzAtLiFrMzkNeuQKPQHX+rCemOUCvYRvtRb/PBOLiFg7hSuWZSgZkngA
 lNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s44mYLGUlM6uamsgG+YNsLF+fke2Wh0JOve4ukdROjw=;
 b=lLC7bssxzbmyCOzMUcE7g5H9KKKOG2yUKc0NUFH20B98WtQSTtAHnR6SG6uTdgs6CP
 TotSbSm4t1aoPvXyvor3XUtfIbfAXqoR/ObtVq7HQsUJkHKs8ryIS+bxJflL1Cgr12U/
 JfQO2M7DL2G4pKgGAPXkhF4JlLfSzKsC4ET3A3inx1EF+JwFz2sMsCWlmFEmYl4loCHW
 Nh119/3ygLNAA44xkt5TtO3gEyrNIsKa5LAaoh0P9zWNzVizpPe//NwjiHyAgYgKdG4N
 HUQnemRdi282S3R05ThSTEmhDK59VAWtRWUi6HHk8CDT8/PsP8qILFO9mBj8KGXphbKF
 G+5A==
X-Gm-Message-State: AOAM530lReVY9mhmy7MJA/Q6Drt9FUDd0aD8Qn6KEaApKQrKsj2hyGWv
 jtwDtAaNxib84azLiCJj0YtCVCg/tOE=
X-Google-Smtp-Source: ABdhPJwv4YH7zOvp8RgF3T1iCe8hPLAZvyHbr7F5HKcBWYE1AeZQjIlKhLv46bNM+fPq1csO0nxMwg==
X-Received: by 2002:adf:e5d0:: with SMTP id a16mr19599175wrn.340.1605906664235; 
 Fri, 20 Nov 2020 13:11:04 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id z6sm5685798wmi.1.2020.11.20.13.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:11:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/26] MAINTAINERS: Add entry for MIPS Toshiba TCG
Date: Fri, 20 Nov 2020 22:08:44 +0100
Message-Id: <20201120210844.2625602-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an entry for the TCG core related to Toshiba TXx9.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Adding Fredrik Noring in case he wants to be notified of changes,
patch conditional to his approval.
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b6d98b95c47..d97f0f1d66e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -253,6 +253,12 @@ R: Craig Janeczek <jancraig@amazon.com>
 S: Odd Fixes
 F: target/mips/vendor-xburst*
 
+MIPS TCG CPUs (Toshiba TX)
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Fredrik Noring <noring@nocrew.org>
+S: Odd Fixes
+F: target/mips/vendor-tx*
+
 MIPS TCG CPUs (nanoMIPS ISA)
 S: Orphan
 F: disas/nanomips.*
-- 
2.26.2


