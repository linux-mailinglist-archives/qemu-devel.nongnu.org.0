Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9BE5E6AE6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:28:37 +0200 (CEST)
Received: from localhost ([::1]:60784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQw8-00062Q-H2
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBG-0002Dc-J0
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:10 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB8-0005RV-Nr
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:02 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t14so16402957wrx.8
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=ceS53dBC44zXtToPxcVfNPKGDYvq9xpEKY2mO0aTDyM=;
 b=sZ54Rn3RUNXs1jYBeLTnqj6bRjbb+6Ic31Ug/F5+PBP8+IY9a9d029FSzRrVDvz/OK
 VqfCc3pu14Z0wJIjTGgZ3WJSLJc+7xRHCK5JktdGG381x9Rru2TUIHelPEf41Mlsi3Zy
 BwuhDl3BNHlreW+qTRSyrZGS5KQ8BRzhQRcEBc5qDwlY3S8w2qkNf2eDCdeHNnw3kNYy
 HiGyvEKwoOCtvePDnlgM5t98CMHgu51NP0mdsDOUZG1f2jwjN8Xi2O6jo2Ed7MzqsVrD
 bqF248Hx/WHTPTmY3gekem8q6hP5/SNlb/jpwdy9ISJ/Z/gqV/O6978CAWLK6JbYsygQ
 TDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ceS53dBC44zXtToPxcVfNPKGDYvq9xpEKY2mO0aTDyM=;
 b=6jm3gVBj0TxTPYr4RU+uvbhQGIl49NZjROubd2G6CT6nj/fRSht6jML3on6Q1nhSp0
 KgMlMz+UdsOmPjLILPUCrn6w5W9ZDmB6jA2AVltv2o8iV38eZz42IQpyrbv3M6lH0T3U
 NG7EVQ6co1pI5BGED9+7WWdWyqyXCVmIJYD/RUJEyfzTI0zA/navlTFrnQYD0NpBGP95
 uh0VWw1xHEmR53NlAsDUi+iSMK6Xoas1DH5qb2Nd+GNTeWXf/KtQeDbk045edVsEF3Bt
 gdLKGx6Vi/TVUDyk8eLef1H3fVTZa1K/o1julmkIFkdOD1tKGLfWN6Pdtt5zEMMFGtHc
 GguA==
X-Gm-Message-State: ACrzQf1lAxa7jyRZcRqxWLbeKnmC2Df1BXf7SCquxnafYxoerZK6FZF9
 j22ZEwYWFFF0KVHWsC1UjnjDbIjrHUZvKw==
X-Google-Smtp-Source: AMsMyM4UQU4R7Qwdbp9zdtzTL+qCUnMXN/fpTILWDE4UWExnXI6JP2EsiSGsmhpADh2q2WCPQPK5+Q==
X-Received: by 2002:a5d:5b19:0:b0:22b:237c:3de8 with SMTP id
 bx25-20020a5d5b19000000b0022b237c3de8mr2542401wrb.285.1663864553008; 
 Thu, 22 Sep 2022 09:35:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/39] chardev/baum: Replace magic values by X_MAX / Y_MAX
 definitions
Date: Thu, 22 Sep 2022 17:35:19 +0100
Message-Id: <20220922163536.1096175-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Replace '84' magic value by the X_MAX definition, and '1' by Y_MAX.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220819153931.3147384-2-peter.maydell@linaro.org
---
 chardev/baum.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/chardev/baum.c b/chardev/baum.c
index 79d618e3504..6d538808a0f 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -87,6 +87,9 @@
 
 #define BUF_SIZE 256
 
+#define X_MAX   84
+#define Y_MAX   1
+
 struct BaumChardev {
     Chardev parent;
 
@@ -244,11 +247,11 @@ static int baum_deferred_init(BaumChardev *baum)
         brlapi_perror("baum: brlapi__getDisplaySize");
         return 0;
     }
-    if (baum->y > 1) {
-        baum->y = 1;
+    if (baum->y > Y_MAX) {
+        baum->y = Y_MAX;
     }
-    if (baum->x > 84) {
-        baum->x = 84;
+    if (baum->x > X_MAX) {
+        baum->x = X_MAX;
     }
 
     con = qemu_console_lookup_by_index(0);
-- 
2.25.1


