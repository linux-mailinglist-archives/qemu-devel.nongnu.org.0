Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A20506610
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:38:23 +0200 (CEST)
Received: from localhost ([::1]:42560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngiRK-0005pn-5O
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmJ-0001Fk-3X
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:52:00 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmG-0004YZ-Vg
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:54 -0400
Received: by mail-wr1-x435.google.com with SMTP id x18so13071955wrc.0
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AkY7l6kDlxHzcFVn0UcLaqWXKAyzRmfLqqlDT52LKgo=;
 b=XnPibxV+b43qbAeDOsHb2itrJ4VrWgunFjvYUtxzVpeHNT4qMiQiX5DWzHEbSv4Jdh
 OwFK3dutfaeduvEQ26/bo1gr0eJi16ng2FM/bcEJSGimDo7QEdaLyd1muc4pxepCNakV
 5k3qChfcHkOa8Ikb+evwCbFOoAGc02FDcEXx6zpGPQfDUrqTWyn/oJozPe09BqcE4UUq
 +IgPu3QPe3AWCP8KoFR0kAWHE8E2h0ROsb3CKt7VR+9c2HqWo8tF/EwyakwPaLLSPBnq
 IWdyCg2XTtloZKEUGIjfRgGDrWFttYyF29pQJXTZtPFMTWATIqXL7KU4H6LQRK81IIA/
 8agA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AkY7l6kDlxHzcFVn0UcLaqWXKAyzRmfLqqlDT52LKgo=;
 b=mHxdkdggiFdhQ/OcKiEINdpnb0YTfGxrSkT5A1Po+FdosWhNR8KQBEhLvU6jBFFQQ+
 cdnUO0zeeqO6Q3WndTNd5M/UcGzeKG1xu4rKWw7/oGDWx27j0+MAaXtDNxcOzNzJRx25
 rJ7IEd/E8vFFGEIoLmzvX8yLPX1ISAhpzDGIV1pMteXSFBd+MxxCRSWY3h0g6ZYrDgQ9
 RI4wvgs8uQy5D+oh1P4j/fkO5+qYyA0cfLj5/1TauaOeaHMfB2js5qbPNYORM9ojIQix
 u8BFHdxO9wOtX2SXeAdAAJMyHNPMncRso8YK1J01aluReBzwPaRej9ZfXTFGy4/U8aRM
 4cHA==
X-Gm-Message-State: AOAM531qEWblrPl9ggOrcfK77OC56gyWubzgAtOnoST94qqQI5Iar2sV
 UEgYqzRdh6NexxAHJivOuSxRqJ9o0fpQyw==
X-Google-Smtp-Source: ABdhPJyrUeeDxgnS2q7wOjsFb8rFlwNbtCXATGojwBa75MwKuwXR9VN84TVygjw+dVVKtsia5OzwxQ==
X-Received: by 2002:a05:6000:1f15:b0:207:afd5:44ab with SMTP id
 bv21-20020a0560001f1500b00207afd544abmr10450209wrb.478.1650347511784; 
 Mon, 18 Apr 2022 22:51:51 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 45/53] hyperv: Add definitions for syndbg
Date: Tue, 19 Apr 2022 07:51:01 +0200
Message-Id: <20220419055109.142788-46-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jon Doron <arilou@gmail.com>

Add all required definitions for hyperv synthetic debugger interface.

Signed-off-by: Jon Doron <arilou@gmail.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220216102500.692781-3-arilou@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/hyperv/hyperv-proto.h | 52 ++++++++++++++++++++++++++++++++
 target/i386/kvm/hyperv-proto.h   | 37 +++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/include/hw/hyperv/hyperv-proto.h b/include/hw/hyperv/hyperv-proto.h
index 21dc28aee9..4a2297307b 100644
--- a/include/hw/hyperv/hyperv-proto.h
+++ b/include/hw/hyperv/hyperv-proto.h
@@ -24,12 +24,17 @@
 #define HV_STATUS_INVALID_PORT_ID             17
 #define HV_STATUS_INVALID_CONNECTION_ID       18
 #define HV_STATUS_INSUFFICIENT_BUFFERS        19
+#define HV_STATUS_NOT_ACKNOWLEDGED            20
+#define HV_STATUS_NO_DATA                     27
 
 /*
  * Hypercall numbers
  */
 #define HV_POST_MESSAGE                       0x005c
 #define HV_SIGNAL_EVENT                       0x005d
