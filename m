Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8F25BC346
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 09:00:45 +0200 (CEST)
Received: from localhost ([::1]:32964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaAln-0005tg-Rz
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 03:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oaAHt-00086v-5l
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 02:29:49 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oaAHc-00008o-V7
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 02:29:48 -0400
Received: by mail-pj1-x1036.google.com with SMTP id y11so9865196pjv.4
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 23:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=i+HdEVHgTAqhX4nFnIrKeC/y1s1oaBNri9WKmxjnefM=;
 b=nvbqUUBL8+UzFT4AYhjV4g4sROHGUMJZ+fm6QaqLxFCBb4L7F6vmJ/kD8WqaSeTPar
 Yg0M6xtKJBCuT3SF1zrS9MHK2q4kagZMczq1mi0ntZNIdz2XRPWmqA8tbIfBVgPQkPdu
 OIeOCXAtLG//G0667hgsMTFMx/RSFXSR6c0R9+eLavJfEe7thnAq3kOCaHloBL9Wxcbm
 V7PWSnwtB50w6mSPOy5uxMcv2anQqdS2hB43Zf6qH2BCflQMs5Zs7cESNXPTrnyDWs7v
 DgGhTo6yHJFKoY5C73G6yloVEIgjfXXxdXZSyeJdu3cAjvoDM1MhCXdMa7mkscA5MEHl
 VgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=i+HdEVHgTAqhX4nFnIrKeC/y1s1oaBNri9WKmxjnefM=;
 b=5CcrzkXBCAVo7GnkSW5tkZvXxsf0EXOUqzlQgo5YDZskt99roqPjl6yaAsNBq/bak5
 4nwFqhVC4mYi+WGYvRiG0cCebJ+Y0XUjJWtQldRZNanY6oHAayY9z/V+uGIF/N48CiMh
 7W2Ct7a2GOVOAbZ8tetunMgtvndsCOgFsWQPZqgCAqF+E3V5U2OSaqnCytYW5Gou8Ya0
 1eTwkQ6GtxmZanmrsFpbvm4ph4RNP7EzEG+5QUnvcfbJuRQk2OygIbiJWR90WvNQOmNU
 i+n759zTfRk32f0xpkExSh4xSVSWuaJ++qg+lnsRWDENuj2gg69F8j7sJbQgS8RTRctR
 CSQw==
X-Gm-Message-State: ACrzQf20BRqcQlf2BkrjEiesjI11k2krP0qMw/JTWf7EQaS2uzFkMx1u
 dXEQT2kJFz6ADu30SkDme4EWhd6ZdzKIpg==
X-Google-Smtp-Source: AMsMyM70d4aJBnJH0K9I7eyvHPnWDDT6o6UeepD4KFT/reRfVxZUaC0HdhEIoNICqLJdYbaZzFUDRQ==
X-Received: by 2002:a17:90b:350b:b0:202:8495:6275 with SMTP id
 ls11-20020a17090b350b00b0020284956275mr29575893pjb.216.1663568971361; 
 Sun, 18 Sep 2022 23:29:31 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.169.74.146])
 by smtp.googlemail.com with ESMTPSA id
 y1-20020a17090264c100b001782580ce9csm17678574pli.249.2022.09.18.23.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 23:29:30 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, alistair.francis@wdc.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v9 4/4] target/riscv: smstateen knobs
Date: Mon, 19 Sep 2022 11:59:08 +0530
Message-Id: <20220919062908.643945-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919062908.643945-1-mchitale@ventanamicro.com>
References: <20220919062908.643945-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add knobs to allow users to enable smstateen and also export it via the
ISA extension string.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index aee14a239a..1252ca71b3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -102,6 +102,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(smstateen, true, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
@@ -1021,6 +1022,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
-- 
2.25.1


