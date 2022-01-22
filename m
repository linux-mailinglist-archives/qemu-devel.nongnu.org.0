Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AFF4968C3
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 01:32:54 +0100 (CET)
Received: from localhost ([::1]:41576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB4Kq-0005Ef-Py
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 19:32:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB3zV-0001F1-QY; Fri, 21 Jan 2022 19:10:50 -0500
Received: from [2607:f8b0:4864:20::42a] (port=36766
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB3zQ-0005Sj-Pa; Fri, 21 Jan 2022 19:10:46 -0500
Received: by mail-pf1-x42a.google.com with SMTP id 192so6822286pfz.3;
 Fri, 21 Jan 2022 16:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lBwqqZ2garQXfPWLDcYKHOJoYITMa+22nAeYQNLrJQQ=;
 b=iBzn00AMFGKvIIEXFKXuxOeliA8mtScmtKhJVAfiiodK7G4bBwYKpQNfMojPCWnHaR
 20zbIl43+2e0AHgg8DYjlGvuBiTWmmi1J/7vuSD6u1+UoYmERR5AggIB6LsMR5FX9Lzz
 7GgKzav3vQhGQ9E+pqLgirJlK93ZRpai4SSOv4Fnba/d1T4VH/L8TgiKHZWDsMknbnua
 XtOZ+EC/wX6TdMx58NZC5Dm/ssa8hXxJHovWVcgRpwik0MtZ3eM4HKWe7pkxUljgp4OY
 1z0JYB0VSYA2BOFdj0JoITXwBcxAxHwrv8aIL4ryb0KVdCgkPnPLL84XXgZQU4rNNdpi
 lqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=lBwqqZ2garQXfPWLDcYKHOJoYITMa+22nAeYQNLrJQQ=;
 b=H2Nq+HhwbhRyP26/soJibulUVdmNdFy6tNShbwlV9CfUiOHsMO8yWxdwaVhBbvzOg+
 +Ewhr9a1dKqG3J1xavMLAeumjQWHuymx/CPPpz0uThF4Iab/C8ckFeu6bzh2h+98Rlkg
 9gy2hhDiQEyeHd1JkXzid43K7/mmG9mF8zD1txxypOYLCdL5FyvY2WFWu2f7IZaH5aYs
 lJimfExOpG8qU6EnwXa+aa3xM/fDKtx4woXh55mztt3K4XYHnj0+z8RAioEjb25nAgGU
 30T6Hz7h9KDROgJShY+MdfFXHq0bBMfEcvWRZkX8EezYFqyYVA61eFh2hYpN0RhdBVAW
 ZYNg==
X-Gm-Message-State: AOAM532ZQ14eYwio/bw/pSXoqrOO45Na/rNPGeY7q+87OX6fl7TWBbzQ
 /cdKsvTUIW2o+EKnSd4U0fZ0edAK22c=
X-Google-Smtp-Source: ABdhPJzjXRWD5uRxkqok4tEatYo4wKzmNJnJVNKqGmlmR4WyJgsw9TOdaqVVCfQfDj0ICChGu6rEbg==
X-Received: by 2002:a63:e448:: with SMTP id i8mr4578118pgk.206.1642810241399; 
 Fri, 21 Jan 2022 16:10:41 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id p4sm8472923pfo.100.2022.01.21.16.10.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jan 2022 16:10:41 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Joaquin de Andres <me@xcancerberox.com.ar>,
 Michael Rolnik <mrolnik@gmail.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] target/avr: Correct AVRCPUClass docstring
Date: Sat, 22 Jan 2022 01:10:36 +0100
Message-Id: <20220122001036.83267-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

There is no 'vr' field in AVRCPUClass.

Likely a copy/paste typo from CRISCPUClass ;)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/avr/cpu-qom.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
index 9fa6989c18..14e5b3ce72 100644
--- a/target/avr/cpu-qom.h
+++ b/target/avr/cpu-qom.h
@@ -33,7 +33,6 @@ OBJECT_DECLARE_TYPE(AVRCPU, AVRCPUClass,
  *  AVRCPUClass:
  *  @parent_realize: The parent class' realize handler.
  *  @parent_reset: The parent class' reset handler.
- *  @vr: Version Register value.
  *
  *  A AVR CPU model.
  */
-- 
2.34.1


