Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830EF48240F
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:55:55 +0100 (CET)
Received: from localhost ([::1]:55128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HRq-00068F-L4
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:55:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKY-0005zo-MO
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKW-0000k8-T0
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xmB2pjpPBRixvCwzPKhtMpmRFUaHeigjOeRVD50Cfio=;
 b=S2eJcC8nLqFyPr0p002FeUR7pI/RFZJ+G6WGE/9dMRghQu39BecATaljpg2aULW3AmZMbz
 GXjGjoEh/cBWBIfgWqD8mJHAEtxI57E16rNW8ta99YPLLmJK9ahvKD5YelJfUWglnGSqpB
 ruY1iYYPChrGvRmLgNEVHqIdl0r/bQ8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-u-HVej0pPkm6T_6FaJVLVw-1; Fri, 31 Dec 2021 07:48:19 -0500
X-MC-Unique: u-HVej0pPkm6T_6FaJVLVw-1
Received: by mail-wr1-f71.google.com with SMTP id
 f13-20020adfe90d000000b001a15c110077so7494943wrm.8
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xmB2pjpPBRixvCwzPKhtMpmRFUaHeigjOeRVD50Cfio=;
 b=urzqsozuJzhmnxK9szi9HTpA/BCXktIxJYHhCuBYy3T0IhdPg/tBbkNiZQieFBYyi/
 sdkoEmpjeGIzWLs07m0lcweuJUQB7u6zIm4uISvjuElioMUHJRQSEi7URkTGgGsJ7ujn
 Q043XsUs0zxG+1CmGdBlUAXaQO41IWs2x7L4iJMMv09IQHhy5IApaL5SOBGiN4pIzJDS
 nL5ga0o27M7aC113tpuEt7tMgGDhCPZWzelvhEnWrpjj7Rm6LEfHY6+COWaoYIMfKoba
 adsPWsJmFTKy6j5XdPhqGdHYz3xZKEqf4FhUVHUpYG7zFS9AiHiceGaU1Yfte4bqdE3f
 F+0Q==
X-Gm-Message-State: AOAM533RXLQ2Bq5PbB9QnbrJHlw1X8rkbpoyF3/rRSnH8Q95W7o31nUT
 Mlb74IswsqJxbNd1XIFR+hv7k/jJVW867rGTgBfo/hqkDQeE18krlGJlarGHtUAJknIBB2I37Cn
 gAPE5BwS8LXqZwpLNMkiqo05KadTwmnLz1EHDOFiuwluRXGCxwhSfBHIlS+6KY8lX
X-Received: by 2002:a05:6000:108a:: with SMTP id
 y10mr28770154wrw.335.1640954897872; 
 Fri, 31 Dec 2021 04:48:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGpX+LsFprT8hw+VLP7mQuNE1tHjfABBtig5YpWxcStgP8CjRRA5QN/vTAZNPggMwuurC+fQ==
X-Received: by 2002:a05:6000:108a:: with SMTP id
 y10mr28770140wrw.335.1640954897698; 
 Fri, 31 Dec 2021 04:48:17 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id n12sm29245382wrf.29.2021.12.31.04.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:48:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/20] tests/unit/test-smp-parse: Pass machine type as argument
 to tests
Date: Fri, 31 Dec 2021 13:47:39 +0100
Message-Id: <20211231124754.1005747-6-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
References: <20211231124754.1005747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use g_test_add_data_func() instead of g_test_add_func() so we can
pass the machine type to the tests (we will soon have different
machine types).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211216132015.815493-2-philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index b02450e25a3..37c6b4981db 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -487,9 +487,10 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
     mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
-static void test_generic(void)
+static void test_generic(const void *opaque)
 {
-    Object *obj = object_new(TYPE_MACHINE);
+    const char *machine_type = opaque;
+    Object *obj = object_new(machine_type);
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
     SMPTestData *data = &(SMPTestData){{ }};
@@ -525,9 +526,10 @@ static void test_generic(void)
     object_unref(obj);
 }
 
-static void test_with_dies(void)
+static void test_with_dies(const void *opaque)
 {
-    Object *obj = object_new(TYPE_MACHINE);
+    const char *machine_type = opaque;
+    Object *obj = object_new(machine_type);
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
     SMPTestData *data = &(SMPTestData){{ }};
@@ -599,8 +601,12 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
-    g_test_add_func("/test-smp-parse/generic", test_generic);
-    g_test_add_func("/test-smp-parse/with_dies", test_with_dies);
+    g_test_add_data_func("/test-smp-parse/generic",
+                         TYPE_MACHINE,
+                         test_generic);
+    g_test_add_data_func("/test-smp-parse/with_dies",
+                         TYPE_MACHINE,
+                         test_with_dies);
 
     g_test_run();
 
-- 
2.33.1


