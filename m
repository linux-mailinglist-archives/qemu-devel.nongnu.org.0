Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BCE2E9FDB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 23:14:42 +0100 (CET)
Received: from localhost ([::1]:50148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwY7d-0007wo-Dc
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 17:14:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY58-0006Er-HN
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:06 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY57-0007ls-8r
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:06 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r7so33615116wrc.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 14:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R0fUu3amHo0lA4w4O2ssd05dqOIAFEftWBDmfRDtfjY=;
 b=ZAqI1Lwp6ggpOLrNcdsQzCa3HnOgw2whicGGVc85/VlrEMUSE/ruVbppAlwaIqDzXZ
 9ywuFT67ga3+3r4US30uKJyYuFVF4ahzFDVZCH0yUQcMH1ppXh2N+bCikCgaGX/gc7Eo
 mNBeCVkGXYm+FNcmj5NpmMt9JPOXqehz6WH/lwID6y36n8Is86K/y9DoD5/I7IlJ/aqk
 EI8ljxkCyXvjzNO/py7mG1wfggrcFwFAiruVPBz/mTS6LUHO7dvLxQtmWAWcxfrQsv6n
 b/NTlyCsNGvgiIel0iESHsGF3rCVZgHwGy/wKz3r/LYhBLICcWbfCe3WvdAkgEj9GpkD
 IZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R0fUu3amHo0lA4w4O2ssd05dqOIAFEftWBDmfRDtfjY=;
 b=oFFHCmW/710hwacxisan30w+pKWJTyLhgKB4N/v3MTntDlJzCH8MfRf2bTsYCQzKb2
 mL4B9/TfNPLZhZX+UNa0y+JuENtnupDHeWjI0cB/QLMQFY7kKRVBVv1QiK/c/3NwWaeN
 rwVIgrjMHgt4iDPSp9degooHLsPK3e7VXKQzvA5x8rndoCS4cQ3YBWktw5vK0Vva0gUx
 OtvR727/PPATjDWz2DKyYg1cal4R1IsTNbsG7bEL6jWZtv6wpe8XAdCkJa2qxrZmX/3J
 LCS+wlnHhfnrTedYrS+CUvXwRLpsEZMLaSSppYJp42SgDazqWnYAZ9ynbZ+Uj38qP3K4
 r/Fw==
X-Gm-Message-State: AOAM5309p2c8pc5/H/uVzKGjJfAyWJAp4QVBpKlsZpLJ75gOQA5VLDZ4
 qjRJHIdbJXnytdFXmjHD5tpVv1xCph4=
X-Google-Smtp-Source: ABdhPJw2JgWhLMn7o5554E4TVhpOlDWDdbCKKjMPvX+4jl7z5gJyAwsMrBGqMuMFwiqKBl6hDKw+JQ==
X-Received: by 2002:adf:a543:: with SMTP id j3mr59698413wrb.175.1609798322698; 
 Mon, 04 Jan 2021 14:12:02 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id o74sm1492021wme.36.2021.01.04.14.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 14:12:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/15] target/mips/mips-defs: Remove USE_HOST_FLOAT_REGS
 comment
Date: Mon,  4 Jan 2021 23:11:40 +0100
Message-Id: <20210104221154.3127610-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104221154.3127610-1-f4bug@amsat.org>
References: <20210104221154.3127610-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove a comment added 12 years ago but never used (commit
b6d96beda3a: "Use temporary registers for the MIPS FPU emulation").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index ed6a7a9e545..555e165fb01 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -1,12 +1,6 @@
 #ifndef QEMU_MIPS_DEFS_H
 #define QEMU_MIPS_DEFS_H
 
-/*
- * If we want to use host float regs...
- *
- * #define USE_HOST_FLOAT_REGS
- */
-
 /* Real pages are variable size... */
 #define MIPS_TLB_MAX 128
 
-- 
2.26.2


