Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9314865C5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:05:56 +0100 (CET)
Received: from localhost ([::1]:34048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TOt-0000bO-HQ
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:05:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sf3-0005bF-7U
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sf0-00013x-Gq
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=frHd/5g516X/URldKy7BtToYamE3vI32g+batxojBlk=;
 b=NS3LMpVQJgAbvMBKWo3PQZkUgVabZ0CSjmcrporpq6uyhNZGDuCS29VmZtV4aeTtmQLzEE
 QBckIihTu7AmN0AVCJiKMHP5QQUkW8biAYkFwOYSJgZzhmTjGGPjr7/w8KzZQJ/XBVtp1x
 5QlsIXoFhCcA01r4oYqCVPhTgZbGLJ8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-23jAQoh_OsqeYbn8z7zOgA-1; Thu, 06 Jan 2022 08:18:28 -0500
X-MC-Unique: 23jAQoh_OsqeYbn8z7zOgA-1
Received: by mail-ed1-f69.google.com with SMTP id
 z3-20020a05640240c300b003f9154816ffso1916041edb.9
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=frHd/5g516X/URldKy7BtToYamE3vI32g+batxojBlk=;
 b=1bTP0EBJOP8Zy6m6hxpNnaFPuYSKb2HwheYSOHYoKTIUdRrh1H1NHA3KANIDNVa/az
 g1t1eqItsDaLX4G4E1rdWg2BAB7ZaLGttb4w/OUsXQwBcf9VtqdiXlK8AtzeKHkb2Js3
 Gap16Pd+7GdbN3RsrMNq3Uh3/GblDIUjzK/cMOjUF8JITcY+iHJ++dvHPPpK+zjxu/pD
 cL8WrlPHZ4b8Wvl3orVxx3kU1pn21Sxiv8tsydUFCAfiYvqKt0XZr6eBES5SKmowvavk
 qat+5nKNaSZvh5Iod5SmGCFxqQrqjRCQ8kWu57YrrdgMdLZhv4B5RtDGiwRdk14D6EGA
 SBgA==
X-Gm-Message-State: AOAM532NLW/zQh9j4Fpyq7ZkdQh9OEav+Faf9bI76yMhSsF0hkean74z
 9x36rSQAB4oBcoTjr9vcXKlUlEschX3mbWo9CHu0hkN0Zz9NArSMfACmpfYJ/59JjDH0yByQwPT
 yx8fzmZxb5TTyJfGsegNseDYKAMrd4J7oUlMDbqqKBXIS51I2pgst0WAKEPkJ
X-Received: by 2002:a17:907:7e95:: with SMTP id
 qb21mr48935227ejc.105.1641475104887; 
 Thu, 06 Jan 2022 05:18:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJ1CA6Od+0OpgpKZI5gV+mXhFUKibP4Wbf2h/wcOGUt644WU3j7AQ6rZVSL19wCsJGGdEbdA==
X-Received: by 2002:a17:907:7e95:: with SMTP id
 qb21mr48935200ejc.105.1641475104631; 
 Thu, 06 Jan 2022 05:18:24 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id nd10sm341644ejc.214.2022.01.06.05.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:18:23 -0800 (PST)
Date: Thu, 6 Jan 2022 08:18:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 43/52] acpi: fix QEMU crash when started with SLIC table
Message-ID: <20220106131534.423671-44-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org,
 Denis Lisov <dennis.lissov@gmail.com>, Alexander Tsoy <alexander@tsoy.me>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

if QEMU is started with used provided SLIC table blob,

  -acpitable sig=SLIC,oem_id='CRASH ',oem_table_id="ME",oem_rev=00002210,asl_compiler_id="",asl_compiler_rev=00000000,data=/dev/null
it will assert with:

  hw/acpi/aml-build.c:61:build_append_padded_str: assertion failed: (len <= maxlen)

and following backtrace:

  ...
  build_append_padded_str (array=0x555556afe320, str=0x555556afdb2e "CRASH ME", maxlen=0x6, pad=0x20) at hw/acpi/aml-build.c:61
  acpi_table_begin (desc=0x7fffffffd1b0, array=0x555556afe320) at hw/acpi/aml-build.c:1727
  build_fadt (tbl=0x555556afe320, linker=0x555557ca3830, f=0x7fffffffd318, oem_id=0x555556afdb2e "CRASH ME", oem_table_id=0x555556afdb34 "ME") at hw/acpi/aml-build.c:2064
  ...

which happens due to acpi_table_begin() expecting NULL terminated
oem_id and oem_table_id strings, which is normally the case, but
in case of user provided SLIC table, oem_id points to table's blob
directly and as result oem_id became longer than expected.

Fix issue by handling oem_id consistently and make acpi_get_slic_oem()
return NULL terminated strings.

PS:
After [1] refactoring, oem_id semantics became inconsistent, where
NULL terminated string was coming from machine and old way pointer
into byte array coming from -acpitable option. That used to work
since build_header() wasn't expecting NULL terminated string and
blindly copied the 1st 6 bytes only.

However commit [2] broke that by replacing build_header() with
acpi_table_begin(), which was expecting NULL terminated string
and was checking oem_id size.

1) 602b45820 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
2)
Fixes: 4b56e1e4eb08 ("acpi: build_fadt: use acpi_table_begin()/acpi_table_end() instead of build_header()")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/786
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20211227193120.1084176-2-imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Denis Lisov <dennis.lissov@gmail.com>
Tested-by: Alexander Tsoy <alexander@tsoy.me>
Cc: qemu-stable@nongnu.org
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/core.c       | 4 ++--
 hw/i386/acpi-build.c | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 1e004d0078..3e811bf03c 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -345,8 +345,8 @@ int acpi_get_slic_oem(AcpiSlicOem *oem)
         struct acpi_table_header *hdr = (void *)(u - sizeof(hdr->_length));
 
         if (memcmp(hdr->sig, "SLIC", 4) == 0) {
-            oem->id = hdr->oem_id;
-            oem->table_id = hdr->oem_table_id;
+            oem->id = g_strndup(hdr->oem_id, 6);
+            oem->table_id = g_strndup(hdr->oem_table_id, 8);
             return 0;
         }
     }
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 8383b83ee3..0234fe7588 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2723,6 +2723,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
 
     /* Cleanup memory that's no longer used. */
     g_array_free(table_offsets, true);
+    g_free(slic_oem.id);
+    g_free(slic_oem.table_id);
 }
 
 static void acpi_ram_update(MemoryRegion *mr, GArray *data)
-- 
MST


