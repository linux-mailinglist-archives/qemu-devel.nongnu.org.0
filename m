Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172385748A7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:24:29 +0200 (CEST)
Received: from localhost ([::1]:56046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBv5A-0005qp-2v
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk4-0005At-MC
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBujr-0005xH-Tw
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tjKHpLIVumBSTxBZ1CWWpToSuqh+RlvwbX3C7GG0ObQ=;
 b=QgVBIt1g5cl5mPFGHyf68paZhz+7Hz4fhY903IjY9pWBc3O8xUOX/MAUhDGtq603B6DOMB
 f2BGC/wnaYgOYZnGyCjmzStPZFHG02fT9s6NvNc1AM2ENmrA+s/WncVEjKYgjM1OtbAaaG
 d2y1rmQWer825fzdO3h7n6frXgJ8yWU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-GkAc2az2MkGxoD1G15uZWw-1; Thu, 14 Jul 2022 05:02:26 -0400
X-MC-Unique: GkAc2az2MkGxoD1G15uZWw-1
Received: by mail-ej1-f72.google.com with SMTP id
 qk18-20020a1709077f9200b0072b95d9eea3so502294ejc.4
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tjKHpLIVumBSTxBZ1CWWpToSuqh+RlvwbX3C7GG0ObQ=;
 b=hFdC7O/E7OUCOoI10fMxbnP7unvepo4NFS/7XBYlt7bRqmYcB7yzNp1RLDbRd1wJZR
 5t2Vwca1TzIPsyhbjsJ6lb1u/LYdRpd5qT43KS2sAdZWi/5y08WXWFeUwFgdo+hnuW9z
 gSrDSjtyQviTTBB6QloX4nhqRoiqsyV1PLiBQVO8qPx9ocxqT5r9NjMYWK8mityNnCh+
 a+1aUWqHzwk2ds6tczUmKfcbwhXVU/G80hXtY8cFNuIakuCmZg4XpTJMIqHmOQiM/Tku
 ZSbu97BSSMCZYaXUVf5nli7V1NmeWCGb0mBTRRW58wlFnBb4J0RvUBVgS8cxhCXGCQBs
 +u1g==
X-Gm-Message-State: AJIora9rHE8doGsHIqT5yoUWXEiJsHpAjNnsS33yvJCVDFAhVTqBdUfK
 at/UvI8yP2ADYJV2ANZWRx0OHFw003pPSqDrCqrQSII6zvk+hFZ9Vlf4e1Aq+7Eq3KduBdFLGyo
 iXvsDEqlxBf8PgSHAR1GBk1GONXsu0szDfq3iHoPuWgMb0i8V9vIYJacMPGRB9i912c4=
X-Received: by 2002:a05:6402:4490:b0:43a:8f5a:d273 with SMTP id
 er16-20020a056402449000b0043a8f5ad273mr10737285edb.6.1657789344737; 
 Thu, 14 Jul 2022 02:02:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uydJ1sfoyQ0mun/nraehcbkOVcOd0rDHiQCD2dtvRWFgXLeNvA+6kLKKPdC2Q5qm3gQS155A==
X-Received: by 2002:a05:6402:4490:b0:43a:8f5a:d273 with SMTP id
 er16-20020a056402449000b0043a8f5ad273mr10737255edb.6.1657789344492; 
 Thu, 14 Jul 2022 02:02:24 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 uh40-20020a170906b3a800b0072ab06bc3b5sm456732ejc.34.2022.07.14.02.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 06/20] scsi-disk: add new quirks bitmap to SCSIDiskState
Date: Thu, 14 Jul 2022 11:01:57 +0200
Message-Id: <20220714090211.304305-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714090211.304305-1-pbonzini@redhat.com>
References: <20220714090211.304305-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Since the MacOS SCSI implementation is quite old (and Apple added some firmware
customisations to their drives for m68k Macs) there is need to add a mechanism
to correctly handle Apple-specific quirks.

Add a new quirks bitmap to SCSIDiskState that can be used to enable these
features as required.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220622105314.802852-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 91acb5c0ce..55c19fb25d 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -94,6 +94,7 @@ struct SCSIDiskState {
     uint16_t port_index;
     uint64_t max_unmap_size;
     uint64_t max_io_size;
+    uint32_t quirks;
     QEMUBH *bh;
     char *version;
     char *serial;
-- 
2.36.1



