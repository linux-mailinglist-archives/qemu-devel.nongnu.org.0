Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF86F7A45
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:04:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujr6-0007w9-HL; Thu, 04 May 2023 21:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujr4-0007vf-Qh
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:27 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujr3-0006qI-63
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:26 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6439d505274so193179b3a.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248602; x=1685840602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VUdrhXPjbgTbybk94uAMNTrh0ZDyzc4ZvWsfq2o302w=;
 b=AabQLGG08cVe4ubBD2irYFjXj3/n6OLdzSOGzyCm/A5pgvfU47XEcO1mc5B456QTIB
 kLiauCE2rZ8lFm4vtWnPd/jpclNJVXFQ6SKApiKigQro5Bxq3B3tM+z0YW8PhT/9TRck
 PitgLj4/CqJOzA5kMnRnc+eD6PLMkN+9VU9v8hC67ayiG2wRhEJeuZ/0GTPtlVL3F5PU
 Ov2riEW2sBco1yZ9uQxHX/2ApIf48k6SK6VIVy8D/ndRnPjGWgdZCwyPAVjG2dMkcu7q
 v5thEp5bESrZJvt/38gbldOOtwmCGxFIHmCI0QPRy4PtHORN9PuR6NXtJzOqEg3Y2m77
 6dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248602; x=1685840602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VUdrhXPjbgTbybk94uAMNTrh0ZDyzc4ZvWsfq2o302w=;
 b=drB7zIHjZ+Mp7n5h7qRlkG8PTuJjumPiR1Sqzw+BLoU4VY9tAFYTrj0Av1qsVPwKg8
 ybwznRDRk/beU2Hc8evLJHgT8DF86tvmA3U5usQNwQTPdyVCBdEjea3Ut4frTgTokVyQ
 Iq+0QQzQeV7xbIjByCm2VY+pr/Vf5DcjC2R1YZS7iaxc5C/ynxat+zYedmEFnuQjQfZQ
 R1xDGJ79QbGE8o/Wj7myLbO2NtmfBJD81+5MRdt7cTnvTiUCIcrjg7JjZfxyyN5LxMY7
 cmguQj1fbHzQiKTaq56IA5XR+XWAyxl1u3X6i1535EEUpBe0xEpQeJEoWBJ1wzWiihWQ
 nx2A==
X-Gm-Message-State: AC+VfDwDdF9PY9sKH9Ls4fLmXCFm0REmuCnnlt86pgisYoewR5xLZNdH
 jdHHm2TnCHY8GkpTF1PYb7CNlADCgFvr0A==
X-Google-Smtp-Source: ACHHUZ5s5cH9HER7NS7BC4h/0TyiP84C1F5KSjDjyHRMdopFTAn0/6MuxrgkmCnwpbAw/DhpaCecdw==
X-Received: by 2002:a05:6a20:a688:b0:f2:afd5:e52e with SMTP id
 ba8-20020a056a20a68800b000f2afd5e52emr4172364pzb.33.1683248602518; 
 Thu, 04 May 2023 18:03:22 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:03:22 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 02/89] target/riscv: Fix priv version dependency for vector and
 zfh
Date: Fri,  5 May 2023 11:01:14 +1000
Message-Id: <20230505010241.21812-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x432.google.com
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

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Vector implicitly enables zve64d, zve64f, zve32f sub extensions. As vector
only requires PRIV_1_10_0, these sub extensions should not require priv version
higher than that.

The same for Zfh.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-Id: <20230321043415.754-1-zhiwei_liu@linux.alibaba.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e97473af2..eaf75a00a6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -84,7 +84,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
     ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
     ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_11_0, ext_zfh),
-    ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
+    ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_11_0, ext_zfhmin),
     ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
     ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
     ISA_EXT_DATA_ENTRY(zba, true, PRIV_VERSION_1_12_0, ext_zba),
@@ -104,9 +104,9 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zksed, true, PRIV_VERSION_1_12_0, ext_zksed),
     ISA_EXT_DATA_ENTRY(zksh, true, PRIV_VERSION_1_12_0, ext_zksh),
     ISA_EXT_DATA_ENTRY(zkt, true, PRIV_VERSION_1_12_0, ext_zkt),
-    ISA_EXT_DATA_ENTRY(zve32f, true, PRIV_VERSION_1_12_0, ext_zve32f),
-    ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
-    ISA_EXT_DATA_ENTRY(zve64d, true, PRIV_VERSION_1_12_0, ext_zve64d),
+    ISA_EXT_DATA_ENTRY(zve32f, true, PRIV_VERSION_1_10_0, ext_zve32f),
+    ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_10_0, ext_zve64f),
+    ISA_EXT_DATA_ENTRY(zve64d, true, PRIV_VERSION_1_10_0, ext_zve64d),
     ISA_EXT_DATA_ENTRY(zvfh, true, PRIV_VERSION_1_12_0, ext_zvfh),
     ISA_EXT_DATA_ENTRY(zvfhmin, true, PRIV_VERSION_1_12_0, ext_zvfhmin),
     ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
-- 
2.40.0


