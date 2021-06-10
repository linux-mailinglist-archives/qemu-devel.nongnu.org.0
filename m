Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA1E3A2C94
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:12:25 +0200 (CEST)
Received: from localhost ([::1]:53386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKTw-0001lj-77
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrKSY-0000lo-NU
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:10:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrKSW-00064l-QU
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623330656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3m4bOvYnmUCVtlNeznHWszna0xnox4X3aw4WbVLR5g=;
 b=GsU0wKIRwzocRscrGyL2DX3VUXUzt9Dh30hL8PWuntefsbi/KiDpJoz2HI7DNCmHtRFYkT
 W6oPlev9wvZrKjuf0qEAOg7pETIVlKl/9fyYhTpLpH9sRWqXds36/nsY2rBT8XolQPt099
 kohlQRpoleeLrJPYMKiXGWed+VHOUR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-EOA_tOoYMPOi05tbectEJg-1; Thu, 10 Jun 2021 09:10:55 -0400
X-MC-Unique: EOA_tOoYMPOi05tbectEJg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5D6580364C;
 Thu, 10 Jun 2021 13:10:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85D05690EF;
 Thu, 10 Jun 2021 13:10:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A808018000B2; Thu, 10 Jun 2021 15:10:44 +0200 (CEST)
Date: Thu, 10 Jun 2021 15:10:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
Message-ID: <20210610131044.32iioustv7vev4p5@sirius.home.kraxel.org>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <4a1a23af-461f-92c4-d9f0-1f8133d611db@suse.de>
 <20210610122305.zxdaqsft5evcrli6@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210610122305.zxdaqsft5evcrli6@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, jose.ziviani@suse.com, pbonzini@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Build qtest modular on top of that was easy, patch below.
> 
> I'm not convinced though that the approach will work for other
> accelerators too given that they have dependencies to directories
> outside accel/ ...

Oh, it depends on how high you hang the tcg modularization bar.

Building only the tcg accel ops as module is easy too, but that
of course leaves a large chunk of tcg linked into qemu itself.

take care,
  Gerd

From 8062aabd26f12bd8199b43c631a3aba8f195183e Mon Sep 17 00:00:00 2001
From: Gerd Hoffmann <kraxel@redhat.com>
Date: Thu, 10 Jun 2021 14:48:20 +0200
Subject: [PATCH] modules: build tcg accel modular
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's not all of tcg, only the accel ops, but its a start 😊

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 accel/accel-softmmu.c     | 2 +-
 accel/tcg/tcg-accel-ops.c | 2 ++
 accel/tcg/meson.build     | 6 ++++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
index 50fa5acaa401..67276e4f5222 100644
--- a/accel/accel-softmmu.c
+++ b/accel/accel-softmmu.c
@@ -72,7 +72,7 @@ void accel_init_ops_interfaces(AccelClass *ac)
     g_assert(ac_name != NULL);
 
     ops_name = g_strdup_printf("%s" ACCEL_OPS_SUFFIX, ac_name);
-    ops = ACCEL_OPS_CLASS(object_class_by_name(ops_name));
+    ops = ACCEL_OPS_CLASS(module_object_class_by_name(ops_name));
     g_free(ops_name);
 
     /*
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 7191315aeed4..432a76d2ea29 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -124,9 +124,11 @@ static const TypeInfo tcg_accel_ops_type = {
     .class_init = tcg_accel_ops_class_init,
     .abstract = true,
 };
+module_obj("tcg-accel-ops"); // FIXME: use ACCEL_OPS_NAME
 
 static void tcg_accel_ops_register_types(void)
 {
     type_register_static(&tcg_accel_ops_type);
 }
 type_init(tcg_accel_ops_register_types);
+module_arch(TARGET_NAME);
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 1236ac7b910b..0362b1bd5918 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -15,8 +15,14 @@ specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'cputlb.c',
+))
+
+tcg_module_ss = ss.source_set()
+tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'tcg-accel-ops.c',
   'tcg-accel-ops-mttcg.c',
   'tcg-accel-ops-icount.c',
   'tcg-accel-ops-rr.c'
 ))
+
+accel_modules += {'tcg': tcg_module_ss }
-- 
2.31.1


