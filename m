Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4524052927A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:08:53 +0200 (CEST)
Received: from localhost ([::1]:39022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhxU-0007Mw-BL
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhg6-0004Tv-I6
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhg4-0006G2-3C
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1WJQYxlX7Z8W2tRqH3Y1o8xUJGVlIUo1fGgXDvXJL8=;
 b=Sp+qOCHFfMIc34Co1ORx+7ieiktU40LiWm1G7LEPFpYpShxaaNJ/M2j0bg0AXyzzwS1lt5
 d6yjzcpRXk4fH6sZyyaQz+I6s/yq3os0jIzdwreGRq6TAhpeH28BwaS8N4o61RQ+EuST2/
 iqFfhrNdUeyakWXJSfU0BnvHVl17ZxY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-jhPk39WjNvqE8KE2SKSBAw-1; Mon, 16 May 2022 16:50:49 -0400
X-MC-Unique: jhPk39WjNvqE8KE2SKSBAw-1
Received: by mail-ed1-f71.google.com with SMTP id
 s9-20020aa7c549000000b0042ab6ab62f0so1996984edr.14
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Z1WJQYxlX7Z8W2tRqH3Y1o8xUJGVlIUo1fGgXDvXJL8=;
 b=CKqNf8bEBh/YvdwGVd87zBLrC6DXNBU0MFzTRYQzPMhcZoZvqL4I9lBwEjrGAzo8rF
 Tp/51NWozQKz8KhsgPH+NiTPn2bQPJYlw+FLmYlMFF1ZKlxawd4LmcXMug4uFHwRHcN3
 Xl84PM0bkuggspbBW5XwSLYSdc45X4nBa00Muv58uhtIpC50NCELjJVjb7cwzTLu5yOH
 VNMHjpvMdIJAVhjoPjnuL/3E9r8YJtHZYfk/Lh0OsCJmcz0wavxiaaJqz+/AN9pIMi2M
 X52ka/n6J0df4yG+tR4F89BfgejGx80A0xbWuU6QhAY0SqLBbe059yzjUlniwWX4CdQI
 /cAA==
X-Gm-Message-State: AOAM533BYqowOa6NhFUSIYqCJqSQUKvTz2BJEstuc/ZdPXZiNyS2z4FK
 5SMGRYsDref/itJADFXRkk1FDihnIIe/XwNAEO1DY52foZBAzTZcms3xt5PYFKBu0auEY+rT7HO
 C5GyTuFJOJxaz7kooNWe1JcFl51OXVi21J//CLGA4MT9Sk8ukYR/gCg+SSeeH
X-Received: by 2002:a05:6402:354a:b0:427:d0e1:8ef3 with SMTP id
 f10-20020a056402354a00b00427d0e18ef3mr15283001edd.66.1652734248231; 
 Mon, 16 May 2022 13:50:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymuXVDFwebmmqSGso7/hdBPVFCngv3DtkLoloVye+C31DSU6ckavdWiIMn8l89aRhNIBAYzQ==
X-Received: by 2002:a05:6402:354a:b0:427:d0e1:8ef3 with SMTP id
 f10-20020a056402354a00b00427d0e18ef3mr15282982edd.66.1652734248011; 
 Mon, 16 May 2022 13:50:48 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 f14-20020a170906738e00b006f3ef214e26sm164832ejl.140.2022.05.16.13.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:50:47 -0700 (PDT)
Date: Mon, 16 May 2022 16:50:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 12/86] hw/cxl/device: Add log commands (8.2.9.4) + CEL
Message-ID: <20220516204913.542894-13-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
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

CXL specification provides for the ability to obtain logs from the
device. Logs are either spec defined, like the "Command Effects Log"
(CEL), or vendor specific. UUIDs are defined for all log types.

