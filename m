Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B074E52F21B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:10:56 +0200 (CEST)
Received: from localhost ([::1]:45384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns75T-0001HY-Qp
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wd-00040d-CP; Fri, 20 May 2022 14:01:47 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:34461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wb-0004IB-QW; Fri, 20 May 2022 14:01:47 -0400
Received: by mail-ej1-x62d.google.com with SMTP id n13so15109757ejv.1;
 Fri, 20 May 2022 11:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JDiYaKv05xlAnTCFF/GxQrTBnijEkAdSBVZLfqAvB1o=;
 b=n+ZlzKQO7XNgG420rQZwx3sT1jwTuwHFibrvRTYDlf6pUfwW8KTMShsayATJSvKYh6
 jqEWugbTEq73gaP1m0SE3pT1FDXSoTsAxZ/l51JO23DUiERotDj5GNXWrOcXLux93lIr
 XfnWsokK13zbQkUbZhRhBsnegq6qQALsBQND1RkeTzHdgpNaoCa+g+oeVndBa8X2cxPw
 BVr7KxJcvLlWDFLF5XeQZ/+/D0gzUEW0eaeX+tvXTcaD7///9gsTdbSlistS+izWO0w4
 ebUR0Qp1vMybmobGIGPuCXNI97i9fDTVobahD/V970sWXVr0ABaSV9nlOxRyB9lXyTyS
 KRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JDiYaKv05xlAnTCFF/GxQrTBnijEkAdSBVZLfqAvB1o=;
 b=yJY6fQik/jgHljI8JYbnweU/AiFNq5ynB88haCp+A+3p6hMEfykpcohj3zvdcSpvpK
 O2WwhUAOE+sPtRRTvo95wJqRSkpCekkumqZJk6iqKL5oPNV5tr/stgCIn/CKQ/45vCZM
 JzDQycqxj7pYo7VnUxckM7jS0d2o2ajRMoxRdjbuLbHdtIBoD4l1MSEkSfTgR2OpENlB
 VfuVxKij25xRpai8A0Y4BYflZpOi+3qjoA1t6Rq8PgFJ/KVuHMYd/1XCeNS+V1FW/iSk
 aAraA+nmalDMOcm1v2KMj0yy0lpiZMqgWBfSXP+6/bq1qKMYzm9LFS3LlE1z8iYARGkn
 4yFg==
X-Gm-Message-State: AOAM531Z3/8Az01c8WvNKrfQ4pqLKCLlTmOEgZjgTlAhim5/nFYrUpET
 Hw5zEspAANiFkaw3aqWl83FmWG2da0s=
X-Google-Smtp-Source: ABdhPJwfo3zc+GpKd8RILJ+KQpeOR+UBL5CUdyAeu17RKRGvVeMjMLZAhGPqpJjVBObg6FssxpSESA==
X-Received: by 2002:a17:907:9490:b0:6fa:7970:3eb8 with SMTP id
 dm16-20020a170907949000b006fa79703eb8mr10101795ejc.457.1653069704060; 
 Fri, 20 May 2022 11:01:44 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-209-236.89.14.pool.telefonica.de. [89.14.209.236])
 by smtp.gmail.com with ESMTPSA id
 w5-20020aa7cb45000000b0042aa7e0f892sm4622029edt.15.2022.05.20.11.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 11:01:43 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 08/10] accel/tcg/cpu-exec: Unexport dump_drift_info()
Date: Fri, 20 May 2022 20:01:07 +0200
Message-Id: <20220520180109.8224-9-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520180109.8224-1-shentey@gmail.com>
References: <20220520180109.8224-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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

Commit 3a841ab53f165910224dc4bebabf1a8f1d04200c 'qapi: introduce
x-query-jit QMP command' basically moved the only function using
dump_drift_info() to cpu-exec.c. Therefore, dump_drift_info() doesn't
need to be exported any longer.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 accel/tcg/cpu-exec.c   | 2 +-
 include/exec/cpu-all.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 635aeecc0a..7cbf9996b7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1048,7 +1048,7 @@ void tcg_exec_unrealizefn(CPUState *cpu)
 
 #ifndef CONFIG_USER_ONLY
 
-void dump_drift_info(GString *buf)
+static void dump_drift_info(GString *buf)
 {
     if (!icount_enabled()) {
         return;
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 5d5290deb5..9a716be80d 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -419,8 +419,6 @@ static inline bool tlb_hit(target_ulong tlb_addr, target_ulong addr)
 }
 
 #ifdef CONFIG_TCG
-/* accel/tcg/cpu-exec.c */
-void dump_drift_info(GString *buf);
 /* accel/tcg/translate-all.c */
 void dump_exec_info(GString *buf);
 void dump_opcount_info(GString *buf);
-- 
2.36.1


