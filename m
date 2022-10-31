Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8DD61372A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:58:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIY-0003Cp-V3; Mon, 31 Oct 2022 08:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIM-0002B4-T2
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIK-0003Ew-9Z
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h/XlP9KQaz9Sdj8a6OxlbRsUZL7f47hL0wOEmFmZTnk=;
 b=LIGyxSS6lmY7X1WSmsRR5wTbtXHB9shpX/f2oASf5YBP6bNWc8/9QMA960ejnFA6crMdr0
 TyiYPYMp9FpTRO79OV2BJzGu47fQ5XRk2CtAp28lfXOhHoF8izeFaVar8NHX5Co0CrZ4A/
 Zhqg/IeYYAUZGakZS8GK1wlrKJPtffQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-dQxR7QdWNmeuOgp3iBz4oQ-1; Mon, 31 Oct 2022 08:53:33 -0400
X-MC-Unique: dQxR7QdWNmeuOgp3iBz4oQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 83-20020a1c0256000000b003cf758f1617so199711wmc.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h/XlP9KQaz9Sdj8a6OxlbRsUZL7f47hL0wOEmFmZTnk=;
 b=pPpyzhSdUPLcTX9ZKxZ8xBAJ87G5U80mpIJHupVh6VKkkEUUfAxD8wgMdSEds6L1sl
 s3zhf1Bv5irwqzhQbX2cYUoE8UN5HSihNd+deUVcmq0hkBruG5iGtRkiBWLNmN2rGWTy
 u/xJ7XLQ8Kw782L8node3hkOa/mgRdblKrgAhwTp6ab+CCOZigNmo04UmRwavMLfDDGt
 N3EfupuD4L037uuBUqlXSz0nTQA0aZ384bgcqgsgO0crEQ89eEGIbkdW2HlRSL+49kvK
 bJm0b1J86mJ8SkPhpuE7blgQ1GC++7aAb3hcxhmUkblY7jN2CLul/YKnbQvvODlzgwCB
 a22g==
X-Gm-Message-State: ACrzQf0xDXbLkLmmj5xSj6BytRsLoWf6cL51xGRHoTcpp0yNWR1C4KwB
 6wiXICvQEDiqULoBNYpL8vkRLwNjk4GHInOzqV+gV98yPkcmRRoRgkBrOkxr0RUocKOpqYSwy7L
 iuzCGLe+sjbm/jvQaOWqEXezdu41x3f1xzHna5Kt5acgeNhCSm8l/NtUYGXYX
X-Received: by 2002:a05:6000:a11:b0:236:7685:e7 with SMTP id
 co17-20020a0560000a1100b00236768500e7mr8310784wrb.359.1667220812135; 
 Mon, 31 Oct 2022 05:53:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4g7YWtRm3Pg8SCY6F7F3lUabJtombeGK3EXSlmAlnfQZB9uoXl9qQnEzaSDbqXWQAEXq89Ng==
X-Received: by 2002:a05:6000:a11:b0:236:7685:e7 with SMTP id
 co17-20020a0560000a1100b00236768500e7mr8310768wrb.359.1667220811838; 
 Mon, 31 Oct 2022 05:53:31 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 w24-20020a1cf618000000b003cf4d99fd2asm7186583wmc.6.2022.10.31.05.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:31 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 59/86] acpi: add get_dev_aml_func() helper
Message-ID: <20221031124928.128475-60-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

It will be used in followup commits to figure out if
device has it's own, device specific AML block.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221017102146.2254096-7-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 include/hw/acpi/acpi_aml_interface.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/hw/acpi/acpi_aml_interface.h b/include/hw/acpi/acpi_aml_interface.h
index ab76f0e55d..436da069d6 100644
--- a/include/hw/acpi/acpi_aml_interface.h
+++ b/include/hw/acpi/acpi_aml_interface.h
@@ -29,11 +29,20 @@ struct AcpiDevAmlIfClass {
     dev_aml_fn build_dev_aml;
 };
 
-static inline void call_dev_aml_func(DeviceState *dev, Aml *scope)
+static inline dev_aml_fn get_dev_aml_func(DeviceState *dev)
 {
     if (object_dynamic_cast(OBJECT(dev), TYPE_ACPI_DEV_AML_IF)) {
         AcpiDevAmlIfClass *klass = ACPI_DEV_AML_IF_GET_CLASS(dev);
-        klass->build_dev_aml(ACPI_DEV_AML_IF(dev), scope);
+        return klass->build_dev_aml;
+    }
+    return NULL;
+}
+
+static inline void call_dev_aml_func(DeviceState *dev, Aml *scope)
+{
+    dev_aml_fn fn = get_dev_aml_func(dev);
+    if (fn) {
+        fn(ACPI_DEV_AML_IF(dev), scope);
     }
 }
 
-- 
MST


