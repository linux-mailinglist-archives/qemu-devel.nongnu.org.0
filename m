Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CF23A5FC1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 12:11:05 +0200 (CEST)
Received: from localhost ([::1]:46888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsjYe-000790-9L
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 06:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1lsjWs-00058m-T1
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:09:14 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:56026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1lsjWr-000441-32
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:09:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id g204so11776599wmf.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 03:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MPKbRB/G0SyOwnBY1uohm6PPrRslfYenRONtI6LQhy8=;
 b=Nio+wP/2M7JPROFgr11rMakZT1gH487gIY9wIMQ7DJX3pzu1lNsPIqKEgYuaZGpyBB
 xYUs6cBVmIC8VqqXo2cuUF8Q+0V9mCXOWvRLjXZN2NpncjsEs8NI01Qoixah5wvabAqs
 eSnlZQBy/+sd4cLVAH7FmFz47CKqIZTQKVh79qSBwhMFQAtqBst3PsNiw2blO9NHO+cz
 Kmg8orv3WtcprMezjJ0R2hp+VQKy8ggfT+VFp+QFLWNC8fsg09xE6rgEHa9RX5E9QXYv
 tpIYL/NcAJ33FJv8ZYEYXHf0qz6vSDWrZaKJ3lnZiePQc6acN3YaHoacN1FyoS7t0XNn
 VtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MPKbRB/G0SyOwnBY1uohm6PPrRslfYenRONtI6LQhy8=;
 b=Nuh2/ctk9xKz9HYjFjAQ9dOdwGOnSzU7gT993hrujc+Z2XsR8A6IoiHzpNKejAisXP
 /9FLWAehCZiIF02XWaYaiM+kGFTWQBfUrRXcafunsuW5Oy1slHosVf5F57DkOaHPEn4+
 lk6oWsiaeI4HnWZD5WitkbX/rnS2UgmuYTp10xRboaIOKhRJuBCZlq1bWJ17jLpgSIH5
 TPmcxX9l8sA4WQLKrTyU+JELeg+fmubMGNIZ6Ae3MTidCETuPBmmbAnX0awIMvVCpgLS
 F0cBzTW2glxuH4Tw8qwcInvQDgmfjPqODUerTToxMvbc+THDQsXIj/jKFPCVdRIPm8Zf
 44Dg==
X-Gm-Message-State: AOAM5313H+3AmlK7qGZO2F8EgyovEDsJ5c5WjGZXnYEv7StwskhzHn0+
 BvO4bkklrXYzkpFO1B37ohfJ5ZnSYHOInQ==
X-Google-Smtp-Source: ABdhPJwS33bTGyebTfFRIJ3JWC+FsjKWp+qnBR4aABGaTX87B29ZiRQfuv2d6MXl4pEuYlbwufb3Vw==
X-Received: by 2002:a05:600c:1ca2:: with SMTP id
 k34mr15235839wms.145.1623665351420; 
 Mon, 14 Jun 2021 03:09:11 -0700 (PDT)
Received: from localhost.localdomain ([37.161.140.231])
 by smtp.gmail.com with ESMTPSA id o18sm15752254wrx.59.2021.06.14.03.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 03:09:11 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Start fixing kvm-unit-tests for svm
Date: Mon, 14 Jun 2021 12:08:59 +0200
Message-Id: <20210614100902.15860-1-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the APM2 I added some checks to 
resolve the following tests in kvm-unit-tests for svm:

  * vmrun_intercept_check
  * asid_zero
  * sel_cr0_bug
  * CR0 CD=0,NW=1: a0010011
  * CR0 63:32: 180010011
  * CR0 63:32: 1080010011
  * CR0 63:32: 10080010011
  * CR0 63:32: 100080010011
  * CR0 63:32: 1000080010011
  * CR0 63:32: 10000080010011
  * CR0 63:32: 100000080010011
  * CR0 63:32: 1000000080010011

Lara Lazier (3):
  target/i386: Added consistency checks for VMRUN intercept and ASID
  target/i386: Added consistency checks for CR0
  target/i386: Added Intercept CR0 writes check

 target/i386/cpu.h                    |  4 ++++
 target/i386/svm.h                    |  3 +++
 target/i386/tcg/sysemu/misc_helper.c |  9 +++++++++
 target/i386/tcg/sysemu/svm_helper.c  | 22 +++++++++++++++++++---
 4 files changed, 35 insertions(+), 3 deletions(-)

-- 
2.25.1


