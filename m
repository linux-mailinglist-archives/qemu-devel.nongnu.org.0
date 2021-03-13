Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7C233A0CF
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:58:29 +0100 (CET)
Received: from localhost ([::1]:54636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAP6-0008Rt-74
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAG0-0006gl-Py
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:04 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAFz-0006x7-9S
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:04 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso17804686wme.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p3rJSXI8AKLVIYnCtIJWOvToJLkr6ghkaSVEvpGX+18=;
 b=B1YpgeO7wcHMKXyr858QrYYX8Ou0S6TSFOUYm5PiLxc89hO0tuRRwtlAVg1ZEDksbC
 z134Hv3Sun6+NpjJVlhA7VFg/fE63gpxnR+U/jdi9Gy87c2296iK9lIYXYgVcardPqFR
 5v8YRyRRh2I18t/3SEL4b7dztK4Y51im/qygFAKB1RSXNzqARX7Jx2d/T+3Ahl5BTDBv
 L7I+WyVMxzXl589n9/M3zj8VFNqfr+7qIB6k6WXA+95rkw3GbvO1y5Bp/FyRFKEeDsAX
 afSog01cQs8k51vXlV0HPaNspfytcY8GDeLl83O2c94TzK3qD3NbRQ3zLuoqIlu4Zy5I
 i0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p3rJSXI8AKLVIYnCtIJWOvToJLkr6ghkaSVEvpGX+18=;
 b=UQPu7BxkMzCcUtnPTo+puRzAWq7cCQ1SLbWrs58ZexO1nFB52210piH2RdthFKZKSM
 4cFAARRJhRMa0aF/O+1sJcRgHCmorMkBMgJTBLV1JZk1We+lWyFDFde1SJb+Ib7lB+0f
 LnkA/SQwogP8QSz7PbsMS/DvBXFboy656VwCXbN6+auppANbChVjAftmnzHEXb0NxksV
 QUvy6NtkWR18E6L4JH+7tYj/mcaycqD/iNThAh9zMZgLpbqmPqbs3mf++5k/19FsoOaE
 i54XbWvbrT6sdxlNP6nnHCp510NGOPO+ePp/ErMaauA9UdoFiYA7a7CHOm5U/wJlLW6p
 4W5w==
X-Gm-Message-State: AOAM531fIjWqpEgdp154MZkyekEHyF17k3Bq21qX6MXRJ3HNHM8jFJrR
 ummisZpTvK7ZSvtnDzn7ONV8wGdh8bRVmA==
X-Google-Smtp-Source: ABdhPJwdKxsPhx/htLlNPAagCk7+vMiojx0KvyB+2CCnYircVoh801TIoTgdFyWNFG+K34qngD4pQg==
X-Received: by 2002:a05:600c:2197:: with SMTP id
 e23mr18590577wme.39.1615664941799; 
 Sat, 13 Mar 2021 11:49:01 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x13sm12900544wrt.75.2021.03.13.11.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:49:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/27] target/mips/meson: Introduce mips_tcg source set
Date: Sat, 13 Mar 2021 20:48:08 +0100
Message-Id: <20210313194829.2193621-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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

Introduce the 'mips_tcg' source set to collect TCG specific files.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/meson.build | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/mips/meson.build b/target/mips/meson.build
index 9741545440c..75c16524606 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -6,12 +6,13 @@
 ]
 
 mips_ss = ss.source_set()
-mips_ss.add(gen)
 mips_ss.add(files(
   'cpu.c',
   'gdbstub.c',
 ))
-mips_ss.add(when: 'CONFIG_TCG', if_true: files(
+mips_tcg_ss = ss.source_set()
+mips_tcg_ss.add(gen)
+mips_tcg_ss.add(files(
   'dsp_helper.c',
   'fpu_helper.c',
   'lmmi_helper.c',
@@ -36,5 +37,7 @@
   'cp0_helper.c',
 ))
 
+mips_ss.add_all(when: 'CONFIG_TCG', if_true: [mips_tcg_ss])
+
 target_arch += {'mips': mips_ss}
 target_softmmu_arch += {'mips': mips_softmmu_ss}
-- 
2.26.2


