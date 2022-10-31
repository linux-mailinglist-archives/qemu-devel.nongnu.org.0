Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCE4613720
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:56:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIf-0003iP-0K; Mon, 31 Oct 2022 08:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIb-0003YL-N2
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIZ-0003MW-T5
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c/cLew8bMa1wxPGKcVwPToMwd5hFO5px9x2lp9qcZKA=;
 b=MbV1J9TjWt5YbEG0Rd5Be3dxMiUc22Tfv0H25IN3G6NvY3735c/AOGtIYb+e+ZlWR/6YR2
 WWOOGy/My/6lhw2ysbaHIpGqzEpp/DxFydg12S9bMkvdRFSDG2RSr/DShNdZqR4YM0awHj
 RNQo/etgyACoeMBvW1t2+LBIQGoLNTM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-g2-vWA3GNIWF0TtUkqURbg-1; Mon, 31 Oct 2022 08:53:50 -0400
X-MC-Unique: g2-vWA3GNIWF0TtUkqURbg-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg21-20020a05600c3c9500b003c2acbff422so5706266wmb.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/cLew8bMa1wxPGKcVwPToMwd5hFO5px9x2lp9qcZKA=;
 b=TUhbIoYTahaz74hEMQJ7XIse98OROeVMJKo+ciDtKcIqLQbpnShZflKUlDb3uuWqKT
 xOkJRVBPX+jNNt+TJ+RFs6i036vUkAQI2szvv1mmGvi2Bwle3kakxhY3XDai10kIk331
 ZGRqbN+w6Fc0A/e6pkVOSZ7twEf4RpDMQ3K3dkJ6Y58HOpyNBpQUMXkZlSxUQgu6gMeL
 K8mfJ/p2bNtLI8L2VeBWd7tLkKK6n1scSzDCnh7MqmbXo/Ts05Ws5Cqhv4LOQ3861OQ1
 tNgJs6pP4UUa+5kdG9ZXtt5UeNiOvXmIwOoTR2l1mtkX1jbhA03WiwR+0k5mEVhgslGw
 SZBQ==
X-Gm-Message-State: ACrzQf23BUeNjwqCV8V1+ZBCefSrODVvC3q12cMHpbK5n8VdS1Txk1Hz
 vGepzXnbeyKw6fYrh+lHWp5bC319nY0sZiUoPHsL0nR3x9jp3t532UbkCFem4pBX67yb4goM2+P
 89+2uEVIxyeT0ZppSi9HcKn47efe/a0FXSqK62CQiD1ofPEbCGBC0UDlHqJ0D
X-Received: by 2002:adf:e64e:0:b0:236:76a9:446 with SMTP id
 b14-20020adfe64e000000b0023676a90446mr8171077wrn.696.1667220828894; 
 Mon, 31 Oct 2022 05:53:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Dd9kConTrFjQVNrfqiFp2L0MdfQEP0Ks+recq8QnqkgmskH0KevmD6fL9MZAtwEuP9+eOLg==
X-Received: by 2002:adf:e64e:0:b0:236:76a9:446 with SMTP id
 b14-20020adfe64e000000b0023676a90446mr8171061wrn.696.1667220828643; 
 Mon, 31 Oct 2022 05:53:48 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 f16-20020a05600c4e9000b003cf568a736csm5262812wmq.20.2022.10.31.05.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:48 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Christian A. Ehrhardt" <lk@c--e.de>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-stable@nongnu.org,
 Eric DeVolder <eric.devolder@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 65/86] hw/acpi/erst.c: Fix memory handling issues
Message-ID: <20221031124928.128475-66-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: "Christian A. Ehrhardt" <lk@c--e.de>

- Fix memset argument order: The second argument is
  the value, the length goes last.
- Fix an integer overflow reported by Alexander Bulekov.

Both issues allow the guest to overrun the host buffer
allocated for the ERST memory device.

Cc: Eric DeVolder <eric.devolder@oracle.com
Cc: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-stable@nongnu.org
Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
Message-Id: <20221024154233.1043347-1-lk@c--e.de>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1268
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/erst.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index df856b2669..aefcc03ad6 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -635,7 +635,7 @@ static unsigned read_erst_record(ERSTDeviceState *s)
         if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
             rc = STATUS_FAILED;
         }
-        if ((s->record_offset + record_length) > exchange_length) {
+        if (record_length > exchange_length - s->record_offset) {
             rc = STATUS_FAILED;
         }
         /* If all is ok, copy the record to the exchange buffer */
@@ -684,7 +684,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
     if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
         return STATUS_FAILED;
     }
-    if ((s->record_offset + record_length) > exchange_length) {
+    if (record_length > exchange_length - s->record_offset) {
         return STATUS_FAILED;
     }
 
@@ -716,7 +716,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
     if (nvram) {
         /* Write the record into the slot */
         memcpy(nvram, exchange, record_length);
-        memset(nvram + record_length, exchange_length - record_length, 0xFF);
+        memset(nvram + record_length, 0xFF, exchange_length - record_length);
         /* If a new record, increment the record_count */
         if (!record_found) {
             uint32_t record_count;
-- 
MST


