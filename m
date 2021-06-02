Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD8639852C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:22:18 +0200 (CEST)
Received: from localhost ([::1]:48022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loN4r-00026P-5Z
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1loN0X-00020R-RR
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:17:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1loN0V-0002Ec-AB
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:17:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622625466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8HVkjQbly3dsiItgADM//9yMkxJsBU/36GStGQA/SeE=;
 b=cJPNNnEqJtbDf6R/cWILwPzR6ntq5ZlQXs37ysEf2zQl4pRRdL3v9lr0AoQpqSsy8R08JM
 W6BxQukFivfPcoc165kooNNcOT9Fwmm6SSaK6JPQm+qDMYX68RaAYaxx9ev7yaTWZznH90
 d1+4YK3Aq0Xl2Ngi0y1Ma+UojVng8oM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-l0GHYeiHPvuZX4hz2Y3Y4g-1; Wed, 02 Jun 2021 05:17:43 -0400
X-MC-Unique: l0GHYeiHPvuZX4hz2Y3Y4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CDA9BBEE7;
 Wed,  2 Jun 2021 09:17:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E24AC1037EA5;
 Wed,  2 Jun 2021 09:17:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BA78E1800900; Wed,  2 Jun 2021 11:17:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] chardev module annotations
Date: Wed,  2 Jun 2021 11:17:22 +0200
Message-Id: <20210602091727.1023563-5-kraxel@redhat.com>
In-Reply-To: <20210602091727.1023563-1-kraxel@redhat.com>
References: <20210602091727.1023563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, armbru@redhat.com,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 chardev/baum.c  | 1 +
 chardev/spice.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/chardev/baum.c b/chardev/baum.c
index 5deca778bc44..79d618e35045 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -680,6 +680,7 @@ static const TypeInfo char_braille_type_info = {
     .instance_finalize = char_braille_finalize,
     .class_init = char_braille_class_init,
 };
+module_obj(TYPE_CHARDEV_BRAILLE);
 
 static void register_types(void)
 {
diff --git a/chardev/spice.c b/chardev/spice.c
index 1104426e3a11..3ffb3fdc0dac 100644
--- a/chardev/spice.c
+++ b/chardev/spice.c
@@ -366,6 +366,7 @@ static const TypeInfo char_spice_type_info = {
     .class_init = char_spice_class_init,
     .abstract = true,
 };
+module_obj(TYPE_CHARDEV_SPICE);
 
 static void char_spicevmc_class_init(ObjectClass *oc, void *data)
 {
@@ -396,6 +397,7 @@ static const TypeInfo char_spiceport_type_info = {
     .parent = TYPE_CHARDEV_SPICE,
     .class_init = char_spiceport_class_init,
 };
+module_obj(TYPE_CHARDEV_SPICEPORT);
 
 static void register_types(void)
 {
@@ -405,3 +407,5 @@ static void register_types(void)
 }
 
 type_init(register_types);
+
+module_dep("ui-spice-core");
-- 
2.31.1


