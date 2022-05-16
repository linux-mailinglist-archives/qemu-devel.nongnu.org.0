Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6F45282B0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 12:56:50 +0200 (CEST)
Received: from localhost ([::1]:38344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYPB-0001HL-Br
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 06:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5Q-000613-C3
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5M-0005BP-83
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IFG9Wcb2I+Dwof4JoAiK8doNzqoFhr25ibITD6Homqo=;
 b=WJvgSWepGdbxx0bkTtZOF9l3eoASNqOO4nGlCZ2CrQZYvLK9nlSu9orFqPcAGLmgFX5ubp
 4Pg2KXqMg+ZbWJRf34lZ4X16+bdT6oMAIeLLM8khGrYCFeGJpFwAqF6RVWdHjstd9oDuUE
 XV/byumq3w7HBRvZSYP33b+Z4wf2KCQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-VbMUz2-mOpW164Mw3GIvtg-1; Mon, 16 May 2022 06:36:17 -0400
X-MC-Unique: VbMUz2-mOpW164Mw3GIvtg-1
Received: by mail-wr1-f69.google.com with SMTP id
 s16-20020adfeb10000000b0020cc4e5e683so3800778wrn.6
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IFG9Wcb2I+Dwof4JoAiK8doNzqoFhr25ibITD6Homqo=;
 b=uJSVDpV9l0c5fSEpJbxVuWuYNncvLjW18Ieo1OEsKifBzr39Rkigmk169mhG6r8X9v
 foyKoSGysT8AD6bgHrG40DH7Ea+yvqMX1Ag+4Fhw8HGyBa3iBYpHQ/MDv8K5Jn9aLKc4
 rHtn/PXpYAI61yDSHZFwJ+DmNbl6+gQ10tfU3qrY9N5BhBwv+PXcRcL0oXPc/ZKgDvl/
 MdDYDMfvLk3Cddt1MJAein3TPSz94Kq6fhQVK48xCXR+CcTMurIS/6ZCIQwefi2tgFP7
 66J7jc4hlOPZRW8DPE5a4rTpqShGQXU41OaI8hqVwcFk4fkewvqebyOgU/oPCEcTju31
 WMyQ==
X-Gm-Message-State: AOAM533vY2PZWvQnlhDCGhAnc+NwgvMts4BeNSvsNSjZXI9J873a02aO
 pPgmbiL+ueL5C/vkxdTb1Gt6Ul+tHG7BEQtVIMX5QoTh25qrln9qc0oWJG4xNmHdbKTfOMssagq
 y3bXph4WjBN5zAr0zaz7v4KEaMu0stn1bAGlCKeG0BXzCiIlDhjGWr2xvfUph
X-Received: by 2002:a5d:5887:0:b0:20c:83c9:b72 with SMTP id
 n7-20020a5d5887000000b0020c83c90b72mr13582625wrf.588.1652697376255; 
 Mon, 16 May 2022 03:36:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWQoOeV9UJK3JOykUanwleO4b1I407FmfTqXTrdEqSxlXdOyIAl/Oq64O/Cf33WhOKGMRB/w==
X-Received: by 2002:a5d:5887:0:b0:20c:83c9:b72 with SMTP id
 n7-20020a5d5887000000b0020c83c90b72mr13582600wrf.588.1652697375997; 
 Mon, 16 May 2022 03:36:15 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 d9-20020adfc089000000b0020cf071a168sm8662890wrf.29.2022.05.16.03.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:36:15 -0700 (PDT)
Date: Mon, 16 May 2022 06:36:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 11/91] hw/cxl/device: Timestamp implementation (8.2.9.3)
Message-ID: <20220516095448.507876-12-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

Errata F4 to CXL 2.0 clarified the meaning of the timer as the
sum of the value set with the timestamp set command and the number
of nano seconds since it was last set.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-10-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_device.h |  6 ++++++
 hw/cxl/cxl-mailbox-utils.c  | 42 +++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 954205653e..797a22ddb4 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -111,6 +111,12 @@ typedef struct cxl_device_state {
         size_t cel_size;
     };
 
+    struct {
+        bool set;
+        uint64_t last_set;
+        uint64_t host_set;
+    } timestamp;
+
     /* memory region for persistent memory, HDM */
     uint64_t pmem_size;
 } CXLDeviceState;
diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index fb1f53f48e..4584aa31f7 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -44,6 +44,9 @@ enum {
         #define CLEAR_RECORDS   0x1
         #define GET_INTERRUPT_POLICY   0x2
         #define SET_INTERRUPT_POLICY   0x3
+    TIMESTAMP   = 0x03,
+        #define GET           0x0
+        #define SET           0x1
 };
 
 /* 8.2.8.4.5.1 Command Return Codes */
@@ -106,9 +109,46 @@ DEFINE_MAILBOX_HANDLER_NOP(events_clear_records);
 DEFINE_MAILBOX_HANDLER_ZEROED(events_get_interrupt_policy, 4);
 DEFINE_MAILBOX_HANDLER_NOP(events_set_interrupt_policy);
 
+/* 8.2.9.3.1 */
+static ret_code cmd_timestamp_get(struct cxl_cmd *cmd,
+                                  CXLDeviceState *cxl_dstate,
+                                  uint16_t *len)
+{
+    uint64_t time, delta;
+    uint64_t final_time = 0;
+
+    if (cxl_dstate->timestamp.set) {
+        /* First find the delta from the last time the host set the time. */
+        time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        delta = time - cxl_dstate->timestamp.last_set;
+        final_time = cxl_dstate->timestamp.host_set + delta;
+    }
+
+    /* Then adjust the actual time */
+    stq_le_p(cmd->payload, final_time);
+    *len = 8;
+
+    return CXL_MBOX_SUCCESS;
+}
+
+/* 8.2.9.3.2 */
+static ret_code cmd_timestamp_set(struct cxl_cmd *cmd,
+                                  CXLDeviceState *cxl_dstate,
+                                  uint16_t *len)
+{
+    cxl_dstate->timestamp.set = true;
+    cxl_dstate->timestamp.last_set = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+
+    cxl_dstate->timestamp.host_set = le64_to_cpu(*(uint64_t *)cmd->payload);
+
+    *len = 0;
+    return CXL_MBOX_SUCCESS;
+}
+
 static QemuUUID cel_uuid;
 
 #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
+#define IMMEDIATE_POLICY_CHANGE (1 << 3)
 #define IMMEDIATE_LOG_CHANGE (1 << 4)
 
 static struct cxl_cmd cxl_cmd_set[256][256] = {
@@ -120,6 +160,8 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
         cmd_events_get_interrupt_policy, 0, 0 },
     [EVENTS][SET_INTERRUPT_POLICY] = { "EVENTS_SET_INTERRUPT_POLICY",
         cmd_events_set_interrupt_policy, 4, IMMEDIATE_CONFIG_CHANGE },
+    [TIMESTAMP][GET] = { "TIMESTAMP_GET", cmd_timestamp_get, 0, 0 },
+    [TIMESTAMP][SET] = { "TIMESTAMP_SET", cmd_timestamp_set, 8, IMMEDIATE_POLICY_CHANGE },
 };
 
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
-- 
MST


