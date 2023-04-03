Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39046D4EF9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 19:30:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjNzZ-0001Xf-II; Mon, 03 Apr 2023 13:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjNzW-0001WJ-Er
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:29:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjNzT-0003p9-8N
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680542950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iua7amQSazSLORwfTCLHiXl3n6eXfPsBT5qVe62QKHQ=;
 b=ARUDoSKfWRLtTF3tQSN7tUy6+sdkW8hKVY7bz/6tG8mQ+nCsf1GGN6ORdVkKPpL/ksKFOs
 n2cogjYH7eS21r4dj1cEjIc9c2oyQe3GFCyIi/EzInUXH2YUhgF7gVNDcZKfl+AOjsjgWY
 L0GMn3IQ8f0xUqQ/bjxSxKRqS2uf4X8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-G4FTPsIBNB65LpuBZtZPag-1; Mon, 03 Apr 2023 13:29:09 -0400
X-MC-Unique: G4FTPsIBNB65LpuBZtZPag-1
Received: by mail-ed1-f71.google.com with SMTP id
 b6-20020a509f06000000b005029d95390aso5726995edf.2
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 10:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680542947; x=1683134947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iua7amQSazSLORwfTCLHiXl3n6eXfPsBT5qVe62QKHQ=;
 b=SO3HXkWrfOh+N7HqoK2jF3tboiyspavA8pfWf4nU+EGITaFxQK5lUVPt2ppUBLKhYc
 kJbi4WGmTkwgDCSd9kGARe8LhDg8gRBCRBg3LfqeOskoYMRl7FAWwFSPebk3OTkzwqm1
 kxs6nCbAcqiORvg/8UPrHFR0jV3NopVh5W8RwqB2yv9AZ1/kw2570GIreosYFMRKVPjs
 P/2sTiYcL0WmrlHOAbQI21tCEVU8SsSsSG/l4l/c4WcM2YjGewIqcyqo9KgXL1f1eErh
 DhcnVuhJG74IX6OIu2H5YxYwW5x1q/u3uKq2NI2Nt09vou20CQ2D9tr23ApbURqdXf4e
 NMEA==
X-Gm-Message-State: AAQBX9cYkvNf1ga3l6CacJ2h8i6Y0HqXmd8HeyPMQOc/lL2xEv1XC4pO
 5nBDTNRIj18xczMhQhDR/0eU/jbUbdYTXKTZn5P+3/dH5Jf8xqtMNYjD20SbjhKSqoonptnVOiC
 SSM8aU9v0PRtLpq5BsbJ7eGdf2xKPfktR76eNLi+hfZvonDB3AGfFKLX1B6KjztZgO69EgVdb5M
 Ey2A==
X-Received: by 2002:a05:6402:796:b0:4be:b39b:ea8f with SMTP id
 d22-20020a056402079600b004beb39bea8fmr53435edy.2.1680542947690; 
 Mon, 03 Apr 2023 10:29:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z37SKIctpg/J4qHs5epRsXb7IbD4h4SyJWzFsyhYsjF05gngeciS/43fM9JMfRpiWvq+gjlg==
X-Received: by 2002:a05:6402:796:b0:4be:b39b:ea8f with SMTP id
 d22-20020a056402079600b004beb39bea8fmr53417edy.2.1680542947346; 
 Mon, 03 Apr 2023 10:29:07 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a50c091000000b004fa99a22c3bsm4837104edf.61.2023.04.03.10.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 10:29:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org
Subject: [PATCH] target/mips: tcg: detect out-of-bounds accesses to cpu_gpr
 and cpu_gpr_hi
Date: Mon,  3 Apr 2023 19:29:06 +0200
Message-Id: <20230403172906.397188-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In some cases (for example gen_compute_branch_nm in
nanomips_translate.c.inc) registers can be unused
on some paths and a negative value is passed in that case:

        gen_compute_branch_nm(ctx, OPC_BPOSGE32, 4, -1, -2,
                              imm << 1);

To avoid an out of bounds access in those cases, introduce
assertions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/mips/tcg/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 1fb4ef712729..999fbb7cc1c0 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1223,6 +1223,7 @@ static const char regnames_LO[][4] = {
 /* General purpose registers moves. */
 void gen_load_gpr(TCGv t, int reg)
 {
+    assert(reg >= 0 && reg <= ARRAY_SIZE(cpu_gpr));
     if (reg == 0) {
         tcg_gen_movi_tl(t, 0);
     } else {
@@ -1232,6 +1233,7 @@ void gen_load_gpr(TCGv t, int reg)
 
 void gen_store_gpr(TCGv t, int reg)
 {
+    assert(reg >= 0 && reg <= ARRAY_SIZE(cpu_gpr));
     if (reg != 0) {
         tcg_gen_mov_tl(cpu_gpr[reg], t);
     }
@@ -1240,6 +1242,7 @@ void gen_store_gpr(TCGv t, int reg)
 #if defined(TARGET_MIPS64)
 void gen_load_gpr_hi(TCGv_i64 t, int reg)
 {
+    assert(reg >= 0 && reg <= ARRAY_SIZE(cpu_gpr_hi));
     if (reg == 0) {
         tcg_gen_movi_i64(t, 0);
     } else {
@@ -1249,6 +1252,7 @@ void gen_load_gpr_hi(TCGv_i64 t, int reg)
 
 void gen_store_gpr_hi(TCGv_i64 t, int reg)
 {
+    assert(reg >= 0 && reg <= ARRAY_SIZE(cpu_gpr_hi));
     if (reg != 0) {
         tcg_gen_mov_i64(cpu_gpr_hi[reg], t);
     }
-- 
2.39.2


