Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8256A446F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:31:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeCR-0005Tx-IA; Mon, 27 Feb 2023 09:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCF-0004zz-6G
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:43 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCC-0000br-VX
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:42 -0500
Received: by mail-wr1-x433.google.com with SMTP id t15so6362265wrz.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yE2nb8UtCPTjefeNFrKNR+9dA7QDwYIIYJDcNWKRaRc=;
 b=Qxd6mSI8PfnxwEuSgz51RKkghZdjCBeZQC3wAM6N6dCpgZ0Ifu7kTaSVCnyvjTpusx
 BgqKFRfMoUNN+mHo0YnwBJ2cPZKBzQCtT0uOj9JSQKBc2blFI6RktQfM5gPLvTbsupOE
 JACB6iJo00APgbFDHcmPkm5Ddeh/50ivD5afXkl3xRAEcxLeLZuwy1WJCU24QkPUGTb/
 Tle9WUxuftYhofoQB5GB4iScN7IDj8mrtsoQXVARC1VkAZLOQ6NHi9IySBPG17qZAA6h
 4DrOtzM5Nxw/eb6tUCy/E5ZgU7+gN2hQGSkdwwa7Tcf3CnWkMeT3KeyKO90QCvq1/JlB
 c/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yE2nb8UtCPTjefeNFrKNR+9dA7QDwYIIYJDcNWKRaRc=;
 b=UCm/L5PUOfXTKhBKlU9N6VfIcl+cJvZiuJL136AYYnpnQh0OysBDCXMvtWpQFtO/3E
 qEHKnywJxAA+VXp1cXNXA+i+3qmKK/3BuVdNekWuWet1IUl8AHCipBSU+prJOjKopbf5
 oGWyu16qESe3lGikDhQc7WmcvdvDerNTU2QsQQisd4PlbALIcnp7d6X1nvjCX0fni9/1
 4rktMCbWprwp6vVqNNRh0Dy7I+scyx64C7qADZUWr0NEgmJk2kk1VUq9vGFHm1F0oACu
 HLTii5qjnIbQv/HdMIBvyVmpoxJbkGWvdHy6/98OJ61zrbUT8uik88gUWbEFUyL5dPbu
 Ju9Q==
X-Gm-Message-State: AO0yUKUqb0SpWbL3Ukghe4bCcgoRCSiQ29FGM+cghghRORYU+oiO79uV
 xTWY2/obenvT60U2rRoaqbeSjsIoOFYmx4b3
X-Google-Smtp-Source: AK7set8JcjeBlPfLepsMrxcnfMekcuFJOWryeIRwwS9ysKjMD7azv97JHS5ikTCpzosz0MjwBZdGzg==
X-Received: by 2002:adf:ea07:0:b0:2c7:420:5d52 with SMTP id
 q7-20020adfea07000000b002c704205d52mr18813200wrm.62.1677506979400; 
 Mon, 27 Feb 2023 06:09:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n7-20020adfe787000000b002c573778432sm7157810wrm.102.2023.02.27.06.09.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:09:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 091/126] hw/display/sm501: Implement more 2D raster operations
Date: Mon, 27 Feb 2023 15:01:38 +0100
Message-Id: <20230227140213.35084-82-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Add simple implementation for two raster operations that are used by
AmigaOS which fixes graphics problems in some programs using these.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reported-by: Rene Engel <ReneEngel80@emailn.de>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <17ef3c59dc7868f75034e9ebe21e2999c8f718d4.1677445307.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/sm501.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index bb53499dff..c4c567d977 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -754,7 +754,7 @@ static void sm501_2d_operation(SM501State *s)
         }
 
         if ((rop_mode && rop == 0x5) || (!rop_mode && rop == 0x55)) {
-            /* Invert dest, is there a way to do this with pixman? */
+            /* DSTINVERT, is there a way to do this with pixman? */
             unsigned int x, y, i;
             uint8_t *d = s->local_mem + dst_base;
 
@@ -764,6 +764,34 @@ static void sm501_2d_operation(SM501State *s)
                     stn_he_p(&d[i], bypp, ~ldn_he_p(&d[i], bypp));
                 }
             }
+        } else if (!rop_mode && rop == 0x99) {
+            /* DSxn, is there a way to do this with pixman? */
+            unsigned int x, y, i, j;
+            uint8_t *sp = s->local_mem + src_base;
+            uint8_t *d = s->local_mem + dst_base;
+
+            for (y = 0; y < height; y++) {
+                i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
+                j = (src_x + (src_y + y) * src_pitch) * bypp;
+                for (x = 0; x < width; x++, i += bypp, j += bypp) {
+                    stn_he_p(&d[i], bypp,
+                             ~(ldn_he_p(&sp[j], bypp) ^ ldn_he_p(&d[i], bypp)));
+                }
+            }
+        } else if (!rop_mode && rop == 0xee) {
+            /* SRCPAINT, is there a way to do this with pixman? */
+            unsigned int x, y, i, j;
+            uint8_t *sp = s->local_mem + src_base;
+            uint8_t *d = s->local_mem + dst_base;
+
+            for (y = 0; y < height; y++) {
+                i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
+                j = (src_x + (src_y + y) * src_pitch) * bypp;
+                for (x = 0; x < width; x++, i += bypp, j += bypp) {
+                    stn_he_p(&d[i], bypp,
+                             ldn_he_p(&sp[j], bypp) | ldn_he_p(&d[i], bypp));
+                }
+            }
         } else {
             /* Do copy src for unimplemented ops, better than unpainted area */
             if ((rop_mode && (rop != 0xc || rop2_source_is_pattern)) ||
-- 
2.38.1


