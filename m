Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE5B5282BD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 12:59:43 +0200 (CEST)
Received: from localhost ([::1]:45710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYRy-0006RQ-N5
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 06:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6O-0006wG-Cg
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6K-0005NE-Vq
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EEgSR6tbca74I2wlIJXCuwDC2wn22ybNhlG/UtFK7+0=;
 b=cYsZiM3b2aTaJjF6SvITaBAaZ/a2dx1rsdz3Li8VGA1HnHLygJRh/WcJjg2XN/TWPiNP0m
 zrvBVc5yO78w/xpp0YaXlLnPlaUAu0gJWa0HLmZHFFWABtQ6+E1CoJJ1Qv1y+yAso2JcrR
 ZjfBQzP4myC4tbIhetyAAfI7baTkodc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-g9CdfnHWOdGo82ZvXKoAdA-1; Mon, 16 May 2022 06:37:18 -0400
X-MC-Unique: g9CdfnHWOdGo82ZvXKoAdA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v124-20020a1cac82000000b003948b870a8dso10155073wme.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EEgSR6tbca74I2wlIJXCuwDC2wn22ybNhlG/UtFK7+0=;
 b=b/c/8zv/kP68qPjaPV7maApdGx0GVPRealKCuXdMNAAeYSrTs2LPJ/B5dEBt4QgApX
 ZbeQPZM9hztsmjipF8F9MH3wPZSk1jZ+zUIF8ubE2BOYq3GAtDKSbGKMX7VHNO4hj9fa
 Zl8sHHNKWS/wH2sNj4a4Eh0t22dSzzmlTGFpXCD20i3NAwqUniXKuNLwp/HyiA/3oU8l
 kt3lebc72qmmFlWXt5a+3W5moe3BiS2ez/+V3o+TvN4li6kbrXBLkHZe47MyenXzWQWa
 4/OHdI3BTuy7ZBlilJl4f8uI6kmtY8Ttar18xaE5LIq8BnGxAsFp0W14zoUej3wI1wO4
 HCrw==
X-Gm-Message-State: AOAM532P4Ug6ebuBC1y8jX9GOHt3B8+aaEjjgi9HjDsNqGjaCQXoSSZW
 0LUSAomxykHX6up/4kweqHyDyvx4T4p5rRq76bd9SMgG5oINz9Dn6a3223/n3EORke/aIiK7WC5
 3zLIYb5Se80J5mIX4kqEMbeHCVDflIImj2lK6SZvj+BazpYcvmRD6N7RCsH26
X-Received: by 2002:a7b:c156:0:b0:395:b669:5c83 with SMTP id
 z22-20020a7bc156000000b00395b6695c83mr25178063wmi.141.1652697437353; 
 Mon, 16 May 2022 03:37:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGgxAcWdYRtN+KszuMDa+nnv4bElk25NjXAT31a4pm61qVKZ9bFNRo+18YGRYI9cWSssH9Xw==
X-Received: by 2002:a7b:c156:0:b0:395:b669:5c83 with SMTP id
 z22-20020a7bc156000000b00395b6695c83mr25178043wmi.141.1652697437128; 
 Mon, 16 May 2022 03:37:17 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c510f00b003970eea5a21sm1270836wms.40.2022.05.16.03.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:37:16 -0700 (PDT)
Date: Mon, 16 May 2022 06:37:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 28/91] hw/cxl/component: Add utils for interleave parameter
 encoding/decoding
Message-ID: <20220516095448.507876-29-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Jonathan Cameron <jonathan.cameron@huawei.com>

Both registers and the CFMWS entries in CDAT use simple encodings
for the number of interleave ways and the interleave granularity.
Introduce simple conversion functions to/from the unencoded
number / size.  So far the iw decode has not been needed so is
it not implemented.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-27-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_component.h |  8 ++++++++
 hw/cxl/cxl-component-utils.c   | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index 7d8f395cbe..4f69688c47 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -210,4 +210,12 @@ static inline int cxl_decoder_count_enc(int count)
     return 0;
 }
 
+uint8_t cxl_interleave_ways_enc(int iw, Error **errp);
+uint8_t cxl_interleave_granularity_enc(uint64_t gran, Error **errp);
+
+static inline hwaddr cxl_decode_ig(int ig)
+{
+    return 1 << (ig + 8);
+}
+
 #endif
diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
index afc97b17c2..69cb07171c 100644
--- a/hw/cxl/cxl-component-utils.c
+++ b/hw/cxl/cxl-component-utils.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qapi/error.h"
 #include "hw/pci/pci.h"
 #include "hw/cxl/cxl.h"
 
@@ -329,3 +330,36 @@ void cxl_component_create_dvsec(CXLComponentState *cxl,
     range_init_nofail(&cxl->dvsecs[type], cxl->dvsec_offset, length);
     cxl->dvsec_offset += length;
 }
+
+uint8_t cxl_interleave_ways_enc(int iw, Error **errp)
+{
+    switch (iw) {
+    case 1: return 0x0;
+    case 2: return 0x1;
+    case 4: return 0x2;
+    case 8: return 0x3;
+    case 16: return 0x4;
+    case 3: return 0x8;
+    case 6: return 0x9;
+    case 12: return 0xa;
+    default:
+        error_setg(errp, "Interleave ways: %d not supported", iw);
+        return 0;
+    }
+}
+
+uint8_t cxl_interleave_granularity_enc(uint64_t gran, Error **errp)
+{
+    switch (gran) {
+    case 256: return 0;
+    case 512: return 1;
+    case 1024: return 2;
+    case 2048: return 3;
+    case 4096: return 4;
+    case 8192: return 5;
+    case 16384: return 6;
+    default:
+        error_setg(errp, "Interleave granularity: %" PRIu64 " invalid", gran);
+        return 0;
+    }
+}
-- 
MST


