Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4812AFBE8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 02:25:16 +0100 (CET)
Received: from localhost ([::1]:42548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd1MQ-0002LB-Ma
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 20:25:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1kd1Io-0001ed-Ad; Wed, 11 Nov 2020 20:21:30 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1kd1Im-0007Wk-5Y; Wed, 11 Nov 2020 20:21:29 -0500
Received: by mail-pg1-x544.google.com with SMTP id f27so2762453pgl.1;
 Wed, 11 Nov 2020 17:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JpwcIrysbLjsACxFbnyuE/9/eng1Yy7chNIvz+3xUgo=;
 b=blqnVv8PeGz0slSiWYy/4hvXUo8np7ZPD8+aRdLqulsp8RjHlt2EDJSpdxy8euThrH
 Cik4oamlgtw2xTd/6q0Ja3oe3ZNkCYC9ZqLNX7AbPsXA+/+POPHXGiYPQLLOP8qt2DzZ
 Ve+1bsOG0mgyZHjDuag3/1qgxVn2wyM+HtqWYiot5DtZDsSnCZQBKHjc27dQrbEkGbV3
 zV24H6ant6GwtjtkMyo6+GfoJI5z8AWALXu+EOYBA7xvwgSDw4xtkuYjF4a61nsvvUrU
 w5LclabAtqCzqejmIlDNbHen77P3OqlvuekU8bW8+YUGpfRm/fRNIUvcuMUh6jh65aaB
 ie4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JpwcIrysbLjsACxFbnyuE/9/eng1Yy7chNIvz+3xUgo=;
 b=uP3Zo3XZicCXecpN4eT1G3SDNtVlOowhWzvRJJvMODPsVNtrkYZ2zXXSP4Nck2pi48
 VbzYeY0EwYD3F2s7URuFYNJz3J1b6e8CCzPySHqRzojtNYk88UHu0gpebS+VWiYfDyon
 K0pPogCkct8MFUKM64h1Cj7Gzrk/zUiK+H6P1m/2g5Yey7V9LF5wtAoecfvaf0tn3xwy
 FQZNP4gwSnyLc7PqaPS5dwIfhMCBx0Zhuyqyz22hmmhNd5ey1cHopK16K2NoGMeUskQh
 TnX4IOqB5gparAKAJOHEvMCuoRXMMCUUUNpzmOZUAd0oSGQ1IkoLmXlIDTRmXUAY4Nc6
 IMRw==
X-Gm-Message-State: AOAM532r84+iIsUlULFfgCacARAZcvEBg6CqDHqJ91HTdX5aQpHEHF4C
 JOHlVNeuOGRdxgPMXhTLvtk=
X-Google-Smtp-Source: ABdhPJy1Bejt6meJpkW+iFinddW+1n6iI0lKNjQehXsDibc593CKQBC9gV/RRoz/ZGhZMHZX+I2aow==
X-Received: by 2002:a63:1c21:: with SMTP id c33mr25583005pgc.161.1605144084076; 
 Wed, 11 Nov 2020 17:21:24 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id r15sm3712551pjp.51.2020.11.11.17.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 17:21:22 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] ast2600: SRAM is 89KB
Date: Thu, 12 Nov 2020 11:51:13 +1030
Message-Id: <20201112012113.835858-1-joel@jms.id.au>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On the AST2600A1, the SRAM size was increased to 89KB.

Fixes: 7582591ae745 ("aspeed: Support AST2600A1 silicon revision")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed_ast2600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 1450bde7cf26..12e4a16d3765 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -481,7 +481,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
     sc->name         = "ast2600-a1";
     sc->cpu_type     = ARM_CPU_TYPE_NAME("cortex-a7");
     sc->silicon_rev  = AST2600_A1_SILICON_REV;
-    sc->sram_size    = 0x10000;
+    sc->sram_size    = 0x16400;
     sc->spis_num     = 2;
     sc->ehcis_num    = 2;
     sc->wdts_num     = 4;
-- 
2.28.0


