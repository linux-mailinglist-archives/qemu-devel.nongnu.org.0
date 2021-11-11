Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0947544D4DD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:14:40 +0100 (CET)
Received: from localhost ([::1]:58386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml76N-0006jN-6i
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:14:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml6wc-0007aJ-29
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:04:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml6wN-000123-W9
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:04:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636625057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPiGfJGGXXvWAef0vocDFa36Z1A0Gwvp66AOmpazW+Y=;
 b=OTSugkrRsRW1haE/JLx25Vjv8vv4i5Kvt3T9xSVMYaH0yOTN1JdZMybAtX/ElPYiD8fKtz
 USG5NKU9btIoWRVB2K/gb3XUziSWUEUL2Vlgss+Ebnzgrqmpu5ygzejfQFnWMFA3MjPwHo
 +nMxkzcKJX4Elo6qSKeIFWdMjoV+msY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-J0Cg7-DYNI-AxpaFyChpVg-1; Thu, 11 Nov 2021 05:04:16 -0500
X-MC-Unique: J0Cg7-DYNI-AxpaFyChpVg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso4549620wms.4
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 02:04:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uPiGfJGGXXvWAef0vocDFa36Z1A0Gwvp66AOmpazW+Y=;
 b=vqCXAHbaJQhTOL8aanzPGN5BsSqsufIXExkIYRk5Kbu1rxLekERrSaQbR5xCXhn9yr
 vHHqqYhBbW/h3Za8Jar1cEoO2MIScbK7Z73ksg4IQawKxxXmGrksXsNEvCmdqNTK8HKA
 kELMJGXscLh/pFNUrcJCifz2CWK8X9D+/s+aby6szdnGwJktLJ47hwCD+ViSNQZreKBu
 B24+KVygE7gSBPVBgeqZTOVItQnB40StdwKFlBrbwRPy+7nI7M0ExtmeUnKjjOmf4SwN
 mTCW54CeaLuhjZRh+VR2ok0LCxtrUPo2EA9qoUNfBelCg5LK/5mKezpm1bF1mLVddfdq
 cMFQ==
X-Gm-Message-State: AOAM530CEk61aoWzlYUcDrWU4EUrRIKOTl7Nc6rYlwr2wjES/zNimk8G
 /2Jo/ito8Kmo/G7F51XMKcJfg37JtDyNZvYOdkR7+KJJU/l4YqEdQXoLY8WjCVcASvHYNiAMoRm
 bQCdZXbVYZGq4LletlbmWGSlMJG8VFhSMYoTYmpyTnraeSiygw5EDY1NwcFGKrOjF
X-Received: by 2002:a05:600c:1989:: with SMTP id
 t9mr6811450wmq.24.1636625055146; 
 Thu, 11 Nov 2021 02:04:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyADShtS3puNw/QayYYDzOefeQ0Y0ewm1eIhnV+IQ9y87D9vlUQiyb9kcY57J9wVeGgw74TgQ==
X-Received: by 2002:a05:600c:1989:: with SMTP id
 t9mr6811405wmq.24.1636625054889; 
 Thu, 11 Nov 2021 02:04:14 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 w7sm2443499wru.51.2021.11.11.02.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 02:04:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v3 5/6] tests/unit/test-smp-parse: Constify some
 pointer/struct
Date: Thu, 11 Nov 2021 11:03:50 +0100
Message-Id: <20211111100351.2153662-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111100351.2153662-1-philmd@redhat.com>
References: <20211111100351.2153662-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Declare structures const when we don't need to modify
them at runtime.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 83a5b8ffdcf..11109752799 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -83,7 +83,7 @@ typedef struct SMPTestData {
  * then test the automatic calculation algorithm of the missing
  * values in the parser.
  */
-static struct SMPTestData data_generic_valid[] = {
+static const struct SMPTestData data_generic_valid[] = {
     {
         /* config: no configuration provided
          * expect: cpus=1,sockets=1,cores=1,threads=1,maxcpus=1 */
@@ -285,7 +285,7 @@ static struct SMPTestData data_generic_valid[] = {
     },
 };
 
-static struct SMPTestData data_generic_invalid[] = {
+static const struct SMPTestData data_generic_invalid[] = {
     {
         /* config: -smp 2,dies=2 */
         .config = SMP_CONFIG_WITH_DIES(T, 2, F, 0, T, 2, F, 0, F, 0, F, 0),
@@ -319,7 +319,7 @@ static struct SMPTestData data_generic_invalid[] = {
     },
 };
 
-static struct SMPTestData data_with_dies_invalid[] = {
+static const struct SMPTestData data_with_dies_invalid[] = {
     {
         /* config: -smp 16,sockets=2,dies=2,cores=4,threads=2,maxcpus=16 */
         .config = SMP_CONFIG_WITH_DIES(T, 16, T, 2, T, 2, T, 4, T, 2, T, 16),
@@ -356,7 +356,7 @@ static char *smp_config_to_string(SMPConfiguration *config)
         config->has_maxcpus ? "true" : "false", config->maxcpus);
 }
 
-static char *cpu_topology_to_string(CpuTopology *topo)
+static char *cpu_topology_to_string(const CpuTopology *topo)
 {
     return g_strdup_printf(
         "(CpuTopology) {\n"
@@ -372,7 +372,7 @@ static char *cpu_topology_to_string(CpuTopology *topo)
 }
 
 static void check_parse(MachineState *ms, SMPConfiguration *config,
-                        CpuTopology *expect_topo, const char *expect_err,
+                        const CpuTopology *expect_topo, const char *expect_err,
                         bool is_valid)
 {
     g_autofree char *config_str = smp_config_to_string(config);
@@ -466,7 +466,7 @@ static void smp_parse_test(MachineState *ms, SMPTestData *data, bool is_valid)
 }
 
 /* The parsed results of the unsupported parameters should be 1 */
-static void unsupported_params_init(MachineClass *mc, SMPTestData *data)
+static void unsupported_params_init(const MachineClass *mc, SMPTestData *data)
 {
     if (!mc->smp_props.dies_supported) {
         data->expect_prefer_sockets.dies = 1;
-- 
2.31.1


