Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBED3449F5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:58:06 +0100 (CET)
Received: from localhost ([::1]:33696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMwP-00026P-NC
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMkI-0005Yv-Cv
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:45:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMk6-0007J7-VB
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616427921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O4vqGfb2i17YT6os5zDjVTW0i/dLw5b+0ylbQ52D+3s=;
 b=eMDqYtouY98mj3ggTFaNkK1RNXfNjzWJ7ZbudUmm3KixLdHSnOSTaENmolRmK257gMlvAm
 KFNbvc521U+lCVqLd4O6ODWsCLeRwE3Cc/xru3UtsJT9P61XOe4pRoTq8pVB+VLVYWF9/M
 6oAA79Tjuxoxf9erjGMF1+yjYPiq2Fc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-JwmqJ2viPHWU89KzYNBVxQ-1; Mon, 22 Mar 2021 11:45:17 -0400
X-MC-Unique: JwmqJ2viPHWU89KzYNBVxQ-1
Received: by mail-wr1-f69.google.com with SMTP id h5so26257090wrr.17
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O4vqGfb2i17YT6os5zDjVTW0i/dLw5b+0ylbQ52D+3s=;
 b=O4lHOpGgMhFRaQuqDd0fK0XHZSNMPE9OC0azDAbMMMtrA3mvd0TdRNtAK4GvaqonUW
 K6zJb1TA5e7SHF5X2q8GLvWQf8+iwDUI0iKLz42lixGp8oH67NlYpJOI25zPtAa/R0tM
 yghMASIbhQQkG+bp0vdEfdzf6Kzr9ui8kKXPlcckgJXX7XbVxe7jLkn3g9eb2HBKkpVn
 GOj2HkuI6RxDjivf6vamcCteHvMHWBOlq2LhnO1psBSgiUOD48aMp/1Ep2dW5KGrUQFa
 hDmlJ8XYx/Sr/V9WDTWMN/S/FHObfdAh+m5b2gCEyO7NeerXFQBs64BOqUpE7Np4l/+b
 3RmA==
X-Gm-Message-State: AOAM532rmr7Ii3bJ+S8MbRXvAFIfXhDRTfDypqkItO5PFOpQz5Qk+nEU
 yuY+Dox7wYciCnOqBmRrAKYRZ2OzXws9UYOp+mi1fgB0bMykIQ+AgZCTNN+x7lKkUgPeuvewK4y
 l3cfSGGUWscfZQwRlKjeWOxOTd3/0Eft3VE5GCrplmyNlAoRd6JAz2biEuXjl
X-Received: by 2002:a1c:8005:: with SMTP id b5mr445911wmd.130.1616427916242;
 Mon, 22 Mar 2021 08:45:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFn4OdnHoKFp6haiCiNpyfLEjVvRQfAyJlraeDmuzvJH2pdyJZBS9Kmh5kisYJrt+jOz8k4Q==
X-Received: by 2002:a1c:8005:: with SMTP id b5mr445885wmd.130.1616427916043;
 Mon, 22 Mar 2021 08:45:16 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id q19sm16703754wmc.44.2021.03.22.08.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:45:15 -0700 (PDT)
Date: Mon, 22 Mar 2021 11:45:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/20] microvm: Don't open-code "etc/table-loader"
Message-ID: <20210322154417.524229-18-mst@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's just reuse ACPI_BUILD_LOADER_FILE.

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
Message-Id: <20210304105554.121674-3-david@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-microvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 01f1945ac1..502aac0ba2 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -255,7 +255,7 @@ void acpi_setup_microvm(MicrovmMachineState *mms)
                       ACPI_BUILD_TABLE_MAX_SIZE);
     acpi_add_rom_blob(acpi_build_no_update, NULL,
                       tables.linker->cmd_blob,
-                      "etc/table-loader", ACPI_BUILD_LOADER_MAX_SIZE);
+                      ACPI_BUILD_LOADER_FILE, ACPI_BUILD_LOADER_MAX_SIZE);
     acpi_add_rom_blob(acpi_build_no_update, NULL,
                       tables.rsdp,
                       ACPI_BUILD_RSDP_FILE, 0);
-- 
MST


