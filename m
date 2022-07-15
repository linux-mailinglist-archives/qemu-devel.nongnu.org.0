Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CD65765A3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 19:05:29 +0200 (CEST)
Received: from localhost ([::1]:56874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCOkq-0004hY-5r
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 13:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oCOiU-0000bP-5p
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:03:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oCOiQ-0003ea-1g
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657904577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U1hBMVHisBrZHGpm8qv4V6Mxqwev3omPk0lBwMdbg9s=;
 b=cD3hjUadV7+F81i7lT08XF/hTG63eoGprbCC+ih9uiqHWJPI/dn/HQIPfSTxYdu5sPPswZ
 WKt7srtdgsPPgmxEx9pQ8ju8px6XRUtoGfvz80LlEug2o7H+/Lg9oTP/nZIRZxIn32e+vO
 qBr+MwQlKAJ+879dwgSM8NGWWJBsmmE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-hfdSvlUuN-Oi3XY9eQm9-A-1; Fri, 15 Jul 2022 13:02:55 -0400
X-MC-Unique: hfdSvlUuN-Oi3XY9eQm9-A-1
Received: by mail-ej1-f72.google.com with SMTP id
 sb15-20020a1709076d8f00b0072b692d938cso1693264ejc.10
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 10:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U1hBMVHisBrZHGpm8qv4V6Mxqwev3omPk0lBwMdbg9s=;
 b=PmLlENSI8Ch+aIPryZYeACLTuhc7Z5jcmZilTEDpWvoCEOP4+/L+JtyJF4POk4X1MN
 IMnwQDMF/kQprK3elaV0obvf2Kdh0n+mAhTXz4no8ljchaU6kvaQ9iVy0od0QpwkighY
 HK1QREo5OqwEvUw0WYBMbSA8zOE6yx9Epl0fvowjI6Cw2NbtGPqcc69BU2XmeLBK0oyY
 Aks6gdxN9lt4HWsMpaiZWMuReOHpJ4iiruz8zAVQkkKb9Cx5mwT/C89I6PBAK5e6nYy1
 dYDX5WwfGhn8cFYayw6hXQBfC0NRHe00kzAW2fezWGShWX3Zb6XrEbF5opKzo8h8xXsQ
 0+iw==
X-Gm-Message-State: AJIora9cZ8YEZBTdqb+gMOW3Bzw+XfZiU1P5crVqPnZ9l1872ygUNrKA
 6rdJMA1R2VRiYQk8cLXJ7GcOcr/OTfiYzJ3H/IZZZC5ic5QA8jjE+gU+4n2vjstHJrt+bQoe7Tn
 OJanmrwzHXjqqUKuHwF2kZBKAyD5AB1s3uSemHm2SgEIVoU6gmIUktGv3R5eHJssU1vA=
X-Received: by 2002:aa7:c392:0:b0:43b:1f5c:391f with SMTP id
 k18-20020aa7c392000000b0043b1f5c391fmr12051766edq.267.1657904574138; 
 Fri, 15 Jul 2022 10:02:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vHDRTns0Si5r5SymWLvR8FiQ7qGTHPUfJwgB2n2MizBl3szg0zi9Z4p9anZ8rgaB1YxxpHLQ==
X-Received: by 2002:aa7:c392:0:b0:43b:1f5c:391f with SMTP id
 k18-20020aa7c392000000b0043b1f5c391fmr12051722edq.267.1657904573838; 
 Fri, 15 Jul 2022 10:02:53 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170906828700b0072321c99b78sm2194983ejx.57.2022.07.15.10.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 10:02:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: natto@weirdnatto.in
Subject: [PATCH 1/2] monitor: add support for boolean statistics
Date: Fri, 15 Jul 2022 19:02:48 +0200
Message-Id: <20220715170249.404786-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715170249.404786-1-pbonzini@redhat.com>
References: <20220715170249.404786-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The next version of Linux will introduce boolean statistics, which
can only have 0 or 1 values.  Support them in the schema and in
the HMP command.

Suggested-by: Amneesh Singh <natto@weirdnatto.in>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 monitor/hmp-cmds.c | 2 ++
 qapi/stats.json    | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index ca98df0495..e8d6963722 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2337,6 +2337,8 @@ static void print_stats_results(Monitor *mon, StatsTarget target,
 
         if (stats_value->type == QTYPE_QNUM) {
             monitor_printf(mon, ": %" PRId64 "\n", stats_value->u.scalar);
+        } else if (stats_value->type == QTYPE_QBOOL) {
+            monitor_printf(mon, ": %s\n", stats_value->u.boolean ? "yes" : "no");
         } else if (stats_value->type == QTYPE_QLIST) {
             uint64List *list;
             int i;
diff --git a/qapi/stats.json b/qapi/stats.json
index 2f8bfe8fdb..cb6456c67a 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -38,11 +38,12 @@
 # @bytes: stat reported in bytes.
 # @seconds: stat reported in seconds.
 # @cycles: stat reported in clock cycles.
+# @cycles: stat is a boolean value.
 #
 # Since: 7.1
 ##
 { 'enum' : 'StatsUnit',
-  'data' : [ 'bytes', 'seconds', 'cycles' ] }
+  'data' : [ 'bytes', 'seconds', 'cycles', 'boolean' ] }
 
 ##
 # @StatsProvider:
@@ -123,6 +124,7 @@
 ##
 { 'alternate': 'StatsValue',
   'data': { 'scalar': 'uint64',
+            'boolean': 'bool',
             'list': [ 'uint64' ] } }
 
 ##
-- 
2.36.1



