Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F0C33A0D6
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:01:33 +0100 (CET)
Received: from localhost ([::1]:34664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAS4-0003Oi-9X
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAG5-0006sY-J3
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:09 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAG4-00070E-4v
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:09 -0500
Received: by mail-wr1-x431.google.com with SMTP id e18so3612185wrt.6
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=moYUnA443ZNCun6tItxZiGo6Z2/jYTaF1F6gDoL/yFY=;
 b=Nod/YtpbQgu+foFOgTk7lBE9RhDfhwsvUVlAGmZEn7kuf6sfLQM2DZGsDZlElCJBpL
 Ymb4p8wCU8FXS+IUpDXiOUiP2o3UntsnVmOZd7I1mYGDo5IFM/0kgueNvL+a03OcdXUQ
 bJ84t8BaCJGh6J3TH3r2KuZCL0Kn/N39Z70EDEmScHgP4vQUG/DCoiv9ZH5Jr2r0YSpP
 wRTrWgN1bkSeSo6fXAtWhQPBip2DVaAJuohfaEyfI7Nh5NzthOOy0WAziCMsXbXzsZnm
 XsUUtlH3xqX1SJgK6riBnTzCTmzK6AmLZ6bjfJaZ21MlAW0yfpcKCDEDSfj75rwYDJJZ
 hsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=moYUnA443ZNCun6tItxZiGo6Z2/jYTaF1F6gDoL/yFY=;
 b=aZ1H+duh4vRZ/dDqwS0Y41xzBwM4WoZPywNCp5jJ5Ya9TH9uc7HYdJj30Vyv+i2pWG
 GQKopB2y8t1QRZuCh3KF9NpXNLpEWLh689LOAlMay+scYDX/U3AjlzMxa5BTsyKQuFUd
 XAgVJryv4rEUA47KhPFzj/lLdWlqO3H0Wrc5CdQWzhwsisbrVQonhWhRh86W1YF5u1pA
 uHn/vUgQ71viDq5IUpVDjyGkJfIQEDeh7GdWyvYcp7iR3/cTaH8TqzPslXq0KC1Tqhw+
 VmPCA9nU8XvbGkJJUlRhOH0mBzp9Yxh0c2/SIa2tLhcVYU2oVxPdRyBayPGQ4Fk4DsRM
 QGYA==
X-Gm-Message-State: AOAM5323ap1UgLbfLXz+5/p7N86WtKzn1A0+J4hp7df0KhzIYYkQHtkS
 PKkggHXN7wnNR2S+pj+3B0iVNI9xRd5kqA==
X-Google-Smtp-Source: ABdhPJy5Qw4u13qlDQgYECb2wC0AGYi4zMGUjrb8whmCebbufRG9enPN/mOL26/Yu4kyYcccDRUrZA==
X-Received: by 2002:adf:f587:: with SMTP id f7mr20196758wro.147.1615664946594; 
 Sat, 13 Mar 2021 11:49:06 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x11sm8409427wme.9.2021.03.13.11.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:49:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/27] target/mips/meson: Restrict mips-semi.c to TCG
Date: Sat, 13 Mar 2021 20:48:09 +0100
Message-Id: <20210313194829.2193621-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/meson.build b/target/mips/meson.build
index 75c16524606..53580633ce0 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -31,10 +31,10 @@
   'addr.c',
   'cp0_timer.c',
   'machine.c',
-  'mips-semi.c',
 ))
 mips_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'cp0_helper.c',
+  'mips-semi.c',
 ))
 
 mips_ss.add_all(when: 'CONFIG_TCG', if_true: [mips_tcg_ss])
-- 
2.26.2


