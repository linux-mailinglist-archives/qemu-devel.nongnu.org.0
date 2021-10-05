Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F547422E59
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:48:35 +0200 (CEST)
Received: from localhost ([::1]:35914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXncI-0003Q7-F8
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmte-00019C-5x
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:02:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmtX-0005de-Fs
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:02:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mXSlFA6w5LGo32CneZXNbHeK35lLFoOJ1E7B23moMNw=;
 b=fU+EUx4k00oIn3WtHYdYtWq+QczAp3r0Hz4n4CLOV5GFo2ThsGcDKdAG48rsl9kn/5Od+J
 WLx18QbkSUMAJkrSu68J84+fAT9sGgsVo+piJfMhDBQNtmYkBxSGJ468uzI2rWCpGjAKHi
 VUlo9UumtixFFoxzYa9kX1jCZPmaDQA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-tLf2uC5CNxOCT4yKAJmSmw-1; Tue, 05 Oct 2021 12:02:17 -0400
X-MC-Unique: tLf2uC5CNxOCT4yKAJmSmw-1
Received: by mail-wm1-f71.google.com with SMTP id
 d16-20020a1c1d10000000b0030d738feddfso1236692wmd.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mXSlFA6w5LGo32CneZXNbHeK35lLFoOJ1E7B23moMNw=;
 b=0WDNafTIOp/sRpQFAJp6cJGSbsBVimDQ0Ys04WtAiDKgxtFWRp1KpO1lrgW32Naja/
 F5QMDES7UEolgxjZa35wkD4kmUT4y9tdMLlz5AFYRzpPGaKa+Uk0p28kJWLyknms0e2x
 zCT759ky0yj3I8phmZw/oOgJPg449IgOdsNIsPOE0CVvWNNXszoOTlp8MwMrIjH55zVr
 6aMk4zGmY8JeFJMKyiWfn/TX9rZNoc4DgakCo7mU/TizaccyZVCMf/vOab/fZ9eCdzZH
 VkH/MYfGLcekumEli3HN5Ugj70HKTx7To19AgIV/qDx/cDXcevmcN9qsBKmn/GkpSTWm
 60bg==
X-Gm-Message-State: AOAM532sBxvJtYuXEytSULJLQm+YZL6P9Z5bCHX3DDsrLW0fCp4oL0mg
 hRA/ObLOKdHqpyUbC01E5MVwAm7B3g9jHtQ1JsjFxrm5L9Dx+D+RDmIXZETEs57QJjOeMjx4QWR
 Nk/ULi6xPad3JchPdK3AiXWk28yp9+7lhN46IBz/q3w1FDBHuZDsRW+CEKB1g
X-Received: by 2002:adf:c78d:: with SMTP id l13mr9016501wrg.134.1633449736198; 
 Tue, 05 Oct 2021 09:02:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySuskqIN0ckI7jxzJ7ltshJAz4wlO4E4WY8SMoW8XQYtTMC8+L+ph3LkmegPnTw7MeLM3u9g==
X-Received: by 2002:adf:c78d:: with SMTP id l13mr9016459wrg.134.1633449735933; 
 Tue, 05 Oct 2021 09:02:15 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id l16sm2499311wmj.33.2021.10.05.09.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:02:14 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:02:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/57] acpi: build_hmat: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-24-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Also since acpi_table_begin() reserves space only for standard header
while previous acpi_data_push() reserved the header + 4 bytes field,
add 4 bytes 'Reserved' field into hmat_build_table_structs()
which didn have it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-10-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/hmat.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index edb3fd91b2..6913ebf730 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -200,6 +200,8 @@ static void hmat_build_table_structs(GArray *table_data, NumaState *numa_state)
     HMAT_LB_Info *hmat_lb;
     NumaHmatCacheOptions *hmat_cache;
 
+    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+
     for (i = 0; i < numa_state->num_nodes; i++) {
         flags = 0;
 
@@ -256,14 +258,10 @@ static void hmat_build_table_structs(GArray *table_data, NumaState *numa_state)
 void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state,
                 const char *oem_id, const char *oem_table_id)
 {
-    int hmat_start = table_data->len;
-
-    /* reserve space for HMAT header  */
-    acpi_data_push(table_data, 40);
+    AcpiTable table = { .sig = "HMAT", .rev = 2,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
+    acpi_table_begin(&table, table_data);
     hmat_build_table_structs(table_data, numa_state);
-
-    build_header(linker, table_data,
-                 (void *)(table_data->data + hmat_start),
-                 "HMAT", table_data->len - hmat_start, 2, oem_id, oem_table_id);
+    acpi_table_end(linker, &table);
 }
-- 
MST


