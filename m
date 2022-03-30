Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D224EC42F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:33:59 +0200 (CEST)
Received: from localhost ([::1]:60888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZXWQ-0003wz-1A
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:33:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1nZXTh-00033q-CO
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:31:09 -0400
Received: from [2a00:1450:4864:20::431] (port=45724
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1nZXTf-0002Lq-0R
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:31:08 -0400
Received: by mail-wr1-x431.google.com with SMTP id w4so29018943wrg.12
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 05:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adacore.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=aux709gFf+ijL72J7E8raGmImOubNMiB8QGegrrTDQg=;
 b=Lg0lzS6evrM8fe+AA+uJJEM9dqH3N4ipzUWxFs3ztC5rHE4OYBwbfhhQE2Y4ifZZBP
 ksMdhLnainry76twg5s0jmzXAqCMpu7xIAy8LO75Z4Pqrb3V7q4rNFKrEjs00dO9KE2p
 94mQSI84c3ZAFyNhInGHTL3eycIK4Sq2BbrdczzGS8gOGvK+uTxjMDfERGzczHl04TcE
 iCBqmUlr9PanTJBB6QIhQWoC3kzxWfhc76oN7snb/FNdfcItANjNq6uZAIb3v7+RDn6+
 bTghZ9OQihFSbqSOyYV1i9dsp5mi8rKDg3WHmm/8xMcb1GwbcP3pNTI5/qDBTDn78wHq
 i6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=aux709gFf+ijL72J7E8raGmImOubNMiB8QGegrrTDQg=;
 b=VL1DlfXl81o6976+XjqHgB2aK2vNqSRug+ap/ANy9ckUwfIhX63mc+fhHcTEW78Ubr
 yycq5lQIyeNq1DWhkYg8ZIsNmp2oTe+zdTxeS/xAgJM7iT5yj1V3s4Gmjdn2hBamAZt/
 wrmUx443qNXhM/cHDRFicOepscHvfcMrwTHh/vhfyEkE/qwDFtBORAmQWNohY24QV647
 wR4jpXxZqbK3do3vnUABT+B0v45QW3XDLGjEziJkKuoL392OjtW/Cvb3oW3eyloFp4Zb
 squVjOuC1dbCTD3UYmtNKIVKwgUF3VmfetuuMuMZxDilqUgVg++7upUHfOVn3DByhUBK
 wT4w==
X-Gm-Message-State: AOAM533pdS1J1O6nKetBvXo+fNO8J848ShwEmWuanX3rfJJN8dDjUczt
 jci1JXf4+lB53cKJr1caF/KUBczLRRjdOw==
X-Google-Smtp-Source: ABdhPJxe7cuwqVDA+fug7wvR3IGho+0DoVBWWY7fm2qzO/uyB60ZpDO8ZDpCt6HUw3jVx39UELjV3Q==
X-Received: by 2002:a5d:4609:0:b0:203:e792:3add with SMTP id
 t9-20020a5d4609000000b00203e7923addmr38301117wrq.657.1648643465009; 
 Wed, 30 Mar 2022 05:31:05 -0700 (PDT)
Received: from localhost.localdomain.localdomain ([37.58.245.230])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a0560001aca00b00203daf3759asm18137980wry.68.2022.03.30.05.31.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Mar 2022 05:31:03 -0700 (PDT)
From: Frederic Konrad <konrad@adacore.com>
X-Google-Original-From: Frederic Konrad <frederic.konrad@adacore.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: change Fred Konrad's email address
Date: Wed, 30 Mar 2022 14:26:57 +0200
Message-Id: <1648643217-15811-1-git-send-email-frederic.konrad@adacore.com>
X-Mailer: git-send-email 1.8.3.1
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=konrad@adacore.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Frederic Konrad <frederic.konrad@adacore.com>,
 f4bug@amsat.org, chouteau@adacore.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

frederic.konrad@adacore.com and konrad@adacore.com will stop working starting
2022-04-01.

Use my personal email instead.

Signed-off-by: Frederic Konrad <frederic.konrad@adacore.com>
---
 .mailmap    | 3 ++-
 MAINTAINERS | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index 09dcd8c216..2976a675ea 100644
--- a/.mailmap
+++ b/.mailmap
@@ -56,7 +56,8 @@ Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
 Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
 Christian Borntraeger <borntraeger@linux.ibm.com> <borntraeger@de.ibm.com>
 Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
-Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
+Frederic Konrad <konrad.frederic@yahoo.fr> <fred.konrad@greensocs.com>
+Frederic Konrad <konrad.frederic@yahoo.fr> <konrad@adacore.com>
 Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
 Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
 Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
diff --git a/MAINTAINERS b/MAINTAINERS
index cc364afef7..68142340bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1533,7 +1533,7 @@ F: include/hw/rtc/sun4v-rtc.h
 
 Leon3
 M: Fabien Chouteau <chouteau@adacore.com>
-M: KONRAD Frederic <frederic.konrad@adacore.com>
+M: Frederic Konrad <konrad.frederic@yahoo.fr>
 S: Maintained
 F: hw/sparc/leon3.c
 F: hw/*/grlib*
-- 
2.30.1


