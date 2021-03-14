Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A3533A8EE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:51:27 +0100 (CET)
Received: from localhost ([::1]:33532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaW6-00035o-Ie
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaRy-0008Au-0B
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:47:10 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:45680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaRw-0003H7-6m
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:47:09 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo18453012wmq.4
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 16:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E/Sa5TlFlqVsLlc8EZ75aSLJitlZukV7o9bGnWCQErM=;
 b=R/l0HUQALilj4SnnBpQbbAyEeDSN9AYc7ssCMzp14mxvJxot3+8EAscz2Kj2e06B5c
 TKywxpkwIqC0tcV0oP5x2het1P+YOEYLROoZH5HBLbrOaHHkYUIegUf+3DECLTmofjTm
 vDhPeKOKJGSqWP4eFy62wGLnYb83MDjL6tF/nz/B1+biZtqjgH4fXqlRcBhCfvsez/yG
 u2jA5OZ3zWzsK/lBnYVoSuzY3a0VYxafICnPUhp5ENMLhLDvi1+n5qlnFM+bj3zauhyv
 Mi01fHlxPyTgzPTCLqcoAXok+JP/bn3NWFmlDNX3ZL4UCPZxN627Oh8OBLP57AlD6el1
 E8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E/Sa5TlFlqVsLlc8EZ75aSLJitlZukV7o9bGnWCQErM=;
 b=qZuaVVyfdLCKy5HKmE/x/zegI51WgicUS4gbB1LrXq4rnCZa3esXh1hB1qkHS40XJ+
 w/vxkzS59TrYqFSDbCFY9+XLhBeQBVq2QFIhxdaZEvHcBYvAr+65grPSJF8oZMEGYKzL
 u/AuFZ2V7FBlma6ofXu2JFKFwz36tVghpjyeyK50KSju3ICQwSX794fqQ4mU1wf1Xxyb
 HD40HEDQHBUr0yMJZMww5/qq/D2HSdSMaI/nUeDS4WFfaLlDPuopZE8VSEVkycUwc+5I
 H8m4zaYGTv5THQlVOU2lMNfFFE+k6da5CAYNGY6XZKZmRfCn9xoixFJ4KctdV6ttYhue
 sEVg==
X-Gm-Message-State: AOAM532zp09LVzvPUduqpML8Qo2DcmJOrJ69ZCamY73H/Hbnd6Lcf4ay
 gQTLyd5cySo1VHd1/JN2t+ljiij4SPpGUQ==
X-Google-Smtp-Source: ABdhPJw5ojgf64EOmycGydwFOQYYZigYhOgRyof1CUHbJ9q9H06YgkmxCYDYIVNlsz95wN7RqZr/qw==
X-Received: by 2002:a7b:c242:: with SMTP id b2mr24388313wmj.119.1615765626547; 
 Sun, 14 Mar 2021 16:47:06 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z25sm12191084wmi.23.2021.03.14.16.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 16:47:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] target/avr: Fix some comment spelling errors
Date: Mon, 15 Mar 2021 00:46:48 +0100
Message-Id: <20210314234649.2614590-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210314234649.2614590-1-f4bug@amsat.org>
References: <20210314234649.2614590-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Lichang Zhao <zhaolichang@huawei.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lichang Zhao <zhaolichang@huawei.com>

I found that there are many spelling errors in the comments of qemu/target/avr.
I used spellcheck to check the spelling errors and found some errors in the folder.

Signed-off-by: Lichang Zhao <zhaolichang@huawei.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Philippe Mathieu-Daude<f4bug@amsat.org>
Message-Id: <20201009064449.2336-12-zhaolichang@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
---
 target/avr/helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index 65880b9928c..b4532de2523 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -98,7 +98,7 @@ int avr_cpu_memory_rw_debug(CPUState *cs, vaddr addr, uint8_t *buf,
 
 hwaddr avr_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
-    return addr; /* I assume 1:1 address correspondance */
+    return addr; /* I assume 1:1 address correspondence */
 }
 
 bool avr_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
@@ -299,7 +299,7 @@ void helper_outb(CPUAVRState *env, uint32_t port, uint32_t data)
 }
 
 /*
- *  this function implements LD instruction when there is a posibility to read
+ *  this function implements LD instruction when there is a possibility to read
  *  from a CPU register
  */
 target_ulong helper_fullrd(CPUAVRState *env, uint32_t addr)
@@ -323,7 +323,7 @@ target_ulong helper_fullrd(CPUAVRState *env, uint32_t addr)
 }
 
 /*
- *  this function implements ST instruction when there is a posibility to write
+ *  this function implements ST instruction when there is a possibility to write
  *  into a CPU register
  */
 void helper_fullwr(CPUAVRState *env, uint32_t data, uint32_t addr)
-- 
2.26.2


