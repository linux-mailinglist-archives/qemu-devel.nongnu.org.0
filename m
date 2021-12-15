Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637A2475E38
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:09:15 +0100 (CET)
Received: from localhost ([::1]:54488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXmE-0002Nl-I7
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:09:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXTM-0004dl-PI
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:49:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXTI-00021C-7J
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639586979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qKTQTHa1hb0SLmS1AjA4KYFgifkhSYsgZCXWCGHH/MU=;
 b=BYXnI6KoYoOg/SuXkNJl2Dld4LPWZFwH+CYmiJMsO3Z5mchX6dopSURrKzzsSLC9PwHKh+
 y2k69l+osLH6CTX2R3sVYJNL7+9KMgKTkPsQhI0F5XINoDK4+a44wSnaGlGLfqjyhj8hzr
 2wABXV528DFgspvQdTh3AlXmaK+0GhI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-Dwif_zsGP1umk-sRSHugbA-1; Wed, 15 Dec 2021 11:49:38 -0500
X-MC-Unique: Dwif_zsGP1umk-sRSHugbA-1
Received: by mail-wr1-f69.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so6096412wrc.22
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 08:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qKTQTHa1hb0SLmS1AjA4KYFgifkhSYsgZCXWCGHH/MU=;
 b=sVB93JCCLVR4VhN0VJOfqmzutRbJ5zIlsJs0Nr1OM8gcxQ51YxnofMc28rCPSUC3zR
 xLLNutAq5aDTcGjq9DV1GBvvOrAK4nWRFKhL2JKDDgcqdbw9Mqv+gWeEpY9x6xG+5v/e
 KYc/yLJU+TxlbyOXKR0pK+fAdYNBQ77M9ESLXMWGR60Wu72zaz+IFmxiSBADUWXCFdAI
 vUOEzVRFel1AVanP1u2ij3lEoBfeed//Wd8gbLVIlxNSB2tBE20cUT0XBvSjUdHePf50
 bYphJKgkQ0PfBvge2+3hQif9TkLnjcHsRMoC4cOZ0SxMHwuVbyo5vqU0lH6TegsXbDQs
 pxGg==
X-Gm-Message-State: AOAM53375EFLQxKrHoaZP7Lqu6Knn5t5a71qOXLopGc+SNqz4R5sMMZP
 EjWN5yhEit0zxzlEcilknZIpCvZ+o+UIaCJCZCvuPpZbTCTecCMc3WdV5NBQ7kTEkBOZFzI/jiz
 +kJaTGnNV4U53YC4POrwCa/zdevFHfyRsjKFa35wp0/W0TTae8R3TYAJDlR85pswQ
X-Received: by 2002:a5d:4e92:: with SMTP id e18mr5327182wru.89.1639586977113; 
 Wed, 15 Dec 2021 08:49:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJo3BmYeKI5A5faSWgVV4zxE03y+Be0PSzuG2dBR73uIYvIM1HLURPQluw+jS1AbmQIlFYzQ==
X-Received: by 2002:a5d:4e92:: with SMTP id e18mr5327158wru.89.1639586976864; 
 Wed, 15 Dec 2021 08:49:36 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id z15sm2333023wrr.65.2021.12.15.08.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:49:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 7/8] tests/unit/test-smp-parse: Constify some pointer/struct
Date: Wed, 15 Dec 2021 17:48:55 +0100
Message-Id: <20211215164856.381990-8-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215164856.381990-1-philmd@redhat.com>
References: <20211215164856.381990-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Declare structures const when we don't need to modify
them at runtime.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 251c83c60c2..1f26edc5f82 100644
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
2.33.1


