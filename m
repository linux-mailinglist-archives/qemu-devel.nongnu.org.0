Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4401B482CE5
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jan 2022 23:12:12 +0100 (CET)
Received: from localhost ([::1]:50946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n495H-000438-DU
	for lists+qemu-devel@lfdr.de; Sun, 02 Jan 2022 17:12:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3QyDSYQcKCuAXGPVWTGIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--venture.bounces.google.com>)
 id 1n490P-0001Z4-U3
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 17:07:10 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=36677
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3QyDSYQcKCuAXGPVWTGIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--venture.bounces.google.com>)
 id 1n490N-0006DT-Lx
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 17:07:08 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 e137-20020a25378f000000b0060c1f2f4939so38835990yba.3
 for <qemu-devel@nongnu.org>; Sun, 02 Jan 2022 14:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=f6aHV+RQ8g72pXcMcalu5La7wzKW07c0b6pdNRtw5zg=;
 b=aSMQdpIdvy0/9LirwoKxgYohl131ekE0H86WEB/hmitGPJ8KHBHbXKl6WVpv4NTArj
 GJf1aNE/vB4nKLUC1TxqQlV1iTR+p/yHUFQl5kciA2EOontmRH5h9ovVn5AgHC065vGu
 BzQqSWOlZVkIvidRLXN5WIpJlb/lsh1QiDPVpF6uNanj9DvgQ40paGNqLw/0A/bNg1Y9
 6kPGFgVlqxtnrwtL9W3o2YxVmQ5gmxYO82QyaKfUZdfBQrFQUHVbLSG872LYSZqascQM
 ZLwIMXKYUhur06rJ5DK2En+mQnA+qCe4wYWsRdORyv3+AG4W+lyX9GDVYkZxdjWR//mq
 GrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=f6aHV+RQ8g72pXcMcalu5La7wzKW07c0b6pdNRtw5zg=;
 b=DnUkKnLG+ewkGRUvhi5ENxI76SyWjTm0ZBhC4ySsOhZgBelrqbf5ePEdPRVbOQ7Viz
 uJ/AbUnpxaD/+K/iTaFI+m8/7I+j9CPh6TUmaRL291tkDKAxmWpUjeXt6Guf330xLUEQ
 aB86GBP+H/HgfyjL/l4R3k531GJT7bXgUzLcAVe705E/fnNPhVSbLeIIosJyuEHjHNrk
 qbRIMB7yWpIP5xm9e48Ej26iTikKhawywnUFUSz1lDb1LP51pSE4oRdvDZiEooheOFKt
 eVdI1HtFVULjAWc+w3AVDpCrwAs0SQ2N3wloDFiv7jETHhGFQxb/wxFiekC44E3k6QY/
 hghg==
X-Gm-Message-State: AOAM531/hgUCNVmdPDzIafBB32JlhiY2N4IYZuumlDdku2FTxlXfNPWk
 /bOqmabU/DN6o/s6FQ99QNJ7aCPgHB66
X-Google-Smtp-Source: ABdhPJxdL7rrXfvpDTRph9BtyfBxw1vFgUQA5jq5YSQG/0RvU2X+VYmMGsblvYNHDo+oaSoCc5u+bqbkG8xl
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:9adc:6d14:2e33:8585])
 (user=venture job=sendgmr) by 2002:a25:cfcc:: with SMTP id
 f195mr33313870ybg.710.1641160771516; Sun, 02 Jan 2022 13:59:31 -0800 (PST)
Date: Sun,  2 Jan 2022 13:58:43 -0800
In-Reply-To: <20220102215844.2888833-1-venture@google.com>
Message-Id: <20220102215844.2888833-3-venture@google.com>
Mime-Version: 1.0
References: <20220102215844.2888833-1-venture@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 2/4] hw/arm: attach MMC to kudo-bmc
From: Patrick Venture <venture@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, crauer@google.com, 
 wuhaotsh@google.com, titusr@google.com, Shengtan Mao <stmao@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3QyDSYQcKCuAXGPVWTGIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
---
 hw/arm/npcm7xx_boards.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 37de9fef43..257bf638fd 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -399,6 +399,7 @@ static void kudo_bmc_init(MachineState *machine)
                           drive_get(IF_MTD, 3, 0));
 
     kudo_bmc_i2c_init(soc);
+    sdhci_attach_drive(&soc->mmc.sdhci, 0);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.34.1.448.ga2b2bfdf31-goog


