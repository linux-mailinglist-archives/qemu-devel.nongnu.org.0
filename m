Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BAE561073
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 07:05:11 +0200 (CEST)
Received: from localhost ([::1]:56956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6mMY-0002Wf-VH
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 01:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6mA3-0003JS-T9; Thu, 30 Jun 2022 00:52:16 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:47987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9z-00072V-7X; Thu, 30 Jun 2022 00:52:15 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id DD7C62B058DA;
 Thu, 30 Jun 2022 00:52:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 30 Jun 2022 00:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656564728; x=1656568328; bh=dT
 m7rZ8rzNQ7a1Zn1KFha3bDGRQnWQsIe5tXVAida7Q=; b=D4eDpQT2otRL+szcLe
 FmbLNGIIpy7BRL1q/7nWaJay7xkxm2Y+Cll2vDa1adz9CxGVpAOE3N+N76hBSgo7
 qhwEWLz2uTcndbAAQDRRty5RmHl3O9PQ00lOnHNMxydHYzHsC9iDaBC9BzmtWSwo
 HwBC0iR0Vh/VZ5Z1fbbUaXD9iXmD0Kzq6JXmlYXt9sqKTRa1saCSc6bwvE9z3T6x
 A50lq8jzWl93VOMIdIRJcY2sUVEA1c9hkbIbIJSnUpB2q4iLjKS83WbhbF9vE9nN
 6sOUVWWsWvp0JwDrJ/+j1SnnHFXazWqSudWSnGSao9ZFgYNeNQWY4EixRAAZdQ4G
 b0PA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656564728; x=1656568328; bh=dTm
 7rZ8rzNQ7a1Zn1KFha3bDGRQnWQsIe5tXVAida7Q=; b=e3Xx/pAZYE3L9LvweNJ
 uilSWVAV345kGdP2NjbEEmbsazMj02TQ05UjG23EWp4SE+8wW6fWv+6ajC99I6+2
 qsqAjXnNoxGqQXBpl22/lRC2rZZWiJPuHHqBOBZAlXcG1D5i53fJehdqTwhE9rdo
 CfA48ZZ+dYJX/WGp1jahUlzJf/YAnmhlKaAcBQIRROUxjr+2cRw1ZFAfhu19mhRr
 crGkdPg1CpYKiYV+OCsfmo6YwRY3/6xAN82cMJmqWRfjBmFM3uj5geLUpO+1ctWT
 mUv15jEmK31dLgNy97aI8Ec3zuKdsvc5keks7tdtpt+ayqDIrn7EhkM7iqRefa5I
 o+g==
X-ME-Sender: <xms:-Cu9YsCC83lRZyGha4wozHCatqsf8_e-RjdCH1AbWCqAmjbcSV6D4g>
 <xme:-Cu9YuhHHQXTzHkjJ7Mrc5ohJ45jBK_JdenF2VrC0K2cOe92Na3mqQ73rkJtjwXp-
 WvO_9SFnrFoeiVNKy0>
X-ME-Received: <xmr:-Cu9YvllUu3Yr2QZ-u88th4T8O0H9Ap7G5KkTuXVAZFc93yJr_HvQsIIn0L1kTyTlWX8q34trf8C38377iZZa-hy0XNlPHS5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpeektefhieevgfduvdeiueetteegtdeuueevieelffevueevveehhedukeejtdek
 teenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvg
 esphhjugdruggvvh
X-ME-Proxy: <xmx:-Cu9YiyNIkjSA2tGKTaiXgplfeRH4z9YX-M1XFQbjFNoxBzSb8_3pg>
 <xmx:-Cu9YhRoX0p80koPBcu4-B44K_j3QekZyATqoXQuX3Ah69iODKj30Q>
 <xmx:-Cu9Ytbkdy2buP9XxTlJcU9f8oRaS9N3vwv4dvxK2i0rhs9XTWlbVg>
 <xmx:-Cu9YsG-OrNe5d4z9ABuDWu6OyraJZZtdJx5QCbLMABnoOyucZgfODB4asQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 00:52:07 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v3 10/14] hw/sensor: Add Renesas ISL69259 device model
Date: Wed, 29 Jun 2022 21:51:29 -0700
Message-Id: <20220630045133.32251-11-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220630045133.32251-1-me@pjd.dev>
References: <20220630045133.32251-1-me@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=me@pjd.dev;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Peter Delevoryas <pdel@fb.com>

This adds the ISL69259, using all the same functionality as the existing
ISL69260 but overriding the IC_DEVICE_ID.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/sensor/isl_pmbus_vr.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
index 799ea9d89e..853d70536f 100644
--- a/hw/sensor/isl_pmbus_vr.c
+++ b/hw/sensor/isl_pmbus_vr.c
@@ -119,6 +119,18 @@ static void raa228000_exit_reset(Object *obj)
     pmdev->pages[0].read_temperature_3 = 0;
 }
 
+static void isl69259_exit_reset(Object *obj)
+{
+    ISLState *s = ISL69260(obj);
+    static const uint8_t ic_device_id[] = {0x04, 0x00, 0x81, 0xD2, 0x49, 0x3c};
+    g_assert_cmphex(sizeof(ic_device_id), <=, sizeof(s->ic_device_id));
+
+    isl_pmbus_vr_exit_reset(obj);
+
+    s->ic_device_id_len = sizeof(ic_device_id);
+    memcpy(s->ic_device_id, ic_device_id, sizeof(ic_device_id));
+}
+
 static void isl_pmbus_vr_add_props(Object *obj, uint64_t *flags, uint8_t pages)
 {
     PMBusDevice *pmdev = PMBUS_DEVICE(obj);
@@ -257,6 +269,21 @@ static void raa229004_class_init(ObjectClass *klass, void *data)
     isl_pmbus_vr_class_init(klass, data, 2);
 }
 
+static void isl69259_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->desc = "Renesas ISL69259 Digital Multiphase Voltage Regulator";
+    rc->phases.exit = isl69259_exit_reset;
+    isl_pmbus_vr_class_init(klass, data, 2);
+}
+
+static const TypeInfo isl69259_info = {
+    .name = TYPE_ISL69259,
+    .parent = TYPE_ISL69260,
+    .class_init = isl69259_class_init,
+};
+
 static const TypeInfo isl69260_info = {
     .name = TYPE_ISL69260,
     .parent = TYPE_PMBUS_DEVICE,
@@ -283,6 +310,7 @@ static const TypeInfo raa228000_info = {
 
 static void isl_pmbus_vr_register_types(void)
 {
+    type_register_static(&isl69259_info);
     type_register_static(&isl69260_info);
     type_register_static(&raa228000_info);
     type_register_static(&raa229004_info);
-- 
2.37.0