The CEL is a mechanism to provide information to the host about which
commands are supported. It is useful both to determine which spec'd
optional commands are supported, as well as provide a list of vendor
specified commands that might be used. The CEL is already created as
part of mailbox initialization, but here it is now exported to hosts
that use these log commands.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-11-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/cxl/cxl-mailbox-utils.c | 69 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 4584aa31f7..db473135c7 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -47,6 +47,9 @@ enum {
     TIMESTAMP   = 0x03,
         #define GET           0x0
         #define SET           0x1
+    LOGS        = 0x04,
+        #define GET_SUPPORTED 0x0
+        #define GET_LOG       0x1
 };
 
 /* 8.2.8.4.5.1 Command Return Codes */
@@ -147,6 +150,70 @@ static ret_code cmd_timestamp_set(struct cxl_cmd *cmd,
 
 static QemuUUID cel_uuid;
 
+/* 8.2.9.4.1 */
+static ret_code cmd_logs_get_supported(struct cxl_cmd *cmd,
+                                       CXLDeviceState *cxl_dstate,
+                                       uint16_t *len)
+{
+    struct {
+        uint16_t entries;
+        uint8_t rsvd[6];
+        struct {
+            QemuUUID uuid;
+            uint32_t size;
+        } log_entries[1];
+    } QEMU_PACKED *supported_logs = (void *)cmd->payload;
+    QEMU_BUILD_BUG_ON(sizeof(*supported_logs) != 0x1c);
+
+    supported_logs->entries = 1;
+    supported_logs->log_entries[0].uuid = cel_uuid;
+    supported_logs->log_entries[0].size = 4 * cxl_dstate->cel_size;
+
+    *len = sizeof(*supported_logs);
+    return CXL_MBOX_SUCCESS;
+}
+
+/* 8.2.9.4.2 */
+static ret_code cmd_logs_get_log(struct cxl_cmd *cmd,
+                                 CXLDeviceState *cxl_dstate,
+                                 uint16_t *len)
+{
+    struct {
+        QemuUUID uuid;
+        uint32_t offset;
+        uint32_t length;
+    } QEMU_PACKED QEMU_ALIGNED(16) *get_log = (void *)cmd->payload;
+
+    /*
+     * 8.2.9.4.2
+     *   The device shall return Invalid Parameter if the Offset or Length
+     *   fields attempt to access beyond the size of the log as reported by Get
+     *   Supported Logs.
+     *
+     * XXX: Spec is wrong, "Invalid Parameter" isn't a thing.
+     * XXX: Spec doesn't address incorrect UUID incorrectness.
+     *
+     * The CEL buffer is large enough to fit all commands in the emulation, so
+     * the only possible failure would be if the mailbox itself isn't big
+     * enough.
+     */
+    if (get_log->offset + get_log->length > cxl_dstate->payload_size) {
+        return CXL_MBOX_INVALID_INPUT;
+    }
+
+    if (!qemu_uuid_is_equal(&get_log->uuid, &cel_uuid)) {
+        return CXL_MBOX_UNSUPPORTED;
+    }
+
+    /* Store off everything to local variables so we can wipe out the payload */
+    *len = get_log->length;
+
+    memmove(cmd->payload, cxl_dstate->cel_log + get_log->offset,
+           get_log->length);
+
+    return CXL_MBOX_SUCCESS;
+}
+
 #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
 #define IMMEDIATE_POLICY_CHANGE (1 << 3)
 #define IMMEDIATE_LOG_CHANGE (1 << 4)
@@ -162,6 +229,8 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
         cmd_events_set_interrupt_policy, 4, IMMEDIATE_CONFIG_CHANGE },
     [TIMESTAMP][GET] = { "TIMESTAMP_GET", cmd_timestamp_get, 0, 0 },
     [TIMESTAMP][SET] = { "TIMESTAMP_SET", cmd_timestamp_set, 8, IMMEDIATE_POLICY_CHANGE },
+    [LOGS][GET_SUPPORTED] = { "LOGS_GET_SUPPORTED", cmd_logs_get_supported, 0, 0 },
+    [LOGS][GET_LOG] = { "LOGS_GET_LOG", cmd_logs_get_log, 0x18, 0 },
 };
 
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
-- 
MST


