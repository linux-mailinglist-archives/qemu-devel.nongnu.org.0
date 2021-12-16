Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A0A47732A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:31:09 +0100 (CET)
Received: from localhost ([::1]:46440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqqc-0006Qa-Cb
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:31:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqgw-0006sa-AM
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:21:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqgu-0008Ob-RT
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:21:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639660858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XIR/7k3+LEqXkFaBCSIJ9jj6FHOlOGORQLMrHC9gYqo=;
 b=VEswnaTavNZ86BByiDfMUI0BCd0LLmgSmWjh/H1IdQSZfu9ZMhM5QD2nAZ2hnFMxxD5YIT
 jiBMutKpCI767mNdVBbNOSmTDXr405Hf0IsFGE9FPjthGpoNCfINh7E24To3NGXi7OsJiK
 E2/uPcaulRJhy2i268UT7KCPErvD6V0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-J8I--slNNtOUUjoZhH3OZA-1; Thu, 16 Dec 2021 08:20:57 -0500
X-MC-Unique: J8I--slNNtOUUjoZhH3OZA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l34-20020a05600c1d2200b00344d34754e4so1255727wms.7
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:20:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XIR/7k3+LEqXkFaBCSIJ9jj6FHOlOGORQLMrHC9gYqo=;
 b=mmPLM6pfb84+/7ulJvRFCy4CciAJGfIvmb+MtdwDbX7FNy6CRiGR/xZFlFKVG9DdF/
 IAsocSmgPQQ2JtVhIK3HBjYmSrYfHXaI4Q0luNn0EamxrgM6LsfkRkaO57v9NJFKQ398
 HUHE7c/iljipZnz39z3+TeU44TXyWOAgthkZOGpNsicGJAkS/prPlCxUpnjarR3So7iS
 jWtGl6AlaaKAHP9HVhR7wy/0heHz634DXy9RvHmzJhEErXG4FhJiHYQ8QA6JqLuMlHPN
 3uXjdHDFE4zBMqYXCMYD3BR/u8QRJUBpDrOdQN5kVuYqZiZguyErT4wXuVlAmyTv4PDj
 Yt4A==
X-Gm-Message-State: AOAM530CwVFaIgq3K+CZusnZgBxcLMc70G8fulfvSyIAKVQe6kA4ftp7
 NfTjPKzrtR8OcknOpY/nXwVFIKQJzO7KQipdEpiz2OhaGlc76k6wYJi/Ajl67Hy7A/62BWXuOUm
 V0M9i9VwaSdy+OqKhvRR4+p3s/oX7KsLLx5PerHKO7BOFnAYdaKPV8C/rWhDybd+9
X-Received: by 2002:a05:600c:b43:: with SMTP id
 k3mr4914771wmr.159.1639660855902; 
 Thu, 16 Dec 2021 05:20:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7U9ulwEmx8HA2/W7bSkCYEuamU6pe/+WHQWJiprLrnjx/99BgT0v2MoxfsRIEgrzN+DUZGA==
X-Received: by 2002:a05:600c:b43:: with SMTP id
 k3mr4914741wmr.159.1639660855649; 
 Thu, 16 Dec 2021 05:20:55 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id w25sm5045259wmk.20.2021.12.16.05.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:20:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 7/8] tests/unit/test-smp-parse: Constify some pointer/struct
Date: Thu, 16 Dec 2021 14:20:14 +0100
Message-Id: <20211216132015.815493-8-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216132015.815493-1-philmd@redhat.com>
References: <20211216132015.815493-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
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
index 395929b66cf..0f98c9509ee 100644
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


