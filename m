Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D915B86C2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 12:54:23 +0200 (CEST)
Received: from localhost ([::1]:50288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYQ29-0003d8-VQ
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 06:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oYPzj-00026s-7K
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 06:51:51 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oYPzi-0004vK-4w
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 06:51:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id k9so25110729wri.0
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adacore.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=3EixDPZiTh1cu5bzXVUfqmmOq21DRcvjlj7CM3XcdWs=;
 b=eq/knprLKEJigiTWJYlneRztqMEOjrQaE6sJ0l8yq1oFrdLMfN4PIVHeRoj4NK33hZ
 B/VvNdcI/GKxKibPY3Cpxj4KDQxfux0gIuLvN9P40DRYAHMLIVGjZnM++1wVgGdQvd4K
 YLDrsR/MW4fVfZf1kY5/YHb4PwM2QL9apOSW+J9wzflxKX/AfqbODw62XTJoD+N7GAdW
 BaDfBbrW7jMRYLVH0ENfhLAwy31L3CNjD7573DiX50nDFP0Bd8qkAretKD4l/8C5PVdc
 b8eH+G64EfWJyn5MXg4M4NBc1iAXpWvFFZzt4qwfdxMAouukvEl5bdRP3OAETxZ2qRzV
 c8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=3EixDPZiTh1cu5bzXVUfqmmOq21DRcvjlj7CM3XcdWs=;
 b=VX/cwaUMv75uu46XRkHiRK5HuXwBRu/8sOOlej4B8KFLg88syVsVx7Gw5gomKZ8KB3
 uIie2hagg64RLdb/vCeUBM1g80cExSKsnvDU5dGrNF9I9E0Y3tUSHVaU1y+P4T+QHk4w
 /qU14CCMt3GN2jnlcjNvPooJdhJ0viBOmFyo3SyyDea32D1s+o+dxzOczIWBus2WF3sB
 f7w7sEGYsBCe5aebJF1u4H/t5b7+3TdJvwxmGQVzjAH3IX8PH0jBTJ1YLqxF6VekIWvw
 +0njExfad/JI3pnlZQ3vKZr4R1fLWUYWI3o78XOjAi1gSFXo+oxbb95L3EqYoJXEUbja
 Y0hA==
X-Gm-Message-State: ACgBeo28CDaOKlChYpUnh/DMqLEnsewz3XvbVHY3nJbp2mwh3zMbbTjr
 x3OZ5+yJBot0SoB+DbhqVdnuvg==
X-Google-Smtp-Source: AA6agR6l5gfCrsjRaeBVob5fCxpRL11pErFFq1VYlFipolAOxx0kYVio26WVcaRGF2s4VSqU7uKfjQ==
X-Received: by 2002:adf:fbca:0:b0:225:2ac9:e306 with SMTP id
 d10-20020adffbca000000b002252ac9e306mr21490128wrs.259.1663152708074; 
 Wed, 14 Sep 2022 03:51:48 -0700 (PDT)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c4fd300b003b3180551c8sm17591567wmq.40.2022.09.14.03.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 03:51:47 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH] target/arm: Fix alignment for VLD4.32
Date: Wed, 14 Sep 2022 12:50:59 +0200
Message-Id: <20220914105058.2787404-1-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x430.google.com
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

When requested, the alignment for VLD4.32 is 8 and not 16.

See ARM documentation about VLD4 encoding:
    ebytes = 1 << UInt(size);
    if size == '10' then
        alignment = if a == '0' then 1 else 8;
    else
        alignment = if a == '0' then 1 else 4*ebytes;

Signed-off-by: Clément Chigot <chigot@adacore.com>
---
 target/arm/translate-neon.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 321c17e2c7..4016339d46 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -584,7 +584,11 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
         case 3:
             return false;
         case 4:
-            align = pow2_align(size + 2);
+            if (size == 2) {
+                align = pow2_align(3);
+            } else {
+                align = pow2_align(size + 2);
+            }
             break;
         default:
             g_assert_not_reached();
-- 
2.25.1


