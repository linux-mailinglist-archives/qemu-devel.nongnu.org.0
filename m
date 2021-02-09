Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6815E314A6E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:38:02 +0100 (CET)
Received: from localhost ([::1]:50968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OX3-0008D3-E8
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NW4-0005Z9-Q1; Tue, 09 Feb 2021 02:32:58 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:34213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVw-0005qv-7p; Tue, 09 Feb 2021 02:32:56 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id BC21DA63;
 Tue,  9 Feb 2021 02:32:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=i2JhrZXZQeq69
 zTzTBqqEtslyBCsXFFg3yf6lX+7Hrs=; b=Y4L5CvcBv2C8IRhEJSAurnpsm5Ypu
 zFxw+bg6gU0qCj8yOvjBJF8KGRXoIdIN/+ro9AVxbq/4z7B0mN2SBAzaXwvj69vI
 HAjDl8MVmfh4NMcKLrrBJ51/WvLa0QH5Eh8H2z6cyaTfE6wxoXECKmaAvxX8brEs
 CEbv1n1qGhjcArYcL4Eg2SgwqxHVfWhxIokQfEjzGZkgk+8BGYPEeeZGUfzRJ/2+
 92NYs5UPIV0f75LE9/ZiCeSFUVBT17KjKQ9XT4RdEYLS2dfLdkE8+MK+jqW6iJHI
 N6PaE5fcXoteX20q2RjGbDEF8fhNTXR65jGYjit50o/5p8vOFXkpP1NGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=i2JhrZXZQeq69zTzTBqqEtslyBCsXFFg3yf6lX+7Hrs=; b=snquU9kQ
 950K0RDdjEcoDdNiFnodYFa/EF8OtVBiGv0jXh5s8gXsLPWL4H67MQ3f/b3kaKeQ
 HLBBm8TPOHxdVWn8owU/poZ/wLMEEsNtf9xVTdFqi2W5SrdVtjbmjefKfE3di0Qi
 Z3SwcUvVWOQpvd6oBvV9pJAXXHv8yTbtDXbGrM/xE6+RbOV30SSu7eqbfIzrkQrD
 SqbdxzM6OKu32hzvw4DmKNDg6b4FtwCyJoFsOkKA+1na0q02xtoof3aJEi5gWlF4
 x7KVPkJXlyJtNr9jocWk4iJP8RbJ+l5hLsDOoY8BEGPzt7txG+QkzjCF/hAYBZwE
 ndtjnz8Kl2bUCw==
X-ME-Sender: <xms:hDoiYGowxEXWr1BpsmmrYLToiSgML_oK8nnjxmqSGEbkVJN9QkBpVA>
 <xme:hDoiYEr1tc2RKEZFEPu1Fhr8YHVrM2dlDmDBmU0uwzhI3w1VhOQli5UHwSe91eAut
 vdD9nzOBSjCDZl77Wk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedutd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:hDoiYLNEclR6my7L6hgYQdhlNczw4DO8ce3kRlF6iLk-w5JjyQoZCw>
 <xmx:hDoiYF5-R3LqiNbTWhnjPDJggVFP1p-ne9dL1RQH6-fGKwYHXF_1tw>
 <xmx:hDoiYF4G5SKN-3W5RlL8wWMRuF75A8Xhqb2SuQD3Wg7BZjXZQuiPbg>
 <xmx:hDoiYPu_V843iHrsmh8XtorAGQ83SqVhvcossFIhI71hYj-LhOOzVaSt-1A>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E4BEC108005F;
 Tue,  9 Feb 2021 02:32:18 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 37/56] hw/block/nvme: trigger async event during injecting
 smart warning
Date: Tue,  9 Feb 2021 08:30:42 +0100
Message-Id: <20210209073101.548811-38-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 zhenwei pi <pizhenwei@bytedance.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhenwei pi <pizhenwei@bytedance.com>

