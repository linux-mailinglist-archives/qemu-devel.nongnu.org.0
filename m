Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FE74CEBB2
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:23:40 +0100 (CET)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqrL-0007ku-Ec
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:23:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqXL-0003lT-2j
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:59 -0500
Received: from [2a00:1450:4864:20::32a] (port=41801
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqXJ-0004Ke-LD
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:58 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so6901790wmf.0
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BF9gTXwWdI2zm0O5bncWqxr0u3MQeijHOpQIJ0UPc00=;
 b=bngAfwoMy3w8krdiSR/9mZmggxLgpzEh3Mtn8QAb8uDv1hPPtp/QpZdPzgLijgH3YF
 +6/GXHtE5pLptjTPpTu33WUvl5yCmkTZt3vq+MqrJIUW1DO5w2dfwS3m8ac29Dxsqmrr
 0P0Z85ZTOj7L9KZy4nMX+8YJhprx6K3cw+QcPxk660A5PEmQ1pYmIl91ioI6UuCGks7t
 usNxUDBg/2MIgNSx2mdTfo0Sn3k+s8HRPOK4s67JgAfz8vVx9/RT6wTcRjupbGUih3SU
 upU4r7CGIJpJU7OYSy2gg+PIiLPPTNK7wfCSlkTpDW7ir3KKHzLnhD1UPFeJqiY5/ktT
 L+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BF9gTXwWdI2zm0O5bncWqxr0u3MQeijHOpQIJ0UPc00=;
 b=dFYA84AlhKwHvNJbloiR4+/WH2JGZFARdSShY2Wl6tgGVjdaXpfN1WzT/6GbXAq9/I
 1X/wAvIUu/EAwuOCnJ3MwCVzDn/TxnSzE5tNYoY72j2ecikwBBNWHknxQ1udxUE43VuL
 QWU7uf2qCXMIe4sSiO/SppOTYlsry6LgdDWvRGsffCYng1mCxZAxw2urGqtUx3Qt8GPy
 kfIna4ICf6S+ravtL4UmInnc/KXnNyv/+G5ehEo6nWTJGOCiXxBI6TBbl99M5amNnNBI
 tkGM20PqtuKblHV2GW7CjIFTwCTwnDspoA5IT+2JjFms8U3rfLZJvyhtsjxA18ck76Vv
 Dznw==
X-Gm-Message-State: AOAM531miBe4O7/pM+WoncfujbXDBUL2ikdXQZMw8VzlzczmwRd5HQMi
 gK9ZmxgxWcIIc4n6ZnYZ3jJSa+gnf/M=
X-Google-Smtp-Source: ABdhPJzEnqCuazJUyOJAMmwAXzDSuEmUAG4eii588JCU47CwPoJLUY8TE3dhen73OGsU038CWgIgQQ==
X-Received: by 2002:a05:600c:154e:b0:381:81d1:8e78 with SMTP id
 f14-20020a05600c154e00b0038181d18e78mr15233336wmg.51.1646571776232; 
 Sun, 06 Mar 2022 05:02:56 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 c1-20020adfed81000000b001f058a92dd2sm8712005wro.104.2022.03.06.05.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:02:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/33] accel/tcg: Remove pointless CPUArchState casts
Date: Sun,  6 Mar 2022 14:00:00 +0100
Message-Id: <20220306130000.8104-34-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220305233415.64627-2-philippe.mathieu.daude@gmail.com>
---
 accel/tcg/cpu-exec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c68270f7945..c997c2e8e01 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -422,7 +422,7 @@ static void cpu_exec_exit(CPUState *cpu)
 
 void cpu_exec_step_atomic(CPUState *cpu)
 {
-    CPUArchState *env = (CPUArchState *)cpu->env_ptr;
+    CPUArchState *env = cpu->env_ptr;
     TranslationBlock *tb;
     target_ulong cs_base, pc;
     uint32_t flags, cflags;
@@ -532,7 +532,7 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
     struct tb_desc desc;
     uint32_t h;
 
-    desc.env = (CPUArchState *)cpu->env_ptr;
+    desc.env = cpu->env_ptr;
     desc.cs_base = cs_base;
     desc.flags = flags;
     desc.cflags = cflags;
-- 
2.35.1


