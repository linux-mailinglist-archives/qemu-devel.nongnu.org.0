Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE7D6F49FE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 20:58:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptvCF-00053g-IH; Tue, 02 May 2023 14:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1ptvCD-00052q-58
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:57:53 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1ptvCB-0002BS-L6
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:57:52 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3062db220a3so1767423f8f.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 11:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683053869; x=1685645869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XWQ/Z9BlPUubmldvNXKKW220gK42PZJS+hO6IM/QHuo=;
 b=hPf05h8ARyAkMITsL8o91UOAv2cXi1iHPKQpXrC41Cao96Zy1UnWm+nUuSw4n3i8NT
 JJEc8Y1BxYPQg3h0kULgoNFOES8Lv7BKm8r1AKRY+qVW38a2zNkhbKCozciHS+3uQym+
 iq8oXc0kK+PvepCL68bnrpeRLD/Uq2pU/AwoyejUtaQ23Any4hmCUvoZNAksJcAP4s1f
 Xb0Cd0epBxVsSEbAQYZ5c6xx1AYB2FXFcujkM/2gNKq6e1oZ2xpW98LwhkqHWdc7nvO7
 hTJLYXkR8Jbx/eZsvHfLQQbBqTZsU/GiFD0nWwC0C25sJaxjgZ98DbAcucaTypEXwLpS
 moPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683053869; x=1685645869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XWQ/Z9BlPUubmldvNXKKW220gK42PZJS+hO6IM/QHuo=;
 b=HahFAXhxnxtuMdn+HkveAlRtpNNdPv/SE+Zgy960tls3hnYkF7kBF6sretY4XllCXZ
 GIDVK7JNW6W3VrGwsmXNeNnx/HZ0AZNCl+zHUDBLfxX7X9vUuWcEVcijOXjkH8lwkmmx
 k9qp93c3dGhyCdINQU6aDnBweNQcj2JNIJuJog/CPk7NTilvly3g2IzOsn6EbvyzkWxt
 E4bclvH/347a3PjQahNc6OWqOwhskQgsn6TFbKSDxC3c4Yo5yN94lTz+Ytc7WLhspAcK
 MQ0lP5U6nCkbOI963qOZ8rGGJv0JD9C+aEqtyp7BIgUcoJIFntn1kb2IKzlfYSUp8LEw
 X/NQ==
X-Gm-Message-State: AC+VfDyIyEDC7QfTJ+EKCE1kOzy9QCNR77qneRqmLErBJQ3mqRYr+OIf
 HPgU00yMymL+lnta3ccSha09uCGGxzY=
X-Google-Smtp-Source: ACHHUZ5lhNppFFW3mrxRZ4Oz09TQIfOQGSIfePGoH7teb8eXrs1LQ0d4RmyrG/zLHGtpq4h3Jb9uUA==
X-Received: by 2002:a5d:634e:0:b0:2fa:6929:eb81 with SMTP id
 b14-20020a5d634e000000b002fa6929eb81mr14018614wrw.31.1683053868763; 
 Tue, 02 May 2023 11:57:48 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 m6-20020a5d6246000000b002feea065cc9sm31656202wrv.111.2023.05.02.11.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 11:57:48 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH 2/3] target/openrisc: Set PC to cpu state on FPU exception
Date: Tue,  2 May 2023 19:57:30 +0100
Message-Id: <20230502185731.3543420-3-shorne@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230502185731.3543420-1-shorne@gmail.com>
References: <20230502185731.3543420-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=shorne@gmail.com; helo=mail-wr1-x432.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Store the PC to ensure the correct value can be read in the exception
handler.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 target/openrisc/fpu_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/openrisc/fpu_helper.c b/target/openrisc/fpu_helper.c
index f9e34fa2cc..1feebb9ac7 100644
--- a/target/openrisc/fpu_helper.c
+++ b/target/openrisc/fpu_helper.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 #include "exception.h"
 #include "fpu/softfloat.h"
@@ -55,6 +56,9 @@ void HELPER(update_fpcsr)(CPUOpenRISCState *env)
         if (tmp) {
             env->fpcsr |= tmp;
             if (env->fpcsr & FPCSR_FPEE) {
+                CPUState *cs = env_cpu(env);
+
+                cpu_restore_state(cs, GETPC());
                 helper_exception(env, EXCP_FPE);
             }
         }
-- 
2.39.1


