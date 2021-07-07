Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8444C3BE027
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:19:16 +0200 (CEST)
Received: from localhost ([::1]:47446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0vHX-0005Mr-K4
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0v34-0001zc-Sx
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 20:04:19 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:46981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0v33-0007hu-1D
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 20:04:18 -0400
Received: by mail-pl1-x630.google.com with SMTP id c15so54936pls.13
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 17:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h2GXo4/I1qpQYWxXnO2E3m36oiXDc7gmTMZzvOsRVYY=;
 b=IgQlk1SN63EAXu034dT/JnJI7z9Y6nGK5cauhggRX6JIeLuoIX/9aNI1JDrC/eZKuV
 0XVX9J5pq3cRn3e9tm/fflnSPXeTHPcFF57qKsFyVLF1AwJ3cQbCvdNM/HcOdAKSzZD/
 euFN9sJLI07CZfQ8PNiwsowZgYEdV8mipyvjreNlG9/96bZZfI01Ht3aqsZ44X7LikgX
 PSjKttgNSs+hNi2wQpYc7hM72PsV0BwLSgeZbxzV/xSSzIXGrj/YKNs7zKJNIu4nhiNi
 IMJftDQ9kI0mNU5eWf+y/Nnu+aGrtc19zZtImFdzGwHVRnAdGImnCoMlSa8xIDyNSq9b
 VTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h2GXo4/I1qpQYWxXnO2E3m36oiXDc7gmTMZzvOsRVYY=;
 b=PPHdtMs5sQ9sT+pUQKmHfE3vd5+xInZkpfyAELxhEkCX5bGi4cMY4gBw62DBEmuxAZ
 P6jL9vfccvapMw9wRWO2djFvp/rjyIPf49zLUzXlaJCdvA9LYnLcrZ6vAD6dum7MQkR+
 fXVRfV6rtlbnEjdOWldMSHrhF3xuBKMYHOWijwn2Uicb34GVQ6MmwZKNsFG3ueg3nstB
 DUYMAYLUeYWpdTpZP5gRx9kKTLRR0Fl/eyo2W21BvYSLbUlT4pDHW200XpaRVNYNNtgs
 LjSNo/zasi2vFTQMfX0WGOBVOtJcnb/cFP/nLEb/6WdLiQyFZhDqD7KpnZl9R+vrTtza
 oLxA==
X-Gm-Message-State: AOAM533l+UmSUi7d5cDZtH+bSm9NBtuaM7kl+MrQlk0KLVGbQet69c+E
 mO6m5QdNiVlAhb63zB+dsfSJOfZboSFiQw==
X-Google-Smtp-Source: ABdhPJz13iYNPTlId9W9e49M9uz4H6nMDS1rvl3Gamh2MTiTjQkAVYMLAm8R/yqgYkhzAR9ok/i2Ww==
X-Received: by 2002:a17:90a:6903:: with SMTP id
 r3mr7497647pjj.105.1625616255311; 
 Tue, 06 Jul 2021 17:04:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w14sm15864109pjb.3.2021.07.06.17.04.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 17:04:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Add separator in INDEX_op_call dump
Date: Tue,  6 Jul 2021 17:04:14 -0700
Message-Id: <20210707000414.358112-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We lost the ',' following the called function name.

Fixes: 3e92aa34434
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5150ed700e..4dd4084419 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1849,7 +1849,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
                 col += qemu_log("plugin(%p)", func);
             }
 
-            col += qemu_log("$0x%x,$%d", info->flags, nb_oargs);
+            col += qemu_log(",$0x%x,$%d", info->flags, nb_oargs);
             for (i = 0; i < nb_oargs; i++) {
                 col += qemu_log(",%s", tcg_get_arg_str(s, buf, sizeof(buf),
                                                        op->args[i]));
-- 
2.25.1


