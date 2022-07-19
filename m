Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F91579674
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 11:38:00 +0200 (CEST)
Received: from localhost ([::1]:47820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDjfz-0005eu-Ot
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 05:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oDjct-0001PP-Sx
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:34:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oDjcs-0000Qg-BN
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658223285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vBYfpPuzNQ2Hah53ZeUIE84a2xKUBptEf78oS/hKeg8=;
 b=AltZsF7X3wsX/9jDeZN/+4dlaEWQWq1I0KVbdu5GIoafNMVDKTJYDHMLQwnDki7uxFCicy
 ulgARYYpEgWvLZm2I4iVKE8VBS+VMkN2RECfSyjrovv2yS6tmFXSaxBd8U3KKikoxy5Yq4
 a0ne/PgdvJ3iaNB9e2mSDf5pA3FXR00=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-3YCK8RUxMcWYAb2dEJgihQ-1; Tue, 19 Jul 2022 05:34:44 -0400
X-MC-Unique: 3YCK8RUxMcWYAb2dEJgihQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 hr24-20020a1709073f9800b0072b57c28438so2847087ejc.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 02:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vBYfpPuzNQ2Hah53ZeUIE84a2xKUBptEf78oS/hKeg8=;
 b=HVgt+VUKtzy3d3obEp+5+SMPDYorQszCQCXfkO1EQ2FIbpjwnBCVKY5TjlZ5c7eDE3
 SQkkJ5NoY05yEzD6MkQgzYUamKqsXoZIOta0XfkFgsvM+frsiQXiAtTfZwnoKn7kDsO0
 ZNizxfsKgKzjjyCfomRprVMxYSgdiNqBFZHuyNIeWl1+us08IsNjJK96uyD1hsA5++KH
 sxDZRVL6A8RTv/YSU3FiAxiLcgWUPx2U+POlz5agW0p4TDbeEGOqKBhdLR/kvxr2220w
 DJ2I5cH35X9LnPdxUF5G8T5qXjM/n7mtJc5y71Nhh94bP5VC9jpKeGnZCeYWGgTJ31ZX
 TQQQ==
X-Gm-Message-State: AJIora8euw6RD+CPqy3S6FTFdsctIAC9IocOgd60vCdN1RGSatTi6u7M
 t/xtn9APQTVc7BrwVxR4bW1frjtFSCOlLt/McbZr9hpiEyWNAFxBkvnV9bCFnEbI25nUwyFMpeE
 FliU7Kc0+LgXSpbMZS0wXpIACtLlfAZKuptb231yc9WYZj4sOW/MJCHw1+76F/ammCyQ=
X-Received: by 2002:a17:906:5512:b0:726:be2c:a2e5 with SMTP id
 r18-20020a170906551200b00726be2ca2e5mr29189728ejp.88.1658223282810; 
 Tue, 19 Jul 2022 02:34:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ueljy+y5hwHPQ89X8hZwuY8NCBaeR8wrHkiOC1JjtAN+lb21DRpB7ab46sb/I5/SP20OwIvQ==
X-Received: by 2002:a17:906:5512:b0:726:be2c:a2e5 with SMTP id
 r18-20020a170906551200b00726be2ca2e5mr29189701ejp.88.1658223282482; 
 Tue, 19 Jul 2022 02:34:42 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 d25-20020aa7c1d9000000b0043a75f62155sm10202391edp.86.2022.07.19.02.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 02:34:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Amneesh Singh <natto@weirdnatto.in>
Subject: [PULL 1/3] monitor: add support for boolean statistics
Date: Tue, 19 Jul 2022 11:34:37 +0200
Message-Id: <20220719093439.528810-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719093439.528810-1-pbonzini@redhat.com>
References: <20220719093439.528810-1-pbonzini@redhat.com>
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
index 2f8bfe8fdb..57db5b1c74 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -38,11 +38,12 @@
 # @bytes: stat reported in bytes.
 # @seconds: stat reported in seconds.
 # @cycles: stat reported in clock cycles.
+# @boolean: stat is a boolean value.
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



