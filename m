Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9C638FFF0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:28:52 +0200 (CEST)
Received: from localhost ([::1]:56138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llVEx-000278-OR
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llVAy-0002Lq-IB
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:24:44 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llVAu-0002wn-Ge
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:24:44 -0400
Received: by mail-wr1-x42a.google.com with SMTP id n4so5889605wrw.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 04:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RZapSc4OUiaXGNAz1GT+1De7yOIQCE53gQRLaCIox2s=;
 b=pZV65ycuIphfk3II1tfPbyrcCR/J/s1ui3dDGMAa5avCxcHy5R72g8l1Kk/viXprBW
 BCe12lJHP8lhpzdtiH3nCjPeZVzTHK+KglQ6zW6wvzlxY9gyFAg1rOLoNG1meuSmKbEA
 e/1rp/otMa4CtiIBEngGJ57uk9ce5zXc+4KEDACmOmb+6jtwE6Ob/jASs5t2goP5BuM+
 34rNokYvjCcGWyQAh1RKh1GbJmK4hKovRNn0aFBRhVZ+ilgKFvgguz0NhikxGSwsLujH
 efU9zvfEQUxV5wtx8jxiLPCMHclBMZNXynyDCB8M0T2OAgGzKqh3VU03xhGVSFqk/H1Z
 KTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RZapSc4OUiaXGNAz1GT+1De7yOIQCE53gQRLaCIox2s=;
 b=Hn7U3o8tw/UtwCUsAqwbyxG/i0A7wR+YNpcEyVxzMLohgtIbeJfuf6V8B6d5izwMk0
 2IRcrCc6SswKachb14NyaLmXGykoIW59deq52Me3ZDixe+BaB3tPOpI593j/m+kHKf3K
 AmtcT9azkwOJNMauc5DtASpCu4rSw1mkYCPzWDBanDS9SMTbMA/3Kc4Rfqb8VSGcs7Bk
 KLDu1hr9KQ9GPy92mNwV7N3Yx6hvVEwPZyl8IQnax9N8EwtcmbH7LZDXt6kUJpCpex0A
 Y9m2OtE+Odeh0Snp7ECSgHLUa24Ui6WDPo4YujLlJad8Wd2QFnTE7cCYSJ8hCD6hwGMt
 mkLQ==
X-Gm-Message-State: AOAM532kw5Tfgrhs70YpzoEqxoZtekHG5J0eRZKWnNrv6mf2kYWfI2V0
 TNZeCRfc4562PgvBln+Skeb5lHl7KRnCcA==
X-Google-Smtp-Source: ABdhPJzjAmP6Thu4UVuRw5v55S5A45OYyqp18OnKui5Iv8l/HvgU3RnVDlG32+kP5cJTeDE4mXW8oQ==
X-Received: by 2002:adf:d1e1:: with SMTP id g1mr27256837wrd.401.1621941878292; 
 Tue, 25 May 2021 04:24:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n13sm16270734wrg.75.2021.05.25.04.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 04:24:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 079F21FF8F;
 Tue, 25 May 2021 12:24:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 3/7] gdbstub: Constify GdbCmdParseEntry
Date: Tue, 25 May 2021 12:24:27 +0100
Message-Id: <20210525112431.22005-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525112431.22005-1-alex.bennee@linaro.org>
References: <20210525112431.22005-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210505170055.1415360-3-philmd@redhat.com>
Message-Id: <20210520174303.12310-5-alex.bennee@linaro.org>

diff --git a/gdbstub.c b/gdbstub.c
index 9103ffc902..83d47c6732 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1981,7 +1981,7 @@ static void handle_v_kill(GdbCmdContext *gdb_ctx, void *user_ctx)
     exit(0);
 }
 
-static GdbCmdParseEntry gdb_v_commands_table[] = {
+static const GdbCmdParseEntry gdb_v_commands_table[] = {
     /* Order is important if has same prefix */
     {
         .handler = handle_v_cont_query,
@@ -2324,7 +2324,7 @@ static void handle_set_qemu_phy_mem_mode(GdbCmdContext *gdb_ctx, void *user_ctx)
 }
 #endif
 
-static GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
+static const GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
     /* Order is important if has same prefix */
     {
         .handler = handle_query_qemu_sstepbits,
@@ -2342,7 +2342,7 @@ static GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
     },
 };
 
-static GdbCmdParseEntry gdb_gen_query_table[] = {
+static const GdbCmdParseEntry gdb_gen_query_table[] = {
     {
         .handler = handle_query_curr_tid,
         .cmd = "C",
@@ -2420,7 +2420,7 @@ static GdbCmdParseEntry gdb_gen_query_table[] = {
 #endif
 };
 
-static GdbCmdParseEntry gdb_gen_set_table[] = {
+static const GdbCmdParseEntry gdb_gen_set_table[] = {
     /* Order is important if has same prefix */
     {
         .handler = handle_set_qemu_sstep,
-- 
2.20.1


