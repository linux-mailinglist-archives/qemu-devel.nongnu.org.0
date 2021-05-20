Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1E238B566
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:45:18 +0200 (CEST)
Received: from localhost ([::1]:46750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmjV-000615-Q0
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhV-0003J9-N0
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:13 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhT-000160-P3
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:13 -0400
Received: by mail-wm1-x32f.google.com with SMTP id o127so9683532wmo.4
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 10:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IIiaXXWvs7n+iPufxQMNc/1JVO6hJcCtlhG0IxEVHLs=;
 b=x6SurHdZGHF4s/ndxsgeItdovn9gVa7pgKZGQesAsOvMi81fO0OaBxQIGSRfhPg/Lt
 8uhIIvgzNUQqfPL9urti+p8LXJVI3vr3sF+dWuutFLXRBV+QUJbtaU2DEpJUoeUt7Zqb
 GrTMx9YAZ2g2KVjX5b6RD4XmzTTyGSERaWLf3qro7BJqkJw5+XHkaTKmbi8frArmoOJF
 hwsVX67PapkPRJKQRCdiPETDowHjqN8uM4t7sT8KoSzkYf4A5pALbi/muBqcfAPccAwG
 p/E+FDQXy5xOQgPelzGfrS8xOiWVUrNqGQhcyPOJPyqY3TO3fglVDAHhiM1OlTLfPHfw
 oppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IIiaXXWvs7n+iPufxQMNc/1JVO6hJcCtlhG0IxEVHLs=;
 b=PFCrFoLyK8Vrx0nmGEy1dH3StyVpsR1XF9QFZzNsTqw8EZ1ilYYio3T7KLdrwuiKpi
 y3ZeVWrY5KL4j8jXV6S60uCbtHmtZz24JvyBntC4pNzha4Mqn4xFTA+uW5U2UmfgFHDd
 g98GKMrne3KVxdIfpGkGtp2+jZzB4mBTDD3WnhFH7Kfh3aioUK2Vebbm06wjBYpZ1P/d
 A3md2LjM8dO92GBKDx39EdmiSp9u0HYUepb0hfSaXpB/8B51a6yPSoVHmMSH2tHyHreo
 pen2ePc7C6UNFC1pSGUh97ysHtmZHeinFrrzfE6J4Os+o2yDGVM4CG0uG39LgHDt/4LX
 BHIw==
X-Gm-Message-State: AOAM530q8NPoxKwyuEJs1pCdc0jGpvbc9xtzgJEJJN2ITiybg5W8p8D4
 EAMyZxxxXSIP4kg52VRiHzsRPQ==
X-Google-Smtp-Source: ABdhPJwykXVaXN2S09GVMg+E0J0cZBWNfdhj3wbvzexrs1ynQhFOHDrFECIIAuZYyMJL04yA12RFjA==
X-Received: by 2002:a05:600c:19c8:: with SMTP id
 u8mr5242353wmq.50.1621532590318; 
 Thu, 20 May 2021 10:43:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i15sm1554489wru.17.2021.05.20.10.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 10:43:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 102D51FF90;
 Thu, 20 May 2021 18:43:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 4/8] gdbstub: Constify GdbCmdParseEntry
Date: Thu, 20 May 2021 18:42:59 +0100
Message-Id: <20210520174303.12310-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520174303.12310-1-alex.bennee@linaro.org>
References: <20210520174303.12310-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210505170055.1415360-3-philmd@redhat.com>
---
 gdbstub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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


