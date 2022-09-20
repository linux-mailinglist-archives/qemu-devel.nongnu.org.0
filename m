Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6D75BF16E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:43:51 +0200 (CEST)
Received: from localhost ([::1]:56918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamu6-0004hx-IT
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8x-0001Sg-Sn; Tue, 20 Sep 2022 15:42:58 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:43693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8t-0001px-BG; Tue, 20 Sep 2022 15:42:54 -0400
Received: by mail-oi1-x22f.google.com with SMTP id t62so5074712oie.10;
 Tue, 20 Sep 2022 12:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=oNT0UKHr27Jw0ana50L26+pSnwgqDtjOIH2F40x+irg=;
 b=KRUxc7T0JbC2fSD0jLT3Y5KTHLIPlzrQ5mNcpuQJJgDttPR6Jlib8Cfw0HRZfveKfa
 yu1uRHEuyb1oNoc9obRulSQBOOIqtR7vV2VMFXXDA9HR74tuMk9AieH4RWjrRJZKtlN4
 v9PkrIKwAQS+n9C85468xiScq6z23P8NT9x+ITV8wsYd3RGleeI8QV/hM4ytOfdvFJQh
 OAtLR12trYFEnVD/N0k66Li2wp3G9xy53FB6bq2hiJnLO8SLZI6M/JC5yPVvMJs12+x2
 FV+8WdLurX6JWt1MEuevpMFBfy2Jv1jGggxyYT3ebMSEOjKzLxrsTHvLPR5nUXwhNkB0
 kWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=oNT0UKHr27Jw0ana50L26+pSnwgqDtjOIH2F40x+irg=;
 b=vlt3zcScji6iMeS5VSWjPvUer/ju1NFsSfqIy5UfNfrrZoqvEO2avzN144zLYgz3XB
 FMb+0bOgJU3n7PD0TJQf5URIlAjL5tNkdNH7wFgFG/8/PiSciQEFgtnJgOp6ZgpQD5g6
 oHm0htGEOZ2hGKy8pb6qvoeoaBGmiwG00eOY1shmNvgat6bCBk96qKlgO2SttLnH78dq
 YZxg5B+E/A+c3CrHoOqsM8ZjLLq6o4ktSq9686qEPCVzlA6Vh4UOvXxPIHkHecdm7FGW
 Z2BkQBAvDAWHR13CG9wpOkyOExvZHwy8oVfdP/B/CI4u0GzjbNZ6xO3h9SwRKL/DxB6g
 /njQ==
X-Gm-Message-State: ACrzQf2SEpStGELRxbI+nSHD6WphoI5Px6Ooml1RtgeX58oXxudKPI4s
 VUzmoLelVS6fa338icG0d1pGktZOZiQ=
X-Google-Smtp-Source: AMsMyM5KVN1FmEIJy9oLfu12rBwlhGh2YfrP9/MGfmQFAnld3k9lTizZ1VWWajRJiyZ5PV5zwGo+8g==
X-Received: by 2002:a05:6808:140d:b0:350:d77c:4e6d with SMTP id
 w13-20020a056808140d00b00350d77c4e6dmr1745902oiv.160.1663702964944; 
 Tue, 20 Sep 2022 12:42:44 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:44 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 13/17] target/ppc: Zero second doubleword of VSR registers for
 FPR insns
Date: Tue, 20 Sep 2022 16:41:58 -0300
Message-Id: <20220920194202.82615-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

FPR register are mapped to the first doubleword of the VSR registers.
Since PowerISA v3.1, the second doubleword of the target register
must be zeroed for FP instructions.

This patch does it by writting 0 to the second dw everytime the
first dw is being written using set_fpr.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220906125523.38765-8-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 29939bd923..e810842925 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6443,6 +6443,14 @@ static inline void get_fpr(TCGv_i64 dst, int regno)
 static inline void set_fpr(int regno, TCGv_i64 src)
 {
     tcg_gen_st_i64(src, cpu_env, fpr_offset(regno));
+    /*
+     * Before PowerISA v3.1 the result of doubleword 1 of the VSR
+     * corresponding to the target FPR was undefined. However,
+     * most (if not all) real hardware were setting the result to 0.
+     * Starting at ISA v3.1, the result for doubleword 1 is now defined
+     * to be 0.
+     */
+    tcg_gen_st_i64(tcg_constant_i64(0), cpu_env, vsr64_offset(regno, false));
 }
 
 static inline void get_avr64(TCGv_i64 dst, int regno, bool high)
-- 
2.37.3


