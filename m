Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1912422E0A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:34:31 +0200 (CEST)
Received: from localhost ([::1]:58360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnOg-0004tS-V5
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmtO-0000vp-1t
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:02:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmtL-0005Un-Me
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:02:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OCIxQsk7jhQmV5lumZAqEAV5I0Q6nMdVi6zQWr5NyRs=;
 b=Y8ggc8Z+u3fCPZVE9THBR3SaRC2p+U2wM60edkVJY45yp+01tbS6KVZFptuWW/CwkQTrj1
 6hSAlt0Mf3LzB1qid3hw4AgKKeSQfBfcKRaz3eO8TgOeUJaoli7SEvrOL9X9MI8apTdOOE
 mjasYuhIXvZx6D11p+FdBKaUI9PnxPk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-cRWTrjCNNR23ic2mKhUNOw-1; Tue, 05 Oct 2021 12:02:05 -0400
X-MC-Unique: cRWTrjCNNR23ic2mKhUNOw-1
Received: by mail-wr1-f72.google.com with SMTP id
 l9-20020adfc789000000b00160111fd4e8so5896750wrg.17
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OCIxQsk7jhQmV5lumZAqEAV5I0Q6nMdVi6zQWr5NyRs=;
 b=6nqxalS/v6M4nW3UhqOO6MyovLlAMv639Trwy4PfSFIpZykVekJGs+pKxGqxOnUrOl
 8ZWiT2v9USUniUQUKpuJP99NRT979F4xM11FhAd1eiI5oEoPOemeZXWK2lKkYQUvVRv6
 WGfMYFQblGqAIg9m6ylNYlhyGXGodXBgo7zyo7M+zuod7rZDTpD3ZAwtXptjbBg3lZUN
 2KQr5mhRGGwF1qb81WpYpIXHswqqQFG0irq53xHRKVKtc2/mvgrkK/WMK77x8+atLxvx
 6xl4VAP7J9AZdNAk822nvjhCf4/Lu0PjiWVNKKXgD0dC2DCZTonNzlTb6TJQ0YhFPtpM
 NP9A==
X-Gm-Message-State: AOAM5338jmmtVzbfxiw04GkgsRzKYO5G7MaupzDyuBMFN2vKGPATNz4v
 866Zh3oGleWseiJ+Sj7kfa1plgY9AfGr/taDOauxfMUsmeKdiLj6UVs/uoTQ7/Cybz73TUsTFgR
 rDknYRBjhoeB+GewsbRfQhk2lg9a5RFM2D5LG1e4U7Uq0VmegHmRLZR2KaJyx
X-Received: by 2002:adf:a4c7:: with SMTP id h7mr10063435wrb.57.1633449724274; 
 Tue, 05 Oct 2021 09:02:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXs7R2TLmoUx3vSIyaz6Tt9kNx2jCSseo0H1eKMVR7rps/U3kGUJKmnZRpEeT6aEACn3KvQQ==
X-Received: by 2002:adf:a4c7:: with SMTP id h7mr10063402wrb.57.1633449724089; 
 Tue, 05 Oct 2021 09:02:04 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id t11sm17911151wrz.65.2021.10.05.09.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:02:03 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:01:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/57] acpi: acpi_build_hest: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-22-mst@redhat.com>
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
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Dongjiu Geng <gengdongjiu1@gmail.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-8-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/ghes.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a749b84d62..45d9a809cc 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -362,18 +362,16 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
 void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
                      const char *oem_id, const char *oem_table_id)
 {
-    uint64_t hest_start = table_data->len;
+    AcpiTable table = { .sig = "HEST", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
-    /* Hardware Error Source Table header*/
-    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    acpi_table_begin(&table, table_data);
 
     /* Error Source Count */
     build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
-
     build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
 
-    build_header(linker, table_data, (void *)(table_data->data + hest_start),
-                 "HEST", table_data->len - hest_start, 1, oem_id, oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
-- 
MST


