Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0546833929D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 17:01:06 +0100 (CET)
Received: from localhost ([::1]:41012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKkDo-0004ze-LH
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 11:01:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKk8K-0007xk-Sn
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:55:24 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKk8J-0007Bh-D3
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:55:24 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso16084795wmi.3
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 07:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i2YoBdgL8d+/sRqreYsZTW/xJCtI/BMVgkx4/q/BJ7c=;
 b=FOj+Cus3etEd3qHgbB7KkPdFij+/l91YLvCbdOq1lTQhrc68U99vbMqG7N99VAQiVy
 Uaj6t1x3HpGESD42br/XsR/EgyC45jubNDRs/VUE7pxtqu3ZMjjwudgi7MX/oJDM4Ki2
 OoukaZSBL8Nw4tnx1XRq5X5k1lKxIg/sF3AcXZlahMFfNtDROvAs+myHECswLpzq4eU0
 RkViNgjypJsp2K7BiipmjKhX4q+T057GD343xb+sMhmuD9iMt0Gb2ZCCHXxyjUJZxpdx
 cTXoQPBKJzo4KM1I4ln0WoNfUU65qOT2r8QFg7+9+9iVtqtyzZhZAyQRKCei2Ruq1yIY
 gqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i2YoBdgL8d+/sRqreYsZTW/xJCtI/BMVgkx4/q/BJ7c=;
 b=JMJBel9f0SRyC2puELsP1WaceuqC5d+37hHnYkbjDdHCDq+O1DLe1MS2+TN3bHeovr
 bhA/nP32Zpr43jiVLXnzMApIXPVt55PBLDhyiHw/rahBqdW8lsZvkcTe9VnoOinm4qvW
 pXQXJ9ajDIOHupWroHFahI0ysWTRhnKIrOh7vbcoRWaWJl3cCQyHhL4MryKGTylO6zee
 Hk3TBJ19dn9Udznn7ivEOYXEuBbzaNWEd2omZ8hk2111w6nro1o/ux2VAV/w+sTr/vXB
 QqiQtvCDW2+w08k9bUWAqTM1+T+r15pXny0tn8TviynTQG0F/2CXseHcRHEQ9QxsndFx
 t6Ug==
X-Gm-Message-State: AOAM530jY+Rqm6MMMqOYwQZpvNDrrnv1j3W15ZJuS23EUhWYqM5RpCZ5
 hMY1/n2u46hIbZ507mDdSmkF5ODM2gU=
X-Google-Smtp-Source: ABdhPJzJ27Irhc+w/gNbI3il3EsosEJQUHDaNNtK0pVl3Cctn1t+hS8M15lzwf5UJCmVHJ/NB+DOdw==
X-Received: by 2002:a1c:bb89:: with SMTP id l131mr14149305wmf.47.1615564521052; 
 Fri, 12 Mar 2021 07:55:21 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s20sm2520229wmj.36.2021.03.12.07.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 07:55:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] MAINTAINERS: Mark RX hardware emulation orphan
Date: Fri, 12 Mar 2021 16:55:12 +0100
Message-Id: <20210312155513.1849109-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312155513.1849109-1-f4bug@amsat.org>
References: <20210312155513.1849109-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: Magnus Damm <magnus.damm@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yoshinori Sato doesn't have time to manage QEMU reviews.

The code is in good shape and hasn't started to bitrot,
so mark the RX target and hardware as orphan to give the
possibility to any contributor to step in and fill the gap.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e9f0d591ee..95abfd6b818 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -306,8 +306,8 @@ F: linux-user/host/riscv32/
 F: linux-user/host/riscv64/
 
 RENESAS RX CPUs
-M: Yoshinori Sato <ysato@users.sourceforge.jp>
-S: Odd Fixes
+R: Yoshinori Sato <ysato@users.sourceforge.jp>
+S: Orphan
 F: target/rx/
 
 S390 TCG CPUs
@@ -1392,8 +1392,8 @@ F: include/hw/*/*sifive*.h
 RX Machines
 -----------
 rx-gdbsim
-M: Yoshinori Sato <ysato@users.sourceforge.jp>
-S: Odd Fixes
+R: Yoshinori Sato <ysato@users.sourceforge.jp>
+S: Orphan
 F: docs/system/target-rx.rst
 F: hw/rx/rx-gdbsim.c
 F: tests/acceptance/machine_rx_gdbsim.py
@@ -2175,8 +2175,8 @@ F: include/hw/sh4/sh.h
 F: include/hw/timer/renesas_*.h
 
 Renesas RX peripherals
-M: Yoshinori Sato <ysato@users.sourceforge.jp>
-S: Odd Fixes
+R: Yoshinori Sato <ysato@users.sourceforge.jp>
+S: Orphan
 F: hw/intc/rx_icu.c
 F: hw/rx/
 F: include/hw/intc/rx_icu.h
-- 
2.26.2


