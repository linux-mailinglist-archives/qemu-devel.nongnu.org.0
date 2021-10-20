Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5594A4349A8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:04:04 +0200 (CEST)
Received: from localhost ([::1]:41796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9O7-0003oJ-Cw
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iE-0004ps-Ou
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iC-0003o6-4e
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hgj6U65prU55+Vw6GV3Frlkold3q2yJFqxxjdTh9XFs=;
 b=G5jmBxMw7GUmtXylb8Hy8BOw2qrkXqupjYor29zpvU2WQh1DHgm0cUliakesgWGFt/4b5G
 IuoJmnkKKpUAITFl/c9zsPCFqiI7vrPxgD7EiSJpxDfwVk26Ju0jP3ZRpUgixwQ0tbSdB9
 69zLvascdV+cweeiH6FMu54wkc63X6Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-Km0Wl8-MO0qPS1IVBMoZVg-1; Wed, 20 Oct 2021 06:20:42 -0400
X-MC-Unique: Km0Wl8-MO0qPS1IVBMoZVg-1
Received: by mail-ed1-f70.google.com with SMTP id
 h19-20020aa7de13000000b003db6ad5245bso20619581edv.9
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hgj6U65prU55+Vw6GV3Frlkold3q2yJFqxxjdTh9XFs=;
 b=D9qxkIZRUDtVBCbExRkgJol8jE240BQYVKYFJP2AqZpfMKycR6vL0zzl+BLc12NyUX
 LiT3ZeNVnAlmxw7aGNobHtAARw9KqBVoV/Eh7U8iNgDPWM7MG+79xaZxskXWMr3Bl1BM
 SrD7w0Qp/kjHNhCqLxFn5yGnp/mbNHVO2zpw++7qn/vf9oKyz3aSgL89KSkQXgcpMBPn
 c/wwe/8JuoguT8dK6IdqjWRwNqQIpQ2cbrfWnV3jnjf1IK6QMWfIS5DigGPI4SmmxGpT
 G5M8KCKvLJtlw/qXf1KuXq6Yc6F9A1TH0EUR2xpeqe4fU+KA0Qz+r9BZYs36czcjfqyl
 uQug==
X-Gm-Message-State: AOAM532b1l9rrH7SmD6Sk85JHu/9ljvOhzEq2KLXAnKstcpsQ0DRYf0U
 596JYxQv2Fu1nt1k0u7gNtGcxmvyw9jKlGqG9azCGoZzYU5hjbMN2SYHDbtYYerTs4eMskAD0vP
 KNrrgbDenUcQOyhz3pgnHXxHoNlMIl7aleNoXL2XAE7NCGX4C7reckXhgiSyZ
X-Received: by 2002:a50:d558:: with SMTP id f24mr9912172edj.305.1634725240481; 
 Wed, 20 Oct 2021 03:20:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYKTDix0I8Mw9Koyhwc0DH4kp66SE6LDnPt2KEZyMOD6tMBPWSHzKtJR/jZ5g57yUvs8Hjng==
X-Received: by 2002:a50:d558:: with SMTP id f24mr9912148edj.305.1634725240253; 
 Wed, 20 Oct 2021 03:20:40 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id kd8sm831694ejc.69.2021.10.20.03.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:39 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 30/44] bios-tables-test: don't disassemble empty files
Message-ID: <20211020101844.988480-31-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A recommended way to populate new tables is to have an
empty expected file. In this case, attempts to disassemble
will fail but it is useful to disassemble the actual files.
Detect and skip decompile step in this case.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 6e21a650d2..798f68c737 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -271,19 +271,28 @@ static void dump_aml_files(test_data *data, bool rebuild)
     }
 }
 
+static bool create_tmp_asl(AcpiSdtTable *sdt)
+{
+    GError *error = NULL;
+    gint fd;
+
+    fd = g_file_open_tmp("asl-XXXXXX.dsl", &sdt->asl_file, &error);
+    g_assert_no_error(error);
+    close(fd);
+
+    return false;
+}
+
 static bool load_asl(GArray *sdts, AcpiSdtTable *sdt)
 {
     AcpiSdtTable *temp;
     GError *error = NULL;
     GString *command_line = g_string_new(iasl);
-    gint fd;
     gchar *out, *out_err;
     gboolean ret;
     int i;
 
-    fd = g_file_open_tmp("asl-XXXXXX.dsl", &sdt->asl_file, &error);
-    g_assert_no_error(error);
-    close(fd);
+    create_tmp_asl(sdt);
 
     /* build command line */
     g_string_append_printf(command_line, " -p %s ", sdt->asl_file);
@@ -463,11 +472,20 @@ static void test_acpi_asl(test_data *data)
         err = load_asl(data->tables, sdt);
         asl = normalize_asl(sdt->asl);
 
-        exp_err = load_asl(exp_data.tables, exp_sdt);
-        exp_asl = normalize_asl(exp_sdt->asl);
+        /*
+         * If expected file is empty - it's likely that it was a stub just
+         * created for step 1 above: we do want to decompile the actual one.
+         */
+        if (exp_sdt->aml_len) {
+            exp_err = load_asl(exp_data.tables, exp_sdt);
+            exp_asl = normalize_asl(exp_sdt->asl);
+        } else {
+            exp_err = create_tmp_asl(exp_sdt);
+            exp_asl = g_string_new("");
+        }
 
         /* TODO: check for warnings */
-        g_assert(!err || exp_err);
+        g_assert(!err || exp_err || !exp_sdt->aml_len);
 
         if (g_strcmp0(asl->str, exp_asl->str)) {
             sdt->tmp_files_retain = true;
-- 
MST


