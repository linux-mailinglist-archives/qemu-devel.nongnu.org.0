Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A83C5AF075
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 18:33:55 +0200 (CEST)
Received: from localhost ([::1]:38856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVbWK-0002yl-Om
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 12:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <37nUXYwcKClcK3CIJG35DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--venture.bounces.google.com>)
 id 1oVbUI-0000gg-2w
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 12:31:46 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:51960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <37nUXYwcKClcK3CIJG35DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--venture.bounces.google.com>)
 id 1oVbUG-0000BJ-Kn
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 12:31:45 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 d82-20020a25e655000000b006a8fc4506c0so4928069ybh.18
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 09:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=6MMXGy+7e2v2igEmsRuU7vnBISkediRNB4t43cObNys=;
 b=sPFHxNqW32NSssCY1FJBr/NnQkkSPl4PAzNlRuLBvOwr8Dr76vKloQThfIVEX3+g0d
 FPdJTAIioIkQoUYfkTpKUMqUCnnTmHXh4JQHmLWeEg0BIcE2c9dYFi8He7laNvDU7lbv
 KrQvCP0N/9r0jHGzv7a07LxrXqvPuQL9S5BQTTWruY8170CHqnG1dXUxCq5Fz3ml/+ej
 Jin2v+wIALrNOiM/rGgt3wuKXzaqLSQFhWrMsGmpWGDN+JAUC0XsMnlt4pUBRTNGcAOW
 fmL+6ia+HLiVqfRDFfM5FjQfNaDlNz8kcyQIk/yrJ/t6lhBYjIrj8fvpAPYLzBYIHQef
 t58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=6MMXGy+7e2v2igEmsRuU7vnBISkediRNB4t43cObNys=;
 b=xu6Y4BBtr0McK/bxclU2morOsvnBWEXJ/AdF0Je6PKP21Ipj8GBAY6fGlXVPW3a1IJ
 ff1Z/tmy1JXCghk61MONGBJTj+R022drt8KpJmt4z0lhkIBpBNLQj/DVxzKnjnUNh5GR
 OzpjYtdli0+wWtFZZH5PhqQ0MYBOfmrp0IXjwlTKX2+zX2HpUE4r3ch9g21LIrf0xHEL
 WImKAGrnePfeNQ5yTwkF8MAZ1FM6jIMKK8/3vE21xgpnOs6vqT13Y3Pucp+fo5cfWKBh
 SKNZMxrJSdaIgjYgPC+Y5aSZ80YyaWB7RCROGRxGNyluNZVGdxiE0BgKzKgYT1hQJ01D
 F6GA==
X-Gm-Message-State: ACgBeo0q3sKOmKHudIZTkPpyuJ2qZnSIQ6bDU8LLfxXfUOd9xnrxs0qT
 SkQky3NuxsW6z321PXU7bvRzRH8SA6Vw
X-Google-Smtp-Source: AA6agR7+KLDG/4bWIm9YdyNK6092yFCW/TeeRd2ghyVnNq30UOeb95srAdveN0WZvPlYZW3viUVU6MEusgCg
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:201:ab71:9b48:417a:4d3b])
 (user=venture job=sendgmr) by 2002:a25:4253:0:b0:6a8:f31d:d28d with SMTP id
 p80-20020a254253000000b006a8f31dd28dmr10263515yba.38.1662481902535; Tue, 06
 Sep 2022 09:31:42 -0700 (PDT)
Date: Tue,  6 Sep 2022 09:31:38 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220906163138.2831353-1-venture@google.com>
Subject: [PATCH] tests/qtest: npcm7xx-emc-test: Skip checking MAC
From: Patrick Venture <venture@google.com>
To: thuth@redhat.com, lvivier@redhat.com
Cc: hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Patrick Venture <venture@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=37nUXYwcKClcK3CIJG35DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The register tests walks all the registers to verify they are initially
0 when appropriate.  However, if the MAC address is set in the register
  space, this should not be checked against 0.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Change-Id: I02426e39bdab33ceedd42c49d233e8680d4ec058
Signed-off-by: Patrick Venture <venture@google.com>
---
 tests/qtest/npcm7xx_emc-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.c
index 7c435ac915..207d8515b7 100644
--- a/tests/qtest/npcm7xx_emc-test.c
+++ b/tests/qtest/npcm7xx_emc-test.c
@@ -378,7 +378,8 @@ static void test_init(gconstpointer test_data)
 
 #undef CHECK_REG
 
-    for (i = 0; i < NUM_CAMML_REGS; ++i) {
+    /* Skip over the MAC address registers, which is BASE+0 */
+    for (i = 1; i < NUM_CAMML_REGS; ++i) {
         g_assert_cmpuint(emc_read(qts, mod, REG_CAMM_BASE + i * 2), ==,
                          0);
         g_assert_cmpuint(emc_read(qts, mod, REG_CAML_BASE + i * 2), ==,
-- 
2.37.2.789.g6183377224-goog


