Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046853449FC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:59:31 +0100 (CET)
Received: from localhost ([::1]:38370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMxm-00042a-3a
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMkJ-0005cQ-RG
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:45:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMkC-0007Kv-UC
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616427924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=merc1D0xul3Ny+Jrf4XDcCdbekcd0CVvJdhC+IhKUGI=;
 b=JfV1DiySTiuQ4Cok5yD2r4fst2wBeBS6Q13B7RuQ6+B3FnX0JITHbO5MAvvvn5M1A8IN9S
 nkyV0iovVfU5rfPBUtHxdzbHuSOUfQRBKvEZ+S4QIqo1KCJJCIvL0WbSHS6tqneqzpkPYF
 hF9d5jyW4hc3qjHZX0mD/RPD6MfYe6U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-fEIInjb8PXC5NeHR1jdZRw-1; Mon, 22 Mar 2021 11:45:22 -0400
X-MC-Unique: fEIInjb8PXC5NeHR1jdZRw-1
Received: by mail-wr1-f71.google.com with SMTP id h30so26370706wrh.10
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=merc1D0xul3Ny+Jrf4XDcCdbekcd0CVvJdhC+IhKUGI=;
 b=V+I46StNzB7d0nM7EK2HmEkYM30ySLRk88OOpuyM88cVPeHHG7oX2vHnCb7aTRpqsY
 6myULcmDoHfKMDZTlIIURjyXXYkvdT0o1qu86cRFA/yTsKfpNkqBQhZ0njet3y7iZ3h/
 5TYWp6xI2ZpjqQSH/4y63q9mqWQepKLZTg5GePyWz860kzbO1rEyf6wxxaaYfAUMEZih
 9+dr+L7+EtkSLL+di0XTS9fnZbZJEdq3AC0sSZKjEj+487Xbo1vfyVpR6kgHEkho2Vd3
 d081CKhVBE1avLChbFLV5BKf1HDNI+MNw7BlOq8GmKbTCWcrNy40MZjeWbWY2vjzExhd
 39Eg==
X-Gm-Message-State: AOAM5317901mpbkMITxlqllyHL1gvSrqSctcI58nk/T/jSEo5/sPwzMV
 45Ez5wvfdA+4xWy+KjTjS+IajXqMJWYHGj0k6wckmtLtLD3jxSFgK9l5eq/N3wurgalDjYPPqqD
 R7q3Q3+BQ787uwgKRGRW3GeUtF0SmUHE1Njzj5w7x/4b7NSzM/NRWvOgusn1c
X-Received: by 2002:a05:600c:4292:: with SMTP id
 v18mr423374wmc.23.1616427921525; 
 Mon, 22 Mar 2021 08:45:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3avifdnvlip5F/YWy/UMIOtTLtyeg56gDGEXxFaqtXmuaBYkeS+F3JKSXK+lzJMRsZTdn2Q==
X-Received: by 2002:a05:600c:4292:: with SMTP id
 v18mr423352wmc.23.1616427921319; 
 Mon, 22 Mar 2021 08:45:21 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id e17sm23852877wra.65.2021.03.22.08.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:45:20 -0700 (PDT)
Date: Mon, 22 Mar 2021 11:45:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/20] acpi: Set proper maximum size for "etc/acpi/rsdp" blob
Message-ID: <20210322154417.524229-20-mst@redhat.com>
References: <20210322154417.524229-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322154417.524229-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's also set a maximum size for "etc/acpi/rsdp", so the maximum
size doesn't get implicitly set based on the initial table size. In my
experiments, the table size was in the range of 22 bytes, so a single
page (== what we used until now) seems to be good enough.

Now that we have defined maximum sizes for all currently used table types,
let's assert that we catch usage with new tables that need a proper maximum
size definition.

Also assert that our initial size does not exceed the maximum size; while
qemu_ram_alloc_internal() properly asserts that the initial RAMBlock size
is <= its maximum size, the result might differ when the host page size
is bigger than 4k.

Suggested-by: Laszlo Ersek <lersek@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210304105554.121674-5-david@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/utils.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
index f2d69a6d92..0c486ea29f 100644
--- a/hw/acpi/utils.c
+++ b/hw/acpi/utils.c
@@ -29,14 +29,19 @@
 MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
                                 GArray *blob, const char *name)
 {
-    uint64_t max_size = 0;
+    uint64_t max_size;
 
     /* Reserve RAM space for tables: add another order of magnitude. */
     if (!strcmp(name, ACPI_BUILD_TABLE_FILE)) {
         max_size = 0x200000;
     } else if (!strcmp(name, ACPI_BUILD_LOADER_FILE)) {
         max_size = 0x10000;
+    } else if (!strcmp(name, ACPI_BUILD_RSDP_FILE)) {
+        max_size = 0x1000;
+    } else {
+        g_assert_not_reached();
     }
+    g_assert(acpi_data_len(blob) <= max_size);
 
     return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
                         name, update, opaque, NULL, true);
-- 
MST


