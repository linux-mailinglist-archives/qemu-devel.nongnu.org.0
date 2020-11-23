Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116AF2C176E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:16:30 +0100 (CET)
Received: from localhost ([::1]:44608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJCH-0005hd-36
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:16:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIjx-00034m-T7
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:47:17 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIjv-00020v-QL
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:47:13 -0500
Received: by mail-wm1-x341.google.com with SMTP id s13so733887wmh.4
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qKnuSsMcPcENLKBNnohxCclJvsUgxb6ZminldHfrSRI=;
 b=hDfcBBQR8dayGQHjOcgdZNgSvfsUYeQ8BSljhsqEpVZGAQJBj24E5n9lgheMbTReq5
 mioHCk5YGzwt83Vq+VwbtrOvFqV8uaTW1JxQueUwtIXX/2TLD0isaqMI13R3OARf6+fu
 8zF7twoZdUcWvyao8uLuEUIR+Kw43blaDbX59zRS2zpsQ4QRKIloueEbB60V+sMhZ6SU
 vR55LHETB4o8/+O0DT3NqI0PV7busZZg03U7e5k4jJfpM7clrDyZNDcrOKVyBrbOwI/C
 pd8lCDt6i1mjx2sMiZfU57sbt2IPzAvuFDsg0mNAEoCZFOGfhTnFO75Z03w3Db/D4Dqw
 WTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qKnuSsMcPcENLKBNnohxCclJvsUgxb6ZminldHfrSRI=;
 b=k+S8Xyo90CJkb5t3ryHk8x/6O6OAew79WITklOlJv2l4IzpilQWcrSvKzbDdzKqINX
 3UArFS/bOGhj4MTWkl+6D/EJJfdRPKCSHBD4JFJpOhxxUQUkjpGLOnhqK5SROaM6wDvc
 +HxUt36uwpSVi014cJzSLDYOAyeKCkxAb/jEJMKEq+/p+ZYwz4tHUAAjU1CSGOfAF1fu
 G4Smi32V9XYO1naoBYxJJ51ygi7vQuRBn3c6ZpHq3kVe4XVTQ3oZLufV7LKTY4k+Md0L
 0/usE3tGToq766MRP9ViOgrbO/lDQtvHACLj0sDSz3FX1hf2+LB7YMeQO9uYennOnwLp
 SR/A==
X-Gm-Message-State: AOAM531bIZ6PJRNWh7PT79VtcfKfs2z8JELTZGk2dkSTN3uHY2xwUGUI
 H6+OpYzncg0HUywpoZdiMuPunsrJ84s=
X-Google-Smtp-Source: ABdhPJx2Q16tyKADDf28Q7fJo0Yd8NafXX3YqRfXfWwUSxnxHiJj2zRm3z0JsaS4l1UqxlDWpiC+DA==
X-Received: by 2002:a1c:9ad3:: with SMTP id c202mr691669wme.43.1606164430077; 
 Mon, 23 Nov 2020 12:47:10 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id f17sm920931wmh.10.2020.11.23.12.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:47:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/28] MAINTAINERS: Add entry for MIPS Toshiba TCG
Date: Mon, 23 Nov 2020 21:44:48 +0100
Message-Id: <20201123204448.3260804-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
index 976d23508c8..7b70cd9a799 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -254,6 +254,12 @@ R: Craig Janeczek <jancraig@amazon.com>
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