+#define HV_POST_DEBUG_DATA                    0x0069
+#define HV_RETRIEVE_DEBUG_DATA                0x006a
+#define HV_RESET_DEBUG_SESSION                0x006b
 #define HV_HYPERCALL_FAST                     (1u << 16)
 
 /*
@@ -127,4 +132,51 @@ struct hyperv_event_flags_page {
     struct hyperv_event_flags slot[HV_SINT_COUNT];
 };
 
+/*
+ * Kernel debugger structures
+ */
+
+/* Options flags for hyperv_reset_debug_session */
+#define HV_DEBUG_PURGE_INCOMING_DATA        0x00000001
+#define HV_DEBUG_PURGE_OUTGOING_DATA        0x00000002
+struct hyperv_reset_debug_session_input {
+    uint32_t options;
+} __attribute__ ((__packed__));
+
+struct hyperv_reset_debug_session_output {
+    uint32_t host_ip;
+    uint32_t target_ip;
+    uint16_t host_port;
+    uint16_t target_port;
+    uint8_t host_mac[6];
+    uint8_t target_mac[6];
+} __attribute__ ((__packed__));
+
+/* Options for hyperv_post_debug_data */
+#define HV_DEBUG_POST_LOOP                  0x00000001
+
+struct hyperv_post_debug_data_input {
+    uint32_t count;
+    uint32_t options;
+    /*uint8_t data[HV_HYP_PAGE_SIZE - 2 * sizeof(uint32_t)];*/
+} __attribute__ ((__packed__));
+
+struct hyperv_post_debug_data_output {
+    uint32_t pending_count;
+} __attribute__ ((__packed__));
+
+/* Options for hyperv_retrieve_debug_data */
+#define HV_DEBUG_RETRIEVE_LOOP              0x00000001
+#define HV_DEBUG_RETRIEVE_TEST_ACTIVITY     0x00000002
+
+struct hyperv_retrieve_debug_data_input {
+    uint32_t count;
+    uint32_t options;
+    uint64_t timeout;
+} __attribute__ ((__packed__));
+
+struct hyperv_retrieve_debug_data_output {
+    uint32_t retrieved_count;
+    uint32_t remaining_count;
+} __attribute__ ((__packed__));
 #endif
diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index 89f81afda7..e40e59411c 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -19,6 +19,9 @@
 #define HV_CPUID_ENLIGHTMENT_INFO             0x40000004
 #define HV_CPUID_IMPLEMENT_LIMITS             0x40000005
 #define HV_CPUID_NESTED_FEATURES              0x4000000A
+#define HV_CPUID_SYNDBG_VENDOR_AND_MAX_FUNCTIONS    0x40000080
+#define HV_CPUID_SYNDBG_INTERFACE                   0x40000081
+#define HV_CPUID_SYNDBG_PLATFORM_CAPABILITIES       0x40000082
 #define HV_CPUID_MIN                          0x40000005
 #define HV_CPUID_MAX                          0x4000ffff
 #define HV_HYPERVISOR_PRESENT_BIT             0x80000000
@@ -55,8 +58,14 @@
 #define HV_GUEST_IDLE_STATE_AVAILABLE           (1u << 5)
 #define HV_FREQUENCY_MSRS_AVAILABLE             (1u << 8)
 #define HV_GUEST_CRASH_MSR_AVAILABLE            (1u << 10)
+#define HV_FEATURE_DEBUG_MSRS_AVAILABLE         (1u << 11)
 #define HV_STIMER_DIRECT_MODE_AVAILABLE         (1u << 19)
 
+/*
+ * HV_CPUID_FEATURES.EBX bits
+ */
+#define HV_PARTITION_DEBUGGING_ALLOWED          (1u << 12)
+
 /*
  * HV_CPUID_ENLIGHTMENT_INFO.EAX bits
  */
@@ -72,6 +81,11 @@
 #define HV_ENLIGHTENED_VMCS_RECOMMENDED     (1u << 14)
 #define HV_NO_NONARCH_CORESHARING           (1u << 18)
 
+/*
+ * HV_CPUID_SYNDBG_PLATFORM_CAPABILITIES.EAX bits
+ */
+#define HV_SYNDBG_CAP_ALLOW_KERNEL_DEBUGGING    (1u << 1)
+
 /*
  * Basic virtualized MSRs
  */
@@ -130,6 +144,18 @@
 #define HV_X64_MSR_STIMER3_CONFIG               0x400000B6
 #define HV_X64_MSR_STIMER3_COUNT                0x400000B7
 
+/*
+ * Hyper-V Synthetic debug options MSR
+ */
+#define HV_X64_MSR_SYNDBG_CONTROL               0x400000F1
+#define HV_X64_MSR_SYNDBG_STATUS                0x400000F2
+#define HV_X64_MSR_SYNDBG_SEND_BUFFER           0x400000F3
+#define HV_X64_MSR_SYNDBG_RECV_BUFFER           0x400000F4
+#define HV_X64_MSR_SYNDBG_PENDING_BUFFER        0x400000F5
+#define HV_X64_MSR_SYNDBG_OPTIONS               0x400000FF
+
+#define HV_X64_SYNDBG_OPTION_USE_HCALLS         BIT(2)
+
 /*
  * Guest crash notification MSRs
  */
@@ -168,5 +194,16 @@
 
 #define HV_STIMER_COUNT                       4
 
+/*
+ * Synthetic debugger control definitions
+ */
+#define HV_SYNDBG_CONTROL_SEND              (1u << 0)
+#define HV_SYNDBG_CONTROL_RECV              (1u << 1)
+#define HV_SYNDBG_CONTROL_SEND_SIZE(ctl)    ((ctl >> 16) & 0xffff)
+#define HV_SYNDBG_STATUS_INVALID            (0)
+#define HV_SYNDBG_STATUS_SEND_SUCCESS       (1u << 0)
+#define HV_SYNDBG_STATUS_RECV_SUCCESS       (1u << 2)
+#define HV_SYNDBG_STATUS_RESET              (1u << 3)
+#define HV_SYNDBG_STATUS_SET_SIZE(st, sz)   (st | (sz << 16))
 
 #endif
-- 
2.35.1



