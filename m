Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0142DA169
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 21:24:46 +0100 (CET)
Received: from localhost ([::1]:58362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kouOj-0001M9-Eg
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 15:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1kouNm-0000UE-9E
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:23:46 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1kouNk-0006dw-F5
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:23:46 -0500
Received: by mail-pf1-x441.google.com with SMTP id m6so3142654pfm.6
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 12:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JwsepyuXYc7GayLTZJ2zaNcwjYwyjPdiQ/lSSlYJXOg=;
 b=JjFY4Vzg5FRwv67h2PgI04RkipmDhnB5DJU4M/FLsACdyZ5gWBmwFaAYuuvqE09fm7
 kEn+dCztcTjFfrrJA1uHE7S3qkiM7S8/IjnNf/+Yw2P0yl0GA0yPVUVoUEhAEoy4W45p
 gtsR6HJOHjjDS1qA8DmH+kWsIeNle/SRWfndxkjZq4aLvmITLH9bBMxDwGfQtanbM8bj
 aHJmElSC7s+R+aMAhaiSOgjpXm3MgRtpayrtVsFZgQxpjQBBqOZ74WeIDjn/j5SvyL9O
 sJswfotTZAaI+Lj8O6kpWbi+XKmFsFQc5a+SSwkmYp/ImLWbPOUol0U2KFLXJ9HKBFtc
 su5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JwsepyuXYc7GayLTZJ2zaNcwjYwyjPdiQ/lSSlYJXOg=;
 b=Cz1urr+p3GDVSjCCEAo/M+ABBz8pEPJEyC4PWlFmpaP6seGqDj2/u+rJN+N2fv/UMP
 pVhLICb1FeS7x5Ld+Z+mYd6BdXTrhklYBtt+AXC2/TINMYHy7IP20YyaZpry1Gqm1aDa
 2N5mY3FNdnhAaAvInXUIgX3d6A8Yz+Oe50PspzG5gx7iTAYfSzYn2fDGvoAndMlFgbQ4
 drPjcsrltFGWOaHnZ8/LacXcu8M4fefAs7TdVQP3cG6taPXGfCTMuDXB8dHz/OqT6Xzp
 q6VhoscfSU7zONDJOzMZ8E4cc0kPs+eeltPvUj2nvqSAZ4VfeYk8IatLzr0k5fdyXZI3
 0+mQ==
X-Gm-Message-State: AOAM533c1tEUnNTlwoitoEdJlSilw4xOeiDs/1SBnfMe9JgXgjKDHpt6
 BrNwxQfXtRDp7ACyNEfmtji6qZhN7JOsHkiDDpeb5SCf/VVdLCBQ8rt5BM+o1UygNa1DUF61bFM
 u/GxehqDZovLU1ldhm2ZR9yzAgdBkKjMuCcakss2R+B5TSd2Bj9qY784sg8oll24/9iQ3SnwW7g
 ==
X-Google-Smtp-Source: ABdhPJwO4G1+tMccRLotqHKsi60MNkQFdzkLlFxTgaIG+y3EXP7Y4/HbmTsQKpYJ+4x1Y6sCO4Fl6A==
X-Received: by 2002:a62:8448:0:b029:197:9ab7:9fdb with SMTP id
 k69-20020a6284480000b02901979ab79fdbmr25432256pfd.49.1607977422696; 
 Mon, 14 Dec 2020 12:23:42 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id a141sm20927524pfa.189.2020.12.14.12.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 12:23:42 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/arm: add FEAT_TLBIOS support
Date: Mon, 14 Dec 2020 13:23:27 -0700
Message-Id: <20201214202329.26765-2-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214202329.26765-1-rebecca@nuviainc.com>
References: <20201214202329.26765-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=rebecca@nuviainc.com; helo=mail-pf1-x441.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARMv8.4 adds the mandatory FEAT_TLBIOS, which provides instructions
for TLB invalidation of entries in the Outer Shareable domain.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/helper.c | 30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7b8bcd69030f..28556eb48b44 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4870,6 +4870,10 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 0,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
+    { .name = "TLBI_VMALLE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 1,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
@@ -4878,6 +4882,10 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 2,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
+    { .name = "TLBI_ASIDE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 2,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
@@ -4914,16 +4922,30 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1_write },
+    { .name = "TLBI_VMALLS12E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 6,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle1is_write },
     { .name = "TLBI_IPAS2E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 1,
       .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_IPAS2E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 0,
+      .access = PL2_W, .type = ARM_CP_NOP },
     { .name = "TLBI_IPAS2LE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 5,
       .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_IPAS2LE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 4,
+      .access = PL2_W, .type = ARM_CP_NOP },
     { .name = "TLBI_ALLE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 4,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_alle1is_write },
+   { .name = "TLBI_ALLE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 4,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle1is_write },
     { .name = "TLBI_VMALLS12E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 6,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
@@ -5590,6 +5612,10 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 0,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_alle2is_write },
+    { .name = "TLBI_ALLE2OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle2is_write },
     { .name = "TLBI_VAE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 1,
       .type = ARM_CP_NO_RAW, .access = PL2_W,
@@ -5795,6 +5821,10 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 3, .opc2 = 0,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_alle3is_write },
+    { .name = "TLBI_ALLE3OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle3is_write },
     { .name = "TLBI_VAE3IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 3, .opc2 = 1,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
-- 
2.26.2


