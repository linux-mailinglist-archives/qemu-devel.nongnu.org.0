Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5332D43F208
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:48:56 +0200 (CEST)
Received: from localhost ([::1]:53554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgDGZ-0003q1-9H
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCph-0005pE-No
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:21:11 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCpf-0005qE-BI
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:21:09 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d13so12488139wrf.11
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SIBfdvK2z1Bl+qTG81vPQllTn7+JlW4MS6H8kXRvunU=;
 b=JeESuJdy5d94WlcQeFZWePax9WNjqW1csYWmh8bIUTS3xZWqFdxl4sVLH6/SNwW3Do
 EnZLnsHGPXbD5J4N+D+eMJ/m5jyVso03SdqW1g9WKAlVpdl+ZFk/SVkary82kZ/xI4j7
 IC8IpA1CkzuKAjW8Bw9UaogaMSn/vd+UEoJy0MqoWiIUALc4tUFHrz9ity6jqHteZIaZ
 l0h4vo6HV+GfFwja45e1O82720juUo97NTrE7+2V4Yn3Q50/2mx8fhLgRKGrobR5tGSt
 SH6Ws8Mj+xQ7/w6qKbM6V0tPyav7sCvfqp0hhMkZfyDIBfpYh/U0V/vUsd75f0gF+To6
 bwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SIBfdvK2z1Bl+qTG81vPQllTn7+JlW4MS6H8kXRvunU=;
 b=TE3MHvpuPdt4ZuibZcjBp4baK7HkDXlZz51aY1trg2WfYtJ/Jkd0ErmdrjybS2NjgZ
 tc+dPjUsvKwTSP24LrhLB6v2mzieA7+mgW3PTC85bN8B+i4obNtLS1PdLGqka/2zl/pV
 tLTVpY5IwFu7649PyIS7JDOAqwLHC2IwKNzpee+W6n4nJXbx4UCrRWV9cLixqJPwKaFX
 axGzeyYG8DCUg+pvsZb+2srdQEW8zK/IWzjRfvB2bABRjFyG627JvaTWVaRmeHmIW5vD
 Hmg6MQXV3UQZRWG0ndqViiLe3Kk/iriuutIV762q9vnJ7JpYi2xifiLEZjJRI+4BRJzs
 X0WA==
X-Gm-Message-State: AOAM532AyY1UlY/ElnB5ow/cha0yneETTsiD/jP2h6MpI3R3l0JWeQz3
 3EaOKJGSey8ghhREBYMoZehwCVX/ZXk=
X-Google-Smtp-Source: ABdhPJyJrVMenDqwB7nZ7doqATWv8uAahhRRzw94XRJ0QNmNliS534wcxRdgrKJi8mZb4wPpSPN3tw==
X-Received: by 2002:a05:6000:1b90:: with SMTP id
 r16mr8888064wru.153.1635456065510; 
 Thu, 28 Oct 2021 14:21:05 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x2sm3432162wmj.3.2021.10.28.14.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:21:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Remove obsolete FCR0_HAS2008 comment on P5600 CPU
Date: Thu, 28 Oct 2021 23:21:03 +0200
Message-Id: <20211028212103.2126176-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FCR0_HAS2008 flag has been enabled in commit ba5c79f2622
("target-mips: indicate presence of IEEE 754-2008 FPU in
R6/R5+MSA CPUs"), so remove the obsolete FIXME comment.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu-defs.c.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index cbc45fcb0e8..b946f8f957f 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -369,7 +369,6 @@ const mips_def_t mips_defs[] =
          * Config3: VZ, CTXTC, CDMM, TL
          * Config4: MMUExtDef
          * Config5: MRP
-         * FIR(FCR0): Has2008
          * */
         .name = "P5600",
         .CP0_PRid = 0x0001A800,
-- 
2.31.1