During smart critical warning injection by setting property from QMP
command, also try to trigger asynchronous event.

Suggested by Keith, if a event has already been raised, there is no
need to enqueue the duplicate event any more.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
[k.jensen: fix typo in commit message]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h |  1 +
 hw/block/nvme.c      | 48 +++++++++++++++++++++++++++++++++++++-------
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 88af3b42348c..854fb2abb6f8 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -784,6 +784,7 @@ typedef struct QEMU_PACKED NvmeSmartLog {
     uint8_t     reserved2[320];
 } NvmeSmartLog;
 
+#define NVME_SMART_WARN_MAX     6
 enum NvmeSmartWarn {
     NVME_SMART_SPARE                  = 1 << 0,
     NVME_SMART_TEMPERATURE            = 1 << 1,
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f0cb7acd7454..09eb1f06e8b1 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -980,6 +980,35 @@ static void nvme_enqueue_event(NvmeCtrl *n, uint8_t event_type,
     nvme_process_aers(n);
 }
 
+static void nvme_smart_event(NvmeCtrl *n, uint8_t event)
+{
+    uint8_t aer_info;
+
+    /* Ref SPEC <Asynchronous Event Information 0x2013 SMART / Health Status> */
+    if (!(NVME_AEC_SMART(n->features.async_config) & event)) {
+        return;
+    }
+
+    switch (event) {
+    case NVME_SMART_SPARE:
+        aer_info = NVME_AER_INFO_SMART_SPARE_THRESH;
+        break;
+    case NVME_SMART_TEMPERATURE:
+        aer_info = NVME_AER_INFO_SMART_TEMP_THRESH;
+        break;
+    case NVME_SMART_RELIABILITY:
+    case NVME_SMART_MEDIA_READ_ONLY:
+    case NVME_SMART_FAILED_VOLATILE_MEDIA:
+    case NVME_SMART_PMR_UNRELIABLE:
+        aer_info = NVME_AER_INFO_SMART_RELIABILITY;
+        break;
+    default:
+        return;
+    }
+
+    nvme_enqueue_event(n, NVME_AER_TYPE_SMART, aer_info, NVME_LOG_SMART_INFO);
+}
+
 static void nvme_clear_events(NvmeCtrl *n, uint8_t event_type)
 {
     n->aer_mask &= ~(1 << event_type);
@@ -3317,12 +3346,9 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
             return NVME_INVALID_FIELD | NVME_DNR;
         }
 
-        if (((n->temperature >= n->features.temp_thresh_hi) ||
-             (n->temperature <= n->features.temp_thresh_low)) &&
-            NVME_AEC_SMART(n->features.async_config) & NVME_SMART_TEMPERATURE) {
-            nvme_enqueue_event(n, NVME_AER_TYPE_SMART,
-                               NVME_AER_INFO_SMART_TEMP_THRESH,
-                               NVME_LOG_SMART_INFO);
+        if ((n->temperature >= n->features.temp_thresh_hi) ||
+            (n->temperature <= n->features.temp_thresh_low)) {
+            nvme_smart_event(n, NVME_AER_INFO_SMART_TEMP_THRESH);
         }
 
         break;
@@ -4446,7 +4472,7 @@ static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
     NvmeCtrl *n = NVME(obj);
-    uint8_t value, cap = 0;
+    uint8_t value, old_value, cap = 0, index, event;
 
     if (!visit_type_uint8(v, name, &value, errp)) {
         return;
@@ -4464,7 +4490,15 @@ static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    old_value = n->smart_critical_warning;
     n->smart_critical_warning = value;
+
+    /* only inject new bits of smart critical warning */
+    for (index = 0; index < NVME_SMART_WARN_MAX; index++) {
+        event = 1 << index;
+        if (value & ~old_value & event)
+            nvme_smart_event(n, event);
+    }
 }
 
 static const VMStateDescription nvme_vmstate = {
-- 
2.30.0


