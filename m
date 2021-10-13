Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7802E42CD54
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 00:08:03 +0200 (CEST)
Received: from localhost ([::1]:54810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mamPq-0003jm-B7
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 18:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mamGD-0006Br-0n
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:58:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mamGA-0003qS-FM
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634162280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bCV2NWLWjTj4/oY1rx6+76Vvo3Z8mLGw0Qt3fdF9yLQ=;
 b=bE8j8nr4cqBY0LxdD5AB6OlMXjCC8BFME+dGgupswCZDn20ko49oDzs3yQH8lJFH5psiq2
 G0txfhKfWxyUoa/UxjJhdym6YzGdjklZ7eAWl3mUMDKDCOifdZpP5LSuuulfKfJFlj52os
 FoAsxgGQ3tjH9loisZk4yMVFNMqv95c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-I90znWh7O5-xk53u0l6riQ-1; Wed, 13 Oct 2021 17:57:57 -0400
X-MC-Unique: I90znWh7O5-xk53u0l6riQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85F37802575;
 Wed, 13 Oct 2021 21:57:56 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 865671002D6A;
 Wed, 13 Oct 2021 21:57:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/8] python/aqmp: Remove scary message
Date: Wed, 13 Oct 2021 17:57:43 -0400
Message-Id: <20211013215748.2154908-4-jsnow@redhat.com>
In-Reply-To: <20211013215748.2154908-1-jsnow@redhat.com>
References: <20211013215748.2154908-1-jsnow@redhat.com>
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
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The scary message interferes with the iotests output. Coincidentally, if
iotests works by removing this, then it's good evidence that we don't
really need to scare people away from using it.

Signed-off-by: John Snow <jsnow@redhat.com>
Acked-by: Hanna Reitz <hreitz@redhat.com>
---
 python/qemu/aqmp/__init__.py | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index d1b0e4dc3d3..880d5b6fa7f 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -22,7 +22,6 @@
 # the COPYING file in the top-level directory.
 
 import logging
-import warnings
 
 from .error import AQMPError
 from .events import EventListener
@@ -31,17 +30,6 @@
 from .qmp_client import ExecInterruptedError, ExecuteError, QMPClient
 
 
-_WMSG = """
-
-The Asynchronous QMP library is currently in development and its API
-should be considered highly fluid and subject to change. It should
-not be used by any other scripts checked into the QEMU tree.
-
-Proceed with caution!
-"""
-
-warnings.warn(_WMSG, FutureWarning)
-
 # Suppress logging unless an application engages it.
 logging.getLogger('qemu.aqmp').addHandler(logging.NullHandler())
 
-- 
2.31.1


