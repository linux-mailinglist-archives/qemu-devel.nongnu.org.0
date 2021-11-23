Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD51345ADC9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 22:03:16 +0100 (CET)
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpcwe-0001KO-0j
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 16:03:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcrB-0001wD-FT
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:57:37 -0500
Received: from [2a00:1450:4864:20::42b] (port=35618
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcrA-0006Lj-1d
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:57:37 -0500
Received: by mail-wr1-x42b.google.com with SMTP id i5so222326wrb.2
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 12:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+CtME3cCcCTfQNWLUjavY+LyZs3nohyg9oUPT9ltWGo=;
 b=CXIpHZEUyJu+7lRwYOkaIBK+PO4JwS3fDfZLL5wryj7f4qc/1xTdo3PnQvMkO6a0jb
 IJBzmd2v/MaJh75hsSN/VxaJsGgKfvbIMfCDt9xkN0lUpxtE5bBhS2rF+yhLe8LDEh4X
 9s1fAYBy4SaDMFG5bE1niVsbsHqGShD+QyaXqvmTZWIyRgXkz8b5703qP7dtLiKW23ua
 FwWIevwxgXlWTeXwzwhRslLKd0EgLJuL2By3Idex3jz4cfkI18eqwfcOoGdlx8+XjODD
 If8RnpvQ3KGtR1eru950wzblldmXLoYNiT257oQFgIHyGMxHukNYubM5pSCMrxLnwjwa
 YvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+CtME3cCcCTfQNWLUjavY+LyZs3nohyg9oUPT9ltWGo=;
 b=dx8zcNBvBa7ZbE+upJdxAiCiq9s/pXZK0bfw2cKWrVkaVDoAkGpwTHQYBIYN/s9KAv
 XPGdSvHLxwxkaqZvsBTw5cJx+JxH0Z0ZBbgkI8dM7hvplfekbIS6gCvEWGIHh40vPAaI
 uTJAw5rnOwt49IvIbcSppYVrwy3u4t5ejM/fX/D7Pco05cwe/BXon4aX4JvbmJy7/879
 DfkIZZYz54iRiKCVTltTFPsnByL/zysjuU5R00DmYU8ApUG+QIjVWb/ChsPdajNJnkth
 S05OPvYK2wde55LEcA3cMA4spUz0t2ptK7jsoMhTXk9ufQkzMc4NDkc/eASpvueK39xG
 y3WA==
X-Gm-Message-State: AOAM533i1M5eB54b5baN1HC4IdpbdJh5Ep3tCLQE5QPZc++WZLEqa7np
 eo/A0DECClqCIrIh/vRM10wKHA==
X-Google-Smtp-Source: ABdhPJw2YWTQE5rEIBh6xpKmqXMOor/6c7FAwIRGMRG+DNQhc5WXGr79FcFXGK3omHD5gQFUtdZl2w==
X-Received: by 2002:a5d:4523:: with SMTP id j3mr11650367wra.185.1637701054095; 
 Tue, 23 Nov 2021 12:57:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m7sm2034505wml.38.2021.11.23.12.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 12:57:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3EBBA1FF98;
 Tue, 23 Nov 2021 20:57:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 1/7] softmmu: fix watchpoint-interrupt races
Date: Tue, 23 Nov 2021 20:57:23 +0000
Message-Id: <20211123205729.2205806-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211123205729.2205806-1-alex.bennee@linaro.org>
References: <20211123205729.2205806-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, berrange@redhat.com, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

Watchpoint may be processed in two phases. First one is detecting
the instruction with target memory access. And the second one is
executing only one instruction and setting the debug interrupt flag.
Hardware interrupts can break this sequence when they happen after
the first watchpoint phase.
This patch postpones the interrupt request until watchpoint is
processed.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <163662451431.125458.14945698834107669531.stgit@pasha-ThinkPad-X280>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cpu-exec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 2d14d02f6c..9cb892e326 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -742,6 +742,11 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
             qemu_mutex_unlock_iothread();
             return true;
         }
+        /* Process watchpoints first, or interrupts will ruin everything */
+        if (cpu->watchpoint_hit) {
+            qemu_mutex_unlock_iothread();
+            return false;
+        }
 #if !defined(CONFIG_USER_ONLY)
         if (replay_mode == REPLAY_MODE_PLAY && !replay_has_interrupt()) {
             /* Do nothing */
-- 
2.30.2


