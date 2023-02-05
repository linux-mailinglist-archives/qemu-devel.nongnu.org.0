Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172A668AF23
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 10:49:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObbC-0005jK-Lm; Sun, 05 Feb 2023 04:46:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vHrfYwgKClUF9BFGx2x3BB381.zB9D19H-01I18ABA3AH.BE3@flex--smostafa.bounces.google.com>)
 id 1pObac-0004cF-D4
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:41 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vHrfYwgKClUF9BFGx2x3BB381.zB9D19H-01I18ABA3AH.BE3@flex--smostafa.bounces.google.com>)
 id 1pObaZ-0001AR-SI
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:38 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 iv6-20020a05600c548600b003dc4b8ee42fso4590707wmb.1
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=z78/BenWmRG2niJ5TUh3WVxHeA5tSCQERjewCu6GIiU=;
 b=BZ2ixR3X0+yyQ+jMMS3hSFjYT1PP7t6Bljzb9eIY3HiTIa1tG5SLrpyS/e3xdhYara
 AXreHy/f09FXCDvcAKJ5/yetyjpEIEv5PGH+d0kyio9wz8Of7zt0DXy3jQqwpwWwxwJ2
 qc+LbeIgvhJBjHLTvHZo6Bx/Io5c+ZLvNAZLFm2Be0XVaDggqoDE+z6eQcakNQOSoH4b
 qDsgjkQdK76UMRZLUjc6SOz2Y/pN/z2y2mzVbBje2wbA2jCDT/AV2fIzdfpP1JdMlUxS
 b7E/oKEuUl7LEulGCw3enEsHEgN4kNKdBEcIAXldgfNJ7OXdduBGqzct8wWz2vHXWLdE
 50Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z78/BenWmRG2niJ5TUh3WVxHeA5tSCQERjewCu6GIiU=;
 b=EV2zssgk4SRhGgJcHWeZg0xypFCQpODJcI0pPGV5Onp7nWnTEC1bNrGRHS+mSTFqg/
 fYVzKBfBE4ft+7/x+h6jWzDIQNROKT4g0OFAGzxX6K69JzW0elSqOpnmiYAuR1AZIf27
 4ws6q6Ap8obMoj2ImFz1Mmf+ScchUD6ggv0eVqC5eO6N6ZHd8M4dv5YqgAzDQgf6NgzC
 9viKrIhHH+j+v3/cnCw/AEG++uN6hXmVi+bwGEbCU5FyTti0Hit64HWJ9T1Lu20tP9Tg
 SQ231GFn/uB32Jh19FzagHcOSnoKnqXfBP9PovS/zH3oX0OGlYAv13Sr0jT0JV8tILPJ
 LL4A==
X-Gm-Message-State: AO0yUKXpw5kbeBUqAmbXHpLLqZlvHig9f9eRBc4XVi0IoUO8ooL4tHry
 zyRVhLy6DHaA8trpgwnw0PRR1/uEn3HH6pMk/A/tN7m2J01UoUlNO8Jp1Mv/3LvfSoHmR7Ro7r6
 QBHG+8395mtoibF9bQ6nRIY13RDBXnhSF0uF3ATSB2baA4qJ/FxlNHg0xoVFrsVn64w==
X-Google-Smtp-Source: AK7set8eBtay/h7eOc2PxvtIiMXlwIAQQu0Lq/d4M9ZNGCXzrQhx+jNJdywfDSNDEwefZ5AXI5tkUuHwiiC/KQ==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:5564:b0:3df:daa1:d9a8 with SMTP
 id ja4-20020a05600c556400b003dfdaa1d9a8mr1071114wmb.158.1675590332385; Sun,
 05 Feb 2023 01:45:32 -0800 (PST)
Date: Sun,  5 Feb 2023 09:44:06 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-12-smostafa@google.com>
Subject: [RFC PATCH 11/16] hw/arm/smmuv3: Read VMID from STE
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3vHrfYwgKClUF9BFGx2x3BB381.zB9D19H-01I18ABA3AH.BE3@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

According to SMMUv3 user manual "5.2 Stream Table Entry": All fields
with an S2 prefix (with the exception of S2VMID) are IGNORED when
stage-2 bypasses translation (Config[1] == 0).

Which means that VMID can be used(for TLB tagging) even if stage-2 is
bypassed, so we parse it unconditionally when S2P exists. Otherwise
it is set to -1.(only S1P)

Advertise 16-bit VMID is supported.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 769c735697..35a0149bbf 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -260,6 +260,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TTF, 2); /* AArch64 PTW only */
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, COHACC, 1); /* IO coherent */
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ASID16, 1); /* 16-bit ASID */
+    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, VMID16, 1); /* 16-bit VMID */
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TTENDIAN, 2); /* little endian */
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, STALL_MODEL, 1); /* No stall */
     /* terminated transaction will always be aborted/error returned */
@@ -388,6 +389,14 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
         return 0;
     }
 
+    if (STAGE2_SUPPORTED(s->features)) {
+        /* VMID is considered even if s2 is disabled. */
+        cfg->s2cfg.vmid = STE_S2VMID(ste);
+    } else {
+        /* Default to -1 */
+        cfg->s2cfg.vmid = -1;
+    }
+
     if (STAGE2_SUPPORTED(s->features) && STE_CFG_S2_ENABLED(config)) {
         cfg->stage = 2;
 
-- 
2.39.1.519.gcb327c4b5f-goog


