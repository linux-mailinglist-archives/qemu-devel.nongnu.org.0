Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C9A3AC2C9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 07:12:56 +0200 (CEST)
Received: from localhost ([::1]:33936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu6oJ-0000Vh-7m
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 01:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6YF-0006jv-2D
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:56:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6YB-0004xT-VL
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623992175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x2Na7nuQwlpXv3laK5ONyMsKbyRncyxXdx8y9K78YrM=;
 b=cZ3d80ud044RLkRfo8XQlslAluuqBCcEu15ww6s4wGqWGsQpOoAqDaaXGf0FNemkMPUcb5
 se4G+fzAilJl05haSF4yTtsFOt34vN99qfLLDHCHvpHvLdNQ3rBKxVTn2wUcTyJ1LdnWgE
 3kLZqSBP1x8I8Bgnhpje41iRONh3FHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-SVADxBykPxOftQFGTEM8KA-1; Fri, 18 Jun 2021 00:56:14 -0400
X-MC-Unique: SVADxBykPxOftQFGTEM8KA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C471010C1ADC;
 Fri, 18 Jun 2021 04:56:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 864195D6AC;
 Fri, 18 Jun 2021 04:55:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 187CD180354F; Fri, 18 Jun 2021 06:53:55 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/24] accel: add qtest module annotations
Date: Fri, 18 Jun 2021 06:53:50 +0200
Message-Id: <20210618045353.2510174-22-kraxel@redhat.com>
In-Reply-To: <20210618045353.2510174-1-kraxel@redhat.com>
References: <20210618045353.2510174-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Peter Lieven <pl@kamp.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add module annotations for qtest so autoloading works.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 accel/qtest/qtest.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index edb29f6fa4c0..7e6b8110d52b 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -45,6 +45,7 @@ static const TypeInfo qtest_accel_type = {
     .parent = TYPE_ACCEL,
     .class_init = qtest_accel_class_init,
 };
+module_obj(TYPE_QTEST_ACCEL);
 
 static void qtest_accel_ops_class_init(ObjectClass *oc, void *data)
 {
@@ -61,6 +62,7 @@ static const TypeInfo qtest_accel_ops_type = {
     .class_init = qtest_accel_ops_class_init,
     .abstract = true,
 };
+module_obj(ACCEL_OPS_NAME("qtest"));
 
 static void qtest_type_init(void)
 {
-- 
2.31.1


