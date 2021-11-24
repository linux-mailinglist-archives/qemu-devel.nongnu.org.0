Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530D045CD38
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:30:29 +0100 (CET)
Received: from localhost ([::1]:42324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpxyL-0006dG-Rg
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:30:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxv6-0003S2-JR
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxv4-0007bS-Oq
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637782020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8fkM3RzKN38Ml/3hwMhJ0HBNIBPBNdszQjmOJHoSID4=;
 b=EJ3El0hecyo3gpTeNEP2S97VPPICtJoUVOH/fCCm8aWw3s34ehI0/OLzmgcAL/dtdYziPn
 piGG1Dalm6ahPZU2cDHLMyCVlEO6vcth0mTPMdOIgxz25XzEZin98ER2t5Z3n67eHERk/S
 3ucSAQOBDiPZ7y7aTMAC0t1YTv8jOoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-uKRenrfkMhiApUhOC5a5pg-1; Wed, 24 Nov 2021 14:26:57 -0500
X-MC-Unique: uKRenrfkMhiApUhOC5a5pg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C2A685B68E;
 Wed, 24 Nov 2021 19:26:53 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 196087E656;
 Wed, 24 Nov 2021 19:26:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/23] python/qemu-ga-client: update instructions to newer CLI
 syntax
Date: Wed, 24 Nov 2021 14:25:59 -0500
Message-Id: <20211124192617.3396403-6-jsnow@redhat.com>
In-Reply-To: <20211124192617.3396403-1-jsnow@redhat.com>
References: <20211124192617.3396403-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
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


