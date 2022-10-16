Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8A15FFF7C
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 15:14:13 +0200 (CEST)
Received: from localhost ([::1]:42626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok3T2-0001y5-Ad
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 09:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ok33w-00064Y-DL
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 08:48:16 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:42709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ok33u-0003S6-S7
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 08:48:16 -0400
Received: by mail-pg1-x533.google.com with SMTP id e129so8259312pgc.9
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 05:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BSPxauUWtTz3kJSX6i3KRFV7NQvQXi6uauFIYXMxRg0=;
 b=iilnmxjrzG1OAvH5qy9kKMjsTw9WZNw1AOI/y1vAnSeBem5yNQAEovY9ACpBPmR+iC
 uRWfRx50mjMa1BZM3gxqHoCAsXvOG0ScNnlxDOVPbOvOQoddjEH8uTZlKb6KL3x8nU4U
 e8kTDiRbPe7SGZFc9P2W/C84J0y7UQx2id1rss1BaxPaksViYPxjDIQMMXd4XkiKIHiB
 ey65mWHcEeWc9ex8T2+PSsfriI4DeqH1kGCI9CULEz3MX5tnaVlrChWCLJNxfvk5z6JG
 8l9Ovxp9K6gYSuDjqpj9XjsUKtSbOauFkqXBYrq/8rTduonzpVG/7JNsuVb7aiRRVpvk
 Y34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BSPxauUWtTz3kJSX6i3KRFV7NQvQXi6uauFIYXMxRg0=;
 b=OPn9rgmsvyP15dQi7uczizn9wmT4LcraY62U7zQirxNBXiPA6KE/Znoa2SIabiVpuV
 HnuRYUoAbiix3LizH4g+JcAuP3XZNdKf/HXGMaA6nsjwk/4epL4lABeEQh3wJsAl4DB2
 x9TvxAfTa51uGaqVbXbIn2UZxPxEX95MaaNJbyu+1zw0c+Bct9LzAo6+PvwnkO64NtvP
 1WFR4/Td6zqw8+M1DITxVgZicK5H+pY/h5FxwITEt5pa+HrSAg9Yx2nUSnh7/U/vqYzd
 o8SvWxNeFlA0bPzkGUIAgIkCzIFu+Ay+KyQE0JDdD2cXwYMF0oZU0DPFNL5h5v/rFEt9
 MnCQ==
X-Gm-Message-State: ACrzQf1apu4z2WrHNJfv4AYnZBC4dEpcaITunnt1/LRRs5CQ40Zs2RB4
 WNBfInnY3fdi8kkjUcvqTiHYMNsJElfZLg==
X-Google-Smtp-Source: AMsMyM7Q/if7OXdS0odLaOQENPfCnE7BrFE0McogipmQosgssHYyCn2yzqmEMBEkjPm+ImvhP+nJbQ==
X-Received: by 2002:a65:6a12:0:b0:445:84f6:676a with SMTP id
 m18-20020a656a12000000b0044584f6676amr6270879pgu.40.1665924493105; 
 Sun, 16 Oct 2022 05:48:13 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com
 ([2401:4900:57ef:25d:3187:d4f6:127:22d3])
 by smtp.googlemail.com with ESMTPSA id
 v18-20020a634812000000b0043b565cb57csm4444894pga.73.2022.10.16.05.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 05:48:12 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, alistair.francis@wdc.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v11 5/5] target/riscv: smstateen knobs
Date: Sun, 16 Oct 2022 18:17:26 +0530
Message-Id: <20221016124726.102129-6-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221016124726.102129-1-mchitale@ventanamicro.com>
References: <20221016124726.102129-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e6d9c706bb..ae3f57a72b 100644
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
@@ -1024,6 +1025,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
-- 
2.25.1


