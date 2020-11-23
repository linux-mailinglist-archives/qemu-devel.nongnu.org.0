Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A23E2C178A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:19:58 +0100 (CET)
Received: from localhost ([::1]:53938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJFd-0001Bw-KA
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:19:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIjs-0002xF-1N
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:47:08 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIjq-0001zv-K3
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:47:07 -0500
Received: by mail-wm1-x335.google.com with SMTP id a3so727373wmb.5
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9WfXx5bwoQ1bGvwty9bUUX0gx83YLXHNHesMImFdU98=;
 b=pkA91Fv3xv409n9qJ9dpK0VQlV3LBcuxQB7mCot5EQIMk/oqUAWSbzjdiejdOOgmDG
 uglGf9tPfh/LSLq6V2fxgUqegO+ePhrm9tKuzPI+iKGhRzjg2/S9ZzXO0VldsM859K0W
 oDGo62v+Pc24liXNAi1aWHdNort3lxV11GahsT+i78bNe4XASpNxc5+R177Mk3lhhqat
 4eId0VsCKRCBovKXVp/0lCyti1HYpo96nnVWUQhZftdBiL6UTF94K3zdg0vRxb0okuyh
 VisKqSaSZztFj6apz8ta27xly/N0zuxRyK6KwhtrnadWgeRrMY4M0yrpLcHhypEU/WAz
 /C5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9WfXx5bwoQ1bGvwty9bUUX0gx83YLXHNHesMImFdU98=;
 b=dwkgEjYY4WaOSBMP8BVEt4CAJiKNHgZCDh7s9oqjXyPbk8hDhzteL5UTi7DK7I3Hek
 Ol+rnhczx0KuMmhTFXMFhUU7GVlVcFPUNFXx1jg/cMW2b8Yldbk8bD4BD12nuyliPQ2C
 r6scrED+0vuCCKTxy4PalwWkZED6c/WA/+vmdze7kO3q8o0TpOkawyTD7dh9O9/QvMk+
 y1B3YXsuCjgGbNmTCNnidpLh0D4qKbd0EpMJAhdwQwz3AUyIjI5MKHnzn7F35P9HJckc
 U4h7iJHeeC5ai+5iTj1/o2D6GV/B+2x6FqFU+UKxR/cSQVgouIWyMj4+O6X9Ca1mrYDH
 p0sw==
X-Gm-Message-State: AOAM532+xBPHCKCCBIMbZvBTWMWHFsn8Oj1lEgQdSTFSaCPfzCHsbXxl
 pKW6cMLWezdl6x4JyrGb8CPYq4xSscI=
X-Google-Smtp-Source: ABdhPJxprXwZBsCRV8Ns0+jHBbHMeTqCm1GHR/0ko0wi5GicI2e8u2I21Z7ht2dyPnacJCCz6WvWjg==
X-Received: by 2002:a05:600c:290a:: with SMTP id
 i10mr706151wmd.187.1606164425048; 
 Mon, 23 Nov 2020 12:47:05 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id u203sm815879wme.32.2020.11.23.12.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:47:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/28] MAINTAINERS: Add entry for MIPS Ingenic Xburst TCG
Date: Mon, 23 Nov 2020 21:44:47 +0100
Message-Id: <20201123204448.3260804-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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

Add an entry for the TCG core related to Ingenic Xburst.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Adding Craig Janeczek in case he wants to be notified of changes,
patch conditional to his approval.
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f49b997f2e..976d23508c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -248,6 +248,12 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 S: Odd Fixes
 F: target/mips/vendor-loong*
 
+MIPS TCG CPUs (Ingenic Xburst)
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Craig Janeczek <jancraig@amazon.com>
+S: Odd Fixes
+F: target/mips/vendor-xburst*
+
 MIPS TCG CPUs (nanoMIPS ISA)
 S: Orphan
 F: disas/nanomips.*
-- 
2.26.2


