Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4F3FAD83
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 19:54:05 +0200 (CEST)
Received: from localhost ([::1]:41796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKP0E-0003mU-KU
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 13:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mKOxy-0000s4-GJ; Sun, 29 Aug 2021 13:51:34 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:42857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mKOxx-0003MC-2C; Sun, 29 Aug 2021 13:51:34 -0400
Received: by mail-ej1-x62d.google.com with SMTP id mf2so26012516ejb.9;
 Sun, 29 Aug 2021 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gPKY92UF36c9b6Ocr4CKKSRHFmhWOyPRnJ6at1HKAzw=;
 b=J+rD5tk4L3hqHP5yNhfQpuChsQD+eslDqiODEMtT9fMDhX0GS3nqx/nyfuYDYTKbjG
 DU2b4hqQCc34ZFSpw7R7FwBoqfLnts54Q2IwpSMNCbW6xj/AfDaQFEWDWKi6ixLYjpXJ
 xZAIJnfxLKdGa9h9W0Ook96TVzIBBo6XBe9Wdr4Ofl4/MYJwYszvKBbiliC5VaTGUO8g
 jrCZaRVr8S4DL1kID+KwIfx6dv4h+xUt1Ct6C9V2F/1Xf9JeO184793gv9UPUpQaofRg
 xPbbo1lm5klBtyl0PJSzXGIUhxvxDkJBid4ksNeM6O0uxlNi3pvPf+cs4MKk4yu+fMeh
 y+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gPKY92UF36c9b6Ocr4CKKSRHFmhWOyPRnJ6at1HKAzw=;
 b=AQf4KGnVn2PKu+6CZ96tVLytUk6rH2Lv5IvPk+/hv+ekZ+vUnRY5pixuwGhP0P5h1N
 YUat+emQC3PPHlOIFffiNy8x/sSZNR1cGcOwHC57oNmtwxX61O4/R9jnEFle9xp4UgZL
 ldLfLKqQVQLKvd2yBabXS3qQSFOmWVMmONg/h4W1iz+ZfzpHqPnlOHBH5N9fN6YnaA8B
 STfxzaNnIQGCpDilNy2M9mSQ+adAVZ97fnaoWU1JS/xHZdtPUDkxUSh3wFnOTLEXTir5
 5d+tFI7ffsGIH7+jR2akKcr1F1Ddjqj2syaa8zf19aTZ+Nb8KfeIVX8DkSyv1CDc89HZ
 h6Sw==
X-Gm-Message-State: AOAM531P8yXlW/dq5yQLkkNZk3R+15EFQO29uJ+ed4iUiWQNGAPeNwFs
 cdOWTqos9YCx0+QIMJtypQ4=
X-Google-Smtp-Source: ABdhPJz+SVoI/zDommhCKZT99/5BLYsSYXlCtKAtwSXiprl2PPdFjIPX2kXwQq4PuXQ4v3Ma0VBpRw==
X-Received: by 2002:a17:906:8684:: with SMTP id
 g4mr20702454ejx.262.1630259491351; 
 Sun, 29 Aug 2021 10:51:31 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id e22sm6564361edu.35.2021.08.29.10.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 10:51:30 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Subject: [PATCH v10 1/7] [RISCV_PM] Add J-extension into RISC-V
Date: Sun, 29 Aug 2021 20:51:14 +0300
Message-Id: <20210829175120.19413-2-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210829175120.19413-1-space.monkey.delivers@gmail.com>
References: <20210829175120.19413-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: baturo.alexey@gmail.com, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, Bin Meng <bin.meng@windriver.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 space.monkey.delivers@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 kupokupokupopo@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00..451a1637a1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -68,6 +68,7 @@
 #define RVU RV('U')
 #define RVH RV('H')
 #define RVB RV('B')
+#define RVJ RV('J')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -292,6 +293,7 @@ struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_h;
+        bool ext_j;
         bool ext_v;
         bool ext_counters;
         bool ext_ifencei;
-- 
2.20.1


