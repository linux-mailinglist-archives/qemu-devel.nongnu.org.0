Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0EF376774
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 17:02:18 +0200 (CEST)
Received: from localhost ([::1]:48730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1zd-00088P-AG
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 11:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1iJ-0007yd-G6
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1iE-0000tI-Hk
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B3vDcPc2Lwo5z0s8ItWutJUQDssHj4SCpM1PcCRAn5U=;
 b=aJNLB13UeAwzpZ0nkWLiX9eixamiE4ZiKKYiOSiNhL3RBqxcE/sQ320Lp7PoGlaK7BFf/M
 gC5yz9iupfmhJOo9KoRSU/n8+eU9LU0vFhdpymfk/CUxanJoCkc2Hox1MG8/cktxHmUgQO
 wh+hu9saFFSETjUDt7SKJDAOMR1M1GA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-7hT27Y75N6-4D4CFmiM-bg-1; Fri, 07 May 2021 10:44:16 -0400
X-MC-Unique: 7hT27Y75N6-4D4CFmiM-bg-1
Received: by mail-wm1-f72.google.com with SMTP id
 b16-20020a7bc2500000b029014587f5376dso3125481wmj.1
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B3vDcPc2Lwo5z0s8ItWutJUQDssHj4SCpM1PcCRAn5U=;
 b=qKgR0dYpzGORczra6Ew35Bm5GcCciFWwr6mN6gvCxtD7iIpOGEhgegLguBrMj3fBWX
 J3wi68qXYBp1dhnVzLi9yhm0trLxIOKaxmQCpRXdTdMbQBf7Po1erzw2qiMPykyZnd7L
 Bej+g2ViQQ83cMl1Ap0GjuMF11xjOS/tlM6izlSKsl4oG8kaAegCO1sYS075t8d9qxy9
 UqBpbshrKDSMCQ2E6YFQ1MKmMqTGeS6uL8Ed+T/YIHeoJZ8csBfIbUDEAJQj3JjRSb6g
 9+qgygB0vmhn9hrRzuZaoSjuv8bkbYPx2ebP7wf8EkdbDy/aHdtMs8FMGMvlqAdSIg26
 WbXA==
X-Gm-Message-State: AOAM531TiSSqRFRGng84QFOP26ln8zEyFM2a9qJtgdtkjXou6+ufZwfj
 EDV4p9HQDBSZqqP/0plkqatrhM0jnz233+k3aDAlYq+3fsk/DDc3wXIel6LGmnfmtEOAd9CgzdH
 aTHOrx7F94+Vjlh00SzlNc+2c557MMZ49GPr9WCvwiBcOqskDvpr9l3OlDZ+3CPHu
X-Received: by 2002:a7b:cc15:: with SMTP id f21mr21011239wmh.86.1620398655152; 
 Fri, 07 May 2021 07:44:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzepcSCNHFzx7Vk1l7Yecw5eu3JmKlqle2NYs72V/81IbdrlCspu8WvBmn62kYIs0w4K4g+cA==
X-Received: by 2002:a7b:cc15:: with SMTP id f21mr21011214wmh.86.1620398654950; 
 Fri, 07 May 2021 07:44:14 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id r5sm7924795wmh.23.2021.05.07.07.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:44:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/17] gdbstub: Constify GdbCmdParseEntry
Date: Fri,  7 May 2021 16:43:10 +0200
Message-Id: <20210507144315.1994337-13-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 gdbstub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 9103ffc9028..83d47c67325 100644
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
2.26.3


