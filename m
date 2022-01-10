Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47ED48A3BE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:37:50 +0100 (CET)
Received: from localhost ([::1]:52968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n74EY-0001UR-1q
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:37:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n748j-0004Qe-ND
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:31:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n748h-0000H7-UN
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:31:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TNwWEgLA0yVEeTZP9l3mzoxTrUEAxmq2lgb74pBHN/Q=;
 b=Tkjy3O1KVI6vwf3s5RrbiYhYqJCk9tIBYVgnTsDDCBWYFCG0UaOQGyd0OpQe7tWOLr3TwU
 q7Yv3dMpM3n0s0D0kaF3+H5dj8hVZNU03dJuNFt1c8CZVjLTo8ERscgmYLEn5CJOQKJhTo
 oKUBT+uSLRUBRmmahrqfB6a9sRBmMiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-9YTrVPyONt2rfeoxd448Pw-1; Mon, 10 Jan 2022 18:31:43 -0500
X-MC-Unique: 9YTrVPyONt2rfeoxd448Pw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B172A81CCB6;
 Mon, 10 Jan 2022 23:31:42 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87FD17B028;
 Mon, 10 Jan 2022 23:31:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/31] python/qemu-ga-client: don't use deprecated CLI
 syntax in usage comment
Date: Mon, 10 Jan 2022 18:28:50 -0500
Message-Id: <20220110232910.1923864-12-jsnow@redhat.com>
In-Reply-To: <20220110232910.1923864-1-jsnow@redhat.com>
References: <20220110232910.1923864-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cleanup related to commit ccd3b3b8112b670f, "qemu-option: warn for
short-form boolean options".

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


