Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EEB586F92
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 19:29:21 +0200 (CEST)
Received: from localhost ([::1]:34520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIZEG-0004eD-4l
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 13:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oIZ4w-0004mA-Px
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 13:19:42 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oIZ4v-0006ix-3n
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 13:19:42 -0400
Received: by mail-pf1-x436.google.com with SMTP id 17so11269601pfy.0
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 10:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/6PKI0QUD/9+yYYe7TmpMU06G0Kr05B5w6N+00Yhr4M=;
 b=RVGJ2/kM00TeqMEmVNnFRcIukJtRXnL6cA9730wmPoTQ8Z0lD90rvkCaxcH+9VhyDr
 mQ3535GXnLyzaYgpU+cBILkqQPwX8BXbXHwhFJEXWaY3chn+f3R74qu2g43YZvWZFMEn
 MqjBruNpINofjZxEfppzSUG2W5FRAndqY+6u6u9/Viwtxs0STH+chJ38ENpvs8C8O6fI
 n5ffk49E3Hd1/pY0wG+0SnW/IW87bKmHmlNQk3G2J8ESWabEUdsCPPG9kKOvacP/FRsE
 PKzN29eZirkC0fZv3YIdjDZgd5JXQ8/UCxaCuJ+z082P2KiLnVOIQqWdCp0g9RJhwgMf
 oywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/6PKI0QUD/9+yYYe7TmpMU06G0Kr05B5w6N+00Yhr4M=;
 b=ySgBVkJSFMJSPuSOriGDtTJu9hfjGqeJSdskf9n/RrDWN8BbjpqtIMfOj50Hb+9tER
 9jAevHd/bfKW9dnyz5v2+DrS3crINWJaNb5bovqA1tp+HHCu3l+WfZBeasiZJW2Ys9ZO
 Khw0Wbq5GrizABWiRGfH+hz1vuE2AEnofs02e/jQoiCy2ysEAcvcObB4pAde3VUzFaLA
 HlIcG+giZkZ4iQowXBfdpg5NxziBXOYRMfYUB5hEjivUWHOdVT8NtZhmTqYXP08PDUZZ
 R76P8K8Q9gP5M0IUT+u96pbz/RZdYXBsRsPxL7ZPKV+nL7EsTTfkb1DvkrfyQprRFlph
 5ZYg==
X-Gm-Message-State: AJIora/oOk4oinnXWkmkB4H3ptdKxRrPlcfiaFFSdIGyEL6BzsfHk6rw
 q4KVTFnzilNX8aTrk+qlILOxh00FyfAJpA==
X-Google-Smtp-Source: AGRyM1visrZzZQnNzzLOHJg8/NYTmj343I4XyaGGbZmawtJ3QDPHtKWBptvTuGvG162f+tbnFsYIxQ==
X-Received: by 2002:a63:1a56:0:b0:41b:3ef0:4eb1 with SMTP id
 a22-20020a631a56000000b0041b3ef04eb1mr13784458pgm.207.1659374379450; 
 Mon, 01 Aug 2022 10:19:39 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.176.236.198])
 by smtp.googlemail.com with ESMTPSA id
 i10-20020a056a00004a00b0052ab602a7d0sm1709942pfk.100.2022.08.01.10.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 10:19:38 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v7 4/4] target/riscv: smstateen knobs
Date: Mon,  1 Aug 2022 22:48:43 +0530
Message-Id: <20220801171843.72986-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220801171843.72986-1-mchitale@ventanamicro.com>
References: <20220801171843.72986-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d4635c7df4..d8a0f4e700 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -99,6 +99,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
     ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
+    ISA_EXT_DATA_ENTRY(smstateen, true, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
@@ -1001,6 +1002,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
-- 
2.25.1


