Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0619F496898
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 01:17:35 +0100 (CET)
Received: from localhost ([::1]:39068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB462-0000aH-50
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 19:17:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3yZ-0000HX-Fw
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:09:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3yV-0005Am-Ui
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642810186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TqrUwrZCzAHjq29PwyfAh0VNX9QK4TDT66xeiit3jt4=;
 b=Kf7dsBaf1ODT4ahfbkDc6Fc0Fp4NwVPXwmF7c/aA+P7/0U9i4LKRMt+13ITRv6cLeFJYDi
 VOC/RwAaiq3rfL2bBA33PJpwM5df03iENeNvKxnJDzn0L45EX2bIrW3mnVqjtXuzyUD5lq
 nLGKHNu0NOdgOihmAtqFwS+I4Rh7GRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-OGPvifbhNHaa-gDcycfMEA-1; Fri, 21 Jan 2022 19:09:44 -0500
X-MC-Unique: OGPvifbhNHaa-gDcycfMEA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ACEA1083F61;
 Sat, 22 Jan 2022 00:09:43 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6972D66E1B;
 Sat, 22 Jan 2022 00:09:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/17] python/aqmp: fix docstring typo
Date: Fri, 21 Jan 2022 19:09:17 -0500
Message-Id: <20220122000931.536322-4-jsnow@redhat.com>
In-Reply-To: <20220122000931.536322-1-jsnow@redhat.com>
References: <20220122000931.536322-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
---
 python/qemu/aqmp/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index 880d5b6fa7..173556404d 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -6,7 +6,7 @@
 QEMU Guest Agent, and the QEMU Storage Daemon.
 
 `QMPClient` provides the main functionality of this package. All errors
-raised by this library dervive from `AQMPError`, see `aqmp.error` for
+raised by this library derive from `AQMPError`, see `aqmp.error` for
 additional detail. See `aqmp.events` for an in-depth tutorial on
 managing QMP events.
 """
-- 
2.31.1


