Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6DB47622C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:50:58 +0100 (CET)
Received: from localhost ([::1]:47690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxaIj-0001Uy-Kh
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:50:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxaAG-0004k6-08
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:42:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxa9y-0006mT-MX
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:42:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639597307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8fkM3RzKN38Ml/3hwMhJ0HBNIBPBNdszQjmOJHoSID4=;
 b=jQ5pLL2cIfePxK5yTzPq1lIxEfyR5JZAweSiswIrW/wCp7p/3GWAkq1iycFaAtQKyjf5lR
 o1LPJnXiO5B5lH3LoEKeL5sAXA2TqxIOIIevgGF4YAEMUrvW0ozUlP9amhwgZzSSI04QV1
 rxtykwKYqCyQBXCi77t1NeQD7nqzr5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-wSdm1IExPf-ftpdyIFfPUQ-1; Wed, 15 Dec 2021 14:41:44 -0500
X-MC-Unique: wSdm1IExPf-ftpdyIFfPUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E09A18C8C02;
 Wed, 15 Dec 2021 19:41:43 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0231610074FD;
 Wed, 15 Dec 2021 19:41:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/25] python/qemu-ga-client: update instructions to newer
 CLI syntax
Date: Wed, 15 Dec 2021 14:39:20 -0500
Message-Id: <20211215193939.3768033-7-jsnow@redhat.com>
In-Reply-To: <20211215193939.3768033-1-jsnow@redhat.com>
References: <20211215193939.3768033-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Andrea Bolognani <abologna@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/qemu_ga_client.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/qemu/qmp/qemu_ga_client.py b/python/qemu/qmp/qemu_ga_client.py
index 67ac0b4211..b3e1d98c9e 100644
--- a/python/qemu/qmp/qemu_ga_client.py
+++ b/python/qemu/qmp/qemu_ga_client.py
@@ -5,7 +5,7 @@
 
 Start QEMU with:
 
-# qemu [...] -chardev socket,path=/tmp/qga.sock,server,wait=off,id=qga0 \
+# qemu [...] -chardev socket,path=/tmp/qga.sock,server=on,wait=off,id=qga0 \
   -device virtio-serial \
   -device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0
 
-- 
2.31.1


