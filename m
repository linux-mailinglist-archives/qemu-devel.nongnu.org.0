Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC323452EB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 00:19:31 +0100 (CET)
Received: from localhost ([::1]:38738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOTpa-0007GQ-9r
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 19:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTXR-0007Kj-Sq
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTXQ-0001MZ-1V
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616454041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=merc1D0xul3Ny+Jrf4XDcCdbekcd0CVvJdhC+IhKUGI=;
 b=bJXOdDsoqeD0EQ4tuMjYiiyWbjSmvXBUtKZVvlG5WxP4VCHOoru0ZV42fKH/Pgk6+pI3K6
 kBqK0gQEDkrgPNTR4imBbLhyVYOLBAgPfJqvUjtb6pvi57zhj7bAuTcOkz/6naXk8rKbLU
 kEeERrn4BqYjjOnH7LhbqG3fQQjFpbQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-6A8u07EENjKMRKa_8x30dg-1; Mon, 22 Mar 2021 19:00:39 -0400
X-MC-Unique: 6A8u07EENjKMRKa_8x30dg-1
Received: by mail-wr1-f71.google.com with SMTP id y5so158843wrp.2
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 16:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=merc1D0xul3Ny+Jrf4XDcCdbekcd0CVvJdhC+IhKUGI=;
 b=DTLi/VTmfmyZfQr4cPuDRcXphKZFu8/rwctI3dgK8O/EHPI+5FuQ+MIyxIjQ2wzWla
 vJRdfi9aqFWwKvzkoA5imZ4YP+21fjefVkfA3mPjkA2Wer27fSg1z1JH08erUke/LH/9
 NiY5lPTSVYcbS408Fs0FstfhxnHPCYzSE1CCDYGHf/BG+fm8u8CgHv5HtiMSBNUw2cVp
 T+psk3XkbQ3Z2OzIlx83gOwYFqf0LuamSABR3kGLqxIWgCJv99YGjywFrGBMw9onPRU4
 wDTVClpEXbXIQJGEX4SWDN2oYShXWUKhaz5+K/C8BU/iaxeEmpHQjkOQbGKd0tsFQUNd
 3kFg==
X-Gm-Message-State: AOAM531dcw8Vq6t5N6Ng6XuYQV8YjZ6T/7XHNwDviD6ez+qcmHwpuwT4
 nsbclYLUFIaSJmL62/KXr3areTkoymh2xZfoLJ8MWrRbN/aeRZblRSPePtyjpbGtLPXr7ATlSbx
 Ue9JtG2H2Xh9tKigMLJF/5OCpluMvth4oZkanN4YbyFYtlqb57IMzfspbjslN
X-Received: by 2002:a1c:9a47:: with SMTP id c68mr577794wme.63.1616454037829;
 Mon, 22 Mar 2021 16:00:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxH1oEJxVVjMqsdEb7i27VnHFsMIJZoafdc+02Hvuc414s4ZfqrG3NoCFtR+VtktrA57BQnqg==
X-Received: by 2002:a1c:9a47:: with SMTP id c68mr577769wme.63.1616454037550;
 Mon, 22 Mar 2021 16:00:37 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id x11sm814815wme.9.2021.03.22.16.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 16:00:37 -0700 (PDT)
Date: Mon, 22 Mar 2021 19:00:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 18/19] acpi: Set proper maximum size for "etc/acpi/rsdp" blob
Message-ID: <20210322225907.541943-19-mst@redhat.com>
References: <20210322225907.541943-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322225907.541943-1-mst@redhat.com>
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


