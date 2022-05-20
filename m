Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D286252F20F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:08:05 +0200 (CEST)
Received: from localhost ([::1]:37364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns72h-0004JL-LX
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wW-0003o1-Bp; Fri, 20 May 2022 14:01:40 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wU-0004FL-IN; Fri, 20 May 2022 14:01:39 -0400
Received: by mail-ej1-x633.google.com with SMTP id jx22so3546763ejb.12;
 Fri, 20 May 2022 11:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WuOiQ2vcTETClbMc2XlIIc/4ePmzXGMTxL5W/8IV79c=;
 b=h3QSCAApZbYbktnQmv+Tgw6NjOB+og9pBmE99u9OJ11n4RndA9hZTC2BzFKY69NAHC
 f8ju5NxfKquBpcVZAS2jSC32bgs6a39uxKEcUivweTXGXBcdeilRfknfy3wEkbNPJ4i2
 3ThVew+maAqN1dtLk2oxgjv2VztCIa9e3jx3ggw7g22FWrFz0TSkpIm9tG0NqPrG+IPt
 VRf1YUReZHPfHNTNfwEYui0ntASuaNXfCWTHIwA8KCzST7xPDyAfkYvPRho5BhW+K1Ot
 qdQ/WER6Hi4xuFPtNTNP5Y5gAp7Sip33cHVqtTJu9bx4u+8cf/1IWsBS27no5oJgV6eg
 PxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WuOiQ2vcTETClbMc2XlIIc/4ePmzXGMTxL5W/8IV79c=;
 b=0YCY9hJbqRJSEww26Kncp/bZGn9SzgAi8fO3Ha8R+y/owQOPbgTj/LVZKhf4usIijN
 UpCCihyRDzMMGDdcfYBKw2fJcMaa+SLYTPP2FhCOm5VzPin5z0FuMMgZ2JrYZkntoYAB
 H7KyYxtGGDRNzvVOxPb8EnEJKKvhjS4/1JvL+HA3DzEulW2DrIfkwQb3tBparpRA9Z35
 W0rMNefH3DoXnLIuunhc35TIC9FAlkSEf+ZLKvYQxb/8xjjxc/IgCy+TLPJKmr22LBBD
 tvtuFJXPwYVsqbfHZDKKTyUBlLeT2f88NFB8tmewlOLNaUeBlXo17q1ZF+hZDkGzbCbR
 HupA==
X-Gm-Message-State: AOAM532d7m9ghYEWSBMZmdkrS4XP1UQVXJfyoxqXyrgH7K+QQs4AOeeF
 D0ljAsgndSxfU9qIrF4ZZCBrQvLCriU=
X-Google-Smtp-Source: ABdhPJx507p8y+0w+lF08x+eJCgbJOJHX9mBvW9kCERe9Lzh3/+QrgMSZSQybSVzES8aa8avLvLHuQ==
X-Received: by 2002:a17:906:6d91:b0:6f4:5433:72f5 with SMTP id
 h17-20020a1709066d9100b006f4543372f5mr9522912ejt.414.1653069696757; 
 Fri, 20 May 2022 11:01:36 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-209-236.89.14.pool.telefonica.de. [89.14.209.236])
 by smtp.gmail.com with ESMTPSA id
 w5-20020aa7cb45000000b0042aa7e0f892sm4622029edt.15.2022.05.20.11.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 11:01:36 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 02/10] hw/audio/cs4231a: Const'ify global tables
Date: Fri, 20 May 2022 20:01:01 +0200
Message-Id: <20220520180109.8224-3-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520180109.8224-1-shentey@gmail.com>
References: <20220520180109.8224-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tables contain spcifically crafted constants for algorithms, so make
them immutable.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/audio/cs4231a.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/audio/cs4231a.c b/hw/audio/cs4231a.c
index 0723e39430..7f17a72a9c 100644
--- a/hw/audio/cs4231a.c
+++ b/hw/audio/cs4231a.c
@@ -84,7 +84,7 @@ struct CSState {
     int transferred;
     int aci_counter;
     SWVoiceOut *voice;
-    int16_t *tab;
+    const int16_t *tab;
 };
 
 #define MODE2 (1 << 6)
@@ -142,13 +142,13 @@ enum {
     Capture_Lower_Base_Count
 };
 
-static int freqs[2][8] = {
+static const int freqs[2][8] = {
     { 8000, 16000, 27420, 32000,    -1,    -1, 48000, 9000 },
     { 5510, 11025, 18900, 22050, 37800, 44100, 33075, 6620 }
 };
 
 /* Tables courtesy http://hazelware.luggle.com/tutorials/mulawcompression.html */
-static int16_t MuLawDecompressTable[256] =
+static const int16_t MuLawDecompressTable[256] =
 {
      -32124,-31100,-30076,-29052,-28028,-27004,-25980,-24956,
      -23932,-22908,-21884,-20860,-19836,-18812,-17788,-16764,
@@ -184,7 +184,7 @@ static int16_t MuLawDecompressTable[256] =
          56,    48,    40,    32,    24,    16,     8,     0
 };
 
-static int16_t ALawDecompressTable[256] =
+static const int16_t ALawDecompressTable[256] =
 {
      -5504, -5248, -6016, -5760, -4480, -4224, -4992, -4736,
      -7552, -7296, -8064, -7808, -6528, -6272, -7040, -6784,
-- 
2.36.1


