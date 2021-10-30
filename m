Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EDA440A93
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:24:25 +0200 (CEST)
Received: from localhost ([::1]:46426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgs5g-0007DJ-1n
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrqO-0005nl-Ix
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:36 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrqN-0004wm-17
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:36 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 207-20020a1c04d8000000b0033123de3425so3684621wme.0
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nzI3ncWnowbe+uAQGZtt2O8+C/ObYb05PL2oY6kvn+Q=;
 b=Bhl632Cxo9QOTwenIOCVD6DomwjY2ZkacmkKUB2krX7Z+18zFRMFJoPVpZiqmsqBk2
 kGYCHiSa/KVDbqWr+e3actsTqQ8QOJDYUqnUJC5Ibf/jsECpHO+aX0nowlQDUrbkTP5l
 nhl7yYOGirg7JqGTcUmxmIVcDQsqORyMcWXQNNrKuqK6S3EVpI4zLIlo1ezpitL4SmmJ
 9ARIKtkexdH1BLxKmkZA9yHjlMpu2lCwFXVtXB4Ln4H5KNl03045V9WR9mJonXrcRX/c
 4WoRwTNvux1G2fq55RjyrK065ozsnfp3IjVr052kFwwRqNZSIiu62Qv4lEGsoARvLLWI
 D53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nzI3ncWnowbe+uAQGZtt2O8+C/ObYb05PL2oY6kvn+Q=;
 b=VXkF3d0DGx1priH1yIShf/uciMCVX2TrTOKnA2FtDZOBTb7rBB6QQ7xJurDi6R/Wy8
 N5GqLRGlXH0ZTZ7KYOeiIfvXg8UvAyMNHJTfGsgFVykCFR+Gr0iw6Fh4szHwWoQbpmog
 KdpdMmL3Xn8DBEn7MgIz6j2haC4Ro1kVIa7qTz4Jn96EAA1KdBAFbChxmSjRrLKR6+8w
 NFA+INciZSnxKsoT7vkLG7kHnbQ8V8tAN2+X1MzbwrvfrAo/W4IK6gnkjolX5l2//Cy4
 FhTckuKqKN0ZKZdvxika64rVaPd67wQAhMF22DiUqyb3lkk/3unJJ+iX0qHfopBkFW81
 mDlg==
X-Gm-Message-State: AOAM533rAYA66xsCqXc3HSelj4yJ72M+QFce7r8EdmT6qbbhMcMW2TuT
 P2rBTkTWbLaOLVXOAfw7r7ICnistBoo=
X-Google-Smtp-Source: ABdhPJxqRlB1B4IBT4Qzwxt7vQgzrXKUYUNR9F6RbEhQ09LgD9wKFUVaKm84DkWpL8XmplQbHBwcTw==
X-Received: by 2002:a05:600c:a42:: with SMTP id
 c2mr27678791wmq.154.1635613713430; 
 Sat, 30 Oct 2021 10:08:33 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 v7sm8658213wrq.25.2021.10.30.10.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:08:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/30] hw/timer/sh_timer: Do not wrap lines that are not too
 long
Date: Sat, 30 Oct 2021 19:06:13 +0200
Message-Id: <20211030170615.2636436-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

It's more readable to keep things on one line if it fits the length limit.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <97bc2a38991f33fd0c8cc2e4d0a3a29b20c47d1f.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/sh_timer.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 2038adfb0a8..250ad41b487 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -82,8 +82,7 @@ static uint32_t sh_timer_read(void *opaque, hwaddr offset)
     }
 }
 
-static void sh_timer_write(void *opaque, hwaddr offset,
-                            uint32_t value)
+static void sh_timer_write(void *opaque, hwaddr offset, uint32_t value)
 {
     SHTimerState *s = opaque;
     int freq;
@@ -256,8 +255,7 @@ typedef struct {
     int feat;
 } tmu012_state;
 
-static uint64_t tmu012_read(void *opaque, hwaddr offset,
-                            unsigned size)
+static uint64_t tmu012_read(void *opaque, hwaddr offset, unsigned size)
 {
     tmu012_state *s = opaque;
 
@@ -336,8 +334,7 @@ static const MemoryRegionOps tmu012_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-void tmu012_init(MemoryRegion *sysmem, hwaddr base,
-                 int feat, uint32_t freq,
+void tmu012_init(MemoryRegion *sysmem, hwaddr base, int feat, uint32_t freq,
                  qemu_irq ch0_irq, qemu_irq ch1_irq,
                  qemu_irq ch2_irq0, qemu_irq ch2_irq1)
 {
-- 
2.31.1


