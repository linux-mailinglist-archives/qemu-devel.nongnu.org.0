Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CF74ED09A
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 02:04:09 +0200 (CEST)
Received: from localhost ([::1]:44660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZiIK-0007o8-8S
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 20:04:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZiBt-0004u5-To
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 19:57:29 -0400
Received: from [2a00:1450:4864:20::330] (port=51075
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZiBs-00040w-Dw
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 19:57:29 -0400
Received: by mail-wm1-x330.google.com with SMTP id h16so13252645wmd.0
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 16:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=182UiCvgw8JEviPTGQTPc9assRie1CfU/iAvGy36vQk=;
 b=ViFj7e03vL8hNtgkozQZCSn3YRj/4opqUEh0P9tU0D23hZBnbyOGJzh9D3y619469q
 O7wBetp3taSOvm4R6+ulGfhHvsGeFR8y/G/sMxovB9xltvjcvdSZbs6mENZoJ6Rrdib1
 GGtOUM0wBJmNkZhIpifiYEOtWsEecrauvdoV9xgP4TziX8qMnPWm/EVf4KU4PxMKTv6k
 BF+k2r0b3zBJIesK1Dm4UDD7PqYrdIAi6M6pjEjHHd/y6z1VOiic4PhQLeg5XnIpHS++
 YfsiMtlzMcRfH559pq/inTcOytVk1AXCXlWFizQmj/exsLLlMUv56iJvnlTzuEHFIG5M
 SSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=182UiCvgw8JEviPTGQTPc9assRie1CfU/iAvGy36vQk=;
 b=wiZnozrly/wXmcQdxtyIGw7qQMhWP9RLQvcgTJwWHcW1Xtg4PK+R7EivMPNLlVenva
 Kx5+goB4KMaj2EGzeJU3kMQhjTxbCqliezzLOfCQpM/223ictn/xFo1Glc3CopxyhnMe
 +G4rN74NH/MK0F/2nF+JYjAzwLsdFSIIOdCG3L8fHbV6U3csb+Uq8PGfGX4FKHcksv7M
 a/apUZxq0LsyBVQRLV8PGL7rz/PVS61ouDHT3LbAhx4RPfjW6BdWY0YvOmXZs7JZzWik
 3KvD5KC1bfzrU1qzl2l850vGRvGBLmLOWm33IXQwTQOQKW9shGuhF0xLC9bFB81pLeNG
 il1A==
X-Gm-Message-State: AOAM532g6Kc4CWWHWxGgHUJdG4JrkQfnev7JwUljKNMpRUS6f4C4L10m
 h4F0AZWF3nXkSN9gDBjIfW/49uxeOQ0QCA==
X-Google-Smtp-Source: ABdhPJyeGmt6qVzGI9YtRVooou7AJI9r35i6WBl1Tn2GVEnz7FITh73CRvmEfDALqYiM/gygQV0EjQ==
X-Received: by 2002:a7b:c7d4:0:b0:38c:dd1b:5475 with SMTP id
 z20-20020a7bc7d4000000b0038cdd1b5475mr2076309wmk.55.1648684646107; 
 Wed, 30 Mar 2022 16:57:26 -0700 (PDT)
Received: from localhost.localdomain ([2600:70ff:f07f:0:403e:ab57:ee68:20ea])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a1cf708000000b0034d7b5f2da0sm5956055wmh.33.2022.03.30.16.57.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 16:57:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.1] hw/tpm/tpm_tis: Avoid eventual read overrun
Date: Thu, 31 Mar 2022 01:57:23 +0200
Message-Id: <20220330235723.68033-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The TPMState structure hold an array of TPM_TIS_NUM_LOCALITIES
TPMLocality loc[], having TPM_TIS_NUM_LOCALITIES defined as '5'.

tpm_tis_locality_from_addr() returns up to 3 bits, so 7.

While unlikely, Coverity is right to report an overrun. Assert
we are in range to fix:

  *** CID 1487240:  Memory - illegal accesses  (OVERRUN)
  hw/tpm/tpm_tis_common.c: 298 in tpm_tis_dump_state()
  294         int idx;
  295         uint8_t locty = tpm_tis_locality_from_addr(addr);
  296         hwaddr base = addr & ~0xfff;
  297
  >>>     CID 1487240:  Memory - illegal accesses  (OVERRUN)
  >>>     Overrunning array "s->loc" of 5 24-byte elements at element index 7 (byte offset 191) using index "locty" (which evaluates to 7).
  298         printf("tpm_tis: active locality      : %d\n"
  299                "tpm_tis: state of locality %d : %d\n"
  300                "tpm_tis: register dump:\n",
  301                s->active_locty,
  302                locty, s->loc[locty].state);

Fixes: Coverity CID 1487240
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/tpm/tpm_tis_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
index e700d82181..5b1055033e 100644
--- a/hw/tpm/tpm_tis_common.c
+++ b/hw/tpm/tpm_tis_common.c
@@ -295,6 +295,7 @@ static void tpm_tis_dump_state(TPMState *s, hwaddr addr)
     uint8_t locty = tpm_tis_locality_from_addr(addr);
     hwaddr base = addr & ~0xfff;
 
+    assert(TPM_TIS_IS_VALID_LOCTY(locty));
     printf("tpm_tis: active locality      : %d\n"
            "tpm_tis: state of locality %d : %d\n"
            "tpm_tis: register dump:\n",
-- 
2.35.1


