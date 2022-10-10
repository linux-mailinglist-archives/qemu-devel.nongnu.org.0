Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D9A5FA381
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:42:05 +0200 (CEST)
Received: from localhost ([::1]:58776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxj2-00077d-GR
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdk-00055n-O4
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwde-0007c8-Gt
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FyepswVi7aJ7F+kxJMGvV8mkdvSxEu9CCU92Vf0iWNw=;
 b=SEEjDAW1XaOTp3IyR4nAn7nG9S/B2mXSFkE+3H4kk718LO7tPuLe5pyT20mGpxZZhoWLok
 XpsWh9xYwDL/NAdDcK842FajCC+sTjnskX92sOoAVufBo/ERkRQlljfEzUWyNeK96axYRb
 9tr6+MeZMqOaYZKV4i+4SQXQR6d8TiY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-54-fhFyGLd5M1e-BRgFe_TZPA-1; Mon, 10 Oct 2022 13:32:24 -0400
X-MC-Unique: fhFyGLd5M1e-BRgFe_TZPA-1
Received: by mail-wm1-f70.google.com with SMTP id
 g8-20020a05600c4ec800b003b4bcbdb63cso7289492wmq.7
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FyepswVi7aJ7F+kxJMGvV8mkdvSxEu9CCU92Vf0iWNw=;
 b=BpbQ/4ifDfJXLBGoB4gudbLow42SxH0+ZMJllF3G9AmQohqZGsSjETmkW4haFMc0Jb
 OM/YIqL7KbVTi0WAWZ8NMkjWQASJQss/+NMttoiw/stvhIe9HPDWj9aXVrahzuE6V+BN
 vhspIrAoiyHvTcslV5xZc2RVcHG+FyUqcOx9wZzt9m/VNOmcR0Od1hikXb5VHxw337qk
 S2fWocorViFGMdY6afRu+/+LUTFjpnwBfzfrEKtZoL/nUbCgw0e3ztaHN/yTRVbjfTpn
 XzFT5QjBjU8CkCsAwfnIS17IHdol+lO5bLQdnBwkwTuBVrWCL/V+7Z208xx5Rqq/7ivA
 xzzA==
X-Gm-Message-State: ACrzQf0zFXbjJz6pANVsjicTLD+ws3IBjhmpl0PzhwQ8oWm9TnvnCURv
 ahHnU6Vbt10MTPyET1FG2fy+eEisDLXHyWxVx6HUdA/3zQ0BexwfnRqdd4OPA0WN34hXY8g3Xy8
 7NOJcKiNgpO7HCpTRNONburZ5DGG1bS8soFOtI1zksD681fIB5zT5Ga6Iq3Fj
X-Received: by 2002:a05:600c:474c:b0:3c5:dbf4:ba94 with SMTP id
 w12-20020a05600c474c00b003c5dbf4ba94mr5825668wmo.21.1665423143171; 
 Mon, 10 Oct 2022 10:32:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM54flTNZofEMFbmhyNJf71aGYC1xrJLLcksaQlDrwmZot+4lLYFnQ3DGATl64Eabm3aRr1BDg==
X-Received: by 2002:a05:600c:474c:b0:3c5:dbf4:ba94 with SMTP id
 w12-20020a05600c474c00b003c5dbf4ba94mr5825651wmo.21.1665423142929; 
 Mon, 10 Oct 2022 10:32:22 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 w5-20020a5d6805000000b002285f73f11dsm11818334wru.81.2022.10.10.10.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:32:22 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:32:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 49/55] tests: acpi: whitelist pc/q35 DSDT before moving _ADR
 field
Message-ID: <20221010172813.204597-50-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-12-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..1983fa596b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,15 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.multi-bridge",
-- 
MST


