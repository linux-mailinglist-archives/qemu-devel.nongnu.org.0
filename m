Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7CC2C170E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:57:45 +0100 (CET)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIu8-0004K2-Ct
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIi2-0000lA-Rh
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:45:14 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIhx-0001Cw-Me
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:45:14 -0500
Received: by mail-wm1-x341.google.com with SMTP id a3so721228wmb.5
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ph8h44c9IgmkWQLxmzuSBj3koZyAw+q+/J8qVoLDsI=;
 b=UlzZZ2BgjMtm4DRnjt338093bGPvNpO4mylmrgYlEErjDUrkySQ+l5qMNbLtlwUcrX
 Uhkw3A4mof/8RWDGYCK7o9g74Dv35pMvDP28tznCw9QT8xajYaR0JM9JQkgXEft5UVPp
 LxAbZOkZ8t6IgG4HOG49jIfNQqYZD7DB6KmYc5IZ7Xz55SsSkZWpE67cZLQD1qxHSf3a
 eh1IfMRlwKJOqbGEZTg3TSjkd3j0aIQ7QVOLKprxwRoj3emsEXnlERhTTkhZN4DimNXQ
 lICc9V9TVvTWUcU6OziQ2J6LrOQpsblNkIneveDXFu41DN1EtLux13b1bB+A1URxKzal
 ud/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0ph8h44c9IgmkWQLxmzuSBj3koZyAw+q+/J8qVoLDsI=;
 b=a3coNBJT3ft3e2PIi1xXpIxOFYyDsPWuiCQX9G4+1nipZLjJ5OuSSGShby2Ud1YJNn
 19o66jMiz5CuLbBnn0zQKwK/QZEjYzGjf+vSHpw57uC149DZR3mpBOeZR5PsLyBSv/04
 F2DDf5/McoKg75XN6atRgNvdUIwjGqhtY0+fjRDBXHXVaJ//smblnddaDLzJWhDgh05H
 +RFR1vktl0lYE9A4B1rMHeNpfTCRM2Ewjfejkca+PAFQ41/z3tJ/6xPGyL+9aWNkLe4C
 2AOW9Pn1NVbRoxCP8kjvCo0xjhJcHkdMrH0Q/nLRW1LIWEnCzyO4eFjNhlecxW4bWkdC
 2HqQ==
X-Gm-Message-State: AOAM533pIBLawgmeeSAdKDLOgyJFr5pVIf+s2evLmkf1dGK3fjNuRmwr
 +RbLux4sGhOwU3wZrxJnDw0YvkTefNk=
X-Google-Smtp-Source: ABdhPJyBTLfFJck3OQJWqjaBPpVXQQodY+yPRwI8OllmCkvvWqqYSb3b39B1vN81xSPP08/uTfIM7g==
X-Received: by 2002:a1c:6557:: with SMTP id z84mr742671wmb.144.1606164305627; 
 Mon, 23 Nov 2020 12:45:05 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id v2sm20591284wrm.96.2020.11.23.12.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:45:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/28] target/mips: Rename msa_helper.c as mod-msa_helper.c
Date: Mon, 23 Nov 2020 21:44:23 +0100
Message-Id: <20201123204448.3260804-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
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

MSA means 'MIPS SIMD Architecture' and is defined as a Module by
MIPS.
To keep the directory sorted, we use the 'mod' prefix for MIPS
modules. Rename msa_helper.c as mod-msa_helper.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/{msa_helper.c => mod-msa_helper.c} | 0
 target/mips/meson.build                        | 3 ++-
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename target/mips/{msa_helper.c => mod-msa_helper.c} (100%)

diff --git a/target/mips/msa_helper.c b/target/mips/mod-msa_helper.c
similarity index 100%
rename from target/mips/msa_helper.c
rename to target/mips/mod-msa_helper.c
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 681a5524c0e..35dbbbf6519 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -6,8 +6,9 @@
   'gdbstub.c',
   'helper.c',
   'lmmi_helper.c',
-  'msa_helper.c',
   'op_helper.c',
+  'mod-msa_helper.c',
+
   'translate.c',
 ))
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
-- 
2.26.2


