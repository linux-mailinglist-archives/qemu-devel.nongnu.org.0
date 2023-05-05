Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFCA6F7A59
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:06:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujrG-0007y3-Uq; Thu, 04 May 2023 21:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrE-0007xd-Gm
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:37 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrC-0006qw-Vn
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:36 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1ab01bf474aso8550085ad.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248614; x=1685840614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sslaewbTbiBH8XQ1gp6B49Xbcv0jBClrDRjZFrx/k4k=;
 b=okTasPgpUCcYczJZKJgxnR5fydDVZ5OrjxEnpQ1La4BSmL2KUxgLXmDdiYdZK6f63f
 pX2hAHjIq2ctVzaSBsHMqKkKemB+GVvLUMoWCAFufMmE0/3/J+j9cL2v12tmMSGPudOP
 7lrJu3NPzdAZ6rUb1Nl5HTTClqBCotqaay/vgtZY4UYT7///zULkec+736/CRrJME+ey
 leww9ulGyXPulP1R2SBsX3ZCTCGr9Vbm+YE1Mq2pOWu1lUTE6pCPohWiuC2vx7OXfaxH
 P9Lq+ZX4j+cMSsLA+5KZ5+xGoeDGuJw/2L5iP+HWVdn80RFq6LGwgf5uc57nBmJghvaY
 ksTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248614; x=1685840614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sslaewbTbiBH8XQ1gp6B49Xbcv0jBClrDRjZFrx/k4k=;
 b=VDcxE6cEON5+1Rk82YCfb+/PaTy4ySNayp/3HSySuaWjUJ7VSDR2hSvJyHnH6D7VAG
 x5OtZBZwXBIf+UZGDH4NDJVYI4Mf2Nv6cC8ElraqfnTCz36MXBtfj8Xk+bsmUVMd2hmv
 sH76CzE5MyMpcJ2/fAc3Snz5f1OH9Lk8X2tTPSSGIJnAtNLTEoqrulj1vf1jsoV1I18B
 B4828Y6PUwbK6JfxbQV+o1a3fvy1iahlAo2D7hLaxfkOQ8ezMdEXYj9ODqIt2CKU/djq
 ja8keMJUrUgtXx+4pSKGaSpXKUZkx6E7860dPz4mu7T8IcsX2f0ojGh/hWImhXk+Vswg
 HLiQ==
X-Gm-Message-State: AC+VfDx8SoczXTIps6adwWpxnatykvKTU5XPImtUb/9tSeIJeS72kb/V
 /dPdPp+zt4OEkXjmSsANwtD2u0+VurIExw==
X-Google-Smtp-Source: ACHHUZ4kRGXyFKzwTcRsH0+/jSsNfQRNgl2Ejx4qeMnON5Ri4ry+3Y9e/e3KEMbGktJVzB2vpO4mow==
X-Received: by 2002:a17:902:aa02:b0:1a0:50bd:31a8 with SMTP id
 be2-20020a170902aa0200b001a050bd31a8mr4967283plb.26.1683248613962; 
 Thu, 04 May 2023 18:03:33 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:03:33 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/89] target/riscv: Simplify arguments for riscv_csrrw_check
Date: Fri,  5 May 2023 11:01:17 +1000
Message-Id: <20230505010241.21812-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Weiwei Li <liweiwei@iscas.ac.cn>

Remove RISCVCPU argument, and get cfg infomation from CPURISCVState
directly.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230309071329.45932-5-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a7d0157d33..8f4d5eb13f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3756,15 +3756,14 @@ static RISCVException rmw_seed(CPURISCVState *env, int csrno,
 
 static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
                                                int csrno,
-                                               bool write_mask,
-                                               RISCVCPU *cpu)
+                                               bool write_mask)
 {
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
     bool read_only = get_field(csrno, 0xC00) == 3;
     int csr_min_priv = csr_ops[csrno].min_priv_ver;
 
     /* ensure the CSR extension is enabled */
-    if (!cpu->cfg.ext_icsr) {
+    if (!riscv_cpu_cfg(env)->ext_icsr) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -3860,9 +3859,7 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
                            target_ulong new_value, target_ulong write_mask)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    RISCVException ret = riscv_csrrw_check(env, csrno, write_mask, cpu);
+    RISCVException ret = riscv_csrrw_check(env, csrno, write_mask);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
     }
@@ -3915,9 +3912,8 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
                                 Int128 new_value, Int128 write_mask)
 {
     RISCVException ret;
-    RISCVCPU *cpu = env_archcpu(env);
 
-    ret = riscv_csrrw_check(env, csrno, int128_nz(write_mask), cpu);
+    ret = riscv_csrrw_check(env, csrno, int128_nz(write_mask));
     if (ret != RISCV_EXCP_NONE) {
         return ret;
     }
-- 
2.40.0


