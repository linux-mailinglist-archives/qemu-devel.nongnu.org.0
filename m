Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3D554DED6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:24:41 +0200 (CEST)
Received: from localhost ([::1]:41418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mg4-0002Z7-Rq
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mcA-0006tQ-Uv
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:40 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:36464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mc7-0000Vd-B4
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:38 -0400
Received: by mail-lj1-x232.google.com with SMTP id h23so990848ljl.3
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lUdRuVSrMtGHmkbRHa9MrI5I5UiON+MjCIoGMZGrKdw=;
 b=gpM64A8e5Csd2v8jCnvKoGx/43qY3q0OrImguqL0gqa6SqrUwJuVdo+QIKnRpYIYX9
 wpKCOeRzBMb4omyvoU5BPUbGqfjXJ4dyQeejuOQQu29taZyQ0AuMyNhNUc2/WRli3zNL
 TWQTUG8ORjdDh3cXbcjSZdp0VByyhGv1129/0DdG1dhnR0JLKui5uTeufN2t5GnkYopb
 wTHl1thJwx225SQPUZq9npUuH2Zh7w65Ousv90gQ/V8iI+fV+3SRcMY2fXXEMAC8LDB/
 9g9etqcWRC2z0ceUJ3v2GmiCYYJsLWh32wNBkKwdKSYsn/Ttzw1KTMgpRR6di6PS26NM
 CQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lUdRuVSrMtGHmkbRHa9MrI5I5UiON+MjCIoGMZGrKdw=;
 b=LjZ1Myexr8he4vN1fegiHy8gHKzryNToT9aQSt/MHFhe3GYWpmbjDhvCLcAnBf2OI7
 aP9c5SWRGOB3GZUp3BeQDllVo+5AKMKXCKm1ka7agGXL5Np4TYgc0u4pI2CacLOS8ZZJ
 qs9+nYi/E3VqSx3spPpXFrHDB/G9ztsHoih0l4n7UigW8dY3jkJ+JPtD7UJO9mgIYWaJ
 6BDKc0wpcKHOC3h/RJyFQoteg8ByeNRQK7ShDfNQe75lBxGVaACasK2DxL7kSzt8gW0d
 PcDaiSf2yN/iqSYObMixtYcQidhReCuWNS1XA6dt/jHTYMN5MbakRej2qonIlkMDEquE
 M1pw==
X-Gm-Message-State: AJIora9LgxkAggUy7gXi+7DnPLAAzTqx4+XJzQhlPMCMljR5an204Cv+
 Esk787H3iZ4IIDAJaugTib9t21ilhdobh7pn
X-Google-Smtp-Source: AGRyM1u1G+xK70+beRmkuHo0LKIMS9fdIDCpTBAWGqltKtMTl/CJ5nX8mcSMXVKWulRoaxRhZ6mh4g==
X-Received: by 2002:a2e:bf12:0:b0:25a:45d7:4b95 with SMTP id
 c18-20020a2ebf12000000b0025a45d74b95mr2138493ljr.394.1655374833556; 
 Thu, 16 Jun 2022 03:20:33 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05651232b100b0047255d21166sm179014lfe.149.2022.06.16.03.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:20:33 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH 4/8] migration: Add dirty-bitmaps part of migration stream
Date: Thu, 16 Jun 2022 13:20:01 +0300
Message-Id: <20220616102006.218693-6-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102006.218693-1-nikita.lapshin@openvz.org>
References: <20220616102006.218693-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Nikita Lapshin <nikita.lapshin@openvz.org>

This patch enables and disable dirty-bitmaps in migration stream.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 migration/migration.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index bbf9b6aad1..ad789915ce 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1337,7 +1337,8 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
 static bool check_stream_parts(strList *stream_list)
 {
     for (; stream_list; stream_list = stream_list->next) {
-        if (!strcmp(stream_list->value, "vmstate")) {
+        if (!strcmp(stream_list->value, "vmstate") ||
+            !strcmp(stream_list->value, "dirty-bitmaps")) {
             continue;
         }
 
@@ -2501,7 +2502,8 @@ bool migrate_dirty_bitmaps(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_DIRTY_BITMAPS];
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_DIRTY_BITMAPS] ||
+           migrate_find_stream_content("dirty-bitmaps");
 }
 
 bool migrate_ignore_shared(void)
-- 
2.31.1


