Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2915291FD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 22:57:14 +0200 (CEST)
Received: from localhost ([::1]:41242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhmD-00052F-Ja
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 16:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhg0-0004TJ-JE
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhfx-0006Fc-Im
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EVeb92muGpGF+5fS1YTFGba+yxQKZdSBlvAWWWx2YjA=;
 b=djVNOr8MChITNaSewYtYr9gb1pgMFubzbhe/NPGR3zvDbl5xYj1xYgoeEZn72Wcxx4Aabr
 jYcpev7KfvUho18W0LUuABAEKWOTy652lk/9GffCr3HyWaiqgJHCBYOv9VkqgPsqqc5Di1
 BrgSZ7qVZexGkGviUtZWPtD0rTSCTCI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-slfbWLXWNeGtK0JiQRnruQ-1; Mon, 16 May 2022 16:50:44 -0400
X-MC-Unique: slfbWLXWNeGtK0JiQRnruQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 n7-20020a05640206c700b0042aaeb9d702so2913424edy.19
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EVeb92muGpGF+5fS1YTFGba+yxQKZdSBlvAWWWx2YjA=;
 b=fC/mURbJ1lkNL0JxPsDiDoGRd/sJKiOhRRpwDIsL4zTGlNaIQFN69uq05zLI3wrJ0u
 YX+h1bLkCDtU+Be35V1bUan8d249dcMgVREOM0QBJSDe6C5YK4fd5/i7kviO7hKWg6lX
 96/ikEUG35VLKsUTCUatCqod6NXMBSeq3chtHnuACYvbOmvNhaO1GBWYtwcKvj+aVC3L
 PlVGPwNXvOF1Ae8AgDzYAxfAoko7bYCdVAW5Sbt7j6UQhj7NG0ozG64+YVEzWV4f7KC1
 qqYRL3AdTJEW+u//P15AuYi/MddmZaSfDE34t68RfUOLJSaXiW/NNuOMt74E0XknZ5Z2
 EASg==
X-Gm-Message-State: AOAM53267c13DXAtVGayA6HPPxEadpOdBEP5oVP7Hw89o5f3tXEa9/nk
 EHxKm2Wd+YnyKPhX/VZpGFC+OsoNC1f9s/K/8Y7VA7aEOqGWA5psK/930ck0jfkgEZAO+qoVRZZ
 q0/P5TrwiVwYVYHUiQT2umM3hrmDOLyEszJly/AcSBF+7y9haDNBnfhdajCKT
X-Received: by 2002:a05:6402:354f:b0:418:849a:c66a with SMTP id
 f15-20020a056402354f00b00418849ac66amr15209379edd.234.1652734242652; 
 Mon, 16 May 2022 13:50:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDvS1UC9PXRaGs1Bl2trqHsue5REYSWo0ouNduH73mkrePKonmFsWtzL3gSEz+D6kdBKyQ5g==
X-Received: by 2002:a05:6402:354f:b0:418:849a:c66a with SMTP id
 f15-20020a056402354f00b00418849ac66amr15209355edd.234.1652734242355; 
 Mon, 16 May 2022 13:50:42 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 da12-20020a056402176c00b0042aaa626ac0sm3073226edb.38.2022.05.16.13.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:50:41 -0700 (PDT)
Date: Mon, 16 May 2022 16:50:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 10/86] hw/cxl/device: Add cheap EVENTS implementation
 (8.2.9.1)
Message-ID: <20220516204913.542894-11-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
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

From: Ben Widawsky <ben.widawsky@intel.com>

Using the previously implemented stubbed helpers, it is now possible to
easily add the missing, required commands to the implementation.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-9-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/cxl/cxl-mailbox-utils.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 2557f41f61..fb1f53f48e 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -38,6 +38,14 @@
  *  a register interface that already deals with it.
  */
 
+enum {
+    EVENTS      = 0x01,
+        #define GET_RECORDS   0x0
+        #define CLEAR_RECORDS   0x1
+        #define GET_INTERRUPT_POLICY   0x2
+        #define SET_INTERRUPT_POLICY   0x3
+};
+
 /* 8.2.8.4.5.1 Command Return Codes */
 typedef enum {
     CXL_MBOX_SUCCESS = 0x0,
@@ -93,9 +101,26 @@ struct cxl_cmd {
         return CXL_MBOX_SUCCESS;                                          \
     }
 
+DEFINE_MAILBOX_HANDLER_ZEROED(events_get_records, 0x20);
+DEFINE_MAILBOX_HANDLER_NOP(events_clear_records);
+DEFINE_MAILBOX_HANDLER_ZEROED(events_get_interrupt_policy, 4);
+DEFINE_MAILBOX_HANDLER_NOP(events_set_interrupt_policy);
+
 static QemuUUID cel_uuid;
 
-static struct cxl_cmd cxl_cmd_set[256][256] = {};
+#define IMMEDIATE_CONFIG_CHANGE (1 << 1)
+#define IMMEDIATE_LOG_CHANGE (1 << 4)
+
+static struct cxl_cmd cxl_cmd_set[256][256] = {
+    [EVENTS][GET_RECORDS] = { "EVENTS_GET_RECORDS",
+        cmd_events_get_records, 1, 0 },
+    [EVENTS][CLEAR_RECORDS] = { "EVENTS_CLEAR_RECORDS",
+        cmd_events_clear_records, ~0, IMMEDIATE_LOG_CHANGE },
+    [EVENTS][GET_INTERRUPT_POLICY] = { "EVENTS_GET_INTERRUPT_POLICY",
+        cmd_events_get_interrupt_policy, 0, 0 },
+    [EVENTS][SET_INTERRUPT_POLICY] = { "EVENTS_SET_INTERRUPT_POLICY",
+        cmd_events_set_interrupt_policy, 4, IMMEDIATE_CONFIG_CHANGE },
+};
 
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
 {
-- 
MST


